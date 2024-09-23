@implementation HMDBulletinBoardNotification

- (BOOL)isEnabled
{
  HMDBulletinBoardNotification *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMDBulletinBoardNotification)init
{
  HMDBulletinBoardNotification *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDBulletinBoardNotification;
  result = -[HMDBulletinBoardNotification init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (HMDBulletinBoardNotification)initWithService:(id)a3
{
  id v4;
  HMDBulletinBoardNotification *v5;
  HMDBulletinBoardNotification *v6;
  void *v7;
  _BOOL4 v8;
  HMDBulletinBoardNotificationServiceGroup *v9;
  HMDBulletinBoardNotificationServiceGroup *notificationServiceGroup;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  v5 = -[HMDBulletinBoardNotification init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_service, v4);
    objc_msgSend(v4, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:](HMDBulletinBoardNotification, "supportsBulletinNotificationGroup:", v7);

    if (v8)
    {
      v9 = -[HMDBulletinBoardNotificationServiceGroup initWithBulletinBoardNotification:]([HMDBulletinBoardNotificationServiceGroup alloc], "initWithBulletinBoardNotification:", v6);
      notificationServiceGroup = v6->_notificationServiceGroup;
      v6->_notificationServiceGroup = v9;

    }
    objc_msgSend(v4, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:serviceType:](HMDBulletinBoard, "isBulletinSupportedForNonSecureCharacteristicType:serviceType:", 0, v11))
    {
      objc_msgSend(v4, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[HMDBulletinBoard isCriticalNonSecureServiceType:](HMDBulletinBoard, "isCriticalNonSecureServiceType:", v12);

      if (!v13)
        v6->_enabled = 0;
    }
    else
    {

    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDBulletinBoardNotification msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDBulletinBoardNotification;
  -[HMDBulletinBoardNotification dealloc](&v4, sel_dealloc);
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  void *v7;
  HMDBulletinBoardNotification *v8;
  SEL v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    if (v6)
    {
      -[HMDBulletinBoardNotification setWorkQueue:](self, "setWorkQueue:", v10);
      -[HMDBulletinBoardNotification setMsgDispatcher:](self, "setMsgDispatcher:", v6);
      -[HMDBulletinBoardNotification notificationServiceGroup](self, "notificationServiceGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configureWithWorkQueue:", v10);

      -[HMDBulletinBoardNotification registerNotificationHandlers](self, "registerNotificationHandlers");
      -[HMDBulletinBoardNotification registerForCharacteristicNotifications](self, "registerForCharacteristicNotifications");

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v8 = (HMDBulletinBoardNotification *)_HMFPreconditionFailure();
  -[HMDBulletinBoardNotification registerNotificationHandlers](v8, v9);
}

- (void)registerNotificationHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[HMDBulletinBoardNotification msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CBAAB8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v6, sel__handleBulletinBoardNotificationCommitRequest_);

}

- (void)setEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMDBulletinBoardNotificationServiceGroup)notificationServiceGroup
{
  os_unfair_lock_s *p_lock;
  HMDBulletinBoardNotificationServiceGroup *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_notificationServiceGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNotificationServiceGroup:(id)a3
{
  HMDBulletinBoardNotificationServiceGroup *v4;
  HMDBulletinBoardNotificationServiceGroup *notificationServiceGroup;

  v4 = (HMDBulletinBoardNotificationServiceGroup *)a3;
  os_unfair_lock_lock_with_options();
  notificationServiceGroup = self->_notificationServiceGroup;
  self->_notificationServiceGroup = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDHome)home
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDBulletinBoardNotification service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHome *)v4;
}

- (void)configureBulletinNotification
{
  id v2;

  -[HMDBulletinBoardNotification notificationServiceGroup](self, "notificationServiceGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureBulletinNotification");

}

- (void)_handleBulletinBoardNotificationCommitRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  HMDBulletinBoardNotification *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  HMDBulletinBoardNotification *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDBulletinBoardNotification *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDBulletinBoardNotification *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDBulletinBoardNotification home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDBulletinBoardNotification home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "bulletinNotificationsSupported");

    if ((v7 & 1) != 0)
    {
      v8 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0CBAAC8]);
      objc_msgSend(v4, "predicateForKey:", *MEMORY[0x1E0CBAAC0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8 ^ -[HMDBulletinBoardNotification isEnabled](self, "isEnabled");
      if (v10 == 1)
      {
        v11 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBulletinBoardNotification isEnabled](v12, "isEnabled");
          HMFBooleanToString();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v14;
          v39 = 2112;
          v40 = v15;
          v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification enabled from %@ to %@", buf, 0x20u);

          v11 = v36;
        }

        objc_autoreleasePoolPop(v11);
        -[HMDBulletinBoardNotification setEnabled:](v12, "setEnabled:", v8);
        -[HMDBulletinBoardNotification registerForCharacteristicNotifications](v12, "registerForCharacteristicNotifications");
      }
      -[HMDBulletinBoardNotification condition](self, "condition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

      if ((v18 & 1) != 0)
      {
        if (!v10)
          goto LABEL_20;
      }
      else
      {
        v28 = (void *)MEMORY[0x1D17BA0A0]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBulletinBoardNotification condition](v29, "condition");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v31;
          v39 = 2112;
          v40 = v32;
          v41 = 2112;
          v42 = v9;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification condition from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v28);
        -[HMDBulletinBoardNotification setCondition:](v29, "setCondition:", v9);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("HMDBulletinBoardNotificationDidUpdateNotification"), self, 0);

      -[HMDBulletinBoardNotification home](self, "home");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "saveToCurrentAccountWithReason:", v35);

