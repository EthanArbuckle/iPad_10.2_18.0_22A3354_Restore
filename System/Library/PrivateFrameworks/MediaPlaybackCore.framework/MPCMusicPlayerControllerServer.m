@implementation MPCMusicPlayerControllerServer

uint64_t __68___MPCMusicPlayerControllerServer__handleCommandHandlersRegistered___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeIfNeeded");
}

void __94___MPCMusicPlayerControllerServer__invokeServerCommandEvent_remoteCommandSenderID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: _invokeServerCommandEvent:… stop dispatch [] serverEvent=%{public}@ statuses=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
}

void __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id WeakRetained;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    v11 = v3;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: connection invalidated: pid=%u", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke_115;
    v7[3] = &unk_24CABA1D0;
    v8 = WeakRetained;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke_115(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id obj;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queueController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = a1;
  objc_msgSend(*(id *)(a1 + 40), "removedItemIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v8);
        dispatch_group_enter(v2);
        objc_msgSend(v4, "music");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_2;
        v28[3] = &unk_24CAB8C28;
        v29 = v3;
        v30 = v2;
        objc_msgSend(v10, "removeContentItemID:completion:", v9, v28);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(v18 + 40), "insertedDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_3;
  v23[3] = &unk_24CAB2518;
  v13 = *(void **)(v18 + 56);
  v23[4] = *(_QWORD *)(v18 + 48);
  v24 = v13;
  v25 = v2;
  v26 = v4;
  v14 = v3;
  v27 = v14;
  v15 = v4;
  v16 = v2;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v23);

  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_3_107;
  block[3] = &unk_24CAB9830;
  v21 = v14;
  v22 = *(id *)(v18 + 64);
  v17 = v14;
  dispatch_group_notify(v16, MEMORY[0x24BDAC9B8], block);

}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MPCPlaybackContextRemotePlaybackQueue *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[4];
  _QWORD v46[4];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v35 = a2;
  objc_msgSend(a3, "playbackContexts");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v5)
  {
    v6 = v5;
    v33 = *MEMORY[0x24BE658C0];
    v34 = *(_QWORD *)v40;
    v32 = *MEMORY[0x24BE65990];
    v30 = *MEMORY[0x24BE65908];
    v31 = *MEMORY[0x24BE65948];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v7);
        v9 = v35;
        objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mediaRemotePublisher");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "commandCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = -[MPCPlaybackContextRemotePlaybackQueue initWithPlaybackContext:]([MPCPlaybackContextRemotePlaybackQueue alloc], "initWithPlaybackContext:", v8);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc(MEMORY[0x24BDDC760]);
        objc_msgSend(v12, "insertIntoPlaybackQueueCommand");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 == v9)
        {
          v45[0] = v33;
          MSVNanoIDCreateTaggedPointer();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("MPMusicPlayer-"), "stringByAppendingString:", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v46[0] = v18;
          v46[1] = CFSTR("MPCMusicPlayerControllerServer");
          v45[1] = v32;
          v45[2] = CFSTR("kMRMediaRemoteOptionSenderID");
          v24 = *(_QWORD *)(a1 + 40);
          v45[3] = CFSTR("MPRemoteCommandQueueInsertionPosition");
          v46[2] = v24;
          v46[3] = &unk_24CB168D8;
          v19 = (void *)MEMORY[0x24BDBCE70];
          v20 = v46;
          v21 = v45;
          v22 = 4;
        }
        else
        {
          v43[0] = v33;
          MSVNanoIDCreateTaggedPointer();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("MPMusicPlayer-"), "stringByAppendingString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v44[0] = v18;
          v44[1] = CFSTR("MPCMusicPlayerControllerServer");
          v43[1] = v32;
          v43[2] = CFSTR("kMRMediaRemoteOptionSenderID");
          v44[2] = *(_QWORD *)(a1 + 40);
          v44[3] = &unk_24CB168F0;
          v43[3] = v31;
          v43[4] = v30;
          v44[4] = v9;
          v19 = (void *)MEMORY[0x24BDBCE70];
          v20 = v44;
          v21 = v43;
          v22 = 5;
        }
        objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v15, "initWithCommand:playbackQueue:options:", v16, v13, v25);

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 56), "upNextBehavior");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_104;
        v36[3] = &unk_24CAB8C28;
        v37 = *(id *)(a1 + 64);
        v38 = *(id *)(a1 + 48);
        objc_msgSend(v27, "performInsertCommand:targetContentItemID:completion:", v26, 0, v36);

        ++v7;
      }
      while (v6 != v7);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v6);
  }

}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_3_107(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x24BDD1540];
    v3 = *MEMORY[0x24BDDC418];
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "msv_errorWithDomain:code:underlyingError:debugDescription:", v3, 3, v4, CFSTR("Failed to apply queue modifications"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_104(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_2_105;
  block[3] = &unk_24CABAA28;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_2_105(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __62___MPCMusicPlayerControllerServer_setPlaybackRate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "changePlaybackRateCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupported"))
  {
    v7 = *(void **)(a1 + 32);
    LODWORD(v6) = *(_DWORD *)(a1 + 64);
    v8 = (void *)objc_msgSend(v5, "newCommandEventWithPlaybackRate:", v6);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62___MPCMusicPlayerControllerServer_setPlaybackRate_completion___block_invoke_2;
    v16[3] = &unk_24CAB24A0;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v17 = v10;
    v18 = v11;
    objc_msgSend(v7, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v8, v9, v16);

    v12 = v17;
  }
  else
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v20 = objc_msgSend(v5, "isEnabled");
      v21 = 1024;
      v22 = objc_msgSend(v5, "isSupported");
      v23 = 1024;
      v24 = objc_msgSend(v4, "commandHandlersRegistered");
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changePlaybackRate: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", buf, 0x14u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    v12 = v14;
    v15 = *(_QWORD *)(a1 + 56);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_END, v15, "setPlaybackRate", ", buf, 2u);
    }
  }

}

