@implementation AppleAccountSignInSheet.Coordinator

- (_TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator)init
{
  _TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator *result;

  result = (_TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("SettingsApp.Coordinator", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator_dismissAction;
  v4 = type metadata accessor for DismissAction(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(_QWORD *)&self->onSuccess[OBJC_IVAR____TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator_onSuccess]);
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  id v9;
  _TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator *v10;

  v7 = sub_100016710();
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v7, &protocol witness table for String);
  v9 = a3;
  v10 = self;
  sub_10001674C(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4;
  _TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator *v5;

  v4 = a3;
  v5 = self;
  DismissAction.callAsFunction()();

}

@end
