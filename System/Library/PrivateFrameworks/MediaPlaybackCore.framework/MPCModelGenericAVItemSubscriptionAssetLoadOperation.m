@implementation MPCModelGenericAVItemSubscriptionAssetLoadOperation

- (MPCModelGenericAVItemSubscriptionAssetLoadOperation)init
{
  MPCModelGenericAVItemSubscriptionAssetLoadOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCModelGenericAVItemSubscriptionAssetLoadOperation;
  v2 = -[MPAsyncOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItemSubscriptionAssetLoadOperation.accessQueue", MEMORY[0x24BDAC9C0]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)description
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFollowUp");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p followUp>"), objc_opt_class(), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MPCModelGenericAVItemSubscriptionAssetLoadOperation;
    -[MPCModelGenericAVItemSubscriptionAssetLoadOperation description](&v7, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)cancel
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPCModelGenericAVItemSubscriptionAssetLoadOperation;
  -[MPAsyncOperation cancel](&v5, sel_cancel);
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation cancellationHandler](self, "cancellationHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t))(v3 + 16))(v3);

}

- (void)execute
{
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  NSObject *v23;
  int v24;
  const __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  _BOOL4 v35;
  int v36;
  uint64_t v37;
  const __CFString *v38;
  NSObject *v39;
  void *v40;
  id v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[5];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD aBlock[5];
  uint8_t buf[4];
  MPCModelGenericAVItemSubscriptionAssetLoadOperation *v84;
  __int16 v85;
  _BYTE v86[18];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke;
  aBlock[3] = &unk_24CAB7BE0;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation requestContext](self, "requestContext");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPCModelGenericAVItemSubscriptionAssetLoadOperation operationType](self, "operationType");
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v84 = self;
    v85 = 2048;
    *(_QWORD *)v86 = v6;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using subscription playback endpoint with operation type: %li", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRemoteServerLikelyReachable");

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v5, "itemIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "universalStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "subscriptionAdamID");

    if (!v12)
    {
      objc_msgSend(v10, "universalStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "adamID");

    }
    v14 = objc_alloc_init(MEMORY[0x24BDDCC18]);
    objc_msgSend(v14, "setAccountID:", objc_msgSend(v5, "accountID"));
    objc_msgSend(v14, "setDelegatedAccountID:", objc_msgSend(v5, "delegatedAccountID"));
    if (v6 == 2)
    {
      v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v84 = self;
        _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Performing subscription accountless playback request...", buf, 0xCu);
      }

      objc_msgSend(v14, "setRequestType:", 2);
      objc_msgSend(v14, "setStoreSubscriptionAdamID:", v12);
      -[MPCModelGenericAVItemSubscriptionAssetLoadOperation subscriptionLeaseSession](self, "subscriptionLeaseSession");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leaseStatus");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "hasOnlinePlaybackKeys");

      if (v30)
      {
        objc_msgSend(MEMORY[0x24BDDCC10], "sharedCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cachedResponseForRequest:", v14);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v31, v5, 3, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = 0;
        }
        if (objc_msgSend(v32, "hasValidAsset"))
        {
          v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v84 = self;
            v85 = 2114;
            *(_QWORD *)v86 = v31;
            _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using existing cached playback response: %{public}@", buf, 0x16u);
          }

          (*((void (**)(void *, void *, _QWORD, _QWORD))v4 + 2))(v4, v32, 0, 0);
          goto LABEL_70;
        }

      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8880]), "initWithRequestContext:storeSubscriptionAdamID:", v66, v12);
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_28;
      v70[3] = &unk_24CAB4C90;
      v70[4] = self;
      v71 = v14;
      v72 = v4;
      objc_msgSend(v16, "performWithResponseHandler:", v70);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      v67[0] = MEMORY[0x24BDAC760];
      v67[1] = 3221225472;
      v67[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_2_31;
      v67[3] = &unk_24CAB59B8;
      objc_copyWeak(&v69, (id *)buf);
      v41 = v40;
      v68 = v41;
      -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setCancellationHandler:](self, "setCancellationHandler:", v67);

      objc_destroyWeak(&v69);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      if (v6 == 1)
      {
        v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v84 = self;
          _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Loading subscription lease session...", buf, 0xCu);
        }

        -[MPCModelGenericAVItemSubscriptionAssetLoadOperation subscriptionLeaseSession](self, "subscriptionLeaseSession");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v18 = v17;
        if (!v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v84 = self;
            _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Failed loading subscription asset due to missing lease session.", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 19, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v22);
          goto LABEL_69;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "leaseStatus");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v84 = self;
          v85 = 2114;
          *(_QWORD *)v86 = v19;
          _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[AL][Lease] - %{public}@: Has subscription lease session, using it. Lease status: %{public}@", buf, 0x16u);

        }
        v81 = 0;
        v20 = -[MPCModelGenericAVItemSubscriptionAssetLoadOperation _canRetrieveLoadResultsFromMiniSinfWithAssets:](self, "_canRetrieveLoadResultsFromMiniSinfWithAssets:", &v81);
        v21 = v81;
        v22 = v21;
        if (v20)
        {
          v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend(v5, "prefersVideoContent");
            v25 = CFSTR("audio");
            if (v24)
              v25 = CFSTR("video");
            *(_DWORD *)buf = 138543618;
            v84 = self;
            v85 = 2114;
            *(_QWORD *)v86 = v25;
            _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Loading %{public}@ asset from Mini Sinf...", buf, 0x16u);
          }

          -[MPCModelGenericAVItemSubscriptionAssetLoadOperation _loadResultsFromServerObjectDatabaseAssetsWithMiniSinf:](self, "_loadResultsFromServerObjectDatabaseAssetsWithMiniSinf:", v22);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, void *, _QWORD, _QWORD))v4 + 2))(v4, v64, 0, 0);

          goto LABEL_69;
        }
        v79 = 0;
        v80 = v21;
        v33 = -[MPCModelGenericAVItemSubscriptionAssetLoadOperation _canRetrieveLoadResultsFromServerObjectDatabaseWithAssets:hlsAsset:](self, "_canRetrieveLoadResultsFromServerObjectDatabaseWithAssets:hlsAsset:", &v80, &v79);
        v62 = v80;

        v65 = v79;
        v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v33)
        {
          if (v35)
          {
            v36 = objc_msgSend(v5, "prefersVideoContent");
            v37 = objc_msgSend(v5, "preferredAudioAssetType");
            if ((unint64_t)(v37 - 1) > 4)
              v38 = CFSTR("Unspecified");
            else
              v38 = off_24CAB4CB0[v37 - 1];
            *(_DWORD *)buf = 138543875;
            v84 = self;
            v85 = 1024;
            *(_DWORD *)v86 = v36;
            *(_WORD *)&v86[4] = 2113;
            *(_QWORD *)&v86[6] = v38;
            _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "[AL] %{public}@: MPCModelGenericAVItemSubscriptionAssetLoadOperation execute [loading asset from cache] prefersVideoContent=%{BOOL}u preferredAudio=%{private}@", buf, 0x1Cu);
          }

          -[MPCModelGenericAVItemSubscriptionAssetLoadOperation _loadResultsFromServerObjectDatabaseAssets:hlsAsset:](self, "_loadResultsFromServerObjectDatabaseAssets:hlsAsset:", v62, v65);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, void *, _QWORD, _QWORD))v4 + 2))(v4, v63, 0, 0);
