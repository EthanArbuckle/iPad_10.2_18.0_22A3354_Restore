@implementation CSSpeechEndpointAssetMetaUpdateMonitor

- (CSSpeechEndpointAssetMetaUpdateMonitor)init
{
  CSSpeechEndpointAssetMetaUpdateMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSSpeechEndpointAssetMetaUpdateMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_notifyToken = -1;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  const char *v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD handler[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_notifyToken == -1)
  {
    if (CSIsWatch())
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke;
      v12[3] = &unk_1E7C28DC0;
      v12[4] = self;
      v5 = "com.apple.MobileAsset.SpeechEndpointAssetsWatch.ma.cached-metadata-updated";
      v6 = v12;
    }
    else if (CSIsTV())
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_2;
      v11[3] = &unk_1E7C28DC0;
      v11[4] = self;
      v5 = "com.apple.MobileAsset.SpeechEndpointAssetsTV.ma.cached-metadata-updated";
      v6 = v11;
    }
    else if (CSIsOSX())
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_3;
      v10[3] = &unk_1E7C28DC0;
      v10[4] = self;
      v5 = "com.apple.MobileAsset.SpeechEndpointMacOSAssets.ma.cached-metadata-updated";
      v6 = v10;
    }
    else if (CSIsHorseman())
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_4;
      v9[3] = &unk_1E7C28DC0;
      v9[4] = self;
      v5 = "com.apple.MobileAsset.SpeechEndpointMarshAssets.ma.cached-metadata-updated";
      v6 = v9;
    }
    else
    {
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_5;
      handler[3] = &unk_1E7C28DC0;
      handler[4] = self;
      v5 = "com.apple.MobileAsset.SpeechEndpointAssets.ma.cached-metadata-updated";
      v6 = handler;
    }
    notify_register_dispatch(v5, &self->_notifyToken, v4, v6);
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : speech endpoint asset meta update", buf, 0xCu);
    }
  }

}

- (void)_stopMonitoring
{
  int notifyToken;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : speech endpoint asset meta update", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_didReceiveNewSpeechEndpointAssetMetaData
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSSpeechEndpointAssetMetaUpdateMonitor _didReceiveNewSpeechEndpointAssetMetaData]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s New speech endpoint asset is available", buf, 0xCu);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__CSSpeechEndpointAssetMetaUpdateMonitor__didReceiveNewSpeechEndpointAssetMetaData__block_invoke;
  v4[3] = &unk_1E7C29250;
  v4[4] = self;
  -[CSEventMonitor enumerateObservers:](self, "enumerateObservers:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "CSSpeechEndpointAssetMetaUpdateMonitor:didReceiveNewSpeechEndpointAssetMetaData:", self, 1);

}

uint64_t __83__CSSpeechEndpointAssetMetaUpdateMonitor__didReceiveNewSpeechEndpointAssetMetaData__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

uint64_t __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewSpeechEndpointAssetMetaData");
}

uint64_t __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewSpeechEndpointAssetMetaData");
}

uint64_t __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewSpeechEndpointAssetMetaData");
}

uint64_t __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewSpeechEndpointAssetMetaData");
}

uint64_t __68__CSSpeechEndpointAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewSpeechEndpointAssetMetaData");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12097 != -1)
    dispatch_once(&sharedInstance_onceToken_12097, &__block_literal_global_12098);
  return (id)sharedInstance__sharedInstance_12099;
}

void __56__CSSpeechEndpointAssetMetaUpdateMonitor_sharedInstance__block_invoke()
{
  CSSpeechEndpointAssetMetaUpdateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSSpeechEndpointAssetMetaUpdateMonitor);
  v1 = (void *)sharedInstance__sharedInstance_12099;
  sharedInstance__sharedInstance_12099 = (uint64_t)v0;

}

@end
