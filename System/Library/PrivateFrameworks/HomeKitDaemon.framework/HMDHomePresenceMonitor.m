@implementation HMDHomePresenceMonitor

- (HMDHomePresenceMonitor)init
{
  HMDHomePresenceMonitor *v2;
  uint64_t v3;
  NSMutableDictionary *presenceMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDHomePresenceMonitor;
  v2 = -[HMDHomePresenceMonitor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    presenceMap = v2->_presenceMap;
    v2->_presenceMap = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDHomePresenceMonitor;
  -[HMDHomePresenceMonitor dealloc](&v4, sel_dealloc);
}

- (void)configure:(id)a3 messageDispatcher:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *timerID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMDHomePresenceMonitor;
  -[HMDHomePresenceBase configure:messageDispatcher:](&v10, sel_configure_messageDispatcher_, a3, a4);
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[HMDHomePresenceBase presenceMonitorMessageTargetUUID](self, "presenceMonitorMessageTargetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("presence.monitor/%@"), v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  timerID = self->_timerID;
  self->_timerID = v8;

  -[HMDHomePresenceMonitor _populatePresenceMapFromWorkingStore](self, "_populatePresenceMapFromWorkingStore");
}

- (void)_registerForMessages
{
  void *v3;
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
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)HMDHomePresenceMonitor;
  -[HMDHomePresenceBase _registerForMessages](&v18, sel__registerForMessages);
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoles:", objc_msgSend(v3, "roles") | 4);
  v4 = (void *)objc_msgSend(v3, "copy");
  -[HMDHomePresenceBase home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceBase msgDispatcher](self, "msgDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoteUpdateUserPresenceNotificationKey"), self, v8, sel_handleUserPresenceUpdate_);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenceFeeder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleUserPresenceUpdateNotification_, CFSTR("HMDUserPresenceUpdateLocalNotification"), v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentDeviceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handlePrimaryResidentChangedNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v12);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handlePrivilegeUpdate_, CFSTR("HMDUserPrivilegeDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__handleRestrictedGuestAllowedPeriodStartedNotification_, CFSTR("HMDUserRestrictedGuestScheduleStartedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__handleRestrictedGuestAllowedPeriodEndedNotification_, CFSTR("HMDUserRestrictedGuestScheduleEndedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_handleCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_handleMatterLockStateChangedNotification_, CFSTR("HMDAccessoryMatterLockStateChangedNotification"), 0);

}

- (NSDictionary)presenceMap
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_presenceMap, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (HMDHomePresence)currentHomePresence
{
  os_unfair_lock_s *p_lock;
  HMDHomePresence *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentHomePresence;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentHomePresence:(id)a3
{
  HMDHomePresence *v4;
  HMDHomePresence *currentHomePresence;

  v4 = (HMDHomePresence *)a3;
  os_unfair_lock_lock_with_options();
  currentHomePresence = self->_currentHomePresence;
  self->_currentHomePresence = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_reEvaluatePresenceWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDHomePresenceMonitor__reEvaluatePresenceWithReason___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleTimerFiredNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HMD.BGTM.NK"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDHomePresenceMonitor timerID](self, "timerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BTM Timer fired with ID: %@"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceMonitor _reEvaluatePresenceWithReason:](self, "_reEvaluatePresenceWithReason:", v7);

  }
}

- (void)_auditPresenceMap
{
  void *v3;
  HMDHomePresenceMonitor *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDHomePresenceMonitor *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceMonitor presenceMap](v4, "presenceMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Auditing the presence map %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHomePresenceMonitor _removeNonExistingUsers](v4, "_removeNonExistingUsers");
  -[HMDHomePresenceMonitor presenceMap](v4, "presenceMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceBase home](v4, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryResident");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isCurrentDevice");
  v13 = (void *)MEMORY[0x227676638]();
  v14 = v4;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@This device is the primary resident: [%@ / %@]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke;
    v23[3] = &unk_24E7778F8;
    v23[4] = v14;
    v20 = v23;
  }
  else
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v21;
      v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@This device is not the primary resident : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v20 = &__block_literal_global_55;
  }
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v20);

}

- (void)_startAuditTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HMDHomePresenceMonitor *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  HMDHomePresenceMonitor *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDHomePresenceMonitor *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDHomePresenceMonitor *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[HMDHomePresenceMonitor timerID](self, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelTaskWithIdentifier:onObserver:", v3, self);

    -[HMDHomePresenceBase home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryResident");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isCurrentDevice") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmf_dateComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "minute");
      objc_msgSend(v9, "setMinute:", presenceMonitorAuditInMinutes + v10);
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateFromComponents:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_localTimeDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v16;
        v36 = 2112;
        v37 = v3;
        v38 = 2112;
        v39 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting the audit timer (%@) to fire at %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v19 = objc_msgSend(v18, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v3, v12, v14, sel_handleTimerFiredNotification_, &v33);
      v20 = v33;

      if ((v19 & 1) == 0)
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = v14;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v35 = v24;
          v36 = 2112;
          v37 = v3;
          v38 = 2112;
          v39 = v20;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v32;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@This is not the resident device, not starting the audit timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to start audit timer with nil timer id", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (void)_handlePrivilegeUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  HMDHomePresenceMonitor *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kUserUUIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMDHomePresenceBase workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__HMDHomePresenceMonitor__handlePrivilegeUpdate___block_invoke;
    v14[3] = &unk_24E79C268;
    v14[4] = self;
    v14[5] = v8;
    dispatch_async(v9, v14);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@User privilege changed but the userInfo does not have the required key inside it.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)_handlePrimaryResidentChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDHomePresenceBase workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDHomePresenceMonitor__handlePrimaryResidentChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_populatePresenceMapFromWorkingStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HMDHomePresenceMonitor *v11;
  id v12;

  -[HMDHomePresenceBase home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextWithHomeUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke;
  v9[3] = &unk_24E79BBD0;
  v10 = v3;
  v11 = self;
  v12 = v6;
  v7 = v6;
  v8 = v3;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v9);

}

