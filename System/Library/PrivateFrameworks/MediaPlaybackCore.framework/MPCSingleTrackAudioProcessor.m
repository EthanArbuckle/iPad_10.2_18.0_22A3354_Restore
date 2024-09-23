@implementation MPCSingleTrackAudioProcessor

- (MPCSingleTrackAudioProcessor)initWithPlaybackEngine:(id)a3
{
  id v4;
  MPCSingleTrackAudioProcessor *v5;
  MPCSingleTrackAudioProcessor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCSingleTrackAudioProcessor;
  v5 = -[MPCSingleTrackAudioProcessor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_playbackEngine, v4);

  return v6;
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)dealloc
{
  objc_super v3;

  -[MPCSingleTrackAudioProcessor _destroyAudioTap](self, "_destroyAudioTap");
  v3.receiver = self;
  v3.super_class = (Class)MPCSingleTrackAudioProcessor;
  -[MPCSingleTrackAudioProcessor dealloc](&v3, sel_dealloc);
}

- (opaqueMTAudioProcessingTap)audioProcessingTap
{
  opaqueMTAudioProcessingTap *result;

  result = self->_audioProcessingTap;
  if (!result)
  {
    -[MPCSingleTrackAudioProcessor _createAudioTap](self, "_createAudioTap");
    return self->_audioProcessingTap;
  }
  return result;
}

- (BOOL)configureQueueItem:(id)a3
{
  id v4;
  opaqueMTAudioProcessingTap *v5;
  void *v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t v54[128];
  uint8_t buf[4];
  MPCSingleTrackAudioProcessor *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isAssetLoaded")
    && -[MPCSingleTrackAudioProcessor shouldAttachAudioTapToItem:](self, "shouldAttachAudioTapToItem:", v4))
  {
    v5 = -[MPCSingleTrackAudioProcessor audioProcessingTap](self, "audioProcessingTap");
    objc_msgSend(v4, "playerItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = dispatch_semaphore_create(0);
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__27334;
    v48 = __Block_byref_object_dispose__27335;
    v49 = 0;
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __51__MPCSingleTrackAudioProcessor_configureQueueItem___block_invoke;
    v39[3] = &unk_24CAB9770;
    v42 = &v50;
    v8 = v6;
    v40 = v8;
    v43 = &v44;
    v9 = v7;
    v41 = v9;
    objc_msgSend(v8, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24CB17518, v39);
    v10 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v9, v10))
    {
      v11 = 0;
LABEL_41:

      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(&v50, 8);

      goto LABEL_42;
    }
    v12 = v51[3];
    switch(v12)
    {
      case 2:
        v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v56 = self;
          v57 = 2114;
          v58 = v4;
          _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Tracks loaded for %{public}@ - Setting up audio tap", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x24BDB25A8], "audioMixInputParameters");
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "tracks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setTrackID:](v32, "setTrackID:", objc_msgSend(v17, "trackID"));

        -[NSObject setAudioTapProcessor:](v32, "setAudioTapProcessor:", v5);
        objc_msgSend(v34, "audioMix");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDB25A0], "audioMix");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (v31)
        {
          _MPCLogCategoryPlayback();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v31, "inputParameters");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v56 = self;
            v57 = 2114;
            v58 = v4;
            v59 = 2114;
            v60 = v19;
            _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Found existing audio mix on %{public}@ - Input parameters: %{public}@", buf, 0x20u);

          }
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v31, "inputParameters");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v54, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v36;
            while (2)
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v36 != v22)
                  objc_enumerationMutation(v20);
                v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                if (objc_msgSend(v24, "audioTapProcessor")
                  && (opaqueMTAudioProcessingTap *)objc_msgSend(v24, "audioTapProcessor") == v5)
                {
                  _MPCLogCategoryPlayback();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v56 = self;
                    v57 = 2114;
                    v58 = v4;
                    _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Audio tap already setup [Not changing existing audio mix] - item: %{public}@", buf, 0x16u);
                  }

                  goto LABEL_39;
                }
                if (!objc_msgSend(v24, "audioTapProcessor"))
                  objc_msgSend(v33, "addObject:", v24);
              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v54, 16);
              if (v21)
                continue;
              break;
            }
          }

        }
        objc_msgSend(v33, "addObject:", v32);
        objc_msgSend(v30, "setInputParameters:", v33);
        objc_msgSend(v34, "setAudioMix:", v30);

LABEL_39:
        v11 = 1;
        v13 = v32;
        goto LABEL_40;
      case 3:
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)v45[5];
          *(_DWORD *)buf = 138543874;
          v56 = self;
          v57 = 2114;
          v58 = v4;
          v59 = 2114;
          v60 = v25;
          v14 = "[AP] - %{public}@ - Error loading tracks [No audio tap setup possible] - item: %{public}@ - error: %{public}@";
          v26 = v13;
          v27 = 32;
