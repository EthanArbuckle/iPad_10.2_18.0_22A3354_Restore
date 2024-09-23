@implementation RemoteEngagementViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100019210, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10000F0EC;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000A3F0();
  sub_100006874((uint64_t)v6, v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1000191E8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10000F0E0;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000A8C0();
  sub_100006874((uint64_t)v6, v7);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v8;

  if (a3)
  {
    v5 = sub_100009218(0, &qword_10001E8C8, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_10000E4A0();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_10000AC58(v7);

  swift_bridgeObjectRelease(v7);
}

- (void)loadView
{
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v2;

  v2 = self;
  sub_10000AFC4();

}

- (void)viewDidLoad
{
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v2;

  v2 = self;
  sub_10000B07C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v4;

  v4 = self;
  sub_10000B30C(a3, (SEL *)&selRef_viewWillAppear_, (uint64_t (*)(uint64_t, uint64_t))&ViewControllerPresenter.viewWillAppear());

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v4;

  v4 = self;
  sub_10000B16C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v4;

  v4 = self;
  sub_10000B1F8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v4;

  v4 = self;
  sub_10000B30C(a3, (SEL *)&selRef_viewDidDisappear_, (uint64_t (*)(uint64_t, uint64_t))&ViewControllerPresenter.viewDidDisappear());

}

- (void)didReceiveMemoryWarning
{
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v2;

  v2 = self;
  sub_10000B3E4();

}

- (void)dealloc
{
  _TtC24AMSEngagementViewService30RemoteEngagementViewController *v2;

  v2 = self;
  sub_10000C2E0();
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter]);
}

- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC24AMSEngagementViewService30RemoteEngagementViewController *)sub_10000DE94(v5, v7, a4);
}

- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithCoder:(id)a3
{
  return (_TtC24AMSEngagementViewService30RemoteEngagementViewController *)sub_10000DFCC(a3);
}

@end
