@implementation CSLanguageCodeUpdateMonitorImplDarwin

- (CSLanguageCodeUpdateMonitorImplDarwin)init
{
  CSLanguageCodeUpdateMonitorImplDarwin *v3;
  uint64_t v4;
  NSString *currentLanguageCode;
  CSLanguageCodeUpdateMonitorImplDarwin *v6;
  objc_super v8;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CSLanguageCodeUpdateMonitorImplDarwin;
    v3 = -[CSEventMonitor init](&v8, sel_init);
    if (v3)
    {
      +[CSUtils getSiriLanguageWithFallback:](CSUtils, "getSiriLanguageWithFallback:", CFSTR("en-US"));
      v4 = objc_claimAutoreleasedReturnValue();
      currentLanguageCode = v3->_currentLanguageCode;
      v3->_currentLanguageCode = (NSString *)v4;

    }
    self = v3;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSLanguageCodeUpdateMonitorImplDarwin _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Siri language code", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSLanguageCodeUpdateMonitorImplDarwin _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Siri language code", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_didReceiveLanguageCodeUpdate:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSLanguageCodeUpdateMonitorImplDarwin _didReceiveLanguageCodeUpdate:]";
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Siri language changed to : %{public}@", buf, 0x16u);
  }
  if (v5)
  {
    if (!-[CSLanguageCodeUpdateMonitorImplDarwin isLanguageCodeCurrent:](self, "isLanguageCodeCurrent:", v5))
    {
      objc_storeStrong((id *)&self->_currentLanguageCode, a3);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __71__CSLanguageCodeUpdateMonitorImplDarwin__didReceiveLanguageCodeUpdate___block_invoke;
      v8[3] = &unk_1E687FDC8;
      v8[4] = self;
      v9 = v5;
      -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v8);

    }
  }
  else
  {
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSLanguageCodeUpdateMonitorImplDarwin _didReceiveLanguageCodeUpdate:]";
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Ignore notifying change of language code, since it is nil", buf, 0xCu);
    }
  }

}

- (BOOL)isLanguageCodeCurrent:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSString isEqualToString:](self->_currentLanguageCode, "isEqualToString:", v4);
  if (v5)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[CSLanguageCodeUpdateMonitorImplDarwin isLanguageCodeCurrent:]";
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_INFO, "%s language code already up-to-date : %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
}

uint64_t __71__CSLanguageCodeUpdateMonitorImplDarwin__didReceiveLanguageCodeUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withLanguageCode:", a2, *(_QWORD *)(a1 + 40));
}

@end
