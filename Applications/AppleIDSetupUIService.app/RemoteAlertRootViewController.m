@implementation RemoteAlertRootViewController

- (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC21AppleIDSetupUIService29RemoteAlertRootViewController *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_scene, 0);
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010000C1C0, "AppleIDSetupUIService/RemoteAlertRootViewController.swift", 57, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC21AppleIDSetupUIService29RemoteAlertRootViewController *v2;

  v2 = self;
  sub_1000061A4();

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  -[RemoteAlertRootViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _TtC21AppleIDSetupUIService29RemoteAlertRootViewController *v11;
  objc_super v12;
  _QWORD aBlock[5];
  _QWORD *v14;

  v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100010810, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100006A08;
  }
  else
  {
    v7 = 0;
  }
  v8 = (_QWORD *)swift_allocObject(&unk_1000107C0, 40, 7);
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  aBlock[4] = sub_1000069B0;
  v14 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000060E8;
  aBlock[3] = &unk_1000107D8;
  v9 = _Block_copy(aBlock);
  v10 = v14;
  v11 = self;
  sub_1000069D4((uint64_t)v6, v7);
  swift_release(v10);
  v12.receiver = v11;
  v12.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  -[RemoteAlertRootViewController dismissViewControllerAnimated:completion:](&v12, "dismissViewControllerAnimated:completion:", v4, v9);
  _Block_release(v9);
  sub_100005F24((uint64_t)v6, v7);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC21AppleIDSetupUIService29RemoteAlertRootViewController *result;

  v4 = a4;
  result = (_TtC21AppleIDSetupUIService29RemoteAlertRootViewController *)_swift_stdlib_reportUnimplementedInitializer("AppleIDSetupUIService.RemoteAlertRootViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_scene);
  sub_100005F24(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler), *(_QWORD *)&self->scene[OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler]);
}

- (void)proxCardFlowDidDismiss
{
  -[RemoteAlertRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

@end
