@implementation ActivityFeedLeaderboardAvatarsSubview

- (_TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview *)sub_1AB62F078(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB62F430();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1AB62F604();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview *v2;

  v2 = self;
  sub_1AB62F73C();

}

- (void)didTap
{
  _TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview *v2;

  v2 = self;
  sub_1AB630600();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_avatarBackgroundImage));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_messageLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_scoreLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_emojiLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_tapGestureRecognizer);
  OUTLINED_FUNCTION_0_62(*(uint64_t *)((char *)&self->super.super.super.isa
                                    + OBJC_IVAR____TtC12GameCenterUI37ActivityFeedLeaderboardAvatarsSubview_tapHandler));
}

@end