- (void)_preparePresenceMap
{
  HMDHomePresenceMonitor *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomePresenceMonitor *v15;
  NSObject *v16;
  HMDHomePresenceMonitor *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDHomePresenceBase home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usersSupportingPresence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v24;
    *(_QWORD *)&v6 = 138543618;
    v21 = v6;
    do
    {
      v9 = 0;
      v22 = v7;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        -[HMDHomePresenceMonitor presenceMap](v2, "presenceMap", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = (void *)MEMORY[0x227676638]();
          v15 = v2;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = v2;
            v18 = v8;
            v19 = v4;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v28 = v20;
            v29 = 2112;
            v30 = v10;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Adding home user %@ to the presence map, as it isn't present", buf, 0x16u);

            v4 = v19;
            v8 = v18;
            v2 = v17;
            v7 = v22;
          }

          objc_autoreleasePoolPop(v14);
          -[HMDHomePresenceMonitor _addUser:](v15, "_addUser:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v7);
  }

  -[HMDHomePresenceMonitor _removeNonExistingUsers](v2, "_removeNonExistingUsers");
}

- (void)_removeNonExistingUsers
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  HMDHomePresenceMonitor *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *presenceMap;
  void *v19;
  void *v20;
  __int128 v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDHomePresenceBase home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "usersSupportingPresence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HMDHomePresenceMonitor presenceMap](self, "presenceMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v25;
    *(_QWORD *)&v6 = 138543618;
    v21 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "user", v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          v12 = (void *)MEMORY[0x227676638]();
          v13 = self;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "user");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v29 = v15;
            v30 = 2112;
            v31 = v16;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing the user %@ from presence map since it isn't part of home anymore", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v12);
          p_lock = &v13->_lock;
          os_unfair_lock_lock_with_options();
          presenceMap = v13->_presenceMap;
          objc_msgSend(v9, "user");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](presenceMap, "removeObjectForKey:", v20);

          os_unfair_lock_unlock(p_lock);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v5);
  }

}

- (void)_addUser:(id)a3
{
  id v4;
  void *v5;
  HMDUserPresence *v6;
  NSMutableDictionary *presenceMap;
  void *v8;
  void *v9;
  HMDHomePresenceMonitor *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    os_unfair_lock_lock_with_options();
    v6 = -[HMDUserPresence initWithUser:presenceRegionStatus:]([HMDUserPresence alloc], "initWithUser:presenceRegionStatus:", v4, 0);
    presenceMap = self->_presenceMap;
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](presenceMap, "setObject:forKeyedSubscript:", v6, v8);

    os_unfair_lock_unlock(&self->_lock);
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomePresenceMonitor presenceMap](v10, "presenceMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Presence map after adding new user : %@, %@", (uint8_t *)&v15, 0x20u);

    }
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
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@UUID for user %@ is nil, not adding it to the monitor map.", (uint8_t *)&v15, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v9);
}

- (void)addNewUser:(id)a3
{
  id v4;
  void *v5;
  HMDHomePresenceMonitor *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding new user %@ to the presence map", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomePresenceMonitor _addUser:](v6, "_addUser:", v4);
  -[HMDHomePresenceMonitor _evaluatePresence:newUserPresence:presenceStatusUpdateReason:](v6, "_evaluatePresence:newUserPresence:presenceStatusUpdateReason:", 0, 0, 0);

}

- (void)removeUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHomePresenceMonitor *v9;
  NSObject *v10;
  void *v11;
  NSMutableDictionary *presenceMap;
  void *v13;
  void *v14;
  void *v15;
  HMDHomePresenceMonitor *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomePresenceMonitor presenceMap](self, "presenceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing user %@ from the presence map", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    os_unfair_lock_lock_with_options();
    presenceMap = v9->_presenceMap;
    objc_msgSend(v4, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](presenceMap, "removeObjectForKey:", v13);

    os_unfair_lock_unlock(&v9->_lock);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removed user : %@"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceMonitor _reEvaluatePresenceWithReason:](v9, "_reEvaluatePresenceWithReason:", v14);

  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceMonitor presenceMap](v16, "presenceMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v18;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Presence map after removing user : %@, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);

}

- (void)handleUserPresenceUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDHomePresenceBase home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteSourceDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__HMDHomePresenceMonitor_handleUserPresenceUpdate___block_invoke;
  v10[3] = &unk_24E79BD80;
  v11 = v4;
  v9 = v4;
  -[HMDHomePresenceMonitor handleUserHomePresencePayload:device:user:completion:](self, "handleUserHomePresencePayload:device:user:completion:", v7, v8, v6, v10);

}

