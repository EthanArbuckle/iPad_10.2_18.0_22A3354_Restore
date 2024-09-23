@implementation ASActivitySharingClient

- (void)isCloudKitAccountActiveWithCompletion:(id)a3
{
  -[_ASActivitySharingClient isCloudKitAccountActiveWithCompletion:](self->_activitySharingClient, "isCloudKitAccountActiveWithCompletion:", a3);
}

- (void)activateWithCompletionHandler:(id)a3
{
  -[_ASActivitySharingClient activateWithCompletionHandler:](self->_activitySharingClient, "activateWithCompletionHandler:", a3);
}

- (ASActivitySharingClient)init
{
  ASActivitySharingClient *v2;
  _ASActivitySharingClient *v3;
  _ASActivitySharingClient *activitySharingClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASActivitySharingClient;
  v2 = -[ASActivitySharingClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_ASActivitySharingClient);
    activitySharingClient = v2->_activitySharingClient;
    v2->_activitySharingClient = v3;

  }
  return v2;
}

- (_ASActivitySharingClient)activitySharingClient
{
  return self->_activitySharingClient;
}

- (void)appBadgeCountWithCompletion:(id)a3
{
  id v4;
  _ASActivitySharingClient *activitySharingClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  activitySharingClient = self->_activitySharingClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__ASActivitySharingClient_appBadgeCountWithCompletion___block_invoke;
  v7[3] = &unk_250744310;
  v8 = v4;
  v6 = v4;
  -[_ASActivitySharingClient appBadgeCountWithCompletion:](activitySharingClient, "appBadgeCountWithCompletion:", v7);

}

uint64_t __55__ASActivitySharingClient_appBadgeCountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidateWithCompletionHandler:(id)a3
{
  -[_ASActivitySharingClient invalidateWithCompletionHandler:](self->_activitySharingClient, "invalidateWithCompletionHandler:", a3);
}

- (void)sendFriendInviteToDestination:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 completion:(id)a6
{
  -[_ASActivitySharingClient sendFriendInviteToDestination:callerID:serviceIdentifier:completion:](self->_activitySharingClient, "sendFriendInviteToDestination:callerID:serviceIdentifier:completion:", a3, a4, a5, a6);
}

- (void)acceptFriendInviteFromFriendUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient acceptFriendInviteFromFriendUUID:completion:](self->_activitySharingClient, "acceptFriendInviteFromFriendUUID:completion:", a3, a4);
}

- (void)withdrawFriendInviteToFriendUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient withdrawFriendInviteToFriendUUID:completion:](self->_activitySharingClient, "withdrawFriendInviteToFriendUUID:completion:", a3, a4);
}

- (void)ignoreFriendInviteFromFriendUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient ignoreFriendInviteFromFriendUUID:completion:](self->_activitySharingClient, "ignoreFriendInviteFromFriendUUID:completion:", a3, a4);
}

- (void)setMuteEnabled:(BOOL)a3 friendUUID:(id)a4 completion:(id)a5
{
  -[_ASActivitySharingClient setMuteEnabled:friendUUID:completion:](self->_activitySharingClient, "setMuteEnabled:friendUUID:completion:", a3, a4, a5);
}

- (void)setActivityDataVisible:(BOOL)a3 friendUUID:(id)a4 completion:(id)a5
{
  -[_ASActivitySharingClient setActivityDataVisible:friendUUID:completion:](self->_activitySharingClient, "setActivityDataVisible:friendUUID:completion:", a3, a4, a5);
}

- (void)sendCompetitionInviteToFriendUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient sendCompetitionInviteToFriendUUID:completion:](self->_activitySharingClient, "sendCompetitionInviteToFriendUUID:completion:", a3, a4);
}

- (void)acceptCompetitionInviteFromFriendUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient acceptCompetitionInviteFromFriendUUID:completion:](self->_activitySharingClient, "acceptCompetitionInviteFromFriendUUID:completion:", a3, a4);
}

- (void)ignoreCompetitionInviteFromFriendUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient ignoreCompetitionInviteFromFriendUUID:completion:](self->_activitySharingClient, "ignoreCompetitionInviteFromFriendUUID:completion:", a3, a4);
}

- (void)completeCompetitionWithFriendUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient completeCompetitionWithFriendUUID:completion:](self->_activitySharingClient, "completeCompetitionWithFriendUUID:completion:", a3, a4);
}

- (void)pushActivityDataWithCompletion:(id)a3
{
  -[_ASActivitySharingClient pushActivityDataWithCompletion:](self->_activitySharingClient, "pushActivityDataWithCompletion:", a3);
}

- (void)immediateFetchActivityDataWithCompletion:(id)a3
{
  -[_ASActivitySharingClient immediateFetchActivityDataWithCompletion:](self->_activitySharingClient, "immediateFetchActivityDataWithCompletion:", a3);
}

- (void)fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:(unint64_t)a3 completion:(id)a4
{
  -[_ASActivitySharingClient fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:completion:](self->_activitySharingClient, "fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:completion:", a3, a4);
}

- (void)expireChangeTokenWithCompletion:(id)a3
{
  -[_ASActivitySharingClient expireChangeTokenWithCompletion:](self->_activitySharingClient, "expireChangeTokenWithCompletion:", a3);
}

- (void)areMultipleDevicesSharingDataForSnapshotIndex:(id)a3 completion:(id)a4
{
  _ASActivitySharingClient *activitySharingClient;
  id v6;

  activitySharingClient = self->_activitySharingClient;
  v6 = a4;
  -[_ASActivitySharingClient areMultipleDevicesSharingDataForSnapshotIndex:completion:](activitySharingClient, "areMultipleDevicesSharingDataForSnapshotIndex:completion:", (int)objc_msgSend(a3, "intValue"), v6);

}

- (void)allFriendsWithCompletion:(id)a3
{
  -[_ASActivitySharingClient allFriendsWithCompletion:](self->_activitySharingClient, "allFriendsWithCompletion:", a3);
}

- (void)friendWithRemoteRelationshipUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient friendWithRemoteRelationshipUUID:completion:](self->_activitySharingClient, "friendWithRemoteRelationshipUUID:completion:", a3, a4);
}

- (void)removeFriendWithUUID:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient removeFriendWithUUID:completion:](self->_activitySharingClient, "removeFriendWithUUID:completion:", a3, a4);
}

- (void)removeAllFriendsWithCompletion:(id)a3
{
  -[_ASActivitySharingClient removeAllFriendsWithCompletion:](self->_activitySharingClient, "removeAllFriendsWithCompletion:", a3);
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
  -[_ASActivitySharingClient handleNotificationResponse:completion:](self->_activitySharingClient, "handleNotificationResponse:completion:", a3, a4);
}

- (void)pushFakeActivityDataWithCompletion:(id)a3
{
  -[_ASActivitySharingClient pushFakeActivityDataWithCompletion:](self->_activitySharingClient, "pushFakeActivityDataWithCompletion:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySharingClient, 0);
}

@end