void __62___MPCMusicPlayerControllerServer_setPlaybackRate_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "setPlaybackRate", ", v5, 2u);
  }

}

void __61___MPCMusicPlayerControllerServer_setElapsedTime_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "changePlaybackPositionCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupportedAndEnabled"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(v5, "newCommandEventWithPositionTime:", *(double *)(a1 + 56));
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61___MPCMusicPlayerControllerServer_setElapsedTime_completion___block_invoke_2;
    v15[3] = &unk_24CAB24A0;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 64);
    v16 = v9;
    v17 = v10;
    objc_msgSend(v6, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v7, v8, v15);

    v11 = v16;
  }
  else
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v19 = objc_msgSend(v5, "isEnabled");
      v20 = 1024;
      v21 = objc_msgSend(v5, "isSupported");
      v22 = 1024;
      v23 = objc_msgSend(v4, "commandHandlersRegistered");
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changePlaybackPosition: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", buf, 0x14u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    v11 = v13;
    v14 = *(_QWORD *)(a1 + 64);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v14, "setElapsedTime", ", buf, 2u);
    }
  }

}

void __61___MPCMusicPlayerControllerServer_setElapsedTime_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "setElapsedTime", ", v5, 2u);
  }

}

void __59___MPCMusicPlayerControllerServer_getShuffleModeWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "changeShuffleModeCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentShuffleType");
  MPMusicShuffleModeForMPShuffleType();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50___MPCMusicPlayerControllerServer_setShuffleMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "changeShuffleModeCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupportedAndEnabled"))
  {
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
        v6 = *(void **)(a1 + 32);
        v7 = (void *)objc_msgSend(v5, "newCommandEventWithType:", 1000);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = &__block_literal_global_87;
        goto LABEL_10;
      case 1:
        v6 = *(void **)(a1 + 32);
        v7 = (void *)objc_msgSend(v5, "newCommandEventWithType:", 0);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = &__block_literal_global_88;
        goto LABEL_10;
      case 2:
        v6 = *(void **)(a1 + 32);
        v7 = (void *)objc_msgSend(v5, "newCommandEventWithType:", 1);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = &__block_literal_global_89;
        goto LABEL_10;
      case 3:
        v6 = *(void **)(a1 + 32);
        v7 = (void *)objc_msgSend(v5, "newCommandEventWithType:", 0);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = &__block_literal_global_90;
LABEL_10:
        objc_msgSend(v6, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v7, v8, v9);

        break;
      default:
        break;
    }
  }
  else
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109632;
      v11[1] = objc_msgSend(v5, "isEnabled");
      v12 = 1024;
      v13 = objc_msgSend(v5, "isSupported");
      v14 = 1024;
      v15 = objc_msgSend(v4, "commandHandlersRegistered");
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changeShuffleMode: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v11, 0x14u);
    }

  }
}

void __58___MPCMusicPlayerControllerServer_getRepeatModeWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "changeRepeatModeCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentRepeatType");
  MPMusicRepeatModeForMPRepeatType();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __49___MPCMusicPlayerControllerServer_setRepeatMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "changeRepeatModeCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupportedAndEnabled"))
  {
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
        v6 = *(void **)(a1 + 32);
        v7 = (void *)objc_msgSend(v5, "newCommandEventWithType:", 3);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = &__block_literal_global_83;
        goto LABEL_10;
      case 1:
        v6 = *(void **)(a1 + 32);
        v7 = (void *)objc_msgSend(v5, "newCommandEventWithType:", 0);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = &__block_literal_global_84;
        goto LABEL_10;
      case 2:
        v6 = *(void **)(a1 + 32);
        v7 = (void *)objc_msgSend(v5, "newCommandEventWithType:", 1);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = &__block_literal_global_85;
        goto LABEL_10;
      case 3:
        v6 = *(void **)(a1 + 32);
        v7 = (void *)objc_msgSend(v5, "newCommandEventWithType:", 2);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = &__block_literal_global_86;
LABEL_10:
        objc_msgSend(v6, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v7, v8, v9);

        break;
      default:
        break;
    }
  }
  else
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109632;
      v11[1] = objc_msgSend(v5, "isEnabled");
      v12 = 1024;
      v13 = objc_msgSend(v5, "isSupported");
      v14 = 1024;
      v15 = objc_msgSend(v4, "commandHandlersRegistered");
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changeRepeatMode: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v11, 0x14u);
    }

  }
}

void __42___MPCMusicPlayerControllerServer_endSeek__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "seekForwardCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupportedAndEnabled"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(v5, "newSeekCommandEventWithType:", 1);
    objc_msgSend(v6, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v7, *(_QWORD *)(a1 + 40), &__block_literal_global_82);

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = objc_msgSend(v5, "isEnabled");
      v10 = 1024;
      v11 = objc_msgSend(v5, "isSupported");
      v12 = 1024;
      v13 = objc_msgSend(v4, "commandHandlersRegistered");
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: seekForward: endSeeking: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v9, 0x14u);
    }

  }
}

