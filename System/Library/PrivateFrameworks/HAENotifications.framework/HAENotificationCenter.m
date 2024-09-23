@implementation HAENotificationCenter

- (HAENotificationCenter)initWithBundleIdentifier:(id)a3
{
  id v5;
  HAENotificationCenter *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  HAENotificationCenterClient *v11;
  void *centerDelegate;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HAENotificationCenter;
  v6 = -[HAENotificationCenter init](&v14, sel_init);
  if (v6)
  {
    if (+[HAENDefaults HAENSupportedForCurrentDeviceClass](HAENDefaults, "HAENSupportedForCurrentDeviceClass"))
    {
      objc_storeStrong((id *)&v6->bundleID, a3);
      +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getLiveMonitoringThreshold");
      v6->liveThresholdInDBA = v8;

      +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getLiveMonitorTimeWindowInSeconds");
      v6->liveMonitorWindowInSec = v10;

      if (+[HAENDefaults isCurrentProcessMediaserverd](HAENDefaults, "isCurrentProcessMediaserverd"))
      {
        +[HAENotificationCenterServer sharedInstance](HAENotificationCenterServer, "sharedInstance");
        v11 = (HAENotificationCenterClient *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = -[HAENotificationCenterClient initWithBundleID:]([HAENotificationCenterClient alloc], "initWithBundleID:", v5);
      }
      centerDelegate = v6->centerDelegate;
      v6->centerDelegate = (HAENotificationCenterDelegate *)v11;
    }
    else
    {
      centerDelegate = v6;
      v6 = 0;
    }

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HAENotificationsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "setDelegate %@", (uint8_t *)&v6, 0xCu);
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)addHAENotificationEvent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  int v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  const __CFString *v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHAENFeatureEnabled");

  if (v9)
  {
    -[HAENotificationCenterDelegate addHAENotificationEvent:](self->centerDelegate, "addHAENotificationEvent:", v6);
    if (objc_msgSend(v6, "eventType") == 2003133803)
    {
      HAENotificationsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v19 = 138412290;
        v20 = WeakRetained;
        _os_log_impl(&dword_2144B3000, v10, OS_LOG_TYPE_DEFAULT, "sending weekly event to healthkit with delegate %@", (uint8_t *)&v19, 0xCu);

      }
      +[HAENHealthKitStore sharedInstance](HAENHealthKitStore, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "saveNotificationEventToHealthKit:withDelegate:", v6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    if (objc_msgSend(v6, "eventType") == 1818850917)
    {
      HAENotificationsLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_2144B3000, v18, OS_LOG_TYPE_DEFAULT, "sending loud event to healthkit", (uint8_t *)&v19, 2u);
      }

      +[HAENHealthKitStore sharedInstance](HAENHealthKitStore, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "saveNotificationEventToHealthKit:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      if (!v7)
        goto LABEL_18;
      goto LABEL_17;
    }
    v16 = *(_QWORD *)"pyt!";
    v17 = CFSTR("event type not supported");
  }
  else
  {
    HAENotificationsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_2144B3000, v15, OS_LOG_TYPE_DEFAULT, "error sending HAEN event: HAEN is disabled", (uint8_t *)&v19, 2u);
    }

    v16 = *(_QWORD *)"bne!";
    v17 = CFSTR("HAEN is disabled");
  }
  NSErrorWithHAENErrorCode(v16, (uint64_t)v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
LABEL_17:
    v7[2](v7, v14);
LABEL_18:

}

- (id)addHAENotificationEvent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHAENFeatureEnabled");

  if ((v8 & 1) == 0)
  {
    HAENotificationsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2144B3000, v12, OS_LOG_TYPE_DEFAULT, "error sending HAEN event: HAEN is disabled", (uint8_t *)&v16, 2u);
    }

    if (!a4)
      goto LABEL_16;
    v13 = *(_QWORD *)"bne!";
    v14 = CFSTR("HAEN is disabled");
    goto LABEL_15;
  }
  -[HAENotificationCenterDelegate addHAENotificationEvent:](self->centerDelegate, "addHAENotificationEvent:", v6);
  if (objc_msgSend(v6, "eventType") != 2003133803)
  {
    if (!a4)
      goto LABEL_16;
    v13 = *(_QWORD *)"pyt!";
    v14 = CFSTR("event type not supported");
LABEL_15:
    NSErrorWithHAENErrorCode(v13, (uint64_t)v14);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  +[HAENHealthKitStore createHKCategorySampleForEvent:](HAENHealthKitStore, "createHKCategorySampleForEvent:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (a4)
    {
      v13 = *(_QWORD *)"skh!";
      v14 = CFSTR("failed to create hk sample");
      goto LABEL_15;
    }
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v10 = (void *)v9;
  HAENotificationsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_2144B3000, v11, OS_LOG_TYPE_DEFAULT, "created weekly event HKSample %@", (uint8_t *)&v16, 0xCu);
  }

LABEL_17:
  return v10;
}

+ (void)startNotificationCenterServer
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint8_t v9[16];

  if (+[HAENDefaults isCurrentProcessMediaserverd](HAENDefaults, "isCurrentProcessMediaserverd")
    && +[HAENDefaults HAENSupportedForCurrentDeviceClass](HAENDefaults, "HAENSupportedForCurrentDeviceClass"))
  {
    HAENotificationsLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2144B3000, v2, OS_LOG_TYPE_DEFAULT, "<< Starting HAE Notification Center Server >>", v9, 2u);
    }

    v3 = +[HAENotificationCenterServer sharedInstance](HAENotificationCenterServer, "sharedInstance");
    v4 = +[HAENotificationCenterManager sharedInstance](HAENotificationCenterManager, "sharedInstance");
    v5 = +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v6 = +[HAENLocationGatingHelper sharedInstance](HAENLocationGatingHelper, "sharedInstance");
    v7 = +[HAENVolumeControl sharedInstance](HAENVolumeControl, "sharedInstance");
    v8 = +[HAENStatistics sharedInstance](HAENStatistics, "sharedInstance");
  }
}

+ (BOOL)connectedWiredDeviceIsHeadphone
{
  void *v2;
  void *v3;
  BOOL v4;

  +[HAENUnknownDeviceManager sharedInstance](HAENUnknownDeviceManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[HAENotificationCenter connectedWiredDeviceIsHeadphoneWithUUID:](HAENotificationCenter, "connectedWiredDeviceIsHeadphoneWithUUID:", v3);

  return v4;
}

+ (BOOL)connectedWiredDeviceIsHeadphoneWithUUID:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[HAENUnknownDeviceManager sharedInstance](HAENUnknownDeviceManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "unknownWiredHeadsetConnectedThroughB204"))
  {
    v5 = objc_msgSend(v4, "isUSBCPort");
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 1) != 0)
      v8 = objc_msgSend(v6, "isCurrentAudioAccessoryHeadphoneWithKey:", v3);
    else
      v8 = objc_msgSend(v6, "isCurrentAudioAccessoryHeadphone");
    v9 = v8;

  }
  else
  {
    v9 = 1;
  }
  HAENotificationsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v3;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_2144B3000, v10, OS_LOG_TYPE_DEFAULT, "wired device [%@] is headphone: %@", (uint8_t *)&v13, 0x16u);

  }
  return v9;
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (double)liveThresholdInDBA
{
  return self->liveThresholdInDBA;
}

- (double)liveMonitorWindowInSec
{
  return self->liveMonitorWindowInSec;
}

- (HAENotificationCenterUserDelegate)delegate
{
  return (HAENotificationCenterUserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->centerDelegate, 0);
}

@end