LABEL_68:

          v22 = v62;
LABEL_69:

          goto LABEL_70;
        }
        if (v35)
        {
          if (objc_msgSend(v5, "prefersVideoContent"))
            v42 = CFSTR("video");
          else
            v42 = CFSTR("audio");
          v43 = objc_msgSend(v5, "preferredAudioAssetType");
          if ((unint64_t)(v43 - 1) > 4)
            v44 = CFSTR("Unspecified");
          else
            v44 = off_24CAB4CB0[v43 - 1];
          *(_DWORD *)buf = 138543875;
          v84 = self;
          v85 = 2114;
          *(_QWORD *)v86 = v42;
          *(_WORD *)&v86[8] = 2113;
          *(_QWORD *)&v86[10] = v44;
          _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Loading %{public}@ asset - Preferred audio: %{private}@", buf, 0x20u);
        }

        v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8898]), "initWithRequestContext:", v66);
        objc_msgSend(v63, "setFollowUp:", objc_msgSend(v5, "isFollowUp"));
        objc_msgSend(v63, "setStoreSubscriptionAdamID:", v12);
        objc_msgSend(v14, "setStoreSubscriptionAdamID:", v12);
        if (objc_msgSend(v16, "isDelegatedLeaseSession"))
        {
          objc_msgSend(v10, "personalizedStore");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "cloudID");

          objc_msgSend(v63, "setStoreCloudID:", v46);
          objc_msgSend(v14, "setStoreCloudID:", v46);
          objc_msgSend(v10, "universalStore");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "purchasedAdamID");

          objc_msgSend(v63, "setStorePurchasedAdamID:", v48);
          objc_msgSend(v14, "setStorePurchasedAdamID:", v48);
          objc_msgSend(v10, "universalStore");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "universalCloudLibraryID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "setCloudUniversalLibraryID:", v50);
          objc_msgSend(v14, "setCloudUniversalLibraryID:", v50);
          objc_msgSend(v14, "setRequestType:", 4);

        }
        else
        {
          objc_msgSend(v14, "setRequestType:", 2);
        }
        -[MPCModelGenericAVItemSubscriptionAssetLoadOperation subscriptionLeaseSession](self, "subscriptionLeaseSession");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "leaseStatus");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "hasOnlinePlaybackKeys");

        if (v53)
        {
          objc_msgSend(MEMORY[0x24BDDCC10], "sharedCache");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "cachedResponseForRequest:", v14);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = (void *)v54;
          if (v54)
          {
            +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v54, v5, 3, 0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v56 = 0;
          }
          if (objc_msgSend(v56, "hasValidAsset"))
          {
            _MPCLogCategoryPlayback();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v84 = self;
              v85 = 2114;
              *(_QWORD *)v86 = v55;
              _os_log_impl(&dword_210BD8000, v57, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using existing cached playback response: %{public}@", buf, 0x16u);
            }

            (*((void (**)(void *, void *, _QWORD, _QWORD))v4 + 2))(v4, v56, 0, 0);
            goto LABEL_68;
          }

        }
        _MPCLogCategoryPlayback();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v84 = self;
          _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Performing subscription playback request...", buf, 0xCu);
        }

        v76[0] = MEMORY[0x24BDAC760];
        v76[1] = 3221225472;
        v76[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_17;
        v76[3] = &unk_24CAB4C90;
        v76[4] = self;
        v77 = v14;
        v78 = v4;
        objc_msgSend(v16, "performPlaybackRequest:completionHandler:", v63, v76);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, self);
        v73[0] = MEMORY[0x24BDAC760];
        v73[1] = 3221225472;
        v73[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_2;
        v73[3] = &unk_24CAB59B8;
        objc_copyWeak(&v75, (id *)buf);
        v60 = v59;
        v74 = v60;
        -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setCancellationHandler:](self, "setCancellationHandler:", v73);

        objc_destroyWeak(&v75);
        objc_destroyWeak((id *)buf);

        goto LABEL_68;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelGenericAVItemSubscriptionAssetLoadOperation.m"), 250, CFSTR("Invalid operation type: %li"), -[MPCModelGenericAVItemSubscriptionAssetLoadOperation operationType](self, "operationType"));
    }