void __58___MPCMusicPlayerControllerServer_beginSeekWithDirection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 48);
  if (v5 == -1)
  {
    objc_msgSend(v4, "seekBackwardCommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isSupportedAndEnabled"))
    {
      v7 = *(void **)(a1 + 32);
      v8 = (void *)objc_msgSend(v6, "newCommandEvent");
      v9 = *(_QWORD *)(a1 + 40);
      v10 = &__block_literal_global_81;
      goto LABEL_7;
    }
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 67109632;
      v14 = objc_msgSend(v6, "isEnabled");
      v15 = 1024;
      v16 = objc_msgSend(v6, "isSupported");
      v17 = 1024;
      v18 = objc_msgSend(v4, "commandHandlersRegistered");
      v12 = "MPCMusicPlayerControllerServer: seekBackward: dropping command [not enabled or not ready] enabled=%{BOOL}u, "
            "supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u";
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v5 == 1)
  {
    objc_msgSend(v4, "seekForwardCommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isSupportedAndEnabled"))
    {
      v7 = *(void **)(a1 + 32);
      v8 = (void *)objc_msgSend(v6, "newCommandEvent");
      v9 = *(_QWORD *)(a1 + 40);
      v10 = &__block_literal_global_79;
LABEL_7:
      objc_msgSend(v7, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v8, v9, v10);

LABEL_14:
      goto LABEL_15;
    }
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 67109632;
      v14 = objc_msgSend(v6, "isEnabled");
      v15 = 1024;
      v16 = objc_msgSend(v6, "isSupported");
      v17 = 1024;
      v18 = objc_msgSend(v4, "commandHandlersRegistered");
      v12 = "MPCMusicPlayerControllerServer: seekForward: dropping command [not enabled or not ready] enabled=%{BOOL}u, s"
            "upported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u";
LABEL_12:
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0x14u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_15:

}

void __44___MPCMusicPlayerControllerServer_reshuffle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "reshuffleCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupportedAndEnabled"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(v5, "newCommandEvent");
    objc_msgSend(v6, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v7, *(_QWORD *)(a1 + 40), &__block_literal_global_78);

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = objc_msgSend(v5, "isEnabled");
      v10 = 1024;
      v11 = objc_msgSend(v5, "isSupported");
      v12 = 1024;
      v13 = objc_msgSend(v4, "commandHandlersRegistered");
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: reshuffle: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v9, 0x14u);
    }

  }
}

void __52___MPCMusicPlayerControllerServer_skipWithBehavior___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      objc_msgSend(v4, "previousTrackCommand");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSupportedAndEnabled"))
      {
        v6 = *(void **)(a1 + 32);
        v15[0] = *MEMORY[0x24BE659A0];
        v15[1] = CFSTR("MPCRemoteCommandEventOptionSkipImmediatelyKey");
        v16[0] = MEMORY[0x24BDBD1C8];
        v16[1] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v5, "newCommandEventWithCommandType:options:", 5, v7);
        v9 = *(_QWORD *)(a1 + 40);
        v10 = &__block_literal_global_77;
        goto LABEL_10;
      }
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      goto LABEL_19;
    case 1:
      objc_msgSend(v4, "nextTrackCommand");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSupportedAndEnabled"))
      {
        v6 = *(void **)(a1 + 32);
        v25 = CFSTR("MPCRemoteCommandEventOptionSkipImmediatelyKey");
        v26[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v5, "newCommandEventWithCommandType:options:", 4, v7);
        v9 = *(_QWORD *)(a1 + 40);
        v10 = &__block_literal_global_71;
        goto LABEL_10;
      }
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_DWORD *)buf = 67109632;
      v20 = objc_msgSend(v5, "isEnabled");
      v21 = 1024;
      v22 = objc_msgSend(v5, "isSupported");
      v23 = 1024;
      v24 = objc_msgSend(v4, "commandHandlersRegistered");
      v13 = "MPCMusicPlayerControllerServer: nextTrack: dropping command [not enabled or not ready] enabled=%{BOOL}u, sup"
            "ported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u";
      goto LABEL_20;
    case 2:
      objc_msgSend(v4, "changePlaybackPositionCommand");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSupportedAndEnabled"))
      {
        v11 = *(void **)(a1 + 32);
        v12 = (void *)objc_msgSend(v5, "newCommandEventWithPositionTime:", 0.0);
        objc_msgSend(v11, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v12, *(_QWORD *)(a1 + 40), &__block_literal_global_73);

      }
      else
      {
        v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          v20 = objc_msgSend(v5, "isEnabled");
          v21 = 1024;
          v22 = objc_msgSend(v5, "isSupported");
          v23 = 1024;
          v24 = objc_msgSend(v4, "commandHandlersRegistered");
          _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changePlaybackPosition: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", buf, 0x14u);
        }

      }
      goto LABEL_22;
    case 3:
      objc_msgSend(v4, "previousTrackCommand");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSupportedAndEnabled"))
      {
        v6 = *(void **)(a1 + 32);
        v17 = CFSTR("MPCRemoteCommandEventOptionSkipImmediatelyKey");
        v18 = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v5, "newCommandEventWithCommandType:options:", 5, v7);
        v9 = *(_QWORD *)(a1 + 40);
        v10 = &__block_literal_global_75;
