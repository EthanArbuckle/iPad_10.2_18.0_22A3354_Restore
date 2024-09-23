@implementation HMRemoteLoginHandler

- (HMRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5 stagedLoggedInAccount:(id)a6 anisetteDataProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMRemoteLoginHandler *v18;
  HMRemoteLoginHandler *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMRemoteLoginHandler;
  v18 = -[HMRemoteLoginHandler init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeWeak((id *)&v19->_accessory, v14);
    objc_storeStrong((id *)&v19->_loggedInAccount, a5);
    objc_storeStrong((id *)&v19->_stagedLoggedInAccount, a6);
    objc_storeStrong((id *)&v19->_anisetteDataProvider, a7);
    v19->_didReceiveAccountInfo = 0;
  }

  return v19;
}

- (void)_configureWithContext:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMRemoteLoginHandler setContext:](self, "setContext:", v7);
  -[HMRemoteLoginHandler setAccessory:](self, "setAccessory:", v6);

  -[HMRemoteLoginHandler anisetteDataProvider](self, "anisetteDataProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_configureWithContext:", v7);

}

- (BOOL)_configureAccessoryInfoDataProviderIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMRemoteLoginHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  HMRemoteLoginHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HMRemoteLoginHandler accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_msgSend(v3, "supportsMessagedHomePodSettings") & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMRemoteLoginHandler accessory](v19, "accessory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "supportsMessagedHomePodSettings");
      HMFBooleanToString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v23;
      v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Did not subscribe to accessory info data provider due to home: %@ accessory: %@ supportsMessagedHomePodSettings: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    goto LABEL_16;
  }
  -[HMRemoteLoginHandler accessoryInfoDataProvider](self, "accessoryInfoDataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Home")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("HDSViewService")) & 1) != 0
    || isInternalBuild() && (objc_msgSend(v7, "isEqualToString:", CFSTR("hdsutil")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("homeutil")))
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring accessory info data provider", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v4, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createAccessoryInfoDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMRemoteLoginHandler setAccessoryInfoDataProvider:](v9, "setAccessoryInfoDataProvider:", v13);

    -[HMRemoteLoginHandler accessoryInfoDataProvider](v9, "accessoryInfoDataProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67__HMRemoteLoginHandler__configureAccessoryInfoDataProviderIfNeeded__block_invoke;
    v27[3] = &unk_1E3AB5CA8;
    v27[4] = v9;
    objc_msgSend(v14, "configureWithHomeIdentifier:accessoryIdentifier:accessoryInfoTypes:dataProviderDelegate:completionHandler:", v15, v16, 2, v9, v27);

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

LABEL_17:
  return v17;
}

- (void)registerForMessages
{
  void *v3;
  id v4;

  -[HMRemoteLoginHandler context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("kRemoteLoginAccountUpdatedNotificationKey"), self, sel__handleRemoteLoginAccountUpdated_);

}

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (ACAccount)loggedInAccount
{
  ACAccount *v3;
  os_unfair_lock_s *p_lock;
  ACAccount *loggedInAccount;
  ACAccount *v6;

  if (-[HMRemoteLoginHandler didReceiveAccountInfo](self, "didReceiveAccountInfo"))
  {
    v3 = 0;
  }
  else
  {
    -[HMRemoteLoginHandler stagedLoggedInAccount](self, "stagedLoggedInAccount");
    v3 = (ACAccount *)objc_claimAutoreleasedReturnValue();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  loggedInAccount = self->_loggedInAccount;
  if (!loggedInAccount)
    loggedInAccount = v3;
  v6 = loggedInAccount;
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)setLoggedInAccount:(id)a3
{
  id v4;
  void *v5;
  HMRemoteLoginHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ACAccount *loggedInAccount;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMRemoteLoginHandler loggedInAccount](v6, "loggedInAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating logged in account: %@ from: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  v10 = objc_msgSend(v4, "copy");
  loggedInAccount = v6->_loggedInAccount;
  v6->_loggedInAccount = (ACAccount *)v10;

  os_unfair_lock_unlock(&v6->_lock);
}

- (void)updateLoggedInAccount:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  HMRemoteLoginHandler *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMRemoteLoginHandler *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v24;
  HMRemoteLoginHandler *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMRemoteLoginHandler context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMRemoteLoginHandler updateLoggedInAccount:completionHandler:]", CFSTR("completionHandler"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke;
    block[3] = &unk_1E3AB4D20;
    v24 = v10;
    v25 = self;
    v27 = v7;
    v26 = v9;
    v12 = v10;
    dispatch_async(v11, block);

  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      v30 = 2080;
      v31 = "-[HMRemoteLoginHandler updateLoggedInAccount:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v7 + 2))(v7, v12);
  }

}