LABEL_70:

    goto LABEL_71;
  }
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v84 = self;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Short-circuiting Item Subscription Asset Loading [offline] - SOD/Cached Response/Server requests are unusable", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 56, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v10);
LABEL_71:

}

- (BOOL)_canRetrieveLoadResultsFromMiniSinfWithAssets:(id *)a3
{
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  MPCModelGenericAVItemSubscriptionAssetLoadOperation *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "preferredAudioAssetType") >= 2)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543362;
      v23 = self;
      v7 = "[AL] - %{public}@: Skipping miniSINF in the server object database [HLS playback]";
LABEL_8:
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v22, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isFollowUp") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "disableMiniSINF"),
        v8,
        v9))
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543362;
      v23 = self;
      v7 = "[AL] - %{public}@: Skipping miniSINF in the server object database [skipped due to asset load policy]";
      goto LABEL_8;
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation subscriptionLeaseSession](self, "subscriptionLeaseSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDelegatedLeaseSession");

  if (v13)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v22 = 138543362;
    v23 = self;
    v7 = "[AL] - %{public}@: Skipping miniSINF in the server object database [delegated lease]";
    goto LABEL_8;
  }
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation subscriptionLeaseSession](self, "subscriptionLeaseSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leaseStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasOnlinePlaybackKeys");

  if ((v16 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v22 = 138543362;
    v23 = self;
    v7 = "[AL] - %{public}@: Skipping miniSINF in the server object database [no online lease]";
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
  v6 = objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject assetsWithMiniSINFsMatchingIdentifierSet:](v6, "assetsWithMiniSINFsMatchingIdentifierSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "count");
  v10 = v20 != 0;
  if (v20)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v19);
  }
  else
  {
    _MPCLogCategoryPlayback();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543362;
      v23 = self;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Skipping miniSINF in the server object database [no assets found]", (uint8_t *)&v22, 0xCu);
    }

  }
