module Main exposing (..)

import Html exposing (Html, programWithFlags, text)
import Json.Decode as Json exposing (Value, Decoder)


type alias Model =
    { name : String }


init : Value -> ( Model, Cmd msg )
init flags =
    case Json.decodeValue (Json.field "name" Json.string) flags of
        Ok name ->
            Model name ! []

        Err _ ->
            Model "no one" ! []


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    model ! []


view : Model -> Html msg
view { name } =
    text <| "Hello, " ++ name ++ "!"


main : Program Value Model msg
main =
    programWithFlags
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }
