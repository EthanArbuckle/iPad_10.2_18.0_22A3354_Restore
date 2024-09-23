@implementation ICSScreenSharingBroadcasterRootViewController

- (ICSScreenSharingBroadcasterRootViewController)init
{
  return (ICSScreenSharingBroadcasterRootViewController *)sub_100150C50();
}

- (ICSScreenSharingBroadcasterRootViewController)initWithCoder:(id)a3
{
  sub_100150CE8();
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  ICSScreenSharingBroadcasterRootViewController *v2;

  v2 = self;
  sub_100150D5C();

}

- (void)viewDidAppear:(BOOL)a3
{
  ICSScreenSharingBroadcasterRootViewController *v4;

  v4 = self;
  sub_100151158(a3);

}

- (ICSScreenSharingBroadcasterRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1001511D8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSScreenSharingBroadcasterRootViewController_containerViewController));
}

@end
