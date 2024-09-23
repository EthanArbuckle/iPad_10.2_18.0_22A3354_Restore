@implementation CSGestureMonitor

- (BOOL)isTriggerHandheld
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  float v5;
  float v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[CSGestureMonitor sharedInstance](CSGestureMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = mach_absolute_time();
  v4 = objc_msgSend(v2, "wakeGestureTimestamp");
  if (v4 <= objc_msgSend(v2, "dismissalTimestamp"))
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "-[CSGestureMonitor isTriggerHandheld]";
      v11 = "%s Tagging as FarField as user dismissed";
      v12 = v10;
      v13 = 12;
LABEL_9:
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToSeconds:", v3 - v4);
  v6 = v5;
  v7 = *MEMORY[0x1E0D18F60];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO);
  if (v6 >= 8.0)
  {
    if (v8)
    {
      v15 = 136315394;
      v16 = "-[CSGestureMonitor isTriggerHandheld]";
      v17 = 2048;
      v18 = v6;
      v11 = "%s Tagging as farfield as last user interaction %f secs back";
      v12 = v7;
      v13 = 22;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (v8)
  {
    v15 = 136315394;
    v16 = "-[CSGestureMonitor isTriggerHandheld]";
    v17 = 2048;
    v18 = v6;
    v9 = 1;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s Tagging as handheld as user interacted in last %f secs", (uint8_t *)&v15, 0x16u);
  }
  else
  {
    v9 = 1;
  }
LABEL_11:

  return v9;
}

- (unint64_t)wakeGestureTimestamp
{
  return self->_wakeGestureTimestamp;
}

- (void)setWakeGestureTimestamp:(unint64_t)a3
{
  self->_wakeGestureTimestamp = a3;
}

- (unint64_t)dismissalTimestamp
{
  return self->_dismissalTimestamp;
}

- (void)setDismissalTimestamp:(unint64_t)a3
{
  self->_dismissalTimestamp = a3;
}

+ (id)sharedInstance
{
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
    return 0;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_27);
  return (id)sharedInstance__sharedInstance;
}

void __34__CSGestureMonitor_sharedInstance__block_invoke()
{
  CSGestureMonitorPhone *v0;
  void *v1;

  v0 = objc_alloc_init(CSGestureMonitorPhone);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

@end