- (NSString)currentSessionID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentSessionID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentSessionID:(id)a3
{
  NSString *v4;
  NSString *currentSessionID;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  currentSessionID = self->_currentSessionID;
  self->_currentSessionID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isSessionInProgress
{
  void *v2;
  BOOL v3;

  -[HMRemoteLoginHandler currentSessionID](self, "currentSessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isControllable
{
  void *v2;
  char v3;

  -[HMRemoteLoginHandler accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControllable");

  return v3;
}

- (void)_handleRemoteLoginAccountUpdated:(id)a3
{
  id v4;
  void *v5;
  HMRemoteLoginHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMRemoteLoginHandler *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling remote login account updated message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "dataForKey:", CFSTR("kRemoteLoginAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    if (!v11)
    {
      v13 = (void *)MEMORY[0x1A1AC1AAC]();
      v14 = v6;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive logged in account from logged in account data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
  else
  {
    v11 = 0;
  }
  -[HMRemoteLoginHandler setLoggedInAccount:](v6, "setLoggedInAccount:", v11);
  -[HMRemoteLoginHandler _callAccountUpdateDelegate](v6, "_callAccountUpdateDelegate");

}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMRemoteLoginHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  HMRemoteLoginHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  HMRemoteLoginHandler *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  HMRemoteLoginHandler *v42;
  NSObject *v43;
  void *v44;
  _QWORD v46[5];
  _QWORD block[5];
  _QWORD v48[5];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMRemoteLoginHandler _configureAccessoryInfoDataProviderIfNeeded](self, "_configureAccessoryInfoDataProviderIfNeeded");
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMRemoteLoginHandler accessory](self, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryInfoDataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v14;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Unsubscribe to new object's accessory info data provider", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v9, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryInfoDataProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke;
      v48[3] = &unk_1E3AB5CA8;
      v48[4] = v12;
      objc_msgSend(v16, "unsubscribeToAccessoryInfoWithHomeIdentifier:accessoryIdentifier:accessoryInfoTypes:completionHandler:", v17, v18, 2, v48);

    }
    -[HMRemoteLoginHandler loggedInAccount](self, "loggedInAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggedInAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if ((v21 & 1) == 0 && (objc_msgSend(v9, "supportsMessagedHomePodSettings") & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "loggedInAccount");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v25;
        v51 = 2112;
        v52 = v26;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@Merging logged in account: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(v8, "loggedInAccount");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMRemoteLoginHandler setLoggedInAccount:](v23, "setLoggedInAccount:", v27);

      -[HMRemoteLoginHandler context](v23, "context");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "queue");
      v29 = objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke_44;
        block[3] = &unk_1E3AB5E18;
        block[4] = v23;
        dispatch_async(v29, block);
        v5 = 1;
      }

    }
    -[HMRemoteLoginHandler stagedLoggedInAccount](self, "stagedLoggedInAccount");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stagedLoggedInAccount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = HMFEqualObjects();

    if ((v32 & 1) == 0)
    {
      v33 = (void *)MEMORY[0x1A1AC1AAC]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stagedLoggedInAccount");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v36;
        v51 = 2112;
        v52 = v37;
        _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_INFO, "%{public}@Merging staged logged in account: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(v8, "stagedLoggedInAccount");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMRemoteLoginHandler setStagedLoggedInAccount:](v34, "setStagedLoggedInAccount:", v38);

      -[HMRemoteLoginHandler context](v34, "context");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "queue");
      v40 = objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke_45;
        v46[3] = &unk_1E3AB5E18;
        v46[4] = v34;
        dispatch_async(v40, v46);
        v5 = 1;
      }

    }
  }
  else
  {
    v41 = (void *)MEMORY[0x1A1AC1AAC]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v44;
      _os_log_impl(&dword_19B1B0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Remote login handler from new home data is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
  }

  return v5;
}

