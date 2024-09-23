@implementation MPCAudioSpectrumAnalyzer

uint64_t __63__MPCAudioSpectrumAnalyzer_initWithPlaybackEngine_refreshRate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createAudioTap");
}

- (void)_createAudioTap
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProcessTapEnabled");

  if (v4)
    -[MPCAudioSpectrumAnalyzer _createProcessTap](self, "_createProcessTap");
  else
    -[MPCAudioSpectrumAnalyzer _createQueueTap](self, "_createQueueTap");
}

- (void)_createProcessTap
{
  MPCProcessAudioTap *v3;
  MPCProcessAudioTap *processAudioTap;
  _MPCAudioSpectrumAnalyzerStorage *v5;
  uint64_t v6;
  double v7;
  _MPCAudioSpectrumAnalyzerStorage *v8;
  id WeakRetained;

  v3 = -[MPCProcessAudioTap initWithRefreshRate:delegate:]([MPCProcessAudioTap alloc], "initWithRefreshRate:delegate:", self->_refreshRate, self);
  processAudioTap = self->_processAudioTap;
  self->_processAudioTap = v3;

  v5 = [_MPCAudioSpectrumAnalyzerStorage alloc];
  v6 = -[MPCProcessAudioTap numberOfFrames](self->_processAudioTap, "numberOfFrames");
  *(float *)&v7 = (float)-[MPCProcessAudioTap sampleRate](self->_processAudioTap, "sampleRate");
  v8 = -[_MPCAudioSpectrumAnalyzerStorage initWithMaximumNumberOfFrames:sampleRate:](v5, "initWithMaximumNumberOfFrames:sampleRate:", v6, v7);
  -[MPCAudioSpectrumAnalyzer setStorage:](self, "setStorage:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  objc_msgSend(WeakRetained, "addEngineObserver:", self);

}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (MPCAudioSpectrumAnalyzer)initWithPlaybackEngine:(id)a3 refreshRate:(id)a4
{
  id v6;
  id v7;
  MPCAudioSpectrumAnalyzer *v8;
  MPCAudioSpectrumAnalyzer *v9;
  _QWORD block[4];
  MPCAudioSpectrumAnalyzer *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPCAudioSpectrumAnalyzer;
  v8 = -[MPCAudioSpectrumAnalyzer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    objc_storeStrong((id *)&v9->_refreshRate, a4);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__MPCAudioSpectrumAnalyzer_initWithPlaybackEngine_refreshRate___block_invoke;
    block[3] = &unk_24CABA2D0;
    v12 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v9;
}

- (MPCAudioSpectrumAnalyzer)initWithPlaybackEngine:(id)a3
{
  return -[MPCAudioSpectrumAnalyzer initWithPlaybackEngine:refreshRate:](self, "initWithPlaybackEngine:refreshRate:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[MPCAudioSpectrumAnalyzer setStorage:](self, "setStorage:", 0);
  -[MPCAudioSpectrumAnalyzer _destroyAudioTap](self, "_destroyAudioTap");
  v3.receiver = self;
  v3.super_class = (Class)MPCAudioSpectrumAnalyzer;
  -[MPCAudioSpectrumAnalyzer dealloc](&v3, sel_dealloc);
}

- (void)configurePlayerItem:(id)a3
{
  id v4;

  v4 = a3;
  if (-[MPCAudioSpectrumAnalyzer _shouldAttachAudioTap](self, "_shouldAttachAudioTap"))
    objc_msgSend(v4, "setAudioTapProcessor:", self->_audioProcessingTap);

}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (a4 == 1)
  {
    -[MPCAudioSpectrumAnalyzer observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[MPCAudioSpectrumAnalyzer processAudioTap](self, "processAudioTap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");

    }
  }
  else if (a4 - 2 <= 2)
  {
    -[MPCAudioSpectrumAnalyzer processAudioTap](self, "processAudioTap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stop");

    -[MPCAudioSpectrumAnalyzer _resetObservers](self, "_resetObservers");
  }

}

- (void)registerObserver:(id)a3
{
  MPCAudioSpectrumAnalyzer *v4;
  id v5;
  NSMutableArray *observers;
  uint64_t v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = v10;
  observers = v4->_observers;
  if (!observers)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v8 = v4->_observers;
    v4->_observers = (NSMutableArray *)v7;

    observers = v4->_observers;
    v5 = v10;
  }
  -[NSMutableArray addObject:](observers, "addObject:", v5);
  -[MPCAudioSpectrumAnalyzer processAudioTap](v4, "processAudioTap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "start");

  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  MPCAudioSpectrumAnalyzer *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_observers, "removeObject:", v6);
  if (!-[NSMutableArray count](v4->_observers, "count"))
  {
    -[MPCAudioSpectrumAnalyzer processAudioTap](v4, "processAudioTap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");

  }
  objc_sync_exit(v4);

}

- (void)_resetObservers
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_observers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "beginReport", (_QWORD)v8);
        objc_msgSend(v7, "finishReport");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)_shouldAttachAudioTap
{
  void *v2;
  char v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDDC6D0], "systemRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeviceRoute");
  v4 = v3 & (objc_msgSend(v2, "isAirPlayingToDevice") ^ 1);

  return v4;
}

