@implementation HMDUserManagementOperation

- (HMDUserManagementOperation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDUserManagementOperation)initWithOperationType:(unint64_t)a3 identifier:(id)a4 user:(id)a5 accessory:(id)a6 expiration:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMDUserManagementOperation *v16;
  NSUUID *v17;
  void *identifier;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSUUID *v24;
  id v25;
  const char *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *clientQueue;
  HMDUserManagementOperation *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v37;
  void *v38;
  id v39;
  id v40;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v41.receiver = self;
  v41.super_class = (Class)HMDUserManagementOperation;
  v16 = -[HMDUserManagementOperation init](&v41, sel_init);
  if (!v16)
    goto LABEL_14;
  v39 = v15;
  v40 = v13;
  if (v12)
  {
    v17 = (NSUUID *)v12;
    identifier = v16->_identifier;
    v16->_identifier = v17;
  }
  else if (a3 && v13 && v14)
  {
    if (a3 > 3)
      v19 = CFSTR("unknown");
    else
      v19 = off_1E89B34E0[a3 - 1];
    objc_msgSend(v14, "uuid", MEMORY[0x1E0CB3A28]);
    identifier = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v19;
    objc_msgSend(v13, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", identifier, 0, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v16->_identifier;
    v16->_identifier = (NSUUID *)v23;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = objc_claimAutoreleasedReturnValue();
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v20;
  }

  HMDispatchQueueNameString();
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = (const char *)objc_msgSend(v25, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = dispatch_queue_create(v26, v27);
  clientQueue = v16->_clientQueue;
  v16->_clientQueue = (OS_dispatch_queue *)v28;

  v16->_operationType = a3;
  objc_storeStrong((id *)&v16->_user, a5);
  objc_storeStrong((id *)&v16->_accessory, a6);
  objc_storeStrong((id *)&v16->_expirationDate, a7);
  v16->_backoffInterval = 10.0;
  v16->_lastOperationFailed = 0;
  if (-[HMDUserManagementOperation isValid](v16, "isValid"))
  {
    -[HMDUserManagementOperation _setupExpirationTimer](v16, "_setupExpirationTimer");
    v15 = v39;
    v13 = v40;
LABEL_14:
    v30 = v16;
    goto LABEL_18;
  }
  v31 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  v15 = v39;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v43 = v33;
    v44 = 2112;
    v45 = v34;
    v35 = v34;
    _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Invalid operation, returning nil", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v31);
  v30 = 0;
  v13 = v40;
LABEL_18:

  return v30;
}

- (void)_setupExpirationTimer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  HMFTimer *v7;
  HMFTimer *expirationTimer;
  void *v9;
  id v10;

  if (!-[HMDUserManagementOperation state](self, "state"))
  {
    -[HMDUserManagementOperation expirationDate](self, "expirationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    v6 = v5;

    if (v6 <= 0.0)
    {
      -[HMDUserManagementOperation setState:](self, "setState:", 3);
    }
    else
    {
      v7 = (HMFTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v6);
      expirationTimer = self->_expirationTimer;
      self->_expirationTimer = v7;

      -[HMDUserManagementOperation expirationTimer](self, "expirationTimer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDelegate:", self);

      -[HMDUserManagementOperation expirationTimer](self, "expirationTimer");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resume");

    }
  }
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _BOOL4 v19;
  void *v20;

  v3 = a3;
  v18 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUserManagementOperation shortDescription](self, "shortDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E89C3E38;
  }
  v6 = -[HMDUserManagementOperation operationType](self, "operationType") - 1;
  if (v6 > 2)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E89B34E0[v6];
  -[HMDUserManagementOperation isFinished](self, "isFinished");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation isReady](self, "isReady");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation isExecuting](self, "isExecuting");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation isCancelled](self, "isCancelled");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation isExpired](self, "isExpired");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation expirationDate](self, "expirationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation user](self, "user");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation accessory](self, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@%@, Operation Type = %@, Finished = %@, Ready = %@, Executing = %@, Cancelled = %@, Expired = %@, Expiration Date = %@, User = %@, Accessory = %@>"), v20, v5, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  return v16;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDUserManagementOperation descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDUserManagementOperation descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)isAddOperation
{
  return -[HMDUserManagementOperation operationType](self, "operationType") == 1;
}

- (BOOL)isRemoveOperation
{
  return -[HMDUserManagementOperation operationType](self, "operationType") == 2;
}

- (BOOL)isAuditOperation
{
  return -[HMDUserManagementOperation operationType](self, "operationType") == 3;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  HMDUserManagementOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDUserManagementOperation *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  HMDUserManagementOperation *v19;
  void *v20;
  char v21;
  void *v22;
  HMDUserManagementOperation *v23;
  NSObject *v24;
  void *v25;
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[HMDUserManagementOperation isAuditOperation](self, "isAuditOperation"))
  {
    -[HMDUserManagementOperation accessory](self, "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = 1;
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v27 = 138543362;
    *(_QWORD *)&v27[4] = v17;
    v18 = "%{public}@Cannot audit accessory if not contained in home";
    goto LABEL_13;
  }
  -[HMDUserManagementOperation user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingUsername");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7 != 0;

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543362;
      *(_QWORD *)&v27[4] = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Missing user's identifier", v27, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
  -[HMDUserManagementOperation user](self, "user");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publicKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      objc_autoreleasePoolPop(v14);
      v5 = 0;
      goto LABEL_15;
    }
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v27 = 138543362;
    *(_QWORD *)&v27[4] = v17;
    v18 = "%{public}@Missing user's public key";
LABEL_13:
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, v18, v27, 0xCu);

    goto LABEL_14;
  }
