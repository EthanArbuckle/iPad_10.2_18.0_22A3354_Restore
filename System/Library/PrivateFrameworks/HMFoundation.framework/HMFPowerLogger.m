@implementation HMFPowerLogger

- (void)reportToPowerLogDestinationTable:(__CFString *)a3 withEventDictionary:(id)a4
{
  PLLogRegisteredEvent();
}

- (void)reportCharacteristicNotificationRegistrationEvent:(BOOL)a3 clientIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v4 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v19[0] = CFSTR("kHMFPowerLogEventType");
  v19[1] = CFSTR("kHMFPowerLogEnabledKey");
  v20[0] = CFSTR("HomeKit Characteristic Registration Event");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v11 = objc_msgSend(v10, "setObject:forKey:", v6, CFSTR("kHMFPowerLogClientIdentifierKey"));
  v12 = (void *)MEMORY[0x1A1AC355C](v11);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_INFO, "%{public}@Reporting characteristic notification registration event: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitRegistration"), v10);

}

+ (id)sharedPowerLogger
{
  if (qword_1ED013168 != -1)
    dispatch_once(&qword_1ED013168, &__block_literal_global_16);
  return (id)_MergedGlobals_62;
}

void __35__HMFPowerLogger_sharedPowerLogger__block_invoke()
{
  HMFPowerLogger *v0;
  void *v1;

  v0 = objc_alloc_init(HMFPowerLogger);
  v1 = (void *)_MergedGlobals_62;
  _MergedGlobals_62 = (uint64_t)v0;

}

- (id)linkTypeDescription:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("HomeKitLinkTypeUnknown");
  if (a3 == 2)
    v3 = CFSTR("HomeKitLinkTypeBluetoothLE");
  if (a3 == 1)
    return CFSTR("HomeKitLinkTypeIP");
  else
    return (id)v3;
}

- (void)reportConnection:(id)a3 linkType:(int64_t)a4
{
  -[HMFPowerLogger reportConnection:linkType:accessoryCategory:](self, "reportConnection:linkType:accessoryCategory:", a3, a4, 0);
}

- (void)reportConnection:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFPowerLogger linkTypeDescription:](self, "linkTypeDescription:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v12;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Reporting connection to: %@ for LinkType: %@ and category: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    v14 = (void *)MEMORY[0x1E0C99E08];
    -[HMFPowerLogger linkTypeDescription:](self, "linkTypeDescription:", a4, CFSTR("kHMFPowerLogEventType"), CFSTR("kHMFPowerLogDeviceIdentiferKey"), CFSTR("kHMFPowerLogLinkTypeKey"), CFSTR("HomeKit Connection"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, CFSTR("accessoryCategory"));
    v18 = (void *)objc_msgSend(v17, "copy");
    -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitEvent"), v18);

  }
}

- (void)reportDisconnection:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFPowerLogger linkTypeDescription:](self, "linkTypeDescription:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v12;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Reporting disconnection from: %@ for LinkType: %@ and category: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    v14 = (void *)MEMORY[0x1E0C99E08];
    -[HMFPowerLogger linkTypeDescription:](self, "linkTypeDescription:", a4, CFSTR("kHMFPowerLogEventType"), CFSTR("kHMFPowerLogDeviceIdentiferKey"), CFSTR("kHMFPowerLogLinkTypeKey"), CFSTR("HomeKit Disconnection"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, CFSTR("accessoryCategory"));
    v18 = (void *)objc_msgSend(v17, "copy");
    -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitEvent"), v18);

  }
}

- (void)reportWakeEvent:(id)a3 linkType:(int64_t)a4 accessoryCategory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1A1AC355C]();
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFPowerLogger linkTypeDescription:](self, "linkTypeDescription:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = v12;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Reporting wake event from: %@ for LinkType: %@ and category: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  v14 = (void *)MEMORY[0x1E0C99E08];
  -[HMFPowerLogger linkTypeDescription:](self, "linkTypeDescription:", a4, CFSTR("kHMFPowerLogEventType"), CFSTR("kHMFPowerLogDeviceIdentiferKey"), CFSTR("kHMFPowerLogLinkTypeKey"), CFSTR("HomeKit Wake Event"), v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, CFSTR("accessoryCategory"));
  v18 = (void *)objc_msgSend(v17, "copy");
  -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitEvent"), v18);

}

