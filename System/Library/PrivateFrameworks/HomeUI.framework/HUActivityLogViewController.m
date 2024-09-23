@implementation HUActivityLogViewController

- (HUActivityLogViewController)initWithHome:(id)a3 activityLogCoordinator:(id)a4
{
  id v5;

  v5 = a3;
  swift_retain();
  return (HUActivityLogViewController *)ActivityLogViewController.init(home:activityLogCoordinator:)(v5, (uint64_t)a4);
}

- (HUActivityLogViewController)initWithCoder:(id)a3
{
  id v3;
  HUActivityLogViewController *result;

  v3 = a3;
  sub_1B93EE828();
  swift_bridgeObjectRelease();
  result = (HUActivityLogViewController *)sub_1B93EE9CC();
  __break(1u);
  return result;
}

- (HUActivityLogViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  HUActivityLogViewController *result;

  v4 = a4;
  sub_1B93EE828();
  swift_bridgeObjectRelease();
  result = (HUActivityLogViewController *)sub_1B93EE9CC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  HUActivityLogViewController *v2;

  v2 = self;
  sub_1B8EA3750();

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

}

@end
