@implementation CSLanguageCodeUpdateMonitorImpl

- (CSLanguageCodeUpdateMonitorImpl)init
{
  CSLanguageCodeUpdateMonitorImpl *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSLanguageCodeUpdateMonitorImpl;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_notifyToken = -1;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AFLanguageDidChangeCallback, (CFStringRef)*MEMORY[0x1E0CFE510], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSLanguageCodeUpdateMonitorImpl _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Siri language code", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_stopMonitoring
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CFE510], 0);
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSLanguageCodeUpdateMonitorImpl _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Siri language code", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_didReceiveLanguageCodeUpdate
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[CSUtils getSiriLanguageWithFallback:](CSUtils, "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSLanguageCodeUpdateMonitorImpl _didReceiveLanguageCodeUpdate]";
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri language changed to : %{public}@", buf, 0x16u);
  }
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__CSLanguageCodeUpdateMonitorImpl__didReceiveLanguageCodeUpdate__block_invoke;
    v6[3] = &unk_1E687FDC8;
    v6[4] = self;
    v7 = v3;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);

  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSLanguageCodeUpdateMonitorImpl _didReceiveLanguageCodeUpdate]";
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Ignore notifying change of language code, since it is nil", buf, 0xCu);
    }
  }

}

- (void)_notifyObserver:(id)a3 withLanguageCode:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:", self, v6);

}

- (BOOL)isLanguageCodeCurrent:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[CSUtils getSiriLanguageWithFallback:](CSUtils, "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  return v5;
}

uint64_t __64__CSLanguageCodeUpdateMonitorImpl__didReceiveLanguageCodeUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withLanguageCode:", a2, *(_QWORD *)(a1 + 40));
}

@end