- (void)handleUserPresenceUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__HMDHomePresenceMonitor_handleUserPresenceUpdateNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleUserHomePresencePayload:(id)a3 device:(id)a4 user:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  void *v12;
  HMDHomePresenceMonitor *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDHomePresenceMonitor *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  HMDHomePresenceMonitor *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDUserPresence *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  void *v44;
  HMDHomePresenceMonitor *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  HMDHomePresenceMonitor *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  HMDHomePresenceMonitor *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  HMDHomePresenceMonitor *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  HMDUserPresence *v61;
  void *v62;
  void *v63;
  HMDUserPresence *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  HMDUserPresence *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  void (**v83)(id, void *);
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  id v88;
  __int16 v89;
  id v90;
  __int16 v91;
  double v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  v74 = a4;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v86 = v15;
    v87 = 2112;
    v88 = v75;
    v89 = 2112;
    v90 = v74;
    v91 = 2112;
    v92 = *(double *)&v10;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received user presence: [%@] from device [%@] for user [%@]", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  if (v10)
  {
    -[HMDHomePresenceBase home](v13, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
    {
      v52 = (void *)MEMORY[0x227676638]();
      v53 = v13;
      HMFGetOSLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v86 = v55;
        _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@This device is not the current resident, cannot process the presence update, responding with error", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v52);
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2708);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v11[2](v11, v17);
      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x24BDD7A90], "authWithDict:", v75);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v18 = (void *)MEMORY[0x24BDD7A90];
      objc_msgSend(v75, "hmf_numberForKey:", CFSTR("kUserPresenceAuthStatusKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "authWithNumber:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[HMDUserPresenceRegion regionWithDict:](HMDUserPresenceRegion, "regionWithDict:", v75);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserPresenceUpdateReason reasonWithDict:](HMDUserPresenceUpdateReason, "reasonWithDict:", v75);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v13;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v86 = v23;
      v87 = 2114;
      v88 = v17;
      v89 = 2114;
      v90 = v72;
      v91 = 2114;
      v92 = *(double *)&v71;
      v93 = 2112;
      v94 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Received user presence message with auth: %{public}@, region: %{public}@, reason: %{public}@, user: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDHomePresenceMonitor presenceMap](v21, "presenceMap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v26);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v73)
    {
      v56 = (void *)MEMORY[0x227676638]();
      v57 = v21;
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v86 = v59;
        v87 = 2112;
        v88 = v60;
        _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@Could not find the user with UUID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v56);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v37 = (HMDUserPresence *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v11[2](v11, v37);
      goto LABEL_35;
    }
    objc_msgSend(v73, "user");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "presenceAuthStatus");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HMFEqualObjects() & 1) != 0)
    {
      objc_msgSend(v73, "presenceRegionStatus");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = HMFEqualObjects();

      if (v30)
      {
        v31 = (void *)MEMORY[0x227676638](objc_msgSend(v73, "setPresenceRegionStatus:", v72));
        v32 = v21;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v86 = v34;
          v87 = 2112;
          v88 = v73;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@User presence auth or region status for %@ are not changing, updated presence timestamp", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "preferenceForKey:", CFSTR("kPresenceTimestampThresholdMinutes"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "numberValue");
        v37 = (HMDUserPresence *)objc_claimAutoreleasedReturnValue();

        LODWORD(v36) = -[HMDUserPresence intValue](v37, "intValue");
        objc_msgSend(v73, "updateTimestamp");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeIntervalSinceDate:", v39);
        v40 = (double)(unint64_t)(60 * (int)v36);
        v42 = fabs(v41);
        v43 = vabdd_f64(v42, v40) < 2.22044605e-16 || v42 < v40;

        if (v43)
        {
          v44 = (void *)MEMORY[0x227676638]();
          v45 = v32;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "updateTimestamp");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "hmf_localTimeDescription");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "hmf_localTimeDescription");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v86 = v69;
            v87 = 2112;
            v88 = v68;
            v89 = 2112;
            v90 = v67;
            v91 = 2048;
            v92 = v40;
            _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Not updating timestamp from %@ to %@ as it is within %f.", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v44);
        }
        else
        {
          objc_msgSend(v73, "user");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomePresenceMonitor _saveUserPresenceToWorkingStore:forUser:](v32, "_saveUserPresenceToWorkingStore:forUser:", v72, v66);

        }
        if (v11)
          v11[2](v11, 0);
        goto LABEL_35;
      }
    }
    else
    {

    }
    v61 = [HMDUserPresence alloc];
    objc_msgSend(v73, "user");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[HMDUserPresence initWithUser:presenceRegionStatus:timeStamp:presenceUpdateReason:device:](v61, "initWithUser:presenceRegionStatus:timeStamp:presenceUpdateReason:device:", v62, v72, v63, v71, v74);

    objc_initWeak((id *)buf, v21);
    -[HMDUserPresence user](v64, "user");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __79__HMDHomePresenceMonitor_handleUserHomePresencePayload_device_user_completion___block_invoke;
    v76[3] = &unk_24E777988;
    objc_copyWeak(&v84, (id *)buf);
    v77 = v73;
    v37 = v64;
    v78 = v37;
    v79 = v10;
    v80 = v72;
    v83 = v11;
    v81 = v74;
    v82 = v71;
    -[HMDHomePresenceMonitor _updateUserPresence:presenceAuth:completion:](v21, "_updateUserPresence:presenceAuth:completion:", v65, v17, v76);

    objc_destroyWeak(&v84);
    objc_destroyWeak((id *)buf);
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  v48 = (void *)MEMORY[0x227676638]();
  v49 = v13;
  HMFGetOSLogHandle();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v86 = v51;
    _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Remote user is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v48);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v11[2](v11, v16);
LABEL_37:

}

- (void)_updateUserPresence:(id)a3 presenceAuth:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  HMDHomePresenceMonitor *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "presenceAuthStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if ((v12 & 1) != 0)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v17;
      v33 = 2112;
      v34 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Auth and compute status are not changing for user %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = _Block_copy(v10);
    v19 = v18;
    if (v18)
      (*((void (**)(void *))v18 + 2))(v18);
  }
  else
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presenceAuthStatus");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      v35 = 2112;
      v36 = v9;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Presence auth status is changing from %@ to %@ for user %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDHomePresenceBase home](v14, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isOwner"))
    {
      objc_msgSend(v19, "setPresenceAuthStatus:", v9);
      objc_msgSend(v19, "currentUser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPresenceAuthStatus:", v9);

      v23 = _Block_copy(v10);
      v24 = v23;
      if (v23)
        (*((void (**)(void *))v23 + 2))(v23);
    }
    else
    {
      v24 = (void *)objc_msgSend(v8, "newModelWithChangeType:", 2);
      objc_msgSend(v9, "number");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPresenceAuthorizationStatus:", v25);

      objc_msgSend(v19, "backingStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "transaction:options:", CFSTR("kRemoteUpdateUserPresenceNotificationKey"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "add:", v24);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __70__HMDHomePresenceMonitor__updateUserPresence_presenceAuth_completion___block_invoke;
      v29[3] = &unk_24E79A050;
      v30 = v10;
      objc_msgSend(v28, "run:", v29);

    }
  }

}

- (void)_saveUserPresenceToWorkingStore:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  HMDHomePresenceMonitor *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceBase home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextWithHomeUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__HMDHomePresenceMonitor__saveUserPresenceToWorkingStore_forUser___block_invoke;
  v15[3] = &unk_24E79A910;
  v16 = v7;
  v17 = v11;
  v18 = self;
  v19 = v6;
  v12 = v6;
  v13 = v11;
  v14 = v7;
  objc_msgSend(v13, "performBlock:", v15);

}