LABEL_15:
  -[HMDUserManagementOperation accessory](self, "accessory", *(_OWORD *)v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isPrimary");

  if ((v21 & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543362;
      *(_QWORD *)&v27[4] = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Accessory is not primary", v27, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    return 0;
  }
  return v5;
}

- (BOOL)isExecuting
{
  HMDUserManagementOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExecuting:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_executing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isFinished
{
  HMDUserManagementOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[HMDUserManagementOperation _isFinished](v2, "_isFinished");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_isFinished
{
  return self->_state - 1 < 3;
}

- (BOOL)isCancelled
{
  return -[HMDUserManagementOperation state](self, "state") == 2;
}

- (BOOL)isReady
{
  HMDUserManagementOperation *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  HMDUserManagementOperation *v19;
  void *v20;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x1E0C80C00];
  if (-[HMDUserManagementOperation isExecuting](self, "isExecuting"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperation shortDescription](v2, "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v5;
      v34 = 2112;
      v35 = v6;
      v7 = "%{public}@[%@] Operation is currently executing";
LABEL_24:
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, v7, buf, 0x16u);

LABEL_25:
    }
  }
  else if (-[HMDUserManagementOperation isFinished](v2, "isFinished"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperation shortDescription](v2, "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v5;
      v34 = 2112;
      v35 = v6;
      v7 = "%{public}@[%@] Operation is finished";
      goto LABEL_24;
    }
  }
  else
  {
    if (!-[HMDUserManagementOperation isBackingOff](v2, "isBackingOff"))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[HMDUserManagementOperation dependencies](v2, "dependencies");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v9)
      {
        v11 = v9;
        v12 = 0;
        v13 = *(_QWORD *)v29;
        *(_QWORD *)&v10 = 138543874;
        v27 = v10;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v8);
            v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isFinished", v27) & 1) == 0)
            {
              v16 = (void *)MEMORY[0x1D17BA0A0]();
              HMFGetOSLogHandle();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDUserManagementOperation shortDescription](v2, "shortDescription");
                v19 = v2;
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v27;
                v33 = v18;
                v34 = 2112;
                v35 = v20;
                v36 = 2112;
                v37 = v15;
                _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@[%@] Operation has unfinished dependency operation %@", buf, 0x20u);

                v2 = v19;
              }

              objc_autoreleasePoolPop(v16);
              v12 = 1;
            }
          }
          v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        }
        while (v11);

        if ((v12 & 1) != 0)
        {
          v3 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUserManagementOperation shortDescription](v2, "shortDescription");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v5;
            v34 = 2112;
            v35 = v6;
            v7 = "%{public}@[%@] Operation has unfinished dependency operations";
            goto LABEL_24;
          }
          goto LABEL_26;
        }
      }
      else
      {

      }
      -[HMDUserManagementOperation accessory](v2, "accessory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isReachable");

      if ((v23 & 1) != 0)
        return 1;
      v3 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserManagementOperation shortDescription](v2, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserManagementOperation accessory](v2, "accessory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v5;
        v34 = 2112;
        v35 = v24;
        v36 = 2112;
        v37 = v26;
        _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@[%@] Operation accessory '%@' is unreachable", buf, 0x20u);

        goto LABEL_25;
      }
      goto LABEL_26;
    }
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperation shortDescription](v2, "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v5;
      v34 = 2112;
      v35 = v6;
      v7 = "%{public}@[%@] Operation is currently in backoff";
      goto LABEL_24;
    }
  }
LABEL_26:

  objc_autoreleasePoolPop(v3);
  return 0;
}

