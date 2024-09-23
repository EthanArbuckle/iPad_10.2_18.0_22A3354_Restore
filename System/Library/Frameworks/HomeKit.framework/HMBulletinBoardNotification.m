@implementation HMBulletinBoardNotification

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMBulletinBoardNotification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMBulletinBoardNotification *v25;
  HMBulletinBoardNotification *v26;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v11;
      v32 = 2112;
      v33 = v5;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded service: %@, accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v26 = 0;
  }
  else
  {
    v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.BulletinBoardNotificationEnabled"));
    v13 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("HM.BulletinBoardNotificationCondition"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMPredicateUtilities rewritePredicateForClient:home:](HMPredicateUtilities, "rewritePredicateForClient:home:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "instanceID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v20;
    v28[1] = CFSTR("HM.BulletinBoardNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v7, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v23, 0, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -[HMBulletinBoardNotification initWithEnabled:condition:service:messageTargetUUID:](self, "initWithEnabled:condition:service:messageTargetUUID:", v12, v18, v5, v24);
    v26 = v25;
  }

  return v26;
}

- (HMBulletinBoardNotification)initWithEnabled:(BOOL)a3 condition:(id)a4 service:(id)a5 messageTargetUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMBulletinBoardNotification *v14;
  HMBulletinBoardNotification *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMBulletinBoardNotification;
  v14 = -[HMBulletinBoardNotification init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_enabled = a3;
    objc_storeStrong((id *)&v14->_condition, a4);
    objc_storeWeak((id *)&v15->_service, v12);
    objc_storeStrong((id *)&v15->_messageTargetUUID, a6);
  }

  return v15;
}

- (void)__configureWithContext:(id)a3
{
  id v4;
  void *v5;
  HMBulletinBoardNotification *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBulletinBoardNotification setContext:](v6, "setContext:", v4);
  -[HMBulletinBoardNotification _registerNotificationHandlers](v6, "_registerNotificationHandlers");

}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)_registerNotificationHandlers
{
  void *v3;
  id v4;

  -[HMBulletinBoardNotification context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("kBulletinBoardNotificationUpdateNotificationKey"), self, sel__handleBulletinBoardNotificationUpdateNotification_);

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMBulletinBoardNotification context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return self->_context;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_54016 != -1)
    dispatch_once(&logCategory__hmf_once_t14_54016, &__block_literal_global_54017);
  return (id)logCategory__hmf_once_v15_54018;
}

void __42__HMBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_54018;
  logCategory__hmf_once_v15_54018 = v0;

}