- (void)_evaluatePresence:(id)a3 newUserPresence:(id)a4 presenceStatusUpdateReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDHomePresenceMonitor *v14;
  NSObject *v15;
  void *v16;
  HMDHomePresence *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDHomePresenceMonitor *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDHomePresenceUpdate *v25;
  HMDHomePresence *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  HMDHomePresenceMonitor *v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  HMDHomePresence *v41;
  id v42;
  unsigned int v43;
  HMDHomePresenceUpdate *v44;
  void *v45;
  HMDHomePresenceUpdate *v46;
  void *v47;
  HMDHomePresenceMonitor *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  char v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  HMDHomePresenceUpdate *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomePresenceMonitor _auditPresenceMap](self, "_auditPresenceMap");
  -[HMDHomePresenceBase home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceMonitor presenceMap](self, "presenceMap");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v16;
    v58 = 2112;
    v59 = (HMDHomePresenceUpdate *)v12;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Evaluating home presence with current presence map: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v17 = -[HMDHomePresence initWithHome:userPresenceMap:lastUpdateByDevice:]([HMDHomePresence alloc], "initWithHome:userPresenceMap:lastUpdateByDevice:", v11, v12, v8);
  -[HMDHomePresenceMonitor currentHomePresence](v14, "currentHomePresence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)v12;
  if (v18)
  {
    -[HMDHomePresenceMonitor currentHomePresence](v14, "currentHomePresence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = HMFEqualObjects();

  }
  else
  {
    v54 = 1;
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = v14;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  v55 = v11;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceMonitor currentHomePresence](v21, "currentHomePresence");
    v51 = v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shortDescription");
    v25 = (HMDHomePresenceUpdate *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresence shortDescription](v17, "shortDescription");
    v26 = v17;
    v27 = v10;
    v28 = v9;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v52 = v8;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v57 = v23;
    v58 = 2112;
    v59 = v25;
    v60 = 2112;
    v61 = v29;
    v62 = 2112;
    v63 = v30;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating home presence from %@ to %@, Equal: %@", buf, 0x2Au);

    v9 = v28;
    v10 = v27;
    v17 = v26;

    v11 = v55;
    v20 = v51;

    v8 = v52;
  }

  objc_autoreleasePoolPop(v20);
  v31 = (void *)MEMORY[0x227676638](-[HMDHomePresenceMonitor setCurrentHomePresence:](v21, "setCurrentHomePresence:", v17));
  v32 = v21;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v57 = v34;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Current home presence evaluated, sending notification", buf, 0xCu);

    v11 = v55;
  }

  objc_autoreleasePoolPop(v31);
  logAndPostNotification(CFSTR("HMDHomePresenceEvaluatedNotification"), v32, 0);
  if ((v54 & 1) == 0)
  {
    objc_msgSend(v11, "saveWithReason:postSyncNotification:", CFSTR("HMDHomePresenceMonitorUpdatedReason"), 0);
    v35 = v10;
    v36 = objc_msgSend(v10, "value");
    v37 = v36 == 2;
    objc_msgSend(v9, "user");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v38, "isRestrictedGuest") & 1) != 0)
    {
      v39 = v36 == 2;
      objc_msgSend(v9, "user");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v17;
      v42 = v9;
      v43 = v39 & ~objc_msgSend(v40, "isAccessCurrentlyAllowedBySchedule");

      v37 = v39 & ~v43;
      v9 = v42;
      v17 = v41;
    }
    else
    {

    }
    v44 = [HMDHomePresenceUpdate alloc];
    -[HMDHomePresenceMonitor currentHomePresence](v32, "currentHomePresence");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[HMDHomePresenceUpdate initWithHomePresence:userPresence:update:causingDevice:](v44, "initWithHomePresence:userPresence:update:causingDevice:", v45, v9, v37, v8);

    v47 = (void *)MEMORY[0x227676638]();
    v48 = v32;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v50;
      v58 = 2112;
      v59 = v46;
      _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@Sending home presence update %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v47);
    logAndPostNotification(CFSTR("HMDHomePresenceUpdateNotification"), v46, 0);

    v10 = v35;
    v11 = v55;
  }
  -[HMDHomePresenceMonitor _startAuditTimer](v32, "_startAuditTimer");

}

- (HMDHomePresenceUpdate)homePresenceUpdate
{
  HMDHomePresenceUpdate *v3;
  void *v4;
  HMDHomePresenceUpdate *v5;

  v3 = [HMDHomePresenceUpdate alloc];
  -[HMDHomePresenceMonitor currentHomePresence](self, "currentHomePresence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDHomePresenceUpdate initWithHomePresence:userPresence:update:causingDevice:](v3, "initWithHomePresence:userPresence:update:causingDevice:", v4, 0, 0, 0);

  return v5;
}

- (void)_handleRestrictedGuestAllowedPeriodStartedNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__HMDHomePresenceMonitor__handleRestrictedGuestAllowedPeriodStartedNotification___block_invoke;
  v3[3] = &unk_24E7779B0;
  v3[4] = self;
  -[HMDHomePresenceMonitor _handleAllowedPeriodNotification:withCompletionHandler:](self, "_handleAllowedPeriodNotification:withCompletionHandler:", a3, v3);
}

- (void)_handleRestrictedGuestAllowedPeriodEndedNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__HMDHomePresenceMonitor__handleRestrictedGuestAllowedPeriodEndedNotification___block_invoke;
  v3[3] = &unk_24E7779B0;
  v3[4] = self;
  -[HMDHomePresenceMonitor _handleAllowedPeriodNotification:withCompletionHandler:](self, "_handleAllowedPeriodNotification:withCompletionHandler:", a3, v3);
}

- (void)_handleAllowedPeriodNotification:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDHomePresenceBase home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCurrentDeviceConfirmedPrimaryResident");

  if (v9)
  {
    -[HMDHomePresenceBase workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__HMDHomePresenceMonitor__handleAllowedPeriodNotification_withCompletionHandler___block_invoke;
    block[3] = &unk_24E79B440;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(v10, block);

  }
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  HMDHomePresenceMonitor *v9;

  v4 = a3;
  -[HMDHomePresenceBase home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRestrictedGuestEnabled")
    && objc_msgSend(v5, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    -[HMDHomePresenceBase workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __67__HMDHomePresenceMonitor_handleCharacteristicsChangedNotification___block_invoke;
    v7[3] = &unk_24E79C268;
    v8 = v4;
    v9 = self;
    dispatch_async(v6, v7);

  }
}

- (void)handleUpdatedCharacteristics:(id)a3 userUUIDFromNotification:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  HMDHomePresenceMonitor *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHomePresenceMonitor *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMDHomePresenceMonitor *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMDHomePresenceMonitor *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  os_log_type_t v44;
  const char *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  HMDHomePresenceMonitor *v49;
  NSObject *v50;
  void *v51;
  HMDHomePresenceMonitor *v52;
  void *v53;
  void *v54;
  HMDHomePresenceMonitor *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *contexta;
  void *context;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id obj;
  HMDHomePresenceMonitor *v69;
  uint64_t v70;
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDHomePresenceBase home](self, "home");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = self;
  objc_msgSend((id)objc_opt_class(), "interestingServiceTypeToCharacteristicTypesMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v6;
  v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  if (!v70)
  {
    v59 = 0;
    goto LABEL_40;
  }
  v59 = 0;
  v10 = *(_QWORD *)v73;
  v66 = *(_QWORD *)v73;
  v60 = v7;
  v64 = v9;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v73 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v11);
      objc_msgSend(v12, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v38 = (void *)MEMORY[0x227676638]();
        v39 = v69;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v77 = v41;
          v78 = 2112;
          v79 = v13;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring service because it's not interesting: %@", buf, 0x16u);

        }
        goto LABEL_27;
      }
      objc_msgSend(v12, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "containsObject:", v16);

      if ((v17 & 1) == 0)
      {
        v38 = (void *)MEMORY[0x227676638]();
        v39 = v69;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v77 = v42;
          v78 = 2112;
          v79 = v12;
          v43 = v40;
          v44 = OS_LOG_TYPE_DEBUG;
          v45 = "%{public}@Ignoring characteristic because it's not interesting: %@";
          goto LABEL_26;
        }
