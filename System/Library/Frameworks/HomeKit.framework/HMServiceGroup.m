@implementation HMServiceGroup

- (HMServiceGroup)init
{

  return 0;
}

- (HMServiceGroup)initWithName:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  HMServiceGroup *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSUUID *uuid;
  uint64_t v13;
  HMMutableArray *currentServices;
  HMApplicationData *v15;
  HMApplicationData *applicationData;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMServiceGroup;
  v8 = -[HMServiceGroup init](&v18, sel_init);
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
    currentServices = v8->_currentServices;
    v8->_currentServices = (HMMutableArray *)v13;

    v15 = objc_alloc_init(HMApplicationData);
    applicationData = v8->_applicationData;
    v8->_applicationData = v15;

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
  HMServiceGroup *v5;
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
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring serviceGroup", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMServiceGroup setHome:](v5, "setHome:", 0);
    -[HMServiceGroup _unconfigureContext](v5, "_unconfigureContext");
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
  id v6;
  id v7;
  void *v8;
  HMServiceGroup *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMServiceGroup setHome:](v9, "setHome:", v7);
  if (v6)
    -[HMServiceGroup setContext:](v9, "setContext:", v6);

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

- (NSArray)services
{
  void *v2;
  void *v3;

  -[HMServiceGroup currentServices](self, "currentServices");
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

- (HMApplicationData)applicationData
{
  os_unfair_lock_s *p_lock;
  HMApplicationData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setApplicationData:(id)a3
{
  HMApplicationData *v4;
  HMApplicationData *applicationData;

  v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_recomputeAssistantIdentifier
{
  NSString *v3;
  NSString *assistantIdentifier;

  hm_assistantIdentifierWithSalts(CFSTR("SG"), (uint64_t)self->_uuid, 0);
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
    -[HMServiceGroup _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
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
  -[HMServiceGroup _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
  os_unfair_lock_unlock(p_lock);
}

- (void)_removeServices:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  int v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  HMServiceGroup *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v3;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v52;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v52 != v29)
          objc_enumerationMutation(obj);
        v32 = v4;
        v5 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v4);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        -[HMServiceGroup services](self, "services");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v48;
          do
          {
            v9 = 0;
            v34 = v7;
            do
            {
              if (*(_QWORD *)v48 != v8)
                objc_enumerationMutation(v35);
              v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v9);
              objc_msgSend(v10, "accessory");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "uuid");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "accessory");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "uuid");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isEqual:", v14))
              {
                objc_msgSend(v10, "instanceID");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "instanceID");
                v16 = v8;
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v15, "isEqualToNumber:", v17);

                v8 = v16;
                v7 = v34;

                if (v36)
                  objc_msgSend(v33, "addObject:", v10);
              }
              else
              {

              }
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v7);
        }

        v4 = v32 + 1;
      }
      while (v32 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v30);
  }

  -[HMServiceGroup currentServices](self, "currentServices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectsInArray:", v33);

  -[HMServiceGroup home](self, "home");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v20 = v33;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMServiceGroup context](self, "context");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "delegateCaller");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __34__HMServiceGroup__removeServices___block_invoke;
          v38[3] = &unk_1E3AB59E8;
          v39 = v19;
          v40 = v37;
          v41 = v25;
          v42 = self;
          objc_msgSend(v27, "invokeBlock:", v38);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v22);
  }

}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMServiceGroup *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMServiceGroup *v18;
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
  -[HMServiceGroup context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMServiceGroup updateName:completionHandler:]", CFSTR("completion"));
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
    block[2] = __47__HMServiceGroup_updateName_completionHandler___block_invoke;
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
      v28 = "-[HMServiceGroup updateName:completionHandler:]";
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
  HMServiceGroup *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMServiceGroup *v19;
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
  HMServiceGroup *v33;
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
  -[HMServiceGroup context](self, "context");
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
        -[HMServiceGroup home](self, "home");
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
        -[HMServiceGroup name](self, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", v6);

        if (!v27)
        {
          -[HMServiceGroup uuid](self, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = CFSTR("kServiceGroupName");
          v36 = v6;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __48__HMServiceGroup__updateName_completionHandler___block_invoke;
          v31[3] = &unk_1E3AB60C8;
          v32 = v9;
          v33 = self;
          v34 = v7;
          -[_HMContext sendMessage:target:payload:responseHandler:](v32, CFSTR("kRenameServiceGroupRequestKey"), v29, v30, v31);

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
    v40 = "-[HMServiceGroup _updateName:completionHandler:]";
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

- (void)addService:(HMService *)service completionHandler:(void *)completion
{
  HMService *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMServiceGroup *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMServiceGroup *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  HMService *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = service;
  v7 = completion;
  -[HMServiceGroup context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMServiceGroup addService:completionHandler:]", CFSTR("completion"));
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
    block[2] = __47__HMServiceGroup_addService_completionHandler___block_invoke;
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
      v28 = "-[HMServiceGroup addService:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)removeService:(HMService *)service completionHandler:(void *)completion
{
  HMService *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMServiceGroup *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMServiceGroup *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  HMService *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = service;
  v7 = completion;
  -[HMServiceGroup context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMServiceGroup removeService:completionHandler:]", CFSTR("completion"));
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
    block[2] = __50__HMServiceGroup_removeService_completionHandler___block_invoke;
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
      v28 = "-[HMServiceGroup removeService:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_addOrRemove:(BOOL)a3 service:(id)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMServiceGroup *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  HMServiceGroup *v44;
  id v45;
  id v46;
  id v47;
  BOOL v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  const char *v54;
  uint64_t v55;

  v6 = a3;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HMServiceGroup context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(v10, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "callCompletion:error:", v9, v13);
LABEL_26:

      goto LABEL_27;
    }
    -[HMServiceGroup home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "home");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v13 && v14)
      {
        objc_msgSend(v12, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v15;
        objc_msgSend(v15, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if ((v18 & 1) != 0)
        {
          -[HMServiceGroup currentServices](self, "currentServices");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", v8);

          if (v20 && v6)
          {
            objc_msgSend(v11, "delegateCaller");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)MEMORY[0x1E0CB35C8];
            v23 = 1;
          }
          else
          {
            if (((v20 | v6) & 1) != 0)
            {
              objc_msgSend(v13, "uuid");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v30;
              objc_msgSend(v8, "instanceID");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = CFSTR("kRemoveServiceRequestKey");
              if (v6)
                v32 = CFSTR("kAddServiceRequestKey");
              v40 = (__CFString *)v32;
              -[HMServiceGroup uuid](self, "uuid");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v49[0] = CFSTR("kAccessoryUUID");
              objc_msgSend(v30, "UUIDString");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v49[1] = CFSTR("kServiceInstanceID");
              v50[0] = v38;
              v50[1] = v31;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v42[0] = MEMORY[0x1E0C809B0];
              v42[1] = 3221225472;
              v42[2] = __57__HMServiceGroup__addOrRemove_service_completionHandler___block_invoke;
              v42[3] = &unk_1E3AB0A18;
              v43 = v11;
              v44 = self;
              v45 = v36;
              v46 = v31;
              v47 = v9;
              v48 = v6;
              v37 = v31;
              v34 = v36;
              -[_HMContext sendMessage:target:payload:responseHandler:](v43, v40, v39, v33, v42);

              goto LABEL_24;
            }
            objc_msgSend(v11, "delegateCaller");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)MEMORY[0x1E0CB35C8];
            v23 = 2;
          }
        }
        else
        {
          objc_msgSend(v11, "delegateCaller");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v23 = 11;
        }
        objc_msgSend(v22, "hmErrorWithCode:", v23);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "callCompletion:error:", v9, v35);

LABEL_24:
        v15 = v41;
        goto LABEL_25;
      }
      objc_msgSend(v11, "delegateCaller");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "callCompletion:error:", v9, v29);

    }
    else
    {
      objc_msgSend(v11, "delegateCaller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "callCompletion:error:", v9, v15);
    }
LABEL_25:

    goto LABEL_26;
  }
  v24 = (void *)MEMORY[0x1A1AC1AAC]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v27;
    v53 = 2080;
    v54 = "-[HMServiceGroup _addOrRemove:service:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
