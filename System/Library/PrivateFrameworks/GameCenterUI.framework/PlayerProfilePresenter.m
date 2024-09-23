@implementation PlayerProfilePresenter

+ (BOOL)isSettings
{
  return sub_1AB6E0FE4() & 1;
}

+ (int64_t)friendRequestsItemTag
{
  return 8004;
}

- (BOOL)wantsHiddenNavigationBar
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;
  char v3;

  v2 = self;
  v3 = sub_1AB6E1508();

  return v3 & 1;
}

- (BOOL)showRemoveFriendOption
{
  return sub_1AB6E159C();
}

- (BOOL)wantsHiddenTitle
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;
  char v3;

  v2 = self;
  v3 = sub_1AB6E1604();

  return v3 & 1;
}

- (NSString)title
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1AB6E166C();
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

- (BOOL)isSignedIn
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;
  char v3;

  v2 = self;
  v3 = sub_1AB6E186C();

  return v3 & 1;
}

- (BOOL)isDeeplinked
{
  return sub_1AB6E1F2C() & 1;
}

- (void)setIsDeeplinked:(BOOL)a3
{
  sub_1AB6E1F60(a3);
}

- (_TtC12GameCenterUI17NicknamePresenter)nicknamePresenter
{
  id v2;

  sub_1AB6E2544();
  return (_TtC12GameCenterUI17NicknamePresenter *)v2;
}

- (void)setNicknamePresenter:(id)a3
{
  id v5;
  _TtC12GameCenterUI22PlayerProfilePresenter *v6;

  v5 = a3;
  v6 = self;
  sub_1AB6E25B4(a3);

}

- (BOOL)displayInSplitView
{
  return sub_1AB6E2DA0() & 1;
}

- (void)setDisplayInSplitView:(BOOL)a3
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v4;

  v4 = self;
  sub_1AB6E2DF4(a3);

}

- (id)contextMenuAction
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;
  void *v3;

  v2 = self;
  sub_1AB6E2EF4();

  sub_1AB476E40(0, &qword_1EEC11A10);
  v3 = (void *)sub_1AB7DB0E0();
  swift_bridgeObjectRelease();
  return v3;
}

- (NSArray)additionalRightBarButtonItems
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_1AB6E3748();

  if (v3)
  {
    sub_1AB476E40(0, (unint64_t *)&unk_1EEC01AB0);
    v4 = (void *)sub_1AB7DB0E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)viewFriendRequests
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E3F64();

}

- (void)addFriends
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E48D0();

}

- (void)reportPlayer
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E4CCC();

}

- (void)removeFriend
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E50F8();

}

- (void)showRecentlyPlayedWithFriends
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E5494();

}

- (void)profileSettings
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E5744();

}

- (void)updateSnapshot
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E7E14();

}

- (void)setAllowsNearByMultiplayerInvites:(BOOL)a3
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v4;

  v4 = self;
  sub_1AB6E806C(a3);

}

- (void)signIntoGameCenter
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E8304();

}

- (void)showAvatarEditor
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E86B4();

}

- (void)didSignOut
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v2;

  v2 = self;
  sub_1AB6E87B0();

}

- (void)loadMoreActivityFeedWithContinuationToken:(id)a3
{
  _TtC12GameCenterUI22PlayerProfilePresenter *v4;

  sub_1AB7DAF90();
  v4 = self;
  sub_1AB6E898C();

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI22PlayerProfilePresenter)initWithPlayerId:(id)a3
{
  if (a3)
    sub_1AB7DAF90();
  sub_1AB6E8A2C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22PlayerProfilePresenter_nicknamePresenter));
  sub_1AB48E78C((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI22PlayerProfilePresenter_nicknameUpdatedSubscription, &qword_1EEC0F8D8);
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_47_17((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI22PlayerProfilePresenter_requiredData);
  swift_release();
  swift_release();
}

@end