LABEL_27:

        objc_autoreleasePoolPop(v38);
        goto LABEL_28;
      }
      objc_msgSend(v12, "previousValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v38 = (void *)MEMORY[0x227676638]();
        v39 = v69;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v77 = v42;
          v78 = 2112;
          v79 = v12;
          v43 = v40;
          v44 = OS_LOG_TYPE_INFO;
          v45 = "%{public}@Ignoring characteristic with no previous value because we don't know if it changed: %@";
LABEL_26:
          _os_log_impl(&dword_2218F0000, v43, v44, v45, buf, 0x16u);

          v10 = v66;
        }
        goto LABEL_27;
      }
      objc_msgSend(v13, "accessory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "home");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "hmf_isEqualToUUID:", v21);

      v23 = (void *)MEMORY[0x227676638]();
      v24 = v69;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if ((v22 & 1) != 0)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "previousValue");
          contexta = v19;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v77 = v27;
          v78 = 2112;
          v79 = v12;
          v80 = 2112;
          v81 = v28;
          v82 = 2112;
          v83 = v29;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Found interesting characteristic whose value has changed: <%@: %@ -> %@>", buf, 0x2Au);

          v7 = v60;
          v19 = contexta;

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(v63, "addObject:", v12);
        if (!v7)
        {
          objc_msgSend(v67, "lockNotificationManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v64;
          if (objc_msgSend(v30, "shouldResolveNotificationContextForCharacteristic:", v12))
          {
            context = (void *)MEMORY[0x227676638]();
            v31 = v24;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v77 = v33;
              v78 = 2112;
              v79 = v12;
              _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Characteristic includes notification context that needs to be resolved: %@", buf, 0x16u);

              v9 = v64;
            }

            objc_autoreleasePoolPop(context);
            if (v59)
            {
              v34 = (void *)MEMORY[0x227676638]();
              v35 = v31;
              HMFGetOSLogHandle();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v77 = v37;
                v78 = 2112;
                v79 = obj;
                _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Multiple characteristics with notification context at once, using first: %@", buf, 0x16u);

                v9 = v64;
              }

              objc_autoreleasePoolPop(v34);
            }
            else
            {
              v59 = v12;
            }
          }

          goto LABEL_34;
        }
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v77 = v46;
          v78 = 2112;
          v79 = v12;
          v80 = 2112;
          v81 = v65;
          v82 = 2112;
          v83 = v67;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Ignoring updated characteristic as it belongs to an accessory in a different home: %@, %@ != %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v23);
      }
      v9 = v64;
LABEL_34:

      v10 = v66;
LABEL_28:

      ++v11;
    }
    while (v70 != v11);
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    v70 = v47;
  }
  while (v47);
LABEL_40:

  if (!objc_msgSend(v63, "count"))
  {
    v54 = (void *)MEMORY[0x227676638]();
    v55 = v69;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v57;
      _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring updates since none are interesting", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v54);
    goto LABEL_49;
  }
  if (!v59)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceMonitor updateLastLocalActivityTimestamp:forUserUUID:](v69, "updateLastLocalActivityTimestamp:forUserUUID:", v58, v7);

LABEL_49:
    v53 = v59;
    goto LABEL_50;
  }
  v48 = (void *)MEMORY[0x227676638]();
  v49 = v69;
  HMFGetOSLogHandle();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v77 = v51;
    _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Resolving user from characteristic notification context", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v48);
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __80__HMDHomePresenceMonitor_handleUpdatedCharacteristics_userUUIDFromNotification___block_invoke;
  v71[3] = &unk_24E7779D8;
  v71[4] = v49;
  v52 = v49;
  v53 = v59;
  -[HMDHomePresenceMonitor resolveUserFromCharacteristicNotificationContext:completion:](v52, "resolveUserFromCharacteristicNotificationContext:completion:", v59, v71);
LABEL_50:

}

- (void)resolveUserFromCharacteristicNotificationContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[HMDHomePresenceBase workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lockNotificationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HMDHomePresenceMonitor_resolveUserFromCharacteristicNotificationContext_completion___block_invoke;
  aBlock[3] = &unk_24E777A00;
  v19 = v6;
  v20 = v7;
  aBlock[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = _Block_copy(aBlock);
  objc_msgSend(v13, "notificationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resolveEncodedCharacteristicNotificationContext:accessoryUUID:completion:", v16, v17, v15);

}

- (void)updateLastLocalActivityTimestamp:(id)a3 forUserUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDHomePresenceMonitor *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HMDHomePresenceMonitor *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6
    && v7
    && -[HMDHomePresenceMonitor _setLocalActivityTimestampForUserUUID:timestamp:](self, "_setLocalActivityTimestampForUserUUID:timestamp:", v7, v6))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Was asked to update the local activity time stamp for the user uuid: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceBase home](v10, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contextWithHomeUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __71__HMDHomePresenceMonitor_updateLastLocalActivityTimestamp_forUserUUID___block_invoke;
    v18[3] = &unk_24E79A910;
    v19 = v8;
    v20 = v16;
    v21 = v10;
    v22 = v6;
    v17 = v16;
    objc_msgSend(v17, "performBlock:", v18);

  }
}

- (void)handleMatterLockStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  HMDHomePresenceMonitor *v9;
  id v10;

  v4 = a3;
  -[HMDHomePresenceBase home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRestrictedGuestEnabled")
    && objc_msgSend(v5, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    -[HMDHomePresenceBase workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__HMDHomePresenceMonitor_handleMatterLockStateChangedNotification___block_invoke;
    block[3] = &unk_24E79BBD0;
    v8 = v4;
    v9 = self;
    v10 = v5;
    dispatch_async(v6, block);

  }
}

- (BOOL)_setLocalActivityTimestampForUserUUID:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  HMDHomePresenceMonitor *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_presenceMap, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isRemoteAccessAllowed");

    v13 = (v12 & 1) == 0
       && -[HMDHomePresenceMonitor _shouldWeUpdateWorkingStoreAfterUpdatingUserPresence:withNewestLocalActivityTimeStamp:](self, "_shouldWeUpdateWorkingStoreAfterUpdatingUserPresence:withNewestLocalActivityTimeStamp:", v10, v7);
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Could not find the user in the presence map. %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (BOOL)_shouldWeUpdateWorkingStoreAfterUpdatingUserPresence:(id)a3 withNewestLocalActivityTimeStamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomePresenceMonitor *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastLocalActivityTimeStamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@lastTime: %@, current: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "setLastLocalActivityTimeStamp:", v7);
    objc_msgSend(v6, "lastLocalActivityUpdateTimeStampInWorkingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v6, "lastLocalActivityUpdateTimeStampInWorkingStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v14);
      v16 = fabs(v15);

    }
    else
    {
      v16 = 0.0;
    }

    v17 = v16 >= 3600.0 || v16 <= 0.0;
  }
  else
  {
    objc_msgSend(v6, "setLastLocalActivityTimeStamp:", 0);
    v17 = 1;
  }

  return v17;
}

