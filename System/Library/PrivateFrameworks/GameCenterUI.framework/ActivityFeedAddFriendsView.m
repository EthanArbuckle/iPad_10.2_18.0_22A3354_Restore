@implementation ActivityFeedAddFriendsView

- (_TtC12GameCenterUI26ActivityFeedAddFriendsView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26ActivityFeedAddFriendsView *)sub_1AB698D0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI26ActivityFeedAddFriendsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB698E90();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI26ActivityFeedAddFriendsView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1AB698F68();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI26ActivityFeedAddFriendsView *v2;

  v2 = self;
  sub_1AB699094();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26ActivityFeedAddFriendsView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26ActivityFeedAddFriendsView_emptyStateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26ActivityFeedAddFriendsView_friendSuggestionView));
}

@end
