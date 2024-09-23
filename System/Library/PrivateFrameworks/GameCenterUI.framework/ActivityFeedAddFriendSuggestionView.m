@implementation ActivityFeedAddFriendSuggestionView

- (_TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView)initWithFrame:(CGRect)a3
{
  _TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView *result;

  sub_1AB74DC18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB74DEDC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB74DFB0();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView *v2;

  v2 = self;
  sub_1AB74E1B8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35ActivityFeedAddFriendSuggestionView_stackView));
  swift_bridgeObjectRelease();
}

@end