- (id)getLastLocalActivityTimeStampForUserUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_presenceMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastLocalActivityTimeStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)isUserAtHome:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_presenceMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "isAtHome");

  os_unfair_lock_unlock(p_lock);
  return (char)self;
}

- (void)_insertUserPresence:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *presenceMap;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  presenceMap = self->_presenceMap;
  objc_msgSend(v8, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](presenceMap, "setObject:forKeyedSubscript:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeUserPresence:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *presenceMap;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  presenceMap = self->_presenceMap;
  objc_msgSend(v8, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](presenceMap, "setObject:forKeyedSubscript:", 0, v7);

  os_unfair_lock_unlock(p_lock);
}

- (HMDHomePresenceMonitor)initWithCoder:(id)a3
{
  id v4;
  HMDHomePresenceMonitor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *presenceMap;
  uint64_t v12;
  NSMutableDictionary *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDHomePresenceMonitor init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kHMDHomePresenceMonitorPresenceMapCodingKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    presenceMap = v5->_presenceMap;
    v5->_presenceMap = (NSMutableDictionary *)v10;

    if (!v5->_presenceMap)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_presenceMap;
      v5->_presenceMap = (NSMutableDictionary *)v12;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDHomePresenceMonitor presenceMap](self, "presenceMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kHMDHomePresenceMonitorPresenceMapCodingKey"));

}

- (NSString)timerID
{
  return self->_timerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_currentHomePresence, 0);
  objc_storeStrong((id *)&self->_presenceMap, 0);
}

void __67__HMDHomePresenceMonitor_handleMatterLockStateChangedNotification___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(a1[4], "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1[5];
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v63 = v9;
    v64 = 2112;
    v65 = v10;
    v66 = 2112;
    v67 = v11;
    v68 = 2112;
    v69 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Received '%@' notification for %@: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDAccessoryMatterLockOperationDateNotificationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDAccessoryMatterLockOperationTypeNotificationKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = objc_msgSend(v17, "unsignedIntegerValue");
  if (v18 - 2 < 2)
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = a1[5];
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v34;
      v64 = 2112;
      v65 = v17;
      v35 = "%{public}@Unexpected operation type: %@";
      v36 = v33;
      v37 = OS_LOG_TYPE_ERROR;
LABEL_31:
      _os_log_impl(&dword_2218F0000, v36, v37, v35, buf, 0x16u);

    }
LABEL_32:

    objc_autoreleasePoolPop(v31);
    goto LABEL_51;
  }
  if (v18 > 1)
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = a1[5];
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v34;
      v64 = 2112;
      v65 = v17;
      v35 = "%{public}@Unhandled MTRDoorLockLockOperationType: %@";
      v36 = v33;
      v37 = OS_LOG_TYPE_FAULT;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  objc_msgSend(v17, "unsignedIntegerValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDAccessoryMatterLockOperationSourceNotificationKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  v22 = objc_msgSend(v21, "unsignedIntegerValue");
  if (v22 <= 0xA && ((1 << v22) & 0x508) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDAccessoryMatterLockUserUUIDNotificationKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    if (v25)
    {
      v60 = v21;
      v61 = v14;
      objc_msgSend(v4, "home");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "hmf_isEqualToUUID:", v27);

      if ((v28 & 1) != 0)
      {
        objc_msgSend(a1[6], "userWithUUID:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v21 = v60;
          if (v61)
          {
            v30 = v12;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "now");
            v30 = (id)objc_claimAutoreleasedReturnValue();
          }
          v58 = v30;
          v50 = v59;
          objc_msgSend(a1[5], "updateLastLocalActivityTimestamp:forUserUUID:", v30, v25);

        }
        else
        {
          v53 = (void *)MEMORY[0x227676638]();
          v54 = a1[5];
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = a1[6];
            *(_DWORD *)buf = 138543874;
            v63 = v56;
            v64 = 2112;
            v65 = v25;
            v66 = 2112;
            v67 = v57;
            _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Unable to find user with UUID %@ in home %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v53);
          v50 = v59;
          v21 = v60;
        }

      }
      else
      {
        v47 = (void *)MEMORY[0x227676638]();
        v48 = a1[5];
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v59;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = a1[6];
          *(_DWORD *)buf = 138544130;
          v63 = v51;
          v64 = 2112;
          v65 = v4;
          v66 = 2112;
          v67 = v52;
          v68 = 2112;
          v69 = v59;
          _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Ignoring matter lock event as it pertains to an accessory in a different home: %@, %@ != %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v47);
        v21 = v60;
      }

      v14 = v61;
    }
    else
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = a1[5];
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = v14;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Matter lock state change notification does not contain the userUUID. Ignoring it.", buf, 0xCu);

        v14 = v41;
      }

      objc_autoreleasePoolPop(v38);
    }

  }
  else
  {
    v43 = (void *)MEMORY[0x227676638]();
    v44 = a1[5];
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v46;
      v64 = 2112;
      v65 = v21;
      _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Unhandled MTRDoorLockOperationSource: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
  }

LABEL_51:
}

void __71__HMDHomePresenceMonitor_updateLastLocalActivityTimestamp_forUserUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  os_unfair_lock_s *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFHome findHomeMemberWithUUID:context:](_MKFHome, "findHomeMemberWithUUID:context:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "setLastLocalActivityTimeStamp:", *(_QWORD *)(a1 + 56));
    v5 = *(void **)(a1 + 40);
    v24 = 0;
    v6 = objc_msgSend(v5, "save:", &v24);
    v7 = v24;
    if ((v6 & 1) != 0)
    {
      v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 48) + 56);
      os_unfair_lock_lock_with_options();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLastLocalActivityUpdateTimeStampInWorkingStore:", v9);

      os_unfair_lock_unlock(v8);
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 56);
        v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v26 = v14;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v16;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully updated home member's local activity timestamp to [%@] for user [%@] in the working store", buf, 0x20u);

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v26 = v22;
        v27 = 2112;
        v28 = v23;
        v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the home member's local activity timestamp : %@, error: %@", buf, 0x20u);

      }
    }

    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home member with model id : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

void __86__HMDHomePresenceMonitor_resolveUserFromCharacteristicNotificationContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "userUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "userUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v5, "labelIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "labelIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v9);
    goto LABEL_5;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17 = 138543874;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to resolve user with notification context for characteristic %@: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_6:

}

void __80__HMDHomePresenceMonitor_handleUpdatedCharacteristics_userUUIDFromNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Characteristic notification context resolved: %@, %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (!v5)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateLastLocalActivityTimestamp:forUserUUID:", v12, 0);

  }
}

