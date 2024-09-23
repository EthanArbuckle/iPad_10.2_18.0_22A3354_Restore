@implementation HMSymptomsHandler

- (HMSymptomsHandler)initWithAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMSymptomsHandler *v12;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "symptomsHandlerUUIDFromAccessoryUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMSymptomsHandler initWithUUID:context:logIdentifier:](self, "initWithUUID:context:logIdentifier:", v7, v11, v10);
  return v12;
}

- (HMSymptomsHandler)initWithUUID:(id)a3 context:(id)a4 logIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMSymptomsHandler *v11;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  NSString *logIdentifier;
  uint64_t v16;
  HMMutableArray *currentSymptoms;
  uint64_t v18;
  NSHashTable *fixSessions;
  id fixSessionFactory;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMSymptomsHandler;
  v11 = -[HMSymptomsHandler init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_context, a4);
    v14 = objc_msgSend(v10, "copy");
    logIdentifier = v11->_logIdentifier;
    v11->_logIdentifier = (NSString *)v14;

    +[HMMutableArray array](HMMutableArray, "array");
    v16 = objc_claimAutoreleasedReturnValue();
    currentSymptoms = v11->_currentSymptoms;
    v11->_currentSymptoms = (HMMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    fixSessions = v11->_fixSessions;
    v11->_fixSessions = (NSHashTable *)v18;

    fixSessionFactory = v11->_fixSessionFactory;
    v11->_fixSessionFactory = &__block_literal_global_21911;

  }
  return v11;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
    -[HMSymptomsHandler _unsubscribe](self, "_unsubscribe");
  v4.receiver = self;
  v4.super_class = (Class)HMSymptomsHandler;
  -[HMSymptomsHandler dealloc](&v4, sel_dealloc);
}

- (NSSet)symptoms
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HMSymptomsHandler currentSymptoms](self, "currentSymptoms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (HMSymptomsHandlerDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMSymptomsHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id WeakRetained;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  objc_storeWeak((id *)&self->_delegate, v5);
  os_unfair_lock_unlock(p_lock);
  if (!v5 || WeakRetained)
  {
    if (!v5)
    {
      if (WeakRetained)
        -[HMSymptomsHandler _unsubscribe](self, "_unsubscribe");
    }
  }
  else
  {
    -[HMSymptomsHandler _subscribe](self, "_subscribe");
  }
}

- (NSUUID)sfDeviceIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_sfDeviceIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSFDeviceIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *sfDeviceIdentifier;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  sfDeviceIdentifier = self->_sfDeviceIdentifier;
  self->_sfDeviceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)newFixSessionForSymptom:(id)a3
{
  id v4;
  void *v5;
  HMSymptomsHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  HMSymptomsHandler *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v8;
    v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Asked to create a new fix session for symptom %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMSymptomsHandler symptoms](v6, "symptoms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v4);

  if (!v10)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSymptomsHandler symptoms](v14, "symptoms");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v23;
      v31 = 2112;
      v32 = v4;
      v33 = 2112;
      v34 = v24;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Not creating fix session for symptom %@ because it isn't one of this symptoms handler's current symptoms: %@", (uint8_t *)&v29, 0x20u);

LABEL_23:
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  v11 = objc_msgSend(v4, "type");
  if (v11 > 0x15)
  {
LABEL_19:
    if (v11 - 999 >= 2)
    {
LABEL_25:
      v22 = 0;
      goto LABEL_26;
    }
LABEL_20:
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v4;
      v25 = "%{public}@Not creating fix session for unfixable symptom %@";
      v26 = v16;
      v27 = OS_LOG_TYPE_INFO;
      goto LABEL_22;
    }
