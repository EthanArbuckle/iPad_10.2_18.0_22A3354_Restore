@implementation CSSelfTriggerEnabledMonitorAccessory

- (CSSelfTriggerEnabledMonitorAccessory)init
{
  CSSelfTriggerEnabledMonitorAccessory *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSSelfTriggerEnabledMonitorAccessory;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_enabled = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_enabled = objc_msgSend(v4, "isSelfTriggerEnabledAccessory");

  -[CSSelfTriggerEnabledMonitorAccessory _didReceiveSelfTriggerChanged:](self, "_didReceiveSelfTriggerChanged:", self->_enabled);
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    if (self->_enabled)
      v6 = CFSTR("Enabled");
    else
      v6 = CFSTR("Disabled");
    v7 = 136315394;
    v8 = "-[CSSelfTriggerEnabledMonitorAccessory _startMonitoringWithQueue:]";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : SelfTrigger switch, SelfTrigger is %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSSelfTriggerEnabledMonitorAccessory _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : SelfTrigger switch", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_didReceiveSelfTriggerChanged:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  self->_enabled = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__CSSelfTriggerEnabledMonitorAccessory__didReceiveSelfTriggerChanged___block_invoke;
  v3[3] = &unk_1E7C27E50;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("Disable");
    if (v3)
      v6 = CFSTR("Enable");
    v8 = 136315394;
    v9 = "-[CSSelfTriggerEnabledMonitorAccessory setEnable:]";
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Set SelfTrigger Enable = %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelfTriggerEnabledAccessory:", v3);

  -[CSSelfTriggerEnabledMonitorAccessory _didReceiveSelfTriggerChanged:](self, "_didReceiveSelfTriggerChanged:", v3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

uint64_t __70__CSSelfTriggerEnabledMonitorAccessory__didReceiveSelfTriggerChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withEnabled:", a2, *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8754 != -1)
    dispatch_once(&sharedInstance_onceToken_8754, &__block_literal_global_8755);
  return (id)sharedInstance__sharedInstance_8756;
}

void __54__CSSelfTriggerEnabledMonitorAccessory_sharedInstance__block_invoke()
{
  CSSelfTriggerEnabledMonitorAccessory *v0;
  void *v1;

  v0 = objc_alloc_init(CSSelfTriggerEnabledMonitorAccessory);
  v1 = (void *)sharedInstance__sharedInstance_8756;
  sharedInstance__sharedInstance_8756 = (uint64_t)v0;

}

@end
