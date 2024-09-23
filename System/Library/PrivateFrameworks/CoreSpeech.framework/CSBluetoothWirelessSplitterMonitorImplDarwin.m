@implementation CSBluetoothWirelessSplitterMonitorImplDarwin

- (CSBluetoothWirelessSplitterMonitorImplDarwin)init
{
  CSBluetoothWirelessSplitterMonitorImplDarwin *v3;
  CSBluetoothWirelessSplitterMonitorImplDarwin *v4;
  objc_super v6;

  if (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS"))
  {
    v6.receiver = self;
    v6.super_class = (Class)CSBluetoothWirelessSplitterMonitorImplDarwin;
    v3 = -[CSEventMonitor init](&v6, sel_init);
    if (v3)
    {
      v3->_splitterState = 0;
      v3->_shouldDisableSpeakerVerificationInSplitterMode = 0;
    }
    self = v3;
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  const __CFString *v8;
  _BYTE v9[22];
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    *(_QWORD *)&v9[4] = "-[CSBluetoothWirelessSplitterMonitorImplDarwin updateSplitterState:shouldDisableSpeakerVerificat"
                        "ionInSplitterMode:]";
    *(_DWORD *)v9 = 136315650;
    if (v4)
      v8 = CFSTR("YES");
    *(_WORD *)&v9[12] = 2050;
    *(_QWORD *)&v9[14] = a3;
    v10 = 2114;
    v11 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s splitterState : %{public}lu, shouldDisableSpeakerVerification : %{public}@", v9, 0x20u);
  }
  self->_splitterState = a3;
  self->_shouldDisableSpeakerVerificationInSplitterMode = v4;
  -[CSBluetoothWirelessSplitterMonitorImplDarwin _didReceiveWirelessSplitterStateChange](self, "_didReceiveWirelessSplitterStateChange", *(_OWORD *)v9);
}

- (void)splitterState:(id)a3
{
  if (a3)
    (*((void (**)(id, unint64_t, BOOL))a3 + 2))(a3, self->_splitterState, self->_shouldDisableSpeakerVerificationInSplitterMode);
}

- (unint64_t)splitterState
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin splitterState]";
    _os_log_fault_impl(&dword_1C2614000, v2, OS_LOG_TYPE_FAULT, "%s This call is not supported on darwinOS device (splitterState)", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[CSBluetoothWirelessSplitterMonitorImplDarwin _didReceiveWirelessSplitterStateChange](self, "_didReceiveWirelessSplitterStateChange", a3);
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Wireless Splitter start", (uint8_t *)&v4, 0xCu);
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
    v4 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Wireless Splitter", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_didReceiveWirelessSplitterStateChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __86__CSBluetoothWirelessSplitterMonitorImplDarwin__didReceiveWirelessSplitterStateChange__block_invoke;
  v2[3] = &unk_1E7C27000;
  v2[4] = self;
  -[CSBluetoothWirelessSplitterMonitorImplDarwin splitterState:](self, "splitterState:", v2);
}

- (void)_notifyObserver:(id)a3 splitterState:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "CSBluetoothWirelessSplitterMonitor:didReceiveSplitterStateChange:shouldDisableSpeakerVerificationInSplitterMode:", self, a4, v5);

}

uint64_t __86__CSBluetoothWirelessSplitterMonitorImplDarwin__didReceiveWirelessSplitterStateChange__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  _QWORD v5[6];
  char v6;

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__CSBluetoothWirelessSplitterMonitorImplDarwin__didReceiveWirelessSplitterStateChange__block_invoke_2;
  v5[3] = &unk_1E7C24770;
  v5[4] = v3;
  v5[5] = a2;
  v6 = a3;
  return objc_msgSend(v3, "enumerateObserversInQueue:", v5);
}

uint64_t __86__CSBluetoothWirelessSplitterMonitorImplDarwin__didReceiveWirelessSplitterStateChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:splitterState:shouldDisableSpeakerVerificationInSplitterMode:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

@end
