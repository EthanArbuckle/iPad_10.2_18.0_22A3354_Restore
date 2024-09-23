@implementation IdentityRemoteAlertViewController

- (BOOL)prefersStatusBarHidden
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC19ContactlessReaderUI33IdentityRemoteAlertViewController_hideStatusBar);
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  return 4;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dealloc
{
  _TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *v2;

  v2 = self;
  sub_22F955780();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI33IdentityRemoteAlertViewController_identityViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI33IdentityRemoteAlertViewController_hideMenuIndicatorTimer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI33IdentityRemoteAlertViewController_interruptionMonitor));
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[IdentityRemoteAlertViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_22F9559B0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[IdentityRemoteAlertViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  if (qword_255E1DB78 != -1)
    swift_once();
  BrightnessManager.increaseBrightnessIfNeeded()();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *v4;

  v3 = a3;
  v4 = self;
  sub_22F955E4C(v3);

}

- (void)handleHomeButtonPressed
{
  _TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *v2;

  v2 = self;
  sub_22F956290();

}

- (void)handlePanWithSender:(id)a3
{
  id v4;
  _TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22F956488(v4);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_22F958E74;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_22F956A18(a3, v6, v7);
  sub_22F87A9B8((uint64_t)v6);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  uint64_t (*v6)();
  _TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *v7;

  v5 = _Block_copy(a4);
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v6 = sub_22F958D60;
  }
  else
  {
    v6 = 0;
  }
  v7 = self;
  sub_22F958A98();
  sub_22F87A9B8((uint64_t)v6);

}

- (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22F98EDB8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *)sub_22F958398(v5, v7, a4);
}

- (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController)initWithCoder:(id)a3
{
  return (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *)sub_22F9586E0(a3);
}

@end