- (BOOL)isExpired
{
  void *v3;
  double v4;
  double v5;

  if (-[HMDUserManagementOperation state](self, "state") == 3)
    return 1;
  -[HMDUserManagementOperation expirationDate](self, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  if (v5 < 0.0)
  {
    -[HMDUserManagementOperation setState:](self, "setState:", 3);
    return 1;
  }
  return 0;
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  unint64_t state;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  state = self->_state;
  if (state != a3)
  {
    if (state)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0](v6);
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDUserManagementOperation shortDescription](self, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self->_state;
        *(_DWORD *)buf = 138544130;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        v22 = 2048;
        v23 = v12;
        v24 = 2048;
        v25 = a3;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Invalid state change from %tu to %tu", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      self->_state = a3;
      if (-[HMDUserManagementOperation _isFinished](self, "_isFinished"))
      {
        -[HMDUserManagementOperation delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[HMDUserManagementOperation clientQueue](self, "clientQueue");
          v14 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __39__HMDUserManagementOperation_setState___block_invoke;
          block[3] = &unk_1E89C2730;
          block[4] = self;
          dispatch_async(v14, block);

        }
      }
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        -[HMDUserManagementOperation clientQueue](self, "clientQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __39__HMDUserManagementOperation_setState___block_invoke_2;
        v16[3] = &unk_1E89C2730;
        v16[4] = self;
        dispatch_async(v15, v16);

      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)lastOperationFailed
{
  HMDUserManagementOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_lastOperationFailed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLastOperationFailed:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_lastOperationFailed = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateDelegate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((-[HMDUserManagementOperation isAddOperation](self, "isAddOperation")
     || -[HMDUserManagementOperation isAuditOperation](self, "isAuditOperation"))
    && (-[HMDUserManagementOperation accessory](self, "accessory"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "home"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    -[HMDUserManagementOperation setDelegate:](self, "setDelegate:", v5);

  }
  else
  {
    -[HMDUserManagementOperation setDelegate:](self, "setDelegate:", v6);
  }

}

- (HMDUserManagementOperationManager)operationManager
{
  os_unfair_lock_s *p_lock;
  HMDUserManagementOperationManager *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_operationManager;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOperationManager:(id)a3
{
  HMDUserManagementOperationManager *v4;
  HMDUserManagementOperationManager *operationManager;

  v4 = (HMDUserManagementOperationManager *)a3;
  os_unfair_lock_lock_with_options();
  operationManager = self->_operationManager;
  self->_operationManager = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isBackingOff
{
  HMDUserManagementOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_backingOff;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setBackingOff:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_backingOff = a3;
  os_unfair_lock_unlock(p_lock);
}

- (double)nextBackoffInterval
{
  double result;

  -[HMDUserManagementOperation backoffInterval](self, "backoffInterval");
  self->_backoffInterval = fmin(result * 3.0, 5400.0);
  return result;
}

- (void)_startBackoffTimer
{
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[HMDUserManagementOperation isFinished](self, "isFinished"))
  {
    v3 = -[HMDUserManagementOperation nextBackoffInterval](self, "nextBackoffInterval");
    v5 = v4;
    v6 = (void *)MEMORY[0x1D17BA0A0](v3);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperation shortDescription](self, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2048;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] Starting operation backoff timer with expiration interval of %f seconds", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDUserManagementOperation setBackingOff:](self, "setBackingOff:", 1);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v5);
    -[HMDUserManagementOperation setBackoffTimer:](self, "setBackoffTimer:", v10);
    objc_msgSend(v10, "setDelegate:", self);
    objc_msgSend(v10, "resume");

  }
}

- (void)_endBackoffTimer
{
  id v3;

  -[HMDUserManagementOperation setBackoffTimer:](self, "setBackoffTimer:", 0);
  -[HMDUserManagementOperation setBackingOff:](self, "setBackingOff:", 0);
  -[HMDUserManagementOperation operationManager](self, "operationManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationStoppedBackingOff:", self);

}

- (NSArray)dependencies
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_dependencies, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addDependency:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableArray addObject:](self->_dependencies, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDUserManagementOperation clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HMDUserManagementOperation_cancel__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)executeWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDUserManagementOperation clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)_findConflictingAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[HMDUserManagementOperation operationManager](self, "operationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoriesMatchingIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v10;
    v6 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v4, "uuid", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (!v17)
          {
            v6 = v14;
            goto LABEL_13;
          }
        }
        v6 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v6;
}

- (void)_addPairingToHAPAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD aBlock[4];
  void (**v29)(id, _QWORD);
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserManagementOperation shortDescription](self, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Attempting to add pairing to accessory %@(%@)", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDUserManagementOperation _findConflictingAccessory:](self, "_findConflictingAccessory:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperation shortDescription](self, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v16;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@[%@] Do not add pairing for this accessory because it looks removed and another exists '%@'", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke;
    aBlock[3] = &unk_1E89C1A48;
    v29 = v7;
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke_2;
    v26[3] = &unk_1E89B33D8;
    v26[4] = self;
    v27 = _Block_copy(aBlock);
    v23[0] = v21;
    v23[1] = 3221225472;
    v23[2] = __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke_3;
    v23[3] = &unk_1E89C1558;
    v23[4] = self;
    v24 = v6;
    v25 = v27;
    v22 = v27;
    objc_msgSend(v24, "performOperation:linkType:operationBlock:errorBlock:", 5, 0, v26, v23);

  }
}

- (void)_removePairingFromHAPAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD aBlock[4];
  void (**v35)(id, _QWORD);
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserManagementOperation shortDescription](self, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v13;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Attempting to remove pairing from accessory %@(%@)", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDUserManagementOperation _findConflictingAccessory:](self, "_findConflictingAccessory:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperation shortDescription](self, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v19;
      v38 = 2112;
      v39 = v20;
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@[%@] Do not remove pairing for this accessory because this looks removed and another exists '%@'", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke;
    aBlock[3] = &unk_1E89C1A48;
    v35 = v7;
    v22 = _Block_copy(aBlock);
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperation shortDescription](self, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v25;
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v27;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@[%@] Removing local pairing from accessory '%@'", buf, 0x20u);

      v21 = MEMORY[0x1E0C809B0];
    }

    objc_autoreleasePoolPop(v23);
    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke_190;
    v32[3] = &unk_1E89B33D8;
    v32[4] = self;
    v33 = v22;
    v29[0] = v21;
    v29[1] = 3221225472;
    v29[2] = __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke_2;
    v29[3] = &unk_1E89C1558;
    v29[4] = self;
    v30 = v6;
    v31 = v33;
    v28 = v33;
    objc_msgSend(v30, "performOperation:linkType:operationBlock:errorBlock:", 6, 0, v32, v29);

  }
}

