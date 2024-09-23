@implementation FlowTabBarController

- (_TtC20ProductPageExtension20FlowTabBarController)init
{
  return -[FlowTabBarController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (_TtC20ProductPageExtension20FlowTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC20ProductPageExtension20FlowTabBarController *)sub_10013E30C(v5, v7, a4);
}

- (_TtC20ProductPageExtension20FlowTabBarController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC20ProductPageExtension20FlowTabBarController *result;

  v4 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension20FlowTabBarController_flowController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension20FlowTabBarController_actionRunner) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension20FlowTabBarController_objectGraph) = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtension20FlowTabBarController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/FlowTabBarController.swift", 47, 2, 304, 0);
  __break(1u);
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension20FlowTabBarController *v2;
  id v3;
  void *v4;
  id v5;
  id v7;
  objc_super v8;

  v2 = self;
  v3 = -[FlowTabBarController selectedViewController](v2, "selectedViewController");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "supportedInterfaceOrientations");

    return (unint64_t)v5;
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = (Class)type metadata accessor for FlowTabBarController();
    v7 = -[FlowTabBarController supportedInterfaceOrientations](&v8, "supportedInterfaceOrientations");

    return (unint64_t)v7;
  }
}

- (NSArray)keyCommands
{
  _TtC20ProductPageExtension20FlowTabBarController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10013E9A0();

  if (v3)
  {
    sub_100018B6C(0, (unint64_t *)&qword_100808190, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)handleTabSwitchKeyCommandWithCommand:(id)a3
{
  id v4;
  _TtC20ProductPageExtension20FlowTabBarController *v5;

  v4 = a3;
  v5 = self;
  sub_10013EB24(v4);

}

- (void)handleSearchKeyCommandWithCommand:(id)a3
{
  id v4;
  _TtC20ProductPageExtension20FlowTabBarController *v5;

  v4 = a3;
  v5 = self;
  sub_10013F630();

}

- (_TtC20ProductPageExtension20FlowTabBarController)initWithTabs:(id)a3
{
  _TtC20ProductPageExtension20FlowTabBarController *result;

  result = (_TtC20ProductPageExtension20FlowTabBarController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.FlowTabBarController", 41, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension20FlowTabBarController_flowController, (uint64_t *)&unk_100809510);
  swift_release();
  swift_release();
}

@end
