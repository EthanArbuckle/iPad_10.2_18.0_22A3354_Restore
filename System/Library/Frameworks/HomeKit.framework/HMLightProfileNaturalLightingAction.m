@implementation HMLightProfileNaturalLightingAction

- (HMLightProfileNaturalLightingAction)init
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMLightProfileNaturalLightingAction)initWithUUID:(id)a3
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

- (HMLightProfileNaturalLightingAction)initWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4
{
  return (HMLightProfileNaturalLightingAction *)-[HMLightProfileNaturalLightingAction initWithLightProfile:naturalLightingEnabled:uuid:](self, a3, a4, 0);
}

- (HMLightProfileNaturalLightingAction)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMLightProfileNaturalLightingAction *v8;
  void *v9;
  uint64_t v10;
  HMLightProfile *lightProfile;
  HMLightProfileNaturalLightingAction *v12;
  void *v13;
  HMLightProfileNaturalLightingAction *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  HMLightProfileNaturalLightingAction *v21;
  uint64_t v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMLightProfileNaturalLightingAction;
  v8 = -[HMAction initWithDictionary:home:](&v24, sel_initWithDictionary_home_, v6, v7);
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("hmlp.uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      v18 = "%{public}@Unable to decode %@, missing light profile id";
      v19 = v15;
      v20 = 22;
LABEL_10:
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);

    }
LABEL_11:

    objc_autoreleasePoolPop(v13);
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "lightProfileWithProfileUUID:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  lightProfile = v8->_lightProfile;
  v8->_lightProfile = (HMLightProfile *)v10;

  if (!v8->_lightProfile)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v26 = v16;
      v27 = 2112;
      v28 = v22;
      v29 = 2112;
      v30 = v9;
      v18 = "%{public}@Unable to decode %@, failed to resolve light profile %@";
      v19 = v15;
      v20 = 32;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v8->_naturalLightingEnabled = objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("hmlp.nle"));

LABEL_5:
  v12 = v8;
LABEL_12:

  return v12;
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMLightProfileNaturalLightingAction;
  -[HMAction _serializeForAdd](&v11, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("hmlp.nle"));

  -[HMLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("hmlp.uuid"));

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

- (BOOL)_handleUpdates:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("hmlp.nle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    os_unfair_lock_lock_with_options();
    self->_naturalLightingEnabled = objc_msgSend(v5, "BOOLValue");
    os_unfair_lock_unlock(&self->_lock);
  }

  return 1;
}

