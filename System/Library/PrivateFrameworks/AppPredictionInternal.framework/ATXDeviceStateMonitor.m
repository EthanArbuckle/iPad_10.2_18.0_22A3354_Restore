@implementation ATXDeviceStateMonitor

+ (BOOL)airplaneMode
{
  int v2;
  unsigned __int8 v3;
  BOOL v4;

  pthread_mutex_lock(&lock);
  if (mocking == 1)
  {
    v2 = mockAirplaneMode;
  }
  else
  {
    if (getAirplaneMode_onceToken != -1)
      dispatch_once(&getAirplaneMode_onceToken, &__block_literal_global_48_0);
    v3 = atomic_load(getAirplaneMode_inAirplaneMode);
    v2 = v3 & 1;
  }
  v4 = v2 != 0;
  pthread_mutex_unlock(&lock);
  return v4;
}

+ (id)SSID
{
  __CFString *v2;
  void *v3;

  pthread_mutex_lock(&lock);
  if (mocking == 1)
  {
    v2 = (__CFString *)(id)mockSSID;
  }
  else
  {
    +[ATXWifiStateMonitor sharedInstance](ATXWifiStateMonitor, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "SSID");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  pthread_mutex_unlock(&lock);
  if (!-[__CFString length](v2, "length"))
  {

    v2 = CFSTR("- - - - - - - - none - - - - - - - -");
  }
  return v2;
}

+ (BOOL)onWifi
{
  void *v2;
  char v3;

  objc_msgSend(a1, "SSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("- - - - - - - - none - - - - - - - -")) ^ 1;

  return v3;
}

+ (void)startMockingSystem
{
  void *v2;

  pthread_mutex_lock(&lock);
  mocking = 1;
  mockAirplaneMode = 0;
  v2 = (void *)mockSSID;
  mockSSID = 0;

  pthread_mutex_unlock(&lock);
}

+ (void)stopMockingSystem
{
  void *v2;

  pthread_mutex_lock(&lock);
  mocking = 0;
  mockAirplaneMode = 0;
  v2 = (void *)mockSSID;
  mockSSID = 0;

  pthread_mutex_unlock(&lock);
}

+ (void)setAirplaneMode:(BOOL)a3
{
  void *v6;

  pthread_mutex_lock(&lock);
  if ((mocking & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXDeviceStateMonitor.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mocking"));

  }
  mockAirplaneMode = a3;
  pthread_mutex_unlock(&lock);
}

+ (void)setSSID:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  pthread_mutex_lock(&lock);
  if ((mocking & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXDeviceStateMonitor.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mocking"));

  }
  v5 = objc_msgSend(v8, "copy");
  v6 = (void *)mockSSID;
  mockSSID = v5;

  pthread_mutex_unlock(&lock);
}

@end
