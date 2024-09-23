@implementation HMDCameraRecordingSettingsControl

- (HMDCameraRecordingSettingsControl)initWithWorkQueue:(id)a3 accessory:(id)a4 recordingManagementService:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDCameraRecordingSettingsControl *v13;

  v8 = (void *)MEMORY[0x24BDD16D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDCameraRecordingSettingsControl initWithWorkQueue:accessory:recordingManagementService:notificationCenter:](self, "initWithWorkQueue:accessory:recordingManagementService:notificationCenter:", v11, v10, v9, v12);

  return v13;
}

- (HMDCameraRecordingSettingsControl)initWithWorkQueue:(id)a3 accessory:(id)a4 recordingManagementService:(id)a5 notificationCenter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDCameraRecordingSettingsControl *v16;
  HMDCameraRecordingSettingsControl *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *clientIdentifier;
  uint64_t v23;
  NSMutableArray *pendingConfigureCompletionHandlers;
  HMDCameraRecordingSettingsControl *v26;
  SEL v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v26 = (HMDCameraRecordingSettingsControl *)_HMFPreconditionFailure();
    return (HMDCameraRecordingSettingsControl *)-[HMDCameraRecordingSettingsControl videoConfigurationsByPreferenceOrder](v26, v27);
  }
  v28.receiver = self;
  v28.super_class = (Class)HMDCameraRecordingSettingsControl;
  v16 = -[HMDCameraRecordingSettingsControl init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_workQueue, a3);
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v17->_recordingService, a5);
    objc_storeStrong((id *)&v17->_notificationCenter, a6);
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@.HMDCameraRecordingSettingsControl.%@"), CFSTR("com.apple.HomeKitDaemon.Local"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v17->_clientIdentifier;
    v17->_clientIdentifier = (NSString *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    pendingConfigureCompletionHandlers = v17->_pendingConfigureCompletionHandlers;
    v17->_pendingConfigureCompletionHandlers = (NSMutableArray *)v23;

  }
  return v17;
}

- (NSArray)videoConfigurationsByPreferenceOrder
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  HMDCameraRecordingPreferredVideoConfiguration *v15;
  HMDCameraRecordingPreferredVideoConfiguration *v16;
  HMDCameraRecordingPreferredVideoConfiguration *v17;
  HMDCameraRecordingPreferredVideoConfiguration *v18;
  HMDCameraRecordingPreferredVideoConfiguration *v19;
  HMDCameraRecordingPreferredVideoConfiguration *v20;
  HMDCameraRecordingPreferredVideoConfiguration *v21;
  void *v22;
  id v24;
  HMDCameraRecordingPreferredVideoConfiguration *v25;
  HMDCameraRecordingPreferredVideoConfiguration *v26;
  HMDCameraRecordingPreferredVideoConfiguration *v27;
  HMDCameraRecordingPreferredVideoConfiguration *v28;
  void *v29;
  void *v30;
  HMDCameraRecordingPreferredVideoConfiguration *v31;
  HMDCameraRecordingPreferredVideoConfiguration *v32;
  HMDCameraRecordingPreferredVideoConfiguration *v33;
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v40[0] = &unk_24E96C188;
  v40[1] = &unk_24E96C1B8;
  v41[0] = &unk_24E96C1A0;
  v41[1] = &unk_24E96C1A0;
  v40[2] = &unk_24E96C1D0;
  v41[2] = &unk_24E96C1E8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = &unk_24E96C188;
  v38[1] = &unk_24E96C1B8;
  v39[0] = &unk_24E96C200;
  v39[1] = &unk_24E96C218;
  v38[2] = &unk_24E96C1D0;
  v39[2] = &unk_24E96C230;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[HMDCameraRecordingSettingsControl accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personManagerSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFaceClassificationEnabled");

  v11 = (uint64_t)v6;
  v12 = v6;
  if (v10)
  {
    v36[0] = &unk_24E96C188;
    v36[1] = &unk_24E96C1B8;
    v37[0] = &unk_24E96C248;
    v37[1] = &unk_24E96C248;
    v36[2] = &unk_24E96C1D0;
    v37[2] = &unk_24E96C260;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13;
    v12 = v14;

    v34[0] = &unk_24E96C188;
    v34[1] = &unk_24E96C1B8;
    v35[0] = &unk_24E96C260;
    v35[1] = &unk_24E96C260;
    v34[2] = &unk_24E96C1D0;
    v35[2] = &unk_24E96C278;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v11 = objc_claimAutoreleasedReturnValue();

  }
  v31 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 8, v5, &unk_24E96C200, 3);
  v30 = (void *)v5;
  v15 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 17, v5, &unk_24E96C200, 3);
  v28 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 7, v12, &unk_24E96C200, 2);
  v25 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 6, v11, &unk_24E96C200, 0);
  v27 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 3, v6, &unk_24E96C200, 1);
  v26 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 2, v6, &unk_24E96C200, 0);
  v16 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 10, v12, &unk_24E96C200, 2);
  v29 = (void *)v11;
  v17 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 9, v11, &unk_24E96C200, 0);
  v18 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 11, v12, &unk_24E96C200, 2);
  v19 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 12, v12, &unk_24E96C200, 2);
  v33 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 13, v12, &unk_24E96C200, 2);
  v32 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 14, v12, &unk_24E96C200, 2);
  v20 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 15, v6, &unk_24E96C200, 1);
  v21 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:]([HMDCameraRecordingPreferredVideoConfiguration alloc], "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", 16, v6, &unk_24E96C200, 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    objc_msgSend(v22, "addObject:", v15);
  objc_msgSend(v22, "addObject:", v16);
  objc_msgSend(v22, "addObject:", v17);
  objc_msgSend(v22, "addObject:", v33);
  objc_msgSend(v22, "addObject:", v32);
  objc_msgSend(v22, "addObject:", v20);
  objc_msgSend(v22, "addObject:", v21);
  if (_os_feature_enabled_impl())
    objc_msgSend(v22, "addObject:", v31);
  objc_msgSend(v22, "addObject:", v28);
  objc_msgSend(v22, "addObject:", v25);
  objc_msgSend(v22, "addObject:", v18);
  objc_msgSend(v22, "addObject:", v19);
  objc_msgSend(v22, "addObject:", v27);
  objc_msgSend(v22, "addObject:", v26);
  v24 = (id)objc_msgSend(v22, "copy");

  return (NSArray *)v24;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingSettingsControl *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  HMDCameraRecordingSettingsControl *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCameraRecordingSettingsControl *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting camera recording settings control", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraRecordingSettingsControl accessory](v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v26 = v5;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v27;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Not starting camera recording settings control because accessory reference is nil", (uint8_t *)&v28, 0xCu);

    }
    goto LABEL_12;
  }
  -[HMDCameraRecordingSettingsControl notificationCenter](v5, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel_handleAccessoryConnectedNotification_, CFSTR("HMDAccessoryConnectedNotification"), v8);

  -[HMDCameraRecordingSettingsControl notificationCenter](v5, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel_handleAccessoryDisconnectedNotification_, CFSTR("HMDAccessoryDisconnectedNotification"), v8);

  -[HMDCameraRecordingSettingsControl notificationCenter](v5, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel_handleCharacteristicsUpdatedNotification_, CFSTR("kHMDNotificationCharacteristicsUpdated"), v8);

  -[HMDCameraRecordingSettingsControl notificationCenter](v5, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel_handleCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v8);

  -[HMDCameraRecordingSettingsControl notificationCenter](v5, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel_handleHomePersonManagerSettingsDidChangeNotification_, CFSTR("HMDHomePersonManagerSettingsDidChangeNotification"), v14);

  -[HMDCameraRecordingSettingsControl enableCharacteristicNotifications](v5, "enableCharacteristicNotifications");
  -[HMDCameraRecordingSettingsControl configureCameraRecordingSettings](v5, "configureCameraRecordingSettings");
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferenceForKey:", CFSTR("recordingConfigurationOverrides"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  -[HMDCameraRecordingSettingsControl setRecordingConfigurationOverrides:](v5, "setRecordingConfigurationOverrides:", v19);
  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](v5, "recordingConfigurationOverrides");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v5;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](v22, "recordingConfigurationOverrides");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v24;
      v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Using recording configuration overrides: %@", (uint8_t *)&v28, 0x16u);

    }
