@implementation FlowTabBarController

- (_TtC22SubscribePageExtension20FlowTabBarController)init
{
  return -[FlowTabBarController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (_TtC22SubscribePageExtension20FlowTabBarController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC22SubscribePageExtension20FlowTabBarController *)sub_1005D6330(v5, v7, a4);
}

- (_TtC22SubscribePageExtension20FlowTabBarController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC22SubscribePageExtension20FlowTabBarController *result;

  v4 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension20FlowTabBarController_flowController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension20FlowTabBarController_actionRunner) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension20FlowTabBarController_objectGraph) = 0;
  v5 = a3;

  result = (_TtC22SubscribePageExtension20FlowTabBarController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/FlowTabBarController.swift", 49, 2, 304, 0);
  __break(1u);
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtension20FlowTabBarController *v2;
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
  _TtC22SubscribePageExtension20FlowTabBarController *v2;
  double *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1005D69C4();

  if (v3)
  {
    sub_100019574(0, (unint64_t *)&qword_1007F8E40, UIKeyCommand_ptr);
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
  _TtC22SubscribePageExtension20FlowTabBarController *v5;

  v4 = a3;
  v5 = self;
  sub_1005D6B48(v4);

}

- (void)handleSearchKeyCommandWithCommand:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension20FlowTabBarController *v5;

  v4 = a3;
  v5 = self;
  sub_1005D7B28();

}

- (_TtC22SubscribePageExtension20FlowTabBarController)initWithTabs:(id)a3
{
  _TtC22SubscribePageExtension20FlowTabBarController *result;

  result = (_TtC22SubscribePageExtension20FlowTabBarController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.FlowTabBarController", 43, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension20FlowTabBarController_flowController, (uint64_t *)&unk_100808370);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension20FlowTabBarController_actionRunner));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension20FlowTabBarController_objectGraph));
}

@end
