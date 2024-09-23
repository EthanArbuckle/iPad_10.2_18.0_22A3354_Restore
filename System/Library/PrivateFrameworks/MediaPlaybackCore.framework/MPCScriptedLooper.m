@implementation MPCScriptedLooper

- (AVPlayer)player
{
  return self->_player;
}

- (void)_sharedInitWithItem:(id)a3 audioSession:(id)a4
{
  id v6;
  void *v7;
  id v8;
  AVPlayer *v9;
  AVPlayer *v10;
  AVPlayer *player;
  AVPlayer *v12;
  dispatch_block_t v13;
  id pauseFinishedBlock;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDB2610];
  v8 = a3;
  objc_msgSend(v7, "playerWithPlayerItem:", 0);
  v9 = (AVPlayer *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    -[AVPlayer setAudioSession:](v9, "setAudioSession:", v6);
  -[AVPlayer replaceCurrentItemWithPlayerItem:](v10, "replaceCurrentItemWithPlayerItem:", v8);
  -[AVPlayer setActionAtItemEnd:](v10, "setActionAtItemEnd:", 2);
  player = self->_player;
  self->_player = v10;
  v12 = v10;

  self->_sceneExecutionPaused = 1;
  -[AVPlayer addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, MPCScriptedLooperPlayerStatusKVOContext);
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, MPCScriptedLooperItemStatusKVOContext);

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__MPCScriptedLooper__sharedInitWithItem_audioSession___block_invoke;
  v15[3] = &unk_24CABA2F8;
  objc_copyWeak(&v16, &location);
  v13 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v15);
  pauseFinishedBlock = self->_pauseFinishedBlock;
  self->_pauseFinishedBlock = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

+ (void)setScriptedLoopingDisabled:(BOOL)a3
{
  _MPCScriptedLooperScriptedLoopingDisabled = a3;
}

void __48__MPCScriptedLooper_initWithAsset_audioSession___block_invoke(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD block[4];
  __int128 v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__MPCScriptedLooper_initWithAsset_audioSession___block_invoke_2;
  block[3] = &unk_24CABAB68;
  v2 = *(_OWORD *)(a1 + 32);
  v1 = (id)v2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)MPCScriptedLooperPlayerStatusKVOContext == a6)
  {
    -[MPCScriptedLooper player](self, "player");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "status");

    if (v23 == 1)
    {
      if (-[MPCScriptedLooper isExecutingPauseScene](self, "isExecutingPauseScene"))
        -[MPCScriptedLooper _pause](self, "_pause");
    }
    else if (v23 == 2)
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD1398];
      -[MPCScriptedLooper player](self, "player");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("MPCScriptedLooperErrorDomain"), 4, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCScriptedLooper setError:](self, "setError:", v28);

      goto LABEL_8;
    }
  }
  else if ((void *)MPCScriptedLooperItemStatusKVOContext == a6)
  {
    -[MPCScriptedLooper player](self, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "status");

    if (v15 == 2)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD1398];
      -[MPCScriptedLooper player](self, "player");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("MPCScriptedLooperErrorDomain"), 5, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCScriptedLooper setError:](self, "setError:", v21);

LABEL_8:
      -[MPCScriptedLooper setStatus:](self, "setStatus:", 2);
      -[MPCScriptedLooper pauseScenes](self, "pauseScenes");
    }
  }

}

- (BOOL)isExecutingPauseScene
{
  return self->_executingPauseScene;
}

- (MPCScriptedLooper)initWithAsset:(id)a3 audioSession:(id)a4
{
  id v6;
  id v7;
  MPCScriptedLooper *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  MPCScriptedLooper *v16;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPCScriptedLooper;
  v8 = -[MPCScriptedLooper init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCScriptedLooper _sharedInitWithItem:audioSession:](v8, "_sharedInitWithItem:audioSession:", v9, v7);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__7802;
    v15[4] = __Block_byref_object_dispose__7803;
    v16 = v8;
    v18[0] = CFSTR("metadata");
    v18[1] = CFSTR("duration");
    v18[2] = CFSTR("playable");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__MPCScriptedLooper_initWithAsset_audioSession___block_invoke;
    v12[3] = &unk_24CABAB68;
    v14 = v15;
    v13 = v6;
    objc_msgSend(v13, "loadValuesAsynchronouslyForKeys:completionHandler:", v10, v12);

    _Block_object_dispose(v15, 8);
  }

  return v8;
}