LABEL_20:
      -[HMDBulletinBoardNotification _updateLocalSettingsWithEnabled:condition:forMessage:](self, "_updateLocalSettingsWithEnabled:condition:forMessage:", v8, v9, v4);

      goto LABEL_21;
    }
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board notification cannot be modified when bulletin notifications are not supported.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v27);

  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Ignoring message to disconnected object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }
LABEL_21:

}

- (void)_updateLocalSettingsWithEnabled:(BOOL)a3 condition:(id)a4 forMessage:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v6 = a3;
  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v24[0] = *MEMORY[0x1E0CBAAC8];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend(v9, "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v24[1] = *MEMORY[0x1E0CBAAC0];
  encodeRootObject();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDBulletinBoardNotification messageTargetUUID](self, "messageTargetUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285D0]), "initWithName:destination:payload:", CFSTR("kBulletinBoardNotificationUpdateNotificationKey"), v16, v13);
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIdentifier:", v19);

  -[HMDBulletinBoardNotification msgDispatcher](self, "msgDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__HMDBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke;
  v22[3] = &unk_1E89C2350;
  v23 = v8;
  v21 = v8;
  objc_msgSend(v20, "sendMessage:completionHandler:", v18, v22);

}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDBulletinBoardNotification messageTargetUUID](self, "messageTargetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinBoardNotification isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("uuid: %@, enabled: %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D27F80]);

  -[HMDBulletinBoardNotification notificationServiceGroup](self, "notificationServiceGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dumpState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D27E80]);

  return v3;
}

- (void)registerForCharacteristicNotifications
{
  void *v3;
  HMDBulletinBoardNotification *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDBulletinBoardNotification *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id obj;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v41 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering for bulletin characteristic notification", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDBulletinBoardNotification service](v4, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v7;
  +[HMDBulletinBoard bulletinSupportedCharacteristicsForService:](HMDBulletinBoard, "bulletinSupportedCharacteristicsForService:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v10)
  {
    v11 = v10;
    v34 = *MEMORY[0x1E0D161C8];
    v35 = *(_QWORD *)v37;
    v30 = *MEMORY[0x1E0D16260];
    v33 = v9;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v35)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v13, "service");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBulletinBoardNotification notificationServiceGroup](v4, "notificationServiceGroup");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cameraProfileUUIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "count"))
        {

LABEL_16:
          if (-[HMDBulletinBoardNotification isEnabled](v4, "isEnabled"))
            v24 = v31;
          else
            v24 = v9;
          goto LABEL_19;
        }
        objc_msgSend(v14, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", v34))
        {

        }
        else
        {
          objc_msgSend(v14, "type");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v30);

          v9 = v33;
          if (!v19)
            goto LABEL_16;
        }
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = v4;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v23;
          v42 = 2112;
          v43 = v13;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Skipping characteristic: %@ because the accessory has associated camera profile", buf, 0x16u);

          v9 = v33;
        }

        objc_autoreleasePoolPop(v20);
        v24 = v9;