LABEL_10:

  return v10;
}

- (BOOL)_canRetrieveLoadResultsFromServerObjectDatabaseWithAssets:(id *)a3 hlsAsset:(id *)a4
{
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  MPCModelGenericAVItemSubscriptionAssetLoadOperation *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isFollowUp"))
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      v9 = "[AL] - %{public}@: Skipping assets in the server object database [skipped due to asset load policy]";
LABEL_15:
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
  else
  {
    -[MPCModelGenericAVItemSubscriptionAssetLoadOperation subscriptionLeaseSession](self, "subscriptionLeaseSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isDelegatedLeaseSession");

    if (v11)
    {
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v36 = self;
        v9 = "[AL] - %{public}@: Skipping assets in the server object database [delegated lease]";
        goto LABEL_15;
      }
    }
    else
    {
      -[MPCModelGenericAVItemSubscriptionAssetLoadOperation subscriptionLeaseSession](self, "subscriptionLeaseSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "leaseStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasOnlinePlaybackKeys");

      if ((v14 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
        v8 = objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "preferredAudioAssetType");
        objc_msgSend(v7, "itemIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 < 2)
        {
          -[NSObject assetsMatchingIdentifierSet:](v8, "assetsMatchingIdentifierSet:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v20, "count"))
          {
            v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v36 = self;
              _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Skipping assets in the server object database [no assets found]", buf, 0xCu);
            }
LABEL_39:

            goto LABEL_16;
          }
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v29 = v20;
          v21 = v20;
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v31;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v31 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "sinfs");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v26)
                {
                  v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v36 = self;
                    _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Found an asset with no sinf, skipping assets in server object database", buf, 0xCu);
                  }

                  v20 = v29;
                  goto LABEL_39;
                }
              }
              v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
              if (v23)
                continue;
              break;
            }
          }

          if (a3)
            *a3 = objc_retainAutorelease(v21);

        }
        else
        {
          -[NSObject hlsAssetMatchingIdentifierSet:](v8, "hlsAssetMatchingIdentifierSet:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v36 = self;
              _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Skipping assets in the server object database [no HLS assets found]", buf, 0xCu);
            }

            goto LABEL_16;
          }
          if (a4)
            *a4 = objc_retainAutorelease(v17);

        }
        v18 = 1;
        goto LABEL_17;
      }
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v36 = self;
        v9 = "[AL] - %{public}@: Skipping assets in the server object database [no online lease]";
        goto LABEL_15;
      }
    }
  }
LABEL_16:
  v18 = 0;
LABEL_17:

  return v18;
}

