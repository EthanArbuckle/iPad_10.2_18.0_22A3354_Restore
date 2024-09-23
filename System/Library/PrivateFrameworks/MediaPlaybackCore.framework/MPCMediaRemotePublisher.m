@implementation MPCMediaRemotePublisher

uint64_t __51___MPCMediaRemotePublisher_initWithPlaybackEngine___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSupportedCommands");
}

void __49___MPCMediaRemotePublisher__updateLaunchCommands__block_invoke_2(uint64_t a1, void *a2)
{
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
  id v19;

  v19 = a2;
  objc_msgSend(v19, "playCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  objc_msgSend(v19, "prepareForSetPlaybackQueueCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  objc_msgSend(v19, "setPlaybackQueueCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  objc_msgSend(v19, "setPlaybackQueueCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerSupportedQueueType:", 8);

  objc_msgSend(v19, "setPlaybackQueueCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerSupportedQueueType:", 7);

  objc_msgSend(v19, "setPlaybackQueueCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.music.playbackqueue.radio"));

  objc_msgSend(v19, "setPlaybackQueueCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.music.playbackqueue.tracklist"));

  objc_msgSend(v19, "setPlaybackQueueCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.mediaplayer.playbackcontext"));

  objc_msgSend(v19, "setPlaybackQueueCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"));

  objc_msgSend(*(id *)(a1 + 32), "_supportedSessionTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "disableQHO") & 1) != 0)
  {
    LODWORD(a1) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a1) = objc_msgSend(v14, "isQueueHandoffSupported");

  }
  if (objc_msgSend(v12, "count"))
    a1 = a1;
  else
    a1 = 0;
  objc_msgSend(v19, "setPlaybackSessionCommand");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", a1);

  objc_msgSend(v19, "setPlaybackSessionCommand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSupportedSessionTypes:", v12);

  objc_msgSend(v19, "preloadPlaybackSessionCommand");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", a1);

  objc_msgSend(v19, "preloadPlaybackSessionCommand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSupportedSessionTypes:", v12);

}

uint64_t __49___MPCMediaRemotePublisher__updateLaunchCommands__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __49___MPCMediaRemotePublisher__updateLaunchCommands__block_invoke_2;
  v2[3] = &unk_24CAB28F8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDDCB60], "updateLaunchCommandsWithConfigurationHandler:", v2);
}

void __51___MPCMediaRemotePublisher_initWithPlaybackEngine___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x24BDDC770]);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;
  v5 = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51___MPCMediaRemotePublisher_initWithPlaybackEngine___block_invoke_2;
  block[3] = &unk_24CABA2D0;
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __52___MPCMediaRemotePublisher__updateSupportedCommands__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "__updateSupportedCommands");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  return result;
}

void __64___MPCMediaRemotePublisher_getShouldRestoreStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  char v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "integerValue");
        if (v10 == 122)
        {
          v7 = 1;
        }
        else if (v10 == 133)
        {
          v6 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v11 = (v7 | v6) ^ 1;
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v19 = v11 & 1;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[Publisher] getShouldRestoreState: %{BOOL}u pendingCommands=%{public}@", buf, 0x12u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __80___MPCMediaRemotePublisher__performSkipChapterCommand_withCommandID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "❗️Cannot skip chapter for current item: %{public}@,skipForward failed. Could not skip to the specified time. (error = %{public}@)", buf, 0x16u);
    }

    v6 = (void *)MEMORY[0x24BDDCB80];
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "startTime");
    objc_msgSend(v7, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2004, v3, CFSTR("Failed to jumpToTime:%g"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusWithCode:error:", 200, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v6 = v5;
  v7 = v8;
  msv_dispatch_on_main_queue();

}

void __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32) || (v7 = *(_QWORD *)(a1 + 40)) == 0)
  {
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 48);
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v3;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "❗️Failed to generate playback queue: %{public}@ %{public}@", buf, 0x16u);
    }

    v5 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3000, *(_QWORD *)(a1 + 32), CFSTR("Failed to build playback queue from intent %@"), *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke_516;
    v9[3] = &unk_24CAB9A98;
    v8 = *(void **)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v8, "performSetQueue:completion:", v7, v9);
    v6 = v10;
  }

}

uint64_t __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke_516(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *WeakRetained;
  id v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  const char *v36;
  NSObject *v37;
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v4 = objc_msgSend(v3, "statusCode");
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = v5;
  if (v4)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "interfaceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v7;
    v43 = 2114;
    v44 = v8;
    v45 = 2114;
    v46 = v9;
    v47 = 2114;
    v48 = v3;
    v10 = "❗️-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: type=%{public}@ id=%{public}@ interface=%{publ"
          "ic}@ status=%{public}@";
    v11 = v6;
    v12 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "interfaceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v13;
    v43 = 2114;
    v44 = v14;
    v45 = 2114;
    v46 = v9;
    v47 = 2114;
    v48 = v3;
    v10 = "-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: type=%{public}@ id=%{public}@ interface=%{public"
          "}@ status=%{public}@";
    v11 = v6;
    v12 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_210BD8000, v11, v12, v10, buf, 0x2Au);

