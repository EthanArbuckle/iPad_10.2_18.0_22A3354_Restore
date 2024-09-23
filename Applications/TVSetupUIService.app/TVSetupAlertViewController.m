@implementation TVSetupAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  id v8;
  _TtC16TVSetupUIService26TVSetupAlertViewController *v9;

  v6 = (uint64_t (*)(_QWORD))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100018958, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (uint64_t (*)(_QWORD))sub_10000CE30;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100009254(a3, v6, v7);
  sub_10000CDFC((uint64_t)v6, v7);

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TVSetupAlertViewController(0);
  v4 = v7.receiver;
  -[TVSetupAlertViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = (void *)sub_1000090E4();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0, v7.receiver, v7.super_class);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16TVSetupUIService26TVSetupAlertViewController *v4;

  v4 = self;
  sub_100009B8C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16TVSetupUIService26TVSetupAlertViewController *v4;

  v4 = self;
  sub_100009F18(a3);

}

- (_TtC16TVSetupUIService26TVSetupAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16TVSetupUIService26TVSetupAlertViewController *)sub_10000BB0C(v5, v7, a4);
}

- (_TtC16TVSetupUIService26TVSetupAlertViewController)initWithCoder:(id)a3
{
  return (_TtC16TVSetupUIService26TVSetupAlertViewController *)sub_10000BCE8(a3);
}

- (void).cxx_destruct
{

  sub_10000CEB4((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier], (uint64_t *)&unk_10001E440);
  swift_bridgeObjectRelease(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo]);

}

- (void)proxCardFlowDidDismiss
{
  _TtC16TVSetupUIService26TVSetupAlertViewController *v2;

  v2 = self;
  sub_10000C714((uint64_t)&unk_1000188B8, (uint64_t)sub_10000C5AC, (uint64_t)&unk_1000188D0);

}

@end
