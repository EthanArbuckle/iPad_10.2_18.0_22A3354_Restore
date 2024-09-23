@implementation BPSTinkerConnectionTracker

- (BPSTinkerConnectionTracker)initWithDevice:(id)a3
{
  id v5;
  BPSTinkerConnectionTracker *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  PBBridgeIDSReachability *reachability;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BPSTinkerConnectionTracker;
  v6 = -[BPSTinkerConnectionTracker init](&v12, sel_init);
  if (v6)
  {
    pbb_bridge_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "pairingID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[BPSTinkerConnectionTracker initWithDevice:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "%s for %@", buf, 0x16u);

    }
    objc_storeStrong((id *)&v6->_selectedDevice, a3);
    objc_msgSend(MEMORY[0x24BE6E498], "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    reachability = v6->_reachability;
    v6->_reachability = (PBBridgeIDSReachability *)v9;

    -[PBBridgeIDSReachability addObserver:](v6->_reachability, "addObserver:", v6);
  }

  return v6;
}

- (void)setSelectedDevice:(id)a3
{
  NRDevice *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (NRDevice *)a3;
  pbb_bridge_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NRDevice pairingID](self->_selectedDevice, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDevice pairingID](v5, "pairingID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[BPSTinkerConnectionTracker setSelectedDevice:]";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_21147E000, v6, OS_LOG_TYPE_DEFAULT, "%s from %@ to %@", (uint8_t *)&v10, 0x20u);

  }
  if (self->_selectedDevice != v5)
  {
    objc_storeStrong((id *)&self->_selectedDevice, a3);
    objc_msgSend(MEMORY[0x24BE6E498], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSTinkerConnectionTracker reachability:device:connectionStatus:](self, "reachability:device:connectionStatus:", v9, v5, objc_msgSend(v9, "reachabilityForDevice:", v5));

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PBBridgeIDSReachability removeObserver:](self->_reachability, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)BPSTinkerConnectionTracker;
  -[BPSTinkerConnectionTracker dealloc](&v3, sel_dealloc);
}

- (void)reachability:(id)a3 device:(id)a4 connectionStatus:(unint64_t)a5
{
  NRDevice *v7;
  NSObject *v8;
  _QWORD block[4];
  NRDevice *v10;
  BPSTinkerConnectionTracker *v11;
  unint64_t v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = (NRDevice *)a4;
  pbb_bridge_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "-[BPSTinkerConnectionTracker reachability:device:connectionStatus:]";
    _os_log_impl(&dword_21147E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  if (self->_selectedDevice == v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__BPSTinkerConnectionTracker_reachability_device_connectionStatus___block_invoke;
    block[3] = &unk_24CBE50D0;
    v12 = a5;
    v10 = v7;
    v11 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __67__BPSTinkerConnectionTracker_reachability_device_connectionStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 1)
  {
    pbb_bridge_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v15 = "-[BPSTinkerConnectionTracker reachability:device:connectionStatus:]_block_invoke";
      _os_log_impl(&dword_21147E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s device Bluetooth connected", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6B398]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    pbb_bridge_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Connecting to Apple Watch '%@'...]"), v4);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_21147E000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
    objc_msgSend(WeakRetained, "didBTConnectDevice:", *(_QWORD *)(a1 + 32));
  }
  else if (v2 == 2)
  {
    pbb_bridge_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v15 = "-[BPSTinkerConnectionTracker reachability:device:connectionStatus:]_block_invoke";
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s device IDS connected", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6B398]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    pbb_bridge_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Apple Watch '%@' is connected.]"), v4);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
    objc_msgSend(WeakRetained, "didIDSConnectDevice:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    pbb_bridge_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v15 = "-[BPSTinkerConnectionTracker reachability:device:connectionStatus:]_block_invoke";
      _os_log_impl(&dword_21147E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s device disconnected", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6B398]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    pbb_bridge_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Bring Apple Watch '%@' near your iPhone.]"), v4);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_impl(&dword_21147E000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
    objc_msgSend(WeakRetained, "didUpdateAsDisconnectedDevice:", *(_QWORD *)(a1 + 32));
  }

}

- (NRDevice)selectedDevice
{
  return self->_selectedDevice;
}

- (BPSTinkerConnectionTrackerDelegate)delegate
{
  return (BPSTinkerConnectionTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedDevice, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
}

@end