- (void)_auditPairingsForHAPAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDUserManagementOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDUserManagementOperation *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (**v22)(id, void *);
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  void (**v37)(id, void *);
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v11;
    v41 = 2112;
    v42 = v12;
    v43 = 2112;
    v44 = v13;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to audit pairing for accessory %@(%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDUserManagementOperation accessory](v9, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory does not support user management", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v20);

    }
  }
  objc_initWeak((id *)buf, v9);
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke;
  aBlock[3] = &unk_1E89B3450;
  objc_copyWeak(&v38, (id *)buf);
  v22 = v7;
  v37 = v22;
  v23 = v6;
  v36 = v23;
  v24 = _Block_copy(aBlock);
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_2_196;
  v32[3] = &unk_1E89B34A0;
  objc_copyWeak(&v34, (id *)buf);
  v25 = v24;
  v33 = v25;
  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_199;
  v28[3] = &unk_1E89C0650;
  objc_copyWeak(&v31, (id *)buf);
  v26 = v23;
  v29 = v26;
  v27 = v25;
  v30 = v27;
  objc_msgSend(v26, "performOperation:linkType:operationBlock:errorBlock:", 7, 0, v32, v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)buf);

}

- (BOOL)mergeWithOperation:(id)a3
{
  id v4;

  v4 = a3;
  -[HMDUserManagementOperation setLastOperationFailed:](self, "setLastOperationFailed:", objc_msgSend(v4, "lastOperationFailed"));
  if (v4
    && !-[HMDUserManagementOperation isFinished](self, "isFinished")
    && objc_msgSend(v4, "isFinished"))
  {
    -[HMDUserManagementOperation cancel](self, "cancel");
  }

  return v4 != 0;
}

- (int64_t)_accessoryInvitationState
{
  int64_t result;

  result = -[HMDUserManagementOperation state](self, "state");
  if (result != 1)
  {
    if ((result & 0xFFFFFFFFFFFFFFFELL) == 2
      || -[HMDUserManagementOperation lastOperationFailed](self, "lastOperationFailed"))
    {
      return 3;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (HMDAccessoryInvitation)accessoryInvitation
{
  int64_t v3;
  HMDAccessoryInvitation *v4;
  void *v5;
  void *v6;
  HMDAccessoryInvitation *v7;

  v3 = -[HMDUserManagementOperation _accessoryInvitationState](self, "_accessoryInvitationState");
  v4 = [HMDAccessoryInvitation alloc];
  -[HMDUserManagementOperation accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDAccessoryInvitation initWithAccessory:identifier:state:](v4, "initWithAccessory:identifier:state:", v5, v6, v3);

  return v7;
}

- (NSDictionary)accessoryInvitationInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[HMDUserManagementOperation identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserManagementOperation accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDUserManagementOperation _accessoryInvitationState](self, "_accessoryInvitationState");
  v9 = 0;
  if (v4 && v7)
  {
    v12[0] = CFSTR("HM.accessoryInvitationIdentifier");
    v12[1] = CFSTR("HM.accessoryInvitationAccessoryUUID");
    v13[0] = v4;
    v13[1] = v7;
    v12[2] = CFSTR("HM.accessoryInvitationState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDictionary *)v9;
}

- (HMDUserManagementOperation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HAPPairingIdentity *v10;
  HAPPairingIdentity *ownerPairingIdentity;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *dependencies;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.operationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.user"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.expiry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMDUserManagementOperation initWithOperationType:identifier:user:accessory:expiration:](self, "initWithOperationType:identifier:user:accessory:expiration:", v5, v9, v6, v7, v8);
    if (self)
    {
      self->_state = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.state"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ownerPairingIdentity"));
      v10 = (HAPPairingIdentity *)objc_claimAutoreleasedReturnValue();
      ownerPairingIdentity = self->_ownerPairingIdentity;
      self->_ownerPairingIdentity = v10;

      v12 = (void *)MEMORY[0x1E0C99E60];
      v20[0] = objc_opt_class();
      v20[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("kUserManagementOperationsKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = (NSMutableArray *)objc_msgSend(v15, "mutableCopy");
        dependencies = self->_dependencies;
        self->_dependencies = v17;

      }
    }

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "encodeInteger:forKey:", -[HMDUserManagementOperation operationType](self, "operationType"), CFSTR("HM.operationType"));
    -[HMDUserManagementOperation user](self, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.user"));

    -[HMDUserManagementOperation accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accessory"));

    -[HMDUserManagementOperation identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.identifier"));

    -[HMDUserManagementOperation expirationDate](self, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.expiry"));

    -[HMDUserManagementOperation ownerPairingIdentity](self, "ownerPairingIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HM.ownerPairingIdentity"));

    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUserManagementOperation state](self, "state") != 0, CFSTR("HM.state"));
    -[HMDUserManagementOperation dependencies](self, "dependencies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kUserManagementOperationsKey"));

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = (id)objc_opt_class();
      v14 = v18;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_FAULT, "%{public}@%@ only supports NSKeyedArchiver coders", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (id)dictionaryEncoding
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("HM.identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUserManagementOperation operationType](self, "operationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("HM.operationType"));

  -[HMDUserManagementOperation user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("HM.user"));

  -[HMDUserManagementOperation accessory](self, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("accessory"));

  -[HMDUserManagementOperation expirationDate](self, "expirationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("HM.expiry"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUserManagementOperation state](self, "state"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("HM.state"));

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDUserManagementOperation *v9;

  v4 = a3;
  -[HMDUserManagementOperation clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HMDUserManagementOperation_timerDidFire___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)transactionWithObjectChangeType:(unint64_t)a3 parentUUID:(id)a4
{
  id v6;
  HMDUserManagementOperationModel *v7;
  void *v8;
  HMDUserManagementOperationModel *v9;

  v6 = a4;
  v7 = [HMDUserManagementOperationModel alloc];
  -[HMDUserManagementOperation identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v6);

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 parentUUID:(id)a4
{
  void *v5;

  -[HMDUserManagementOperation transactionWithObjectChangeType:parentUUID:](self, "transactionWithObjectChangeType:parentUUID:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperation populateModelObjectWithChangeType:version:](self, "populateModelObjectWithChangeType:version:", v5, 4);
  return v5;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  -[HMDUserManagementOperation modelObjectWithChangeType:parentUUID:](self, "modelObjectWithChangeType:parentUUID:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)populateModelObjectWithChangeType:(id)a3 version:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUserManagementOperation operationType](self, "operationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOperationType:", v8);

  -[HMDUserManagementOperation user](self, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairingIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserPairingIdentity:", v10);

  -[HMDUserManagementOperation ownerPairingIdentity](self, "ownerPairingIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOwnerPairingIdentity:", v11);

  -[HMDUserManagementOperation accessory](self, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EFABB088))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "pairingIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessoryPairingIdentity:", v15);

  }
  -[HMDUserManagementOperation expirationDate](self, "expirationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExpirationDate:", v16);

  -[HMDUserManagementOperation dependencies](self, "dependencies");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0C99DE8];
    -[HMDUserManagementOperation dependencies](self, "dependencies");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[HMDUserManagementOperation dependencies](self, "dependencies", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v26), "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "UUIDString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v24);
    }

    v29 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v7, "setDependencies:", v29);

  }
}

