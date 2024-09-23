@implementation AuthenticationWithOnboardingViewController

- (CGSize)preferredContentSize
{
  _TtC12GameCenterUI42AuthenticationWithOnboardingViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1AB4D680C();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  _TtC12GameCenterUI42AuthenticationWithOnboardingViewController *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1AB4D68FC(width, height);

}

- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4D69C0();
}

- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  sub_1AB4D760C();
}

- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithRootViewController:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4D7640();
}

- (_TtC12GameCenterUI42AuthenticationWithOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  sub_1AB4D7678();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)onboardingFlowFinishedWithAction:(unint64_t)a3
{
  _TtC12GameCenterUI42AuthenticationWithOnboardingViewController *v4;

  v4 = self;
  sub_1AB4D7720(a3);

}

@end
