@implementation FlowTabBarController

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore20FlowTabBarController *v2;
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

- (_TtC8AppStore20FlowTabBarController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8AppStore20FlowTabBarController *)sub_1000083FC(v5, v7, a4);
}

- (_TtC8AppStore20FlowTabBarController)init
{
  return -[FlowTabBarController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (_TtC8AppStore20FlowTabBarController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC8AppStore20FlowTabBarController *result;

  v4 = (char *)self + OBJC_IVAR____TtC8AppStore20FlowTabBarController_flowController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore20FlowTabBarController_actionRunner) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore20FlowTabBarController_objectGraph) = 0;
  v5 = a3;

  result = (_TtC8AppStore20FlowTabBarController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/FlowTabBarController.swift", 35, 2, 304, 0);
  __break(1u);
  return result;
}

- (NSArray)keyCommands
{
  _TtC8AppStore20FlowTabBarController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1001EF5FC();

  if (v3)
  {
    sub_100008FE4(0, (unint64_t *)&qword_10082C580, UIKeyCommand_ptr);
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
  _TtC8AppStore20FlowTabBarController *v5;

  v4 = a3;
  v5 = self;
  sub_1001EF780(v4);

}

- (void)handleSearchKeyCommandWithCommand:(id)a3
{
  id v4;
  _TtC8AppStore20FlowTabBarController *v5;

  v4 = a3;
  v5 = self;
  sub_1001F02B4();

}

- (_TtC8AppStore20FlowTabBarController)initWithTabs:(id)a3
{
  _TtC8AppStore20FlowTabBarController *result;

  result = (_TtC8AppStore20FlowTabBarController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.FlowTabBarController", 29, "init(tabs:)", 11, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore20FlowTabBarController_flowController, &qword_100833160);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20FlowTabBarController_actionRunner));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20FlowTabBarController_objectGraph));
}

@end
