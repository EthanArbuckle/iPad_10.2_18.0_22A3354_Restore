@implementation CSBluetoothWirelessSplitterMonitorImpIOS

- (CSBluetoothWirelessSplitterMonitorImpIOS)init
{
  CSBluetoothWirelessSplitterMonitorImpIOS *v3;
  CSBluetoothWirelessSplitterMonitorImpIOS *v4;
  objc_super v6;

  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CSBluetoothWirelessSplitterMonitorImpIOS;
    v4 = -[CSEventMonitor init](&v6, sel_init);
    if (v4)
    {
      v4->_notifyToken = -1;
      v4->_splitterState = 0;
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  __assert_rtn("-[CSBluetoothWirelessSplitterMonitorImpIOS updateSplitterState:shouldDisableSpeakerVerificationInSplitterMode:]", "CSBluetoothWirelessSplitterMonitorImpIOS.m", 42, "NO");
}

- (unint64_t)splitterState
{
  return self->_splitterState;
}

- (void)splitterState:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D19078], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __58__CSBluetoothWirelessSplitterMonitorImpIOS_splitterState___block_invoke;
      v5[3] = &unk_1E7C246F8;
      v6 = v3;
      objc_msgSend(v4, "getWirelessSplitterInfoWithCompletion:", v5);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
    }

  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__CSBluetoothWirelessSplitterMonitorImpIOS__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E7C28DC0;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", &self->_notifyToken, v4, handler);
    -[CSBluetoothWirelessSplitterMonitorImpIOS _didReceiveWirelessSplitterStateChange](self, "_didReceiveWirelessSplitterStateChange");
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSBluetoothWirelessSplitterMonitorImpIOS _startMonitoringWithQueue:]";
      v6 = "%s Start monitoring : Wireless Splitter start";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSBluetoothWirelessSplitterMonitorImpIOS _startMonitoringWithQueue:]";
      v6 = "%s Cannot start monitoring Wireless Splitter because it was already started";
LABEL_6:
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }

}

- (void)_stopMonitoring
{
  int notifyToken;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSBluetoothWirelessSplitterMonitorImpIOS _stopMonitoring]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Wireless Splitter", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_didReceiveWirelessSplitterStateChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __82__CSBluetoothWirelessSplitterMonitorImpIOS__didReceiveWirelessSplitterStateChange__block_invoke;
  v2[3] = &unk_1E7C27000;
  v2[4] = self;
  -[CSBluetoothWirelessSplitterMonitorImpIOS splitterState:](self, "splitterState:", v2);
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

uint64_t __82__CSBluetoothWirelessSplitterMonitorImpIOS__didReceiveWirelessSplitterStateChange__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  _QWORD v5[6];
  char v6;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a2;
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__CSBluetoothWirelessSplitterMonitorImpIOS__didReceiveWirelessSplitterStateChange__block_invoke_2;
  v5[3] = &unk_1E7C24770;
  v5[4] = v3;
  v5[5] = a2;
  v6 = a3;
  return objc_msgSend(v3, "enumerateObserversInQueue:", v5);
}

uint64_t __82__CSBluetoothWirelessSplitterMonitorImpIOS__didReceiveWirelessSplitterStateChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:splitterState:shouldDisableSpeakerVerificationInSplitterMode:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __70__CSBluetoothWirelessSplitterMonitorImpIOS__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSBluetoothWirelessSplitterMonitorImpIOS _startMonitoringWithQueue:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Received WiressSplitterStateChange", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveWirelessSplitterStateChange");
}

void __58__CSBluetoothWirelessSplitterMonitorImpIOS_splitterState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSBluetoothWirelessSplitterMonitorImpIOS splitterState:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Current wireless splitter info = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, objc_msgSend(v3, "splitterState"), objc_msgSend(v3, "shouldDisableSpeakerVerificationInSplitterMode"));
  else
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

@end
