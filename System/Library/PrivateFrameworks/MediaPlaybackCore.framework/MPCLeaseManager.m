@implementation MPCLeaseManager

void __53___MPCLeaseManager__updateStateForPlaybackPrevention__block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldPreventPlayback");
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v28 = v5;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Pausing [current item (%{public}@) requested playback prevention]", buf, 0x16u);
    }

    v7 = (void *)MEMORY[0x24BDD17C8];
    MSVNanoIDCreateTaggedPointer();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("LeasePreventionPause_%@"), v8);
    v3 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "pauseForLeasePreventionWithIdentifier:completion:", v3, &__block_literal_global_24694);
    v9 = objc_msgSend(*(id *)(a1 + 32), "leasePlaybackPreventionState");
    objc_msgSend(*(id *)(a1 + 32), "leaseStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(WeakRetained, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stateReasonDialog");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "responseDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("MPCErrorUserInfoKeyStoreDialogDictionary"));

        objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("MPCErrorUserInfoKeyLeaseStatus"));
        objc_msgSend(v10, "stateReasonDialogMetricsDictionary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("MPCErrorUserInfoKeyMetricsDictionary"));

        objc_msgSend(*(id *)(a1 + 32), "playbackError");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDD1398]);

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 30, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 32);
          v20 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134218498;
          v28 = v20;
          v29 = 2114;
          v30 = v21;
          v31 = 2114;
          v32 = v13;
          _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Notifying delegate of lease prevention [engine:didPauseForLeaseEndWithError:] - item: %{public}@ - userInfo: %{public}@", buf, 0x20u);
        }

        objc_msgSend(v12, "engine:didPauseForLeaseEndWithError:", WeakRetained, v18);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(_QWORD *)(a1 + 32);
          v25 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134218242;
          v28 = v25;
          v29 = 2114;
          v30 = v26;
          _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Notifying delegate of lease prevention [engineDidPauseForLeaseEnd:] - item: %{public}@", buf, 0x16u);
        }

        objc_msgSend(v12, "engineDidPauseForLeaseEnd:", WeakRetained);
      }

    }
  }
  else if (v4)
  {
    v23 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v28 = v22;
    v29 = 2114;
    v30 = v23;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Ignoring lease playback prevention [lease being acquired] - item:%{public}@", buf, 0x16u);
  }

}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  msv_dispatch_sync_on_queue();

}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_11;
    v9[3] = &unk_24CAB8C80;
    v9[4] = *(_QWORD *)(a1 + 32);
    v13 = *(id *)(a1 + 56);
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v10, "reloadFairPlayKeyStatusWithCompletionHandler:", v9);

  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v15 = v8;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: finished [no subscription lease session] error: %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v29 = v8;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: failed [failed to reload FairPlay key status] error: %{public}@", buf, 0x16u);
    }
LABEL_4:

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "HomePodPFSQForcedLeaseRenewThreshold");
  v11 = v10;

  objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isAudioAccessory") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastPlaybackRequestDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 40), "lastPlaybackRequestDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceNow");
    v16 = v15;

    if (v16 < -v11)
      goto LABEL_16;
  }
  else
  {

  }
  if ((objc_msgSend(v5, "hasOnlinePlaybackKeys") & 1) != 0 || objc_msgSend(v5, "hasOfflinePlaybackKeys"))
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v29 = v17;
      v30 = 2114;
      v31 = v5;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: finished [already had lease with playback keys]. status: %{public}@", buf, 0x16u);
    }
    goto LABEL_4;
  }
LABEL_16:
  objc_initWeak(&location, *(id *)(a1 + 32));
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 134218242;
    v29 = v19;
    v30 = 2112;
    v31 = v20;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: renewing lease account: %@", buf, 0x16u);
  }

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8898]), "initWithRequestContext:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v21, "setShouldPreventLeaseAcquisition:", 1);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_15;
  v24[3] = &unk_24CAB8C58;
  v22 = *(void **)(a1 + 40);
  v24[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v26, &location);
  v25 = *(id *)(a1 + 64);
  v23 = (id)objc_msgSend(v22, "performPlaybackRequest:completionHandler:", v21, v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
LABEL_19:

}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_15(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[4];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD1540], "errorForICError:response:", a4, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: finished error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v21 = v13;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: finished", buf, 0xCu);
  }

  if (objc_msgSend(v7, "isNotEmpty"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "eventStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = CFSTR("network-operation-type");
    v18[1] = CFSTR("network-operation-reason");
    v19[0] = &unk_24CB16F08;
    v19[1] = CFSTR("Preparing for playback");
    v18[2] = CFSTR("blocks-playback");
    v18[3] = CFSTR("network-metrics");
    v19[2] = MEMORY[0x24BDBD1C0];
    v19[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "emitEventType:payload:", CFSTR("network-operation"), v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

  v6[2](v6, *(_QWORD *)(a1 + 48));
}

void __61___MPCLeaseManager_getHasPreparedLeaseForAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61___MPCLeaseManager_getHasPreparedLeaseForAccount_completion___block_invoke_2;
  v3[3] = &unk_24CAB8BB0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "reloadFairPlayKeyStatusWithCompletionHandler:", v3);

}

void __61___MPCLeaseManager_getHasPreparedLeaseForAccount_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "hasOnlinePlaybackKeys"), v5);

}

@end
