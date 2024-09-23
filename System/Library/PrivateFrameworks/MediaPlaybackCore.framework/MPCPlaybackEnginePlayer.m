@implementation MPCPlaybackEnginePlayer

uint64_t __51___MPCPlaybackEnginePlayer_initWithPlaybackEngine___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v1 = MEMORY[0x24BDAC9B8];
  objc_copyWeak(&v4, &location);
  v2 = MSVLogAddStateHandler();
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
  return v2;
}

void __54___MPCPlaybackEnginePlayer_donateMetricsToPlayerItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  objc_msgSend(*(id *)(a1 + 32), "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avPlayerItem");
  v47 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  objc_msgSend(v47, "mpc_playerItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqual:", v4);

  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "musicTotalTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v5, CFSTR("msc_MPP"));

    objc_msgSend(*(id *)(a1 + 48), "musicWaitTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v6, CFSTR("msc_MWT"));

    objc_msgSend(*(id *)(a1 + 48), "mediaPlayerTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v7, CFSTR("msc_MPT"));

    objc_msgSend(*(id *)(a1 + 48), "setQueueCommandSendTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v8, CFSTR("msc_SQ"));

    objc_msgSend(*(id *)(a1 + 48), "queueLoadWaitTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v9, CFSTR("msc_QL"));

    objc_msgSend(*(id *)(a1 + 48), "assetLoadWaitTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v10, CFSTR("msc_AL"));

    objc_msgSend(*(id *)(a1 + 48), "readyToPlayStatusWaitTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v11, CFSTR("msc_RTP"));

    objc_msgSend(*(id *)(a1 + 48), "rateChangeWaitTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v12, CFSTR("msc_RC"));

    objc_msgSend(*(id *)(a1 + 48), "firstAudioFrameWaitTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v13, CFSTR("msc_FAF"));

    objc_msgSend(*(id *)(a1 + 48), "playCommandWaitTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v14, CFSTR("msc_playCmdWait"));

    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 48), "eventType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithBool:", objc_msgSend(v16, "isEqualToString:", CFSTR("FirstItem")));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v17, CFSTR("msc_firstItem"));

    objc_msgSend(*(id *)(a1 + 48), "isFirstPlay");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v18, CFSTR("msc_firstPlay"));

    objc_msgSend(*(id *)(a1 + 48), "featureName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v19, CFSTR("msc_featureName"));

    objc_msgSend(*(id *)(a1 + 48), "queueType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v20, CFSTR("msc_queueType"));

    objc_msgSend(*(id *)(a1 + 48), "isShuffled");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v21, CFSTR("msc_shuffled"));

    objc_msgSend(*(id *)(a1 + 48), "isAutoPlayEnabled");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v22, CFSTR("msc_autoPlay"));

    objc_msgSend(*(id *)(a1 + 48), "isSharePlay");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v23, CFSTR("msc_sharePlay"));

    objc_msgSend(*(id *)(a1 + 48), "isRemoteSetQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v24, CFSTR("msc_remoteSQ"));

    objc_msgSend(*(id *)(a1 + 48), "assetType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v25, CFSTR("msc_asstType"));

    objc_msgSend(*(id *)(a1 + 48), "assetSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v26, CFSTR("msc_asstSource"));

    objc_msgSend(*(id *)(a1 + 48), "assetLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v27, CFSTR("msc_asstLoc"));

    objc_msgSend(*(id *)(a1 + 48), "isDelegatedPlayback");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v28, CFSTR("msc_delegatedPB"));

    objc_msgSend(*(id *)(a1 + 48), "hasOnlinePlaybackKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v29, CFSTR("msc_onlinePBkeys"));

    objc_msgSend(*(id *)(a1 + 48), "hasOfflinePlaybackKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v30, CFSTR("msc_offlinePBkeys"));

    objc_msgSend(*(id *)(a1 + 48), "routeInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("type"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v32, CFSTR("msc_routeType"));

    objc_msgSend(*(id *)(a1 + 48), "networkType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v33, CFSTR("msc_nwType"));

    objc_msgSend(*(id *)(a1 + 48), "isActiveAccount");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v34, CFSTR("msc_acrtiveAccount"));

    objc_msgSend(*(id *)(a1 + 48), "hasAccountInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v35, CFSTR("msc_accountInfo"));

    objc_msgSend(*(id *)(a1 + 48), "isReplacingPlayback");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v36, CFSTR("msc_replacingPB"));

    objc_msgSend(*(id *)(a1 + 48), "errorResolution");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v37, CFSTR("msc_errorResAppld"));

    objc_msgSend(*(id *)(a1 + 48), "errorSignature");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v38, CFSTR("msc_errorSig"));

    objc_msgSend(*(id *)(a1 + 48), "experimentID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v39, CFSTR("msc_experimentID"));

    objc_msgSend(*(id *)(a1 + 48), "treatmentID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v40, CFSTR("msc_treatmentID"));

    objc_msgSend(*(id *)(a1 + 48), "endpointType");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v41, CFSTR("msc_endpointType"));

    objc_msgSend(*(id *)(a1 + 48), "seekBeforePlaying");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v42, CFSTR("msc_seek"));

    objc_msgSend(*(id *)(a1 + 48), "queueCommandType");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v43, CFSTR("msc_queueComType"));

    objc_msgSend(*(id *)(a1 + 48), "networkTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v44, CFSTR("msc_nwTime"));

    objc_msgSend(*(id *)(a1 + 48), "assetProtectionType");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v45, CFSTR("msc_protectionType"));

    objc_msgSend(*(id *)(a1 + 48), "storefront");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v46, CFSTR("msc_storefront"));

  }
}

void __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playbackStackController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "renderingMode");
  if ((unint64_t)(v5 - 1) >= 5)
    v6 = 0;
  else
    v6 = v5;

  if (objc_msgSend(v3, "tier") == 4)
  {
    objc_msgSend(*(id *)(a1 + 40), "audioRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (v6 == 0) & ~objc_msgSend(v7, "isSpatializationEnabled");

    if ((v8 & 1) != 0)
      v6 = 1;
  }
  if (objc_msgSend(v3, "renderingMode") != v6)
  {
    objc_msgSend(v3, "audioFormatWithRenderingMode:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v9;
  }
  v10 = objc_msgSend(v3, "tier");
  objc_msgSend(*(id *)(a1 + 40), "preferredFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "tier");

  if (v10 == v12)
  {
    v13 = objc_msgSend(v3, "tier");
    objc_msgSend(*(id *)(a1 + 40), "preferredFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "tier");

    if (v13 == v15)
      v16 = 100;
    else
      v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 32);
    v24 = 138543874;
    v25 = v18;
    v26 = 2114;
    v27 = v19;
    v28 = 2114;
    v29 = v3;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - [AF] - Updating active format : %{public}@", (uint8_t *)&v24, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "updateActiveFormat:justification:", v3, v16);
  objc_msgSend(*(id *)(a1 + 32), "playbackStackController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activeFormatDidChangeFor:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "eventObserver");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stableVariantID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "engine:didChangeCurrentItemVariantID:", v21, v23);

}

void __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v13 = *(id *)(a1 + 56);
    v12 = v5;
    msv_dispatch_on_main_queue();

    v8 = v13;
  }
  else
  {
    if (!v6)
      goto LABEL_4;
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Failed to load track audio format for stableVariantID=%{public}@ error=%{public}@", buf, 0x2Au);
    }
  }

LABEL_4:
}

uint64_t __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61___MPCPlaybackEnginePlayer_jumpToTime_identifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = a1[7];
    v9 = 138544130;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Set current time command %{public}@ completed - time=%f - error=%{public}@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __58___MPCPlaybackEnginePlayer_setRate_identifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(float *)(a1 + 64);
    v12 = 138544130;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Set rate command %{public}@ completed - rate=%f - error=%{public}@", (uint8_t *)&v12, 0x2Au);
  }

  objc_msgSend(WeakRetained, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v10, "_setCurrentPlaybackRate:", v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __65___MPCPlaybackEnginePlayer_endScanningWithIdentifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-End seek command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __68___MPCPlaybackEnginePlayer_togglePlaybackWithIdentifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __68___MPCPlaybackEnginePlayer_togglePlaybackWithIdentifier_completion___block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Play command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "invalidateEVSDeferralAssertionForFirstAudioFrame");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __77___MPCPlaybackEnginePlayer_pauseForLeasePreventionWithIdentifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause for lease prevention %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __80___MPCPlaybackEnginePlayer_pauseForSleepTimerWithFadeout_identifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __67___MPCPlaybackEnginePlayer_pauseWithFadeout_identifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __59___MPCPlaybackEnginePlayer_pauseWithIdentifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __63___MPCPlaybackEnginePlayer_playWithRate_identifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Play command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __55___MPCPlaybackEnginePlayer_becomeActiveWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  id WeakRetained;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v7 = v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v10)
      goto LABEL_7;
    v11 = *(_QWORD *)(a1 + 40);
    v17 = 138543874;
    v18 = v11;
    v19 = 2048;
    v20 = WeakRetained;
    v21 = 2114;
    v22 = v5;
    v12 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - Set audio session active failed - error: %{public}@";
    v13 = v9;
    v14 = 32;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    v15 = *(_QWORD *)(a1 + 40);
    v17 = 138543618;
    v18 = v15;
    v19 = 2048;
    v20 = WeakRetained;
    v12 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - Set audio session active succeeded";
    v13 = v9;
    v14 = 22;
  }
  _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
LABEL_7:

  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id, double))(v16 + 16))(v16, a2, v5, -v7);

}