LABEL_10:
        objc_msgSend(v6, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v8, v9, v10);

      }
      else
      {
        v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:
          *(_DWORD *)buf = 67109632;
          v20 = objc_msgSend(v5, "isEnabled");
          v21 = 1024;
          v22 = objc_msgSend(v5, "isSupported");
          v23 = 1024;
          v24 = objc_msgSend(v4, "commandHandlersRegistered");
          v13 = "MPCMusicPlayerControllerServer: previousTrack: dropping command [not enabled or not ready] enabled=%{BOO"
                "L}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u";
LABEL_20:
          _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, v13, buf, 0x14u);
        }
      }
LABEL_21:

LABEL_22:
LABEL_23:

      return;
    default:
      goto LABEL_23;
  }
}

void __57___MPCMusicPlayerControllerServer_pauseWithFadeDuration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pauseCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupportedAndEnabled"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(v5, "newCommandEvent");
    objc_msgSend(v6, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v7, *(_QWORD *)(a1 + 40), &__block_literal_global_70);

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = objc_msgSend(v5, "isEnabled");
      v10 = 1024;
      v11 = objc_msgSend(v5, "isSupported");
      v12 = 1024;
      v13 = objc_msgSend(v4, "commandHandlersRegistered");
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: pause: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v9, 0x14u);
    }

  }
}

void __39___MPCMusicPlayerControllerServer_play__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaRemotePublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "playCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSupportedAndEnabled"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(v5, "newCommandEvent");
    objc_msgSend(v6, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v7, *(_QWORD *)(a1 + 40), &__block_literal_global_69);

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = objc_msgSend(v5, "isEnabled");
      v10 = 1024;
      v11 = objc_msgSend(v5, "isSupported");
      v12 = 1024;
      v13 = objc_msgSend(v4, "commandHandlersRegistered");
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: play: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v9, 0x14u);
    }

  }
}

void __92___MPCMusicPlayerControllerServer__appendPlaybackContexts_remoteCommandSenderID_completion___block_invoke(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusCode");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 6, CFSTR("Failed to prepare queue for append"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[7] + 2))();

  }
  else if ((unint64_t)objc_msgSend(a1[4], "count") < 2)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v6 = a1[4];
    v7 = a1[6];
    v8 = a1[7];
    msv_dispatch_on_main_queue();

  }
}

void __92___MPCMusicPlayerControllerServer__appendPlaybackContexts_remoteCommandSenderID_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v2, "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_appendPlaybackContexts:remoteCommandSenderID:completion:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __63___MPCMusicPlayerControllerServer_appendDescriptor_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_appendPlaybackContexts:remoteCommandSenderID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  return result;
}

void __93___MPCMusicPlayerControllerServer__prependPlaybackContexts_remoteCommandSenderID_completion___block_invoke(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusCode");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 6, CFSTR("Failed to prepare queue for prepend"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[7] + 2))();

  }
  else if ((unint64_t)objc_msgSend(a1[4], "count") < 2)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v6 = a1[4];
    v7 = a1[6];
    v8 = a1[7];
    msv_dispatch_on_main_queue();

  }
}

void __93___MPCMusicPlayerControllerServer__prependPlaybackContexts_remoteCommandSenderID_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v2, "removeLastObject");
  objc_msgSend(*(id *)(a1 + 40), "_prependPlaybackContexts:remoteCommandSenderID:completion:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __64___MPCMusicPlayerControllerServer_prependDescriptor_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_prependPlaybackContexts:remoteCommandSenderID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  return result;
}