- (HMDUserManagementOperationDelegate)delegate
{
  return (HMDUserManagementOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (HMDUser)user
{
  return self->_user;
}

- (HMDAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (HAPPairingIdentity)ownerPairingIdentity
{
  return self->_ownerPairingIdentity;
}

- (void)setOwnerPairingIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMFTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (double)backoffInterval
{
  return self->_backoffInterval;
}

- (HMFTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimer, a3);
}

- (NSArray)auditUsersToBeAdded
{
  return self->_auditUsersToBeAdded;
}

- (void)setAuditUsersToBeAdded:(id)a3
{
  objc_storeStrong((id *)&self->_auditUsersToBeAdded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditUsersToBeAdded, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_ownerPairingIdentity, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationManager, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
}

void __43__HMDUserManagementOperation_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "expirationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setState:", 3);
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "backoffTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
      objc_msgSend(*(id *)(a1 + 40), "_endBackoffTimer");
  }
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  uint64_t v13;
  void (**v14)(id, void *);
  void (**v15)(id, void *);
  dispatch_group_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  _QWORD *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  _QWORD aBlock[4];
  NSObject *v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v11 = v9;
    if (v11)
    {
      v12 = v11;
      if ((objc_msgSend(v11, "isHMError") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("List pairing failed."), 0, 0, v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      v14 = (void (**)(id, void *))a1[5];
      if (v14)
        v14[2](v14, v12);
    }
    else
    {
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x3032000000;
      v45[3] = __Block_byref_object_copy__108952;
      v45[4] = __Block_byref_object_dispose__108953;
      v46 = 0;
      v16 = dispatch_group_create();
      v17 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_193;
      aBlock[3] = &unk_1E89B5170;
      v44 = v45;
      v18 = v16;
      v43 = v18;
      v19 = _Block_copy(aBlock);
      if (objc_msgSend(v8, "count"))
      {
        dispatch_group_enter(v18);
        v20 = a1[4];
        v37[0] = v17;
        v37[1] = 3221225472;
        v37[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_2;
        v37[3] = &unk_1E89B3400;
        v26 = v20;
        objc_copyWeak(&v41, a1 + 6);
        v25 = v19;
        v21 = v19;
        v40 = v21;
        v22 = v17;
        v23 = v8;
        v38 = v23;
        v39 = v18;
        v32[0] = v22;
        v32[1] = 3221225472;
        v32[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_3;
        v32[3] = &unk_1E89BDA00;
        objc_copyWeak(&v36, a1 + 6);
        v33 = v23;
        v34 = a1[4];
        v35 = v21;
        objc_msgSend(v26, "performOperation:linkType:operationBlock:errorBlock:", 6, 0, v37, v32);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&v41);
        v19 = v25;
        v17 = MEMORY[0x1E0C809B0];
      }
      objc_msgSend(WeakRetained, "clientQueue", v25);
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_194;
      block[3] = &unk_1E89B3428;
      objc_copyWeak(&v31, a1 + 6);
      v30 = v45;
      v28 = v7;
      v29 = a1[5];
      dispatch_group_notify(v18, v24, block);

      objc_destroyWeak(&v31);
      _Block_object_dispose(v45, 8);

      v12 = 0;
    }
    goto LABEL_13;
  }
  v15 = (void (**)(id, void *))a1[5];
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v12);
LABEL_13:

  }
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_2_196(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(WeakRetained, "clientQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_197;
      v15[3] = &unk_1E89B3478;
      v15[4] = WeakRetained;
      objc_copyWeak(&v17, (id *)(a1 + 40));
      v16 = *(id *)(a1 + 32);
      objc_msgSend(v5, "listPairingsWithCompletionQueue:completionHandler:", v6, v15);

      objc_destroyWeak(&v17);
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = WeakRetained;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to list pairings without a reachable accessory server", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v14);

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v7 + 16))(v7, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v8);

  }
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_199(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to list pairings from accessory, %@, with error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  char v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id obj;
  void *v73;
  void *v74;
  void *v75;
  id WeakRetained;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    v58 = *(_QWORD *)(a1 + 40);
    v59 = (void *)MEMORY[0x1E0CB35C8];
    v60 = -1;
LABEL_36:
    objc_msgSend(v59, "hmErrorWithCode:", v60);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v58 + 16))(v58, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v65);

    goto LABEL_37;
  }
  v68 = a1;
  if (!v77)
  {
    v61 = (void *)MEMORY[0x1D17BA0A0]();
    v62 = WeakRetained;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v64;
      _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_ERROR, "%{public}@Cannot manage users if accessory is not long associated with a home", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v61);
    v58 = *(_QWORD *)(v68 + 40);
    v59 = (void *)MEMORY[0x1E0CB35C8];
    v60 = 12;
    goto LABEL_36;
  }
  v66 = v6;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v77, "users");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v67 = v5;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
  if (!v10)
    goto LABEL_31;
  v11 = v10;
  v12 = *(_QWORD *)v79;
  v70 = *(_QWORD *)v79;
  do
  {
    v13 = 0;
    v71 = v11;
    do
    {
      if (*(_QWORD *)v79 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v13);
      objc_msgSend(v77, "userWithPairingIdentity:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = WeakRetained;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v75 = v16;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "publicKey");
        v74 = v15;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "data");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "permissions");
        HMFBooleanToString();
        v24 = v13;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v83 = v19;
        v84 = 2112;
        v85 = v20;
        v86 = 2112;
        v87 = v21;
        v88 = 2112;
        v89 = v23;
        v90 = 2112;
        v91 = v25;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Found user %@ for pairing Identifier = %@, PublicKey = %@, Admin = %@", buf, 0x34u);

        v15 = v74;
        v13 = v24;

        v12 = v70;
        v16 = v75;

        v11 = v71;
      }

      objc_autoreleasePoolPop(v16);
      if (!v15)
      {
        v42 = (void *)MEMORY[0x1D17BA0A0]();
        v43 = v17;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v46 = v13;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v83 = v45;
          v84 = 2112;
          v85 = v47;
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@Unknown user, pairing must be remove %@", buf, 0x16u);

          v13 = v46;
          v15 = 0;
        }

        goto LABEL_28;
      }
      if (objc_msgSend(v15, "isOwner"))
      {
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v17;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = v15;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v31 = v13;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v83 = v30;
          v84 = 2112;
          v85 = v32;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Found owner pairing %@", buf, 0x16u);

          v13 = v31;
          v15 = v29;
        }

        objc_autoreleasePoolPop(v26);
        objc_msgSend(v69, "removeObject:", v15);
        if ((objc_msgSend(v14, "permissions") & 1) == 0)
        {
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = v27;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = v14;
            v38 = v15;
            v39 = (void *)v36;
            objc_msgSend(v37, "identifier");
            v40 = v13;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v83 = v39;
            v84 = 2112;
            v85 = v41;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Owners pairing with admin bit is not set %@", buf, 0x16u);

            v13 = v40;
            v15 = v38;
          }

          objc_autoreleasePoolPop(v33);
        }
      }
      else
      {
        v48 = objc_msgSend(v14, "permissions");
        v42 = (void *)MEMORY[0x1D17BA0A0]();
        v43 = v17;
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = os_log_type_enabled(v49, OS_LOG_TYPE_INFO);
        if ((v48 & 1) != 0)
        {
          if (v50)
          {
            HMFGetLogIdentifier();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v55 = v14;
            v56 = v15;
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v83 = v54;
            v84 = 2112;
            v85 = v57;
            _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_INFO, "%{public}@Must remove user pairing with admin bit is set %@", buf, 0x16u);

            v15 = v56;
            v14 = v55;

          }
LABEL_28:

          objc_autoreleasePoolPop(v42);
          objc_msgSend(v73, "addObject:", v14);
          goto LABEL_29;
        }
        if (v50)
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v52 = v15;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v83 = v51;
          v84 = 2112;
          v85 = v53;
          _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_INFO, "%{public}@User pairing %@", buf, 0x16u);

          v15 = v52;
        }

        objc_autoreleasePoolPop(v42);
        objc_msgSend(v69, "removeObject:", v15);
      }
