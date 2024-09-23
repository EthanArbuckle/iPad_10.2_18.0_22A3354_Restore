@implementation WelcomeArtworkView

- (_TtC12GameCenterUI18WelcomeArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI18WelcomeArtworkView *)sub_1AB5D9964(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI18WelcomeArtworkView *v2;

  v2 = self;
  sub_1AB5DA73C();

}

- (_TtC12GameCenterUI18WelcomeArtworkView)initWithCoder:(id)a3
{
  sub_1AB5DA930((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_achievementsImageView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_dogImageView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_leaderboardsImageView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_manImageView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_robotImageView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_womanImageView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18WelcomeArtworkView_logoImageView));
}

@end
