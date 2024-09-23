@implementation ViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC11EyeReliefUI14ViewController *v3;

  v3 = self;
  sub_10000643C();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC11EyeReliefUI14ViewController *v3;

  v3 = self;
  sub_10000677C();

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ViewController();
  -[ViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(id);
  uint64_t v7;
  id v8;
  _TtC11EyeReliefUI14ViewController *v9;

  v6 = (void (*)(id))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100018CD0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(id))sub_100006AE8;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000049A4(a3, v6);
  sub_10000661C((uint64_t)v6, v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC11EyeReliefUI14ViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100018CA8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_100006650;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100004EE8(a3, v6);
  sub_10000661C((uint64_t)v6, v7);

}

- (BOOL)prefersStatusBarHidden
{
  _TtC11EyeReliefUI14ViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_10000516C();

  return v3 & 1;
}

- (int64_t)preferredStatusBarStyle
{
  _TtC11EyeReliefUI14ViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[ViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
    return 1;
  else
    return 3;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (_TtC11EyeReliefUI14ViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC11EyeReliefUI14ViewController *)sub_1000052D4(v5, v7, a4);
}

- (_TtC11EyeReliefUI14ViewController)initWithCoder:(id)a3
{
  return (_TtC11EyeReliefUI14ViewController *)sub_100005418(a3);
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming]);
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel]);

}

@end