LABEL_7:
  v15 = *(void **)(a1 + 64);
  v40[0] = *(_QWORD *)(a1 + 48);
  v39[0] = CFSTR("remote-control-id");
  v39[1] = CFSTR("remote-control-internal-status");
  v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[1] = v17;
  v39[2] = CFSTR("remote-control-status");
  v38 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitEventType:payload:", CFSTR("remote-control-end"), v19);

  if (!v16)
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  objc_msgSend(v3, "analyticSignature");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend(v21, "UTF8String");

  v23 = *(_DWORD *)(a1 + 120);
  if (!v23)
  {
    if (WeakRetained)
    {
      v33 = (void *)WeakRetained[10];
      WeakRetained[10] = 0;

    }
    v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v27 = v34;
    v35 = *(_QWORD *)(a1 + 112);
    if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v34))
      goto LABEL_33;
    *(_DWORD *)buf = 136446210;
    v42 = v22;
    v36 = "PerformCommandPlay";
    goto LABEL_32;
  }
  if (v23 != 122)
  {
    v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v27 = v37;
    v35 = *(_QWORD *)(a1 + 112);
    if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v37))
      goto LABEL_33;
    *(_DWORD *)buf = 136446210;
    v42 = v22;
    v36 = "PerformCommandOther";
LABEL_32:
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v27, OS_SIGNPOST_INTERVAL_END, v35, v36, " enableTelemetry=YES status=%{public, signpost.telemetry:string2, name=status}s", buf, 0xCu);
LABEL_33:

    goto LABEL_34;
  }
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v25 = v24;
  v26 = *(_QWORD *)(a1 + 112);
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 136446210;
    v42 = v22;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PerformCommandSetPlaybackQueue", " enableTelemetry=YES status=%{public, signpost.telemetry:string2, name=status}s", buf, 0xCu);
  }

  if (WeakRetained && !objc_msgSend(v3, "statusCode"))
  {
    v27 = *(id *)(a1 + 56);
    -[NSObject playbackQueue](v27, "playbackQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isRequestingImmediatePlayback") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 72), "player");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "currentItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = objc_retainAutorelease(v28);
        if (objc_msgSend(v31, "_mediaRemotePlaybackQueue"))
        {
          objc_msgSend(v31, "siriReferenceIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
            objc_msgSend(WeakRetained, "_beginBackgroundTaskUntilPlayCommandWithCommand:timeout:", *(_QWORD *)(a1 + 40), 30.0);
        }
      }
    }

    goto LABEL_33;
  }