- (void)_unconfigureContext
{
  void *v3;
  void *v4;
  _HMContext *context;

  -[_HMContext messageDispatcher](self->_context, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  HMBulletinBoardNotification *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring bulletinBoard notification", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMBulletinBoardNotification _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)_handleBulletinBoardNotificationUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  HMBulletinBoardNotification *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received bulletin board update notification with message %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = objc_msgSend(v4, "BOOLForKey:", CFSTR("HM.BulletinBoardNotificationEnabled"));
  objc_msgSend(v4, "predicateForKey:", CFSTR("HM.BulletinBoardNotificationCondition"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBulletinBoardNotification service](v6, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPredicateUtilities rewritePredicateForClient:home:](HMPredicateUtilities, "rewritePredicateForClient:home:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMBulletinBoardNotification context](v6, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pendingRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeCompletionBlockForIdentifier:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v10 ^ -[HMBulletinBoardNotification isEnabled](v6, "isEnabled");
  if (v20 == 1)
    -[HMBulletinBoardNotification setEnabled:](v6, "setEnabled:", v10);
  -[HMBulletinBoardNotification condition](v6, "condition");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HMFEqualObjects();

  if (v22)
  {
    if (!v19)
    {
      if (!v20)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    -[HMBulletinBoardNotification setCondition:](v6, "setCondition:", v15);
    if (!v19)
    {
LABEL_11:
      -[HMBulletinBoardNotification _callBulletinBoardNotificationUpdatedDelegate](v6, "_callBulletinBoardNotificationUpdatedDelegate");
      goto LABEL_12;
    }
  }
  -[HMBulletinBoardNotification context](v6, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "delegateCaller");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "callCompletion:error:", v19, 0);

LABEL_12:
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
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", self->_messageTargetUUID);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)isEnabled
{
  HMBulletinBoardNotification *v2;
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

- (NSPredicate)condition
{
  os_unfair_lock_s *p_lock;
  NSPredicate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_condition;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCondition:(id)a3
{
  NSPredicate *v4;
  NSPredicate *condition;

  v4 = (NSPredicate *)a3;
  os_unfair_lock_lock_with_options();
  condition = self->_condition;
  self->_condition = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_callBulletinBoardNotificationUpdatedDelegate
{
  void *v3;
  HMBulletinBoardNotification *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Calling service notification delegate", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMBulletinBoardNotification service](v4, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE45A8F8))
  {
    v10 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMBulletinBoardNotification context](v4, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __76__HMBulletinBoardNotification__callBulletinBoardNotificationUpdatedDelegate__block_invoke;
      v13[3] = &unk_1E3AB5CD0;
      v14 = v10;
      v15 = v8;
      v16 = v7;
      objc_msgSend(v12, "invokeBlock:", v13);

    }
  }

}

- (void)commitWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMBulletinBoardNotification *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMBulletinBoardNotification *v15;
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
  -[HMBulletinBoardNotification context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMBulletinBoardNotification commitWithCompletionHandler:]", CFSTR("completion"));
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
    block[2] = __59__HMBulletinBoardNotification_commitWithCompletionHandler___block_invoke;
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
      v24 = "-[HMBulletinBoardNotification commitWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)_commitWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
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
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  HMBulletinBoardNotification *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMBulletinBoardNotification *v41;
  NSObject *v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  const __CFString *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMBulletinBoardNotification context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMBulletinBoardNotification _commitWithCompletionHandler:]", CFSTR("completion"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1A1AC1AAC]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v43;
      v53 = 2112;
      v54 = (const char *)v39;
      _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v39, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  v6 = (void *)v5;
  if (v5)
  {
    -[HMBulletinBoardNotification service](self, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v49 = CFSTR("HM.BulletinBoardNotificationEnabled");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMBulletinBoardNotification isEnabled](self, "isEnabled"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      -[HMBulletinBoardNotification condition](self, "condition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[HMBulletinBoardNotification condition](self, "condition");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[HMPredicateUtilities validatePredicate:](HMPredicateUtilities, "validatePredicate:", v14);

        if (!v15)
        {
          -[HMBulletinBoardNotification context](self, "context");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "delegateCaller");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
          v29 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "callCompletion:error:", v4, v29);
          goto LABEL_15;
        }
        buf[0] = 0;
        -[HMBulletinBoardNotification condition](self, "condition");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMPredicateUtilities rewritePredicateForDaemon:characteristicIsInvalid:](HMPredicateUtilities, "rewritePredicateForDaemon:characteristicIsInvalid:", v16, buf);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          encodeRootObject(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("HM.BulletinBoardNotificationCondition"));

        }
      }
      v19 = objc_alloc(MEMORY[0x1E0D285F8]);
      v20 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMBulletinBoardNotification messageTargetUUID](self, "messageTargetUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithTarget:", v21);
      v23 = (void *)objc_msgSend(v19, "initWithName:destination:payload:", CFSTR("kBulletinBoardNotificationCommitRequestKey"), v22, v12);

      -[HMBulletinBoardNotification context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pendingRequests");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = _Block_copy(v4);
      objc_msgSend(v25, "addCompletionBlock:forIdentifier:", v27, v26);

      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __60__HMBulletinBoardNotification__commitWithCompletionHandler___block_invoke;
      v45[3] = &unk_1E3AB5C08;
      v46 = v25;
      v47 = v26;
      v28 = v6;
      v48 = v28;
      v29 = v26;
      v30 = v25;
      objc_msgSend(v23, "setResponseHandler:", v45);
      objc_msgSend(v28, "messageDispatcher");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "sendMessage:", v23);

LABEL_15:
      goto LABEL_16;
    }
    -[HMBulletinBoardNotification context](self, "context");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "delegateCaller");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "callCompletion:error:", v4, v38);

    v9 = 0;
  }
  else
  {
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v35;
      v53 = 2080;
      v54 = "-[HMBulletinBoardNotification _commitWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
LABEL_16:

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMBulletinBoardNotification service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBulletinBoardNotification messageTargetUUID](self, "messageTargetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HMBulletinBoardNotification *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMBulletinBoardNotification *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HMBulletinBoardNotification condition](self, "condition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "condition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBulletinBoardNotification condition](v11, "condition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "condition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Merging due to condition value change from %@ to %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v6, "condition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBulletinBoardNotification setCondition:](v11, "setCondition:", v16);

  }
  v17 = -[HMBulletinBoardNotification isEnabled](self, "isEnabled");
  if (v17 != objc_msgSend(v6, "isEnabled"))
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBulletinBoardNotification isEnabled](v19, "isEnabled");
      HMFBooleanToString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isEnabled");
      HMFBooleanToString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Merging due to enabled value change from %@ to %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMBulletinBoardNotification setEnabled:](v19, "setEnabled:", objc_msgSend(v6, "isEnabled"));
  }

  return v9 ^ 1;
}

- (HMService)service
{
  return (HMService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

void __60__HMBulletinBoardNotification__commitWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", v7, v5);

  }
}

uint64_t __59__HMBulletinBoardNotification_commitWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __76__HMBulletinBoardNotification__callBulletinBoardNotificationUpdatedDelegate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateBulletinBoardNotificationForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
