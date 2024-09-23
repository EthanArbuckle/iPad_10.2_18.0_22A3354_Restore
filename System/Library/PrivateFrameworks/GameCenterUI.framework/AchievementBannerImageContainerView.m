@implementation AchievementBannerImageContainerView

- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithAchievementImage:(id)a3
{
  return (_TtC12GameCenterUI35AchievementBannerImageContainerView *)AchievementBannerImageContainerView.init(achievementImage:)(a3);
}

- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5E72F4();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI35AchievementBannerImageContainerView *v2;

  v2 = self;
  sub_1AB5E73CC();

}

- (_TtC12GameCenterUI35AchievementBannerImageContainerView)initWithFrame:(CGRect)a3
{
  AchievementBannerImageContainerView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35AchievementBannerImageContainerView_achievementImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35AchievementBannerImageContainerView_gameCenterImageView));
}

@end
