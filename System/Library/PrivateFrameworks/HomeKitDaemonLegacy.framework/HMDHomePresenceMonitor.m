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
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
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

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
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
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HMDHomePresenceBase presenceMonitorMessageTargetUUID](self, "presenceMonitorMessageTargetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("presence.monitor/%@"), v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  timerID = self->_timerID;
  self->_timerID = v8;

  -[HMDHomePresenceMonitor _preparePresenceMap](self, "_preparePresenceMap");
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
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HMDHomePresenceMonitor;
  -[HMDHomePresenceBase _registerForMessages](&v11, sel__registerForMessages);
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoles:", objc_msgSend(v3, "roles") | 4);
  v4 = (void *)objc_msgSend(v3, "copy");
  -[HMDHomePresenceBase home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceBase msgDispatcher](self, "msgDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoteUpdateUserPresenceNotificationKey"), self, v8, sel_handleUserPresenceUpdate_);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenceFeeder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleUserPresenceUpdateNotification_, CFSTR("HMDUserPresenceUpdateLocalNotification"), v10);

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

- (void)handleHomeDataLoadedNotification:(id)a3
{
  -[HMDHomePresenceMonitor _reEvaluatePresenceWithReason:](self, "_reEvaluatePresenceWithReason:", CFSTR("HMDHomeManagerHomeDataLoadedNotification"));
}

- (void)residentChanged
{
  -[HMDHomePresenceMonitor _reEvaluatePresenceWithReason:](self, "_reEvaluatePresenceWithReason:", CFSTR("Resident changed"));
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMDHomePresenceMonitor__reEvaluatePresenceWithReason___block_invoke;
  v7[3] = &unk_1E89C2328;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BTM Timer fired with ID: %@"), v8);
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

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
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
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Auditing the presence map %@", buf, 0x16u);

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
  v13 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@This device is the primary resident: [%@ / %@]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke;
    v23[3] = &unk_1E89A5878;
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@This device is not the primary resident : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v20 = &__block_literal_global_45_12508;
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

  v40 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmf_dateComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "minute");
      objc_msgSend(v9, "setMinute:", presenceMonitorAuditInMinutes + v10);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateFromComponents:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting the audit timer (%@) to fire at %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v19 = objc_msgSend(v18, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v3, v12, v14, sel_handleTimerFiredNotification_, &v33);
      v20 = v33;

      if ((v19 & 1) == 0)
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
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
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v32;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@This is not the resident device, not starting the audit timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to start audit timer with nil timer id", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

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
  v32 = *MEMORY[0x1E0C80C00];
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
          v14 = (void *)MEMORY[0x1D17BA0A0]();
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
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Adding home user %@ to the presence map, as it isn't present", buf, 0x16u);

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

  v33 = *MEMORY[0x1E0C80C00];
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
          v12 = (void *)MEMORY[0x1D17BA0A0]();
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
            _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing the user %@ from presence map since it isn't part of home anymore", buf, 0x16u);

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

  v21 = *MEMORY[0x1E0C80C00];
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
    v9 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Presence map after adding new user : %@, %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@UUID for user %@ is nil, not adding it to the monitor map.", (uint8_t *)&v15, 0x16u);

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

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding new user %@ to the presence map", (uint8_t *)&v9, 0x16u);

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

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomePresenceMonitor presenceMap](self, "presenceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing user %@ from the presence map", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    os_unfair_lock_lock_with_options();
    presenceMap = v9->_presenceMap;
    objc_msgSend(v4, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](presenceMap, "removeObjectForKey:", v13);

    os_unfair_lock_unlock(&v9->_lock);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Removed user : %@"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceMonitor _reEvaluatePresenceWithReason:](v9, "_reEvaluatePresenceWithReason:", v14);

  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Presence map after removing user : %@, %@", buf, 0x20u);

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
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HMDHomePresenceMonitor_handleUserPresenceUpdate___block_invoke;
  v10[3] = &unk_1E89C2350;
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HMDHomePresenceMonitor_handleUserPresenceUpdateNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleUserHomePresencePayload:(id)a3 device:(id)a4 user:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  HMDHomePresenceMonitor *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHomePresenceMonitor *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  HMDHomePresenceMonitor *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDHomePresenceMonitor *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMDHomePresenceMonitor *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  HMDHomePresenceMonitor *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDUserPresence *v50;
  void *v51;
  void *v52;
  HMDUserPresence *v53;
  void *v54;
  HMDUserPresence *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  HMDUserPresence *v62;
  id v63;
  id v64;
  id v65;
  void (**v66)(id, void *);
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v59 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v69 = v16;
    v70 = 2112;
    v71 = v10;
    v72 = 2112;
    v73 = v59;
    v74 = 2112;
    v75 = v11;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Received user presence: [%@] from device [%@] for user [%@]", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v13);
  if (v11)
  {
    -[HMDHomePresenceBase home](v14, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
    {
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v41 = v14;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v43;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@This device is not the current resident, cannot process the presence update, responding with error", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2708);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v12[2](v12, v18);
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E0CBA950], "authWithDict:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v19 = (void *)MEMORY[0x1E0CBA950];
      objc_msgSend(v10, "hmf_numberForKey:", CFSTR("kUserPresenceAuthStatusKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "authWithNumber:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[HMDUserPresenceRegion regionWithDict:](HMDUserPresenceRegion, "regionWithDict:", v10);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserPresenceUpdateReason reasonWithDict:](HMDUserPresenceUpdateReason, "reasonWithDict:", v10);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v14;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v69 = v24;
      v70 = 2114;
      v71 = v18;
      v72 = 2114;
      v73 = v57;
      v74 = 2114;
      v75 = v56;
      v76 = 2112;
      v77 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Received user presence message with auth: %{public}@, region: %{public}@, reason: %{public}@, user: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDHomePresenceMonitor presenceMap](v22, "presenceMap");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v27);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      v44 = (void *)MEMORY[0x1D17BA0A0]();
      v45 = v22;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v47;
        v70 = 2112;
        v71 = v48;
        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Could not find the user with UUID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v12[2](v12, v49);

      goto LABEL_31;
    }
    objc_msgSend(v58, "user");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "presenceAuthStatus");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HMFEqualObjects() & 1) != 0)
    {
      objc_msgSend(v58, "presenceRegionStatus");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = HMFEqualObjects();

      if (v31)
      {
        v32 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v58, "setPresenceRegionStatus:", v57));
        v33 = v22;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v35;
          v70 = 2112;
          v71 = v58;
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@User presence auth or region status for %@ are not changing, updated presence timestamp", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(v17, "saveWithReason:postSyncNotification:", CFSTR("HMDHomePresenceMonitorUpdatedReason"), 0);
        if (v12)
          v12[2](v12, 0);
        goto LABEL_31;
      }
    }
    else
    {

    }
    v50 = [HMDUserPresence alloc];
    objc_msgSend(v58, "user");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[HMDUserPresence initWithUser:presenceRegionStatus:timeStamp:presenceUpdateReason:device:](v50, "initWithUser:presenceRegionStatus:timeStamp:presenceUpdateReason:device:", v51, v57, v52, v56, v59);

    objc_initWeak((id *)buf, v22);
    -[HMDUserPresence user](v53, "user");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __79__HMDHomePresenceMonitor_handleUserHomePresencePayload_device_user_completion___block_invoke;
    v60[3] = &unk_1E89A58E0;
    objc_copyWeak(&v67, (id *)buf);
    v61 = v58;
    v55 = v53;
    v62 = v55;
    v63 = v11;
    v66 = v12;
    v64 = v59;
    v65 = v56;
    -[HMDHomePresenceMonitor _updateUserPresence:presenceAuth:completion:](v22, "_updateUserPresence:presenceAuth:completion:", v54, v18, v60);

    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)buf);

