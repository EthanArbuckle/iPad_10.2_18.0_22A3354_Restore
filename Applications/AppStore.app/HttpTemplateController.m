@implementation HttpTemplateController

- (void)dealloc
{
  void *v3;
  _TtC8AppStore22HttpTemplateController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HttpTemplateController();
  -[HttpTemplateController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore22HttpTemplateController_actionSender, (uint64_t *)&unk_10082B490);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8AppStore22HttpTemplateController_textFields));

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8AppStore22HttpTemplateController *v12;
  char v13;

  length = a4.length;
  location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  v12 = self;
  sub_10062BA68(v11, location, length);
  LOBYTE(length) = v13;

  swift_bridgeObjectRelease(v10);
  return length & 1;
}

- (void)textFieldDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8AppStore22HttpTemplateController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8AppStore22HttpTemplateController_hasRequiredParameters) == 1)
  {
    v9 = self;
    sub_10062B7A8();

  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC8AppStore22HttpTemplateController)init
{
  _TtC8AppStore22HttpTemplateController *result;

  result = (_TtC8AppStore22HttpTemplateController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.HttpTemplateController", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
