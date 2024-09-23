@implementation ASUIRootViewController

- (_TtC16AccessorySetupUI22ASUIRootViewController)init
{
  return (_TtC16AccessorySetupUI22ASUIRootViewController *)sub_100002C50();
}

- (_TtC16AccessorySetupUI22ASUIRootViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC16AccessorySetupUI22ASUIRootViewController *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_remoteAlertScene, 0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_pickingSession) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_router);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = 0;
  v6 = a3;

  result = (_TtC16AccessorySetupUI22ASUIRootViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100041F30, "AccessorySetupUI/ASUIRootViewController.swift", 45, 2, 35, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ASUIRootViewController();
  -[ASUIRootViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _TtC16AccessorySetupUI22ASUIRootViewController *v11;
  objc_super v12;
  _QWORD aBlock[5];
  _QWORD *v14;

  v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100050DD0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100003804;
  }
  else
  {
    v7 = 0;
  }
  v8 = (_QWORD *)swift_allocObject(&unk_100050D80, 40, 7);
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  aBlock[4] = sub_10000379C;
  v14 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000122C8;
  aBlock[3] = &unk_100050D98;
  v9 = _Block_copy(aBlock);
  v10 = v14;
  v11 = self;
  sub_1000037C0((uint64_t)v6, v7);
  swift_release(v10);
  v12.receiver = v11;
  v12.super_class = (Class)type metadata accessor for ASUIRootViewController();
  -[ASUIRootViewController dismissViewControllerAnimated:completion:](&v12, "dismissViewControllerAnimated:completion:", v4, v9);
  _Block_release(v9);
  sub_1000037D0((uint64_t)v6, v7);

}

- (_TtC16AccessorySetupUI22ASUIRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16AccessorySetupUI22ASUIRootViewController *result;

  v4 = a4;
  result = (_TtC16AccessorySetupUI22ASUIRootViewController *)_swift_stdlib_reportUnimplementedInitializer("AccessorySetupUI.ASUIRootViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_remoteAlertScene, a2);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_pickingSession));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_router));
}

@end