- (MPCScriptedLooper)initWithAsset:(id)a3
{
  return -[MPCScriptedLooper initWithAsset:audioSession:](self, "initWithAsset:audioSession:", a3, 0);
}

- (MPCScriptedLooper)initWithURL:(id)a3 sceneCollection:(id)a4
{
  return -[MPCScriptedLooper initWithURL:sceneCollection:audioSession:](self, "initWithURL:sceneCollection:audioSession:", a3, a4, 0);
}

- (MPCScriptedLooper)initWithURL:(id)a3 sceneCollection:(id)a4 audioSession:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  MPCScriptedLooper *v12;

  v8 = (void *)MEMORY[0x24BDB2378];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "assetWithURL:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPCScriptedLooper initWithAsset:sceneCollection:audioSession:](self, "initWithAsset:sceneCollection:audioSession:", v11, v10, v9);

  return v12;
}

- (MPCScriptedLooper)initWithAsset:(id)a3 sceneCollection:(id)a4
{
  return -[MPCScriptedLooper initWithAsset:sceneCollection:audioSession:](self, "initWithAsset:sceneCollection:audioSession:", a3, a4, 0);
}

- (MPCScriptedLooper)initWithAsset:(id)a3 sceneCollection:(id)a4 audioSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCScriptedLooper *v11;
  MPCScriptedLooper *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPCScriptedLooper;
  v11 = -[MPCScriptedLooper init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sceneCollection, a4);
    v12->_status = 1;
    objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCScriptedLooper _sharedInitWithItem:audioSession:](v12, "_sharedInitWithItem:audioSession:", v13, v10);
    -[MPCScriptedLooper _executeSceneCollection](v12, "_executeSceneCollection");

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[MPCScriptedLooper player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("status"));

  -[MPCScriptedLooper player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("status"));

  -[MPCScriptedLooper player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCScriptedLooper timeObserver](self, "timeObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTimeObserver:", v7);

  v8.receiver = self;
  v8.super_class = (Class)MPCScriptedLooper;
  -[MPCScriptedLooper dealloc](&v8, sel_dealloc);
}

