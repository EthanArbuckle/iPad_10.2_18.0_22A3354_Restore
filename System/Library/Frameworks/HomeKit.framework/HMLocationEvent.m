@implementation HMLocationEvent

- (HMLocationEvent)initWithDict:(id)a3 region:(id)a4
{
  id v6;
  HMLocationEvent *v7;
  HMLocationEvent *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMLocationEvent;
  v7 = -[HMEvent initWithDict:](&v10, sel_initWithDict_, a3);
  v8 = v7;
  if (v7)
    _initLocationEventWithRegion(v7, v6);

  return v8;
}

- (HMLocationEvent)initWithRegion:(CLRegion *)region
{
  CLRegion *v4;
  void *v5;
  void *v6;
  HMLocationEvent *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = region;
  if ((HMIsValidRegion(v4) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v12);
  }
  v13 = CFSTR("kEventUUIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMLocationEvent initWithDict:region:](self, "initWithDict:region:", v6, v4);

  return v7;
}

- (void)_unconfigure
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMLocationEvent;
  -[HMEvent _unconfigure](&v3, sel__unconfigure);
  -[HMFLocationAuthorization unregisterObserver:](self->_authorization, "unregisterObserver:", self);
}

- (void)__configureWithContext:(id)a3 eventTrigger:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMLocationEvent *v11;
  HMFLocationAuthorization *v12;
  HMFLocationAuthorization *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMLocationEvent;
  -[HMEvent __configureWithContext:eventTrigger:](&v18, sel___configureWithContext_eventTrigger_, a3, v6);
  if (a3)
  {
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationAuthorization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = self;
      v12 = v10;
      v13 = v11->_authorization;
      if (v13 != v12)
      {
        objc_storeStrong((id *)&v11->_authorization, v10);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *MEMORY[0x1E0D27FF8];
        objc_msgSend(v14, "addObserver:selector:name:object:", v11, sel__handleLocationAuthorizationUpdatedNotification_, *MEMORY[0x1E0D27FF8], v12);

        -[HMFLocationAuthorization registerObserver:](v12, "registerObserver:", v11);
        if (v13)
        {
          -[HMFLocationAuthorization unregisterObserver:](v13, "unregisterObserver:", v11);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObserver:name:object:", v11, v15, v13);

        }
      }

    }
    else
    {
      v12 = self->_authorization;
    }
    if ((-[HMFLocationAuthorization isAuthorized](v12, "isAuthorized") & 1) == 0)
    {
      -[HMLocationEvent setLocationAuthorization:](self, "setLocationAuthorization:", 2);
      -[HMLocationEvent setRegion:](self, "setRegion:", 0);
      objc_msgSend(v6, "lastFireDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        objc_msgSend(v6, "setLastFireDate:", 0);
    }

  }
}

- (CLRegion)region
{
  os_unfair_lock_s *p_lock;
  CLRegion *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_region;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRegion:(id)a3
{
  CLRegion *v4;
  CLRegion *region;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_locationAuthorization == 2)
    v4 = 0;
  else
    v4 = (CLRegion *)v6;
  region = self->_region;
  self->_region = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)updateRegion:(CLRegion *)region completionHandler:(void *)completion
{
  CLRegion *v6;
  void (**v7)(void *, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMLocationEvent *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMLocationEvent *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMLocationEvent *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  const __CFString *v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = region;
  v7 = completion;
  -[HMEvent context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMLocationEvent updateRegion:completionHandler:]", CFSTR("completion"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1A1AC1AAC]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v34;
      v44 = 2112;
      v45 = (const char *)v30;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v30, 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }
  v9 = (void *)v8;
  if (v8)
  {
    if ((HMIsValidRegion(v6) & 1) == 0)
    {
      v36 = (void *)MEMORY[0x1E0C99DA0];
      v37 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "exceptionWithName:reason:userInfo:", v37, v38, 0);
      v39 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v39);
    }
    -[HMEvent eventTrigger](self, "eventTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10 || (objc_msgSend(v10, "home"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
    {
      objc_msgSend(v9, "delegateCaller");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "callCompletion:error:", v7, v20);

LABEL_11:
      goto LABEL_19;
    }
    -[HMLocationEvent region](self, "region");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v6);

    if (v14)
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
        v43 = v18;
        v44 = 2112;
        v45 = (const char *)v6;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Region is already %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v9, "delegateCaller");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "callCompletion:error:", v7, 0);
      goto LABEL_11;
    }
    encodeRootObject(v6);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
    {
      v40 = CFSTR("kLocationEventRegionKey");
      v41 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMEvent _updateEventWithPayload:completionHandler:](self, "_updateEventWithPayload:completionHandler:", v27, v7);

    }
    else
    {
      objc_msgSend(v9, "delegateCaller");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "callCompletion:error:", v7, v29);

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v24;
      v44 = 2080;
      v45 = "-[HMLocationEvent updateRegion:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
  }
