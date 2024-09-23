@implementation GKGameCenterFriendPlayerView

+ (id)newWithHandle:(id)a3 player:(id)a4
{
  id v5;
  id v6;
  _TtC12GameCenterUI26GameCenterFriendPlayerView *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GameCenterFriendPlayerView initWithHandle:player:]([_TtC12GameCenterUI26GameCenterFriendPlayerView alloc], "initWithHandle:player:", v6, v5);

  return v7;
}

+ (id)newWithRelationshipResult:(id)a3
{
  id v3;
  _TtC12GameCenterUI26GameCenterFriendPlayerView *v4;

  v3 = a3;
  v4 = -[GameCenterFriendPlayerView initWithRelationshipResult:]([_TtC12GameCenterUI26GameCenterFriendPlayerView alloc], "initWithRelationshipResult:", v3);

  return v4;
}

@end