- (unint64_t)type
{
  return 3;
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMLightProfile *v10;
  HMLightProfile *lightProfile;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMLightProfileNaturalLightingAction;
  -[HMAction __configureWithContext:actionSet:](&v12, sel___configureWithContext_actionSet_, v6, v7);
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMAccessoryProfile profileUniqueIdentifier](self->_lightProfile, "profileUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lightProfileWithProfileUUID:", v9);
  v10 = (HMLightProfile *)objc_claimAutoreleasedReturnValue();
  lightProfile = self->_lightProfile;
  self->_lightProfile = v10;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)encodeAsProtoBuf
{
  void *v3;
  HMPBNaturalLightingAction *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMPBActionContainer *v9;
  void *v10;
  HMLightProfileNaturalLightingAction *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  HMLightProfileNaturalLightingAction *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(HMPBNaturalLightingAction);
    -[HMAction uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hm_convertToData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMPBNaturalLightingAction setUuid:](v4, "setUuid:", v6);

    objc_msgSend(v3, "profileUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hm_convertToData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMPBNaturalLightingAction setLightProfileUUID:](v4, "setLightProfileUUID:", v8);

    -[HMPBNaturalLightingAction setNaturalLightingEnabled:](v4, "setNaturalLightingEnabled:", -[HMLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled"));
    v9 = objc_alloc_init(HMPBActionContainer);
    -[HMPBActionContainer setType:](v9, "setType:", 3);
    -[HMPBActionContainer setNaturalLightingAction:](v9, "setNaturalLightingAction:", v4);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed encode action as protobuf, light profile is invalid %@:%@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  int naturalLightingEnabled;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "isNaturalLightingEnabled");
    os_unfair_lock_lock_with_options();
    naturalLightingEnabled = self->_naturalLightingEnabled;
    v10 = naturalLightingEnabled != v8;
    if (naturalLightingEnabled != v8)
      self->_naturalLightingEnabled = v8;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMLightProfileNaturalLightingAction)initWithCoder:(id)a3
{
  id v4;
  HMLightProfileNaturalLightingAction *v5;
  uint64_t v6;
  void *v7;
  HMLightProfile *v8;
  HMLightProfile *lightProfile;
  HMLightProfileNaturalLightingAction *v10;
  void *v11;
  HMLightProfileNaturalLightingAction *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMLightProfileNaturalLightingAction;
  v5 = -[HMAction initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hmlp.lp"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[HMLightProfile initWithLightProfile:]([HMLightProfile alloc], "initWithLightProfile:", v6);
    lightProfile = v5->_lightProfile;
    v5->_lightProfile = v8;

    v5->_naturalLightingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hmlp.nle"));
LABEL_4:
    v10 = v5;
    goto LABEL_8;
  }
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = v5;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing light profile", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMLightProfileNaturalLightingAction *v4;
  HMLightProfileNaturalLightingAction *v5;
  HMLightProfileNaturalLightingAction *v6;
  HMLightProfileNaturalLightingAction *v7;
  _BOOL4 v8;
  char v9;
  void *v10;
  void *v11;

  v4 = (HMLightProfileNaturalLightingAction *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6
      && (v8 = -[HMLightProfileNaturalLightingAction isNaturalLightingEnabled](v6, "isNaturalLightingEnabled"),
          v8 == -[HMLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled")))
    {
      -[HMLightProfileNaturalLightingAction lightProfile](v7, "lightProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMLightProfileNaturalLightingAction lightProfile](self, "lightProfile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  _BYTE *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMLightProfileNaturalLightingAction initWithLightProfile:naturalLightingEnabled:uuid:]([HMLightProfileNaturalLightingAction alloc], self->_lightProfile, self->_naturalLightingEnabled, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)updateNaturalLightingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMLightProfileNaturalLightingAction *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMLightProfileNaturalLightingAction *v22;
  NSObject *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  -[HMAction context](self, "context");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMLightProfileNaturalLightingAction updateNaturalLightingEnabled:completionHandler:]", CFSTR("completion"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      v30 = 2112;
      v31 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v8 = (void *)v7;
  if (v7)
  {
    -[HMAction actionSet](self, "actionSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HMAction uuid](self, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v26 = CFSTR("hmlp.nle");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "_updateAction:changes:completionHandler:", self, v13, v6);
LABEL_12:

        goto LABEL_13;
      }
      os_unfair_lock_lock_with_options();
      self->_naturalLightingEnabled = v4;
      os_unfair_lock_unlock(&self->_lock);
      objc_msgSend(v8, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:error:", v6, 0);
    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:error:", v6, v19);

    }
    goto LABEL_12;
  }
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v17;
    v30 = 2080;
    v31 = "-[HMLightProfileNaturalLightingAction updateNaturalLightingEnabled:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);
LABEL_13:

}

- (BOOL)isNaturalLightingEnabled
{
  HMLightProfileNaturalLightingAction *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_naturalLightingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMLightProfile)lightProfile
{
  os_unfair_lock_s *p_lock;
  HMLightProfile *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lightProfile;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightProfile, 0);
}

- (_BYTE)initWithLightProfile:(char)a3 naturalLightingEnabled:(void *)a4 uuid:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _BYTE *v13;
  _BYTE *v14;
  objc_super v16;

  v8 = a2;
  v9 = a4;
  if (!a1)
    goto LABEL_8;
  objc_msgSend(v8, "profileUniqueIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _HMFPreconditionFailure();
LABEL_8:
    v14 = 0;
    goto LABEL_6;
  }
  v11 = (void *)v10;
  v16.receiver = a1;
  v16.super_class = (Class)HMLightProfileNaturalLightingAction;
  v12 = objc_msgSendSuper2(&v16, sel_initWithUUID_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)v12 + 7, a2);
    v13[52] = a3;
  }
  v14 = v13;

LABEL_6:
  return v14;
}

+ (id)actionWithProtoBuf:(id)a3 home:(id)a4
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
  _BYTE *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_UUIDWithBytesAsData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v5, "lightProfileUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_UUIDWithBytesAsData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "lightProfileWithProfileUUID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = -[HMLightProfileNaturalLightingAction initWithLightProfile:naturalLightingEnabled:uuid:]([HMLightProfileNaturalLightingAction alloc], v13, objc_msgSend(v5, "naturalLightingEnabled"), v9);
      }
      else
      {
        v21 = (void *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543874;
          v26 = v23;
          v27 = 2112;
          v28 = v5;
          v29 = 2112;
          v30 = v12;
          _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create natural lighting action from protobuf, light profile with UUID does not exist %@:%@", (uint8_t *)&v25, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
        v14 = 0;
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = v20;
        v27 = 2112;
        v28 = v5;
        v29 = 2112;
        v30 = 0;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create natural lighting action from protobuf, invalid light profile uuid %@:%@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v14 = 0;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v17;
      v27 = 2112;
      v28 = v5;
      v29 = 2112;
      v30 = 0;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create natural lighting action from protobuf, invalid uuid %@:%@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
