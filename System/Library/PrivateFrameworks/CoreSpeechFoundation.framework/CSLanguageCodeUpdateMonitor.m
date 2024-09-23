@implementation CSLanguageCodeUpdateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5319 != -1)
    dispatch_once(&sharedInstance_onceToken_5319, &__block_literal_global_5320);
  return (id)sharedInstance__sharedInstance_5321;
}

void __45__CSLanguageCodeUpdateMonitor_sharedInstance__block_invoke()
{
  _BOOL4 v0;
  __objc2_class **v1;
  id v2;
  void *v3;

  v0 = +[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
  v1 = off_1E687CA20;
  if (!v0)
    v1 = off_1E687CA18;
  v2 = objc_alloc_init(*v1);
  v3 = (void *)sharedInstance__sharedInstance_5321;
  sharedInstance__sharedInstance_5321 = (uint64_t)v2;

}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSLanguageCodeUpdateMonitor _startMonitoringWithQueue:]", "CSLanguageCodeUpdateMonitor.m", 39, "NO");
}

- (void)_stopMonitoring
{
  __assert_rtn("-[CSLanguageCodeUpdateMonitor _stopMonitoring]", "CSLanguageCodeUpdateMonitor.m", 43, "NO");
}

- (void)notifySiriLanguageCodeChanged:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSLanguageCodeUpdateMonitor notifySiriLanguageCodeChanged:]", "CSLanguageCodeUpdateMonitor.m", 47, "NO");
}

- (BOOL)isLanguageCodeCurrent:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSLanguageCodeUpdateMonitor isLanguageCodeCurrent:]", "CSLanguageCodeUpdateMonitor.m", 51, "NO");
}

@end