- (void)restartScenes
{
  void *v3;

  -[MPCScriptedLooper setCurrentSceneIndex:](self, "setCurrentSceneIndex:", 0);
  -[MPCScriptedLooper setCurrentLoopCount:](self, "setCurrentLoopCount:", 0);
  if (-[MPCScriptedLooper isExecutingPauseScene](self, "isExecutingPauseScene"))
  {
    -[MPCScriptedLooper setExecutingPauseScene:](self, "setExecutingPauseScene:", 0);
    -[MPCScriptedLooper pauseFinishedBlock](self, "pauseFinishedBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v3);

  }
  -[MPCScriptedLooper _executeSceneCollection](self, "_executeSceneCollection");
}

- (void)playScenes
{
  -[MPCScriptedLooper setSceneExecutionPaused:](self, "setSceneExecutionPaused:", 0);
  -[MPCScriptedLooper _updateRateIfNeeded](self, "_updateRateIfNeeded");
}

- (void)pauseScenes
{
  -[MPCScriptedLooper setSceneExecutionPaused:](self, "setSceneExecutionPaused:", 1);
  -[MPCScriptedLooper _updateRateIfNeeded](self, "_updateRateIfNeeded");
}

- (id)currentScene
{
  void *v3;
  void *v4;
  void *v5;

  -[MPCScriptedLooper sceneCollection](self, "sceneCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", -[MPCScriptedLooper currentSceneIndex](self, "currentSceneIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTimeObserver:(id)a3
{
  id v5;
  id timeObserver;
  void *v7;
  id v8;

  v5 = a3;
  timeObserver = self->_timeObserver;
  if (timeObserver != v5)
  {
    v8 = v5;
    if (timeObserver)
    {
      -[MPCScriptedLooper player](self, "player");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeTimeObserver:", self->_timeObserver);

    }
    objc_storeStrong(&self->_timeObserver, a3);
    v5 = v8;
  }

}

- (void)seekToFrameIfNeeded:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void *v12;
  BOOL v13;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  void *v16;
  NSObject *v17;
  char *v18;
  const __CFAllocator *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  int64_t v27;
  int64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  CMTimeEpoch v33;
  id v34;
  __CFString *v35;
  __int128 v36;
  CMTimeEpoch v37;
  _QWORD v38[4];
  id v39;
  id v40[2];
  id location;
  CMTime time2;
  _QWORD aBlock[4];
  id v44;
  CMTime v45;
  CMTime time1;
  int64_t v47;
  __int16 v48;
  int64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  char *v53;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  memset(&v45, 0, sizeof(v45));
  -[MPCScriptedLooper player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "currentTime");
  else
    memset(&v45, 0, sizeof(v45));

  time1 = v45;
  v9 = -[MPCScriptedLooper frameForCMTime:](self, "frameForCMTime:", &time1);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__MPCScriptedLooper_seekToFrameIfNeeded_completionHandler___block_invoke;
  aBlock[3] = &unk_24CAB9720;
  v34 = v6;
  v44 = v34;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = v10;
  if (v9 + 1 == a3)
    v10[2](v10);
  value = *MEMORY[0x24BDC0D88];
  timescale = *(_DWORD *)(MEMORY[0x24BDC0D88] + 8);
  -[MPCScriptedLooper sceneCollection](self, "sceneCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v33 = epoch;
  if (v13)
  {
    flags = *(_DWORD *)(MEMORY[0x24BDC0D88] + 12);
    if ((flags & 1) != 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[MPCScriptedLooper _CMTimeForFrame:](self, "_CMTimeForFrame:", a3);
  value = time1.value;
  flags = time1.flags;
  timescale = time1.timescale;
  epoch = time1.epoch;
  if ((time1.flags & 1) == 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCScriptedLooperErrorDomain"), 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCScriptedLooper setError:](self, "setError:", v16);

    -[MPCScriptedLooper setStatus:](self, "setStatus:", 2);
    v11[2](v11);
  }
LABEL_11:
  time1 = v45;
  time2.value = value;
  time2.timescale = timescale;
  time2.flags = flags;
  time2.epoch = epoch;
  if (!CMTimeCompare(&time1, &time2))
    v11[2](v11);
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v18 = (char *)os_signpost_id_generate(v17);

  v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  time1.value = value;
  time1.timescale = timescale;
  time1.flags = flags;
  time1.epoch = epoch;
  v35 = (__CFString *)CMTimeCopyDescription(v19, &time1);
  time1 = v45;
  v20 = (__CFString *)CMTimeCopyDescription(v19, &time1);
  -[MPCScriptedLooper player](self, "player");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "asset");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
  v26 = v25;
  if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    v27 = -[MPCScriptedLooper currentSceneIndex](self, "currentSceneIndex");
    v28 = -[MPCScriptedLooper currentLoopCount](self, "currentLoopCount");
    LODWORD(time1.value) = 138544642;
    *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v35;
    LOWORD(time1.flags) = 2114;
    *(_QWORD *)((char *)&time1.flags + 2) = v20;
    HIWORD(time1.epoch) = 2048;
    v47 = v27;
    v48 = 2048;
    v49 = v28;
    v50 = 2114;
    v51 = v24;
    v52 = 2048;
    v53 = v18;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "SeekToTime", "seekToTime: %{public}@ currentTime: %{public}@ currentSceneIndex: %ld currentLoopCount: %ld URL: %{public}@ signpostID: %llu", (uint8_t *)&time1, 0x3Eu);
  }

  if (!-[MPCScriptedLooper isSceneExecutionPaused](self, "isSceneExecutionPaused"))
  {
    -[MPCScriptedLooper player](self, "player");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pause");

  }
  objc_initWeak(&location, self);
  -[MPCScriptedLooper player](self, "player");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "currentItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __59__MPCScriptedLooper_seekToFrameIfNeeded_completionHandler___block_invoke_60;
  v38[3] = &unk_24CAB3F88;
  v40[1] = v18;
  objc_copyWeak(v40, &location);
  v32 = v34;
  v39 = v32;
  time1.value = value;
  time1.timescale = timescale;
  time1.flags = flags;
  time1.epoch = epoch;
  *(_OWORD *)&time2.value = *MEMORY[0x24BDC0D88];
  time2.epoch = v33;
  v36 = *(_OWORD *)&time2.value;
  v37 = v33;
  objc_msgSend(v31, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &time1, &time2, &v36, v38);

  objc_destroyWeak(v40);
  objc_destroyWeak(&location);

}

- (int64_t)frameForCMTime:(id *)a3
{
  double Seconds;
  void *v5;
  double v6;
  int64_t v7;
  CMTime v9;

  v9 = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&v9);
  -[MPCScriptedLooper sceneCollection](self, "sceneCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameRate");
  v7 = (uint64_t)(Seconds * v6);

  return v7;
}

- (void)_createSceneCollectionForAssetWithPreloadedKeys:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MPCScriptedLooper *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MPCScriptedLooper *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint32_t v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  MPCScriptedLooper *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0;
  v5 = objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("metadata"), &v37);
  v6 = v37;
  v7 = v6;
  switch(v5)
  {
    case 0:
    case 1:
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v41 = self;
        v42 = 2048;
        v43 = v5;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "MPCScriptedLooper %p: metadataStatus was %ld.", buf, 0x16u);
      }

      break;
    case 2:
      break;
    case 3:
      v15 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD1398];
      v45[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("MPCScriptedLooperErrorDomain"), 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCScriptedLooper setError:](self, "setError:", v17);

      v18 = self;
      v19 = 2;
      goto LABEL_15;
    case 4:
      v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_INFO, "MPCScriptedLooper %p: Cancelled preloading metadata.", buf, 0xCu);
      }

      v18 = self;
      v19 = 3;