LABEL_12:

    objc_autoreleasePoolPop(v21);
  }

}

- (void)handleAccessoryDisconnectedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDCameraRecordingSettingsControl_handleAccessoryDisconnectedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryConnectedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__HMDCameraRecordingSettingsControl_handleAccessoryConnectedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleCharacteristicsUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__HMDCameraRecordingSettingsControl_handleCharacteristicsUpdatedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDCameraRecordingSettingsControl *v9;

  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__HMDCameraRecordingSettingsControl_handleCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__HMDCameraRecordingSettingsControl_handleHomePersonManagerSettingsDidChangeNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_recordingGeneralConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDCameraRecordingSettingsControl *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDCameraRecordingSettingsControl *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMDCameraRecordingSettingsControl *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDCameraRecordingSettingsControl *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMDCameraRecordingSettingsControl *v47;
  NSObject *v48;
  void *v49;
  HMDCameraRecordingGeneralConfiguration *v50;
  HMDCameraRecordingMediaContainerParameters *v51;
  HMDCameraRecordingMediaContainerConfiguration *v52;
  void *v53;
  HMDCameraRecordingMediaContainerConfiguration *v54;
  HMDCameraRecordingGeneralConfiguration *v55;
  void *v56;
  void *v57;
  void *v58;
  HMDCameraRecordingSettingsControl *v59;
  NSObject *v60;
  void *v61;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id obj;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  HMDCameraRecordingMediaContainerConfiguration *v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("prebufferLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &unk_24E96C2D8;
  v7 = v6;
  -[HMDCameraRecordingSettingsControl supportedRecordingConfiguration](self, "supportedRecordingConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prebufferLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v46 = (void *)MEMORY[0x227676638]();
    v47 = self;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v49;
      _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Supported prebuffer length is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v46);
    v50 = 0;
    goto LABEL_40;
  }
  if (objc_msgSend(v7, "compare:", v9) == 1)
    v10 = v9;
  else
    v10 = v7;
  v11 = v10;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v78 = v15;
    v79 = 2112;
    v80 = v11;
    v81 = 2112;
    v82 = v7;
    v83 = 2112;
    v84 = v9;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Selecting prebuffer length of %@ because preferred length is %@ and supported length is %@", buf, 0x2Au);

  }
  v65 = v11;
  v66 = v9;
  v67 = v7;
  v68 = v5;

  objc_autoreleasePoolPop(v12);
  -[HMDCameraRecordingSettingsControl supportedRecordingConfiguration](v13, "supportedRecordingConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "eventTriggerOptions");

  v18 = (void *)MEMORY[0x227676638]();
  v19 = v13;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HMDCameraRecordingEventTriggerOptionsAsString(v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v21;
    v79 = 2112;
    v80 = v22;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Selecting event trigger options of %@", buf, 0x16u);

  }
  v63 = v17;

  objc_autoreleasePoolPop(v18);
  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](v19, "recordingConfigurationOverrides");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hmf_numberForKey:", CFSTR("fragmentLength"));
  v24 = objc_claimAutoreleasedReturnValue();

  v64 = (void *)v24;
  if (v24)
    v25 = (void *)v24;
  else
    v25 = &unk_24E96C2D8;
  v70 = v25;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[HMDCameraRecordingSettingsControl supportedRecordingConfiguration](v19, "supportedRecordingConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "mediaContainerConfigurations");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v27;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (!v28)
  {
LABEL_30:

LABEL_36:
    v58 = (void *)MEMORY[0x227676638]();
    v59 = v19;
    HMFGetOSLogHandle();
    v60 = objc_claimAutoreleasedReturnValue();
    v7 = v67;
    v5 = v68;
    v57 = v65;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v61;
      _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to select general configuration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v58);
    v50 = 0;
    goto LABEL_39;
  }
  v29 = v28;
  v30 = *(_QWORD *)v72;
LABEL_17:
  v31 = 0;
  v32 = obj;
  while (1)
  {
    if (*(_QWORD *)v72 != v30)
      objc_enumerationMutation(v32);
    v33 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v31);
    objc_msgSend(v33, "container", v63);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "type");

    if (!v35)
      break;
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v19;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v78 = v39;
      v79 = 2112;
      v80 = v33;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping container configuration: %@ unsupported container format", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
LABEL_28:
    if (v29 == ++v31)
    {
      v29 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      if (v29)
        goto LABEL_17;
      goto LABEL_30;
    }
  }
  objc_msgSend(v33, "parameters");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "fragmentLength");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v70, "compare:", v41) == 1)
  {
    v42 = (void *)MEMORY[0x227676638]();
    v43 = v19;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v78 = v45;
      v79 = 2112;
      v80 = v33;
      v81 = 2112;
      v82 = v70;
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Skipping container configuration: %@, requested fragment length is %@", buf, 0x20u);

      v32 = obj;
    }

    objc_autoreleasePoolPop(v42);
    goto LABEL_28;
  }
  v51 = -[HMDCameraRecordingMediaContainerParameters initWithFragmentLength:]([HMDCameraRecordingMediaContainerParameters alloc], "initWithFragmentLength:", v70);
  v52 = [HMDCameraRecordingMediaContainerConfiguration alloc];
  objc_msgSend(v33, "container");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[HMDCameraRecordingMediaContainerConfiguration initWithMediaContainer:containerParameters:](v52, "initWithMediaContainer:containerParameters:", v53, v51);

  if (!v54)
    goto LABEL_36;
  v55 = [HMDCameraRecordingGeneralConfiguration alloc];
  v75 = v54;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v75, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v65;
  v50 = -[HMDCameraRecordingGeneralConfiguration initWithPrebufferLength:eventTriggerOptions:mediaContainerConfigurations:](v55, "initWithPrebufferLength:eventTriggerOptions:mediaContainerConfigurations:", v65, v63, v56);

  v7 = v67;
  v5 = v68;
LABEL_39:
  v9 = v66;

LABEL_40:
  return v50;
}