uint64_t __58___MPCMusicPlayerControllerServer_getDescriptorWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MPCPlaybackContextRemotePlaybackQueue *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[5];
  id v36;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  v4 = (_QWORD *)MEMORY[0x24BDDC418];
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 2, CFSTR("Queue was interrupted by another queue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 16), *(id *)(a1 + 40));
  v8 = _Block_copy(*(const void **)(a1 + 88));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v8;

  v11 = dispatch_time(0, 9000000000);
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_2;
  block[3] = &unk_24CABA1D0;
  v13 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v36 = v13;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], block);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(*(id *)(a1 + 48), "hasSuffix:", CFSTR("iapd"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") <= 1)
    v15 = 0;
  else
    v15 = v14;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v15);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = (unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") > 1;
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mediaRemotePublisher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commandCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setPlaybackQueueCommand");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isSupportedAndEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 64), "setActionAfterQueueLoad:", 10);
    v20 = -[MPCPlaybackContextRemotePlaybackQueue initWithPlaybackContext:]([MPCPlaybackContextRemotePlaybackQueue alloc], "initWithPlaybackContext:", *(_QWORD *)(a1 + 64));
    -[MPCPlaybackContextRemotePlaybackQueue setReplaceIntent:](v20, "setReplaceIntent:", 1);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCBE8]), "initWithCommand:playbackQueue:", v19, v20);
    v22 = *(void **)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 72);
    v29[0] = v12;
    v29[1] = 3221225472;
    v29[2] = __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_3;
    v29[3] = &unk_24CAB2210;
    v29[4] = v22;
    v30 = v14;
    v31 = *(id *)(a1 + 56);
    v32 = *(id *)(a1 + 72);
    v33 = *(id *)(a1 + 40);
    v34 = *(id *)(a1 + 80);
    objc_msgSend(v22, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v21, v23, v29);

  }
  else
  {
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *v4, 7, CFSTR("SetPlaybackQueue is currently not enabled or the playback engine is not ready"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);

    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 24);
    *(_QWORD *)(v26 + 24) = 0;

    v28 = *(_QWORD *)(a1 + 32);
    v20 = *(MPCPlaybackContextRemotePlaybackQueue **)(v28 + 16);
    *(_QWORD *)(v28 + 16) = 0;
  }

}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 16) == *(_QWORD *)(a1 + 40))
  {
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 9, CFSTR("Preparing queue timed out"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = 0;

      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 16);
      *(_QWORD *)(v7 + 16) = 0;

    }
  }
}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusCode");

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isEqual:", *(_QWORD *)(a1 + 40)))
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 64);
    msv_dispatch_on_main_queue();

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  if (v7 == *(void **)(a1 + 64))
  {
    v8 = *(_QWORD *)(v6 + 24);
    if (v8)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 6, CFSTR("Failed to prepare to play"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 24);
        *(_QWORD *)(v10 + 24) = 0;

        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 16);
        *(_QWORD *)(v12 + 16) = 0;
      }
      else
      {
        if (!objc_msgSend(v7, "disableQueueModifications"))
          return;
        v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 72), "engineID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138543618;
          v23 = v15;
          v24 = 2114;
          v25 = v16;
          _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[MPCS:%{public}@] setDescriptor:completion: | disabling queue modification [client] descriptor=%{public}@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 72), "queueController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "music");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAllowsQueueModifications:", 0);

        objc_msgSend(*(id *)(a1 + 72), "mediaRemotePublisher");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "publishIfNeeded");
      }

    }
  }
}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v2, "removeObjectAtIndex:", 0);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_5;
  v5[3] = &unk_24CAB8C28;
  v5[4] = v3;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_appendPlaybackContexts:remoteCommandSenderID:completion:", v2, v4, v5);

}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 16) == *(_QWORD *)(a1 + 40))
  {
    v5 = *(_QWORD *)(v4 + 24);
    if (v5)
    {
      v12 = v3;
      (*(void (**)(void))(v5 + 16))();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 24);
      *(_QWORD *)(v6 + 24) = 0;

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 16);
      *(_QWORD *)(v8 + 16) = 0;

      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;

      v3 = v12;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
    }
  }

}

void __60___MPCMusicPlayerControllerServer_getTimeSnapshotWithReply___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  LODWORD(a3) = 2143289344;
  objc_msgSend(*(id *)(a1 + 32), "_timeSnapshotWithElapsedTime:rate:", NAN, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __92___MPCMusicPlayerControllerServer_getImageForArtworkIdentifier_itemIdentifier_atSize_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "itemForContentItemID:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelGenericObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "artworkCatalog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFittingSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __92___MPCMusicPlayerControllerServer_getImageForArtworkIdentifier_itemIdentifier_atSize_reply___block_invoke_2;
    v10[3] = &unk_24CAB21C0;
    v13 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "requestImageWithCompletion:", v10);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 7, CFSTR("%@:%@ does not support artwork."), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

  }
}

void __92___MPCMusicPlayerControllerServer_getImageForArtworkIdentifier_itemIdentifier_atSize_reply___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  if (a2)
  {
    MEMORY[0x212BD17D0](a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, id, _QWORD))(a1[6] + 16))(a1[6], v5, 0);
  }
  else
  {
    v4 = a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x24BDDC418], 8, a3, CFSTR("%@:%@ did not provide image data."), a1[4], a1[5]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);
  }

}

void __63___MPCMusicPlayerControllerServer_setNowPlayingUID_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _BYTE *v23;
  uint64_t v24;
  unint64_t v25;
  uint8_t v26[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56) & 0xFFFFFFFFFFFFFF00;
  v3 = (uint64_t (*)(uint64_t, uint64_t))*(_QWORD *)(a1 + 56);
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v2;
    *(_WORD *)&buf[22] = 2048;
    v31 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: setNowPlayingUID:%llu contentItemHash=%llu repeatIteration=%llu", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queueController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__2713;
  v32 = __Block_byref_object_dispose__2714;
  v33 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __63___MPCMusicPlayerControllerServer_setNowPlayingUID_completion___block_invoke_25;
  v21[3] = &unk_24CAB2198;
  v8 = v7;
  v24 = -256;
  v25 = v2;
  v22 = v8;
  v23 = buf;
  objc_msgSend(v8, "enumerateContentItemIDsInMode:block:", 1, v21);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    if (v3)
    {
      objc_msgSend(v8, "music");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if (!v10)
      {
        objc_msgSend(v8, "music");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "copyContentItemID:repeatIteration:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v3);
        v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v12;

      }
    }
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 56);
      v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v26 = 134218242;
      v27 = v15;
      v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: setNowPlayingUID:%llu jumping to item [found match] matchingContentItemID=%{public}@", v26, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setNowPlayingItem:itemIdentifier:remoteCommandSenderID:completion:", 0, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)v26 = 134217984;
      v27 = v18;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "MPMusicPlayerControllerServer: setNowPlayingUID:%llu dropping command [failed to find match]", v26, 0xCu);
    }

    v19 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 5, CFSTR("Cannot find item for UID: %llu"), *(_QWORD *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

  }
  _Block_object_dispose(buf, 8);

}