LABEL_34:
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_267(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  double v15;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "durationIsValid"))
  {
    objc_msgSend(v5, "durationInSeconds");
    v7 = v6;
  }
  else
  {
    v7 = 1.79769313e308;
  }
  objc_msgSend(*(id *)(a1 + 32), "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentTime");
  v10 = v9 + a2;

  if (v10 >= v7)
    v10 = v7;
  objc_msgSend(*(id *)(a1 + 32), "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2;
  v13[3] = &unk_24CAB8400;
  v12 = *(_QWORD *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v10;
  objc_msgSend(v11, "jumpToTime:identifier:completion:", v12, v13, v10);

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_271(uint64_t a1, double a2)
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  double v11;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTime");
  v6 = v5 - a2;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_272;
  v9[3] = &unk_24CAB8400;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = fmax(v6, 0.0);
  objc_msgSend(v7, "jumpToTime:identifier:completion:", v8, v9, v11);

}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_273(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaRemoteOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE65990]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.siri")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MediaAssistant"));

  return v3;
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_279(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaRemoteOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE65990]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(&unk_24CB173B0, "containsObject:", v2);
  return v3;
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (**v7)(void *, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  void (**v18)(void *, _QWORD, void *);
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25[2];

  v5 = a3;
  if ((uint64_t)a2 <= 0)
  {
    v11 = *(_QWORD *)(a1 + 72);
    v12 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 1001, v5, CFSTR("Failed to activate audio session"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "statusWithCode:error:", 200, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_297;
    aBlock[3] = &unk_24CAB2A50;
    v21 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 72);
    v22 = *(id *)(a1 + 40);
    v23 = *(id *)(a1 + 48);
    objc_copyWeak(v25, (id *)(a1 + 80));
    v25[1] = a2;
    v7 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "queueController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v10);
    }
    else
    {
      v15 = *(void **)(a1 + 56);
      v16 = *(_QWORD *)(a1 + 64);
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4;
      v17[3] = &unk_24CAB2A78;
      v18 = v7;
      v19 = *(id *)(a1 + 72);
      objc_msgSend(v15, "_enqueueFallbackIntentIfNeededForCommandEvent:play:completion:", v16, 1, v17);

      v10 = v18;
    }

    objc_destroyWeak(v25);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDDCB80];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2001, a2, CFSTR("Failed to pauseWithFadeout:%g"), *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (**v7)(void *, _QWORD, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  void (**v21)(void *, _QWORD, void *);
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v5 = a3;
  if (a2 <= 0)
  {
    v14 = *(_QWORD *)(a1 + 64);
    v15 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 1001, v5, CFSTR("Cannot toggle play/pause because audio session activation failed."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "statusWithCode:error:", 200, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v17);

  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7;
    aBlock[3] = &unk_24CAB2AC8;
    v27 = *(id *)(a1 + 64);
    v24 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 40);
    v26 = v5;
    v7 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "state");

    if (v9 != 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "leaseManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCanStealLeaseIfNeeded");

    }
    objc_msgSend(*(id *)(a1 + 32), "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v13);
    }
    else
    {
      v18 = *(void **)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 56);
      v20[0] = v6;
      v20[1] = 3221225472;
      v20[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_9;
      v20[3] = &unk_24CAB2A78;
      v21 = v7;
      v22 = *(id *)(a1 + 64);
      objc_msgSend(v18, "_enqueueFallbackIntentIfNeededForCommandEvent:play:completion:", v19, v9 != 2, v20);

      v13 = v21;
    }

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_314(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v14 = 0;
    v5 = objc_msgSend(v4, "canJumpToContentItemID:reason:", v3, &v14);
    v6 = v14;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "jumpToContentItemID:direction:", v3, 2);
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = (void *)MEMORY[0x24BDDCB80];
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 4, CFSTR("Cannot play item in queue due to item policy: %@"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "statusWithCode:error:", 200, v8);
      v13 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v13);

      v6 = (id)v13;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDDCB80];
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3, CFSTR("Cannot find item by trackID: %lld"), *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusWithCode:error:", 100, v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_320(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (void *)MEMORY[0x24BDDCB80];
  v13 = v3;
  if (v3)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 32), "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialPlaybackStartTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v6, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2004, v13, CFSTR("Failed jumpToTime:%lf"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusWithCode:error:", 200, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_323(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "contentItemIDWithCurrentItemOffset:mode:didReachEnd:", a2, 2, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2 >= 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "jumpToFirstContentItemWithSource:", 6);
      v5 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("endOfQueuePause_%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pauseWithFadeout:identifier:completion:", v8, &__block_literal_global_328, 0.0);

      objc_msgSend(*(id *)(a1 + 40), "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didReachEndOfQueueWithReason:", CFSTR("nextTrack"));

    }
  }
  else
  {
    if (a2 < 1)
      v11 = -1;
    else
      v11 = 1;
    objc_msgSend(*(id *)(a1 + 32), "jumpToContentItemID:direction:", v4, v11);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5_335(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6_338(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2005, a2, CFSTR("Failed to begin rewinding"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7_341(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2005, a2, CFSTR("Failed to begin fast-forwarding"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8_346(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDDCB80];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2006, a2, CFSTR("Failed to end scanning"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_351(uint64_t a1, double a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_352;
  v6[3] = &unk_24CABA438;
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "jumpToTime:identifier:completion:", v5, v6, a2);

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_353(id *a1, double a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_354;
  block[3] = &unk_24CAB8450;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v9 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_365(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "upNextBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "targetContentItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_366;
  v5[3] = &unk_24CAB9A98;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performInsertCommand:targetContentItemID:completion:", v3, v4, v5);

}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_369(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4_370(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x24BDDCB80];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3002, a2, CFSTR("Failed to move item: %@"), *(_QWORD *)(a1 + 32));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5_373(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDDCB80];
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3004, a2, CFSTR("Failed to setRepeatType: %ld"), *(_QWORD *)(a1 + 48));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "preservesRepeatMode"))
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMusicRepeatType:", *(_QWORD *)(a1 + 48));

    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6_378(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDDCB80];
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3004, a2, CFSTR("Failed to setRepeatType: %ld"), *(_QWORD *)(a1 + 48));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "preservesRepeatMode"))
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMusicRepeatType:", *(_QWORD *)(a1 + 48));

    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7_379(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDDCB80];
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3005, a2, CFSTR("Failed to setShuffleType: %ld"), *(_QWORD *)(a1 + 48));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "preservesShuffleMode"))
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMusicShuffleType:", *(_QWORD *)(a1 + 48));

    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8_382(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDDCB80];
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3005, a2, CFSTR("Failed to setShuffleType: %ld"), *(_QWORD *)(a1 + 48));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "preservesShuffleMode"))
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMusicShuffleType:", *(_QWORD *)(a1 + 48));

    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_9_383(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "music");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_10;
  v3[3] = &unk_24CAB9A98;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "reshuffleWithTargetContentItemID:completion:", 0, v3);

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3006, a2, CFSTR("Failed to setAutoPlayEnabled: %{BOOL}u"), *(unsigned __int8 *)(a1 + 48));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusWithCode:error:", 200, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "preservesQueueEndAction"))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "queueEndAction") == 3;
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "userIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAutoPlayEnabled:forUserIdentity:", v6, v8);

    }
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x24BDDCB80];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3003, a2, CFSTR("Failed to remove item: %@"), *(_QWORD *)(a1 + 32));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_396(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEC8580]))
  {
    v4 = objc_msgSend(v13, "code");

    v5 = v13;
    if (v4 == -7403)
    {
      v6 = (void *)MEMORY[0x24BDDCB80];
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 102, v13, CFSTR("Account is not authenticated: %@"), *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "statusWithCode:error:", 1401, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

      goto LABEL_8;
    }
  }
  else
  {

    v5 = v13;
  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = (void *)MEMORY[0x24BDDCB80];
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 199, v5, CFSTR("Account failed to prepareToPlay: %@"), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusWithCode:error:", 200, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);
  }
