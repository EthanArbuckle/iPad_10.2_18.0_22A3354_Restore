@implementation MPCModelGenericAVItemMediaRedownloadOperation

- (MPCModelGenericAVItemMediaRedownloadOperation)init
{
  MPCModelGenericAVItemMediaRedownloadOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCModelGenericAVItemMediaRedownloadOperation;
  v2 = -[MPAsyncOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItemMediaRedownloadOperation.accessQueue", MEMORY[0x24BDAC9C0]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)cancel
{
  NSObject *accessQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPCModelGenericAVItemMediaRedownloadOperation;
  -[MPAsyncOperation cancel](&v11, sel_cancel);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__21874;
  v9 = __Block_byref_object_dispose__21875;
  v10 = 0;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__MPCModelGenericAVItemMediaRedownloadOperation_cancel__block_invoke;
  v4[3] = &unk_24CABAB68;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(accessQueue, v4);
  objc_msgSend((id)v6[5], "cancel");
  _Block_object_dispose(&v5, 8);

}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  Class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  NSObject *accessQueue;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  NSObject *log;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  _QWORD block[5];
  id v49;
  _QWORD aBlock[5];
  uint8_t buf[4];
  MPCModelGenericAVItemMediaRedownloadOperation *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke;
  aBlock[3] = &unk_24CAB7BE0;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[MPCModelGenericAVItemMediaRedownloadOperation assetLoadProperties](self, "assetLoadProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemMediaRedownloadOperation requestContext](self, "requestContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "storeAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "redownloadParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length"))
    {
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v52 = self;
        _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Missing redownload parameters.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 25, CFSTR("Missing redownload parameters"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v19);
      goto LABEL_33;
    }
    v8 = objc_msgSend(v6, "endpointType");
    v9 = v8 == 2;
    v10 = (Class *)0x24BEC8840;
    if (v8 != 2)
      v10 = (Class *)0x24BEC8928;
    v43 = (void *)objc_msgSend(objc_alloc(*v10), "initWithRequestContext:redownloadParametersString:", v5, v7);
    objc_msgSend(v43, "setUsePrioritizedURLSession:", 1);
    v11 = objc_alloc_init(MEMORY[0x24BDDCC18]);
    objc_msgSend(v11, "setAccountID:", objc_msgSend(v4, "accountID"));
    objc_msgSend(v11, "setDelegatedAccountID:", objc_msgSend(v4, "delegatedAccountID"));
    objc_msgSend(v11, "setRequestType:", v9);
    objc_msgSend(v11, "setRedownloadParameters:", v7);
    objc_msgSend(MEMORY[0x24BDDCC10], "sharedCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cachedResponseForRequest:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v13, v4, 3, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v42 = v13;
    if (objc_msgSend(v13, "hasValidAsset"))
    {
      v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v52 = self;
        v53 = 2114;
        v54 = v14;
        _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using existing cached playback response: %{public}@", buf, 0x16u);
      }

      v16 = v42;
      (*((void (**)(void *, void *, _QWORD, _QWORD))v3 + 2))(v3, v42, 0, 0);
      goto LABEL_38;
    }
    v40 = v14;
    v41 = v12;
    objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isAudioAccessory"))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isAppleTV");

      if (!v22)
      {
LABEL_29:
        objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isRemoteServerLikelyReachable");

        if ((v30 & 1) == 0)
        {
          v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          v14 = v40;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v52 = self;
            _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Skipping redownload asset request [offline]", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 56, CFSTR("No network connection"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v37);

          v12 = v41;
          goto LABEL_37;
        }
        objc_msgSend(v43, "setPlaybackRequest:", 1);
        v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v52 = self;
          _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Performing media redownload request...", buf, 0xCu);
        }

        accessQueue = self->_accessQueue;
        v33 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_13;
        block[3] = &unk_24CABA1D0;
        block[4] = self;
        v49 = v43;
        v34 = v43;
        dispatch_barrier_async(accessQueue, block);
        v44[0] = v33;
        v44[1] = 3221225472;
        v44[2] = __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_2;
        v44[3] = &unk_24CAB7C08;
        v44[4] = self;
        v45 = v4;
        v46 = v11;
        v47 = v3;
        v35 = v11;
        objc_msgSend(v34, "performRequestWithResponseHandler:", v44);

        v19 = v41;
LABEL_33:

LABEL_39:
        goto LABEL_40;
      }
    }
    objc_msgSend(v4, "itemIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "universalStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "subscriptionAdamID");

    if (v25)
    {
      v26 = objc_alloc_init(MEMORY[0x24BDDCC18]);
      objc_msgSend(v26, "setAccountID:", objc_msgSend(v4, "accountID"));
      objc_msgSend(v26, "setDelegatedAccountID:", objc_msgSend(v4, "delegatedAccountID"));
      objc_msgSend(v26, "setStoreSubscriptionAdamID:", v25);
      objc_msgSend(v26, "setRequestType:", 2);
      v12 = v41;
      objc_msgSend(v41, "cachedResponseForRequest:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v27;
      if (v27)
      {
        +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v27, v4, 3, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      if (objc_msgSend(v28, "hasValidAsset"))
      {
        log = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v52 = self;
          v53 = 2114;
          v54 = v40;
          _os_log_impl(&dword_210BD8000, log, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using existing subscription cached playback response despite redownload request: %{public}@", buf, 0x16u);
        }

        (*((void (**)(void *, void *, _QWORD, _QWORD))v3 + 2))(v3, v28, 0, 0);
        v14 = v40;
LABEL_37:
        v16 = v42;
LABEL_38:

        goto LABEL_39;
      }

    }
    goto LABEL_29;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v52 = self;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Missing store request context.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 26, CFSTR("Missing store request context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v6);
LABEL_40:

}

- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties
{
  return self->_assetLoadProperties;
}

- (void)setAssetLoadProperties:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoadProperties, a3);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_assetLoadProperties, 0);
  objc_storeStrong((id *)&self->_mediaDownloadRequest, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[38];
  v12 = v7;
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 304);
    *(_QWORD *)(v10 + 304) = 0;

    v7 = v12;
    v8 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v8, "finishWithError:", v7);

}

