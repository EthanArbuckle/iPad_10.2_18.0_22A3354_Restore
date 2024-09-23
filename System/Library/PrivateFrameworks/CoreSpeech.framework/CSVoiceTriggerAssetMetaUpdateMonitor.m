@implementation CSVoiceTriggerAssetMetaUpdateMonitor

- (CSVoiceTriggerAssetMetaUpdateMonitor)init
{
  CSVoiceTriggerAssetMetaUpdateMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerAssetMetaUpdateMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_gibraltarMacNotifyToken = -1;
    result->_darwinNotifyToken = -1;
  }
  return result;
}

- (const)_asssetMetaUpdatedKey
{
  int v2;
  const char *v3;
  const char *v4;
  int v6;
  const char *v7;

  v2 = objc_msgSend(MEMORY[0x1E0D19260], "supportMphAssets");
  if (CSIsIPad())
  {
    v3 = "com.apple.MobileAsset.VoiceTriggerHSAssetsIPad.ma.cached-metadata-updated";
    v4 = "com.apple.MobileAsset.VoiceTriggerAssetsIPad.ma.cached-metadata-updated";
    goto LABEL_5;
  }
  if (CSIsWatch())
  {
    v3 = "com.apple.MobileAsset.VoiceTriggerHSAssetsWatch.ma.cached-metadata-updated";
    v4 = "com.apple.MobileAsset.VoiceTriggerAssetsWatch.ma.cached-metadata-updated";
LABEL_5:
    if (v2)
      return v4;
    else
      return v3;
  }
  if ((CSIsHorseman() & 1) != 0)
    return "com.apple.MobileAsset.VoiceTriggerAssetsMarsh.ma.cached-metadata-updated";
  if ((CSIsOSX() & 1) != 0)
    return "com.apple.MobileAsset.VoiceTriggerAssetsASMac.ma.cached-metadata-updated";
  if ((CSIsTV() & 1) != 0)
    return "com.apple.MobileAsset.VoiceTriggerAssetsTV.ma.cached-metadata-updated";
  v6 = CSIsIOS();
  v7 = "com.apple.MobileAsset.VoiceTriggerHSAssets.ma.cached-metadata-updated";
  if (v2)
    v7 = "com.apple.MobileAsset.VoiceTriggerAssets.ma.cached-metadata-updated";
  if (v6)
    return v7;
  else
    return "com.apple.MobileAsset.VoiceTriggerAssets.ma.cached-metadata-updated";
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_notifyToken == -1)
  {
    v5 = -[CSVoiceTriggerAssetMetaUpdateMonitor _asssetMetaUpdatedKey](self, "_asssetMetaUpdatedKey");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __66__CSVoiceTriggerAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E7C28DC0;
    handler[4] = self;
    notify_register_dispatch(v5, &self->_notifyToken, v4, handler);
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : VoiceTrigger Asset meta update", buf, 0xCu);
    }
  }
  if (CSIsGibraltarMac())
  {
    if (self->_gibraltarMacNotifyToken == -1)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66__CSVoiceTriggerAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_3;
      v10[3] = &unk_1E7C28DC0;
      v10[4] = self;
      notify_register_dispatch("com.apple.MobileAsset.VoiceTriggerAssetsMac.ma.cached-metadata-updated", &self->_gibraltarMacNotifyToken, v4, v10);
      v7 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Gibraltar VoiceTrigger Asset meta update", buf, 0xCu);
      }
    }
  }
  if (((CSIsOSX() & 1) != 0 || CSIsIOS()) && self->_darwinNotifyToken == -1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__CSVoiceTriggerAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_4;
    v9[3] = &unk_1E7C28DC0;
    v9[4] = self;
    notify_register_dispatch("com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay.ma.cached-metadata-updated", &self->_darwinNotifyToken, v4, v9);
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Studio Display VoiceTrigger Asset meta update", buf, 0xCu);
    }
  }

}

- (void)_stopMonitoring
{
  int notifyToken;
  os_log_t *v4;
  NSObject *v5;
  int gibraltarMacNotifyToken;
  NSObject *v7;
  int darwinNotifyToken;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  notifyToken = self->_notifyToken;
  v4 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : VoiceTrigger Asset meta update", (uint8_t *)&v10, 0xCu);
    }
  }
  if (CSIsGibraltarMac())
  {
    gibraltarMacNotifyToken = self->_gibraltarMacNotifyToken;
    if (gibraltarMacNotifyToken != -1)
    {
      notify_cancel(gibraltarMacNotifyToken);
      self->_gibraltarMacNotifyToken = -1;
      v7 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _stopMonitoring]";
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Gibraltar VoiceTrigger Asset meta update", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  if ((CSIsOSX() & 1) != 0 || CSIsIOS())
  {
    darwinNotifyToken = self->_darwinNotifyToken;
    if (darwinNotifyToken != -1)
    {
      notify_cancel(darwinNotifyToken);
      self->_darwinNotifyToken = -1;
      v9 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _stopMonitoring]";
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Studio Display VoiceTrigger Asset meta update", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)_didReceiveNewVoiceTriggerAssetMetaData
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
    v6 = "-[CSVoiceTriggerAssetMetaUpdateMonitor _didReceiveNewVoiceTriggerAssetMetaData]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s New VoiceTrigger asset metadata is available", buf, 0xCu);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__CSVoiceTriggerAssetMetaUpdateMonitor__didReceiveNewVoiceTriggerAssetMetaData__block_invoke;
  v4[3] = &unk_1E7C29250;
  v4[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "CSVoiceTriggerAssetMetaUpdateMonitor:didReceiveNewVoiceTriggerAssetMetaData:", self, 1);

}

uint64_t __79__CSVoiceTriggerAssetMetaUpdateMonitor__didReceiveNewVoiceTriggerAssetMetaData__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

uint64_t __66__CSVoiceTriggerAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewVoiceTriggerAssetMetaData");
}

uint64_t __66__CSVoiceTriggerAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewVoiceTriggerAssetMetaData");
}

uint64_t __66__CSVoiceTriggerAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewVoiceTriggerAssetMetaData");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_19277 != -1)
    dispatch_once(&sharedInstance_onceToken_19277, &__block_literal_global_19278);
  return (id)sharedInstance__sharedInstance_19279;
}

void __54__CSVoiceTriggerAssetMetaUpdateMonitor_sharedInstance__block_invoke()
{
  CSVoiceTriggerAssetMetaUpdateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerAssetMetaUpdateMonitor);
  v1 = (void *)sharedInstance__sharedInstance_19279;
  sharedInstance__sharedInstance_19279 = (uint64_t)v0;

}

@end