LABEL_8:

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_406(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  const __CFString *v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCError"), 27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 64);
    v6 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 101, v3, CFSTR("SharedQueue feature requires a subscription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = 1004;
LABEL_5:
    objc_msgSend(v8, "statusWithCode:error:", v9, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v12);

    goto LABEL_6;
  }
  objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCPodcastsBehaviorError"), 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v5 = *(_QWORD *)(a1 + 64);
    v11 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 1, v3, CFSTR("No playable content found"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = 100;
    goto LABEL_5;
  }
  objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCMusicBehaviorError"), 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "mpc_clientPreferredLanguages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:localization:", CFSTR("CLEAR_QUEUE_ALERT_MESSAGE"), 0, CFSTR("MediaPlaybackCore"), v15);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:localization:", CFSTR("CLEAR_QUEUE_ALERT_ACTION_CANCEL"), 0, CFSTR("MediaPlaybackCore"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:localization:", CFSTR("CLEAR_QUEUE_ALERT_ACTION_CLEAR"), 0, CFSTR("MediaPlaybackCore"), v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDCB70], "dialogWithTitle:message:", 0, v56);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDCB78], "actionWithTitle:type:commandEvent:", v17, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v20);

    v21 = *(void **)(a1 + 32);
    v61 = CFSTR("selectedAction");
    v62[0] = CFSTR("clearQueue");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "copyWithDialogOptions:", v22);

    objc_msgSend(MEMORY[0x24BDDCB78], "actionWithTitle:type:commandEvent:", v18, 2, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v24);

    v25 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:dialog:", 200, v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

    goto LABEL_6;
  }
  v27 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v3, "mpc_remoteCommandStatus");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v29);

  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "forceDisableUpNext");

  if (v31)
  {
    objc_msgSend(*(id *)(a1 + 40), "queueController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "upNextBehavior");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_25;
    v34 = (void *)v33;
    objc_msgSend(v32, "upNextBehavior");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "allowsQueueModifications");

    if (!v36)
      goto LABEL_25;
    _MPCLogCategoryPlayback();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "engineID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v58 = v38;
      v59 = 2114;
      v60 = v39;
      _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "[PBLSH:%{public}@] _performCommandEvent:%{public}@… | disabling queue modifications [user default forced]", buf, 0x16u);

    }
    objc_msgSend(v32, "upNextBehavior");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    v42 = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "ignoreDisableUpNext");

  if (!v44)
    goto LABEL_26;
  objc_msgSend(*(id *)(a1 + 40), "queueController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "upNextBehavior");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    objc_msgSend(v32, "upNextBehavior");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "allowsQueueModifications");

    if ((v48 & 1) == 0)
    {
      _MPCLogCategoryPlayback();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "engineID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v58 = v50;
        v59 = 2114;
        v60 = v51;
        _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "[PBLSH:%{public}@] _performCommandEvent:%{public}@… | enabling queue modifications [user default ignored]", buf, 0x16u);

      }
      objc_msgSend(v32, "upNextBehavior");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      v42 = 1;
LABEL_24:
      objc_msgSend(v40, "setAllowsQueueModifications:", v42);

      objc_msgSend(*(id *)(a1 + 56), "_updateSupportedCommands");
    }
  }
LABEL_25:

LABEL_26:
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 56), "playbackEngine");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "player");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE654F0], "enterCriticalSection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend(v53, "criticalSectionToken");
      v55 = objc_claimAutoreleasedReturnValue();
      if (v55)
        objc_msgSend(MEMORY[0x24BE654F0], "exitCriticalSection:", v55);
      objc_msgSend(v53, "setCriticalSectionToken:", v54);
    }
    else
    {
      _MPCLogCategoryPlayback();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210BD8000, v55, OS_LOG_TYPE_ERROR, "Failed to claim critical section when launching music", buf, 2u);
      }
    }

  }
