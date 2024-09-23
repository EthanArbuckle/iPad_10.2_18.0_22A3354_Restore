@implementation HMZone

- (HMZone)init
{

  return 0;
}

- (HMZone)initWithName:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  HMZone *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSUUID *uuid;
  uint64_t v13;
  HMMutableArray *currentRooms;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMZone;
  v8 = -[HMZone init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v11;

    +[HMMutableArray array](HMMutableArray, "array");
    v13 = objc_claimAutoreleasedReturnValue();
    currentRooms = v8->_currentRooms;
    v8->_currentRooms = (HMMutableArray *)v13;

  }
  return v8;
}

- (void)_unconfigureContext
{
  void *v3;
  _HMContext *context;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  HMZone *v5;
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
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring zone", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMZone setHome:](v5, "setHome:", 0);
    -[HMZone _unconfigureContext](v5, "_unconfigureContext");
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

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[HMZone setHome:](self, "setHome:", a4);
  v6 = v7;
  if (v7)
  {
    -[HMZone setContext:](self, "setContext:", v7);
    v6 = v7;
  }

}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)rooms
{
  void *v2;
  void *v3;

  -[HMZone currentRooms](self, "currentRooms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
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
  NSUUID *v4;
  NSUUID *uuid;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v6);
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMHome)home
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMHome *)WeakRetained;
}

- (void)setHome:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_recomputeAssistantIdentifier
{
  NSString *v3;
  NSString *assistantIdentifier;

  hm_assistantIdentifierWithSalts(CFSTR("ZN"), (uint64_t)self->_uuid, 0);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

}

- (NSString)assistantIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *assistantIdentifier;
  NSString *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    -[HMZone _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
    assistantIdentifier = self->_assistantIdentifier;
  }
  v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)recomputeAssistantIdentifier
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMZone _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
  os_unfair_lock_unlock(p_lock);
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMZone *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSString *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = name;
  v7 = completion;
  -[HMZone context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMZone updateName:completionHandler:]", CFSTR("completion"));
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
    block[2] = __39__HMZone_updateName_completionHandler___block_invoke;
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
      v28 = "-[HMZone updateName:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  HMZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMZone *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  HMZone *v33;
  id v34;
  const __CFString *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMZone context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = objc_msgSend(v6, "length");
      if (HMMaxLengthForNaming__hmf_once_t5 != -1)
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
      if (v10 <= HMMaxLengthForNaming__hmf_once_v6)
      {
        -[HMZone home](self, "home");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(v9, "delegateCaller");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "callCompletion:error:", v7, v28);

          goto LABEL_16;
        }
        -[HMZone name](self, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", v6);

        if (!v27)
        {
          -[HMZone uuid](self, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = CFSTR("kZoneName");
          v36 = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __40__HMZone__updateName_completionHandler___block_invoke;
          v31[3] = &unk_1E3AB60C8;
          v32 = v9;
          v33 = self;
          v34 = v7;
          -[_HMContext sendMessage:target:payload:responseHandler:](v32, CFSTR("kRenameZoneRequestKey"), v29, v30, v31);

          goto LABEL_17;
        }
        objc_msgSend(v9, "delegateCaller");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v23;
        v24 = v7;
        v25 = 0;
LABEL_15:
        objc_msgSend(v23, "callCompletion:error:", v24, v25);
LABEL_16:

        goto LABEL_17;
      }
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v14;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v9, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = 46;
    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = 20;
    }
    objc_msgSend(v16, "hmErrorWithCode:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v15;
    v24 = v7;
    v25 = v22;
    goto LABEL_15;
  }
  v18 = (void *)MEMORY[0x1A1AC1AAC]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v21;
    v39 = 2080;
    v40 = "-[HMZone _updateName:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
LABEL_17:

  }
}

