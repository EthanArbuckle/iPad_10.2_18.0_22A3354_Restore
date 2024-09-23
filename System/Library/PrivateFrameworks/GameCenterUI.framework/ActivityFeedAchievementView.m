@implementation ActivityFeedAchievementView

- (_TtC12GameCenterUI27ActivityFeedAchievementView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27ActivityFeedAchievementView *)sub_1AB77EE88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI27ActivityFeedAchievementView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB77F43C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI27ActivityFeedAchievementView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1AB77F84C();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI27ActivityFeedAchievementView *v2;

  v2 = self;
  sub_1AB77F96C();

}

- (NSString)accessibilityLabel
{
  _TtC12GameCenterUI27ActivityFeedAchievementView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1AB780FC8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AB7DAF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12GameCenterUI27ActivityFeedAchievementView *v7;

  if (a3)
  {
    v4 = sub_1AB7DAF90();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1AB78105C(v4, v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementView_contentBackgroundView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementView_sharedView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementView_achievementCardContainer);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementView_achievementConfettiView);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