LABEL_24:

    objc_autoreleasePoolPop(v13);
    goto LABEL_25;
  }
  if (((1 << v11) & 0x1F6FFE) == 0)
  {
    if (((1 << v11) & 0x209000) != 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  -[HMSymptomsHandler sfDeviceIdentifier](v6, "sfDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = v6;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v4;
      v25 = "%{public}@Not creating fix session for symptom %@ because our SF device identifier is nil";
      v26 = v16;
      v27 = OS_LOG_TYPE_DEBUG;
LABEL_22:
      _os_log_impl(&dword_19B1B0000, v26, v27, v25, (uint8_t *)&v29, 0x16u);
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSymptomsHandler sfDeviceIdentifier](v14, "sfDeviceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v17;
    v31 = 2112;
    v32 = v4;
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Creating fix session for symptom %@ with SF device identifier %@", (uint8_t *)&v29, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMSymptomsHandler fixSessionFactory](v14, "fixSessionFactory");
  v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HMSymptomsHandler sfDeviceIdentifier](v14, "sfDeviceIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSymptomsHandler context](v14, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *, void *))v19)[2](v19, v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "type") == 11 || objc_msgSend(v4, "type") == 19)
    objc_msgSend(v22, "setDeviceRepairFlags:", 1);
  if (v22)
    -[HMSymptomsHandler _addFixSession:](v14, "_addFixSession:", v22);
LABEL_26:

  return v22;
}

- (void)initiateFixWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMSymptomsHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMSymptomsHandler *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSymptomsHandler context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSymptomsHandler initiateFixWithCompletionHandler:]", CFSTR("completion"));
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
      v23 = v17;
      v24 = 2112;
      v25 = (const char *)v13;
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
    block[2] = __54__HMSymptomsHandler_initiateFixWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v21 = v4;
    v20 = v6;
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
      v23 = v11;
      v24 = 2080;
      v25 = "-[HMSymptomsHandler initiateFixWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)configure
{
  void *v3;
  id v4;

  -[HMSymptomsHandler context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("HMSM.symptomStateUpdated"), self, sel__handleSymptomStateUpdatedMessage_);

}

- (void)_subscribe
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMSymptomsHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMSymptomsHandler uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMSM.subscribe"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Subscribing to symptoms changes with message: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMSymptomsHandler context](v8, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v6);

}

- (void)_unsubscribe
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMSymptomsHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMSymptomsHandler uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMSM.unsubscribe"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Unsubscribing from symptoms changes with message: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMSymptomsHandler context](v8, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v6);

}

- (void)_addFixSession:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMSymptomsHandler fixSessions](self, "fixSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (id)_findAndRemoveFixSessionsForSymptom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  os_unfair_lock_t lock;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMSymptomsHandler fixSessions](self, "fixSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "symptom");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          objc_msgSend(v5, "addObject:", v11);
          -[HMSymptomsHandler fixSessions](self, "fixSessions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:", v11);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  os_unfair_lock_unlock(lock);

  return v15;
}

- (void)_callSymptomsUpdatedDelegate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  HMSymptomsHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSymptomsHandler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated symptoms %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMSymptomsHandler context](v8, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__HMSymptomsHandler__callSymptomsUpdatedDelegate___block_invoke;
    v13[3] = &unk_1E3AB5ED8;
    v13[4] = v8;
    v14 = v4;
    objc_msgSend(v12, "invokeBlock:", v13);

  }
}

- (void)_callFixSessionAvailabilityUpdatedDelegate
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[HMSymptomsHandler delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HMSymptomsHandler context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__HMSymptomsHandler__callFixSessionAvailabilityUpdatedDelegate__block_invoke;
    v7[3] = &unk_1E3AB5E18;
    v7[4] = self;
    objc_msgSend(v6, "invokeBlock:", v7);

  }
}

- (void)_handleSymptomStateUpdatedMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMSymptomsHandler *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  HMSymptomsHandler *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMSymptomsHandler *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _QWORD v57[5];

  v57[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMSM.symptoms"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMSymptomsHandler symptoms](self, "symptoms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToSet:", v6);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v37 = self;
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSymptomsHandler symptoms](v10, "symptoms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v50 = v12;
      v51 = 2112;
      v52 = v13;
      v53 = 2112;
      v54 = v14;
      v55 = 2112;
      v56 = v6;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@ message so updating symptoms from %@ to %@", buf, 0x2Au);

    }
    v38 = v4;

    objc_autoreleasePoolPop(v9);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[HMSymptomsHandler symptoms](v10, "symptoms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v20, v37) & 1) == 0)
          {
            -[HMSymptomsHandler _findAndRemoveFixSessionsForSymptom:](v10, "_findAndRemoveFixSessionsForSymptom:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v40;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v40 != v24)
                    objc_enumerationMutation(v21);
                  objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "noteSymptomDisappeared");
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
              }
              while (v23);
            }

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v17);
    }

    -[HMSymptomsHandler currentSymptoms](v10, "currentSymptoms");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setArray:", v27);

    -[HMSymptomsHandler _callSymptomsUpdatedDelegate:](v10, "_callSymptomsUpdatedDelegate:", v6);
    self = v37;
    v4 = v38;
  }
  objc_msgSend(v4, "uuidForKey:", CFSTR("HMSM.sfDeviceIdentifier"), v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSymptomsHandler sfDeviceIdentifier](self, "sfDeviceIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = HMFEqualObjects();

  if ((v30 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x1A1AC1AAC]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSymptomsHandler sfDeviceIdentifier](v32, "sfDeviceIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v50 = v34;
      v51 = 2112;
      v52 = v35;
      v53 = 2112;
      v54 = v36;
      v55 = 2112;
      v56 = v28;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Received %@ message so updating SFDevice identifier from %@ to %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v31);
    -[HMSymptomsHandler setSFDeviceIdentifier:](v32, "setSFDeviceIdentifier:", v28);
    -[HMSymptomsHandler _callFixSessionAvailabilityUpdatedDelegate](v32, "_callFixSessionAvailabilityUpdatedDelegate");
  }
  objc_msgSend(v4, "respondWithSuccess");

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMSymptomsHandler context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (HMMutableArray)currentSymptoms
{
  return (HMMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSHashTable)fixSessions
{
  return self->_fixSessions;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (id)fixSessionFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setFixSessionFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fixSessionFactory, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_fixSessions, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_currentSymptoms, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sfDeviceIdentifier, 0);
}

void __63__HMSymptomsHandler__callFixSessionAvailabilityUpdatedDelegate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fixSessionAvailabilityDidUpdateForSymptomsHandler:", *(_QWORD *)(a1 + 32));

}

void __50__HMSymptomsHandler__callSymptomsUpdatedDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symptomsHandler:didUpdateSymptoms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__HMSymptomsHandler_initiateFixWithCompletionHandler___block_invoke(id *a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0D285F8]);
  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(a1[4], "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);
  v6 = (void *)objc_msgSend(v2, "initWithName:destination:payload:", CFSTR("HMSM.initiateFix"), v5, 0);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HMSymptomsHandler_initiateFixWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E3AB3A50;
  v9 = a1[6];
  objc_msgSend(v6, "setResponseHandler:", v8);
  objc_msgSend(a1[5], "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:", v6);

}

uint64_t __54__HMSymptomsHandler_initiateFixWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

HMSymptomFixSession *__56__HMSymptomsHandler_initWithUUID_context_logIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  HMSymptomFixSession *v9;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = -[HMSymptomFixSession initWithSymptom:deviceIdentifier:context:]([HMSymptomFixSession alloc], "initWithSymptom:deviceIdentifier:context:", v8, v7, v6);

  return v9;
}

+ (id)symptomsHandlerUUIDFromAccessoryUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("DA8F18EC-6C7D-4631-9B5B-615977C21A44"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18 != -1)
    dispatch_once(&logCategory__hmf_once_t18, &__block_literal_global_42);
  return (id)logCategory__hmf_once_v19;
}

void __32__HMSymptomsHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19;
  logCategory__hmf_once_v19 = v0;

}

@end