LABEL_15:
      -[MPCScriptedLooper setStatus:](v18, "setStatus:", v19);
      goto LABEL_32;
    default:
      goto LABEL_32;
  }
  v36 = 0;
  v9 = objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("playable"), &v36);
  v10 = v36;
  v11 = v10;
  switch(v9)
  {
    case 0:
    case 1:
      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v41 = self;
        v42 = 2048;
        v43 = v9;
        _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "MPCScriptedLooper %p: playableStatus was %ld.", buf, 0x16u);
      }

      goto LABEL_9;
    case 2:
LABEL_9:
      if (objc_msgSend(v4, "isPlayable"))
      {
        objc_msgSend(v4, "metadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCScriptedSceneCollectionParser sceneCollectionForMetadataItems:](MPCScriptedSceneCollectionParser, "sceneCollectionForMetadataItems:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPCScriptedLooper setSceneCollection:](self, "setSceneCollection:", v14);
        -[MPCScriptedLooper setStatus:](self, "setStatus:", 1);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCScriptedLooperErrorDomain"), 2, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCScriptedLooper setError:](self, "setError:", v21);

LABEL_18:
        v25 = self;
        v26 = 2;
LABEL_22:
        -[MPCScriptedLooper setStatus:](v25, "setStatus:", v26);
      }
LABEL_23:
      v35 = 0;
      v28 = objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("duration"), &v35);
      v29 = v35;
      if (v28 == 4)
      {
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          goto LABEL_30;
        *(_DWORD *)buf = 134217984;
        v41 = self;
        v31 = "MPCScriptedLooper %p: Cancelled preloading duration.";
        v32 = v30;
        v33 = OS_LOG_TYPE_INFO;
        v34 = 12;
        goto LABEL_29;
      }
      if (v28 != 3)
        goto LABEL_31;
      v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v41 = self;
        v42 = 2114;
        v43 = (uint64_t)v29;
        v31 = "MPCScriptedLooper %p: Failed to preload duration. error=%{public}@";
        v32 = v30;
        v33 = OS_LOG_TYPE_ERROR;
        v34 = 22;
LABEL_29:
        _os_log_impl(&dword_210BD8000, v32, v33, v31, buf, v34);
      }
LABEL_30:

LABEL_31:
LABEL_32:
      -[MPCScriptedLooper _executeSceneCollection](self, "_executeSceneCollection");

      return;
    case 3:
      v22 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BDD1398];
      v39 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("MPCScriptedLooperErrorDomain"), 1, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCScriptedLooper setError:](self, "setError:", v24);

      goto LABEL_18;
    case 4:
      v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_INFO, "MPCScriptedLooper %p: Cancelled preloading playable.", buf, 0xCu);
      }

      v25 = self;
      v26 = 3;
      goto LABEL_22;
    default:
      goto LABEL_23;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_CMTimeForFrame:(SEL)a3
{
  int64_t v5;
  double v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v8;

  v5 = 1000 * a4;
  -[MPCScriptedLooper sceneCollection](self, "sceneCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameRate");
  CMTimeMake((CMTime *)retstr, v5, (int)(v6 * 1000.0));

  return result;
}

