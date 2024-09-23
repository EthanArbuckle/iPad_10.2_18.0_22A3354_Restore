@implementation CRKWiProxTrackerScanner

- (void)dealloc
{
  objc_super v3;

  -[CRKWiProxTrackerScanner invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRKWiProxTrackerScanner;
  -[CRKWiProxTrackerScanner dealloc](&v3, sel_dealloc);
}

- (CRKWiProxTrackerScanner)initWithDelegate:(id)a3
{
  id v4;
  CRKWiProxTrackerScanner *v5;
  id v6;
  void *v7;
  uint64_t v8;
  WPZoneTracker *zoneTracker;
  uint64_t v10;
  WPDeviceScanner *deviceScanner;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKWiProxTrackerScanner;
  v5 = -[CRKWiProxTrackerScanner init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEC2B70]);
    v7 = (void *)MEMORY[0x24BDAC9B8];
    v8 = objc_msgSend(v6, "initWithDelegate:queue:", v5, MEMORY[0x24BDAC9B8]);
    zoneTracker = v5->_zoneTracker;
    v5->_zoneTracker = (WPZoneTracker *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BEC2B60]), "initWithDelegate:queue:", v5, v7);
    deviceScanner = v5->_deviceScanner;
    v5->_deviceScanner = (WPDeviceScanner *)v10;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)invalidate
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_218C99000, v2, v3, "entered %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (int64_t)zoneTrackerState
{
  void *v2;
  int64_t v3;

  -[CRKWiProxTrackerScanner zoneTracker](self, "zoneTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (int64_t)deviceScannerState
{
  void *v2;
  int64_t v3;

  -[CRKWiProxTrackerScanner deviceScanner](self, "deviceScanner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (void)unregisterAllZoneChanges
{
  NSObject *v4;
  void *v5;

  _CRKLogBluetooth_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  -[CRKWiProxTrackerScanner zoneTracker](self, "zoneTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterAllZoneChanges");

}

- (void)unregisterForZoneChanges:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  _CRKLogBluetooth_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner unregisterForZoneChanges:].cold.1();

  -[CRKWiProxTrackerScanner zoneTracker](self, "zoneTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterForZoneChanges:", v5);

}

- (void)registerForZoneChangesMatching:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  _CRKLogBluetooth_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner unregisterForZoneChanges:].cold.1();

  -[CRKWiProxTrackerScanner zoneTracker](self, "zoneTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForZoneChangesMatching:", v5);

}

- (void)unregisterAllDeviceChanges
{
  NSObject *v4;
  void *v5;

  _CRKLogBluetooth_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  -[CRKWiProxTrackerScanner deviceScanner](self, "deviceScanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterAllDeviceChanges");

}

- (void)registerForDevicesMatching:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  _CRKLogBluetooth_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner registerForDevicesMatching:options:].cold.2();

  _CRKLogBluetooth_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner registerForDevicesMatching:options:].cold.1();

  -[CRKWiProxTrackerScanner deviceScanner](self, "deviceScanner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerForDevicesMatching:options:", v7, v8);

}

- (void)zoneTrackerDidUpdateState:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  _CRKLogBluetooth_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner zoneTrackerDidUpdateState:].cold.1(v5);

  -[CRKWiProxTrackerScanner delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackerScanner:didUpdateZoneTrackerState:", self, v5);

}

- (void)zoneTracker:(id)a3 enteredZone:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  _CRKLogBluetooth_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner zoneTracker:enteredZone:].cold.1();

  -[CRKWiProxTrackerScanner delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackerScanner:zoneTracker:enteredZone:", self, v8, v7);

}

- (void)zoneTracker:(id)a3 exitedZone:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  _CRKLogBluetooth_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner zoneTracker:enteredZone:].cold.1();

  -[CRKWiProxTrackerScanner delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackerScanner:zoneTracker:exitedZone:", self, v8, v7);

}

- (void)zoneTracker:(id)a3 didFailToRegisterZones:(id)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  _CRKLogBluetooth_0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  -[CRKWiProxTrackerScanner delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackerScanner:zoneTracker:didFailToRegisterZones:withError:", self, v11, v10, v9);

}

- (void)deviceScannerDidUpdateState:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  _CRKLogBluetooth_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner zoneTrackerDidUpdateState:].cold.1(v5);

  -[CRKWiProxTrackerScanner delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackerScanner:didUpdateDeviceScannerState:", self, v5);

}

- (void)scanner:(id)a3 foundRequestedDevices:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  _CRKLogBluetooth_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner registerForDevicesMatching:options:].cold.2();

  -[CRKWiProxTrackerScanner delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackerScanner:scanner:foundRequestedDevices:", self, v8, v7);

}

- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  _CRKLogBluetooth_0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  _CRKLogBluetooth_0();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner scanner:foundDevice:withData:].cold.1();

  -[CRKWiProxTrackerScanner delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackerScanner:scanner:foundDevice:withData:", self, v11, v9, v10);

}

- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  _CRKLogBluetooth_0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CRKWiProxTrackerScanner invalidate].cold.1(a2);

  -[CRKWiProxTrackerScanner delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackerScanner:scanner:didFailToRegisterDevices:withError:", self, v11, v10, v9);

}

- (WPZoneTracker)zoneTracker
{
  return self->_zoneTracker;
}

- (void)setZoneTracker:(id)a3
{
  objc_storeStrong((id *)&self->_zoneTracker, a3);
}

- (WPDeviceScanner)deviceScanner
{
  return self->_deviceScanner;
}

- (void)setDeviceScanner:(id)a3
{
  objc_storeStrong((id *)&self->_deviceScanner, a3);
}

- (CRKWiProxTrackerScannerDelegate)delegate
{
  return (CRKWiProxTrackerScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceScanner, 0);
  objc_storeStrong((id *)&self->_zoneTracker, 0);
}

- (void)unregisterForZoneChanges:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_218C99000, v0, v1, "zones: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)registerForDevicesMatching:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_218C99000, v0, v1, "options: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)registerForDevicesMatching:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_218C99000, v0, v1, "devices: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)zoneTrackerDidUpdateState:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "state"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_218C99000, v2, v3, "state: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)zoneTracker:enteredZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_218C99000, v0, v1, "zone: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)scanner:foundDevice:withData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_218C99000, v0, v1, "device: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

@end
