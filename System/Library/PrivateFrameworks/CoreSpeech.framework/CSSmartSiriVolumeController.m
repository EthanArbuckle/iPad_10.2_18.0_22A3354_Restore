@implementation CSSmartSiriVolumeController

- (CSSmartSiriVolumeController)init
{
  CSSmartSiriVolumeController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSSmartSiriVolumeController;
  v2 = -[CSSmartSiriVolumeController init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ssv.clientq", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13866;
  v19 = __Block_byref_object_dispose__13867;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CSSmartSiriVolumeController_getVolumeForTTSType_withContext___block_invoke;
  v11[3] = &unk_1E7C26290;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  NSObject *queue;
  _QWORD v4[5];
  float v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__CSSmartSiriVolumeController_setSmartSiriVolumePercentage___block_invoke;
  v4[3] = &unk_1E7C27848;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__CSSmartSiriVolumeController_setSmartSiriVolumeDirection___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__CSSmartSiriVolumeController_setPermanentVolumeOffsetWithDirection___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_createSSVClientConnectionIfNeeded
{
  CSSmartSiriVolumeClient *v3;
  CSSmartSiriVolumeClient *ssvClient;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_ssvClient)
  {
    v3 = objc_alloc_init(CSSmartSiriVolumeClient);
    ssvClient = self->_ssvClient;
    self->_ssvClient = v3;

    -[CSSmartSiriVolumeClient setDelegate:](self->_ssvClient, "setDelegate:", self);
    if (!self->_ssvClient)
    {
      v5 = *MEMORY[0x1E0D18F20];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
      {
        v6 = 136315138;
        v7 = "-[CSSmartSiriVolumeController _createSSVClientConnectionIfNeeded]";
        _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume not available", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (void)didSmartSiriVolumeChangeForReason:(unint64_t)a3
{
  CSSmartSiriVolumeControllerDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v7 = WeakRetained,
        v8 = objc_loadWeakRetained((id *)p_delegate),
        v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "-[CSSmartSiriVolumeController didSmartSiriVolumeChangeForReason:]";
      v15 = 1026;
      v16 = a3;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Notifying SSV Client on Volume change for reason - %{public}d", (uint8_t *)&v13, 0x12u);
    }
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "didTTSVolumeChange:forReason:", self, a3);

  }
  else
  {
    v12 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "-[CSSmartSiriVolumeController didSmartSiriVolumeChangeForReason:]";
      v15 = 1026;
      v16 = a3;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Dropped SSV Client notification for Volume change with reason - %{public}d", (uint8_t *)&v13, 0x12u);
    }
  }
}

- (CSSmartSiriVolumeControllerDelegate)delegate
{
  return (CSSmartSiriVolumeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSSmartSiriVolumeClient)ssvClient
{
  return self->_ssvClient;
}

- (void)setSsvClient:(id)a3
{
  objc_storeStrong((id *)&self->_ssvClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssvClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void *__69__CSSmartSiriVolumeController_setPermanentVolumeOffsetWithDirection___block_invoke(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "_createSSVClientConnectionIfNeeded");
  result = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (result)
    return (void *)objc_msgSend(result, "setPermanentVolumeOffsetWithDirection:", *(unsigned __int8 *)(a1 + 40));
  return result;
}

void *__59__CSSmartSiriVolumeController_setSmartSiriVolumeDirection___block_invoke(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "_createSSVClientConnectionIfNeeded");
  result = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (result)
    return (void *)objc_msgSend(result, "setSmartSiriVolumeDirection:", *(unsigned __int8 *)(a1 + 40));
  return result;
}

void *__60__CSSmartSiriVolumeController_setSmartSiriVolumePercentage___block_invoke(uint64_t a1)
{
  double v2;
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "_createSSVClientConnectionIfNeeded");
  result = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (result)
  {
    LODWORD(v2) = *(_DWORD *)(a1 + 40);
    return (void *)objc_msgSend(result, "setSmartSiriVolumePercentage:", v2);
  }
  return result;
}

void __63__CSSmartSiriVolumeController_getVolumeForTTSType_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  float v10;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSSVClientConnectionIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(v2, "getVolumeForTTSType:withContext:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v7 = *MEMORY[0x1E0D18F20];
    v8 = *MEMORY[0x1E0D18F20];
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v7;
        objc_msgSend(v6, "volumeEstimate");
        v11 = 136315394;
        v12 = "-[CSSmartSiriVolumeController getVolumeForTTSType:withContext:]_block_invoke";
        v13 = 2050;
        v14 = v10;
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Estimated TTS volume : %{public}f", (uint8_t *)&v11, 0x16u);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSSmartSiriVolumeController getVolumeForTTSType:withContext:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get TTS Volume", (uint8_t *)&v11, 0xCu);
    }
  }
}

@end
