@implementation GameCenterFriendPlayerView

- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithHandle:(id)a3 player:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AB7DAF90();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC12GameCenterUI26GameCenterFriendPlayerView *)GameCenterFriendPlayerView.init(handle:player:)(v5, v7, a4);
}

- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithRelationshipResult:(id)a3
{
  _TtC12GameCenterUI26GameCenterFriendPlayerView *result;

  GameCenterFriendPlayerView.init(relationshipResult:)(a3);
  return result;
}

- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithCoder:(id)a3
{
  sub_1AB674F24();
}

- (_TtC12GameCenterUI26GameCenterFriendPlayerView)initWithFrame:(CGRect)a3
{
  GameCenterFriendPlayerView.init(frame:)();
}

@end
