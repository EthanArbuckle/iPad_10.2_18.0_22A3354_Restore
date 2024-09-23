@implementation CSOnDeviceCachedIrPurgingHandler

- (CSOnDeviceCachedIrPurgingHandler)init
{
  CSOnDeviceCachedIrPurgingHandler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSOnDeviceCachedIrPurgingHandler;
  v2 = -[CSOnDeviceCachedIrPurgingHandler init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("CSOnDeviceCachedIrPurgingHandler", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  +[CSAttSiriMitigationAssetHandler sharedHandler](CSAttSiriMitigationAssetHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)CSOnDeviceCachedIrPurgingHandler;
  -[CSOnDeviceCachedIrPurgingHandler dealloc](&v6, sel_dealloc);
}

- (void)startRegistration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSOnDeviceCachedIrPurgingHandler startRegistration]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s onDevice cached purgedHandler starts", (uint8_t *)&v7, 0xCu);
  }
  +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:", self);

  +[CSAttSiriMitigationAssetHandler sharedHandler](CSAttSiriMitigationAssetHandler, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", self);

  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

}

- (void)cleanUpCachedIrDir
{
  dispatch_async((dispatch_queue_t)self->_queue, &__block_literal_global_7);
}

- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[CSOnDeviceCachedIrPurgingHandler voiceTriggerAssetHandler:endpointId:didChangeCachedAsset:]";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s received notification to purge voice trigger asset with endPoint id: %@", (uint8_t *)&v10, 0x16u);
  }
  -[CSOnDeviceCachedIrPurgingHandler _purgeCachedIrFilesWithAsset:](self, "_purgeCachedIrFilesWithAsset:", v8);

}

- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[CSOnDeviceCachedIrPurgingHandler mitigationAssetHandler:endpointId:didChangeCachedAsset:]";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s received notification to purge mitigation asset with endPoint id: %@", (uint8_t *)&v10, 0x16u);
  }
  -[CSOnDeviceCachedIrPurgingHandler _purgeCachedIrFilesWithAsset:](self, "_purgeCachedIrFilesWithAsset:", v8);

}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSOnDeviceCachedIrPurgingHandler CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger is disabled, clean up cached ir path", (uint8_t *)&v8, 0xCu);
    }
    -[CSOnDeviceCachedIrPurgingHandler _cleanUpOnDeviceCompilationPath](self, "_cleanUpOnDeviceCompilationPath");
  }

}

- (void)_cleanUpOnDeviceCompilationPath
{
  dispatch_async((dispatch_queue_t)self->_queue, &__block_literal_global_10);
}

- (void)_purgeCachedIrFilesWithAsset:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((CSIsHorseman() & 1) != 0)
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSOnDeviceCachedIrPurgingHandler _purgeCachedIrFilesWithAsset:]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s purging for specific device is not handled here", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__CSOnDeviceCachedIrPurgingHandler__purgeCachedIrFilesWithAsset___block_invoke;
    block[3] = &unk_1E7C292C8;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__CSOnDeviceCachedIrPurgingHandler__purgeCachedIrFilesWithAsset___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0D19108];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getOnDeviceCompilationCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "purgeCachedIrForTrialAssetExcludingCurrentAsset:baseCachedIrDir:", v2, v3);

}

uint64_t __67__CSOnDeviceCachedIrPurgingHandler__cleanUpOnDeviceCompilationPath__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D19108], "removeOnDeviceCachedPath");
}

void __54__CSOnDeviceCachedIrPurgingHandler_cleanUpCachedIrDir__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getOnDeviceCompilationCacheDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getLegacyOnDeviceCompilationCacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D19108], "cleanUpPreviousBuildBnnsIrInCachedIrDir:", v3);
  objc_msgSend(MEMORY[0x1E0D19108], "cleanUpLegacyCachedIrDir:", v2);

}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken_1066 != -1)
    dispatch_once(&sharedHandler_onceToken_1066, &__block_literal_global_1067);
  return (id)sharedHandler_sharedHandler_1068;
}

void __49__CSOnDeviceCachedIrPurgingHandler_sharedHandler__block_invoke()
{
  CSOnDeviceCachedIrPurgingHandler *v0;
  void *v1;

  v0 = objc_alloc_init(CSOnDeviceCachedIrPurgingHandler);
  v1 = (void *)sharedHandler_sharedHandler_1068;
  sharedHandler_sharedHandler_1068 = (uint64_t)v0;

}

@end