- (id)_loadResultsFromServerObjectDatabaseAssetsWithMiniSinf:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  MPCModelGenericAVItemSubscriptionAssetLoadOperation *v27;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  void *v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelGenericAVItemSubscriptionAssetLoadOperation.m"), 341, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets.count > 0"));

  }
  v27 = self;
  v6 = objc_alloc_init(MEMORY[0x24BDDCA90]);
  objc_msgSend(v6, "setSubscriptionRequired:", 1);
  v26 = v6;
  objc_msgSend(v6, "setOnlineSubscriptionKeysRequired:", 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        v37[0] = CFSTR("URL");
        objc_msgSend(v11, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v13;
        v37[1] = CFSTR("flavor");
        v14 = objc_msgSend(v11, "flavor");
        v15 = CFSTR("unknown");
        if ((unint64_t)(v14 - 1) <= 3)
          v15 = off_24CAB4CD8[v14 - 1];
        v38[1] = v15;
        v38[2] = &unk_24CB17280;
        v37[2] = CFSTR("metadata");
        v37[3] = CFSTR("sinfs");
        v34[0] = CFSTR("id");
        v34[1] = CFSTR("sinf2");
        v35[0] = &unk_24CB16BF0;
        objc_msgSend(v11, "miniSINF");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v38[3] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89E0]), "initWithFileAssetResponseDictionary:", v19);
        objc_msgSend(v20, "setExpectedProtectionType:", 3);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC30]), "initWithiTunesCloudStoreFileAssetInfo:", v20);
        objc_msgSend(v29, "addObject:", v21);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v8);
  }

  objc_msgSend(v26, "setFileAssetInfoList:", v29);
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](v27, "assetLoadProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v26, v22, 5, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_loadResultsFromServerObjectDatabaseAssets:(id)a3 hlsAsset:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  v38 = v8;
  if (!v8 && !v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelGenericAVItemSubscriptionAssetLoadOperation.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets.count > 0 || hlsAsset != nil"));

  }
  v10 = objc_alloc_init(MEMORY[0x24BDDCA90]);
  objc_msgSend(v10, "setSubscriptionRequired:", 1);
  v37 = v10;
  objc_msgSend(v10, "setOnlineSubscriptionKeysRequired:", 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v16, "sinfs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v44[0] = CFSTR("URL");
          objc_msgSend(v16, "url");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "absoluteString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v19;
          v44[1] = CFSTR("flavor");
          v20 = objc_msgSend(v16, "flavor");
          v21 = CFSTR("unknown");
          if ((unint64_t)(v20 - 1) <= 3)
            v21 = off_24CAB4CD8[v20 - 1];
          v45[1] = v21;
          v45[2] = &unk_24CB172A8;
          v44[2] = CFSTR("metadata");
          v44[3] = CFSTR("sinfs");
          objc_msgSend(v16, "sinfs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v45[3] = v22;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89E0]), "initWithFileAssetResponseDictionary:", v23);
          objc_msgSend(v24, "setExpectedProtectionType:", 3);
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC30]), "initWithiTunesCloudStoreFileAssetInfo:", v24);
          objc_msgSend(v11, "addObject:", v25);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v13);
  }

  objc_msgSend(v37, "setFileAssetInfoList:", v11);
  if (v38)
  {
    v26 = objc_alloc_init(MEMORY[0x24BEC89E8]);
    objc_msgSend(v38, "playlistURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPlaylistURL:", v27);

    objc_msgSend(v38, "keyCertificateURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setKeyCertificateURL:", v28);

    objc_msgSend(v38, "keyServerURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setKeyServerURL:", v29);

    objc_msgSend(v38, "keyServerProtocolType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setKeyServerProtocolType:", v30);

    objc_msgSend(v26, "setITunesStoreStream:", objc_msgSend(v38, "isiTunesStoreStream"));
    objc_msgSend(v38, "keyServerAdamID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setKeyServerAdamID:", v31);

    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC38]), "initWithiTunesCloudStoreHLSAssetInfo:", v26);
    objc_msgSend(v37, "setHlsAssetInfo:", v32);

  }
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v37, v33, 4, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)_handlePlaybackResponse:(id)a3 withPlaybackCacheRequest:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  id *v38;
  id v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v24 = (void *)v10;
    v25 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1540], "errorForICError:response:", 0, v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItemSubscriptionAssetLoadOperation assetLoadProperties](self, "assetLoadProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "itemIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    v30 = v24;
    objc_msgSend(v29, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 54, v26, CFSTR("Response did not contain asset for item identifiers: %@"), v28);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    if (!a5)
      goto LABEL_24;
    goto LABEL_23;
  }
  v40 = (void *)v10;
  v38 = a5;
  v13 = objc_alloc_init(MEMORY[0x24BDDCA90]);
  objc_msgSend(v12, "assetExpirationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExpirationDate:", v14);

  v39 = v8;
  objc_msgSend(v8, "dialog");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "responseDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDialogDictionary:", v16);

  objc_msgSend(v12, "fileAssets");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v17);
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC30]), "initWithiTunesCloudStoreFileAssetInfo:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
        if (v23)
        {
          if (!v20)
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v17, "count"));
          objc_msgSend(v20, "addObject:", v23);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v13, "setFileAssetInfoList:", v20);
  objc_msgSend(v12, "hlsAsset");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC38]), "initWithiTunesCloudStoreHLSAssetInfo:", v33);
    objc_msgSend(v13, "setHlsAssetInfo:", v34);

  }
  v41 = 0;
  v30 = v40;
  +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v13, v40, 6, &v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v41;
  v35 = objc_msgSend(v32, "allowsAssetInfoCaching");
  v8 = v39;
  if (v9 && v35)
  {
    objc_msgSend(MEMORY[0x24BDDCC10], "sharedCache");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addCachedResponse:forRequest:", v13, v9);

    v30 = v40;
  }

  a5 = v38;
  if (v38)