void __63___MPCMusicPlayerControllerServer_setNowPlayingUID_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  id v12;
  char *v13;
  int64_t v14;
  int v15;
  int v16;
  char *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t *v50;
  __int32 v51;
  void *v52;
  void *v53;
  unint64_t v54;
  int v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  unint64_t v61;
  unsigned __int32 v62;
  unint64_t v63;
  int v64;
  unint64_t v65;
  int v66;
  unint64_t v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned __int8 *v72;
  char *v73;
  char *v74;
  uint64_t m;
  unsigned int v76;
  char *v77;
  id v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 *v82;
  char *v83;
  char *v84;
  uint64_t j;
  unsigned int v86;
  char *v87;
  unsigned __int8 *v88;
  char *v89;
  char *v90;
  uint64_t k;
  unsigned int v92;
  char *v93;
  unsigned __int8 *v94;
  char *v95;
  char *v96;
  uint64_t i;
  unsigned int v98;
  char *v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD *v104;
  id v105;
  __int128 v106;
  uint32x4_t v107;
  unint64_t v108;
  unint64_t v109;
  _OWORD v110[2];
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[72];
  _OWORD v121[4];
  uint64_t v122;
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "music");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v3;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "music");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentItemIDWithoutRepeatIteration:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v104 = (_QWORD *)a1;
  v105 = v3;
  v7 = *MEMORY[0x24BE65B78];
  v119 = 0u;
  v118 = 0u;
  v117 = 0u;
  v116 = 0u;
  v115 = 0u;
  v114 = 0u;
  v113 = 0u;
  v112 = 0u;
  v8 = v7 + 0x60EA27EEADC0B5D6;
  v9 = v7 - 0x3D4D51C2D82B14B1;
  v10 = v7 + 0x61C8864E7A143579;
  v106 = xmmword_210ED9450;
  v107.i64[0] = v7 + 0x60EA27EEADC0B5D6;
  v107.i64[1] = v7 - 0x3D4D51C2D82B14B1;
  v108 = v7;
  v109 = v7 + 0x61C8864E7A143579;
  v11 = (uint64_t *)v110;
  memset(v110, 0, sizeof(v110));
  v111 = 0;
  v12 = objc_retainAutorelease(v5);
  v13 = (char *)objc_msgSend(v12, "UTF8String");
  v14 = objc_msgSend(v12, "length");
  if (v13)
  {
    v15 = v14;
    *((_QWORD *)&v106 + 1) = v14;
    if ((unint64_t)v14 <= 0x1F)
    {
      memcpy(v110, v13, v14);
      v16 = v111 + v15;
LABEL_11:
      LODWORD(v111) = v16;
      goto LABEL_12;
    }
    v17 = &v13[v14];
    if (v14 >= 32)
    {
      do
      {
        v8 = 0x9E3779B185EBCA87 * __ROR8__(v8 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v13, 33);
        v9 = 0x9E3779B185EBCA87 * __ROR8__(v9 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v13 + 1), 33);
        v7 = 0x9E3779B185EBCA87 * __ROR8__(v7 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v13 + 2), 33);
        v10 = 0x9E3779B185EBCA87 * __ROR8__(v10 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v13 + 3), 33);
        v13 += 32;
      }
      while (v13 <= v17 - 32);
      v107.i64[0] = v8;
      v107.i64[1] = v9;
      v108 = v7;
      v109 = v10;
    }
    if (v13 < v17)
    {
      v16 = (_DWORD)v17 - (_DWORD)v13;
      __memcpy_chk();
      goto LABEL_11;
    }
  }
