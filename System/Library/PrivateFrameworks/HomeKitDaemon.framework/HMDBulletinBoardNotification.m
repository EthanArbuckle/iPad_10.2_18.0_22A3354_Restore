@implementation HMDBulletinBoardNotification

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

- (HMDBulletinBoardNotification)initWithService:(id)a3 enabled:(BOOL)a4 condition:(id)a5
{
  id v8;
  id v9;
  HMDBulletinBoardNotification *v10;
  HMDBulletinBoardNotification *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDBulletinBoardNotification;
  v10 = -[HMDBulletinBoardNotification init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_enabled = a4;
    objc_storeStrong((id *)&v10->_condition, a5);
    objc_storeWeak((id *)&v11->_service, v8);
  }

  return v11;
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
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  HMDBulletinBoardNotification *v12;
  SEL v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      -[HMDBulletinBoardNotification setWorkQueue:](self, "setWorkQueue:", v6);
      -[HMDBulletinBoardNotification setMsgDispatcher:](self, "setMsgDispatcher:", v8);
      -[HMDBulletinBoardNotification notificationServiceGroup](self, "notificationServiceGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configureWithWorkQueue:", v6);

      -[HMDBulletinBoardNotification registerNotificationHandlers](self, "registerNotificationHandlers");
      v10 = -[HMDBulletinBoardNotification isEnabled](self, "isEnabled");
      -[HMDBulletinBoardNotification condition](self, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __73__HMDBulletinBoardNotification_configureWithWorkQueue_messageDispatcher___block_invoke;
      v14[3] = &unk_24E79BD80;
      v14[4] = self;
      -[HMDBulletinBoardNotification _updateAccessoryBulletinNotificationManagerWithEnabled:condition:completion:](self, "_updateAccessoryBulletinNotificationManagerWithEnabled:condition:completion:", v10, v11, v14);

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v12 = (HMDBulletinBoardNotification *)_HMFPreconditionFailure();
  -[HMDBulletinBoardNotification registerNotificationHandlers](v12, v13);
}

- (void)registerNotificationHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[HMDBulletinBoardNotification msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD7C10];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v6, sel__handleBulletinBoardNotificationCommitRequest_);

}

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
  HMDBulletinBoardNotification *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDBulletinBoardNotification *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  char v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDBulletinBoardNotification home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDBulletinBoardNotification home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "bulletinNotificationsSupported");

    if ((v7 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v30;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board notification cannot be modified when bulletin notifications are not supported.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v9);
      goto LABEL_22;
    }
    v8 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x24BDD7C20]);
    objc_msgSend(v4, "predicateForKey:", *MEMORY[0x24BDD7C18]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 ^ -[HMDBulletinBoardNotification isEnabled](self, "isEnabled");
    if (v10 == 1)
    {
      v11 = (void *)MEMORY[0x227676638]();
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
        v42 = v14;
        v43 = 2112;
        v44 = v15;
        v45 = 2112;
        v46 = v16;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification enabled from %@ to %@", buf, 0x20u);

        v11 = v36;
      }

      objc_autoreleasePoolPop(v11);
    }
    -[HMDBulletinBoardNotification condition](self, "condition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = HMFEqualObjects();

    if ((v18 & 1) != 0)
    {
      if ((v10 & 1) == 0)
      {
        v19 = (void *)MEMORY[0x227676638]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v42 = v22;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating local bulletin board notification settings with existing values", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
        -[HMDBulletinBoardNotification _updateLocalSettingsWithEnabled:condition:forMessage:](v20, "_updateLocalSettingsWithEnabled:condition:forMessage:", v8, v9, v4);
        goto LABEL_22;
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBulletinBoardNotification condition](v32, "condition");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v34;
        v43 = 2112;
        v44 = v35;
        v45 = 2112;
        v46 = v9;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification condition from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v31);
    }
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __78__HMDBulletinBoardNotification__handleBulletinBoardNotificationCommitRequest___block_invoke;
    v37[3] = &unk_24E779F38;
    v37[4] = self;
    v38 = v4;
    v40 = v8;
    v39 = v9;
    -[HMDBulletinBoardNotification _updateAccessoryBulletinNotificationManagerWithEnabled:condition:completion:](self, "_updateAccessoryBulletinNotificationManagerWithEnabled:condition:completion:", v8, v39, v37);

LABEL_22:
    goto LABEL_23;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Ignoring message to disconnected object", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