- (void)_callAccountUpdateDelegate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMRemoteLoginHandler *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMRemoteLoginHandler context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__HMRemoteLoginHandler__callAccountUpdateDelegate__block_invoke;
    v10[3] = &unk_1E3AB5E18;
    v10[4] = self;
    objc_msgSend(v4, "invokeBlock:", v10);
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of updated logged in account due to no delegate caller on context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)companionLoginWithAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMRemoteLoginHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMRemoteLoginHandler *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMRemoteLoginHandler context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMRemoteLoginHandler companionLoginWithAccount:completion:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HMRemoteLoginHandler_companionLoginWithAccount_completion___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMRemoteLoginHandler companionLoginWithAccount:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)_companionLoginWithAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMRemoteLoginHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t);
  void *v29;
  HMRemoteLoginHandler *v30;
  void (**v31)(id, void *);
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMRemoteLoginHandler context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMRemoteLoginHandler currentSessionID](self, "currentSessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v10);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = CFSTR("kRemoteLoginSessionID");
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = CFSTR("kRemoteLoginAccount");
      v33[0] = v16;
      encodeRootObject(v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_alloc(MEMORY[0x1E0D285F8]);
      v20 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMRemoteLoginHandler uuid](self, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithTarget:", v21);
      v23 = (void *)objc_msgSend(v19, "initWithName:destination:payload:", CFSTR("kRemoteLoginCompanionAuthentication"), v22, v18);

      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __62__HMRemoteLoginHandler__companionLoginWithAccount_completion___block_invoke;
      v29 = &unk_1E3AB59B8;
      v30 = self;
      v31 = v7;
      objc_msgSend(v23, "setResponseHandler:", &v26);
      objc_msgSend(v8, "messageDispatcher", v26, v27, v28, v29, v30);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendMessage:", v23);

      objc_msgSend(v15, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMRemoteLoginHandler setCurrentSessionID:](self, "setCurrentSessionID:", v25);

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v14;
      v36 = 2080;
      v37 = "-[HMRemoteLoginHandler _companionLoginWithAccount:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)queryProxiedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMRemoteLoginHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMRemoteLoginHandler context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@queryProxiedDevice - nil completion", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v15);
    }
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__HMRemoteLoginHandler_queryProxiedDevice___block_invoke;
    v16[3] = &unk_1E3AB60A0;
    v16[4] = self;
    v17 = v4;
    dispatch_async(v7, v16);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2080;
      v21 = "-[HMRemoteLoginHandler queryProxiedDevice:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_queryProxiedDevice:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMRemoteLoginHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  HMRemoteLoginHandler *v26;
  void (**v27)(id, void *, _QWORD);
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[HMRemoteLoginHandler context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMRemoteLoginHandler currentSessionID](self, "currentSessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v7, 0);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("kRemoteLoginSessionID");
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc(MEMORY[0x1E0D285F8]);
      v16 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMRemoteLoginHandler uuid](self, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);
      v19 = (void *)objc_msgSend(v15, "initWithName:destination:payload:", CFSTR("kRemoteLoginQueryProxiedDevice"), v18, v14);

      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __44__HMRemoteLoginHandler__queryProxiedDevice___block_invoke;
      v25 = &unk_1E3AB59B8;
      v26 = self;
      v27 = v4;
      objc_msgSend(v19, "setResponseHandler:", &v22);
      objc_msgSend(v5, "messageDispatcher", v22, v23, v24, v25, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendMessage:", v19);

      objc_msgSend(v12, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMRemoteLoginHandler setCurrentSessionID:](self, "setCurrentSessionID:", v21);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v11;
      v32 = 2080;
      v33 = "-[HMRemoteLoginHandler _queryProxiedDevice:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_handleQueryProxiedDeviceResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMRemoteLoginHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMRemoteLoginHandler *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  HMRemoteLoginHandler *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMRemoteLoginHandler setCurrentSessionID:](self, "setCurrentSessionID:", 0);
  if (v8)
  {
    objc_msgSend(v8, "hmf_dataForKey:", CFSTR("kRemoteLoginProxiedDevice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v30 = v9;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v30;

      if (v13)
      {
        v15 = (void *)MEMORY[0x1A1AC1AAC]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v18;
          v33 = 2112;
          v34 = v13;
          _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Query proxied device responded with device: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        -[HMRemoteLoginHandler context](v16, "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "delegateCaller");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "callCompletion:error:proxiedDevice:", v10, 0, v13);

LABEL_18:
        v9 = v14;
        goto LABEL_19;
      }
    }
    else
    {
      v14 = v9;
    }
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v29;
      v33 = 2112;
      v34 = v8;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Query proxied device failed to decode with response: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    -[HMRemoteLoginHandler context](v27, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "callCompletion:error:proxiedDevice:", v10, v14, 0);
    goto LABEL_18;
  }
  v21 = (void *)MEMORY[0x1A1AC1AAC](v11);
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543618;
    v32 = v24;
    v33 = 2112;
    v34 = v25;
    _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Query proxied device responded with error: %@", buf, 0x16u);
    if (!v9)

  }
  objc_autoreleasePoolPop(v21);
  -[HMRemoteLoginHandler context](v22, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "callCompletion:error:proxiedDevice:", v10, v9, 0);
LABEL_19:

}

- (void)proxyLoginWithAuthResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMRemoteLoginHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMRemoteLoginHandler *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMRemoteLoginHandler context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMRemoteLoginHandler proxyLoginWithAuthResults:completion:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HMRemoteLoginHandler_proxyLoginWithAuthResults_completion___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMRemoteLoginHandler proxyLoginWithAuthResults:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)_proxyLoginWithAuthResults:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMRemoteLoginHandler *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMRemoteLoginHandler *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[4];
  _QWORD v56[4];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  -[HMRemoteLoginHandler currentSessionID](self, "currentSessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CFFFC8];
    objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x1E0CFFFC8]);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_12;
    v15 = (void *)v14;
    v50 = v12;
    v16 = *MEMORY[0x1E0CFFFA8];
    objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x1E0CFFFA8]);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = *MEMORY[0x1E0CFFFA0];
      objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x1E0CFFFA0]);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        v49 = *MEMORY[0x1E0CFFF40];
        objc_msgSend(v7, "hmf_stringForKey:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v50;
        if (v22)
        {
          -[HMRemoteLoginHandler context](self, "context");
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = (void *)v23;
            v55[0] = v13;
            objc_msgSend(v7, "hmf_stringForKey:", v13);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v56[0] = v25;
            v55[1] = v16;
            objc_msgSend(v7, "hmf_stringForKey:", v16);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v56[1] = v26;
            v55[2] = v19;
            objc_msgSend(v7, "hmf_stringForKey:", v19);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v56[2] = v27;
            v55[3] = v49;
            objc_msgSend(v7, "hmf_stringForKey:");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v56[3] = v28;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = v50;
            v53[0] = CFSTR("kRemoteLoginSessionID");
            objc_msgSend(v50, "UUIDString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v53[1] = CFSTR("kRemoteLoginAuthResults");
            v54[0] = v30;
            encodeRootObject(v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v54[1] = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = objc_alloc(MEMORY[0x1E0D285F8]);
            v34 = objc_alloc(MEMORY[0x1E0D285D8]);
            -[HMRemoteLoginHandler uuid](self, "uuid");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v34, "initWithTarget:", v35);
            v37 = (void *)objc_msgSend(v33, "initWithName:destination:payload:", CFSTR("kRemoteLoginProxyAuthentication"), v36, v32);

            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __62__HMRemoteLoginHandler__proxyLoginWithAuthResults_completion___block_invoke;
            v51[3] = &unk_1E3AB59B8;
            v51[4] = self;
            v52 = v6;
            objc_msgSend(v37, "setResponseHandler:", v51);
            objc_msgSend(v24, "messageDispatcher");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "sendMessage:", v37);

          }
          else
          {
            v45 = (void *)MEMORY[0x1A1AC1AAC]();
            v46 = self;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v58 = v48;
              v59 = 2080;
              v60 = "-[HMRemoteLoginHandler _proxyLoginWithAuthResults:completion:]";
              _os_log_impl(&dword_19B1B0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v45);
            v24 = 0;
          }
          goto LABEL_16;
        }
