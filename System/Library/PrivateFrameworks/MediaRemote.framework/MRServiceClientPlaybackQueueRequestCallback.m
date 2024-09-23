@implementation MRServiceClientPlaybackQueueRequestCallback

void __MRServiceClientPlaybackQueueRequestCallback_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playbackQueueDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MRServiceClientPlaybackQueueRequestCallback_block_invoke_2;
  block[3] = &unk_1E30CFBD0;
  v12 = a1[4];
  v13 = v5;
  v14 = a1[5];
  v15 = v6;
  v16 = a1[6];
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __MRServiceClientPlaybackQueueRequestCallback_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerClientForPlayerPath:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "updatePlaybackQueueWithCachedUpdates:forPendingRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) || (v4 = *(void **)(a1 + 40)) == 0)
    v3 = 0;
  else
    v3 = MRPlaybackQueueCreateFromRequest(v4, *(void **)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

@end