- (void)_executeSceneCollection
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[MPCScriptedLooper sceneCollection](self, "sceneCollection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3, v5 = objc_msgSend((id)objc_opt_class(), "isScriptedLoopingDisabled"), v4, !v5))
  {
    -[MPCScriptedLooper _executeCurrentScene](self, "_executeCurrentScene");
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x24BDDCAA0]);
    -[MPCScriptedLooper player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDB1FA8];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __44__MPCScriptedLooper__executeSceneCollection__block_invoke;
    v14 = &unk_24CAB3FB0;
    objc_copyWeak(&v15, &location);
    v10 = (void *)objc_msgSend(v6, "initWithName:object:handler:", v9, v8, &v11);
    -[MPCScriptedLooper setItemDidPlayToEndObserver:](self, "setItemDidPlayToEndObserver:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)_executeCurrentScene
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id location;

  -[MPCScriptedLooper setCurrentLoopCount:](self, "setCurrentLoopCount:", 0);
  objc_initWeak(&location, self);
  -[MPCScriptedLooper currentScene](self, "currentScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "startFrame");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__MPCScriptedLooper__executeCurrentScene__block_invoke;
  v5[3] = &unk_24CAB3FD8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[MPCScriptedLooper seekToFrameIfNeeded:completionHandler:](self, "seekToFrameIfNeeded:completionHandler:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_loopIfNeeded
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  id v6;

  -[MPCScriptedLooper currentScene](self, "currentScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iterations");

  if (v4
    && (v5 = -[MPCScriptedLooper currentLoopCount](self, "currentLoopCount") + 1,
        -[MPCScriptedLooper setCurrentLoopCount:](self, "setCurrentLoopCount:", v5),
        v5 >= v4))
  {
    -[MPCScriptedLooper setTimeObserver:](self, "setTimeObserver:", 0);
    -[MPCScriptedLooper setItemDidPlayToEndObserver:](self, "setItemDidPlayToEndObserver:", 0);
    -[MPCScriptedLooper _advanceScene](self, "_advanceScene");
  }
  else
  {
    -[MPCScriptedLooper currentScene](self, "currentScene");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MPCScriptedLooper seekToFrameIfNeeded:completionHandler:](self, "seekToFrameIfNeeded:completionHandler:", objc_msgSend(v6, "startFrame"), 0);

  }
}

- (void)_advanceScene
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[MPCScriptedLooper currentSceneIndex](self, "currentSceneIndex") + 1;
  -[MPCSceneCollection scenes](self->_sceneCollection, "scenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
  {
    -[MPCScriptedLooper restartScenes](self, "restartScenes");
  }
  else
  {
    -[MPCScriptedLooper setCurrentSceneIndex:](self, "setCurrentSceneIndex:", v3);
    -[MPCScriptedLooper _executeCurrentScene](self, "_executeCurrentScene");
  }
}

- (void)_pause
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  dispatch_time_t v16;
  void *v17;
  id v18;

  -[MPCScriptedLooper setExecutingPauseScene:](self, "setExecutingPauseScene:", 1);
  -[MPCScriptedLooper player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");

  if (v5 == 1)
  {
    -[MPCScriptedLooper _updateRateIfNeeded](self, "_updateRateIfNeeded");
    -[MPCScriptedLooper currentScene](self, "currentScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iterations");

    if (v7)
    {
      -[MPCScriptedLooper sceneCollection](self, "sceneCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frameRate");
      v10 = v9;

      if (v10 == 0.0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCScriptedLooper.m"), 452, CFSTR("Scene collection frame rate cannot be 0."));

      }
      -[MPCScriptedLooper currentScene](self, "currentScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (double)objc_msgSend(v11, "iterations");
      -[MPCScriptedLooper sceneCollection](self, "sceneCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frameRate");
      v15 = v12 / v14;

      v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      -[MPCScriptedLooper pauseFinishedBlock](self, "pauseFinishedBlock");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      dispatch_after(v16, MEMORY[0x24BDAC9B8], v18);

    }
  }
}

- (void)_updateRateIfNeeded
{
  id v3;

  if (-[MPCScriptedLooper isExecutingPauseScene](self, "isExecutingPauseScene")
    || -[MPCScriptedLooper isSceneExecutionPaused](self, "isSceneExecutionPaused"))
  {
    -[MPCScriptedLooper player](self, "player");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pause");
  }
  else
  {
    -[MPCScriptedLooper player](self, "player");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "play");
  }

}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)pauseFinishedBlock
{
  return self->_pauseFinishedBlock;
}

- (void)setPauseFinishedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MPCSceneCollection)sceneCollection
{
  return self->_sceneCollection;
}

