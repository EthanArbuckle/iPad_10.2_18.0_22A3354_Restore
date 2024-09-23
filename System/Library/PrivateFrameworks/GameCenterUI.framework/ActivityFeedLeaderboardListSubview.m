@implementation ActivityFeedLeaderboardListSubview

- (_TtC12GameCenterUI34ActivityFeedLeaderboardListSubview)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI34ActivityFeedLeaderboardListSubview *)sub_1AB6B2818(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI34ActivityFeedLeaderboardListSubview)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6B2A44();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI34ActivityFeedLeaderboardListSubview *v3;

  v3 = self;
  sub_1AB6B2B50();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI34ActivityFeedLeaderboardListSubview *v2;

  v2 = self;
  sub_1AB6B2D1C();

}

- (void)didTap
{
  _TtC12GameCenterUI34ActivityFeedLeaderboardListSubview *v2;

  v2 = self;
  sub_1AB6B3DAC();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI34ActivityFeedLeaderboardListSubview_tapGestureRecognizer));
  OUTLINED_FUNCTION_0_62(*(uint64_t *)((char *)&self->super.super.super.isa
                                    + OBJC_IVAR____TtC12GameCenterUI34ActivityFeedLeaderboardListSubview_tapHandler));
}

@end
