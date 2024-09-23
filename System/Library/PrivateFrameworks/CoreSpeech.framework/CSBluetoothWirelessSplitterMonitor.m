@implementation CSBluetoothWirelessSplitterMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12049 != -1)
    dispatch_once(&sharedInstance_onceToken_12049, &__block_literal_global_12050);
  return (id)sharedInstance_sharedInstance_12051;
}

void __52__CSBluetoothWirelessSplitterMonitor_sharedInstance__block_invoke()
{
  CSBluetoothWirelessSplitterMonitorImpIOS *v0;
  void *v1;
  CSBluetoothWirelessSplitterMonitorImplDarwin *v2;
  void *v3;

  v0 = objc_alloc_init(CSBluetoothWirelessSplitterMonitorImpIOS);
  v1 = (void *)sharedInstance_sharedInstance_12051;
  sharedInstance_sharedInstance_12051 = (uint64_t)v0;

  if (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS"))
  {
    v2 = objc_alloc_init(CSBluetoothWirelessSplitterMonitorImplDarwin);
    v3 = (void *)sharedInstance_sharedInstance_12051;
    sharedInstance_sharedInstance_12051 = (uint64_t)v2;

  }
}

- (unint64_t)splitterState
{
  __assert_rtn("-[CSBluetoothWirelessSplitterMonitor splitterState]", "CSBluetoothWirelessSplitterMonitor.m", 37, "NO");
}

- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  __assert_rtn("-[CSBluetoothWirelessSplitterMonitor updateSplitterState:shouldDisableSpeakerVerificationInSplitterMode:]", "CSBluetoothWirelessSplitterMonitor.m", 41, "NO");
}

- (void)splitterState:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSBluetoothWirelessSplitterMonitor splitterState:]", "CSBluetoothWirelessSplitterMonitor.m", 45, "NO");
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSBluetoothWirelessSplitterMonitor _startMonitoringWithQueue:]", "CSBluetoothWirelessSplitterMonitor.m", 49, "NO");
}

- (void)_stopMonitoring
{
  __assert_rtn("-[CSBluetoothWirelessSplitterMonitor _stopMonitoring]", "CSBluetoothWirelessSplitterMonitor.m", 53, "NO");
}

@end