LABEL_12:
        v39 = (void *)MEMORY[0x1A1AC1AAC]();
        v40 = self;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Missing required auth parameters", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v39);
        if (!v6)
          goto LABEL_17;
        -[HMRemoteLoginHandler context](v40, "context");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "delegateCaller");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "callCompletion:error:", v6, v44);

LABEL_16:
LABEL_17:

        goto LABEL_18;
      }

    }
    v12 = v50;
    goto LABEL_12;
  }
  if (v6)
  {
    -[HMRemoteLoginHandler context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v6, v11);

  }
LABEL_18:

}

- (void)_handleLoginResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMRemoteLoginHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMRemoteLoginHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to login with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    objc_msgSend(v8, "hmf_dataForKey:", CFSTR("kRemoteLoginAccount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, &v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v25;
      if (!v16)
      {
        v18 = (void *)MEMORY[0x1A1AC1AAC]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = v18;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v21;
          v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive logged in account from logged in account data: %@", buf, 0x16u);

          v18 = v24;
        }

        objc_autoreleasePoolPop(v18);
      }

    }
    else
    {
      v16 = 0;
    }
    -[HMRemoteLoginHandler setLoggedInAccount:](self, "setLoggedInAccount:", v16, v24);

  }
  -[HMRemoteLoginHandler context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "delegateCaller");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "callCompletion:error:", v10, v9);

  -[HMRemoteLoginHandler setCurrentSessionID:](self, "setCurrentSessionID:", 0);
}