- (id)_preferredVideoConfigurationOverride
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraRecordingPreferredVideoConfiguration *v16;
  void *v17;
  HMDCameraRecordingSettingsControl *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDCameraRecordingSettingsControl *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCameraRecordingSettingsControl *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDCameraRecordingSettingsControl *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDCameraRecordingSettingsControl *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDCameraRecordingSettingsControl *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDCameraRecordingSettingsControl *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDCameraRecordingVideoAttributes *v46;
  HMDCameraRecordingPreferredVideoConfiguration *v47;
  uint64_t v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("keyFrameInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("frameRate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_numberForKey:", CFSTR("imageWidth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_numberForKey:", CFSTR("imageHeight"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_numberForKey:", CFSTR("videoBitrate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hmf_numberForKey:", CFSTR("h264Level"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v5 && v7 && v9 && v11 && v13 && v15)
  {
    v51 = v5;
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Overriden video configuration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v18;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v24;
      v56 = 2112;
      v57 = v7;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Frame rate: %@fps", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v25 = (void *)MEMORY[0x227676638]();
    v26 = v22;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v28;
      v56 = 2112;
      v57 = v51;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Key frame interval: %@ms", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v26;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v32;
      v56 = 2112;
      v57 = v9;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Image width: %@px", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v33 = (void *)MEMORY[0x227676638]();
    v34 = v30;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v36;
      v56 = 2112;
      v57 = v11;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Image height: %@px", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v37 = (void *)MEMORY[0x227676638]();
    v38 = v34;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v40;
      v56 = 2112;
      v57 = v13;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Video bit rate: %@kbps", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    v41 = (void *)MEMORY[0x227676638]();
    v42 = v38;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      HMDCameraRecordingH264LevelTypeAsString(objc_msgSend(v15, "integerValue"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v44;
      v56 = 2112;
      v57 = v45;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@H264 Level is: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v41);
    v46 = -[HMDCameraRecordingVideoAttributes initWithImageWidth:imageHeight:frameRate:]([HMDCameraRecordingVideoAttributes alloc], "initWithImageWidth:imageHeight:frameRate:", v9, v11, v7);
    v47 = [HMDCameraRecordingPreferredVideoConfiguration alloc];
    v48 = -[HMDCameraRecordingVideoAttributes resolution](v46, "resolution");
    v52 = v7;
    v53 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v51;
    v16 = -[HMDCameraRecordingPreferredVideoConfiguration initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:](v47, "initWithResolution:bitRateByFrameRate:keyFrameInterval:h264Level:", v48, v49, v51, objc_msgSend(v15, "integerValue"));

  }
  return v16;
}

- (id)_preferredAudioConfigurationOverride
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraRecordingPreferredAudioConfiguration *v8;
  void *v9;
  HMDCameraRecordingSettingsControl *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDCameraRecordingSettingsControl *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCameraRecordingSettingsControl *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("audioBitRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSettingsControl recordingConfigurationOverrides](self, "recordingConfigurationOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("audioSampleRate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v5 && v7)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Overriden audio configuration", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v10;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Bit rate: %@kbps", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v14;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Sample rate: %@kHz", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v8 = -[HMDCameraRecordingPreferredAudioConfiguration initWithSampleRate:bitRate:]([HMDCameraRecordingPreferredAudioConfiguration alloc], "initWithSampleRate:bitRate:", objc_msgSend(v7, "integerValue"), v5);
  }

  return v8;
}

- (id)_recordingVideoConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDCameraRecordingSettingsControl *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDCameraRecordingSettingsControl *v23;
  NSObject *v24;
  void *v25;
  HMDCameraRecordingVideoAttributes *v26;
  uint64_t v27;
  HMDCameraRecordingVideoCodecParameters *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraRecordingVideoCodecParameters *v34;
  HMDCameraRecordingVideoCodecConfiguration *v35;
  void *v36;
  HMDCameraRecordingVideoCodecConfiguration *v37;
  void *v38;
  HMDCameraRecordingSettingsControl *v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v44;
  void *v45;
  id obj;
  HMDCameraRecordingVideoAttributes *obja;
  HMDCameraRecordingSettingsControl *v48;
  HMDCameraRecordingH264Level *v49;
  _QWORD v50[6];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  HMDCameraRecordingVideoAttributes *v55;
  HMDCameraRecordingH264Level *v56;
  uint64_t v57;
  uint8_t v58[4];
  id v59;
  __int16 v60;
  void *v61;
  uint8_t v62[128];
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl _preferredVideoConfigurationOverride](self, "_preferredVideoConfigurationOverride");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    objc_msgSend(v45, "addObject:");
  -[HMDCameraRecordingSettingsControl videoConfigurationsByPreferenceOrder](self, "videoConfigurationsByPreferenceOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObjectsFromArray:", v4);

  v5 = (void *)MEMORY[0x227676638]();
  v48 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v45;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Video parameters in order of preference: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v64 = __Block_byref_object_copy__173794;
  v65 = __Block_byref_object_dispose__173795;
  v66 = 0;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[HMDCameraRecordingSettingsControl supportedVideoConfiguration](v48, "supportedVideoConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codecConfigurations");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        +[HMDCameraRecordingSettingsControl videoCodecForCodecConfiguration:](HMDCameraRecordingSettingsControl, "videoCodecForCodecConfiguration:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v15;
        if (v15)
        {
          +[HMDCameraRecordingSettingsControl h264ProfileForCodecConfiguration:](HMDCameraRecordingSettingsControl, "h264ProfileForCodecConfiguration:", v14);
          v16 = objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v50[0] = MEMORY[0x24BDAC760];
            v50[1] = 3221225472;
            v50[2] = __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke;
            v50[3] = &unk_24E78C7B8;
            v50[4] = v14;
            v50[5] = buf;
            objc_msgSend(v45, "na_firstObjectPassingTest:", v50);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {

              v26 = [HMDCameraRecordingVideoAttributes alloc];
              v27 = objc_msgSend(v17, "resolution");
              obja = -[HMDCameraRecordingVideoAttributes initWithResolution:frameRate:](v26, "initWithResolution:frameRate:", v27, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
              v49 = -[HMDCameraRecordingH264Level initWithH264Level:]([HMDCameraRecordingH264Level alloc], "initWithH264Level:", objc_msgSend(v17, "h264Level"));
              v28 = [HMDCameraRecordingVideoCodecParameters alloc];
              v57 = v16;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v49;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "bitRateByFrameRate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "keyFrameInterval");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = -[HMDCameraRecordingVideoCodecParameters initWithProfiles:levels:bitRate:iFrameInterval:](v28, "initWithProfiles:levels:bitRate:iFrameInterval:", v29, v30, v32, v33);

              v35 = [HMDCameraRecordingVideoCodecConfiguration alloc];
              v55 = obja;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = -[HMDCameraRecordingVideoCodecConfiguration initWithCodec:codecParameters:videoAttributes:](v35, "initWithCodec:codecParameters:videoAttributes:", v10, v34, v36);

              v11 = (void *)v16;
              goto LABEL_28;
            }
            v11 = (void *)v16;
          }
          else
          {
            v22 = (void *)MEMORY[0x227676638]();
            v23 = v48;
            HMFGetOSLogHandle();
            v24 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v58 = 138543618;
              v59 = v25;
              v60 = 2112;
              v61 = v14;
              _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping video codec configuration %@, H264 profile is not supported", v58, 0x16u);

            }
            objc_autoreleasePoolPop(v22);
            v11 = 0;
          }
        }
        else
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = v48;
          HMFGetOSLogHandle();
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v58 = 138543618;
            v59 = v21;
            v60 = 2112;
            v61 = v14;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Skipping video codec configuration %@, codec type is not supported", v58, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }

  v38 = (void *)MEMORY[0x227676638]();
  v39 = v48;
  HMFGetOSLogHandle();
  v40 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v41 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl supportedVideoConfiguration](v39, "supportedVideoConfiguration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v58 = 138543618;
    v59 = v41;
    v60 = 2112;
    v61 = v42;
    _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to select video configuration from supported video configuration: %@", v58, 0x16u);

  }
  objc_autoreleasePoolPop(v38);
  v17 = 0;
  v37 = 0;