LABEL_34:
          _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_ERROR, v14, buf, v27);
        }
        break;
      case 4:
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v56 = self;
          v57 = 2114;
          v58 = v4;
          v14 = "[AP] - %{public}@ - Tracks loading cancelled [No audio tap setup possible] - item: %{public}@";
LABEL_33:
          v26 = v13;
          v27 = 22;
          goto LABEL_34;
        }
        break;
      default:
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v56 = self;
          v57 = 2114;
          v58 = v4;
          v14 = "[AP] - %{public}@ - Tracks loading failed without reason [No audio tap setup possible] - item: %{public}@";
          goto LABEL_33;
        }
        break;
    }
    v11 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v11 = 0;
LABEL_42:

  return v11;
}

- (BOOL)shouldAttachAudioTapToItem:(id)a3
{
  return 1;
}

- (unsigned)creationFlags
{
  return 1;
}

- (void)finalizeTap:(opaqueMTAudioProcessingTap *)a3
{
  -[MPCSingleTrackAudioProcessor setSelfRef:](self, "setSelfRef:", 0);
}

- (void)recreateAudioTap
{
  -[MPCSingleTrackAudioProcessor _destroyAudioTap](self, "_destroyAudioTap");
  -[MPCSingleTrackAudioProcessor _createAudioTap](self, "_createAudioTap");
}

- (void)_createAudioTap
{
  MTAudioProcessingTapCreationFlags v3;
  OSStatus v4;
  OSStatus v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __darwin_ct_rune_t v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  MTAudioProcessingTapRef tapOut;
  MTAudioProcessingTapCallbacks callbacks;
  __darwin_ct_rune_t v20[6];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  callbacks.version = 0;
  callbacks.clientInfo = self;
  callbacks.init = (MTAudioProcessingTapInitCallback)_MPCAudioTapInit_27320;
  callbacks.finalize = (MTAudioProcessingTapFinalizeCallback)_MPCAudioTapFinalize_27321;
  callbacks.prepare = (MTAudioProcessingTapPrepareCallback)_MPCAudioTapPrepareCallback_27322;
  callbacks.unprepare = (MTAudioProcessingTapUnprepareCallback)_MPCAudioTapUnprepareCallback_27324;
  callbacks.process = (MTAudioProcessingTapProcessCallback)_MPCAudioTapProcess_27323;
  v3 = -[MPCSingleTrackAudioProcessor creationFlags](self, "creationFlags");
  tapOut = 0;
  v4 = MTAudioProcessingTapCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &callbacks, v3, &tapOut);
  if (!v4)
    goto LABEL_24;
  v5 = v4;
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD1100];
  v8 = v4;
  v21 = *MEMORY[0x24BDD0FC8];
  memset(v20, 0, 20);
  v9 = bswap32(v4);
  *(__darwin_ct_rune_t *)((char *)v20 + 1) = v9;
  v10 = MEMORY[0x24BDAC740];
  if ((v9 & 0x80) != 0)
  {
    if (!__maskrune((char)v9, 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v9 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  v11 = (__int16)v9 >> 8;
  if ((v9 & 0x8000) != 0)
  {
    if (!__maskrune(v11, 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(v10 + 4 * v11 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SHIBYTE(v20[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v20[0]), 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(v10 + 4 * SHIBYTE(v20[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SLOBYTE(v20[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v20[1]), 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(v10 + 4 * SLOBYTE(v20[1]) + 60) & 0x40000) != 0)
  {
LABEL_17:
    strcpy((char *)&v20[1] + 1, "'");
    LOBYTE(v20[0]) = 39;
    goto LABEL_20;
  }
LABEL_19:
  __sprintf_chk((char *)v20, 0, 0x14uLL, "%d", v5);
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  if (!v15)
  {
LABEL_24:
    objc_storeStrong((id *)&self->_selfRef, self);
    v16 = 0;
    self->_audioProcessingTap = tapOut;
    goto LABEL_25;
  }
  v16 = v15;
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v20[0] = 138543618;
    *(_QWORD *)&v20[1] = self;
    LOWORD(v20[3]) = 2114;
    *(_QWORD *)((char *)&v20[3] + 2) = v16;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Error creating audio tap: %{public}@", (uint8_t *)v20, 0x16u);
  }

LABEL_25:
}

- (void)_destroyAudioTap
{
  opaqueMTAudioProcessingTap *audioProcessingTap;

  audioProcessingTap = self->_audioProcessingTap;
  if (audioProcessingTap)
  {
    CFRelease(audioProcessingTap);
    self->_audioProcessingTap = 0;
  }
}

- (MPCSingleTrackAudioProcessing)selfRef
{
  return self->_selfRef;
}

- (void)setSelfRef:(id)a3
{
  objc_storeStrong((id *)&self->_selfRef, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_selfRef, 0);
}

intptr_t __51__MPCSingleTrackAudioProcessor_configureQueueItem___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "statusOfValueForKey:error:", CFSTR("tracks"), &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
