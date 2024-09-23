@implementation MRMediaRemoteSetPlaybackQueue

void __MRMediaRemoteSetPlaybackQueue_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerClientForPlayerPath:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setInvalidatationTimestamp:");
  objc_msgSend(*(id *)(a1 + 32), "contentItemWithOffset:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentItemWithOffset:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "playerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLocal");

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    objc_msgSend(v3, "playerPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MRAddPlayerPathToUserInfo(v9, v10);

    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
      v14 = 0;
    else
      v14 = objc_msgSend(v12, "isEqual:", v13) ^ 1;
    objc_msgSend(v11, "numberWithInt:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("_MRPlayerPlaybackQueueNowPlayingItemDidChangeUserInfoKey"));

    _MRLogForCategory(1uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __MRMediaRemoteSetPlaybackQueue_block_invoke_cold_2(v3, v16);

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "notificationClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MRCreateDecodedUserInfo(v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dispatchNotification:userInfo:object:", CFSTR("kMRPlayerPlaybackQueueChangedNotification"), v19, 0);

  }
  _MRLogForCategory(1uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "playerPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MRContentItemCopyMinimalReadableDescription(v6);
    v23 = MRContentItemCopyMinimalReadableDescription(v4);
    v36 = 138543874;
    v37 = v21;
    v38 = 2112;
    v39 = v22;
    v40 = 2112;
    v41 = v23;
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "PlaybackQueueInvalidation: NowPlayingItem for %{public}@ changed from\n %@\n -> \n%@", (uint8_t *)&v36, 0x20u);

  }
  if (v4
    && MRContentItemIdentifierIsEqual(v4, v6)
    && (MRContentItemEqualToItem(v4, (const char *)v6) & 1) == 0)
  {
    _MRLogForCategory(1uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __MRMediaRemoteSetPlaybackQueue_block_invoke_cold_1(v24);

    objc_msgSend(v3, "playerPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemotePlaybackQueueDataSourceContentItemChangedForPlayer((uint64_t)v4, v25);

  }
  objc_msgSend(v3, "subscriptionController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "invalidate");

  v27 = objc_msgSend(*(id *)(a1 + 32), "range");
  +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:](MRPlaybackQueueRequest, "defaultPlaybackQueueRequestWithRange:", v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "subscribeToPlaybackQueue:forRequest:", *(_QWORD *)(a1 + 32), v29);

  objc_msgSend(v3, "homeUserIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    objc_msgSend(v3, "homeUserIdentifiers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setHomeUserIdentifiers:", v33);

  }
  objc_msgSend(v3, "setPlaybackQueue:", *(_QWORD *)(a1 + 32));
  v34 = (void *)MRGetSharedService();
  objc_msgSend(v3, "playerPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteServiceSetNowPlayingPlaybackQueue(v34, v35, *(void **)(a1 + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));

}

void __MRMediaRemoteSetPlaybackQueue_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "PlaybackQueueInvalidation: Client API misuse: InvalidatingPlaybackQueue instead of ContentItemChange. Sending additional contentItemChange", v1, 2u);
}

void __MRMediaRemoteSetPlaybackQueue_block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = CFSTR("kMRPlayerPlaybackQueueChangedNotification");
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_193827000, a2, OS_LOG_TYPE_DEBUG, "Sending short-circuited notification %@ for %@", (uint8_t *)&v4, 0x16u);

}

@end
