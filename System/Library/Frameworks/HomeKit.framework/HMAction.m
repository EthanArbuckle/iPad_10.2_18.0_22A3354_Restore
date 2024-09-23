@implementation HMAction

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    return 0;
  else
    return 1073741789 * -[HMAction type](self, "type") + 1073741789;
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  _HMContext *v6;
  id v7;
  _HMContext *context;

  v6 = (_HMContext *)a3;
  v7 = a4;
  os_unfair_lock_lock_with_options();
  context = self->_context;
  self->_context = v6;

  objc_storeWeak((id *)&self->_actionSet, v7);
  os_unfair_lock_unlock(&self->_lock);
}

- (HMAction)initWithCoder:(id)a3
{
  id v4;
  HMAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUUID *uuid;
  HMAction *v13;
  void *v14;
  HMAction *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMAction *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMAction;
  v5 = -[HMAction init](&v25, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  if (!v7)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = v5;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing uuid", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    goto LABEL_12;
  }
  v8 = (void *)v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionActionSet"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = v5;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing action set", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);

LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  v10 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v11;

  objc_storeWeak((id *)&v5->_actionSet, v10);
LABEL_5:
  v13 = v5;
LABEL_13:

  return v13;
}

- (HMAction)initWithUUID:(id)a3
{
  id v4;
  HMAction *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMAction;
  v5 = -[HMAction init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v6;
    }
    else
    {
      HMTransientIdentifier();
      v8 = objc_claimAutoreleasedReturnValue();
      uuid = v5->_uniqueIdentifier;
      v5->_uniqueIdentifier = (NSUUID *)v8;
    }

  }
  return v5;
}

- (HMAction)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  HMAction *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  HMAction *v20;
  void *v22;
  NSUUID *v23;
  NSUUID *uuid;
  void *v25;
  HMAction *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kActionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = objc_opt_class();
      v17 = "%{public}@Unable to decode %@, missing action type";
      v18 = v15;
      v19 = 22;
LABEL_12:
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v29, v19);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v10 = (objc_class *)HMClassForActionType(objc_msgSend(v8, "unsignedIntegerValue"));
  if (!v10)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v16;
      v31 = 2112;
      v32 = objc_opt_class();
      v33 = 2112;
      v34 = v9;
      v17 = "%{public}@Unable to decode %@, invalid action type: %@";
      goto LABEL_11;
    }
LABEL_13:

    objc_autoreleasePoolPop(v13);
    v20 = 0;
    goto LABEL_14;
  }
  v11 = v10;
  v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    v20 = (HMAction *)objc_msgSend([v11 alloc], "initWithDictionary:home:", v6, v7);
    goto LABEL_14;
  }
  if ((objc_class *)v12 != v11)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v16;
      v31 = 2112;
      v32 = objc_opt_class();
      v33 = 2112;
      v34 = v9;
      v17 = "%{public}@Unable to decode %@, wrong action type: %@";
LABEL_11:
      v18 = v15;
      v19 = 32;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kActionUUID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v22);
    v23 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    uuid = self->_uuid;
    self->_uuid = v23;

    v20 = self;
  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v28;
      v31 = 2112;
      v32 = objc_opt_class();
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing uuid", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v20 = 0;
  }

LABEL_14:
  return v20;
}

- (void)_unconfigure
{
  os_unfair_lock_s *p_lock;
  _HMContext *context;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  context = self->_context;
  self->_context = 0;

  objc_storeWeak((id *)&self->_actionSet, 0);
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)type
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

- (NSUUID)uuid
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_uuid;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUuid:(id)a3
{
  os_unfair_lock_s *v3;
  NSUUID *v5;
  NSUUID *uuid;
  NSUUID *uniqueIdentifier;
  _Unwind_Exception *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    v8 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v8);
  }
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v9);
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v5;

  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isValid
{
  return -[HMAction isValidWithError:](self, "isValidWithError:", 0);
}

- (BOOL)isValidWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = v5;
  if (a3 && v4 == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4 != v6;
}

- (BOOL)isAffectedByEndEvents
{
  return 0;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (id)_serializeForAdd
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("kActionType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAction type](self, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_handleUpdates:(id)a3
{
  return 0;
}

- (id)encodeAsProtoBuf
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  if (a3 == self)
    return 1;
  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  HMAction *v6;
  void *v7;
  HMAction *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v12 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  v6 = [HMAction alloc];
  -[HMAction uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMAction initWithUUID:](v6, "initWithUUID:", v7);

  return v8;
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

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

- (HMAction)init
{
  return -[HMAction initWithUUID:](self, "initWithUUID:", 0);
}

- (_HMContext)context
{
  return self->_context;
}

- (HMActionSet)actionSet
{
  return (HMActionSet *)objc_loadWeakRetained((id *)&self->_actionSet);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionSet);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (HMAction)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HMAction;
  return (HMAction *)objc_msgSendSuper2(&v3, "new");
}

@end