LABEL_23:

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
  v25[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v24[0] = *MEMORY[0x24BDD7C20];
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a4;
  objc_msgSend(v9, "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v24[1] = *MEMORY[0x24BDD7C18];
  encodeRootObject();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDBulletinBoardNotification messageTargetUUID](self, "messageTargetUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1B0]), "initWithName:destination:payload:", CFSTR("kBulletinBoardNotificationUpdateNotificationKey"), v16, v13);
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIdentifier:", v19);

  -[HMDBulletinBoardNotification msgDispatcher](self, "msgDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __85__HMDBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke;
  v22[3] = &unk_24E79BD80;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HMDBulletinBoardNotification messageTargetUUID](self, "messageTargetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinBoardNotification isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("uuid: %@, enabled: %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE3EB68]);

  -[HMDBulletinBoardNotification notificationServiceGroup](self, "notificationServiceGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dumpState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE3EA78]);

  return v3;
}

- (void)updateRegistrations
{
  _BOOL8 v3;
  void *v4;
  _QWORD v5[5];

  v3 = -[HMDBulletinBoardNotification isEnabled](self, "isEnabled");
  -[HMDBulletinBoardNotification condition](self, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__HMDBulletinBoardNotification_updateRegistrations__block_invoke;
  v5[3] = &unk_24E79BD80;
  v5[4] = self;
  -[HMDBulletinBoardNotification _updateAccessoryBulletinNotificationManagerWithEnabled:condition:completion:](self, "_updateAccessoryBulletinNotificationManagerWithEnabled:condition:completion:", v3, v4, v5);

}

- (void)_updateAccessoryBulletinNotificationManagerWithEnabled:(BOOL)a3 condition:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  HMDBulletinBoardNotification *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  void *v37;
  HMDBulletinBoardNotification *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _BOOL4 v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  void (**v54)(_QWORD);
  _QWORD aBlock[5];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  BOOL v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v47 = a3;
  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[HMDBulletinBoardNotification home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryBulletinNotificationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v42 = v10;
    v43 = v8;
    v44 = v7;
    -[HMDBulletinBoardNotification service](self, "service");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinBoard bulletinSupportedCharacteristicsForService:](HMDBulletinBoard, "bulletinSupportedCharacteristicsForService:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v13 = v11;
    v14 = (void *)v12;
    obj = v13;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v15)
    {
      v16 = v15;
      v50 = *MEMORY[0x24BE1B7B0];
      v51 = *(_QWORD *)v63;
      v46 = *MEMORY[0x24BE1B848];
      v49 = v12;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v63 != v51)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v18, "service");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBulletinBoardNotification notificationServiceGroup](self, "notificationServiceGroup");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "cameraProfileUUIDs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v21, "count"))
          {

LABEL_15:
            if (v47)
              v29 = v14;
            else
              v29 = v45;
            objc_msgSend(v29, "addObject:", v18);
            goto LABEL_19;
          }
          objc_msgSend(v19, "type");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "isEqualToString:", v50))
          {

          }
          else
          {
            objc_msgSend(v19, "type");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", v46);

            v14 = (void *)v49;
            if (!v24)
              goto LABEL_15;
          }
          v25 = (void *)MEMORY[0x227676638]();
          v26 = self;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v67 = v28;
            v68 = 2112;
            v69 = v18;
            _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Skipping characteristic: %@ because the accessory has associated camera profile", buf, 0x16u);

            v14 = (void *)v49;
          }

          objc_autoreleasePoolPop(v25);
LABEL_19:

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v16);
    }

    v10 = v42;
    v7 = v44;
    objc_msgSend(v42, "conditionsFromPredicate:", v44);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__HMDBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke;
    aBlock[3] = &unk_24E796508;
    v61 = v47;
    aBlock[4] = self;
    v56 = v44;
    v8 = v43;
    v31 = v43;
    v60 = v31;
    v32 = v42;
    v57 = v32;
    v33 = v14;
    v34 = v41;
    v58 = v34;
    v35 = v30;
    v59 = v35;
    v36 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v33, "count") || objc_msgSend(v45, "count"))
    {
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __108__HMDBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke_2;
      v52[3] = &unk_24E77D470;
      v53 = v31;
      v54 = v36;
      objc_msgSend(v32, "updateRegistrationsWithEnabledCharacteristics:disabledCharacteristics:conditions:completion:", v33, v45, v35, v52);

    }
    else
    {
      v36[2](v36);
    }

  }
  else
  {
    v37 = (void *)MEMORY[0x227676638]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v40;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Accessory Bulletin Notification Manager is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v37);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v8 + 2))(v8, v34);
  }

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

  v18[2] = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  messageTargetUUID = self->_messageTargetUUID;
  if (!messageTargetUUID)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(WeakRetained, "instanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = CFSTR("HM.BulletinBoardNotification");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD1880];
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

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDBulletinBoardNotification isEnabled](self, "isEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Enabled"), v4);
  v12[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBulletinBoardNotification condition](self, "condition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Condition"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
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

  v21[2] = *MEMORY[0x24BDAC8D0];
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
    v11 = *MEMORY[0x24BDD7C20];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x24BDD7C20]))
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
    v15 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, *MEMORY[0x24BDD7C18]);
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
  objc_msgSend(v8, "encodeBool:forKey:", v6, *MEMORY[0x24BDD7C20]);
  -[HMDBulletinBoardNotification condition](self, "condition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, *MEMORY[0x24BDD7C18]);

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

uint64_t __108__HMDBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(unsigned __int8 *)(a1 + 80);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "isEnabled"))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "condition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == v4)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(a1 + 80))
    return objc_msgSend(v5, "enableBulletinForService:conditions:completion:", v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  else
    return objc_msgSend(v5, "disableBulletinForService:completion:", v6, *(_QWORD *)(a1 + 72));
}

uint64_t __108__HMDBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__HMDBulletinBoardNotification_updateRegistrations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin notification manager from updateRegistrations finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __85__HMDBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:", 0);
}

void __78__HMDBulletinBoardNotification__handleBulletinBoardNotificationCommitRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error updating bulletin notification manager for message %@ : %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v11);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated bulletin notification manager for message %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "setCondition:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("HMDBulletinBoardNotificationDidUpdateNotification"), *(_QWORD *)(a1 + 32), 0);

    objc_msgSend(*(id *)(a1 + 32), "_updateLocalSettingsWithEnabled:condition:forMessage:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

void __73__HMDBulletinBoardNotification_configureWithWorkQueue_messageDispatcher___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin notification manager during configure finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

+ (BOOL)supportsBulletinNotificationGroup:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (+[HMDDeviceCapabilities supportsBulletinBoard](HMDDeviceCapabilities, "supportsBulletinBoard"))
  {
    v4 = *MEMORY[0x24BE1B848];
    v8[0] = *MEMORY[0x24BE1B7B0];
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
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
  if (logCategory__hmf_once_t15 != -1)
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_32675);
  return (id)logCategory__hmf_once_v16;
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
  v1 = (void *)logCategory__hmf_once_v16;
  logCategory__hmf_once_v16 = v0;

}

@end
