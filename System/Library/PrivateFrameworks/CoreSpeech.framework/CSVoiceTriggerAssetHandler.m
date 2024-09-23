@implementation CSVoiceTriggerAssetHandler

- (CSVoiceTriggerAssetHandler)init
{
  CSVoiceTriggerAssetHandler *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSHashTable *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerAssetHandler;
  v2 = -[CSVoiceTriggerAssetHandler init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSVoiceTriggerAssetHandler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

  }
  return v2;
}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CSVoiceTriggerAssetHandler getVoiceTriggerAssetWithEndpointId:completion:]", "CSVoiceTriggerAssetHandler.m", 98, "NO");
}

- (id)defaultFallbackModelIfNil:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[CSVoiceTriggerAssetHandler defaultFallbackModelIfNil:]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Cannot find voicetrigger asset from asset manager, let's fallback to asset in the framework", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D18FC0], "defaultFallBackAssetForVoiceTrigger");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;

  return v7;
}

- (void)registerObserver:(id)a3
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
  v7[2] = __47__CSVoiceTriggerAssetHandler_registerObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)unregisterObserver:(id)a3
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
  v7[2] = __49__CSVoiceTriggerAssetHandler_unregisterObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)notifyObservers:(id)a3 endpointId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CSVoiceTriggerAssetHandler_notifyObservers_endpointId___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __57__CSVoiceTriggerAssetHandler_notifyObservers_endpointId___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_t *v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = (os_log_t *)MEMORY[0x1E0D18F60];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v9 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[CSVoiceTriggerAssetHandler notifyObservers:endpointId:]_block_invoke";
          v16 = 2112;
          v17 = v8;
          _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerAssetHandlerDelegate: %@", buf, 0x16u);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "voiceTriggerAssetHandler:endpointId:didChangeCachedAsset:", a1[4], a1[5], a1[6]);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
    }
    while (v4);
  }

}

uint64_t __49__CSVoiceTriggerAssetHandler_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__CSVoiceTriggerAssetHandler_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1)
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_419);
  return (id)sharedHandler_sharedHandler;
}

+ (id)sharedHandlerDisabledOnDeviceCompilation
{
  if (sharedHandlerDisabledOnDeviceCompilation_onceToken != -1)
    dispatch_once(&sharedHandlerDisabledOnDeviceCompilation_onceToken, &__block_literal_global_1);
  return (id)sharedHandlerDisabledOnDeviceCompilation_sharedHandler;
}

+ (id)assetHandlerFactoryWithDisableOnDeviceCompilation:(BOOL)a3
{
  _BOOL8 v3;
  CSVoiceTriggerAssetHandlerDarwin *v4;
  void *v5;
  int v6;
  __objc2_class *v7;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS"))
  {
    v4 = objc_alloc_init(CSVoiceTriggerAssetHandlerDarwin);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVoiceTriggerAssetOverridingEnabled");

    if (v6)
      v7 = CSVoiceTriggerAssetHandlerFromFile;
    else
      v7 = CSVoiceTriggerAssetHandlerMac;
    v4 = (CSVoiceTriggerAssetHandlerDarwin *)objc_msgSend([v7 alloc], "initWithDisableOnDeviceCompilation:", v3);
  }
  return v4;
}

void __70__CSVoiceTriggerAssetHandler_sharedHandlerDisabledOnDeviceCompilation__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CSVoiceTriggerAssetHandler assetHandlerFactoryWithDisableOnDeviceCompilation:](CSVoiceTriggerAssetHandler, "assetHandlerFactoryWithDisableOnDeviceCompilation:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedHandlerDisabledOnDeviceCompilation_sharedHandler;
  sharedHandlerDisabledOnDeviceCompilation_sharedHandler = v0;

}

void __43__CSVoiceTriggerAssetHandler_sharedHandler__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CSVoiceTriggerAssetHandler assetHandlerFactoryWithDisableOnDeviceCompilation:](CSVoiceTriggerAssetHandler, "assetHandlerFactoryWithDisableOnDeviceCompilation:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedHandler_sharedHandler;
  sharedHandler_sharedHandler = v0;

}

@end
