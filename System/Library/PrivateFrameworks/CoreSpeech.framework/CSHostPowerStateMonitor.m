@implementation CSHostPowerStateMonitor

+ (id)sharedInstance
{
  void *v2;

  if (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS"))
  {
    +[CSHostPowerStateMonitorImplDarwin sharedInstance](CSHostPowerStateMonitorImplDarwin, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (int64_t)currentPowerState
{
  __assert_rtn("-[CSHostPowerStateMonitor currentPowerState]", "CSHostPowerStateMonitor.m", 33, "NO");
}

- (int64_t)currentRawPowerState
{
  __assert_rtn("-[CSHostPowerStateMonitor currentRawPowerState]", "CSHostPowerStateMonitor.m", 38, "NO");
}

- (int64_t)currentDarwinHostState
{
  return -1;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSHostPowerStateMonitor _startMonitoringWithQueue:]", "CSHostPowerStateMonitor.m", 49, "NO");
}

- (void)_stopMonitoring
{
  __assert_rtn("-[CSHostPowerStateMonitor _stopMonitoring]", "CSHostPowerStateMonitor.m", 53, "NO");
}

@end