void __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_13(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 280), *(id *)(a1 + 40));
}

void __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  os_log_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD block[5];
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  os_log_t v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a1[4];
  v11 = *(NSObject **)(v10 + 272);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_3;
  block[3] = &unk_24CABA2D0;
  block[4] = v10;
  dispatch_barrier_async(v11, block);
  objc_msgSend(MEMORY[0x24BDD1540], "errorForICError:response:", v9, v7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = a1[4];
    *(_DWORD *)buf = 138543874;
    v55 = v14;
    v56 = 2114;
    v57 = v7;
    v58 = 2114;
    v59 = v9;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Finished media redownload request with response: %{public}@, error: %{public}@", buf, 0x20u);
  }

  -[NSObject items](v7, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v41 = v12;
    v44 = v9;
    v46 = a1;
    v45 = v8;
    v17 = (os_log_t)objc_alloc_init(MEMORY[0x24BDDCA90]);
    objc_msgSend(v16, "assetExpirationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setExpirationDate:](v17, "setExpirationDate:", v18);

    objc_msgSend(v16, "suzeLeaseID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSuzeLeaseID:](v17, "setSuzeLeaseID:", v19);

    -[NSObject dialog](v7, "dialog");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "responseDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setDialogDictionary:](v17, "setDialogDictionary:", v21);

    objc_msgSend(v16, "fileAssets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v49 != v26)
            objc_enumerationMutation(v22);
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC30]), "initWithiTunesCloudStoreFileAssetInfo:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          if (v28)
          {
            if (!v25)
              v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v22, "count"));
            objc_msgSend(v25, "addObject:", v28, v41);
          }

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v24);
    }
    else
    {
      v25 = 0;
    }
    -[NSObject setFileAssetInfoList:](v17, "setFileAssetInfoList:", v25, v41);
    objc_msgSend(v16, "hlsAsset");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC38]), "initWithiTunesCloudStoreHLSAssetInfo:", v32);
      -[NSObject setHlsAssetInfo:](v17, "setHlsAssetInfo:", v33);

    }
    v34 = v46[5];
    v47 = v42;
    +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v17, v34, 6, &v47);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v47;

    if (objc_msgSend(v30, "allowsAssetInfoCaching"))
    {
      objc_msgSend(MEMORY[0x24BDDCC10], "sharedCache");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addCachedResponse:forRequest:", v17, v46[6]);

    }
    v8 = v45;
    if (!v30)
    {
      if (!v31)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[MPCModelGenericAVItemMediaRedownloadOperation execute]_block_invoke");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("MPCModelGenericAVItemMediaRedownloadOperation.m"), 167, CFSTR("An error is expected for the failure to create a loadResult"));

      }
      v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = v46[4];
        *(_DWORD *)buf = 138543874;
        v55 = v37;
        v56 = 2114;
        v57 = v17;
        v58 = 2114;
        v59 = v31;
        _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Unable to extract valid load result from extracted media redownload asset response - Response:%{public}@ - Error:%{public}@", buf, 0x20u);
      }

    }
    v9 = v44;
    a1 = v46;
  }
  else
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v29 = a1[4];
      *(_DWORD *)buf = 138543362;
      v55 = v29;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Missing response item in media redownload request response", buf, 0xCu);
    }
    v30 = 0;
    v31 = (id)v12;
  }

  if ((objc_msgSend(v30, "hasValidAsset") & 1) == 0 && !v31)
  {
    v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = a1[4];
      *(_DWORD *)buf = 138543362;
      v55 = v39;
      _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Missing asset URL in media redownload request response", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 15, CFSTR("Missing asset URL in media redownload request response"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(a1[7] + 16))();

}

void __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 280);
  *(_QWORD *)(v1 + 280) = 0;

}

void __55__MPCModelGenericAVItemMediaRedownloadOperation_cancel__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 280));
}

@end
