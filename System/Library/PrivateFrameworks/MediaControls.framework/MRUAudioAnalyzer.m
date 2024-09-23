@implementation MRUAudioAnalyzer

+ (id)audioAnalyzerForPID:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  MRUAudioAnalyzer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  MRUAudioAnalyzer *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (audioAnalyzerForPID__onceToken != -1)
    dispatch_once(&audioAnalyzerForPID__onceToken, &__block_literal_global_21);
  v5 = (void *)__MRUAudioAnalyzerByPID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (MRUAudioAnalyzer *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[MRUAudioAnalyzer initWithPID:]([MRUAudioAnalyzer alloc], "initWithPID:", v3);
    MCLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412802;
      v13 = a1;
      v14 = 1024;
      v15 = v3;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "%@ Created audio analyzer for PID: %u - %@", (uint8_t *)&v12, 0x1Cu);
    }

    v9 = (void *)__MRUAudioAnalyzerByPID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, v10);

  }
  return v7;
}

void __40__MRUAudioAnalyzer_audioAnalyzerForPID___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__MRUAudioAnalyzerByPID;
  __MRUAudioAnalyzerByPID = v0;

}

- (MRUAudioAnalyzer)initWithPID:(int)a3
{
  MRUAudioAnalyzer *v4;
  MRUAudioAnalyzer *v5;
  uint64_t v6;
  MRUWaveformSettings *settings;
  void *v8;
  float v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *tapQueue;
  uint64_t v12;
  NSHashTable *observers;
  NSObject *v14;
  float **v15;
  int v16;
  unsigned int v17;
  int v18;
  _QWORD v20[4];
  float **v21;
  int v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MRUAudioAnalyzer;
  v4 = -[MRUAudioAnalyzer init](&v23, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    +[MRUWaveformSettings currentSettings](MRUWaveformSettings, "currentSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (MRUWaveformSettings *)v6;

    +[MRUWaveformSettings currentSettings](MRUWaveformSettings, "currentSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "samplingRefreshRate");
    v5->_refreshRate = (int)v9;

    v5->_sampleRate = 48000.0;
    v10 = dispatch_queue_create("com.apple.MediaControls.MRUAudioAnalyzer-tapQueue", 0);
    tapQueue = v5->_tapQueue;
    v5->_tapQueue = (OS_dispatch_queue *)v10;

    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v12;

    v14 = v5->_tapQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __32__MRUAudioAnalyzer_initWithPID___block_invoke;
    v20[3] = &unk_1E581A1B0;
    v15 = v5;
    v21 = v15;
    v22 = a3;
    dispatch_async(v14, v20);
    v16 = (int)(ceilf(v5->_sampleRate / (float)v5->_refreshRate) * 0.5);
    *((_DWORD *)v15 + 2) = v16;
    v17 = vcvtad_u64_f64(log2((double)v16));
    *((_DWORD *)v15 + 3) = v17;
    *((_DWORD *)v15 + 4) = 1 << v17;
    if (1 << v17 >= 0)
      v18 = 1 << v17;
    else
      v18 = (1 << v17) + 1;
    *((_DWORD *)v15 + 5) = v18 >> 1;
    *((float *)v15 + 6) = 2.0 / (float)(v18 >> 1);
    v15[4] = (float *)malloc_type_calloc((uint64_t)v18 >> 1, 4uLL, 0x100004052888210uLL);
    v15[5] = (float *)malloc_type_calloc(*((int *)v15 + 5), 4uLL, 0x100004052888210uLL);
    v15[7] = (float *)malloc_type_calloc(*((int *)v15 + 5), 4uLL, 0x100004052888210uLL);
    v15[6] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    v15[8] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    v15[9] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    v15[10] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    v15[11] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    vDSP_hann_window(v15[8], *((int *)v15 + 4), 2);
    v15[12] = (float *)vDSP_create_fftsetup(*((unsigned int *)v15 + 3), 0);

  }
  return v5;
}

void __32__MRUAudioAnalyzer_initWithPID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0D4B3A0]);
  v3 = *(unsigned int *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 112));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithPID:refreshRate:delegate:", v3, v7, *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v4;

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_isRunning)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - PID=%u running=%@ observers=%lu>"), v4, self, self->_pid, v5, -[NSHashTable count](self->_observers, "count"));
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MRUAudioAnalyzer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "%@ Dealloc", buf, 0xCu);
  }

  free(self->_realBuffer);
  free(self->_imagBuffer);
  free(self->_transferBuffer);
  free(self->_magnitudes);
  free(self->_hannWindow);
  free(self->_leftSamples);
  free(self->_rightSamples);
  free(self->_mixed);
  vDSP_destroy_fftsetup(self->_fftSetup);
  v4.receiver = self;
  v4.super_class = (Class)MRUAudioAnalyzer;
  -[MRUAudioAnalyzer dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MRUAudioAnalyzer *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@ Registered observer: %@", (uint8_t *)&v6, 0x16u);
    }

    -[MRUAudioAnalyzer start](self, "start");
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MRUAudioAnalyzer *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
  MCLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@ Unregistered observer: %@", (uint8_t *)&v6, 0x16u);
  }

  if (!-[NSHashTable count](self->_observers, "count"))
    -[MRUAudioAnalyzer stop](self, "stop");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)start
{
  void *v3;
  NSObject *v4;
  NSObject *tapQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MRUAudioAnalyzer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_isRunning)
  {
    self->_isRunning = 1;
    +[MRUFinishTaskAssertionManager sharedManager](MRUFinishTaskAssertionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "releaseForTaskToken:", self);

    MCLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%@ Starting audio analyzer", buf, 0xCu);
    }

    tapQueue = self->_tapQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__MRUAudioAnalyzer_start__block_invoke;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_async(tapQueue, block);
  }
}