- (void)signout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMRemoteLoginHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMRemoteLoginHandler *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMRemoteLoginHandler context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMRemoteLoginHandler signout:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = (const char *)v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__HMRemoteLoginHandler_signout___block_invoke;
    block[3] = &unk_1E3AB60A0;
    block[4] = self;
    v20 = v4;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2080;
      v24 = "-[HMRemoteLoginHandler signout:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)_signout:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMRemoteLoginHandler *v19;
  NSObject *v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;
  HMRemoteLoginHandler *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMRemoteLoginHandler *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  void *v35;
  HMRemoteLoginHandler *v36;
  void (**v37)(id, void *);
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HMRemoteLoginHandler currentSessionID](self, "currentSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = 15;
LABEL_4:
      objc_msgSend(v6, "hmErrorWithCode:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8);
LABEL_17:

    }
  }
  else
  {
    -[HMRemoteLoginHandler loggedInAccount](self, "loggedInAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HMRemoteLoginHandler context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = CFSTR("kRemoteLoginSessionID");
        objc_msgSend(v10, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_alloc(MEMORY[0x1E0D285F8]);
        v14 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMRemoteLoginHandler uuid](self, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
        v17 = (void *)objc_msgSend(v13, "initWithName:destination:payload:", CFSTR("kRemoteLoginSignout"), v16, v12);

        v32 = MEMORY[0x1E0C809B0];
        v33 = 3221225472;
        v34 = __33__HMRemoteLoginHandler__signout___block_invoke;
        v35 = &unk_1E3AB59B8;
        v36 = self;
        v37 = v4;
        v18 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v17, "setResponseHandler:", &v32));
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMRemoteLoginHandler loggedInAccount](v19, "loggedInAccount", v32, v33, v34, v35, v36);
          v22 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v21;
          v42 = 2112;
          v43 = v22;
          _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Signing out of account: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(v8, "messageDispatcher");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sendMessage:", v17);

      }
      else
      {
        v28 = (void *)MEMORY[0x1A1AC1AAC]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v31;
          v42 = 2080;
          v43 = "-[HMRemoteLoginHandler _signout:]";
          _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
      }
      goto LABEL_17;
    }
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v27;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@There is no logged in account, cannot sign out", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = 3;
      goto LABEL_4;
    }
  }

}

- (void)_handleRemoteLoginSignoutResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMRemoteLoginHandler *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMRemoteLoginHandler loggedInAccount](v12, "loggedInAccount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Signing out of account %@ failed with error: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMRemoteLoginHandler loggedInAccount](v12, "loggedInAccount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Signed out of account %@ successfully", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMRemoteLoginHandler setLoggedInAccount:](v12, "setLoggedInAccount:", 0);
  }
  -[HMRemoteLoginHandler context](v12, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegateCaller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "callCompletion:error:", v10, v9);

  -[HMRemoteLoginHandler setCurrentSessionID:](v12, "setCurrentSessionID:", 0);
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMRemoteLoginHandler messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMRemoteLoginHandler context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMRemoteLoginHandler)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMRemoteLoginHandler *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRemoteLoginAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kStagedRemoteLoginAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRemoteLoginAnisetterProviderBridge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HMRemoteLoginHandler initWithUUID:accessory:loggedInAccount:stagedLoggedInAccount:anisetteDataProvider:](self, "initWithUUID:accessory:loggedInAccount:stagedLoggedInAccount:anisetteDataProvider:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 accountInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMRemoteLoginHandler *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  ACAccount *loggedInAccount;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received updated accountInfo: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  os_unfair_lock_lock_with_options();
  -[HMRemoteLoginHandler _accountFromAccountInfo:](v12, "_accountFromAccountInfo:", v10);
  v15 = objc_claimAutoreleasedReturnValue();
  loggedInAccount = v12->_loggedInAccount;
  v12->_loggedInAccount = (ACAccount *)v15;

  v12->_didReceiveAccountInfo = 1;
  os_unfair_lock_unlock(&v12->_lock);
  -[HMRemoteLoginHandler _callAccountUpdateDelegate](v12, "_callAccountUpdateDelegate");

}

- (id)_accountFromAccountInfo:(id)a3
{
  id v4;
  void *v5;
  HMRemoteLoginHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMRemoteLoginHandler *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMRemoteLoginHandler *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMRemoteLoginHandler *v30;
  NSObject *v31;
  void *v32;
  int v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543618;
    v35 = v8;
    v36 = 2112;
    v37 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Transferring account: %@", (uint8_t *)&v34, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = v6;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aaAltDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amsAltDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signedIn");
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138544386;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v14;
    v40 = 2112;
    v41 = v15;
    v42 = 2112;
    v43 = v16;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Transferring account username: %@, aaAltDSID:%@, amsAltDSID: %@, signedIn: %@", (uint8_t *)&v34, 0x34u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v4, "username");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    objc_msgSend(v18, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F170]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v19);
      if (v20)
      {
        objc_msgSend(v4, "username");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setUsername:", v21);

        objc_msgSend(v4, "aaAltDSID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_aa_setAltDSID:", v22);

        objc_msgSend(v4, "amsAltDSID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ams_setAltDSID:", v23);

        v24 = (void *)objc_msgSend(v20, "copy");
      }
      else
      {
        v29 = (void *)MEMORY[0x1A1AC1AAC]();
        v30 = v10;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v32;
          v36 = 2112;
          v37 = v4;
          _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform accountInfo %@", (uint8_t *)&v34, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        v24 = 0;
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      v26 = v10;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v28;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine store account type for iTunesStore", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMRemoteLoginHandler uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMRemoteLoginHandler uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRemoteLoginHandler uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRemoteLoginHandler accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRemoteLoginHandler currentSessionID](self, "currentSessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRemoteLoginHandler isControllable](self, "isControllable");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRemoteLoginHandler isSessionInProgress](self, "isSessionInProgress");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRemoteLoginHandler loggedInAccount](self, "loggedInAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: identifier = %@, uuid = %@, accessory identifier = %@, currentSessionID = %@, isControllable = %@, sessionInProgress = %@, loggedInAccount = %@>"), v4, v5, v6, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (HMRemoteLoginAnisetteDataProvider)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)didReceiveAccountInfo
{
  return self->_didReceiveAccountInfo;
}

