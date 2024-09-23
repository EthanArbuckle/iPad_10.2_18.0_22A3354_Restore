@implementation AchievementDetailViewController

- (_TtC12GameCenterUI31AchievementDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB79B664();
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  _TtC12GameCenterUI31AchievementDetailViewController *v4;
  id v5;

  v4 = self;
  v5 = sub_1AB79B720(a3);

  return v5;
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI31AchievementDetailViewController *v2;

  v2 = self;
  sub_1AB79B790();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI31AchievementDetailViewController *v4;

  v4 = self;
  sub_1AB79BE10(a3, (SEL *)&selRef_viewDidAppear_, (uint64_t (*)(id))sub_1AB79CD5C);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI31AchievementDetailViewController *v4;

  v4 = self;
  sub_1AB79BD7C(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC12GameCenterUI31AchievementDetailViewController *v4;

  v4 = self;
  sub_1AB79BE10(a3, (SEL *)&selRef_viewIsAppearing_, (uint64_t (*)(id))sub_1AB79BEB0);

}

- (void)updateThePreferredSheetDetents
{
  _TtC12GameCenterUI31AchievementDetailViewController *v2;

  v2 = self;
  sub_1AB79BEB0((uint64_t)v2);

}

- (void)shareButtonPressed
{
  _TtC12GameCenterUI31AchievementDetailViewController *v2;

  v2 = self;
  sub_1AB79C244();

}

- (void)didTapDone
{
  _TtC12GameCenterUI31AchievementDetailViewController *v2;

  v2 = self;
  sub_1AB79C4D4();

}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return sub_1AB79CF20();
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4;
  _TtC12GameCenterUI31AchievementDetailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB79CF58(v4);

}

- (void)showAppStoreProductPage:(id)a3
{
  id v4;
  _TtC12GameCenterUI31AchievementDetailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AB79D21C();

}

- (_TtC12GameCenterUI31AchievementDetailViewController)init
{
  sub_1AB79DB0C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31AchievementDetailViewController_selectedAchievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31AchievementDetailViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31AchievementDetailViewController_achievement));
}

@end
