@implementation GameCenterObjcHelper

+ (void)fetchRecommendedFriendsWithCompletionHandler:(id)a3
{
  sub_1AB78C998((int)a1, (int)a2, a3, (uint64_t)&unk_1E59E8A10, (uint64_t)sub_1AB78EFA0, (void (*)(uint64_t, uint64_t))static GameCenterObjcHelper.fetchRecommendedFriends(completionHandler:));
}

+ (void)fetchSuggestedFriendsWithCompletionHandler:(id)a3
{
  sub_1AB78C998((int)a1, (int)a2, a3, (uint64_t)&unk_1E59E89E8, (uint64_t)sub_1AB78EF98, (void (*)(uint64_t, uint64_t))static GameCenterObjcHelper.fetchSuggestedFriends(completionHandler:));
}

+ (void)sendFriendInvitationViaPushWithContactID:(id)a3 contactAssociationID:(id)a4 completionHandler:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = _Block_copy(a5);
  v6 = sub_1AB7DAF90();
  v8 = v7;
  v9 = sub_1AB7DAF90();
  v11 = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v5;
  static GameCenterObjcHelper.sendFriendInvitationViaPush(contactID:contactAssociationID:completionHandler:)(v6, v8, v9, v11, (uint64_t)sub_1AB78EF90, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC12GameCenterUI20GameCenterObjcHelper)init
{
  return (_TtC12GameCenterUI20GameCenterObjcHelper *)GameCenterObjcHelper.init()();
}

@end