void __63___MPCPlaybackEnginePlayer_finalizeStateRestoreWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v14 = 138543874;
        v15 = v7;
        v16 = 2048;
        v17 = v5;
        v18 = 2114;
        v19 = v3;
        _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "[%{public}@]-MPCPlaybackEngineImplementation: %p - loadSessionWithQueueController - Load session failed - error: %{public}@", (uint8_t *)&v14, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained, "playbackStackController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentQueueItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "contentItemID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPreferredFirstContentItemID:", v12);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine implementation no longer exist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 0, CFSTR("PlaybackEngine finalizeSetQueue does not call completion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  v4 = (void *)MEMORY[0x24BE65C38];
  v5 = *MEMORY[0x24BE65AB0];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v5, CFSTR("Bug"), CFSTR("finalizeSetQueue"), CFSTR("completion not called"), 0, v7, 0);

}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BE65C38];
    v5 = *MEMORY[0x24BE65AB0];
    objc_msgSend(*(id *)(a1 + 40), "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v5, CFSTR("Bug"), CFSTR("finalizeSetQueue"), CFSTR("completion called multiple times"), 0, v7, 0);

  }
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v7;
      v15 = 2048;
      v16 = WeakRetained;
      v17 = 2114;
      v18 = v3;
      v8 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - async performSetQueue failed - error: %{public}@";
      v9 = v6;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 32;