LABEL_29:

      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
  }
  while (v11);
LABEL_31:

  (*(void (**)(void))(*(_QWORD *)(v68 + 40) + 16))();
  v6 = v66;
  v5 = v67;
LABEL_37:

}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_193(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(v3, "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          objc_msgSend(WeakRetained, "clientQueue", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "removePairing:completionQueue:completionHandler:", v11, v12, *(_QWORD *)(a1 + 48));

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_12;
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);
LABEL_12:

  }
}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138544130;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove pairings, %@, from accessory, %@, with error: %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __78__HMDUserManagementOperation__auditPairingsForHAPAccessory_completionHandler___block_invoke_194(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "setAuditUsersToBeAdded:", *(_QWORD *)(a1 + 32));
    WeakRetained = v6;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = WeakRetained;
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v4 && (objc_msgSend(v4, "isHMError") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Remove pairing failed."), 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v5;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    WeakRetained = v7;
  }

}

void __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = v3;
    v4 = v3;
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isHMError") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Remove pairing failed."), 0, 0, v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = v7;
  }

}

void __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke_190(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "server");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentUser");

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "clientQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removePairingForCurrentControllerOnQueue:completion:", v6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v5, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairingIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removePairing:completionQueue:completionHandler:", v7, v8, *(_QWORD *)(a1 + 40));

  }
}

