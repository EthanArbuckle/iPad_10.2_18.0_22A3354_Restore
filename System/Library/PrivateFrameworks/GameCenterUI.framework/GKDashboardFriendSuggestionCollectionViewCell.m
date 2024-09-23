@implementation GKDashboardFriendSuggestionCollectionViewCell

+ (double)horizontalPadding
{
  return 12.0;
}

- (BOOL)displayBackground
{
  char v2;

  sub_1AB4C3D24();
  return v2 & 1;
}

- (void)setDisplayBackground:(BOOL)a3
{
  sub_1AB4C3D78(a3);
}

- (BOOL)wantsAdditionalHorizontalPadding
{
  char v2;

  sub_1AB4C3E04();
  return v2 & 1;
}

- (void)setWantsAdditionalHorizontalPadding:(BOOL)a3
{
  sub_1AB4C3E58(a3);
}

- (_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell *)GKDashboardFriendSuggestionCollectionViewCell.init(frame:)();
}

- (_TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4C40CC();
}

+ (CGSize)sizeWithFitting:(CGSize)a3 in:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  swift_unknownObjectRetain();
  v5 = static GKDashboardFriendSuggestionCollectionViewCell.size(fitting:in:)(a4);
  v7 = v6;
  swift_unknownObjectRelease();
  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB4C4248();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)tapHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = sub_1AB4C4354();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB704AB4;
  v6[3] = &block_descriptor_9;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setTapHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB46D734;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1AB4C4428((uint64_t)v4, v5);

}

- (void)applyWithSuggestedFriend:(id)a3 previouslyInvited:(BOOL)a4
{
  id v7;
  _TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell *v8;

  v7 = a3;
  v8 = self;
  sub_1AB4C4590(a3, a4);

}

- (void)setInviteButtonTitleColor:(id)a3
{
  id v4;
  _TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB4C4B78(v4);

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell *v2;

  v2 = self;
  sub_1AB4C4C00();

}

- (void)prepareForReuse
{
  _TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell *v2;

  v2 = self;
  sub_1AB4C4DB0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell_friendSuggestionLockupView));
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI45GKDashboardFriendSuggestionCollectionViewCell_tapHandler));
}

@end