LABEL_28:
  _Block_object_dispose(buf, 8);

  return v37;
}

- (id)characteristicsToMonitor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSettingsControl recordingActiveCharacteristic](self, "recordingActiveCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HMDCameraRecordingSettingsControl recordingSelectedConfigurationCharacteristic](self, "recordingSelectedConfigurationCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (BOOL)isPrimaryResident
{
  void *v2;
  void *v3;
  char v4;

  -[HMDCameraRecordingSettingsControl accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident");

  return v4;
}

- (HMDCharacteristic)recordingActiveCharacteristic
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingSettingsControl recordingService](self, "recordingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x24BDD5770]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCharacteristic *)v3;
}

- (HMDCharacteristic)recordingSupportedGeneralConfigurationCharacteristic
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingSettingsControl recordingService](self, "recordingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000205-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCharacteristic *)v3;
}

- (HMDCharacteristic)recordingSupportedAudioConfigurationCharacteristic
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingSettingsControl recordingService](self, "recordingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000207-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCharacteristic *)v3;
}

- (HMDCharacteristic)recordingSupportedVideoConfigurationCharacteristic
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingSettingsControl recordingService](self, "recordingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000206-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCharacteristic *)v3;
}

- (HMDCharacteristic)recordingSelectedConfigurationCharacteristic
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingSettingsControl recordingService](self, "recordingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("00000209-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCharacteristic *)v3;
}

- (id)_recordingAudioConfiguration
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void **p_cache;
  void *v8;
  void *v9;
  HMDCameraRecordingSettingsControl *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  HMDCameraRecordingSettingsControl *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMDCameraRecordingSettingsControl *v41;
  void *v42;
  void *v43;
  HMDCameraRecordingSettingsControl *v44;
  void *v45;
  void *v46;
  HMDCameraRecordingSettingsControl *v47;
  NSObject *v48;
  void *v49;
  HMDCameraRecordingAudioCodecConfiguration *v50;
  HMDCameraRecordingAudioSampleRate *v51;
  HMDCameraRecordingAudioCodecParameters *v52;
  void *v53;
  void *v54;
  void *v55;
  HMDCameraRecordingAudioCodecParameters *v56;
  void *v58;
  HMDCameraRecordingSettingsControl *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id obj;
  uint64_t v66;
  id v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  HMDCameraRecordingAudioSampleRate *v81;
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl _preferredAudioConfigurationOverride](self, "_preferredAudioConfigurationOverride");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addObject:", v4);
  v60 = (void *)v4;
  p_cache = HMDCameraRecordingVideoAttributes.cache;
  +[HMDCameraRecordingSettingsControl audioConfigurationsByPreferenceOrder](HMDCameraRecordingSettingsControl, "audioConfigurationsByPreferenceOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v59 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v87 = v12;
    v88 = 2112;
    v89 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Preferred audio parameters: %@", buf, 0x16u);

    v10 = v59;
  }

  objc_autoreleasePoolPop(v9);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[HMDCameraRecordingSettingsControl supportedAudioConfiguration](v10, "supportedAudioConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "codecConfigurations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v14;
  v63 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  v15 = 0;
  v16 = 0;
  if (v63)
  {
    v64 = *(_QWORD *)v78;
    do
    {
      v17 = 0;
      do
      {
        v18 = v16;
        if (*(_QWORD *)v78 != v64)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v17);
        objc_msgSend(p_cache + 28, "audioCodecForCodecConfiguration:", v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = v17;
        if (v16)
        {
          objc_msgSend(p_cache + 28, "audioBitRateForCodecConfiguration:", v19);
          v20 = objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v61 = (void *)v20;
            v62 = v16;
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v58 = v19;
            objc_msgSend(v19, "parameters");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "audioSampleRates");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v67 = v22;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
            if (v23)
            {
              v24 = v23;
              v68 = *(_QWORD *)v74;
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v74 != v68)
                    objc_enumerationMutation(v67);
                  v26 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                  v69 = 0u;
                  v70 = 0u;
                  v71 = 0u;
                  v72 = 0u;
                  v27 = v6;
                  v28 = v6;
                  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
                  if (v29)
                  {
                    v30 = v29;
                    v31 = *(_QWORD *)v70;
LABEL_19:
                    v32 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v70 != v31)
                        objc_enumerationMutation(v28);
                      v33 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v32);
                      v34 = objc_msgSend(v33, "sampleRate");
                      if (objc_msgSend(v26, "type") == v34)
                        break;
                      if (v30 == ++v32)
                      {
                        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
                        if (v30)
                          goto LABEL_19;
                        goto LABEL_25;
                      }
                    }
                    v35 = v33;

                    if (!v35)
                      goto LABEL_27;

                    v51 = -[HMDCameraRecordingAudioSampleRate initWithSampleRate:]([HMDCameraRecordingAudioSampleRate alloc], "initWithSampleRate:", objc_msgSend(v35, "sampleRate"));
                    v52 = [HMDCameraRecordingAudioCodecParameters alloc];
                    v15 = v61;
                    v82 = v61;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v81 = v51;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v81, 1);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "bitRate");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    v56 = -[HMDCameraRecordingAudioCodecParameters initWithChannelCount:bitRateModes:audioSampleRates:maxAudioBitRate:](v52, "initWithChannelCount:bitRateModes:audioSampleRates:maxAudioBitRate:", &unk_24E96C2F0, v53, v54, v55);

                    v16 = v62;
                    v50 = -[HMDCameraRecordingAudioCodecConfiguration initWithAudioCodec:codecParameters:]([HMDCameraRecordingAudioCodecConfiguration alloc], "initWithAudioCodec:codecParameters:", v62, v56);

                    v6 = v27;
                    goto LABEL_44;
                  }
LABEL_25:

LABEL_27:
                  v6 = v27;
                }
                v24 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
                if (v24)
                  continue;
                break;
              }
            }

            v36 = (void *)MEMORY[0x227676638]();
            v10 = v59;
            v37 = v59;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v87 = v39;
              v88 = 2112;
              v89 = v58;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping audio codec configuration %@ preferred audio configuration is not supported", buf, 0x16u);

            }
            v15 = v61;
            v16 = v62;
            p_cache = (void **)(HMDCameraRecordingVideoAttributes + 16);
          }
          else
          {
            v43 = v19;
            v36 = (void *)MEMORY[0x227676638]();
            v44 = v10;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v87 = v45;
              v88 = 2112;
              v89 = v43;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping audio codec configuration %@ bit rate mode is not supported", buf, 0x16u);

            }
            v15 = 0;
          }
        }
        else
        {
          v40 = v19;
          v36 = (void *)MEMORY[0x227676638]();
          v41 = v10;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v87 = v42;
            v88 = 2112;
            v89 = v40;
            _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping audio codec configuration %@ codec type is not supported", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v36);
        v17 = v66 + 1;
      }
      while (v66 + 1 != v63);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    }
    while (v63);
  }

  v46 = (void *)MEMORY[0x227676638]();
  v47 = v10;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v87 = v49;
    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to select audio configuration", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v46);
  v50 = 0;
LABEL_44:

  return v50;
}

- (void)enableCharacteristicNotifications
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingSettingsControl *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl characteristicsToMonitor](v5, "characteristicsToMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for characteristics: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraRecordingSettingsControl accessory](v5, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSettingsControl characteristicsToMonitor](v5, "characteristicsToMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSettingsControl clientIdentifier](v5, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enableNotification:forCharacteristics:message:clientIdentifier:", 1, v10, 0, v11);

}