- (void)reportIncomingAdvertisementChange:(id)a3
{
  -[HMFPowerLogger reportIncomingAdvertisementChange:accessoryCategory:](self, "reportIncomingAdvertisementChange:accessoryCategory:", a3, 0);
}

- (void)reportIncomingAdvertisementChange:(id)a3 accessoryCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_INFO, "%{public}@Reporting advertisement change from: %@ and category: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v11 = (void *)MEMORY[0x1E0C99E08];
    v15[0] = CFSTR("kHMFPowerLogEventType");
    v15[1] = CFSTR("kHMFPowerLogDeviceIdentiferKey");
    v16[0] = CFSTR("HomeKit BLE Advertisement");
    v16[1] = v6;
    v15[2] = CFSTR("couldCauseWake");
    v16[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("accessoryCategory"));
    v14 = (void *)objc_msgSend(v13, "copy");
    -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitEvent"), v14);

  }
}

- (void)reportIncomingIPEvent:(id)a3
{
  -[HMFPowerLogger reportIncomingIPEvent:accessoryCategory:](self, "reportIncomingIPEvent:accessoryCategory:", a3, 0);
}

- (void)reportIncomingIPEvent:(id)a3 accessoryCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_INFO, "%{public}@Reporting incoming IP Event from: %@ and category: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v11 = (void *)MEMORY[0x1E0C99E08];
    v15[0] = CFSTR("kHMFPowerLogEventType");
    v15[1] = CFSTR("kHMFPowerLogDeviceIdentiferKey");
    v16[0] = CFSTR("HomeKit IP Event");
    v16[1] = v6;
    v15[2] = CFSTR("couldCauseWake");
    v16[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("accessoryCategory"));
    v14 = (void *)objc_msgSend(v13, "copy");
    -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitEvent"), v14);

  }
}

- (void)reportIncomingCloudPush:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[3];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Reporting incoming cloud push with topic: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v9[0] = CFSTR("kHMFPowerLogEventType");
    v9[1] = CFSTR("kHMFPowerLogCloudPushTopicKey");
    v10[0] = CFSTR("HomeKit Cloud Push");
    v10[1] = v4;
    v9[2] = CFSTR("couldCauseWake");
    v10[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitEvent"), v8);

  }
}

- (void)reportIncomingIDSPush:(id)a3 fromToken:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[4];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("mailto"));
  v9 = v7;
  v10 = v9;
  v11 = v9;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "substringToIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6 && v11)
  {
    v12 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_INFO, "%{public}@Reporting incoming IDS push: %@ fromToken: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v16[0] = CFSTR("kHMFPowerLogEventType");
    v16[1] = CFSTR("kHMFPowerLogMessageTypeKey");
    v17[0] = CFSTR("HomeKit IDS Push");
    v17[1] = v6;
    v16[2] = CFSTR("kHMFPowerLogIDSDeviceTokenKey");
    v16[3] = CFSTR("couldCauseWake");
    v17[2] = v11;
    v17[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitEvent"), v15);

  }
}

- (void)reportIncomingLoxyMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[3];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Reporting incoming Loxy message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v9[0] = CFSTR("kHMFPowerLogEventType");
    v9[1] = CFSTR("kHMFPowerLogMessageTypeKey");
    v10[0] = CFSTR("HomeKit Loxy Event");
    v10[1] = v4;
    v9[2] = CFSTR("couldCauseWake");
    v10[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitEvent"), v8);

  }
}

- (void)reportRemoteReachabilityRegistrationEvent:(BOOL)a3 clientIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v4 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v19[0] = CFSTR("kHMFPowerLogEventType");
  v19[1] = CFSTR("kHMFPowerLogEnabledKey");
  v20[0] = CFSTR("HomeKit Remote Reachability Registration Event");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v11 = objc_msgSend(v10, "setObject:forKey:", v6, CFSTR("kHMFPowerLogClientIdentifierKey"));
  v12 = (void *)MEMORY[0x1A1AC355C](v11);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19B546000, v13, OS_LOG_TYPE_INFO, "%{public}@Reporting remote reachability registration event: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMFPowerLogger reportToPowerLogDestinationTable:withEventDictionary:](self, "reportToPowerLogDestinationTable:withEventDictionary:", CFSTR("HomeKitRegistration"), v10);

}

@end