- (void)_createQueueTap
{
  if (!MTMultitrackAudioProcessingTapCreate())
  {
    objc_storeStrong((id *)&self->_selfRef, self);
    self->_audioProcessingTap = 0;
  }
}

- (void)_destroyAudioTap
{
  if (self->_processAudioTap)
    -[MPCAudioSpectrumAnalyzer _destroyProcessTap](self, "_destroyProcessTap");
  if (self->_audioProcessingTap)
    -[MPCAudioSpectrumAnalyzer _destroyQueueTap](self, "_destroyQueueTap");
}

- (void)_destroyProcessTap
{
  MPCProcessAudioTap *processAudioTap;

  processAudioTap = self->_processAudioTap;
  self->_processAudioTap = 0;

}

- (void)_destroyQueueTap
{
  CFRelease(self->_audioProcessingTap);
  self->_audioProcessingTap = 0;
}

- (void)_analyzeSamples:(AudioBufferList *)a3 numberFrames:(int64_t)a4
{
  MPCAudioSpectrumAnalyzer *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = self;
  objc_sync_enter(v6);
  -[MPCAudioSpectrumAnalyzer observers](v6, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[MPCAudioSpectrumAnalyzer storage](v6, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v9, "maxNumberOfFrames") >= a4)
    {
      objc_msgSend(v9, "analyzeFrequencies:numberFrames:observers:", a3, a4, v8);
    }
    else
    {
      v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 134218240;
        v12 = a4;
        v13 = 2048;
        v14 = objc_msgSend(v9, "maxNumberOfFrames");
        _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "[AP] - Audio tap reported audio buffer list samples before we had an appropriately sized buffer (numberOfFrames:%ld storageBufferSize:%ld)", (uint8_t *)&v11, 0x16u);
      }

    }
  }

}

- (void)_analyzeAudioData:(void *)a3 numberOfFrames:(unsigned int)a4
{
  uint64_t v4;
  MPCAudioSpectrumAnalyzer *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = self;
  objc_sync_enter(v6);
  -[MPCAudioSpectrumAnalyzer observers](v6, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[MPCAudioSpectrumAnalyzer storage](v6, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v9, "maxNumberOfFrames") >= v4)
    {
      objc_msgSend(v9, "analyzeAudioData:numberFrames:observers:", a3, v4, v8);
    }
    else
    {
      v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 134218240;
        v12 = v4;
        v13 = 2048;
        v14 = objc_msgSend(v9, "maxNumberOfFrames");
        _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "[AP] - Audio tap reported audio samples before we had an appropriately sized buffer (numberOfFrames:%ld storageBufferSize:%ld)", (uint8_t *)&v11, 0x16u);
      }

    }
  }

}

- (void)_prepareTap:(opaqueMTAudioProcessingTap *)a3 maxFrames:(int64_t)a4 processingFormat:(const AudioStreamBasicDescription *)a5
{
  MPCAudioSpectrumAnalyzer *v7;
  float mSampleRate;
  float v9;
  float v10;
  void *v11;
  _MPCAudioSpectrumAnalyzerStorage *v12;
  double v13;
  uint64_t v14;
  MPCAudioSpectrumAnalyzer *v15;
  id v16;

  v7 = self;
  objc_sync_enter(v7);
  -[MPCAudioSpectrumAnalyzer storage](v7, "storage");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  mSampleRate = a5->mSampleRate;
  objc_msgSend(v16, "sampleRate");
  v10 = v9;
  if (objc_msgSend(v16, "maxNumberOfFrames") < a4 || vabds_f32(v10, mSampleRate) >= 0.00000011921)
  {
    v12 = [_MPCAudioSpectrumAnalyzerStorage alloc];
    *(float *)&v13 = mSampleRate;
    v14 = -[_MPCAudioSpectrumAnalyzerStorage initWithMaximumNumberOfFrames:sampleRate:](v12, "initWithMaximumNumberOfFrames:sampleRate:", a4, v13);

    v15 = v7;
    objc_sync_enter(v15);
    -[MPCAudioSpectrumAnalyzer setStorage:](v15, "setStorage:", v14);
    objc_sync_exit(v15);

    v11 = (void *)v14;
  }
  else
  {
    v11 = v16;
  }

}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (NSNumber)refreshRate
{
  return self->_refreshRate;
}

- (_MPCAudioSpectrumAnalyzerStorage)storage
{
  return self->_storage;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (MPCProcessAudioTap)processAudioTap
{
  return self->_processAudioTap;
}

- (void)setProcessAudioTap:(id)a3
{
  objc_storeStrong((id *)&self->_processAudioTap, a3);
}

- (MPCAudioSpectrumAnalyzer)selfRef
{
  return self->_selfRef;
}

- (void)setSelfRef:(id)a3
{
  objc_storeStrong((id *)&self->_selfRef, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_processAudioTap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_refreshRate, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end