void __79__HMDUserManagementOperation__removePairingFromHAPAccessory_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138544386;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unable to remove pairing, %@, from accessory, %@, with error: %@", (uint8_t *)&v11, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = v3;
    v4 = v3;
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isHMError") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Add pairing failed."), 0, 0, v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = v7;
  }

}

void __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOwner");

  v7 = objc_alloc(MEMORY[0x1E0D165A8]);
  objc_msgSend(*(id *)(a1 + 32), "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pairingIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publicKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v7, "initWithIdentifier:publicKey:privateKey:permissions:", v10, v13, 0, v6);

  objc_msgSend(v4, "server");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addPairing:completionQueue:completionHandler:", v16, v15, *(_QWORD *)(a1 + 40));

}

void __74__HMDUserManagementOperation__addPairingToHAPAccessory_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138544386;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unable to add pairing, %@, to accessory, %@, with error: %@", (uint8_t *)&v11, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void (**v25)(void *, id);
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD block[4];
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isFinished"))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v51 = v4;
      v52 = 2112;
      v53 = v5;
      v54 = 2112;
      v55 = v6;
      _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempt to execute already completed user operation: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    v7 = *(NSObject **)(a1 + 40);
    if (v7)
    {
      v8 = *(void **)(a1 + 48);
      if (v8)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_158;
        block[3] = &unk_1E89C0870;
        v49 = v8;
        dispatch_async(v7, block);
        v9 = v49;
LABEL_37:

        return;
      }
    }
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isValid") & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v51 = v19;
      v52 = 2112;
      v53 = v20;
      v54 = 2112;
      v55 = v21;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempt to execute invalid operation: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v22 = *(NSObject **)(a1 + 40);
    if (v22)
    {
      v23 = *(void **)(a1 + 48);
      if (v23)
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_162;
        v46[3] = &unk_1E89C0870;
        v47 = v23;
        dispatch_async(v22, v46);
        v9 = v47;
        goto LABEL_37;
      }
    }
    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isExpired"))
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_2;
    v40 = &unk_1E89C1558;
    v24 = *(void **)(a1 + 40);
    v41 = *(_QWORD *)(a1 + 32);
    v42 = v24;
    v43 = *(id *)(a1 + 48);
    v25 = (void (**)(void *, id))_Block_copy(&v37);
    objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 1, v37, v38, v39, v40, v41);
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "supportsUserManagement");

    if (!v27)
      goto LABEL_35;
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;

    v31 = *(void **)(a1 + 32);
    if (v30)
    {
      v32 = objc_msgSend(v31, "operationType");
      switch(v32)
      {
        case 3:
          objc_msgSend(*(id *)(a1 + 32), "_auditPairingsForHAPAccessory:completionHandler:", v30, v25);
          break;
        case 2:
          objc_msgSend(*(id *)(a1 + 32), "_removePairingFromHAPAccessory:completionHandler:", v30, v25);
          break;
        case 1:
          objc_msgSend(*(id *)(a1 + 32), "_addPairingToHAPAccessory:completionHandler:", v30, v25);
          break;
      }
      goto LABEL_36;
    }
    objc_msgSend(v31, "accessory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "conformsToProtocol:", &unk_1EFABB088) ? v33 : 0;
    v30 = v34;

    if (v30)
    {
      v35 = objc_msgSend(*(id *)(a1 + 32), "operationType");
      if (v35 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "user");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeUser:completionHandler:", v36, v25);
        goto LABEL_42;
      }
      if (v35 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "user");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addUser:completionHandler:", v36, v25);
LABEL_42:

      }
    }
    else
    {
LABEL_35:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v25[2](v25, v30);
    }
