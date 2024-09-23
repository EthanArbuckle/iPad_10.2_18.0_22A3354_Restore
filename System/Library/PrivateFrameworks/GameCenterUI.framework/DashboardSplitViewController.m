@implementation DashboardSplitViewController

- (_TtC12GameCenterUI28DashboardSplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB588030();
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI28DashboardSplitViewController *v2;

  v2 = self;
  DashboardSplitViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI28DashboardSplitViewController *v4;

  v4 = self;
  DashboardSplitViewController.viewWillAppear(_:)(a3);

}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  _TtC12GameCenterUI28DashboardSplitViewController *v7;

  v6 = a3;
  v7 = self;
  DashboardSplitViewController.splitViewController(_:willChangeTo:)(&v7->super.super, (UISplitViewControllerDisplayMode)a4);

}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  UISplitViewController *v6;
  _TtC12GameCenterUI28DashboardSplitViewController *v7;
  UISplitViewControllerColumn v8;

  v6 = (UISplitViewController *)a3;
  v7 = self;
  v8 = DashboardSplitViewController.splitViewController(_:topColumnForCollapsingToProposedTopColumn:)(v6, (UISplitViewControllerColumn)a4);

  return v8;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  UISplitViewController *v6;
  _TtC12GameCenterUI28DashboardSplitViewController *v7;
  UISplitViewControllerDisplayMode v8;

  v6 = (UISplitViewController *)a3;
  v7 = self;
  v8 = DashboardSplitViewController.splitViewController(_:displayModeForExpandingToProposedDisplayMode:)(v6, (UISplitViewControllerDisplayMode)a4);

  return v8;
}

- (_TtC12GameCenterUI28DashboardSplitViewController)init
{
  sub_1AB589634();
}

- (void).cxx_destruct
{
  sub_1AB588344(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI28DashboardSplitViewController____lazy_storage___dismissHandler));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI28DashboardSplitViewController_request);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI28DashboardSplitViewController____lazy_storage___sidebarViewController);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI28DashboardSplitViewController____lazy_storage___primaryNavigationController);
  swift_bridgeObjectRelease();
}

@end