LABEL_6:

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_425(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3001, CFSTR("Failed to load playback intent: %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mpc_remoteCommandStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_432(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[3];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v41 = v23;
      v42 = 2114;
      v43 = v7;
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_ERROR, "❗️Failed to generate create-station playback queue: %{public}@ %{public}@", buf, 0x16u);
    }

    v24 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3000, v7, CFSTR("Failed to build create-station playback queue from intent %@"), *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mpc_remoteCommandStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v21);
  }
  else
  {
    v8 = _os_feature_enabled_impl();
    objc_msgSend(*(id *)(a1 + 40), "music");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "contentItemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "prepareForCreateStationAfterContentItemID:", v11);

      v12 = objc_alloc(MEMORY[0x24BDDC760]);
      objc_msgSend(*(id *)(a1 + 56), "commandCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertIntoPlaybackQueueCommand");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = *MEMORY[0x24BE658D0];
      objc_msgSend(*(id *)(a1 + 40), "targetContentItemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x24BE65948];
      v39[0] = v15;
      v39[1] = &unk_24CB16AB8;
      v38[1] = v16;
      v38[2] = CFSTR("MPCPublisherCreateStationCommand");
      v39[2] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v12, "initWithCommand:playbackQueue:options:", v14, v5, v17);

      objc_msgSend(*(id *)(a1 + 40), "music");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "targetContentItemID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_440;
      v34[3] = &unk_24CAB9A98;
      v35 = *(id *)(a1 + 64);
      objc_msgSend(v19, "performInsertCommand:targetContentItemID:completion:", v18, v20, v34);

      v21 = v35;
    }
    else
    {
      objc_msgSend(v9, "setRepeatType:completion:", 0, &__block_literal_global_442);

      v25 = objc_alloc(MEMORY[0x24BDDC760]);
      objc_msgSend(*(id *)(a1 + 56), "commandCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "insertIntoPlaybackQueueCommand");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *MEMORY[0x24BE658D0];
      objc_msgSend(*(id *)(a1 + 40), "targetContentItemID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v25, "initWithCommand:playbackQueue:options:", v27, v5, v29);

      objc_msgSend(*(id *)(a1 + 40), "music");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "targetContentItemID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_443;
      v32[3] = &unk_24CAB9A98;
      v33 = *(id *)(a1 + 64);
      objc_msgSend(v30, "performInsertCommand:targetContentItemID:completion:", v18, v31, v32);

      v21 = v33;
    }
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4_445(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "❗️Reload with playback context failed with error: %{public}@", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3001, v3, CFSTR("Failed to load playback intent: %@"), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mpc_remoteCommandStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_456(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v3 = a2;
  objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCError"), 27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 101, v3, CFSTR("SharedQueue feature requires a subscription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusWithCode:error:", 1004, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_INFO, "Resetting playback rate from handoff", v15, 2u);
    }

    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1.0;
    objc_msgSend(v10, "setPlaybackRate:", v11);

    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "mpc_remoteCommandStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

    }
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_459(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v11[0] = CFSTR("session-id");
  v11[1] = CFSTR("session-migration-error");
  v12[0] = v5;
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emitEventType:payload:", CFSTR("session-migrate-end"), v7);

  if (!v3)
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "mpc_remoteCommandStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);

  }
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_466(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_467;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_483(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  float v8;
  void *WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "❗️Change rate failed. (error = %{public}@)", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x24BDDCB80];
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "playbackRate");
    objc_msgSend(v6, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2003, v3, CFSTR("Failed to setRate:%g"), v8);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusWithCode:error:", 200, WeakRetained);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_updateSupportedCommands");
  }

}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_486(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_491(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  void *v14;
  _MPCSharedListeningTracklistPlaybackContext *v15;
  MPCPlaybackIntent *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v9;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "shareQueue:getTracklist", "error=%{public}@", buf, 0xCu);
  }

  if (v9)
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3000, v9, CFSTR("Unable to build shared queue tracklist from current queue."));
    v15 = (_MPCSharedListeningTracklistPlaybackContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statusWithCode:error:", 200, v15);
    v16 = (MPCPlaybackIntent *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, MPCPlaybackIntent *))(v13 + 16))(v13, v16);
  }
  else
  {
    v15 = objc_alloc_init(_MPCSharedListeningTracklistPlaybackContext);
    -[_MPCSharedListeningTracklistPlaybackContext setTracklist:](v15, "setTracklist:", v7);
    -[_MPCSharedListeningTracklistPlaybackContext setStartItemIndexPath:](v15, "setStartItemIndexPath:", v8);
    v16 = objc_alloc_init(MPCPlaybackIntent);
    -[MPCPlaybackIntent setTracklistToken:](v16, "setTracklistToken:", v15);
    -[MPCPlaybackIntent setTracklistSource:](v16, "setTracklistSource:", 6);
    objc_msgSend(*(id *)(a1 + 32), "mediaRemoteOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("com.apple.music.live-link-identity-json"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEC8838], "payloadValueFromJSONValue:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v21 = v20;
    v22 = *(_QWORD *)(a1 + 48);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "shareQueue:buildIntent", ", buf, 2u);
    }

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_498;
    v24[3] = &unk_24CAB2D78;
    v23 = *(void **)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 48);
    v25 = v23;
    +[MPCPlaybackIntent buildSharedSessionIntentWithIntent:identity:extendedStatusCompletion:](MPCPlaybackIntent, "buildSharedSessionIntentWithIntent:identity:extendedStatusCompletion:", v16, v19, v24);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_509(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setVocalAttenuationEnabled:", *(unsigned __int8 *)(a1 + 56));
    v4 = *(unsigned __int8 *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "vocalAttenuationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCWhiskyController setEnabled:](v5, v4);

    objc_msgSend(*(id *)(a1 + 40), "_updateSupportedCommands");
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v3;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "[AP] - Error reloading asset for VA error:%{public}@", (uint8_t *)&v15, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 0, v3, CFSTR("Reloading the item for vocal attenuation did not succeed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "statusWithCode:error:", 200, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "isVocalAttenuationEnabled");
    objc_msgSend(*(id *)(a1 + 32), "vocalAttenuationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCWhiskyController setEnabled:](v12, v11);

    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_498(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "shareQueue:buildIntent", "status=%{public}@", buf, 0xCu);
  }

  objc_msgSend(v6, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = (void *)MEMORY[0x24BDDCB80];
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3000, v14, CFSTR("Failed to build shared queue intent from current queue."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "statusWithCode:error:", 200, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v16);

  }
  else if (objc_msgSend(v6, "type") == 3)
  {
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "status");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v14);
  }
  else
  {
    objc_msgSend(v5, "sharedListeningProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sessionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "sharedListeningProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sessionKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("?id=%@&key=%@"), v14, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dataUsingEncoding:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:customData:type:", 0, v22, CFSTR("com.apple.music.shared-session-url-components"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

  }
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_467(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubscriptionAdamID:", *(_QWORD *)(a1 + 32));
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_440(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "mpc_remoteCommandStatus");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_443(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "mpc_remoteCommandStatus");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_403()
{
  id v0;

  +[MPCPlaybackPerformanceController sharedController](MPCPlaybackPerformanceController, "sharedController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "warmCDNConnection");

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_401()
{
  OSStatus v0;
  OSStatus v1;
  NSObject *v2;
  int inPropertyData;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  inPropertyData = 1;
  v0 = AudioServicesSetProperty(0x61637474u, 0, 0, 4u, &inPropertyData);
  if (v0)
  {
    v1 = v0;
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v5 = v1;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "[Publisher] Failed to prewarm amps. error: %ld", buf, 0xCu);
    }

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDDCB80];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3005, a2, CFSTR("Failed to reshuffle"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_366(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCError"), 27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 101, v9, CFSTR("SharedQueue feature requires a subscription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusWithCode:error:", 1004, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v9)
      objc_msgSend(v9, "mpc_remoteCommandStatus");
    else
      objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v6);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_354(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "nowPlayingContentItemID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentItemID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {

    goto LABEL_7;
  }
  v6 = v5;
  v7 = objc_msgSend(v4, "isEqual:", v5);

  if ((v7 & 1) != 0)
  {
LABEL_7:
    (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(a1 + 64));
    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "nowPlayingContentItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "❗️SeekToPlaybackPosition failed. Current item has changed: %{public}@ [currentItem is %{public}@]", buf, 0x16u);

  }
  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "nowPlayingContentItemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentItemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3, CFSTR("Cannot seek item (%@) with different current item (%@)"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mpc_remoteCommandStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v16);

LABEL_8:
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_352(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "❗️SeekToPlaybackPosition failed. Could not jump to the specified time. (error = %{public}@)", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x24BDDCB80];
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "positionTime");
    objc_msgSend(v6, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2004, v3, CFSTR("Failed to jumpToTime:%g"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusWithCode:error:", 200, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8;
    v5[3] = &unk_24CABA438;
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v3, "togglePlaybackWithIdentifier:completion:", v4, v5);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "statusCode"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x24BDDCB80];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2002, a2, CFSTR("Failed to toggle playback"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusWithCode:error:", 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_297(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  _QWORD v14[4];
  id v15;
  id v16[2];

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "leaseManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCanStealLeaseIfNeeded");

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = 1.0;
    if (objc_msgSend(*(id *)(a1 + 40), "behaviorType") == 4)
    {
      +[_MPCPodcastsPlaybackRateHelper preferredPlaybackRate](_MPCPodcastsPlaybackRateHelper, "preferredPlaybackRate");
      v7 = v8;
    }
    objc_msgSend(*(id *)(a1 + 32), "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3;
    v14[3] = &unk_24CAB2A28;
    objc_copyWeak(v16, (id *)(a1 + 64));
    v11 = *(id *)(a1 + 56);
    v12 = *(void **)(a1 + 72);
    v15 = v11;
    v16[1] = v12;
    *(float *)&v13 = v7;
    objc_msgSend(v9, "playWithRate:identifier:completion:", v10, v14, v13);

    objc_destroyWeak(v16);
  }

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "statusCode"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (v11)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2000, v11, CFSTR("Failed to playWithRate:1.0"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusWithCode:error:", 200, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

    objc_msgSend(v4, "deactivateAudioSessionIfIdle:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(WeakRetained, "_updateSupportedCommands");
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_272(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "❗️SkipBackward failed. Could not skip to the specified time. (error = %{public}@)", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2004, v3, CFSTR("Failed to jumpToTime:%g"), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusWithCode:error:", 200, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "❗️SkipForward failed. Could not skip to the specified time. (error = %{public}@)", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2004, v3, CFSTR("Failed to jumpToTime:%g"), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusWithCode:error:", 200, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

uint64_t __84___MPCMediaRemotePublisher__beginBackgroundTaskUntilPlayCommandWithCommand_timeout___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53___MPCMediaRemotePublisher___updateSupportedCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2 - 1;
  objc_msgSend(*(id *)(a1 + 32), "setActive:", a2 == 1);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 >= 3)
    objc_msgSend(v5, "addObject:", CFSTR("Item not addable"));
  if (objc_msgSend(v4, "count"))
  {
    if (!objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_MPCMediaRemotePublisher.m"), 1301, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v9, "setUnsupportedReasons:", v4);
    if (objc_msgSend(v9, "hasTargets"))
      objc_msgSend(v9, "removeTarget:action:", 0, 0);
  }
  else
  {
    objc_msgSend(v9, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v9, "hasTargets") & 1) == 0)
      objc_msgSend(v9, "addTarget:action:usingExtendedStatus:", 0, 0, 1);
    objc_msgSend(v9, "setEnabled:", objc_msgSend(v6, "count") == 0);
    objc_msgSend(v9, "setDisabledReasons:", v6);
  }

}

id __53___MPCMediaRemotePublisher___updateSupportedCommands__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("commandType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 == 99990)
    v5 = 0;
  else
    v5 = v2;

  return v5;
}

void __90___MPCMediaRemotePublisher__enqueueFallbackIntentIfNeededForCommandEvent_play_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "mpc_remoteCommandStatus");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE65C40]);
    v9 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2;
    v23[3] = &unk_24CAB26F0;
    v26 = a1[6];
    v10 = v7;
    v24 = v10;
    v11 = v6;
    v25 = v11;
    v12 = (void *)objc_msgSend(v8, "initWithDeallocHandler:", v23);
    v13 = (void *)a1[4];
    v14 = a1[5];
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_3;
    v17[3] = &unk_24CAB2740;
    v22 = a1[6];
    v18 = v10;
    v19 = v12;
    v20 = v11;
    v21 = v5;
    v15 = v12;
    v16 = v10;
    objc_msgSend(v13, "engine:prepareForActivationWithCompletion:", v14, v17);

  }
  else
  {
    v5[2](v5);
  }

}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_5(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x24BE65C40]);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_6;
    v27[3] = &unk_24CABAAA0;
    v31 = a1[6];
    v12 = v10;
    v28 = v12;
    v13 = v9;
    v30 = v13;
    v14 = v7;
    v29 = v14;
    v15 = (void *)objc_msgSend(v11, "initWithDeallocHandler:", v27);
    v16 = (void *)a1[4];
    v17 = a1[5];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_7;
    v20[3] = &unk_24CAB2790;
    v26 = a1[6];
    v21 = v12;
    v22 = v15;
    v24 = v13;
    v23 = v14;
    v25 = v8;
    v18 = v15;
    v19 = v12;
    objc_msgSend(v16, "engine:didFailToActivateWithError:resolution:", v17, v23, v20);

  }
  else
  {
    (*((void (**)(id, id))v9 + 2))(v9, v7);
  }

}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!+[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic"))
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    v5 = os_signpost_id_generate(v4);

    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "publisher:bless", ", buf, 2u);
    }

    v8 = MRMediaRemoteNowPlayingBless();
    if ((v8 & 1) == 0)
    {
      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "_MPCMediaRemotePublisher: Failed to bless application", buf, 2u);
      }

    }
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    v11 = v10;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v8;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v5, "publisher:bless", "success=%{BOOL}u", buf, 8u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_MPCMediaRemotePublisher.m"), 787, CFSTR("Playback engine implementation is nil"));

  }
  objc_msgSend(*(id *)(a1 + 32), "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_118;
  v16[3] = &unk_24CAB27E0;
  v18 = *(_OWORD *)(a1 + 48);
  v17 = v3;
  v14 = v3;
  objc_msgSend(v13, "becomeActiveWithCompletion:", v16);

}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2_123(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[6];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2 < 1)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v5;
      v7 = "_MPCMediaRemotePublisher: Audio session was not activated error=%{public}@";
      v8 = v6;
      v9 = 12;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "becomeActive");
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "_MPCMediaRemotePublisher: Activated audio session [become active]";
      v8 = v6;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 80);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SessionActivation", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "eventStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = *(_QWORD *)(a1 + 40);
  v21[0] = CFSTR("session-activation-id");
  v21[1] = CFSTR("session-activation-activated");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2 > 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v15;
  v21[2] = CFSTR("session-activation-attempts");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v16;
  v21[3] = CFSTR("session-activation-av-time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("session-activation-client-time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v18;
  v21[5] = CFSTR("session-activation-error");
  v19 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitEventType:payload:", CFSTR("session-activation-end"), v20);

  if (!v5)
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_125(id *a1)
{
  void (**v2)(id, _QWORD *);
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2_126;
  v3[3] = &unk_24CAB2880;
  v2 = (void (**)(id, _QWORD *))a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[4];
  v2[2](v2, v3);

}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_7_133(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_8_134;
  v8[3] = &unk_24CAB7570;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_9_135;
  v6[3] = &unk_24CAB9A98;
  v7 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, uint64_t, _QWORD *, _QWORD *))(v5 + 16))(v5, a2, v8, v6);

}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_8_134(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_9_135(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2_126(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a3;
  v6 = v5;
  if (a2 <= 0)
  {
    if (v5)
    {
      v7 = MEMORY[0x24BDAC760];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_3_129;
      v13[3] = &unk_24CAB2858;
      v8 = *(_QWORD *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      v16 = *(id *)(a1 + 32);
      v17 = a2;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_6_132;
      v10[3] = &unk_24CAB8400;
      v11 = *(id *)(a1 + 32);
      v12 = a2;
      (*(void (**)(uint64_t, void *, _QWORD *, _QWORD *))(v8 + 16))(v8, v6, v13, v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 1002, CFSTR("Session activation was cancelled by the user"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_3_129(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_4_130;
  v9[3] = &unk_24CAB7570;
  v3 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_5_131;
  v6[3] = &unk_24CAB8400;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  (*(void (**)(uint64_t, _QWORD *, _QWORD *))(v3 + 16))(v3, v9, v6);

}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_6_132(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_4_130(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_5_131(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_118(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  id v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  dispatch_time_t v12;
  id *v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _QWORD block[4];
  id v20;
  _QWORD v21[2];
  uint8_t buf[4];
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a4;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activationDelay");
  v10 = v9;

  if (v10 <= 0.0)
  {
    v13 = (id *)v18;
    v18[0] = *(id *)(a1 + 32);
    v18[1] = a2;
    v14 = &v17;
    v17 = v7;
    v16 = v7;
    msv_dispatch_on_main_queue();
  }
  else
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v10;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "_MPCMediaRemotePublisher: Delaying audio activation [internal setting]: %gs", buf, 0xCu);
    }

    v12 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_119;
    block[3] = &unk_24CABABE0;
    v13 = (id *)v21;
    v21[0] = *(id *)(a1 + 32);
    v21[1] = a2;
    v14 = &v20;
    v20 = v7;
    v15 = v7;
    dispatch_after(v12, MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_119(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "_MPCMediaRemotePublisher: Finished delaying audio activation [internal setting]", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_120(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_6(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24)
                                                              - v2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_7(uint64_t a1, char a2)
{
  double v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24)
                                                              - v4;
  objc_msgSend(*(id *)(a1 + 40), "disarm");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_8;
  v5[3] = &unk_24CAB2718;
  v9 = a2;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              - v2;
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 53, CFSTR("Delegate failed to call completion for prepareForActivationWithCompletion:"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  double v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24)
                                                              - v6;
  objc_msgSend(*(id *)(a1 + 40), "disarm");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_4;
  v9[3] = &unk_24CAB2718;
  v13 = a2;
  v7 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v7;
  v12 = *(id *)(a1 + 56);
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58___MPCMediaRemotePublisher__activeSharedSessionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = v2;
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 120);
  v4 = v12;
  if (v3 == v12)
  {
LABEL_6:

    goto LABEL_7;
  }
  v5 = v3;
  v6 = objc_msgSend(v3, "isEqual:", v12);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 120), v2);
    v7 = CFSTR("MediaRemote GroupSession started");
    if (!v12)
      v7 = CFSTR("MediaRemote GroupSession ended");
    v8 = *(void **)(a1 + 40);
    v9 = v7;
    objc_msgSend(v8, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queueController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "music");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHostingSharedSessionID:reason:", v12, v9);

    goto LABEL_6;
  }
LABEL_7:

}

void __79___MPCMediaRemotePublisher_commandCenter_didTimeoutCommandEvent_statusHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v20 = CFSTR("remote-control-id");
  objc_msgSend(*(id *)(a1 + 32), "commandID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-begin"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 32), "commandID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5001, CFSTR("Failed to find CommandBegin event for commandID: %@"), v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", 555, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  objc_msgSend(v3, "cursorUntilEvent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("session-activation-begin"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v18 = CFSTR("session-activation-id");
    objc_msgSend(v8, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session-activation-id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("session-activation-end"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5010, CFSTR("Found SessionActivationBegin but not SessionActivationEnd event"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5000, CFSTR("Publisher has no additional info for timeout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", 555, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_8:
}

uint64_t __59___MPCMediaRemotePublisher_engineDidBlockVocalAttenuation___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "vocalAttenuationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCWhiskyController setEnabled:](v2, 0);

  return objc_msgSend(*(id *)(a1 + 40), "_updateSupportedCommands");
}

double __50___MPCMediaRemotePublisher_updatePlaybackMetrics___block_invoke(double a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("duration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5 + a1;

  return v6;
}

void __72___MPCMediaRemotePublisher__leaveSharedSessionWithCommandID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "performSetQueue:completion:", v4, &__block_literal_global_73_3581);

    v5 = *(_QWORD *)(a1 + 40);
    v6 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3100, v10, CFSTR("Failed to load previous session"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusWithCode:error:", 200, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
  }

}

void __72___MPCMediaRemotePublisher__leaveSharedSessionWithCommandID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "mpc_remoteCommandStatus");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

void __94___MPCMediaRemotePublisher_leaveSharedSessionWithCommandID_remoteControlInterface_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __131___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_getTransportablePlaybackSessionRepresentationForRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "preferredSessionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "behaviorType") == 4)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "Asking for Podcasts transportable items", buf, 2u);
      }

      objc_msgSend(v3, "behaviorImpl");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "queueTrackIdentifiers");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 0, &v30);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v30;
      if (v9)
      {
        v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v9;
          _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "Unable to archive Podcasts queue: %{public}@", buf, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        v21 = *(_QWORD *)(a1 + 48);
        v22 = (void *)MEMORY[0x24BDDCAF0];
        objc_msgSend(v3, "sessionID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "responseWithIdentifier:sessionType:data:", v23, v4, v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v24, 0);

      }
    }
    else
    {
      objc_msgSend(v3, "currentItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentItemID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v15 = objc_msgSend(v3, "isExportableSessionType:forContentItemID:reason:", v4, v14, &v29);
      v6 = v29;

      if (v15)
      {
        v16 = (void *)MEMORY[0x24BE65C78];
        v31 = *MEMORY[0x24BDDC530];
        v32 = &unk_24CB16A58;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        objc_msgSend(v16, "encodedDataWithRootObject:userInfo:error:", v3, v17, &v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v28;

        v19 = *(_QWORD *)(a1 + 48);
        if (v7)
        {
          (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(v19, 0, v7);
        }
        else
        {
          v25 = (void *)MEMORY[0x24BDDCAF0];
          objc_msgSend(v3, "sessionID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "responseWithIdentifier:sessionType:data:", v26, v4, v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v27, 0);

        }
      }
      else
      {
        v20 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Session contains non-transportable content reason=%@"), v6);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v7);
      }
    }

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Session is empty"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

  }
}

void __115___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_remoteArtworkForContentItem_format_size_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v5, "jsonRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v7, "dataWithJSONObject:options:error:", v8, 0, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (v10)
    {
      v11 = 0;
      v12 = v6;
      v6 = v10;
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x24BDDCAB0]);
      objc_msgSend(v5, "resolvedURLString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "initWithArtworkURLString:templateData:", v12, v9);
    }

  }
  else
  {
    v11 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __102___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_artworkForContentItem_size_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 29, a3, CFSTR("requestImageWithCompletionHandler: called with nil image."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 1);

}

uint64_t __102___MPCMediaRemotePublisher_PlaybackQueue__playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v31;
  void *v32;
  _QWORD v33[2];
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "findPreviousEventWithType:matchingPayload:", CFSTR("device-changed"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_3;
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("device-metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("focus-mode-private-listening-enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = v9 == 1;
  if (!v9)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "queueSectionID");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!v11)
    {
      v10 = 1;
LABEL_22:

      goto LABEL_23;
    }
    v34 = CFSTR("queue-section-id");
    v35[0] = v11;
    v10 = 1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "payload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("private-listening-source"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      switch(v17)
      {
        case 3:
          objc_msgSend(v14, "payload");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          v20 = CFSTR("queue-reporting-metadata");
LABEL_11:
          objc_msgSend(v18, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v10 = objc_msgSend(v22, "BOOLValue");
LABEL_20:

            goto LABEL_21;
          }
LABEL_16:
          v10 = 1;
          goto LABEL_20;
        case 2:
          objc_msgSend(v14, "payload");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("account-id"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v33[0] = CFSTR("account-begin");
            v33[1] = CFSTR("account-update");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = CFSTR("account-id");
            v32 = v22;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "findPreviousEventWithTypes:matchingPayload:", v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "payload");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("account-metadata"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
              v10 = objc_msgSend(v29, "BOOLValue");
            else
              v10 = 1;

            goto LABEL_20;
          }
          goto LABEL_16;
        case 1:
          objc_msgSend(v5, "payload");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          v20 = CFSTR("device-metadata");
          goto LABEL_11;
      }
      v10 = 1;
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:

  return v10;
}

@end