- (void)addRoom:(HMRoom *)room completionHandler:(void *)completion
{
  HMRoom *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMZone *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  HMRoom *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = room;
  v7 = completion;
  -[HMZone context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMZone addRoom:completionHandler:]", CFSTR("completion"));
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
    block[2] = __36__HMZone_addRoom_completionHandler___block_invoke;
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
      v28 = "-[HMZone addRoom:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_addRoom:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMZone *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  HMZone *v38;
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMZone context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      objc_msgSend(v6, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[HMZone home](self, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v6, "home");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if ((v15 & 1) != 0)
          {
            objc_msgSend(v6, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "roomForEntireHome");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v16, "isEqual:", v18);

            if (v19)
            {
              objc_msgSend(v9, "delegateCaller");
              v20 = (id)objc_claimAutoreleasedReturnValue();
              v21 = (void *)MEMORY[0x1E0CB35C8];
              v22 = 24;
            }
            else
            {
              -[HMZone currentRooms](self, "currentRooms");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "containsObject:", v6);

              if (!v31)
              {
                objc_msgSend(v6, "uuid");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMZone uuid](self, "uuid");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = CFSTR("kRoomUUID");
                objc_msgSend(v32, "UUIDString");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = v34;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36[0] = MEMORY[0x1E0C809B0];
                v36[1] = 3221225472;
                v36[2] = __37__HMZone__addRoom_completionHandler___block_invoke;
                v36[3] = &unk_1E3AB4B08;
                v37 = v9;
                v39 = v32;
                v40 = v7;
                v38 = self;
                v20 = v32;
                -[_HMContext sendMessage:target:payload:responseHandler:](v37, CFSTR("kAddRoomRequestKey"), v33, v35, v36);

                goto LABEL_18;
              }
              objc_msgSend(v9, "delegateCaller");
              v20 = (id)objc_claimAutoreleasedReturnValue();
              v21 = (void *)MEMORY[0x1E0CB35C8];
              v22 = 1;
            }
          }
          else
          {
            objc_msgSend(v9, "delegateCaller");
            v20 = (id)objc_claimAutoreleasedReturnValue();
            v21 = (void *)MEMORY[0x1E0CB35C8];
            v22 = 11;
          }
        }
        else
        {
          objc_msgSend(v9, "delegateCaller");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = 12;
        }
        objc_msgSend(v21, "hmErrorWithCode:", v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "callCompletion:error:", v7, v29);

LABEL_18:
        goto LABEL_19;
      }
      objc_msgSend(v9, "delegateCaller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = 21;
    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = 20;
    }
    objc_msgSend(v27, "hmErrorWithCode:", v28);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v7, v20);
    goto LABEL_18;
  }
  v23 = (void *)MEMORY[0x1A1AC1AAC]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v26;
    v45 = 2080;
    v46 = "-[HMZone _addRoom:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v23);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
LABEL_19:

  }
}

- (void)removeRoom:(HMRoom *)room completionHandler:(void *)completion
{
  HMRoom *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMZone *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  HMRoom *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = room;
  v7 = completion;
  -[HMZone context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMZone removeRoom:completionHandler:]", CFSTR("completion"));
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
    block[2] = __39__HMZone_removeRoom_completionHandler___block_invoke;
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
      v28 = "-[HMZone removeRoom:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_removeRoom:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMZone *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  HMZone *v28;
  id v29;
  id v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMZone context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      -[HMZone home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v9, "messageDispatcher");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[HMZone currentRooms](self, "currentRooms");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v6);

          if ((v13 & 1) != 0)
          {
            objc_msgSend(v6, "uuid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMZone uuid](self, "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = CFSTR("kRoomUUID");
            objc_msgSend(v14, "UUIDString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __40__HMZone__removeRoom_completionHandler___block_invoke;
            v26[3] = &unk_1E3AB4B08;
            v27 = v9;
            v29 = v14;
            v30 = v7;
            v28 = self;
            v18 = v14;
            -[_HMContext sendMessage:target:payload:responseHandler:](v27, CFSTR("kRemoveRoomRequestKey"), v15, v17, v26);

LABEL_16:
            goto LABEL_17;
          }
          objc_msgSend(v9, "delegateCaller");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = 2;
        }
        else
        {
          objc_msgSend(v9, "delegateCaller");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = 21;
        }
      }
      else
      {
        objc_msgSend(v9, "delegateCaller");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v24 = 12;
      }
      objc_msgSend(v23, "hmErrorWithCode:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:error:", v7, v25);

      goto LABEL_16;
    }
    objc_msgSend(v8, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v7, v18);
    goto LABEL_16;
  }
  v19 = (void *)MEMORY[0x1A1AC1AAC]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v22;
    v35 = 2080;
    v36 = "-[HMZone _removeRoom:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
LABEL_17:

  }
}

