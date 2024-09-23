@implementation HMISystemResourceUsageMonitoriPad

- (HMISystemResourceUsageMonitoriPad)initWithWorkQueue:(id)a3
{
  id v5;
  HMISystemResourceUsageMonitoriPad *v6;
  HMISystemResourceUsageMonitoriPad *v7;
  HMISystemResourceUsage *v8;
  HMISystemResourceUsage *currentSystemResourceUsage;
  HMINotifydObserver *v10;
  void *v11;
  uint64_t v12;
  HMISystemResourceUsageMonitoriPad *v13;
  uint64_t v14;
  HMINotifydObserver *notifydObserverForDisplayState;
  HMINotifydObserver *v16;
  void *v17;
  HMISystemResourceUsageMonitoriPad *v18;
  uint64_t v19;
  HMINotifydObserver *notifydObserverForLockState;
  _QWORD v22[4];
  HMISystemResourceUsageMonitoriPad *v23;
  _QWORD v24[4];
  HMISystemResourceUsageMonitoriPad *v25;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HMISystemResourceUsageMonitoriPad;
  v6 = -[HMISystemResourceUsageMonitoriPad init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    v8 = objc_alloc_init(HMISystemResourceUsage);
    currentSystemResourceUsage = v7->_currentSystemResourceUsage;
    v7->_currentSystemResourceUsage = v8;

    v7->_displayOn = 1;
    v10 = [HMINotifydObserver alloc];
    -[HMISystemResourceUsageMonitoriPad workQueue](v7, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __55__HMISystemResourceUsageMonitoriPad_initWithWorkQueue___block_invoke;
    v24[3] = &unk_24DBEC670;
    v13 = v7;
    v25 = v13;
    v14 = -[HMINotifydObserver initWithNotificationName:andQueue:andCallback:](v10, "initWithNotificationName:andQueue:andCallback:", "com.apple.iokit.hid.displayStatus", v11, v24);
    notifydObserverForDisplayState = v13->_notifydObserverForDisplayState;
    v13->_notifydObserverForDisplayState = (HMINotifydObserver *)v14;

    v16 = [HMINotifydObserver alloc];
    -[HMISystemResourceUsageMonitoriPad workQueue](v13, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __55__HMISystemResourceUsageMonitoriPad_initWithWorkQueue___block_invoke_4;
    v22[3] = &unk_24DBEC670;
    v18 = v13;
    v23 = v18;
    v19 = -[HMINotifydObserver initWithNotificationName:andQueue:andCallback:](v16, "initWithNotificationName:andQueue:andCallback:", "com.apple.springboard.lockstate", v17, v22);
    notifydObserverForLockState = v18->_notifydObserverForLockState;
    v18->_notifydObserverForLockState = (HMINotifydObserver *)v19;

  }
  return v7;
}

void __55__HMISystemResourceUsageMonitoriPad_initWithWorkQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)MEMORY[0x220735570](objc_msgSend(*(id *)(a1 + 32), "setDisplayOn:", a3 != 0));
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "isDisplayOn");
    v10 = 138543618;
    v11 = v8;
    v12 = 1024;
    v13 = v9;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Display enabled: %d", (uint8_t *)&v10, 0x12u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "possibleComputeResourceChange");

}

void __55__HMISystemResourceUsageMonitoriPad_initWithWorkQueue___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)MEMORY[0x220735570](objc_msgSend(*(id *)(a1 + 32), "setLocked:", a3 != 0));
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "isLocked");
    v10 = 138543618;
    v11 = v8;
    v12 = 1024;
    v13 = v9;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Device lock state: %d", (uint8_t *)&v10, 0x12u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "possibleComputeResourceChange");

}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMISystemResourceUsageMonitoriPad workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMISystemResourceUsageMonitoriPad possibleComputeResourceChange](self, "possibleComputeResourceChange");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleResourceUsageNotification, *MEMORY[0x24BE3EC48], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleResourceUsageNotification, *MEMORY[0x24BE3EC40], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleResourceUsageNotification, *MEMORY[0x24BDD1160], 0);

  objc_msgSend(MEMORY[0x24BE3F240], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");

  -[HMISystemResourceUsageMonitoriPad notifydObserverForDisplayState](self, "notifydObserverForDisplayState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");

  -[HMISystemResourceUsageMonitoriPad notifydObserverForLockState](self, "notifydObserverForLockState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "start");

}

- (void)handleResourceUsageNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[HMISystemResourceUsageMonitoriPad workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMISystemResourceUsageMonitoriPad_handleResourceUsageNotification__block_invoke;
  block[3] = &unk_24DBE9C90;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __68__HMISystemResourceUsageMonitoriPad_handleResourceUsageNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "possibleComputeResourceChange");
}

- (void)possibleComputeResourceChange
{
  NSObject *v3;
  void *v4;
  id v5;

  -[HMISystemResourceUsageMonitoriPad workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMISystemResourceUsageMonitoriPad computeResourceUsageLevel](self, "computeResourceUsageLevel"))
  {
    -[HMISystemResourceUsageMonitoriPad delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HMISystemResourceUsageMonitoriPad currentSystemResourceUsage](self, "currentSystemResourceUsage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemResourceUsageDidChangeTo:", objc_msgSend(v4, "systemResourceUsageLevel"));

  }
}