- (void)dealloc
{
  void *v3;
  HMDCameraRecordingSettingsControl *v4;
  NSObject *v5;
  void *v6;
  NSString *clientIdentifier;
  id WeakRetained;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    clientIdentifier = v4->_clientIdentifier;
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = clientIdentifier;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating recording settings control and disabling characteristic notifications with client identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  WeakRetained = objc_loadWeakRetained((id *)&v4->_accessory);
  -[HMDCameraRecordingSettingsControl characteristicsToMonitor](v4, "characteristicsToMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "enableNotification:forCharacteristics:message:clientIdentifier:", 0, v9, 0, v4->_clientIdentifier);

  v10.receiver = v4;
  v10.super_class = (Class)HMDCameraRecordingSettingsControl;
  -[HMDCameraRecordingSettingsControl dealloc](&v10, sel_dealloc);
}

- (void)configureCameraRecordingSettings
{
  NSObject *v3;

  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl configureCameraRecordingSettingsWithCompletion:](self, "configureCameraRecordingSettingsWithCompletion:", &__block_literal_global_173776);
}

- (void)configureCameraRecordingSettingsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMDCameraRecordingSettingsControl *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSettingsControl pendingConfigureCompletionHandlers](self, "pendingConfigureCompletionHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _Block_copy(v4);
  objc_msgSend(v6, "addObject:", v7);

  -[HMDCameraRecordingSettingsControl pendingConfigureCompletionHandlers](self, "pendingConfigureCompletionHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 2)
  {
    if (-[HMDCameraRecordingSettingsControl isPrimaryResident](self, "isPrimaryResident"))
      -[HMDCameraRecordingSettingsControl _writeCameraRecordingSettings](self, "_writeCameraRecordingSettings");
    else
      -[HMDCameraRecordingSettingsControl _readCameraRecordingSettings](self, "_readCameraRecordingSettings");
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Deferring new configure request to be invoked when in-progress configure finishes", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)reconfigureCameraRecordingSettingsWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingSettingsControl *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Reconfiguring camera recording settings: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingSettingsControl setCurrentSelectedConfiguration:](v7, "setCurrentSelectedConfiguration:", 0);
  -[HMDCameraRecordingSettingsControl configureCameraRecordingSettings](v7, "configureCameraRecordingSettings");

}

- (void)handleAccessoryIsNotConfiguredError
{
  NSObject *v3;

  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl reconfigureCameraRecordingSettingsWithReason:](self, "reconfigureCameraRecordingSettingsWithReason:", CFSTR("Handling accessory is not configured error"));
}

- (BOOL)_shouldReconfigureForChangedCharacteristic:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;

  v4 = a3;
  -[HMDCameraRecordingSettingsControl recordingActiveCharacteristic](self, "recordingActiveCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else if (-[HMDCameraRecordingSettingsControl isPrimaryResident](self, "isPrimaryResident"))
  {
    v7 = 0;
  }
  else
  {
    -[HMDCameraRecordingSettingsControl recordingSelectedConfigurationCharacteristic](self, "recordingSelectedConfigurationCharacteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v8);

  }
  return v7;
}

- (void)_writeCameraRecordingSettings
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDCameraRecordingSettingsControl *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl currentSelectedConfiguration](self, "currentSelectedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDCameraRecordingSettingsControl currentSelectedConfiguration](self, "currentSelectedConfiguration");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:](self, "_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:");

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring camera recording settings on primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDCameraRecordingSettingsControl _readSupportedCameraRecordingConfiguration](v6, "_readSupportedCameraRecordingConfiguration");
  }
}

- (void)_updateSelectedRecordingConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingSettingsControl *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638](-[HMDCameraRecordingSettingsControl setCurrentSelectedConfiguration:](self, "setCurrentSelectedConfiguration:", v4));
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate to notify that recording settings are configured", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingSettingsControl delegate](v7, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordingSettingsControlDidConfigure:", v7);

  -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:](v7, "_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:", v4);
}

- (void)_readCameraRecordingSettings
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  HMDCameraRecordingSelectedConfiguration *v13;
  void *v14;
  HMDCameraRecordingSettingsControl *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  HMDCameraRecordingSettingsControl *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[2];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl recordingActiveCharacteristic](self, "recordingActiveCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSettingsControl recordingSelectedConfigurationCharacteristic](self, "recordingSelectedConfigurationCharacteristic");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v6, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
      v13 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingSelectedConfiguration alloc], "initWithTLVData:", v12);
    else
      v13 = 0;
    if (-[HMDCameraRecordingSettingsControl canUseCachedCharacteristicValues](self, "canUseCachedCharacteristicValues")
      && v9
      && v13)
    {
      -[HMDCameraRecordingSettingsControl _handleCurrentIsRecordingActive:selectedConfiguration:](self, "_handleCurrentIsRecordingActive:selectedConfiguration:", v9, v13);
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingSettingsControl canUseCachedCharacteristicValues](v22, "canUseCachedCharacteristicValues");
        HMFBooleanToString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = CFSTR("<nil>");
        *(_DWORD *)buf = 138544130;
        v37 = (uint64_t)v24;
        if (v9)
          v28 = CFSTR("<not nil>");
        else
          v28 = CFSTR("<nil>");
        if (v13)
          v27 = CFSTR("<not nil>");
        v38 = 2112;
        v39 = v25;
        v40 = 2112;
        v41 = v28;
        v42 = 2112;
        v43 = v27;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Reading from accessory because can use cached characteristic values is %@, recording active characteristic value is %@, and selected configuration characteristic value is %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
      +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v29;
      +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDCameraRecordingSettingsControl accessory](v22, "accessory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSettingsControl workQueue](v22, "workQueue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __65__HMDCameraRecordingSettingsControl__readCameraRecordingSettings__block_invoke;
      v34[3] = &unk_24E792720;
      v34[4] = v22;
      objc_msgSend(v32, "readCharacteristicValues:source:queue:completionHandler:", v31, 7, v33, v34);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("<nil>");
      if (v4)
        v20 = CFSTR("<not nil>");
      else
        v20 = CFSTR("<nil>");
      *(_DWORD *)buf = 138543874;
      v37 = v17;
      v39 = (uint64_t)v20;
      v38 = 2112;
      if (v6)
        v19 = CFSTR("<not nil>");
      v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Mandatory recording active characteristic (%@) or selected configuration characteristic (%@) was not found on recording service", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithError:](v15, "_invokePendingConfigureCompletionHandlersWithError:", v9);
  }

}

