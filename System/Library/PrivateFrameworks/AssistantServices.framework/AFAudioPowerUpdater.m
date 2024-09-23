@implementation AFAudioPowerUpdater

- (AFAudioPowerUpdater)initWithProvider:(id)a3 queue:(id)a4 frequency:(int64_t)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  AFAudioPowerUpdater *v14;
  AFAudioPowerUpdater *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AFAudioPowerUpdater;
  v14 = -[AFAudioPowerUpdater init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_provider, a3);
    objc_storeStrong((id *)&v15->_queue, a4);
    v15->_frequency = a5;
    objc_storeWeak((id *)&v15->_delegate, v13);
    v15->_sharedMemory = 0;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[AFAudioPowerUpdater _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFAudioPowerUpdater;
  -[AFAudioPowerUpdater dealloc](&v3, sel_dealloc);
}

- (void)beginUpdate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AFAudioPowerUpdater_beginUpdate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getPowerWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AFAudioPowerUpdater_getPowerWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)endUpdate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AFAudioPowerUpdater_endUpdate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AFAudioPowerUpdater_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)createNewXPCWrapperWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__AFAudioPowerUpdater_createNewXPCWrapperWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_beginUpdate
{
  unint64_t v3;
  uint64_t v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[AFAudioPowerProviding willBeginAccessPower](self->_provider, "willBeginAccessPower");
  v3 = self->_frequency - 1;
  if (v3 <= 2 && !self->_timer)
  {
    v4 = qword_19B0ED6F0[v3];
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, v4, 0);
    objc_initWeak(&location, self);
    v7 = self->_timer;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__AFAudioPowerUpdater__beginUpdate__block_invoke;
    v8[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_endUpdate
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  -[AFAudioPowerProviding didEndAccessPower](self->_provider, "didEndAccessPower");
}

- (void)_timerFired
{
  -[AFAudioPowerUpdater _getPowerWithCompletion:](self, "_getPowerWithCompletion:", 0);
}

- (void)_getPowerWithCompletion:(id)a3
{
  void (**v4)(_QWORD, float, float);
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  AFAudioPowerProviding *provider;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  AFAudioPowerProviding *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD, float, float))a3;
  v11 = 0;
  if (-[AFAudioPowerProviding getAveragePower:andPeakPower:](self->_provider, "getAveragePower:andPeakPower:", (char *)&v11 + 4, &v11))
  {
    LODWORD(v5) = HIDWORD(v11);
    LODWORD(v6) = v11;
    -[AFAudioPowerUpdater _updatePowerWithAveragePower:andPeakPower:](self, "_updatePowerWithAveragePower:andPeakPower:", v5, v6);
    LODWORD(v7) = HIDWORD(v11);
    LODWORD(v8) = v11;
    -[AFAudioPowerUpdater _writeSharedMemoryWithAveragePower:peakPower:](self, "_writeSharedMemoryWithAveragePower:peakPower:", v7, v8);
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v9 = AFSiriLogContextSpeech;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    provider = self->_provider;
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFAudioPowerUpdater _getPowerWithCompletion:]";
    v14 = 2112;
    v15 = provider;
    _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get average power and peak power from audio power provider %@.", buf, 0x16u);
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v4)
LABEL_6:
    v4[2](v4, self->_averagePower, self->_peakPower);
LABEL_7:

}

- (void)_updatePowerWithAveragePower:(float)a3 andPeakPower:(float)a4
{
  AFAudioPowerUpdaterDelegate **p_delegate;
  id WeakRetained;
  char v9;
  double v10;
  double v11;
  id v12;

  self->_averagePower = a3;
  self->_peakPower = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    *(float *)&v10 = a3;
    *(float *)&v11 = a4;
    objc_msgSend(v12, "audioPowerUpdaterDidUpdate:averagePower:peakPower:", self, v10, v11);

  }
}

- (void)_invalidate
{
  AFAudioPowerProviding *provider;

  -[AFAudioPowerUpdater _endUpdate](self, "_endUpdate");
  -[AFAudioPowerUpdater _destroySharedMemory](self, "_destroySharedMemory");
  provider = self->_provider;
  self->_provider = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  *(_QWORD *)&self->_averagePower = 0;
}

- (BOOL)_createSharedMemory
{
  void *sharedMemory;
  double v4;
  double v5;

  sharedMemory = self->_sharedMemory;
  if (!sharedMemory)
  {
    self->_sharedMemory = mmap(0, 8uLL, 2, 4097, -1, 0);
    *(float *)&v4 = self->_averagePower;
    *(float *)&v5 = self->_peakPower;
    -[AFAudioPowerUpdater _writeSharedMemoryWithAveragePower:peakPower:](self, "_writeSharedMemoryWithAveragePower:peakPower:", v4, v5);
    sharedMemory = self->_sharedMemory;
  }
  return sharedMemory != 0;
}

- (id)_createSharedMemoryXPCObject
{
  void *sharedMemory;

  -[AFAudioPowerUpdater _createSharedMemory](self, "_createSharedMemory");
  sharedMemory = self->_sharedMemory;
  if (sharedMemory)
    sharedMemory = xpc_shmem_create(sharedMemory, 8uLL);
  return sharedMemory;
}

- (void)_writeSharedMemoryWithAveragePower:(float)a3 peakPower:(float)a4
{
  float *sharedMemory;

  sharedMemory = (float *)self->_sharedMemory;
  if (sharedMemory)
  {
    *sharedMemory = a3;
    sharedMemory[1] = a4;
  }
}

- (void)_destroySharedMemory
{
  void *sharedMemory;

  sharedMemory = self->_sharedMemory;
  if (sharedMemory)
  {
    munmap(sharedMemory, 8uLL);
    self->_sharedMemory = 0;
  }
}

- (void)_createNewXPCWrapperWithCompletion:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[AFAudioPowerUpdater _createNewXPCWrapper](self, "_createNewXPCWrapper");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)_createNewXPCWrapper
{
  void *v2;
  AFXPCWrapper *v3;

  -[AFAudioPowerUpdater _createSharedMemoryXPCObject](self, "_createSharedMemoryXPCObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[AFXPCWrapper initWithXPCObject:]([AFXPCWrapper alloc], "initWithXPCObject:", v2);
  else
    v3 = 0;

  return v3;
}

- (float)_unsafeAveragePower
{
  int v2;
  float result;
  float v4;

  v4 = 0.0;
  v2 = -[AFAudioPowerProviding getAveragePower:andPeakPower:](self->_provider, "getAveragePower:andPeakPower:", &v4, 0);
  result = v4;
  if (!v2)
    return 0.0;
  return result;
}

- (float)_unsafePeakPower
{
  int v2;
  float result;
  float v4;

  v4 = 0.0;
  v2 = -[AFAudioPowerProviding getAveragePower:andPeakPower:](self->_provider, "getAveragePower:andPeakPower:", 0, &v4);
  result = v4;
  if (!v2)
    return 0.0;
  return result;
}

- (AFAudioPowerProviding)provider
{
  return self->_provider;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __35__AFAudioPowerUpdater__beginUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerFired");

}

uint64_t __57__AFAudioPowerUpdater_createNewXPCWrapperWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createNewXPCWrapperWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__AFAudioPowerUpdater_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __32__AFAudioPowerUpdater_endUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endUpdate");
}

uint64_t __46__AFAudioPowerUpdater_getPowerWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getPowerWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__AFAudioPowerUpdater_beginUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginUpdate");
}

@end