LABEL_6:
      _os_log_impl(&dword_210BD8000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v12;
    v15 = 2048;
    v16 = WeakRetained;
    v8 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - async performSetQueue completed";
    v9 = v6;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 22;
    goto LABEL_6;
  }

}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_73(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20[2];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(unsigned __int8 *)(a1 + 72);
    objc_msgSend(v3, "playbackStackController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v22 = v4;
    v23 = 2048;
    v24 = v3;
    v25 = 2114;
    v26 = v5;
    v27 = 1024;
    v28 = v6;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlaybackEngineImplementation: %p - calling setQueueWithInitialItem on playback stack - item: %{public}@ - play: %{BOOL}u - mode: %{public}@", buf, 0x30u);

  }
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v10 = (char *)os_signpost_id_generate(v9);

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v12 = v11;
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = *(unsigned __int8 *)(a1 + 72);
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v13;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "InitialItem", "shouldPlay=%{BOOL}u", buf, 8u);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "playbackStackController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_BYTE *)(a1 + 72) != 0;
  v17 = *(_QWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_74;
  v18[3] = &unk_24CAB0E10;
  v20[1] = v10;
  objc_copyWeak(v20, (id *)buf);
  v19 = *(id *)(a1 + 64);
  objc_msgSend(v14, "setQueueWithInitialItem:andPlay:identifier:completion:", v17, v15, v16, v18);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
}

uint64_t __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_78(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PrepareForRate", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "Failed to set rate from user defaults: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_74(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_END, v7, "InitialItem", " enableTelemetry=YES ", v11, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
    objc_msgSend(WeakRetained, "invalidateEVSDeferralAssertionForFirstAudioFrame");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 60, CFSTR("Playback engine implementation no longer exist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

uint64_t __51___MPCPlaybackEnginePlayer_initWithPlaybackEngine___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_stateDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5[2](v5, v9);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
