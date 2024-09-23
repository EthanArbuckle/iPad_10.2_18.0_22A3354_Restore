@implementation MPCModelRadioGetTracksOperation

- (MPCModelRadioGetTracksOperation)initWithGetTracksRequest:(id)a3 siriAssetInfo:(id)a4 radioQueueFeeder:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCModelRadioGetTracksOperation *v11;
  uint64_t v12;
  ICRadioGetTracksRequest *request;
  uint64_t v14;
  NSString *siriAssetInfo;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPCModelRadioGetTracksOperation;
  v11 = -[MPAsyncOperation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    request = v11->_request;
    v11->_request = (ICRadioGetTracksRequest *)v12;

    v14 = objc_msgSend(v9, "copy");
    siriAssetInfo = v11->_siriAssetInfo;
    v11->_siriAssetInfo = (NSString *)v14;

    v11->_radioQueueFeederPointerForLogging = v10;
  }

  return v11;
}

- (void)execute
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_class **v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  MPSharedBackgroundTaskProvider();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__MPCModelRadioGetTracksOperation_execute__block_invoke;
  v10[3] = &unk_24CAB9A48;
  v10[4] = &v11;
  v5 = objc_msgSend(v3, "beginTaskWithName:expirationHandler:", CFSTR("com.apple.MediaPlaybackCore.MPCModelRadioGetTracksOperation"), v10);

  v12[3] = v5;
  v6 = -[ICRadioGetTracksRequest reasonType](self->_request, "reasonType");
  v7 = off_24CAA2DF0;
  if (v6 != 1)
    v7 = off_24CAA2DF8;
  v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithGetTracksRequest:siriAssetInfo:", self->_request, self->_siriAssetInfo);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __42__MPCModelRadioGetTracksOperation_execute__block_invoke_2;
  v9[3] = &unk_24CAB7C30;
  v9[4] = self;
  v9[5] = &v11;
  -[MPCModelRadioGetTracksOperation _runStep:withFinishHandler:](self, "_runStep:withFinishHandler:", v8, v9);

  _Block_object_dispose(&v11, 8);
}

- (id)_cacheTracksForStep:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEC8968], "flattenedTracksWithTracks:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "delegatedIdentityProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v3;
  objc_msgSend(v3, "identityProperties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v8, "unsignedLongLongValue");

  v34 = v7;
  objc_msgSend(v7, "DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v9, "unsignedLongLongValue");

  objc_msgSend(MEMORY[0x24BDDCC10], "sharedCache");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v6;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v41)
  {
    v37 = *(_QWORD *)v56;
    v10 = 0x24BDBC000uLL;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v56 != v37)
          objc_enumerationMutation(obj);
        v45 = v11;
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v11);
        v13 = objc_alloc_init(MEMORY[0x24BDDCC18]);
        objc_msgSend(v13, "setAccountID:", v39);
        objc_msgSend(v13, "setRequestType:", 3);
        objc_msgSend(v13, "setStoreRadioAdamID:", objc_msgSend(v12, "storeAdamID"));
        v44 = v13;
        objc_msgSend(v13, "setDelegatedAccountID:", v38);
        v14 = objc_alloc_init(MEMORY[0x24BDDCA90]);
        if (objc_msgSend(v12, "trackType") == 4)
          objc_msgSend(v14, "setLiveRadioStream:", 1);
        v46 = v14;
        objc_msgSend(v12, "fileAssets");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v52 != v19)
                objc_enumerationMutation(v15);
              v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC30]), "initWithiTunesCloudStoreFileAssetInfo:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
              if (v21)
              {
                if (!v18)
                  v18 = (void *)objc_msgSend(objc_alloc(*(Class *)(v10 + 3768)), "initWithCapacity:", objc_msgSend(v15, "count"));
                objc_msgSend(v18, "addObject:", v21);
              }

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          }
          while (v17);
        }
        else
        {
          v18 = 0;
        }
        objc_msgSend(v46, "setFileAssetInfoList:", v18);
        objc_msgSend(v12, "expirationDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hlsAsset");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC38]), "initWithiTunesCloudStoreHLSAssetInfo:", v22);
          objc_msgSend(v46, "setHlsAssetInfo:", v23);

        }
        v42 = (void *)v22;
        v24 = objc_alloc_init(*(Class *)(v10 + 3768));
        objc_msgSend(v12, "radioStreamAssets");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v48 != v28)
                objc_enumerationMutation(v25);
              v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCCA8]), "initWithiTunesCloudStoreRadioStreamAssetInfo:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j));
              if (v30)
                objc_msgSend(v24, "addObject:", v30);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          }
          while (v27);
        }
        if (objc_msgSend(v24, "count"))
          objc_msgSend(v46, "setRadioStreamAssetInfoList:", v24);
        v10 = 0x24BDBC000;
        v31 = v43;
        if (!objc_msgSend(v18, "count"))
        {

          v31 = 0;
        }
        objc_msgSend(v46, "setExpirationDate:", v31);
        objc_msgSend(v40, "addCachedResponse:forRequest:", v46, v44);

        v11 = v45 + 1;
      }
      while (v45 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v41);
  }

  return obj;
}

