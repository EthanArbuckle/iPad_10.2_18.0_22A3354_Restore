@implementation CSSiriVibrationManager

- (CSSiriVibrationManager)init
{
  CSSiriVibrationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _QWORD block[4];
  CSSiriVibrationManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSSiriVibrationManager;
  v2 = -[CSSiriVibrationManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.assistant.vibration-manager", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__CSSiriVibrationManager_init__block_invoke;
    block[3] = &unk_1E7C292C8;
    v9 = v2;
    dispatch_async(v6, block);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  if (self->_ringVibrationState || self->_silentVibrationState)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, (const void *)kVibrationPreferenceObserver);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSSiriVibrationManager;
  -[CSSiriVibrationManager dealloc](&v4, sel_dealloc);
}

- (BOOL)vibratesForDeviceRingerSwitchState:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (BOOL)_ringVibrationValue
{
  int64_t ringVibrationState;
  __CFNotificationCenter *DarwinNotifyCenter;

  ringVibrationState = self->_ringVibrationState;
  if (!ringVibrationState)
  {
    -[CSSiriVibrationManager _fetchRingVibrationValue](self, "_fetchRingVibrationValue");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)kVibrationPreferenceObserver, (CFNotificationCallback)_ringVibrationPreferenceDidChangeCallback, CFSTR("com.apple.springboard.ring-vibrate.changed"), 0, CFNotificationSuspensionBehaviorCoalesce);
    ringVibrationState = self->_ringVibrationState;
  }
  return ringVibrationState == 2;
}

- (BOOL)_silentVibrationValue
{
  int64_t silentVibrationState;
  __CFNotificationCenter *DarwinNotifyCenter;

  silentVibrationState = self->_silentVibrationState;
  if (!silentVibrationState)
  {
    -[CSSiriVibrationManager _fetchSilentVibrationValue](self, "_fetchSilentVibrationValue");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)kVibrationPreferenceObserver, (CFNotificationCallback)_silentVibrationPreferenceDidChangeCallback, CFSTR("com.apple.springboard.silent-vibrate.changed"), 0, CFNotificationSuspensionBehaviorCoalesce);
    silentVibrationState = self->_silentVibrationState;
  }
  return silentVibrationState == 2;
}

- (void)_fetchRingVibrationValue
{
  os_log_t *v3;
  NSObject *v4;
  int64_t VibrationState;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[CSSiriVibrationManager _fetchRingVibrationValue]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  VibrationState = _fetchVibrationState(CFSTR("ring-vibrate"));
  self->_ringVibrationState = VibrationState;
  v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("Off");
    if (VibrationState == 2)
      v7 = CFSTR("On");
    v8 = 136315394;
    v9 = "-[CSSiriVibrationManager _fetchRingVibrationValue]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_fetchSilentVibrationValue
{
  os_log_t *v3;
  NSObject *v4;
  int64_t VibrationState;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A8];
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[CSSiriVibrationManager _fetchSilentVibrationValue]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  VibrationState = _fetchVibrationState(CFSTR("silent-vibrate"));
  self->_silentVibrationState = VibrationState;
  v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("Off");
    if (VibrationState == 2)
      v7 = CFSTR("On");
    v8 = 136315394;
    v9 = "-[CSSiriVibrationManager _fetchSilentVibrationValue]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleRingVibrationValueChange
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSiriVibrationManager handleRingVibrationValueChange]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CSSiriVibrationManager_handleRingVibrationValueChange__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleSilentVibrationValueChange
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSiriVibrationManager handleSilentVibrationValueChange]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSSiriVibrationManager_handleSilentVibrationValueChange__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __58__CSSiriVibrationManager_handleSilentVibrationValueChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSilentVibrationValue");
}

uint64_t __56__CSSiriVibrationManager_handleRingVibrationValueChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRingVibrationValue");
}

uint64_t __30__CSSiriVibrationManager_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_silentVibrationValue");
  return objc_msgSend(*(id *)(a1 + 32), "_ringVibrationValue");
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_15961 != -1)
    dispatch_once(&sharedManager_onceToken_15961, &__block_literal_global_15962);
  return (id)sharedManager_sharedManager_15963;
}

void __39__CSSiriVibrationManager_sharedManager__block_invoke()
{
  CSSiriVibrationManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSSiriVibrationManager);
  v1 = (void *)sharedManager_sharedManager_15963;
  sharedManager_sharedManager_15963 = (uint64_t)v0;

}

@end
