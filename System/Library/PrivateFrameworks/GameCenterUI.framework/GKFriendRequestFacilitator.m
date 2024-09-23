@implementation GKFriendRequestFacilitator

+ (void)makeViewControllerForInviteWithRecipients:(id)a3 chatGUID:(id)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__GKFriendRequestFacilitator_makeViewControllerForInviteWithRecipients_chatGUID_resultHandler___block_invoke;
  v9[3] = &unk_1E59C4F88;
  v10 = v7;
  v8 = v7;
  +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerForRemoteInviteWithRecipients:chatGUID:resultHandler:", a3, a4, v9);

}

void __95__GKFriendRequestFacilitator_makeViewControllerForInviteWithRecipients_chatGUID_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  id v7;
  id v8;

  if (a2)
    v4 = a2;
  else
    v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5, v4);

}

@end