- (BOOL)computeResourceUsageLevel
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  HMISystemResourceUsageMonitoriPad *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  float v15;
  float v16;
  int v17;
  double v18;
  HMISystemResourceUsageMonitoriPad *v19;
  _BOOL4 v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  HMISystemResourceUsageMonitoriPad *v25;
  _BOOL4 v26;
  HMISystemResourceUsageMonitoriPad *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  _BYTE v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[HMISystemResourceUsageMonitoriPad workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLowPowerModeEnabled");

  if (v5)
  {
    v6 = (void *)MEMORY[0x220735570]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_5:
      v11 = 3;
LABEL_23:

      objc_autoreleasePoolPop(v6);
      goto LABEL_24;
    }
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v33 = 138543362;
    *(_QWORD *)&v33[4] = v9;
    v10 = "%{public}@System is in low power mode";
LABEL_4:
    _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_INFO, v10, v33, 0xCu);

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BE3F240], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "batteryState");

  objc_msgSend(MEMORY[0x24BE3F240], "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "batteryLevel");
  v16 = v15;

  if (-[HMISystemResourceUsageMonitoriPad isDisplayOn](self, "isDisplayOn"))
    v17 = !-[HMISystemResourceUsageMonitoriPad isLocked](self, "isLocked");
  else
    v17 = 0;
  if ((unint64_t)(v13 - 2) < 2)
  {
    v6 = (void *)MEMORY[0x220735570]();
    v25 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (!v17)
    {
      if (v26)
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v33 = 138543362;
        *(_QWORD *)&v33[4] = v32;
        v11 = 1;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_INFO, "%{public}@Battery state charging/charged", v33, 0xCu);

      }
      else
      {
        v11 = 1;
      }
      goto LABEL_23;
    }
    if (!v26)
      goto LABEL_22;
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v33 = 138543362;
    *(_QWORD *)&v33[4] = v21;
    v22 = "%{public}@Battery state charging/charged but user is actively using the device";
    goto LABEL_20;
  }
  if (!v13)
  {
    v6 = (void *)MEMORY[0x220735570]();
    v27 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_22;
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v33 = 138543362;
    *(_QWORD *)&v33[4] = v21;
    v22 = "%{public}@Battery state unknown, should get the real one shortly";
LABEL_20:
    v23 = v8;
    v24 = 12;
    goto LABEL_21;
  }
  if (v13 == 1)
  {
    v18 = v16;
    v6 = (void *)MEMORY[0x220735570]();
    v19 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v18 <= 0.2)
    {
      if (!v20)
        goto LABEL_5;
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v33 = 138543362;
      *(_QWORD *)&v33[4] = v9;
      v10 = "%{public}@Battery level critical";
      goto LABEL_4;
    }
    if (v20)
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v33 = 138543618;
      *(_QWORD *)&v33[4] = v21;
      *(_WORD *)&v33[12] = 2048;
      *(double *)&v33[14] = v18;
      v22 = "%{public}@Battery level: %f";
      v23 = v8;
      v24 = 22;
LABEL_21:
      _os_log_impl(&dword_219D45000, v23, OS_LOG_TYPE_INFO, v22, v33, v24);

    }
LABEL_22:
    v11 = 2;
    goto LABEL_23;
  }
  v11 = 0;
LABEL_24:
  -[HMISystemResourceUsageMonitoriPad currentSystemResourceUsage](self, "currentSystemResourceUsage", *(_OWORD *)v33, *(_QWORD *)&v33[16]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "systemResourceUsageLevel");

  if (v29 != v11)
  {
    -[HMISystemResourceUsageMonitoriPad currentSystemResourceUsage](self, "currentSystemResourceUsage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSystemResourceUsageLevel:", v11);

  }
  return v29 != v11;
}

- (id)getCurrentSystemResourceUsage
{
  NSObject *v3;

  -[HMISystemResourceUsageMonitoriPad workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return -[HMISystemResourceUsageMonitoriPad currentSystemResourceUsage](self, "currentSystemResourceUsage");
}

- (HMISystemResourceUsageMonitorDelegate)delegate
{
  return (HMISystemResourceUsageMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMISystemResourceUsage)currentSystemResourceUsage
{
  return (HMISystemResourceUsage *)objc_getProperty(self, a2, 32, 1);
}

- (HMINotifydObserver)notifydObserverForDisplayState
{
  return (HMINotifydObserver *)objc_getProperty(self, a2, 40, 1);
}

- (HMINotifydObserver)notifydObserverForLockState
{
  return (HMINotifydObserver *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isDisplayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifydObserverForLockState, 0);
  objc_storeStrong((id *)&self->_notifydObserverForDisplayState, 0);
  objc_storeStrong((id *)&self->_currentSystemResourceUsage, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