void __67__HMDHomePresenceMonitor_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kModifiedCharacteristicsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kUserUUIDKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMessageUserOverrideKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
      v12 = v11;
    else
      v12 = v8;
    v13 = v12;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "handleUpdatedCharacteristics:userUUIDFromNotification:", v5, v13);
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@The notification does not contain a user UUID.", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v23 = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring notification with no changed characteristics: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

void __81__HMDHomePresenceMonitor__handleAllowedPeriodNotification_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(void);
  void (**v14)(void);
  void (*v15)(void);
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void (**v27)(void);
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
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
    v28 = 138543618;
    v29 = v5;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@RG allowed period notification: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9 && (objc_msgSend(v9, "isRestrictedGuest") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presenceMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void (**)(void))_Block_copy(*(const void **)(a1 + 48));
      v14 = v13;
      if (!v13)
      {
LABEL_20:

        goto LABEL_21;
      }
      v15 = v13[2];
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v26;
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Did not find presence information for restricted guest: %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      v27 = (void (**)(void))_Block_copy(*(const void **)(a1 + 48));
      v14 = v27;
      if (!v27)
        goto LABEL_20;
      v15 = v27[2];
    }
    v15();
    goto LABEL_20;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "users");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v19;
    v30 = 2112;
    v31 = v21;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[RG] Unable to add the user in the presence map as we could not find it inside the users list in home or not RG: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v22 = _Block_copy(*(const void **)(a1 + 48));
  v12 = v22;
  if (v22)
    (*((void (**)(void *, _QWORD))v22 + 2))(v22, 0);
LABEL_21:

}

void __79__HMDHomePresenceMonitor__handleRestrictedGuestAllowedPeriodEndedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDUserPresence *v9;
  void *v10;
  HMDUserPresence *v11;
  os_unfair_lock_s *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  HMDUserPresence *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  objc_msgSend(v3, "rawPresenceRegionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "value") == 2)
  {

LABEL_8:
    v22 = (void *)MEMORY[0x227676638]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Not simulating user not atHome presence as RG is not atHome", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    goto LABEL_11;
  }
  objc_msgSend(v4, "rawPresenceRegionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "value");

  if (!v7)
    goto LABEL_8;
  objc_msgSend(v4, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [HMDUserPresence alloc];
  objc_msgSend(v4, "presenceRegionStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDUserPresence initWithUser:presenceRegionStatus:](v9, "initWithUser:presenceRegionStatus:", v8, v10);

  v12 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 56);
  os_unfair_lock_lock_with_options();
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(v8, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v14);

  os_unfair_lock_unlock(v12);
  v15 = (void *)MEMORY[0x227676638]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v18;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@RG Period Ended : %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v19 = *(void **)(a1 + 32);
  -[HMDUserPresence deviceWhichUpdatedUserPresence](v11, "deviceWhichUpdatedUserPresence");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserPresenceUpdateReason reasonWithValue:](HMDUserPresenceUpdateReason, "reasonWithValue:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_evaluatePresence:newUserPresence:presenceStatusUpdateReason:", v20, v11, v21);

LABEL_11:
}

void __81__HMDHomePresenceMonitor__handleRestrictedGuestAllowedPeriodStartedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDUserPresence *v8;
  void *v9;
  HMDUserPresence *v10;
  os_unfair_lock_s *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "rawPresenceRegionStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "value");

    if (v6 == 1)
    {
      objc_msgSend(v4, "user");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = [HMDUserPresence alloc];
      objc_msgSend(v4, "presenceRegionStatus");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMDUserPresence initWithUser:presenceRegionStatus:](v8, "initWithUser:presenceRegionStatus:", v7, v9);

      v11 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 56);
      os_unfair_lock_lock_with_options();
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      objc_msgSend(v7, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v13);

      os_unfair_lock_unlock(v11);
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPresence shortDescription](v10, "shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v17;
        v28 = 2112;
        v29 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@RG Period Started : %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v19 = *(void **)(a1 + 32);
      -[HMDUserPresence deviceWhichUpdatedUserPresence](v10, "deviceWhichUpdatedUserPresence");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDUserPresenceUpdateReason reasonWithValue:](HMDUserPresenceUpdateReason, "reasonWithValue:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_evaluatePresence:newUserPresence:presenceStatusUpdateReason:", v20, v10, v21);

    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v25;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Not simulating user atHome presence as RG is not atHome", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
    }
  }

}

void __66__HMDHomePresenceMonitor__saveUserPresenceToWorkingStore_forUser___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFHome findHomeMemberWithUUID:context:](_MKFHome, "findHomeMemberWithUUID:context:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1[7], "value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPresenceRegionStatus:", v5);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPresenceUpdateTimeStamp:", v6);

    objc_msgSend(v4, "lastLocalActivityTimeStamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isRestrictedGuestEnabled"))
    {
      v9 = objc_msgSend(a1[7], "value");

      if (v9 != 2)
        goto LABEL_6;
      objc_msgSend(v4, "setLastLocalActivityTimeStamp:", 0);
      v8 = v7;
      v7 = 0;
    }

LABEL_6:
    v10 = a1[5];
    v33 = 0;
    v11 = objc_msgSend(v10, "save:", &v33);
    v12 = v33;
    if ((v11 & 1) != 0)
    {
      +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isRestrictedGuestEnabled");

      if (v14)
      {
        v15 = a1[6];
        objc_msgSend(a1[4], "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_setLocalActivityTimestampForUserUUID:timestamp:", v16, v7);

      }
      v17 = (void *)MEMORY[0x227676638]();
      v18 = a1[6];
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = a1[7];
      v22 = a1[4];
      *(_DWORD *)buf = 138544130;
      v35 = v20;
      v36 = 2112;
      v37 = v21;
      v38 = 2112;
      v39 = v22;
      v40 = 2112;
      v41 = v7;
      v23 = "%{public}@Successfully updated home member's presence to [%@] for user [%@] in the working store. [lastAccessTime: %@]";
      v24 = v19;
      v25 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = a1[6];
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        objc_autoreleasePoolPop(v17);
        goto LABEL_18;
      }
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = a1[4];
      v32 = a1[7];
      *(_DWORD *)buf = 138544130;
      v35 = v20;
      v36 = 2112;
      v37 = v31;
      v38 = 2112;
      v39 = v32;
      v40 = 2112;
      v41 = v12;
      v23 = "%{public}@Unable to save the home member presence for user : %@ / %@, error: %@";
      v24 = v19;
      v25 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_2218F0000, v24, v25, v23, buf, 0x2Au);

    goto LABEL_17;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = a1[6];
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    v36 = 2112;
    v37 = v30;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home member with model id : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
LABEL_18:

}