- (void)_handleCurrentIsRecordingActive:(id)a3 selectedConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  HMDCameraRecordingSettingsControl *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCameraRecordingSettingsControl *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDCameraRecordingSettingsControl *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDCameraRecordingSettingsControl *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDCameraRecordingSettingsControl *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  _QWORD v54[7];

  v54[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v54[0] = *MEMORY[0x24BDD5770];
  v54[1] = CFSTR("00000205-0000-1000-8000-0026BB765291");
  v54[2] = CFSTR("00000207-0000-1000-8000-0026BB765291");
  v54[3] = CFSTR("00000206-0000-1000-8000-0026BB765291");
  v54[4] = CFSTR("00000209-0000-1000-8000-0026BB765291");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 5);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v12);
        -[HMDCameraRecordingSettingsControl recordingService](self, "recordingService", (_QWORD)v45);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "findCharacteristicWithType:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v35 = (void *)MEMORY[0x227676638]();
          v36 = self;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v38;
            v51 = 2112;
            v52 = v13;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Recording service does not have required characteristic type: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v35);
          -[HMDCameraRecordingSettingsControl setCurrentSelectedConfiguration:](v36, "setCurrentSelectedConfiguration:", 0);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithError:](v36, "_invokePendingConfigureCompletionHandlersWithError:", v39);

          goto LABEL_25;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v10)
        continue;
      break;
    }
  }

  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    -[HMDCameraRecordingSettingsControl currentSelectedConfiguration](self, "currentSelectedConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tlvData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tlvData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToData:", v18);

    if ((v19 & 1) == 0)
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "generalConfiguration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v23;
        v51 = 2112;
        v52 = v24;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating selected general configuration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v21;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "videoConfiguration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v28;
        v51 = 2112;
        v52 = v29;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating selected video configuration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v26;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "audioConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v33;
        v51 = 2112;
        v52 = v34;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating selected audio configuration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      -[HMDCameraRecordingSettingsControl _updateSelectedRecordingConfiguration:](v31, "_updateSelectedRecordingConfiguration:", v7);
    }
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:](self, "_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:", v7, (_QWORD)v45);
  }
  else
  {
    v40 = (void *)MEMORY[0x227676638]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v43;
      v51 = 2112;
      v52 = v6;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Recording active is disabled: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    -[HMDCameraRecordingSettingsControl setCurrentSelectedConfiguration:](v41, "setCurrentSelectedConfiguration:", 0);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithError:](v41, "_invokePendingConfigureCompletionHandlersWithError:", v44);

  }
LABEL_25:

}

- (void)_readSupportedCameraRecordingConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl recordingActiveCharacteristic](self, "recordingActiveCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  -[HMDCameraRecordingSettingsControl recordingSupportedGeneralConfigurationCharacteristic](self, "recordingSupportedGeneralConfigurationCharacteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  -[HMDCameraRecordingSettingsControl recordingSupportedAudioConfigurationCharacteristic](self, "recordingSupportedAudioConfigurationCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  -[HMDCameraRecordingSettingsControl recordingSupportedVideoConfigurationCharacteristic](self, "recordingSupportedVideoConfigurationCharacteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSettingsControl accessory](self, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__HMDCameraRecordingSettingsControl__readSupportedCameraRecordingConfiguration__block_invoke;
  v15[3] = &unk_24E792720;
  v15[4] = self;
  objc_msgSend(v13, "readCharacteristicValues:source:queue:completionHandler:", v12, 7, v14, v15);

}

- (void)_handleSupportedConfigurationCharacteristicsReadResponses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraRecordingSettingsControl *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraRecordingSettingsControl *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraRecordingSettingsControl *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCameraRecordingSettingsControl *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDCameraRecordingSettingsControl *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDCameraRecordingSettingsControl *v38;
  NSObject *v39;
  void *v40;
  HMDCameraRecordingSelectedConfiguration *v41;
  void *v42;
  HMDCameraRecordingSettingsControl *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSettingsControl _isRecordingActiveValueInResponses:](self, "_isRecordingActiveValueInResponses:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    -[HMDCameraRecordingSettingsControl _generalRecordingConfigurationInResponses:](self, "_generalRecordingConfigurationInResponses:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl setSupportedRecordingConfiguration:](self, "setSupportedRecordingConfiguration:", v7);

    -[HMDCameraRecordingSettingsControl _supportedVideoConfigurationInResponses:](self, "_supportedVideoConfigurationInResponses:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl setSupportedVideoConfiguration:](self, "setSupportedVideoConfiguration:", v8);

    -[HMDCameraRecordingSettingsControl _supportedAudioConfigurationInResponses:](self, "_supportedAudioConfigurationInResponses:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl setSupportedAudioConfiguration:](self, "setSupportedAudioConfiguration:", v9);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSettingsControl supportedRecordingConfiguration](v11, "supportedRecordingConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v13;
      v49 = 2112;
      v50 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating supported recording configuration to: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSettingsControl supportedVideoConfiguration](v16, "supportedVideoConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v18;
      v49 = 2112;
      v50 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating supported video configuration to: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v16;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSettingsControl supportedAudioConfiguration](v21, "supportedAudioConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v23;
      v49 = 2112;
      v50 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating supported audio configuration to: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDCameraRecordingSettingsControl _recordingGeneralConfiguration](v21, "_recordingGeneralConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl _recordingVideoConfiguration](v21, "_recordingVideoConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl _recordingAudioConfiguration](v21, "_recordingAudioConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x227676638]();
    v29 = v21;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v25 && v26 && v27)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138543618;
        v48 = v32;
        v49 = 2112;
        v50 = v25;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Setting selected general configuration: %@", (uint8_t *)&v47, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v33 = (void *)MEMORY[0x227676638]();
      v34 = v29;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138543618;
        v48 = v36;
        v49 = 2112;
        v50 = v26;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Setting selected video configuration: %@", (uint8_t *)&v47, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      v37 = (void *)MEMORY[0x227676638]();
      v38 = v34;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138543618;
        v48 = v40;
        v49 = 2112;
        v50 = v27;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Setting selected audio configuration: %@", (uint8_t *)&v47, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      v41 = -[HMDCameraRecordingSelectedConfiguration initWithGeneralConfiguration:videoCodecConfiguration:audioCodecConfiguration:]([HMDCameraRecordingSelectedConfiguration alloc], "initWithGeneralConfiguration:videoCodecConfiguration:audioCodecConfiguration:", v25, v26, v27);
      -[HMDCameraRecordingSettingsControl _setSelectedRecordingConfiguration:](v38, "_setSelectedRecordingConfiguration:", v41);
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138543362;
        v48 = v46;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Skipping selected configuration write because of invalid selected config", (uint8_t *)&v47, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v41 = (HMDCameraRecordingSelectedConfiguration *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithError:](v29, "_invokePendingConfigureCompletionHandlersWithError:", v41);
    }

  }
  else
  {
    v42 = (void *)MEMORY[0x227676638]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v45;
      v49 = 2112;
      v50 = v6;
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Recording active is disabled: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v42);
    -[HMDCameraRecordingSettingsControl setCurrentSelectedConfiguration:](v43, "setCurrentSelectedConfiguration:", 0);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithError:](v43, "_invokePendingConfigureCompletionHandlersWithError:", v25);
  }

}

- (id)_isRecordingActiveValueInResponses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDCameraRecordingSettingsControl *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSettingsControl _numberValueForCharacteristicOfType:inResponses:](self, "_numberValueForCharacteristicOfType:inResponses:", *MEMORY[0x24BDD5770], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Response missing recording active", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

  return v7;
}