LABEL_23:
    *a5 = objc_retainAutorelease(v31);
LABEL_24:

  return v32;
}

- (id)cancellationHandler
{
  NSObject *accessQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12364;
  v10 = __Block_byref_object_dispose__12365;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__MPCModelGenericAVItemSubscriptionAssetLoadOperation_cancellationHandler__block_invoke;
  v5[3] = &unk_24CABAB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setCancellationHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__MPCModelGenericAVItemSubscriptionAssetLoadOperation_setCancellationHandler___block_invoke;
  v7[3] = &unk_24CAB9830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties
{
  return self->_assetLoadProperties;
}

- (void)setAssetLoadProperties:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoadProperties, a3);
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int64_t)a3
{
  self->_operationType = a3;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (ICMusicSubscriptionLeaseSession)subscriptionLeaseSession
{
  return self->_subscriptionLeaseSession;
}

- (void)setSubscriptionLeaseSession:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionLeaseSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionLeaseSession, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_assetLoadProperties, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __78__MPCModelGenericAVItemSubscriptionAssetLoadOperation_setCancellationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 280);
  *(_QWORD *)(v3 + 280) = v2;

}

void __74__MPCModelGenericAVItemSubscriptionAssetLoadOperation_cancellationHandler__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 280));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 312);
  v11 = v7;
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, a2, a3);
    v8 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v8 + 312);
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(v8 + 312) = 0;

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v11);
}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setCancellationHandler:", 0);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1540], "errorForICError:response:", v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 15, v11, CFSTR("Failed to send subscription playback request (lease)"));
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = 0;
  }
  else
  {
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v20 = 0;
    objc_msgSend(v14, "_handlePlaybackResponse:withPlaybackCacheRequest:error:", v7, v15, &v20);
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = (uint64_t)v20;
  }
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v22 = v17;
    v23 = 2114;
    v24 = v7;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Finished subscription playback request with response: %{public}@, error: %{public}@", buf, 0x20u);
  }

  if (!(v13 | v12))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[MPCModelGenericAVItemSubscriptionAssetLoadOperation execute]_block_invoke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("MPCModelGenericAVItemSubscriptionAssetLoadOperation.m"), 186, CFSTR("An error is expected for the failure to create a loadResult"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = WeakRetained;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Canceling subscription playback request...", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }

}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setCancellationHandler:", 0);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1540], "errorForICError:response:", v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 15, v11, CFSTR("Failed to send subscription playback request (accountless stream)"));
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = 0;
  }
  else
  {
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v20 = 0;
    objc_msgSend(v14, "_handlePlaybackResponse:withPlaybackCacheRequest:error:", v7, v15, &v20);
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = (uint64_t)v20;
  }
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v22 = v17;
    v23 = 2114;
    v24 = v7;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Finished subscription accountless playback request with response: %{public}@, error: %{public}@", buf, 0x20u);
  }

  if (!(v13 | v12))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[MPCModelGenericAVItemSubscriptionAssetLoadOperation execute]_block_invoke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("MPCModelGenericAVItemSubscriptionAssetLoadOperation.m"), 235, CFSTR("An error is expected for the failure to create a loadResult"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_2_31(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = WeakRetained;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Canceling subscription accountless playback request...", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }

}

@end