void __70__HMDHomePresenceMonitor__updateUserPresence_presenceAuth_completion___block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))_Block_copy(*(const void **)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

void __79__HMDHomePresenceMonitor_handleUserHomePresencePayload_device_user_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  os_unfair_lock_s *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = (os_unfair_lock_s *)WeakRetained;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "user");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v17 = 138544130;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Updated presence for user %@ from %@ to %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v3);
    os_unfair_lock_lock_with_options();
    v10 = *(void **)&v4[16]._os_unfair_lock_opaque;
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);

    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "isRestrictedGuestEnabled");

    if ((_DWORD)v11)
      objc_msgSend(*(id *)(a1 + 40), "setLastLocalActivityUpdateTimeStampInWorkingStore:", 0);
    os_unfair_lock_unlock(v4 + 14);
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "user");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s _saveUserPresenceToWorkingStore:forUser:](v4, "_saveUserPresenceToWorkingStore:forUser:", v14, v15);

    v16 = *(_QWORD *)(a1 + 80);
    if (v16)
      (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, 0);
    -[os_unfair_lock_s _evaluatePresence:newUserPresence:presenceStatusUpdateReason:](v4, "_evaluatePresence:newUserPresence:presenceStatusUpdateReason:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  }

}

void __63__HMDHomePresenceMonitor_handleUserPresenceUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received presence update notification with note %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleUserHomePresencePayload:device:user:completion:", v12, v8, v10, 0);

}

uint64_t __51__HMDHomePresenceMonitor_handleUserPresenceUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a2);
}

void __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v3, "users");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "homeMembers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke_68;
    v21[3] = &unk_24E777960;
    v8 = a1[4];
    v9 = a1[5];
    v22 = v8;
    v23 = v9;
    v10 = v6;
    v24 = v10;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);

    v11 = (os_unfair_lock_s *)((char *)a1[5] + 56);
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)a1[5] + 8, v6);
    os_unfair_lock_unlock(v11);
    v12 = (void *)MEMORY[0x227676638]();
    v13 = a1[5];
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v15;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Loaded presence map from working store: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(a1[5], "_preparePresenceMap");
    objc_msgSend(a1[6], "reset");

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = a1[5];
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home with model id : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

void __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  HMDUserPresence *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDUserPresence *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke_2;
  v21[3] = &unk_24E799728;
  v5 = v3;
  v22 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HMDUserPresence alloc];
    objc_msgSend(v5, "presenceRegionStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserPresenceRegion regionWithValue:](HMDUserPresenceRegion, "regionWithValue:", (int)objc_msgSend(v8, "intValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presenceUpdateTimeStamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDUserPresence initWithUser:presenceRegionStatus:timeStamp:](v7, "initWithUser:presenceRegionStatus:timeStamp:", v6, v9, v10);

    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v12, "isRestrictedGuestEnabled");

    if ((_DWORD)v8)
    {
      objc_msgSend(v5, "lastLocalActivityTimeStamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPresence setLastLocalActivityTimeStamp:](v11, "setLastLocalActivityTimeStamp:", v13);

      objc_msgSend(v5, "lastLocalActivityTimeStamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPresence setLastLocalActivityUpdateTimeStampInWorkingStore:](v11, "setLastLocalActivityUpdateTimeStampInWorkingStore:", v14);

    }
    v15 = *(void **)(a1 + 48);
    objc_msgSend(v6, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v16);

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home member [%@] which exist in working store but not in HMDHome.users", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

uint64_t __62__HMDHomePresenceMonitor__populatePresenceMapFromWorkingStore__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

uint64_t __68__HMDHomePresenceMonitor__handlePrimaryResidentChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Loading presence map from working store due to Primary Resident change.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_populatePresenceMapFromWorkingStore");
  return objc_msgSend(*(id *)(a1 + 32), "_reEvaluatePresenceWithReason:", CFSTR("Primary resident changed"));
}

void __49__HMDHomePresenceMonitor__handlePrivilegeUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@User privilege changed: Updating presence map", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v2, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__HMDHomePresenceMonitor__handlePrivilegeUpdate___block_invoke_62;
  v14[3] = &unk_24E799728;
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "na_firstObjectPassingTest:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "privilege") != 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_addUser:", v8);
      objc_msgSend(*(id *)(a1 + 32), "_evaluatePresence:newUserPresence:presenceStatusUpdateReason:", 0, 0, 0);
      goto LABEL_12;
    }
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Pending user cannot be added to the presence map until they are confirmed by accepting the invitation: %@", buf, 0x16u);
LABEL_9:

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "users");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to add the user in the presence map as we could not find it inside the users list in home: %@", buf, 0x16u);

      goto LABEL_9;
    }
  }

  objc_autoreleasePoolPop(v9);
LABEL_12:

}

uint64_t __49__HMDHomePresenceMonitor__handlePrivilegeUpdate___block_invoke_62(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presenceAuthStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "value");

  if (v9 == 1)
  {
    objc_msgSend(v6, "presenceRegionStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "updateTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "updateTimestamp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceNow");
        v14 = fabs(v13);

        v15 = (double)(unint64_t)(60 * (presenceMonitorRefreshGracePeriodInMinutes + presenceFeedRefreshInMinutes));
        v16 = (void *)MEMORY[0x227676638]();
        v17 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v14 <= v15)
        {
          if (v19)
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 138544130;
            v23 = v21;
            v24 = 2112;
            v25 = v6;
            v26 = 2048;
            v27 = v14;
            v28 = 2048;
            v29 = v15;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ update is still valid as the time since last update %lf is less than allowed %lf", (uint8_t *)&v22, 0x2Au);

          }
          objc_autoreleasePoolPop(v16);
        }
        else
        {
          if (v19)
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 138544130;
            v23 = v20;
            v24 = 2112;
            v25 = v6;
            v26 = 2048;
            v27 = v14;
            v28 = 2048;
            v29 = v15;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ update is stale as the time since last update %lf is more than allowed %lf", (uint8_t *)&v22, 0x2Au);

          }
          objc_autoreleasePoolPop(v16);
          objc_msgSend(v6, "setPresenceRegionStatus:", 0);
        }
      }
    }
  }

}

uint64_t __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setPresenceRegionStatus:", 0);
}

uint64_t __56__HMDHomePresenceMonitor__reEvaluatePresenceWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
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
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Re-evaluating presence due to reason: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluatePresence:newUserPresence:presenceStatusUpdateReason:", 0, 0, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_17947 != -1)
    dispatch_once(&logCategory__hmf_once_t0_17947, &__block_literal_global_17948);
  return (id)logCategory__hmf_once_v1_17949;
}

+ (id)interestingServiceTypeToCharacteristicTypesMap
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDD6C08];
  v5 = *MEMORY[0x24BDD5A50];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __37__HMDHomePresenceMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_17949;
  logCategory__hmf_once_v1_17949 = v0;

}

@end