LABEL_12:

  memset(&v120[8], 0, 64);
  *(_QWORD *)v120 = v106;
  if ((uint64_t)v106 > 3000)
  {
    if ((uint64_t)v106 <= 4000)
    {
      if ((_QWORD)v106 == 3001)
      {
        if (*((_QWORD *)&v106 + 1) < 0x20uLL)
          v54 = v108 + 0x27D4EB2F165667C5;
        else
          v54 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((0x85EBCA77C2B2AE63
                  - 0x61C8864E7A143579
                  * ((0x85EBCA77C2B2AE63
                    - 0x61C8864E7A143579
                    * ((__ROR8__(v107.i64[1], 57) + __ROR8__(v107.i64[0], 63) + __ROR8__(v108, 52) + __ROR8__(v109, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v107.i64[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v107.i64[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v108, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v109, 33)));
        v56 = v54 + *((_QWORD *)&v106 + 1);
        v57 = BYTE8(v106) & 0x1F;
        if (v57 >= 8)
        {
          do
          {
            v58 = *v11++;
            v56 = 0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v58, 33)) ^ v56, 37);
            v57 -= 8;
          }
          while (v57 > 7);
        }
        if (v57 >= 4)
        {
          v59 = *(_DWORD *)v11;
          v11 = (uint64_t *)((char *)v11 + 4);
          v56 = 0xC2B2AE3D27D4EB4FLL * __ROR8__((0x9E3779B185EBCA87 * v59) ^ v56, 41) + 0x165667B19E3779F9;
          v57 -= 4;
        }
        for (; v57; --v57)
        {
          v60 = *(unsigned __int8 *)v11;
          v11 = (uint64_t *)((char *)v11 + 1);
          v56 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v60) ^ v56, 53);
        }
        v61 = 0x165667B19E3779F9
            * ((0xC2B2AE3D27D4EB4FLL * (v56 ^ (v56 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v56 ^ (v56 >> 33))) >> 29));
        *(_QWORD *)&v120[8] = v61 ^ HIDWORD(v61);
        v19 = v104;
        v18 = v105;
      }
      else
      {
        v19 = v104;
        v18 = v105;
        if ((_QWORD)v106 == 4000)
          CC_MD5_Final(&v120[8], (CC_MD5_CTX *)((char *)&v106 + 8));
      }
    }
    else
    {
      v19 = v104;
      v18 = v105;
      switch((_QWORD)v106)
      {
        case 0xFA1:
          CC_SHA1_Final(&v120[8], (CC_SHA1_CTX *)((char *)&v106 + 8));
          break;
        case 0x10A0:
          CC_SHA256_Final(&v120[8], (CC_SHA256_CTX *)((char *)&v106 + 8));
          break;
        case 0x11A0:
          CC_SHA512_Final(&v120[8], (CC_SHA512_CTX *)((char *)&v106 + 8));
          break;
      }
    }
    goto LABEL_58;
  }
  if ((uint64_t)v106 > 1999)
  {
    v19 = v104;
    v18 = v105;
    if ((_QWORD)v106 != 2000)
    {
      if ((_QWORD)v106 != 3000)
        goto LABEL_58;
      v50 = &v108;
      if (HIDWORD(v106))
        v51 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v107, (uint32x4_t)xmmword_210ED9470), (int8x16_t)vshlq_u32(v107, (uint32x4_t)xmmword_210ED9460)));
      else
        v51 = v107.i32[2] + 374761393;
      v62 = DWORD2(v106) + v51;
      v63 = v110[0] & 0xF;
      if (v63 >= 4)
      {
        do
        {
          v64 = *(_DWORD *)v50;
          v50 = (unint64_t *)((char *)v50 + 4);
          HIDWORD(v65) = v62 - 1028477379 * v64;
          LODWORD(v65) = HIDWORD(v65);
          v62 = 668265263 * (v65 >> 15);
          v63 -= 4;
        }
        while (v63 > 3);
      }
      for (; v63; --v63)
      {
        v66 = *(unsigned __int8 *)v50;
        v50 = (unint64_t *)((char *)v50 + 1);
        HIDWORD(v67) = v62 + 374761393 * v66;
        LODWORD(v67) = HIDWORD(v67);
        v62 = -1640531535 * (v67 >> 21);
      }
      v68 = -1028477379 * ((-2048144777 * (v62 ^ (v62 >> 15))) ^ ((-2048144777 * (v62 ^ (v62 >> 15))) >> 13));
      v69 = v68 ^ HIWORD(v68);
      goto LABEL_57;
    }
    switch(v107.u8[3])
    {
      case 1u:
        v55 = v107.u8[0];
        break;
      case 2u:
        v55 = v107.u16[0];
        break;
      case 3u:
        v55 = v107.u16[0] | (v107.u8[2] << 16);
        break;
      default:
        v70 = DWORD2(v106);
        goto LABEL_56;
    }
    v70 = (461845907 * ((380141568 * v55) | ((-862048943 * v55) >> 17))) ^ DWORD2(v106);
LABEL_56:
    v71 = -2048144789 * (v70 ^ HIDWORD(v106) ^ ((v70 ^ HIDWORD(v106)) >> 16));
    v69 = (-1028477387 * (v71 ^ (v71 >> 13))) ^ ((-1028477387 * (v71 ^ (v71 >> 13))) >> 16);
    DWORD2(v106) = v69;
