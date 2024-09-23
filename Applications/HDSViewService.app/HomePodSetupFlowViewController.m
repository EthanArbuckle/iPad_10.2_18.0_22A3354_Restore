@implementation HomePodSetupFlowViewController

- (_TtC14HDSViewService30HomePodSetupFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  _TtC14HDSViewService26BaseProxFlowViewController *v10;
  id v11;
  _TtC14HDSViewService26BaseProxFlowViewController *v12;
  id v13;
  _TtC14HDSViewService30HomePodSetupFlowViewController *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = (_TtC14HDSViewService26BaseProxFlowViewController *)((char *)&self->super
                                                             + OBJC_IVAR____TtC14HDSViewService30HomePodSetupFlowViewController_presenter);
    *v10 = 0;
    v10[1] = 0;
    v11 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v12 = (_TtC14HDSViewService26BaseProxFlowViewController *)((char *)&self->super
                                                             + OBJC_IVAR____TtC14HDSViewService30HomePodSetupFlowViewController_presenter);
    *v12 = 0;
    v12[1] = 0;
    v13 = a4;
  }
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = -[BaseProxFlowViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", a3, a4);

  return v14;
}

- (_TtC14HDSViewService30HomePodSetupFlowViewController)initWithCoder:(id)a3
{
  _TtC14HDSViewService26BaseProxFlowViewController *v4;
  id v5;
  _TtC14HDSViewService30HomePodSetupFlowViewController *result;

  v4 = (_TtC14HDSViewService26BaseProxFlowViewController *)((char *)&self->super
                                                          + OBJC_IVAR____TtC14HDSViewService30HomePodSetupFlowViewController_presenter);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC14HDSViewService30HomePodSetupFlowViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010009D420, "HDSViewService/HomePodSetupFlowViewController.swift", 51, 2, 25, 0);
  __break(1u);
  return result;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC14HDSViewService30HomePodSetupFlowViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1000C4750, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10006946C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000687A0(v8, v6);
  sub_1000588E4((uint64_t)v6, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC14HDSViewService30HomePodSetupFlowViewController *v4;

  v4 = self;
  sub_100068D84(a3, (uint64_t)v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC14HDSViewService30HomePodSetupFlowViewController *v4;

  v4 = self;
  sub_100068FA4(a3, (uint64_t)v4);

}

- (void)_willAppearInRemoteViewController
{
  id v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v5.receiver;
  -[BaseProxFlowViewController _willAppearInRemoteViewController](&v5, "_willAppearInRemoteViewController");
  v3 = (void *)sub_10008417C();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAllowsAlertItems:", 1, v5.receiver, v5.super_class);

    swift_unknownObjectRelease(v4);
  }
  else
  {

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)handleButtonActions:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC14HDSViewService30HomePodSetupFlowViewController *v8;

  if (a3)
  {
    v5 = sub_1000693C4();
    v6 = sub_100069400();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1000691D8(v7);

  swift_bridgeObjectRelease(v7);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)((char *)&self->super
                                       + OBJC_IVAR____TtC14HDSViewService30HomePodSetupFlowViewController_presenter));
}

@end