LABEL_19:
        objc_msgSend(v24, "addObject:", v13);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v9, "count"))
  {
    v25 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v28, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v25, CFSTR("com.apple.HomeKitDaemon.bulletinBoard"));

  }
  if (objc_msgSend(v31, "count"))
  {
    v26 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v28, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v26, CFSTR("com.apple.HomeKitDaemon.bulletinBoard"));

  }
  -[HMDBulletinBoardNotification home](v4, "home");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "evaluateShouldRelaunchAndSetRelaunch");

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDBulletinBoardNotification service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinBoardNotification messageTargetUUID](self, "messageTargetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)messageTargetUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *messageTargetUUID;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSUUID **p_messageTargetUUID;
  NSUUID *v15;
  NSUUID *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  messageTargetUUID = self->_messageTargetUUID;
  if (!messageTargetUUID)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(WeakRetained, "instanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = CFSTR("HM.BulletinBoardNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(WeakRetained, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v12, 0, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    p_messageTargetUUID = &self->_messageTargetUUID;
    v15 = *p_messageTargetUUID;
    *p_messageTargetUUID = (NSUUID *)v13;

    messageTargetUUID = *p_messageTargetUUID;
  }
  v16 = messageTargetUUID;
  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDBulletinBoardNotification isEnabled](self, "isEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Enabled"), v4);
  v12[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDBulletinBoardNotification condition](self, "condition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Condition"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HMDBulletinBoardNotification)initWithCoder:(id)a3
{
  id v4;
  HMDBulletinBoardNotification *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  HMDBulletinBoardNotificationServiceGroup *notificationServiceGroup;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSPredicate *condition;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDBulletinBoardNotification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_service, v6);
    objc_msgSend(v6, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:](HMDBulletinBoardNotification, "supportsBulletinNotificationGroup:", v7);

    if (v8)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.BulletinBoardNotificationServiceGroup"));
      v9 = objc_claimAutoreleasedReturnValue();
      notificationServiceGroup = v5->_notificationServiceGroup;
      v5->_notificationServiceGroup = (HMDBulletinBoardNotificationServiceGroup *)v9;

    }
    v11 = *MEMORY[0x1E0CBAAC8];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x1E0CBAAC8]))
    {
      v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", v11);
    }
    else
    {
      objc_msgSend(v6, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:serviceType:](HMDBulletinBoard, "isBulletinSupportedForNonSecureCharacteristicType:serviceType:", 0, v12);

      if (v13)
      {
        objc_msgSend(v6, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_enabled = +[HMDBulletinBoard isCriticalNonSecureServiceType:](HMDBulletinBoard, "isCriticalNonSecureServiceType:", v14);

      }
    }
    v15 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, *MEMORY[0x1E0CBAAC0]);
    v18 = objc_claimAutoreleasedReturnValue();
    condition = v5->_condition;
    v5->_condition = (NSPredicate *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HMDBulletinBoardNotification service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeConditionalObject:forKey:", v4, CFSTR("service"));

  if (objc_msgSend(v8, "hmd_isForLocalStore"))
  {
    -[HMDBulletinBoardNotification notificationServiceGroup](self, "notificationServiceGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("HM.BulletinBoardNotificationServiceGroup"));

  }
  v6 = -[HMDBulletinBoardNotification isEnabled](self, "isEnabled");
  objc_msgSend(v8, "encodeBool:forKey:", v6, *MEMORY[0x1E0CBAAC8]);
  -[HMDBulletinBoardNotification condition](self, "condition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, *MEMORY[0x1E0CBAAC0]);

}

- (NSPredicate)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (HMDService)service
{
  return (HMDService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMsgDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_notificationServiceGroup, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

uint64_t __85__HMDBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:", 0);
}

+ (BOOL)supportsBulletinNotificationGroup:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[HMDDeviceCapabilities supportsBulletinBoard](HMDDeviceCapabilities, "supportsBulletinBoard"))
  {
    v4 = *MEMORY[0x1E0D16260];
    v8[0] = *MEMORY[0x1E0D161C8];
    v8[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_24614 != -1)
    dispatch_once(&logCategory__hmf_once_t10_24614, &__block_literal_global_24615);
  return (id)logCategory__hmf_once_v11_24616;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __43__HMDBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_24616;
  logCategory__hmf_once_v11_24616 = v0;

}

@end