- (id)roomWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMZone currentRooms](self, "currentRooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstItemWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeRoom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMZone currentRooms](self, "currentRooms");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (HMZone)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMZone *v8;
  void *v9;
  HMMutableArray *currentRooms;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  v8 = -[HMZone initWithName:uuid:](self, "initWithName:uuid:", v5, v7);
  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_home, v9);

    currentRooms = v8->_currentRooms;
    objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), CFSTR("rooms"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMutableArray setArray:](currentRooms, "setArray:", v11);

  }
  return v8;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMObjectMergeCollection *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HMObjectMergeCollection *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *name;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _QWORD block[5];
  id v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = [HMObjectMergeCollection alloc];
    -[HMZone currentRooms](self, "currentRooms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentRooms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v7, "initWithCurrentObjects:newObjects:", v9, v11);

    -[HMObjectMergeCollection removedObjects](v12, "removedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __29__HMZone_mergeFromNewObject___block_invoke;
    v38[3] = &unk_1E3AB38A8;
    v38[4] = self;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v38);

    -[HMZone home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rooms");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMObjectMergeCollection replaceAddedObjectsWithObjects:](v12, "replaceAddedObjectsWithObjects:", v16);

    -[HMObjectMergeCollection addedObjects](v12, "addedObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v14;
    v37[1] = 3221225472;
    v37[2] = __29__HMZone_mergeFromNewObject___block_invoke_17;
    v37[3] = &unk_1E3AB38A8;
    v37[4] = self;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v37);

    -[HMObjectMergeCollection finalObjects](v12, "finalObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMZone currentRooms](self, "currentRooms");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setArray:", v18);

    -[HMObjectMergeCollection removedObjects](v12, "removedObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v14;
    v36[1] = 3221225472;
    v36[2] = __29__HMZone_mergeFromNewObject___block_invoke_18;
    v36[3] = &unk_1E3AB38A8;
    v36[4] = self;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v36);

    -[HMObjectMergeCollection addedObjects](v12, "addedObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v14;
    v35[1] = 3221225472;
    v35[2] = __29__HMZone_mergeFromNewObject___block_invoke_21;
    v35[3] = &unk_1E3AB38A8;
    v35[4] = self;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v35);

    v22 = -[HMObjectMergeCollection isModified](v12, "isModified");
    -[HMZone name](self, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v23, "isEqualToString:", v24);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v6, "name");
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v25;

      -[HMZone home](self, "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMZone context](self, "context");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "queue");
        v30 = objc_claimAutoreleasedReturnValue();
        block[0] = v14;
        block[1] = 3221225472;
        block[2] = __29__HMZone_mergeFromNewObject___block_invoke_28;
        block[3] = &unk_1E3AB5CD0;
        block[4] = self;
        v33 = v28;
        v34 = v27;
        dispatch_async(v30, block);

      }
      v22 = 1;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HMMutableArray)currentRooms
{
  return self->_currentRooms;
}

- (void)setCurrentRooms:(id)a3
{
  objc_storeStrong((id *)&self->_currentRooms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRooms, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __29__HMZone_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed room via zone merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __29__HMZone_mergeFromNewObject___block_invoke_17(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added room via zone merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __29__HMZone_mergeFromNewObject___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__HMZone_mergeFromNewObject___block_invoke_2;
    v8[3] = &unk_1E3AB59E8;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v3;
    v10 = v5;
    v11 = v4;
    dispatch_async(v7, v8);

  }
}

void __29__HMZone_mergeFromNewObject___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__HMZone_mergeFromNewObject___block_invoke_2_24;
    v8[3] = &unk_1E3AB59E8;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v3;
    v10 = v5;
    v11 = v4;
    dispatch_async(v7, v8);

  }
}

void __29__HMZone_mergeFromNewObject___block_invoke_28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HMZone_mergeFromNewObject___block_invoke_2_29;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __29__HMZone_mergeFromNewObject___block_invoke_2_29(uint64_t a1)
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
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateNameForZone:%@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "home:didUpdateNameForZone:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __29__HMZone_mergeFromNewObject___block_invoke_2_24(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HMZone_mergeFromNewObject___block_invoke_3_25;
  v5[3] = &unk_1E3AB59E8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __29__HMZone_mergeFromNewObject___block_invoke_3_25(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddRoom:toZone: with room: %@, zone: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "home:didAddRoom:toZone:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __29__HMZone_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HMZone_mergeFromNewObject___block_invoke_3;
  v5[3] = &unk_1E3AB59E8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __29__HMZone_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveRoom:fromZone: with room: %@, zone: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "home:didRemoveRoom:fromZone:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __40__HMZone__removeRoom_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callCompletion:error:", *(_QWORD *)(a1 + 56), v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "roomWithUUID:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "currentRooms");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v3);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 56), 0);

  }
}

uint64_t __39__HMZone_removeRoom_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeRoom:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __37__HMZone__addRoom_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callCompletion:error:", *(_QWORD *)(a1 + 56), v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "roomWithUUID:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "currentRooms");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectIfNotPresent:", v3);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 56), 0);

  }
}

uint64_t __36__HMZone_addRoom_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRoom:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__HMZone__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = v10;
  }
  else
  {
    objc_msgSend(a3, "hmf_stringForKey:", CFSTR("kZoneName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setName:", v9);

    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 0;
  }
  objc_msgSend(v5, "callCompletion:error:", v7, v8);

}

uint64_t __39__HMZone_updateName_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateName:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