- (void)setSceneCollection:(id)a3
{
  objc_storeStrong((id *)&self->_sceneCollection, a3);
}

- (id)timeObserver
{
  return self->_timeObserver;
}

- (MPNotificationObserver)itemDidPlayToEndObserver
{
  return self->_itemDidPlayToEndObserver;
}

- (void)setItemDidPlayToEndObserver:(id)a3
{
  objc_storeStrong((id *)&self->_itemDidPlayToEndObserver, a3);
}

- (int64_t)currentSceneIndex
{
  return self->_currentSceneIndex;
}

- (void)setCurrentSceneIndex:(int64_t)a3
{
  self->_currentSceneIndex = a3;
}

- (int64_t)currentLoopCount
{
  return self->_currentLoopCount;
}

- (void)setCurrentLoopCount:(int64_t)a3
{
  self->_currentLoopCount = a3;
}

- (void)setExecutingPauseScene:(BOOL)a3
{
  self->_executingPauseScene = a3;
}

- (BOOL)isSceneExecutionPaused
{
  return self->_sceneExecutionPaused;
}

- (void)setSceneExecutionPaused:(BOOL)a3
{
  self->_sceneExecutionPaused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemDidPlayToEndObserver, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_sceneCollection, 0);
  objc_storeStrong(&self->_pauseFinishedBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

void __41__MPCScriptedLooper__executeCurrentScene__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "startFrame");
  objc_msgSend(WeakRetained, "currentScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "endFrame");

  if (v5 == v7)
  {
    objc_msgSend(WeakRetained, "_pause");
  }
  else
  {
    objc_msgSend(WeakRetained, "currentScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "endFrame");

    if (v9 == -1)
    {
      v13 = objc_alloc(MEMORY[0x24BDDCAA0]);
      objc_msgSend(*(id *)(a1 + 32), "player");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __41__MPCScriptedLooper__executeCurrentScene__block_invoke_2;
      v28[3] = &unk_24CAB3FB0;
      objc_copyWeak(&v29, v2);
      v16 = (void *)objc_msgSend(v13, "initWithName:object:handler:", *MEMORY[0x24BDB1FA8], v15, v28);
      objc_msgSend(WeakRetained, "setItemDidPlayToEndObserver:", v16);

      objc_destroyWeak(&v29);
    }
    else
    {
      v26 = 0uLL;
      v27 = 0;
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "currentScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "endFrame");
      if (v10)
      {
        objc_msgSend(v10, "_CMTimeForFrame:", v12 + 1);
      }
      else
      {
        v26 = 0uLL;
        v27 = 0;
      }

      objc_msgSend(*(id *)(a1 + 32), "player");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;
      v25 = v27;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC9B8];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __41__MPCScriptedLooper__executeCurrentScene__block_invoke_3;
      v22[3] = &unk_24CABA2F8;
      objc_copyWeak(&v23, v2);
      objc_msgSend(v17, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v19, MEMORY[0x24BDAC9B8], v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setTimeObserver:", v21);

      objc_destroyWeak(&v23);
    }
  }

}

void __41__MPCScriptedLooper__executeCurrentScene__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_loopIfNeeded");
    WeakRetained = v2;
  }

}

void __41__MPCScriptedLooper__executeCurrentScene__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_loopIfNeeded");
    WeakRetained = v2;
  }

}

void __44__MPCScriptedLooper__executeSceneCollection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "seekToFrameIfNeeded:completionHandler:", 0, 0);
    WeakRetained = v2;
  }

}

uint64_t __59__MPCScriptedLooper_seekToFrameIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __59__MPCScriptedLooper_seekToFrameIfNeeded_completionHandler___block_invoke_60(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SeekToTime", "finished: %{BOOL}d", (uint8_t *)v10, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isSceneExecutionPaused") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "play");

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, a2);

}

void __54__MPCScriptedLooper__sharedInitWithItem_audioSession___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExecutingPauseScene:", 0);
  objc_msgSend(WeakRetained, "_updateRateIfNeeded");
  objc_msgSend(WeakRetained, "_advanceScene");

}

uint64_t __48__MPCScriptedLooper_initWithAsset_audioSession___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), "_createSceneCollectionForAssetWithPreloadedKeys:", *(_QWORD *)(result + 32));
  return result;
}

+ (BOOL)isScriptedLoopingDisabled
{
  return _MPCScriptedLooperScriptedLoopingDisabled;
}

@end