- (void)_runStep:(id)a3 withFinishHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *radioQueueFeederPointerForLogging;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  MPCModelRadioGetTracksOperation *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    radioQueueFeederPointerForLogging = self->_radioQueueFeederPointerForLogging;
    *(_DWORD *)buf = 134218498;
    v16 = radioQueueFeederPointerForLogging;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "RQF %p [GTO %p]: _runStep: [performWithCompletionHandler] step=%{public}@", buf, 0x20u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__MPCModelRadioGetTracksOperation__runStep_withFinishHandler___block_invoke;
  v12[3] = &unk_24CAB7C58;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v11, "performWithCompletionHandler:", v12);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __62__MPCModelRadioGetTracksOperation__runStep_withFinishHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  MPCModelRadioStationBuilder *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MPCModelRadioGetTracksResponse *v29;
  id v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  id v34;
  _BYTE buf[24];
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(v5 + 288);
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v36 = v6;
    LOWORD(v37) = 2114;
    *(_QWORD *)((char *)&v37 + 2) = v3;
    WORD5(v37) = 1024;
    HIDWORD(v37) = objc_msgSend(v3, "isFinished");
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "RQF %p [GTO %p]: _runStep: [completed] step=%{public}@ nextStep=%{public}@ nextStepIsFinished=%{BOOL}u", buf, 0x30u);
  }

  if ((objc_msgSend(v3, "isFinished") & 1) != 0)
  {
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "tracklistActionType") != 1;
      objc_msgSend(*(id *)(a1 + 32), "_cacheTracksForStep:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc_init(MEMORY[0x24BDDCA88]);
      v13 = *(id *)(*(_QWORD *)(a1 + 32) + 272);
      objc_msgSend(v10, "stationMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v13;
      if (v14)
      {
        v15 = (void *)MEMORY[0x24BDDCB30];
        v16 = *MEMORY[0x24BDDC050];
        *(_QWORD *)buf = *MEMORY[0x24BDDBFF0];
        *(_QWORD *)&buf[8] = v16;
        v17 = *MEMORY[0x24BDDC000];
        *(_QWORD *)&buf[16] = *MEMORY[0x24BDDBFF8];
        v36 = v17;
        v18 = *MEMORY[0x24BDDC078];
        *(_QWORD *)&v37 = *MEMORY[0x24BDDC080];
        *((_QWORD *)&v37 + 1) = v18;
        v19 = *MEMORY[0x24BDDC060];
        v38 = *MEMORY[0x24BDDC070];
        v39 = v19;
        v40 = *MEMORY[0x24BDDC058];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 9);
        v32 = v14;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "propertySetWithProperties:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = -[MPCModelRadioStationBuilder initWithRequestedProperties:]([MPCModelRadioStationBuilder alloc], "initWithRequestedProperties:", v21);
        objc_msgSend(v13, "requestContext");
        v31 = v11;
        v23 = v12;
        v24 = v8;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelRadioStationBuilder modelRadioStationForMetadata:userIdentity:](v22, "modelRadioStationForMetadata:userIdentity:", v32, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v24;
        v12 = v23;
        v11 = v31;

        v14 = v32;
      }
      else
      {
        v30 = objc_alloc(MEMORY[0x24BDDC988]);
        objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v30, "initWithIdentifiers:block:", v21, &__block_literal_global_21914);
      }

      objc_msgSend(v34, "appendSection:", v27);
      if (v12)
        objc_msgSend(v34, "appendItems:", v12);
      objc_msgSend(v10, "performanceMetrics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[MPCModelRadioGetTracksResponse initWithTracks:tracklistAction:]([MPCModelRadioGetTracksResponse alloc], "initWithTracks:tracklistAction:", v34, v11);

    }
    else
    {
      v28 = 0;
      v29 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_runStep:withFinishHandler:", v3, *(_QWORD *)(a1 + 48));
  }

}

void __42__MPCModelRadioGetTracksOperation_execute__block_invoke(uint64_t a1)
{
  void *v2;

  MPSharedBackgroundTaskProvider();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x24BE65AB8];
}

void __42__MPCModelRadioGetTracksOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = *(_QWORD **)(a1 + 32);
  v13 = v12[37];
  if (v13)
  {
    (*(void (**)(_QWORD, id, id, id))(v13 + 16))(v12[37], v9, v10, v11);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 296);
    *(_QWORD *)(v14 + 296) = 0;

    v12 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v12, "finishWithError:", v11);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != *MEMORY[0x24BE65AB8])
  {
    MPSharedBackgroundTaskProvider();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

  }
}

@end