LABEL_31:
LABEL_32:

    goto LABEL_33;
  }
  v36 = (void *)MEMORY[0x1D17BA0A0]();
  v37 = v14;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v69 = v39;
    _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Remote user is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v36);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v12[2](v12, v17);
LABEL_33:

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

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "presenceAuthStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  v13 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Auth and compute status are not changing for user %@", buf, 0x16u);

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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Presence auth status is changing from %@ to %@ for user %@", buf, 0x2Au);

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
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __70__HMDHomePresenceMonitor__updateUserPresence_presenceAuth_completion___block_invoke;
      v29[3] = &unk_1E89C1A48;
      v30 = v10;
      objc_msgSend(v28, "run:", v29);

    }
  }

}

- (void)_evaluatePresence:(id)a3 newUserPresence:(id)a4 presenceStatusUpdateReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
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
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  HMDHomePresenceMonitor *v31;
  NSObject *v32;
  void *v33;
  _BOOL8 v34;
  HMDHomePresenceUpdate *v35;
  void *v36;
  HMDHomePresenceUpdate *v37;
  void *v38;
  HMDHomePresenceMonitor *v39;
  NSObject *v40;
  void *v41;
  HMDHomePresence *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  HMDHomePresenceUpdate *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomePresenceMonitor _auditPresenceMap](self, "_auditPresenceMap");
  -[HMDHomePresenceBase home](self, "home");
  v11 = objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceMonitor presenceMap](self, "presenceMap");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v16;
    v49 = 2112;
    v50 = (HMDHomePresenceUpdate *)v12;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Evaluating home presence with current presence map: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v17 = -[HMDHomePresence initWithHome:userPresenceMap:lastUpdateByDevice:]([HMDHomePresence alloc], "initWithHome:userPresenceMap:lastUpdateByDevice:", v11, v12, v8);
  -[HMDHomePresenceMonitor currentHomePresence](v14, "currentHomePresence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)v11;
  v45 = v10;
  v43 = (void *)v12;
  if (v18)
  {
    -[HMDHomePresenceMonitor currentHomePresence](v14, "currentHomePresence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = HMFEqualObjects();

  }
  else
  {
    v46 = 1;
  }
  v20 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = v14;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  v42 = v17;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresenceMonitor currentHomePresence](v21, "currentHomePresence");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shortDescription");
    v25 = (HMDHomePresenceUpdate *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePresence shortDescription](v17, "shortDescription");
    v26 = v8;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v28 = v9;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v48 = v23;
    v49 = 2112;
    v50 = v25;
    v51 = 2112;
    v52 = v27;
    v53 = 2112;
    v54 = v29;
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating home presence from %@ to %@, Equal: %@", buf, 0x2Au);

    v8 = v26;
    v9 = v28;
    v17 = v42;

  }
  objc_autoreleasePoolPop(v20);
  v30 = (void *)MEMORY[0x1D17BA0A0](-[HMDHomePresenceMonitor setCurrentHomePresence:](v21, "setCurrentHomePresence:", v17));
  v31 = v21;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v48 = v33;
    _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Current home presence evaluated, sending notification", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v30);
  logAndPostNotification(CFSTR("HMDHomePresenceEvaluatedNotification"), v31, 0);
  if ((v46 & 1) == 0)
  {
    objc_msgSend(v44, "saveWithReason:postSyncNotification:", CFSTR("HMDHomePresenceMonitorUpdatedReason"), 0);
    v34 = objc_msgSend(v45, "value") == 2;
    v35 = [HMDHomePresenceUpdate alloc];
    -[HMDHomePresenceMonitor currentHomePresence](v31, "currentHomePresence");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[HMDHomePresenceUpdate initWithHomePresence:userPresence:update:causingDevice:](v35, "initWithHomePresence:userPresence:update:causingDevice:", v36, v9, v34, v8);

    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = v31;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v41;
      v49 = 2112;
      v50 = v37;
      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@Sending home presence update %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    logAndPostNotification(CFSTR("HMDHomePresenceUpdateNotification"), v37, 0);

    v17 = v42;
  }
  -[HMDHomePresenceMonitor _startAuditTimer](v31, "_startAuditTimer");

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

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDHomePresenceMonitor init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 3);
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
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
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
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
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
      v14 = 138544130;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Updated presence for user %@ from %@ to %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v3);
    os_unfair_lock_lock_with_options();
    v10 = *(void **)&v4[16]._os_unfair_lock_opaque;
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);

    os_unfair_lock_unlock(v4 + 14);
    v13 = *(_QWORD *)(a1 + 72);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
    -[os_unfair_lock_s _evaluatePresence:newUserPresence:presenceStatusUpdateReason:](v4, "_evaluatePresence:newUserPresence:presenceStatusUpdateReason:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
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

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received presence update notification with note %@", (uint8_t *)&v13, 0x16u);

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

  v30 = *MEMORY[0x1E0C80C00];
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
        v16 = (void *)MEMORY[0x1D17BA0A0]();
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
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ update is still valid as the time since last update %lf is less than allowed %lf", (uint8_t *)&v22, 0x2Au);

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
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ update is stale as the time since last update %lf is more than allowed %lf", (uint8_t *)&v22, 0x2Au);

          }
          objc_autoreleasePoolPop(v16);
          objc_msgSend(v6, "setPresenceRegionStatus:", 0);
        }
      }
    }
  }

}

uint64_t __43__HMDHomePresenceMonitor__auditPresenceMap__block_invoke_44(uint64_t a1, uint64_t a2, void *a3)
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

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Re-evaluating presence due to reason: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluatePresence:newUserPresence:presenceStatusUpdateReason:", 0, 0, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_12532 != -1)
    dispatch_once(&logCategory__hmf_once_t0_12532, &__block_literal_global_12533);
  return (id)logCategory__hmf_once_v1_12534;
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
  v1 = (void *)logCategory__hmf_once_v1_12534;
  logCategory__hmf_once_v1_12534 = v0;

}

@end
