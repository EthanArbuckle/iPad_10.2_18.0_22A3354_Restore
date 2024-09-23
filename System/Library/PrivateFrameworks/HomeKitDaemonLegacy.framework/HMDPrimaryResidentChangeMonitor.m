@implementation HMDPrimaryResidentChangeMonitor

- (HMDPrimaryResidentChangeMonitor)initWithIdentifier:(id)a3 notificationCenter:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDPrimaryResidentChangeMonitor *v10;
  HMDPrimaryResidentChangeMonitor *v11;
  NSUUID *confirmedPrimaryResidentDeviceIdentifier;
  HMDPrimaryResidentChangeMonitor *result;
  HMDPrimaryResidentChangeMonitor *v14;
  SEL v15;
  id v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v14 = (HMDPrimaryResidentChangeMonitor *)_HMFPreconditionFailure();
    -[HMDPrimaryResidentChangeMonitor configureWithHome:](v14, v15, v16);
    return result;
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDPrimaryResidentChangeMonitor;
  v10 = -[HMDPrimaryResidentChangeMonitor init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_notificationCenter, a4);
    confirmedPrimaryResidentDeviceIdentifier = v11->_confirmedPrimaryResidentDeviceIdentifier;
    v11->_confirmedPrimaryResidentDeviceIdentifier = 0;

  }
  return v11;
}

- (void)configureWithHome:(id)a3
{
  -[HMDPrimaryResidentChangeMonitor registerForNotificationsWithHome:](self, "registerForNotificationsWithHome:", a3);
  -[HMDPrimaryResidentChangeMonitor refreshMonitor](self, "refreshMonitor");
}

- (void)registerForNotificationsWithHome:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDPrimaryResidentChangeMonitor notificationCenter](self, "notificationCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChangedNotification_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChangedNotification_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChangedNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChangedNotification_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), 0);
  objc_msgSend(v4, "residentDeviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChangedNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v5);
}

- (void)refreshMonitor
{
  id v3;

  -[HMDPrimaryResidentChangeMonitor confirmedPrimaryResidentDevice](self, "confirmedPrimaryResidentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryResidentChangeMonitor refreshCurrentDevicePrimaryResidentWithDevice:](self, "refreshCurrentDevicePrimaryResidentWithDevice:", v3);
  -[HMDPrimaryResidentChangeMonitor refreshConfirmedPrimaryResidentDeviceIdentifierWithDevice:](self, "refreshConfirmedPrimaryResidentDeviceIdentifierWithDevice:", v3);
  -[HMDPrimaryResidentChangeMonitor refreshHasResidentDevices](self, "refreshHasResidentDevices");

}

- (void)refreshCurrentDevicePrimaryResidentWithDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDPrimaryResidentChangeMonitor *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isCurrentDevice");
    if ((_DWORD)v6 == -[HMDPrimaryResidentChangeMonitor isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))goto LABEL_9;
  }
  else
  {
    if (!-[HMDPrimaryResidentChangeMonitor isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
      goto LABEL_9;
    v6 = 0;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating is current device primary resident: %@ using device: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDPrimaryResidentChangeMonitor setIsCurrentDevicePrimaryResident:](v8, "setIsCurrentDevicePrimaryResident:", v6);
  -[HMDPrimaryResidentChangeMonitor notifyChangeToIsCurrentPrimaryResident](v8, "notifyChangeToIsCurrentPrimaryResident");
LABEL_9:

}

- (void)refreshConfirmedPrimaryResidentDeviceIdentifierWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDPrimaryResidentChangeMonitor *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[HMDPrimaryResidentChangeMonitor confirmedPrimaryResidentDeviceIdentifier](self, "confirmedPrimaryResidentDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating confirmed primary resident device identifier: %@ using device: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDPrimaryResidentChangeMonitor setConfirmedPrimaryResidentDeviceIdentifier:](v10, "setConfirmedPrimaryResidentDeviceIdentifier:", v6);
    -[HMDPrimaryResidentChangeMonitor notifyChangeToConfirmedPrimaryResidentDeviceIdentifier](v10, "notifyChangeToConfirmedPrimaryResidentDeviceIdentifier");
  }

}

- (void)refreshHasResidentDevices
{
  _BOOL8 v3;
  void *v4;
  HMDPrimaryResidentChangeMonitor *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[HMDPrimaryResidentChangeMonitor dataSourceHasResidentDevices](self, "dataSourceHasResidentDevices");
  if (v3 != -[HMDPrimaryResidentChangeMonitor hasResidentDevices](self, "hasResidentDevices"))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating has resident devices: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDPrimaryResidentChangeMonitor setHasResidentDevices:](v5, "setHasResidentDevices:", v3);
    -[HMDPrimaryResidentChangeMonitor notifyChangeToHasResidentDevices](v5, "notifyChangeToHasResidentDevices");
  }
}

- (id)confirmedPrimaryResidentDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDPrimaryResidentChangeMonitor *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDPrimaryResidentChangeMonitor dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "confirmedPrimaryResidentDeviceForPrimaryResidentChangeMonitor:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get confirmed primary resident device due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (BOOL)dataSourceHasResidentDevices
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMDPrimaryResidentChangeMonitor *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDPrimaryResidentChangeMonitor dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hasResidentDevicesForPrimaryResidentChangeMonitor:", self);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to source has resident devices due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (void)notifyChangeToIsCurrentPrimaryResident
{
  void *v3;
  HMDPrimaryResidentChangeMonitor *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Posting HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification notification", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPrimaryResidentChangeMonitor notificationCenter](v4, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification"), v4);

}

- (void)notifyChangeToConfirmedPrimaryResidentDeviceIdentifier
{
  void *v3;
  HMDPrimaryResidentChangeMonitor *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Posting HMDPrimaryResidentChangeMonitorConfirmedDeviceIdentifierChangeNotification notification", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPrimaryResidentChangeMonitor notificationCenter](v4, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("HMDPrimaryResidentChangeMonitorConfirmedDeviceIdentifierChangeNotification"), v4);

}

- (void)notifyChangeToHasResidentDevices
{
  id v3;

  -[HMDPrimaryResidentChangeMonitor notificationCenter](self, "notificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("HMDPrimaryResidentChangeMonitorHasResidentDevicesChangeNotification"), self);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDPrimaryResidentChangeMonitor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDPrimaryResidentChangeMonitorDataSource)dataSource
{
  return (HMDPrimaryResidentChangeMonitorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_isCurrentDevicePrimaryResident;
}

- (void)setIsCurrentDevicePrimaryResident:(BOOL)a3
{
  self->_isCurrentDevicePrimaryResident = a3;
}

- (BOOL)hasResidentDevices
{
  return self->_hasResidentDevices;
}

- (void)setHasResidentDevices:(BOOL)a3
{
  self->_hasResidentDevices = a3;
}

- (NSUUID)confirmedPrimaryResidentDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfirmedPrimaryResidentDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_confirmedPrimaryResidentDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_77041 != -1)
    dispatch_once(&logCategory__hmf_once_t7_77041, &__block_literal_global_77042);
  return (id)logCategory__hmf_once_v8_77043;
}

void __46__HMDPrimaryResidentChangeMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_77043;
  logCategory__hmf_once_v8_77043 = v0;

}

@end
