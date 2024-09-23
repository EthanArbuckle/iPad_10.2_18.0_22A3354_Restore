@implementation ErrorViewController

- (_TtC24AMSEngagementViewService19ErrorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100005EC8();
}

- (UINavigationItem)navigationItem
{
  _TtC24AMSEngagementViewService19ErrorViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100005FA8((uint64_t)v2);

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  _TtC24AMSEngagementViewService19ErrorViewController *v2;

  v2 = self;
  sub_100006030();

}

- (void)viewDidLoad
{
  _TtC24AMSEngagementViewService19ErrorViewController *v2;

  v2 = self;
  sub_1000060E8();

}

- (void)viewWillLayoutSubviews
{
  _TtC24AMSEngagementViewService19ErrorViewController *v2;

  v2 = self;
  sub_10000614C();

}

- (_TtC24AMSEngagementViewService19ErrorViewController)init
{
  sub_100006688();
}

- (_TtC24AMSEngagementViewService19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1000066C0();
}

- (void).cxx_destruct
{
  swift_errorRelease(*(_QWORD *)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_error]);
  sub_100006874(*(_QWORD *)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction], *(_QWORD *)&self->error[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction]);

}

@end