- (id)_selectedRecordingConfigurationInResponses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingSelectedConfiguration *v7;
  void *v8;
  HMDCameraRecordingSettingsControl *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  HMDCameraRecordingSettingsControl *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSettingsControl _dataValueForCharacteristicOfType:inResponses:](self, "_dataValueForCharacteristicOfType:inResponses:", CFSTR("00000209-0000-1000-8000-0026BB765291"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      v12 = "%{public}@Response missing selected camera recording configuration";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v8);
    v7 = 0;
    goto LABEL_9;
  }
  v7 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingSelectedConfiguration alloc], "initWithTLVData:", v6);
  if (!v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      v12 = "%{public}@Failed to parse camera recording selected configuration";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (id)_generalRecordingConfigurationInResponses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingGeneralConfiguration *v7;
  void *v8;
  HMDCameraRecordingSettingsControl *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  HMDCameraRecordingSettingsControl *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSettingsControl _dataValueForCharacteristicOfType:inResponses:](self, "_dataValueForCharacteristicOfType:inResponses:", CFSTR("00000205-0000-1000-8000-0026BB765291"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      v12 = "%{public}@Response missing supported recording configuration";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v8);
    v7 = 0;
    goto LABEL_9;
  }
  v7 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingGeneralConfiguration alloc], "initWithTLVData:", v6);
  if (!v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      v12 = "%{public}@Failed to parse camera recording general configuration";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (id)_supportedAudioConfigurationInResponses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingSupportedAudioConfiguration *v7;
  void *v8;
  HMDCameraRecordingSettingsControl *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  HMDCameraRecordingSettingsControl *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSettingsControl _dataValueForCharacteristicOfType:inResponses:](self, "_dataValueForCharacteristicOfType:inResponses:", CFSTR("00000207-0000-1000-8000-0026BB765291"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      v12 = "%{public}@Response missing supported audio configuration";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v8);
    v7 = 0;
    goto LABEL_9;
  }
  v7 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingSupportedAudioConfiguration alloc], "initWithTLVData:", v6);
  if (!v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      v12 = "%{public}@Failed to parse camera recording audio configuration";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (id)_supportedVideoConfigurationInResponses:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingSupportedVideoConfiguration *v7;
  void *v8;
  HMDCameraRecordingSettingsControl *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  HMDCameraRecordingSettingsControl *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSettingsControl _dataValueForCharacteristicOfType:inResponses:](self, "_dataValueForCharacteristicOfType:inResponses:", CFSTR("00000206-0000-1000-8000-0026BB765291"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      v12 = "%{public}@Response missing supported video configuration";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v8);
    v7 = 0;
    goto LABEL_9;
  }
  v7 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingSupportedVideoConfiguration alloc], "initWithTLVData:", v6);
  if (!v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      v12 = "%{public}@Failed to parse camera recording video configuration";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (id)_dataValueForCharacteristicOfType:(id)a3 inResponses:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
      objc_msgSend(v14, "request", (_QWORD)v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "characteristic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v6);

      if (v18)
      {
        objc_msgSend(v14, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v20 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;
        v21 = v20;

        if (v21)
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v19 = 0;
  }

  return v19;
}

- (id)_numberValueForCharacteristicOfType:(id)a3 inResponses:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
      objc_msgSend(v14, "request", (_QWORD)v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "characteristic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v6);

      if (v18)
      {
        objc_msgSend(v14, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v20 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;
        v21 = v20;

        if (v21)
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v19 = 0;
  }

  return v19;
}

- (void)_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:(id)a3
{
  NSObject *v4;
  HMDCameraRecordingSettingsControl *v5;
  SEL v6;
  id v7;
  id v8;

  v8 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v8)
  {
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:error:](self, "_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:error:", v8, 0);

  }
  else
  {
    v5 = (HMDCameraRecordingSettingsControl *)_HMFPreconditionFailure();
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithError:](v5, v6, v7);
  }
}

- (void)_invokePendingConfigureCompletionHandlersWithError:(id)a3
{
  NSObject *v4;
  HMDCameraRecordingSettingsControl *v5;
  SEL v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v9)
  {
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:error:](self, "_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:error:", 0, v9);

  }
  else
  {
    v5 = (HMDCameraRecordingSettingsControl *)_HMFPreconditionFailure();
    -[HMDCameraRecordingSettingsControl _invokePendingConfigureCompletionHandlersWithSelectedConfiguration:error:](v5, v6, v7, v8);
  }
}

- (void)_invokePendingConfigureCompletionHandlersWithSelectedConfiguration:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if ((v6 != 0) != (v7 == 0))
    _HMFPreconditionFailure();
  -[HMDCameraRecordingSettingsControl pendingConfigureCompletionHandlers](self, "pendingConfigureCompletionHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[HMDCameraRecordingSettingsControl pendingConfigureCompletionHandlers](self, "pendingConfigureCompletionHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)_setSelectedRecordingConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingSettingsControl recordingService](self, "recordingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findCharacteristicWithType:", CFSTR("00000209-0000-1000-8000-0026BB765291"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v7, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRecordingSettingsControl accessory](self, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __72__HMDCameraRecordingSettingsControl__setSelectedRecordingConfiguration___block_invoke;
  v14[3] = &unk_24E798770;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v10, "writeCharacteristicValues:source:queue:completionHandler:", v11, 7, v12, v14);

}

- (BOOL)isCameraConfiguredForRecording
{
  HMDCameraRecordingSettingsControl *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  -[HMDCameraRecordingSettingsControl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSettingsControl currentSelectedConfiguration](v2, "currentSelectedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCameraRecordingSettingsControl accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSettingsControl recordingService](self, "recordingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMDCameraRecordingSettingsControlDelegate)delegate
{
  return (HMDCameraRecordingSettingsControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDService)recordingService
{
  return (HMDService *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableArray)pendingConfigureCompletionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)canUseCachedCharacteristicValues
{
  return self->_canUseCachedCharacteristicValues;
}

- (void)setCanUseCachedCharacteristicValues:(BOOL)a3
{
  self->_canUseCachedCharacteristicValues = a3;
}

- (HMDCameraRecordingGeneralConfiguration)supportedRecordingConfiguration
{
  return (HMDCameraRecordingGeneralConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSupportedRecordingConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMDCameraRecordingSupportedVideoConfiguration)supportedVideoConfiguration
{
  return (HMDCameraRecordingSupportedVideoConfiguration *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSupportedVideoConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (HMDCameraRecordingSupportedAudioConfiguration)supportedAudioConfiguration
{
  return (HMDCameraRecordingSupportedAudioConfiguration *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSupportedAudioConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (HMDCameraRecordingSelectedConfiguration)currentSelectedConfiguration
{
  return (HMDCameraRecordingSelectedConfiguration *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentSelectedConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)recordingConfigurationOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRecordingConfigurationOverrides:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingConfigurationOverrides, 0);
  objc_storeStrong((id *)&self->_currentSelectedConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedAudioConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedVideoConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedRecordingConfiguration, 0);
  objc_storeStrong((id *)&self->_pendingConfigureCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_recordingService, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __72__HMDCameraRecordingSettingsControl__setSelectedRecordingConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v31 = a1;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v9);
      objc_msgSend(v10, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "characteristic");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("00000209-0000-1000-8000-0026BB765291"));

      if ((v14 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v10;

    if (!v15)
      goto LABEL_15;
    objc_msgSend(v15, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(v31 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "error");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v21;
        v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@The select configuration control reply errored out: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v23 = *(void **)(v31 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 59);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_invokePendingConfigureCompletionHandlersWithError:", v24);

    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v30;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Successfully set the selected recording configuration", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(v31 + 32), "_updateSelectedRecordingConfiguration:", *(_QWORD *)(v31 + 40));
    }
  }
  else
  {
LABEL_9:

LABEL_15:
    v25 = (void *)MEMORY[0x227676638]();
    v26 = *(id *)(v31 + 32);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@The select configuration control reply does not contain a response", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v29 = *(void **)(v31 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 59);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_invokePendingConfigureCompletionHandlersWithError:", v15);
  }

}

uint64_t __79__HMDCameraRecordingSettingsControl__readSupportedCameraRecordingConfiguration__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSupportedConfigurationCharacteristicsReadResponses:", a2);
}

void __65__HMDCameraRecordingSettingsControl__readCameraRecordingSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_isRecordingActiveValueInResponses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_selectedRecordingConfigurationInResponses:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v10;
        v36 = 2112;
        v37 = v4;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Read is recording active: %@", (uint8_t *)&v34, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "generalConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v14;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Read selected general configuration: %@", (uint8_t *)&v34, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "videoConfiguration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v19;
        v36 = 2112;
        v37 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Read selected video configuration: %@", (uint8_t *)&v34, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v21 = (void *)MEMORY[0x227676638]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "audioConfiguration");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v24;
        v36 = 2112;
        v37 = v25;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Read selected audio configuration: %@", (uint8_t *)&v34, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(*(id *)(a1 + 32), "setCanUseCachedCharacteristicValues:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_handleCurrentIsRecordingActive:selectedConfiguration:", v4, v5);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v31;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read selected camera recording configuration", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      v32 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 101);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_invokePendingConfigureCompletionHandlersWithError:", v33);

      v5 = 0;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to read is recording active", (uint8_t *)&v34, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    v30 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 101);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_invokePendingConfigureCompletionHandlersWithError:", v5);
  }

}