LABEL_36:

    v9 = v42;
    goto LABEL_37;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v51 = v12;
    v52 = 2112;
    v53 = v13;
    v54 = 2112;
    v55 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempt to execute expired operation: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v15 = *(NSObject **)(a1 + 40);
  if (v15)
  {
    v16 = *(void **)(a1 + 48);
    if (v16)
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_165;
      v44[3] = &unk_1E89C0870;
      v45 = v16;
      dispatch_async(v15, v44);
      v9 = v45;
      goto LABEL_37;
    }
  }
}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_158(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 58, CFSTR("Invalid user management operation, complete"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_162(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 27, CFSTR("Invalid user management operation"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_165(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 27, CFSTR("Invalid user management operation, expired"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "setState:", 1);
    v4 = *(void **)(a1 + 32);
    v5 = 0;
  }
  objc_msgSend(v4, "setLastOperationFailed:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_startBackoffTimer");
  objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
  v6 = *(NSObject **)(a1 + 40);
  if (v6)
  {
    v7 = *(void **)(a1 + 48);
    if (v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_3;
      v8[3] = &unk_1E89C1D68;
      v10 = v7;
      v9 = v3;
      dispatch_async(v6, v8);

    }
  }

}

uint64_t __75__HMDUserManagementOperation_executeWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __36__HMDUserManagementOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFinished");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  return result;
}

void __39__HMDUserManagementOperation_setState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userManagementOperationDidFinish:", *(_QWORD *)(a1 + 32));

}

void __39__HMDUserManagementOperation_setState___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "operationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operationCancelled:", *(_QWORD *)(a1 + 32));

}

+ (void)initialize
{
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B36BC8, CFSTR("userManagementOperationExpiryTime"));
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E8B36BD8, CFSTR("userManagementOperationAuditExpiryTime"));
}

+ (id)auditUserManagementOperationAccessory:(id)a3 model:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDUserManagementOperation *v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceForKey:", CFSTR("userManagementOperationAuditExpiryTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v9, "numberValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v10, "dateWithTimeIntervalSinceNow:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "expirationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v5, "expirationDate");
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
  }
  v15 = -[HMDUserManagementOperation initWithOperationType:identifier:user:accessory:expiration:]([HMDUserManagementOperation alloc], "initWithOperationType:identifier:user:accessory:expiration:", 3, v7, 0, v6, v12);

  return v15;
}

+ (id)addUserManagementOperationForUser:(id)a3 accessory:(id)a4 model:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HMDUserManagementOperation *v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferenceForKey:", CFSTR("userManagementOperationExpiryTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v12, "numberValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v13, "dateWithTimeIntervalSinceNow:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "expirationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "expirationDate");
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }
  }
  v18 = -[HMDUserManagementOperation initWithOperationType:identifier:user:accessory:expiration:]([HMDUserManagementOperation alloc], "initWithOperationType:identifier:user:accessory:expiration:", 1, v10, v9, v8, v15);

  return v18;
}

+ (id)removeUserManagementOperationForUser:(id)a3 accessory:(id)a4 model:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HMDUserManagementOperation *v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferenceForKey:", CFSTR("userManagementOperationExpiryTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v12, "numberValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v13, "dateWithTimeIntervalSinceNow:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "expirationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "expirationDate");
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }
  }
  v18 = -[HMDUserManagementOperation initWithOperationType:identifier:user:accessory:expiration:]([HMDUserManagementOperation alloc], "initWithOperationType:identifier:user:accessory:expiration:", 2, v10, v9, v8, v15);

  return v18;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)operationWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
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
  HMDUserManagementOperation *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HM.operationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "integerValue");
    if (v7)
    {
LABEL_3:
      objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("HM.user"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userWithUUID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("accessory"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accessoryWithUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v6, "hmf_dateForKey:", CFSTR("HM.expiry"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "preferenceForKey:", CFSTR("userManagementOperationExpiryTime"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v33, "numberValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            objc_msgSend(v17, "dateWithTimeIntervalSinceNow:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v19 = -[HMDUserManagementOperation initWithOperationType:identifier:user:accessory:expiration:]([HMDUserManagementOperation alloc], "initWithOperationType:identifier:user:accessory:expiration:", v10, 0, v12, v14, v15);
          -[HMDUserManagementOperation setDelegate:](v19, "setDelegate:", v7);

        }
        else
        {
          v28 = (void *)MEMORY[0x1D17BA0A0]();
          v29 = a1;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v34 = v28;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v36 = v31;
            v37 = 2112;
            v38 = v11;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user management operation from dictionary because accessory cannot be found, %@", buf, 0x16u);

            v28 = v34;
          }

          objc_autoreleasePoolPop(v28);
          v19 = 0;
        }

      }
      else
      {
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = a1;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v27;
          v37 = 2112;
          v38 = v11;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user management operation from dictionary because user cannot be found, %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        v19 = 0;
      }

      goto LABEL_20;
    }
  }
  else
  {
    v10 = 1;
    if (v7)
      goto LABEL_3;
  }
  v20 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = a1;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v23;
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user management operation from dictionary because home is not given", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v20);
  v19 = 0;
LABEL_20:

  return v19;
}

@end