void __25__MRUAudioAnalyzer_start__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tap");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "start");

}

- (void)stop
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *tapQueue;
  _QWORD block[5];
  _QWORD v8[4];
  id v9;
  id location;
  uint8_t buf[4];
  MRUAudioAnalyzer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_isRunning)
  {
    self->_isRunning = 0;
    objc_initWeak(&location, self);
    +[MRUFinishTaskAssertionManager sharedManager](MRUFinishTaskAssertionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __24__MRUAudioAnalyzer_stop__block_invoke;
    v8[3] = &unk_1E5818E18;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "acquireForTaskToken:withReason:invalidationHandler:", self, CFSTR("Stop audio tap"), v8);

    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@ Stopping audio analyzer", buf, 0xCu);
    }

    tapQueue = self->_tapQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __24__MRUAudioAnalyzer_stop__block_invoke_18;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_async(tapQueue, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __24__MRUAudioAnalyzer_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_ERROR, "%@ Task assertion invalidated before tap stopped.", (uint8_t *)&v4, 0xCu);

  }
}

void __24__MRUAudioAnalyzer_stop__block_invoke_18(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tap");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stop");

}

- (id)binSamples:(float *)a3 count:(int)a4
{
  uint64_t v4;
  MRUWaveformData *v7;
  double v8;

  v4 = *(_QWORD *)&a4;
  v7 = [MRUWaveformData alloc];
  *(float *)&v8 = self->_sampleRate;
  return -[MRUWaveformData initWithFFTSamples:count:sampleRate:settings:](v7, "initWithFFTSamples:count:sampleRate:settings:", a3, v4, self->_settings, v8);
}

- (void)processAudioTapDidReceiveAudioSamples:(void *)a3 numberOfSamples:(unsigned int)a4
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[MRUAudioAnalyzer computeFFTWithSamples:](self, "computeFFTWithSamples:", a3, *(_QWORD *)&a4);
  -[MRUAudioAnalyzer binSamples:count:](self, "binSamples:count:", self->_magnitudes, self->_complexCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__MRUAudioAnalyzer_processAudioTapDidReceiveAudioSamples_numberOfSamples___block_invoke;
  v7[3] = &unk_1E5818CB0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __74__MRUAudioAnalyzer_processAudioTapDidReceiveAudioSamples_numberOfSamples___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "audioAnalyzer:didUpdateWaveform:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)processAudioTapDidStop
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MRUAudioAnalyzer_processAudioTapDidStop__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __42__MRUAudioAnalyzer_processAudioTapDidStop__block_invoke(uint64_t a1)
{
  id v2;

  +[MRUFinishTaskAssertionManager sharedManager](MRUFinishTaskAssertionManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseForTaskToken:", *(_QWORD *)(a1 + 32));

}

- (void)computeFFTWithSamples:(float *)a3
{
  MRUAudioAnalyzer *v3;
  const DSPComplex *transferBuffer;
  vDSP_Length complexCount;
  DSPSplitComplex v6;

  v3 = self;
  v6 = *(DSPSplitComplex *)&self->_realBuffer;
  vDSP_vmul(a3, 1, self->_hannWindow, 1, self->_transferBuffer, 1, self->_bufferSizePowerOf2);
  transferBuffer = (const DSPComplex *)v3->_transferBuffer;
  complexCount = v3->_complexCount;
  v3 = (MRUAudioAnalyzer *)((char *)v3 + 20);
  vDSP_ctoz(transferBuffer, 2, &v6, 1, complexCount);
  vDSP_fft_zrip(*(FFTSetup *)((char *)&v3->_leftSamples + 4), &v6, 1, LODWORD(v3[-1]._tapQueue), 1);
  vDSP_zvmags(&v6, 1, *(float **)((char *)&v3->_realBuffer + 4), 1, SLODWORD(v3->super.isa));
  vvsqrtf(*(float **)((char *)&v3->_realBuffer + 4), *(const float **)((char *)&v3->_realBuffer + 4), (const int *)v3);
  vDSP_vsmul(*(const float **)((char *)&v3->_realBuffer + 4), 1, (const float *)&v3->super.isa + 1, *(float **)((char *)&v3->_realBuffer + 4), 1, SLODWORD(v3->super.isa));
}

- (int)pid
{
  return self->_pid;
}

- (MRUWaveformData)waveformData
{
  return self->_waveformData;
}

- (int)refreshRate
{
  return self->_refreshRate;
}

- (void)setRefreshRate:(int)a3
{
  self->_refreshRate = a3;
}

- (float)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(float)a3
{
  self->_sampleRate = a3;
}

- (MRUWaveformSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (MPCProcessAudioTap)tap
{
  return self->_tap;
}

- (void)setTap:(id)a3
{
  objc_storeStrong((id *)&self->_tap, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (OS_dispatch_queue)tapQueue
{
  return self->_tapQueue;
}

- (void)setTapQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tapQueue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_tap, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_waveformData, 0);
}

@end