LABEL_57:
    *(_DWORD *)&v120[8] = v69;
    goto LABEL_58;
  }
  v19 = v104;
  v18 = v105;
  if ((_QWORD)v106)
  {
    if ((_QWORD)v106 == 1000)
    {
      v20 = (*((_QWORD *)&v106 + 1) + v107.i64[0]) ^ __ROR8__(v107.i64[0], 51);
      v21 = v107.i64[1] + (v108 ^ v109);
      v22 = __ROR8__(v108 ^ v109, 48);
      v23 = (v21 ^ v22) + __ROR8__(*((_QWORD *)&v106 + 1) + v107.i64[0], 32);
      v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
      v25 = v21 + v20;
      v26 = v25 ^ __ROR8__(v20, 47);
      v27 = (v23 ^ v109) + v26;
      v28 = v27 ^ __ROR8__(v26, 51);
      v29 = (__ROR8__(v25, 32) ^ 0xFFLL) + v24;
      v30 = __ROR8__(v24, 48);
      v31 = __ROR8__(v27, 32) + (v29 ^ v30);
      v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
      v33 = v28 + v29;
      v34 = v33 ^ __ROR8__(v28, 47);
      v35 = v34 + v31;
      v36 = v35 ^ __ROR8__(v34, 51);
      v37 = __ROR8__(v33, 32) + v32;
      v38 = __ROR8__(v32, 48);
      v39 = __ROR8__(v35, 32) + (v37 ^ v38);
      v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
      v41 = v36 + v37;
      v42 = v41 ^ __ROR8__(v36, 47);
      v43 = v42 + v39;
      v44 = v43 ^ __ROR8__(v42, 51);
      v45 = __ROR8__(v41, 32) + v40;
      v46 = __ROR8__(v40, 48);
      v47 = __ROR8__(v43, 32) + (v45 ^ v46);
      v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
      v49 = v44 + v45;
      *((_QWORD *)&v106 + 1) = v47;
      v107.i64[0] = v49 ^ __ROR8__(v44, 47);
      v107.i64[1] = __ROR8__(v49, 32);
      v108 = v48;
      *(_QWORD *)&v120[8] = v107.i64[0] ^ v47 ^ v107.i64[1] ^ v48;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

  }
LABEL_58:
  v121[0] = *(_OWORD *)v120;
  v121[1] = *(_OWORD *)&v120[16];
  v121[2] = *(_OWORD *)&v120[32];
  v121[3] = *(_OWORD *)&v120[48];
  v122 = *(_QWORD *)&v120[64];
  if (*(uint64_t *)v120 > 3999)
  {
    if (*(uint64_t *)v120 > 4255)
    {
      if (*(_QWORD *)v120 == 4256)
      {
        v94 = (unsigned __int8 *)v121 + 8;
        v95 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v96 = v95;
        for (i = 0; i != 64; i += 2)
        {
          v98 = *v94++;
          v99 = &v95[i];
          *v99 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v98 >> 4];
          v99[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v98 & 0xF];
        }
        v78 = objc_alloc(MEMORY[0x24BDD17C8]);
        v79 = v96;
        v80 = 64;
      }
      else
      {
        if (*(_QWORD *)v120 != 4512)
          goto LABEL_88;
        v82 = (unsigned __int8 *)v121 + 8;
        v83 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v84 = v83;
        for (j = 0; j != 128; j += 2)
        {
          v86 = *v82++;
          v87 = &v83[j];
          *v87 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v86 >> 4];
          v87[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v86 & 0xF];
        }
        v78 = objc_alloc(MEMORY[0x24BDD17C8]);
        v79 = v84;
        v80 = 128;
      }
    }
    else if (*(_QWORD *)v120 == 4000)
    {
      v88 = (unsigned __int8 *)v121 + 8;
      v89 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v90 = v89;
      for (k = 0; k != 32; k += 2)
      {
        v92 = *v88++;
        v93 = &v89[k];
        *v93 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v92 >> 4];
        v93[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v92 & 0xF];
      }
      v78 = objc_alloc(MEMORY[0x24BDD17C8]);
      v79 = v90;
      v80 = 32;
    }
    else
    {
      if (*(_QWORD *)v120 != 4001)
        goto LABEL_88;
      v72 = (unsigned __int8 *)v121 + 8;
      v73 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v74 = v73;
      for (m = 0; m != 40; m += 2)
      {
        v76 = *v72++;
        v77 = &v73[m];
        *v77 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v76 >> 4];
        v77[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v76 & 0xF];
      }
      v78 = objc_alloc(MEMORY[0x24BDD17C8]);
      v79 = v74;
      v80 = 40;
    }
    v100 = (void *)objc_msgSend(v78, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v79, v80, 4, 1);
    v81 = objc_msgSend(v100, "hash");

    goto LABEL_85;
  }
  if (*(uint64_t *)v120 <= 2999)
  {
    if (*(_QWORD *)v120 != 1000)
    {
      if (*(_QWORD *)v120 != 2000)
        goto LABEL_88;
LABEL_77:
      v81 = DWORD2(v121[0]);
      goto LABEL_85;
    }
    goto LABEL_71;
  }
  if (*(_QWORD *)v120 == 3000)
    goto LABEL_77;
  if (*(_QWORD *)v120 == 3001)
  {
LABEL_71:
    v81 = *((_QWORD *)&v121[0] + 1);
    goto LABEL_85;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSUInteger _MSVHashGetHash(MSVHash)");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "handleFailureInFunction:file:lineNumber:description:", v102, CFSTR("MSVHasher+Algorithms.h"), 301, CFSTR("Cannot obtain hash from unknown hasher algorithm"));

  v81 = 0;
LABEL_85:
  if ((v19[6] & v81) == v19[7])
    objc_storeStrong((id *)(*(_QWORD *)(v19[5] + 8) + 40), a2);

}

void __110___MPCMusicPlayerControllerServer__onQueue_setNowPlayingItem_itemIdentifier_remoteCommandSenderID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusCode");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 5, CFSTR("Unable to play item %@"), *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79___MPCMusicPlayerControllerServer_setNowPlayingItem_itemIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_setNowPlayingItem:itemIdentifier:remoteCommandSenderID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __62___MPCMusicPlayerControllerServer_getNowPlayingAtIndex_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentItemIDAtIndex:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v6, "itemForContentItemID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_nowPlayingWithItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __55___MPCMusicPlayerControllerServer__nowPlayingWithItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentItemID:", v4);

}

void __55___MPCMusicPlayerControllerServer__nowPlayingWithItem___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentItemID:", v4);

}

void __73___MPCMusicPlayerControllerServer_getNowPlayingsForContentItemIDs_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73___MPCMusicPlayerControllerServer_getNowPlayingsForContentItemIDs_reply___block_invoke_2;
  v9[3] = &unk_24CAB2108;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v4;
  v8 = v3;
  objc_msgSend(v5, "msv_compactMap:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id __73___MPCMusicPlayerControllerServer_getNowPlayingsForContentItemIDs_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemForContentItemID:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_nowPlayingWithItem:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __58___MPCMusicPlayerControllerServer_getNowPlayingWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_nowPlayingWithItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
