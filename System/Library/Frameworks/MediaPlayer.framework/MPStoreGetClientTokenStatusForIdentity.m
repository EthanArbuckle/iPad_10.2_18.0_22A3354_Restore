@implementation MPStoreGetClientTokenStatusForIdentity

void __MPStoreGetClientTokenStatusForIdentity_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "MPStoreGetClientToken failed to get identity properties for token request. err=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v5, "DSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DDBF70], "sharedProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(unsigned __int8 *)(a1 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __MPStoreGetClientTokenStatusForIdentity_block_invoke_5;
      v13[3] = &unk_1E3161F98;
      v14 = *(id *)(a1 + 32);
      objc_msgSend(v11, "getTokenStatusForDSIDs:forcingRefresh:completion:", v10, v12, v13);

      goto LABEL_7;
    }
    v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "MPStoreGetClientToken not fetching auth token because there's no active account", buf, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_7:

}

void __MPStoreGetClientTokenStatusForIdentity_block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(v7, "tokenResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeToLiveMillis");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MPStoreClientTokenDidChangeNotification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemotePostDelayedNotification();

  }
}

@end
