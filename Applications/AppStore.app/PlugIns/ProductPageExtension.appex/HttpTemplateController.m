@implementation HttpTemplateController

- (void)dealloc
{
  void *v3;
  _TtC20ProductPageExtension22HttpTemplateController *v4;
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
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension22HttpTemplateController_actionSender, &qword_100808F20);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension22HttpTemplateController_textFields));

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC20ProductPageExtension22HttpTemplateController *v12;
  char v13;

  length = a4.length;
  location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  v12 = self;
  sub_100573AAC(v11, location, length);
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
  _TtC20ProductPageExtension22HttpTemplateController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC20ProductPageExtension22HttpTemplateController_hasRequiredParameters) == 1)
  {
    v9 = self;
    sub_1005737EC();

  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC20ProductPageExtension22HttpTemplateController)init
{
  _TtC20ProductPageExtension22HttpTemplateController *result;

  result = (_TtC20ProductPageExtension22HttpTemplateController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.HttpTemplateController", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