LABEL_19:

}

- (void)_retrieveLocationEvent
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMLocationEvent *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMEvent context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D285F8]);
    v5 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMEvent uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);
    v8 = (void *)objc_msgSend(v4, "initWithName:destination:payload:", CFSTR("kRetrieveLocationEventRequestKey"), v7, 0);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__HMLocationEvent__retrieveLocationEvent__block_invoke;
    v14[3] = &unk_1E3AB4808;
    v14[4] = self;
    objc_msgSend(v8, "setResponseHandler:", v14);
    objc_msgSend(v3, "messageDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendMessage:", v8);

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
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2080;
      v18 = "-[HMLocationEvent _retrieveLocationEvent]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMLocationEvent;
  -[HMEvent _serializeForAdd](&v9, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMLocationEvent region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("kLocationEventRegionKey"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (void)_updateFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMLocationEvent *v9;
  NSObject *v10;
  void *v11;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMLocationEvent;
  -[HMEvent _updateFromDictionary:](&v13, sel__updateFromDictionary_, v4);
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("kLocationEventRegionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
    {
      -[HMLocationEvent setRegion:](self, "setRegion:", v6);
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
        v15 = v11;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region from encoded data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

- (void)_handleLocationAuthorizationUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  void *v11;
  HMLocationEvent *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  char v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMEvent context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = objc_msgSend(v8, "isAuthorized");
    objc_msgSend(v5, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__HMLocationEvent__handleLocationAuthorizationUpdatedNotification___block_invoke;
    v15[3] = &unk_1E3AB15A8;
    v16 = v9;
    v15[4] = self;
    dispatch_async(v10, v15);

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
      v18 = v14;
      v19 = 2080;
      v20 = "-[HMLocationEvent _handleLocationAuthorizationUpdatedNotification:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (HMLocationEvent)initWithCoder:(id)a3
{
  id v4;
  HMLocationEvent *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMLocationEvent;
  v5 = -[HMEvent initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.locationEventRegion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _initLocationEventWithRegion(v5, v6);

  }
  return v5;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMLocationEvent;
  LOBYTE(v5) = -[HMEvent mergeFromNewObject:](&v15, sel_mergeFromNewObject_, v4);
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMLocationEvent region](self, "region");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "region");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "region");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMLocationEvent setRegion:](self, "setRegion:", v12);

      -[HMLocationEvent region](self, "region");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = HMFEqualObjects() ^ 1;

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMLocationEvent *v4;
  void *v5;
  HMLocationEvent *v6;

  v4 = [HMLocationEvent alloc];
  -[HMLocationEvent region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMLocationEvent initWithRegion:](v4, "initWithRegion:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableLocationEvent *v4;
  void *v5;
  HMMutableLocationEvent *v6;

  v4 = [HMMutableLocationEvent alloc];
  -[HMLocationEvent region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMLocationEvent initWithRegion:](v4, "initWithRegion:", v5);

  return v6;
}

- (HMFLocationAuthorization)authorization
{
  return (HMFLocationAuthorization *)objc_getProperty(self, a2, 64, 1);
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

void __67__HMLocationEvent__handleLocationAuthorizationUpdatedNotification___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1;
  else
    v3 = 2;
  if (objc_msgSend(*(id *)(a1 + 32), "locationAuthorization") != v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLocationAuthorization:", v3);
    v4 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v4, "_retrieveLocationEvent");
    }
    else
    {
      objc_msgSend(v4, "setRegion:", 0);
      objc_msgSend(*(id *)(a1 + 32), "eventTrigger");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLastFireDate:", 0);

    }
  }
}

void __41__HMLocationEvent__retrieveLocationEvent__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "hm_regionFromDataForKey:", CFSTR("kLocationEventRegionKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRegion:", v8);
  objc_msgSend(*(id *)(a1 + 32), "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_dateForKey:", CFSTR("kTriggerLastFireDateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLastFireDate:", v6);
  objc_msgSend(v5, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_notifyDelegateOfTriggerUpdated:", v5);

}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4;
  void *v5;
  HMLocationEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "hm_regionFromDataForKey:", CFSTR("kLocationEventRegionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMLocationEvent initWithDict:region:]([HMLocationEvent alloc], "initWithDict:region:", v4, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
