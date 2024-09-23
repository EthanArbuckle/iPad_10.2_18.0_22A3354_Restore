@implementation HMDHomePresenceBase

+ (id)messageTargetUUIDFromHomeUUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3A28];
  v9 = CFSTR("kPresenceMonitorIdentifierSalt");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_99023 != -1)
    dispatch_once(&logCategory__hmf_once_t0_99023, &__block_literal_global_99024);
  return (id)logCategory__hmf_once_v1_99025;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

void __34__HMDHomePresenceBase_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_99025;
  logCategory__hmf_once_v1_99025 = v0;

}

- (void)_initialize:(id)a3
{
  HMDHome **p_home;
  id v5;
  void *v6;
  void *v7;
  NSUUID *v8;
  NSUUID *presenceMonitorMessageTargetUUID;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *workQueue;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *logString;
  HMDNotificationRegistration *v19;
  HMDNotificationRegistration *notificationRegistration;

  p_home = &self->_home;
  v5 = a3;
  objc_storeWeak((id *)p_home, v5);
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageTargetUUIDFromHomeUUID:", v7);
  v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  presenceMonitorMessageTargetUUID = self->_presenceMonitorMessageTargetUUID;
  self->_presenceMonitorMessageTargetUUID = v8;

  objc_msgSend(v5, "workQueue");
  v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  self->_workQueue = v10;

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isOwnerUser"))
    v14 = CFSTR("owner");
  else
    v14 = CFSTR("shared");
  objc_msgSend(v5, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/%@/%@"), v13, v14, v16);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  logString = self->_logString;
  self->_logString = v17;

  v19 = -[HMDNotificationRegistration initWithRegisterer:]([HMDNotificationRegistration alloc], "initWithRegisterer:", self);
  notificationRegistration = self->_notificationRegistration;
  self->_notificationRegistration = v19;

}

- (void)configure:(id)a3 messageDispatcher:(id)a4
{
  id v6;

  v6 = a4;
  -[HMDHomePresenceBase _initialize:](self, "_initialize:", a3);
  -[HMDHomePresenceBase setMsgDispatcher:](self, "setMsgDispatcher:", v6);

  -[HMDHomePresenceBase _registerForMessages](self, "_registerForMessages");
}

- (void)_registerForMessages
{
  id v2;

  -[HMDHomePresenceBase notificationRegistration](self, "notificationRegistration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:name:object:", sel_handleHomeDataLoadedNotification_, CFSTR("HMDHomeManagerHomeDataLoadedNotification"), 0);

}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSString)logString
{
  return self->_logString;
}

- (void)setLogString:(id)a3
{
  objc_storeStrong((id *)&self->_logString, a3);
}

- (NSUUID)presenceMonitorMessageTargetUUID
{
  return self->_presenceMonitorMessageTargetUUID;
}

- (void)setPresenceMonitorMessageTargetUUID:(id)a3
{
  objc_storeStrong((id *)&self->_presenceMonitorMessageTargetUUID, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMDNotificationRegistration)notificationRegistration
{
  return self->_notificationRegistration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_presenceMonitorMessageTargetUUID, 0);
  objc_storeStrong((id *)&self->_logString, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
}

@end
