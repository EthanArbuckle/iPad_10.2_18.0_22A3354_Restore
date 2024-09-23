@implementation GKDashboardInviteFriendButtonCollectionViewCell

- (BOOL)displayBackground
{
  char v2;

  sub_1AB6B5BAC();
  return v2 & 1;
}

- (void)setDisplayBackground:(BOOL)a3
{
  sub_1AB6B5C00(a3);
}

- (BOOL)wantsAdditionalHorizontalPadding
{
  char v2;

  sub_1AB6B5C9C();
  return v2 & 1;
}

- (void)setWantsAdditionalHorizontalPadding:(BOOL)a3
{
  sub_1AB6B5CF0(a3);
}

- (_TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell *)GKDashboardInviteFriendButtonCollectionViewCell.init(frame:)();
}

- (_TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6B6068();
}

+ (CGSize)sizeWithFitting:(CGSize)a3 in:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  static GKDashboardInviteFriendButtonCollectionViewCell.size(fitting:in:)();
  v5 = 200.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB6B61A0();
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
  _TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell *v2;

  v2 = self;
  sub_1AB6B623C();

}

- (void)updateTextColorWith:(id)a3
{
  id v4;
  _TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB6B6434((uint64_t)v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI47GKDashboardInviteFriendButtonCollectionViewCell_separator));
}

@end
