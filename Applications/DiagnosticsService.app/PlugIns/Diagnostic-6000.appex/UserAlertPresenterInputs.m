@implementation UserAlertPresenterInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  uint64_t v4;
  UserAlertPresenterInputs *v5;
  char v6;
  uint64_t v7;

  if (a3)
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v4 = 0;
  v5 = self;
  v6 = sub_100001914(v4);

  swift_bridgeObjectRelease(v4, v7);
  return v6 & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return 1;
}

- (UserAlertPresenterInputs)init
{
  return (UserAlertPresenterInputs *)sub_100001C40();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*(_QWORD *)&self->headerTextKey[OBJC_IVAR___UserAlertPresenterInputs_headerTextKey], a2);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headerTextKey[OBJC_IVAR___UserAlertPresenterInputs_messageTextKey], v3);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headerTextKey[OBJC_IVAR___UserAlertPresenterInputs_buttonsTextKey], v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headerTextKey[OBJC_IVAR___UserAlertPresenterInputs_headerText], v5);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headerTextKey[OBJC_IVAR___UserAlertPresenterInputs_messageText], v6);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___UserAlertPresenterInputs_buttonStrings), v7);
}

@end