uint64_t __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "levels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_2;
  v16[3] = &unk_24E78C740;
  v7 = v3;
  v17 = v7;
  v8 = objc_msgSend(v5, "na_any:", v16);

  objc_msgSend(*(id *)(a1 + 32), "videoAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_3;
  v13[3] = &unk_24E78C790;
  v10 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v10;
  v11 = v7;
  LODWORD(v7) = objc_msgSend(v9, "na_any:", v13);

  return v8 & v7;
}

BOOL __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "h264Level");
  v5 = objc_msgSend(v3, "h264Level");

  return v4 == v5;
}

uint64_t __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "resolution");
  if (v4 == objc_msgSend(v3, "resolution"))
  {
    objc_msgSend(*(id *)(a1 + 32), "bitRateByFrameRate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_4;
    v11[3] = &unk_24E78C768;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 40);
    v12 = v7;
    v13 = v8;
    v9 = objc_msgSend(v6, "na_any:", v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __65__HMDCameraRecordingSettingsControl__recordingVideoConfiguration__block_invoke_4(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "frameRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToNumber:", v4);

  if ((_DWORD)v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  return v6;
}

void __90__HMDCameraRecordingSettingsControl_handleHomePersonManagerSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isPrimaryResident"))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reconfigureCameraRecordingSettingsWithReason:", v8);

  }
}

void __78__HMDCameraRecordingSettingsControl_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__HMDCameraRecordingSettingsControl_handleCharacteristicsChangedNotification___block_invoke_2;
  v11[3] = &unk_24E798C68;
  v11[4] = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(v3, "na_any:", v11))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reconfigureCameraRecordingSettingsWithReason:", v10);

  }
}

uint64_t __78__HMDCameraRecordingSettingsControl_handleCharacteristicsChangedNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldReconfigureForChangedCharacteristic:", a2);
}

void __78__HMDCameraRecordingSettingsControl_handleCharacteristicsUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "enableCharacteristicNotifications");
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reconfigureCameraRecordingSettingsWithReason:", v8);

}

uint64_t __74__HMDCameraRecordingSettingsControl_handleAccessoryConnectedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "configureCameraRecordingSettings");
}

uint64_t __77__HMDCameraRecordingSettingsControl_handleAccessoryDisconnectedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@ by resetting current selected configuration", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setCanUseCachedCharacteristicValues:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentSelectedConfiguration:", 0);
}

+ (NSArray)audioConfigurationsByPreferenceOrder
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HMDCameraRecordingSettingsControl_audioConfigurationsByPreferenceOrder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (audioConfigurationsByPreferenceOrder_onceToken != -1)
    dispatch_once(&audioConfigurationsByPreferenceOrder_onceToken, block);
  return (NSArray *)(id)audioConfigurationsByPreferenceOrder_audioConfigurationsByPreferenceOrder;
}

+ (BOOL)isSupportedVideoCodec:(id)a3
{
  return objc_msgSend(a3, "type") == 0;
}

+ (BOOL)isSupportedH264Profile:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "h264Profile") < 3;
}

+ (id)h264ProfileForCodecConfiguration:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "parameters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (+[HMDCameraRecordingSettingsControl isSupportedH264Profile:](HMDCameraRecordingSettingsControl, "isSupportedH264Profile:", v8))
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)videoCodecForCodecConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "codec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "isSupportedVideoCodec:", v5);

  if ((_DWORD)a1)
  {
    objc_msgSend(v4, "codec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isSupportedAudioCodec:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "type") < 2;
}

+ (id)audioBitRateForCodecConfiguration:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "parameters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bitRateModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v8, "type") < 2)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)audioCodecForCodecConfiguration:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "codec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HMDCameraRecordingSettingsControl isSupportedAudioCodec:](HMDCameraRecordingSettingsControl, "isSupportedAudioCodec:", v4);

  if (v5)
  {
    objc_msgSend(v3, "codec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t78 != -1)
    dispatch_once(&logCategory__hmf_once_t78, &__block_literal_global_153_173891);
  return (id)logCategory__hmf_once_v79;
}

void __48__HMDCameraRecordingSettingsControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v79;
  logCategory__hmf_once_v79 = v0;

}

void __73__HMDCameraRecordingSettingsControl_audioConfigurationsByPreferenceOrder__block_invoke(uint64_t a1)
{
  HMDCameraRecordingPreferredAudioConfiguration *v2;
  HMDCameraRecordingPreferredAudioConfiguration *v3;
  HMDCameraRecordingPreferredAudioConfiguration *v4;
  HMDCameraRecordingPreferredAudioConfiguration *v5;
  HMDCameraRecordingPreferredAudioConfiguration *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v2 = -[HMDCameraRecordingPreferredAudioConfiguration initWithSampleRate:bitRate:]([HMDCameraRecordingPreferredAudioConfiguration alloc], "initWithSampleRate:bitRate:", 3, &unk_24E96C290);
  v3 = -[HMDCameraRecordingPreferredAudioConfiguration initWithSampleRate:bitRate:]([HMDCameraRecordingPreferredAudioConfiguration alloc], "initWithSampleRate:bitRate:", 1, &unk_24E96C2A8);
  v4 = -[HMDCameraRecordingPreferredAudioConfiguration initWithSampleRate:bitRate:]([HMDCameraRecordingPreferredAudioConfiguration alloc], "initWithSampleRate:bitRate:", 2, &unk_24E96C2C0);
  v5 = -[HMDCameraRecordingPreferredAudioConfiguration initWithSampleRate:bitRate:]([HMDCameraRecordingPreferredAudioConfiguration alloc], "initWithSampleRate:bitRate:", 4, &unk_24E96C290);
  v6 = -[HMDCameraRecordingPreferredAudioConfiguration initWithSampleRate:bitRate:]([HMDCameraRecordingPreferredAudioConfiguration alloc], "initWithSampleRate:bitRate:", 5, &unk_24E96C290);
  v17[0] = v2;
  v17[1] = v5;
  v17[2] = v6;
  v17[3] = v4;
  v17[4] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)audioConfigurationsByPreferenceOrder_audioConfigurationsByPreferenceOrder;
  audioConfigurationsByPreferenceOrder_audioConfigurationsByPreferenceOrder = v7;

  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = audioConfigurationsByPreferenceOrder_audioConfigurationsByPreferenceOrder;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Preferred audio configuration order: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

}

@end
