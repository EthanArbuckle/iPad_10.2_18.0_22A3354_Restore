@implementation FriendSuggestionInvitationStateManager.DataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  _TtCC12GameCenterUI38FriendSuggestionInvitationStateManagerP33_B74AEE38B88C48CD057FD9C123265F9518DataUpdateDelegate *v6;

  v4 = *(_QWORD *)&a3;
  sub_1AB7DAEB8();
  v6 = self;
  sub_1AB70B35C(v4);

  swift_bridgeObjectRelease();
}

- (void)refreshFromFriendRecommendationsNotification:(id)a3
{
  id v4;
  _TtCC12GameCenterUI38FriendSuggestionInvitationStateManagerP33_B74AEE38B88C48CD057FD9C123265F9518DataUpdateDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1AB70B45C(v4, 4);

}

- (void)refreshFromMessageBasedFriendRequestSentNotification:(id)a3
{
  id v4;
  _TtCC12GameCenterUI38FriendSuggestionInvitationStateManagerP33_B74AEE38B88C48CD057FD9C123265F9518DataUpdateDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1AB70B45C(v4, 21);

}

- (void)dealloc
{
  _TtCC12GameCenterUI38FriendSuggestionInvitationStateManagerP33_B74AEE38B88C48CD057FD9C123265F9518DataUpdateDelegate *v2;

  v2 = self;
  sub_1AB4A5D94();
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtCC12GameCenterUI38FriendSuggestionInvitationStateManagerP33_B74AEE38B88C48CD057FD9C123265F9518DataUpdateDelegate)init
{
  sub_1AB4F963C();
}

@end