LABEL_27:

  }
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMServiceGroup *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMServiceGroup updateApplicationData:completionHandler:]", CFSTR("completion"));
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
      v21 = v17;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v7 = v6;
  -[HMServiceGroup home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "updateApplicationData:forServiceGroup:completionHandler:", v19, self, v7);
  }
  else
  {
    -[HMServiceGroup context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v7, v12);

  }
}

- (HMServiceGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMServiceGroup *v8;
  void *v9;
  HMMutableArray *currentServices;
  void *v11;
  HMApplicationData *v12;
  HMApplicationData *applicationData;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceGroupName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceGroupUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  v8 = -[HMServiceGroup initWithName:uuid:](self, "initWithName:uuid:", v5, v7);
  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_home, v9);

    currentServices = v8->_currentServices;
    objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), CFSTR("serviceGroupServices"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMutableArray setArray:](currentServices, "setArray:", v11);

    v12 = -[HMApplicationData initWithDictionaryFromCoder:key:]([HMApplicationData alloc], "initWithDictionaryFromCoder:key:", v4, CFSTR("HM.appData"));
    applicationData = v8->_applicationData;
    v8->_applicationData = v12;

  }
  return v8;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMServiceGroup uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMObjectMergeCollection *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  id v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  id v41;
  _QWORD v42[6];

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMServiceGroup currentServices](self, "currentServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v7, v9);

  -[HMObjectMergeCollection removedObjects](v10, "removedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke;
  v42[3] = &unk_1E3AB2D68;
  v42[4] = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v42);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMObjectMergeCollection addedObjects](v10, "addedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v12;
  v40[1] = 3221225472;
  v40[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_40;
  v40[3] = &unk_1E3AB0A60;
  v40[4] = self;
  v15 = v13;
  v41 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v40);

  -[HMObjectMergeCollection replaceAddedObjectsWithObjects:](v10, "replaceAddedObjectsWithObjects:", v15);
  -[HMObjectMergeCollection finalObjects](v10, "finalObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMServiceGroup currentServices](self, "currentServices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setArray:", v16);

  -[HMObjectMergeCollection removedObjects](v10, "removedObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v12;
  v39[1] = 3221225472;
  v39[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_41;
  v39[3] = &unk_1E3AB2D68;
  v39[4] = self;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v39);

  -[HMObjectMergeCollection addedObjects](v10, "addedObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v12;
  v38[1] = 3221225472;
  v38[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_42;
  v38[3] = &unk_1E3AB2D68;
  v38[4] = self;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v38);

  -[HMServiceGroup name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if ((v22 & 1) == 0)
  {
    objc_msgSend(v4, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMServiceGroup setName:](self, "setName:", v23);

    -[HMServiceGroup home](self, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMServiceGroup context](self, "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "queue");
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_49;
      block[3] = &unk_1E3AB5CD0;
      block[4] = self;
      v36 = v25;
      v37 = v24;
      dispatch_async(v27, block);

    }
  }
  -[HMServiceGroup applicationData](self, "applicationData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = HMFEqualObjects();

  if ((v30 & 1) != 0)
  {
    v31 = v22 ^ 1;
  }
  else
  {
    objc_msgSend(v4, "applicationData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMServiceGroup setApplicationData:](self, "setApplicationData:", v32);

    -[HMServiceGroup home](self, "home");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "notifyDelegateOfAppDataUpdateForServiceGroup:", self);

    v31 = 1;
  }

  return v31;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HMMutableArray)currentServices
{
  return self->_currentServices;
}

- (void)setCurrentServices:(id)a3
{
  objc_storeStrong((id *)&self->_currentServices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentServices, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed service via service group merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "instanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_findService:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v14;
        v25 = 2112;
        v26 = v3;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Added service via service group merge: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "instanceID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v21;
        v25 = 2112;
        v26 = v22;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find service with instance ID : %@ on accessory : %@", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v18;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the accessory with UUID : %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_41(uint64_t a1, void *a2)
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
    v8[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_2;
    v8[3] = &unk_1E3AB59E8;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v3;
    v10 = v5;
    v11 = v4;
    dispatch_async(v7, v8);

  }
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_42(uint64_t a1, void *a2)
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
    v8[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_2_45;
    v8[3] = &unk_1E3AB59E8;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v3;
    v10 = v5;
    v11 = v4;
    dispatch_async(v7, v8);

  }
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_49(uint64_t a1)
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
  v5[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_2_50;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __37__HMServiceGroup_mergeFromNewObject___block_invoke_2_50(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
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
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateNameForServiceGroup : %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "home:didUpdateNameForServiceGroup:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_2_45(uint64_t a1)
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
  v5[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_3_46;
  v5[3] = &unk_1E3AB59E8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __37__HMServiceGroup_mergeFromNewObject___block_invoke_3_46(uint64_t a1)
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
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didAddService with service: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "home:didAddService:toServiceGroup:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __37__HMServiceGroup_mergeFromNewObject___block_invoke_2(uint64_t a1)
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
  v5[2] = __37__HMServiceGroup_mergeFromNewObject___block_invoke_3;
  v5[3] = &unk_1E3AB59E8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __37__HMServiceGroup_mergeFromNewObject___block_invoke_3(uint64_t a1)
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
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didRemoveService with service: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "home:didRemoveService:fromServiceGroup:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __57__HMServiceGroup__addOrRemove_service_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callCompletion:error:", *(_QWORD *)(a1 + 64), v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryWithUUID:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_findService:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v6 = *(unsigned __int8 *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "currentServices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
        objc_msgSend(v7, "addObjectIfNotPresent:", v3);
      else
        objc_msgSend(v7, "removeObject:", v3);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callCompletion:error:", *(_QWORD *)(a1 + 64), 0);

  }
}

uint64_t __50__HMServiceGroup_removeService_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addOrRemove:service:completionHandler:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __47__HMServiceGroup_addService_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addOrRemove:service:completionHandler:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __48__HMServiceGroup__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(a3, "hmf_stringForKey:", CFSTR("kServiceGroupName"));
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

uint64_t __47__HMServiceGroup_updateName_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateName:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __34__HMServiceGroup__removeServices___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didRemoveService:fromServiceGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22_22735 != -1)
    dispatch_once(&logCategory__hmf_once_t22_22735, &__block_literal_global_22736);
  return (id)logCategory__hmf_once_v23_22737;
}

void __29__HMServiceGroup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23_22737;
  logCategory__hmf_once_v23_22737 = v0;

}

@end