- (void)setDidReceiveAccountInfo:(BOOL)a3
{
  self->_didReceiveAccountInfo = a3;
}

- (ACAccount)stagedLoggedInAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStagedLoggedInAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (HMAccessoryInfoDataProvider)accessoryInfoDataProvider
{
  return self->_accessoryInfoDataProvider;
}

- (void)setAccessoryInfoDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryInfoDataProvider, a3);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_accessoryInfoDataProvider, 0);
  objc_storeStrong((id *)&self->_stagedLoggedInAccount, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSessionID, 0);
  objc_storeStrong((id *)&self->_loggedInAccount, 0);
}

uint64_t __33__HMRemoteLoginHandler__signout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRemoteLoginSignoutResponse:error:completion:", a3, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __32__HMRemoteLoginHandler_signout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_signout:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__HMRemoteLoginHandler__proxyLoginWithAuthResults_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLoginResponse:error:completion:", a3, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __61__HMRemoteLoginHandler_proxyLoginWithAuthResults_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proxyLoginWithAuthResults:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __44__HMRemoteLoginHandler__queryProxiedDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQueryProxiedDeviceResponse:error:completion:", a3, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __43__HMRemoteLoginHandler_queryProxiedDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryProxiedDevice:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__HMRemoteLoginHandler__companionLoginWithAccount_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLoginResponse:error:completion:", a3, a2, *(_QWORD *)(a1 + 40));
}

uint64_t __61__HMRemoteLoginHandler_companionLoginWithAccount_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_companionLoginWithAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __50__HMRemoteLoginHandler__callAccountUpdateDelegate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE45A8F8))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "loggedInAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did update logged in account: %@ delegate: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "accessory:didUpdateLoggedInAccount:", v2, v6);

}

void __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe to accessory info data provider with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callAccountUpdateDelegate");
}

uint64_t __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callAccountUpdateDelegate");
}

void __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke(void **a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  id location;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v30 = CFSTR("kRemoteLoginAccount");
  v2 = a1 + 4;
  encodeRootObject(a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(a1[5], "messageDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageWithName:destination:payload:", CFSTR("HMRL.ua"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, a1[5]);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E3AB5538;
  objc_copyWeak(&v28, &location);
  v26 = *v2;
  v27 = a1[7];
  v9 = _Block_copy(aBlock);
  objc_msgSend(a1[5], "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _Block_copy(v9);
  objc_msgSend(v11, "addCompletionBlock:forIdentifier:", v13, v12);

  v18 = v8;
  v19 = 3221225472;
  v20 = __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke_38;
  v21 = &unk_1E3AB60C8;
  v14 = v11;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  v16 = v9;
  v24 = v16;
  objc_msgSend(v7, "setResponseHandler:", &v18);
  objc_msgSend(a1[6], "messageDispatcher", v18, v19, v20, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:completionHandler:", v7, 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v3)
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Update logged in account: %@ responded with success", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "setLoggedInAccount:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(WeakRetained, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callCompletion:error:", *(_QWORD *)(a1 + 40), v3);

}

void __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __67__HMRemoteLoginHandler__configureAccessoryInfoDataProviderIfNeeded__block_invoke(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Subscribed to accessory info data provider with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t51 != -1)
    dispatch_once(&logCategory__hmf_once_t51, &__block_literal_global_37116);
  return (id)logCategory__hmf_once_v52;
}

void __35__HMRemoteLoginHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v52;
  logCategory__hmf_once_v52 = v0;

}

@end
