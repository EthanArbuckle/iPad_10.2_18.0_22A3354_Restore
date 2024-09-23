@implementation HMDPresenceEvent

- (HMDPresenceEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMDFeaturesDataSource *v8;
  HMDPresenceEvent *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDFeaturesDataSource);
  v9 = -[HMDPresenceEvent initWithModel:home:featuresDataSource:](self, "initWithModel:home:featuresDataSource:", v7, v6, v8);

  return v9;
}

- (HMDPresenceEvent)initWithModel:(id)a3 home:(id)a4 featuresDataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDPresenceEvent *v11;
  HMDPresenceEvent *v12;
  uint64_t v13;
  NSString *presenceType;
  void *v15;
  void *v16;
  uint64_t v17;
  HMPresenceEventActivation *activation;
  uint64_t v19;
  NSArray *userUUIDs;
  uint64_t v21;
  NSDictionary *users;
  void *v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HMDPresenceEvent;
  v11 = -[HMDEvent initWithModel:home:](&v25, sel_initWithModel_home_, v8, v9);
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v8, "presenceType");
    v13 = objc_claimAutoreleasedReturnValue();
    presenceType = v12->_presenceType;
    v12->_presenceType = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0CBA788];
    objc_msgSend(v8, "activation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activationGranularityWithNumber:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    activation = v12->_activation;
    v12->_activation = (HMPresenceEventActivation *)v17;

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    userUUIDs = v12->_userUUIDs;
    v12->_userUUIDs = (NSArray *)v19;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    users = v12->_users;
    v12->_users = (NSDictionary *)v21;

    objc_storeStrong((id *)&v12->_featuresDataSource, a5);
    os_unfair_lock_lock_with_options();
    objc_msgSend(v8, "users");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPresenceEvent _updateUsers:home:](v12, "_updateUsers:home:", v23, v9);

    os_unfair_lock_unlock(&v12->_lock);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDPresenceEvent;
  -[HMDPresenceEvent dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDPresenceEvent presenceType](self, "presenceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEvent users](self, "users");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("type: %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_msgSend(v6, "appendString:", CFSTR(", "));
        objc_msgSend(v6, "appendString:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)HMDPresenceEvent;
  -[HMDEvent description](&v17, sel_description);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEvent activation](self, "activation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("[Presence-Event: %@, %@, %@]"), v13, v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDPresenceEvent;
  -[HMDEvent configure:messageDispatcher:queue:delegate:](&v16, sel_configure_messageDispatcher_queue_delegate_, v10, v11, v12, v13);
  objc_msgSend(v10, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMDPresenceEvent userUUIDs](self, "userUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEvent _updateUsers:home:](self, "_updateUsers:home:", v15, v14);

  os_unfair_lock_unlock(&self->_lock);
}

- (id)createPresenceEventPayload:(BOOL)a3
{
  if (a3)
    -[HMDPresenceEvent createDaemonPayload](self, "createDaemonPayload");
  else
    -[HMDPresenceEvent createClientPayload](self, "createClientPayload");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createDaemonPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v11.receiver = self;
  v11.super_class = (Class)HMDPresenceEvent;
  -[HMDEvent createPayload](&v11, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  -[HMDPresenceEvent presenceType](self, "presenceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kPresenceEventPresence"));

  -[HMDPresenceEvent userUUIDs](self, "userUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kPresenceEventUsers"));

  os_unfair_lock_unlock(&self->_lock);
  -[HMDPresenceEvent activation](self, "activation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addToPayload:", v5);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

- (id)createClientPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v11.receiver = self;
  v11.super_class = (Class)HMDPresenceEvent;
  -[HMDEvent createPayload](&v11, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  -[HMDPresenceEvent _presenceTypeForClient](self, "_presenceTypeForClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kPresenceEventPresence"));
  -[HMDPresenceEvent userUUIDs](self, "userUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kPresenceEventUsers"));

  os_unfair_lock_unlock(&self->_lock);
  -[HMDPresenceEvent activation](self, "activation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addToPayload:", v5);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

- (id)emptyModelObject
{
  HMDPresenceEventModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDPresenceEventModel *v7;

  v3 = [HMDPresenceEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v3, "initWithObjectChangeType:uuid:parentUUID:", 2, v4, v6);

  return v7;
}

- (id)thisUser
{
  void *v2;
  void *v3;

  -[HMDEvent home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)activationGranularity
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HMDPresenceEvent activation](self, "activation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 2;
  -[HMDPresenceEvent activation](self, "activation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "value");

  return v5;
}

- (void)_registerForMessages
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDPresenceEvent;
  -[HMDEvent _registerForMessages](&v4, sel__registerForMessages);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleHomePresenceUpdate_, CFSTR("HMDHomePresenceUpdateNotification"), 0);

}

- (BOOL)isActive
{
  return (-[HMDEvent activationType](self, "activationType") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  HMDPresenceEvent *v10;
  NSObject *v11;
  void *v12;
  void (**v13)(void *, void *);
  void *v14;
  _QWORD v16[5];
  BOOL v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[HMDEvent isConfigured](self, "isConfigured"))
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDPresenceEvent;
    v7 = -[HMDEvent _activate:completionHandler:](&v18, sel__activate_completionHandler_, a3, v6);
    -[HMDEvent workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__HMDPresenceEvent__activate_completionHandler___block_invoke;
    v16[3] = &unk_1E89C2758;
    v16[4] = self;
    v17 = v7;
    dispatch_async(v8, v16);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to activate since event hasn't been configured", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = (void (**)(void *, void *))_Block_copy(v6);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v14);

    }
    v7 = 0;
  }

  return v7;
}

- (void)_handleHomePresenceUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDPresenceEvent *v9;

  v4 = a3;
  -[HMDEvent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HMDPresenceEvent__handleHomePresenceUpdate___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_evaluatePresenceEventForHomePresenceUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPresenceEvent *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDEventTriggerDevice *v13;
  void *v14;
  HMDEventTriggerDevice *v15;
  void *v16;
  HMDPresenceEvent *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  _BOOL8 v28;
  void *v29;
  HMDPresenceEvent *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDPresenceEvent *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  HMDEventTriggerDevice *v40;
  void *v41;
  HMDEventTriggerDevice *v42;
  HMDEventTriggerDevice *v43;
  void *v44;
  HMDPresenceEvent *v45;
  NSObject *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  HMDPresenceEvent *v50;
  NSObject *v51;
  void *v52;
  HMDEventTriggerDevice *v53;
  void *v54;
  HMDEventTriggerDevice *v55;
  void *v56;
  void *v57;
  HMDPresenceEvent *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  HMDPresenceEvent *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  HMDPresenceEvent *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  HMDPresenceEvent *v72;
  NSObject *v73;
  void *v74;
  HMDPresenceEvent *v75;
  void *v76;
  void *v77;
  HMDPresenceEvent *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  HMDEventTriggerDevice *v82;
  void *v83;
  HMDPresenceEvent *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  HMDEventTriggerDevice *v95;
  __int16 v96;
  HMDEventTriggerDevice *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDEvent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDEvent activationType](self, "activationType") > 1)
  {
    if (!v4
      || (objc_msgSend(v4, "homePresence"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11))
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v91 = v22;
        v92 = 2112;
        v93 = v4;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received home presence update is nil: %@", buf, 0x16u);

      }
      goto LABEL_4;
    }
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (HMDEventTriggerDevice *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "homePresence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "home");
    v15 = (HMDEventTriggerDevice *)objc_claimAutoreleasedReturnValue();

    if (v15 != v13)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "homePresence");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "home");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v91 = v19;
        v92 = 2112;
        v93 = v21;
        v94 = 2112;
        v95 = v13;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Received home presence update, homes are not matching: %@, ours: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      goto LABEL_67;
    }
    os_unfair_lock_lock_with_options();
    -[HMDPresenceEvent presenceType](self, "presenceType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPresenceEvent users](self, "users");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    if (-[HMDPresenceEvent activationGranularity](self, "activationGranularity") != 1)
      goto LABEL_23;
    if ((objc_msgSend(v4, "isUpdate") & 1) == 0)
    {
      v49 = (void *)MEMORY[0x1D17BA0A0]();
      v50 = self;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v52;
        _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_INFO, "%{public}@Home presence is not an update", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v49);
      goto LABEL_66;
    }
    objc_msgSend(v4, "userPresence");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CB9890]) & 1) == 0
        && (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CB98A8]) & 1) == 0
        && (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CB9898]) & 1) == 0
        && !objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CB98B0])
        || (objc_msgSend(v89, "allValues"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v24, "user"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v25, "containsObject:", v26),
            v26,
            v25,
            (v27 & 1) != 0))
      {

LABEL_23:
        v28 = -[HMDPresenceEvent evaluateWithHomePresenceUpdate:presenceType:](self, "evaluateWithHomePresenceUpdate:presenceType:", v4, v23);
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v91 = v32;
          v92 = 2112;
          v93 = v33;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Evaluated status: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        -[HMDEvent delegate](v30, "delegate");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPresenceEvent executionSession](v30, "executionSession");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = (void *)MEMORY[0x1D17BA0A0]();
          v36 = v30;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
          if (v28)
          {
            if (v38)
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v91 = v39;
              v92 = 2112;
              v93 = v34;
              _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Execution session %@ is already underway, no need to create another one", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v35);
            v40 = [HMDEventTriggerDevice alloc];
            objc_msgSend(v4, "causingDevice");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = -[HMDEventTriggerDevice initWithDevice:forHome:](v40, "initWithDevice:forHome:", v41, v13);

            objc_msgSend(v88, "didOccurEvent:causingDevice:", v36, v42);
            v43 = (HMDEventTriggerDevice *)objc_claimAutoreleasedReturnValue();
            v44 = (void *)MEMORY[0x1D17BA0A0]();
            v45 = v36;
            HMFGetOSLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = CFSTR("Added");
              *(_DWORD *)buf = 138544130;
              v91 = v47;
              if (!v43)
                v48 = CFSTR("Did not add");
              v92 = 2112;
              v93 = (id)v48;
              v94 = 2112;
              v95 = v43;
              v96 = 2112;
              v97 = v42;
              _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@%@ device to execution session %@, device %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v44);

          }
          else
          {
            if (v38)
            {
              HMFGetLogIdentifier();
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v91 = v65;
              v92 = 2112;
              v93 = v34;
              _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Evaluated status is changing to NO, resetting the execution session %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v35);
            objc_msgSend(v34, "cancelSessionIfWaitingForUserResponse");
            -[HMDPresenceEvent setExecutionSession:](v36, "setExecutionSession:", 0);
            -[HMDPresenceEvent setCurrentStatus:](v36, "setCurrentStatus:", 0);

          }
        }
        else if (v28 == -[HMDPresenceEvent currentStatus](v30, "currentStatus"))
        {
          v66 = (void *)MEMORY[0x1D17BA0A0]();
          v67 = v30;
          HMFGetOSLogHandle();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDPresenceEvent currentStatus](v67, "currentStatus");
            HMFBooleanToString();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v91 = v69;
            v92 = 2112;
            v93 = v70;
            _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Current status is not changing from %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v66);
        }
        else if ((objc_msgSend(v4, "isUpdate") & 1) != 0)
        {
          if (v28)
          {
            v53 = [HMDEventTriggerDevice alloc];
            objc_msgSend(v4, "causingDevice");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = -[HMDEventTriggerDevice initWithDevice:forHome:](v53, "initWithDevice:forHome:", v54, v13);

            objc_msgSend(v88, "didOccurEvent:causingDevice:", v30, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = (void *)MEMORY[0x1D17BA0A0](-[HMDPresenceEvent setExecutionSession:](v30, "setExecutionSession:", v56));
            v58 = v30;
            HMFGetOSLogHandle();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v91 = v60;
              v92 = 2112;
              v93 = v56;
              v94 = 2112;
              v95 = v55;
              _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_INFO, "%{public}@Created execution session %@ with triggerDevice: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v57);
            if (!v56)
            {
              v61 = (void *)MEMORY[0x1D17BA0A0]();
              v62 = v58;
              HMFGetOSLogHandle();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v91 = v64;
                _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_INFO, "%{public}@Could not create execution session, updating the current status to YES", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v61);
              if (-[HMDPresenceEvent activationGranularity](v62, "activationGranularity") != 1)
                -[HMDPresenceEvent setCurrentStatus:](v62, "setCurrentStatus:", 1);
            }

          }
          else
          {
            v83 = (void *)MEMORY[0x1D17BA0A0]();
            v84 = v30;
            HMFGetOSLogHandle();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDPresenceEvent executionSession](v84, "executionSession");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v91 = v86;
              v92 = 2112;
              v93 = v87;
              _os_log_impl(&dword_1CD062000, v85, OS_LOG_TYPE_INFO, "%{public}@This event is moving to inactive state, current execution session %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v83);
            -[HMDPresenceEvent setCurrentStatus:](v84, "setCurrentStatus:", 0);
          }
        }
        else
        {
          v77 = (void *)MEMORY[0x1D17BA0A0]();
          v78 = v30;
          HMFGetOSLogHandle();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDPresenceEvent currentStatus](v78, "currentStatus");
            HMFBooleanToString();
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            HMFBooleanToString();
            v82 = (HMDEventTriggerDevice *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v91 = v80;
            v92 = 2112;
            v93 = v81;
            v94 = 2112;
            v95 = v82;
            _os_log_impl(&dword_1CD062000, v79, OS_LOG_TYPE_INFO, "%{public}@Evaluation status is changing from %@ to %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v77);
          -[HMDPresenceEvent setCurrentStatus:](v78, "setCurrentStatus:", v28);
        }

        goto LABEL_66;
      }
      v71 = (void *)MEMORY[0x1D17BA0A0]();
      v75 = self;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v91 = v76;
        v92 = 2112;
        v93 = v75;
        _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_INFO, "%{public}@User presence in the update is not relevant to the user in this event: %@", buf, 0x16u);

      }
    }
    else
    {
      v71 = (void *)MEMORY[0x1D17BA0A0]();
      v72 = self;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v74;
        _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_INFO, "%{public}@User Presence is nil, not firing event", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v71);
LABEL_66:

LABEL_67:
    goto LABEL_68;
  }
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMDEventTriggerActivationTypeAsString(-[HMDEvent activationType](v7, "activationType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v91 = v9;
    v92 = 2112;
    v93 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Ignoring the home presence update since the activation type is %@", buf, 0x16u);

  }
LABEL_4:

  objc_autoreleasePoolPop(v6);
LABEL_68:

}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDPresenceEvent;
  return -[HMDEvent isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

- (void)didEndExecutionSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDEvent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HMDPresenceEvent_didEndExecutionSession___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)evaluateWithHomePresenceUpdate:(id)a3 presenceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDPresenceEvent *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPresenceEvent activation](v9, "activation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Activation is set to %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (-[HMDPresenceEvent activationGranularity](v9, "activationGranularity") == 1)
  {
    objc_msgSend(v6, "userPresence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDPresenceEvent evaluateWithUserPresence:presenceType:](v9, "evaluateWithUserPresence:presenceType:", v13, v7);
  }
  else
  {
    objc_msgSend(v6, "homePresence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDPresenceEvent evaluateWithHomePresence:](v9, "evaluateWithHomePresence:", v13);
  }
  v15 = v14;

  return v15;
}

- (BOOL)evaluateWithUserPresence:(id)a3 presenceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDPresenceEvent *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  const char *v13;
  HMDPresenceEvent *v14;
  HMDPresenceEvent *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9890]) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9888]) & 1) == 0
    && !objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB98A8]))
  {
    if (((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9898]) & 1) != 0
       || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB98A0]) & 1) != 0
       || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB98B0]))
      && objc_msgSend(v6, "isNotAtHome"))
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 1;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v12;
      v13 = "%{public}@User presence in the update is leaving home";
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  if (!objc_msgSend(v6, "isAtHome"))
  {
LABEL_14:
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Returning result to not fire event", (uint8_t *)&v18, 0xCu);

    }
    v11 = 0;
    goto LABEL_17;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v12;
    v13 = "%{public}@User presence in the update is arriving home";
LABEL_7:
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, 0xCu);

  }
LABEL_17:

  objc_autoreleasePoolPop(v8);
  return v11;
}

- (BOOL)_evaluateWithHomePresence:(id)a3 presenceType:(id)a4 users:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  char v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9890]))
  {
    -[HMDPresenceEvent thisUser](self, "thisUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isUserAtHome:", v11);
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9898]))
    {
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9888]))
      {
        v15 = objc_msgSend(v8, "isAnyUserAtHome");
      }
      else
      {
        if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB98A0]))
        {
          if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB98A8]))
          {
            objc_msgSend(v10, "allValues");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v8, "areUsersAtHome:", v11);
          }
          else
          {
            if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB98B0]))
            {
              v13 = 0;
              goto LABEL_6;
            }
            objc_msgSend(v10, "allValues");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v8, "areUsersNotAtHome:", v11);
          }
          goto LABEL_5;
        }
        v15 = objc_msgSend(v8, "isNoUserAtHome");
      }
      v13 = v15;
      goto LABEL_6;
    }
    -[HMDPresenceEvent thisUser](self, "thisUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isUserNotAtHome:", v11);
  }
LABEL_5:
  v13 = v12;

LABEL_6:
  return v13;
}

- (BOOL)evaluateWithHomePresence:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDPresenceEvent presenceType](self, "presenceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEvent users](self, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  LOBYTE(self) = -[HMDPresenceEvent _evaluateWithHomePresence:presenceType:users:](self, "_evaluateWithHomePresence:presenceType:users:", v4, v5, v6);

  return (char)self;
}

- (BOOL)compatibleWithUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDPresenceEvent *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDPresenceEvent presenceType](self, "presenceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9890]) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9898]))
  {
    -[HMDPresenceEvent thisUser](self, "thisUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = HMFEqualObjects();

  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9888]) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB98A0]) & 1) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB98A8]) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB98B0]))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HMDPresenceEvent users](self, "users", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v7)
    {
      v16 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v15);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "isEqual:", v4) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_22;
          }
        }
        v7 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_22:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Checking if the username %@ is compatible: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

  return v7;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMDPresenceEvent *v11;
  NSObject *v12;
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
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kPresenceEventPresence"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", CFSTR("kPresenceEventUsers"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6)
  {
    -[HMDPresenceEvent emptyModelObject](self, "emptyModelObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v14, "setPresenceType:", v5);
      if ((objc_msgSend((id)v5, "isEqualToString:", *MEMORY[0x1E0CB9890]) & 1) != 0
        || objc_msgSend((id)v5, "isEqualToString:", *MEMORY[0x1E0CB9898]))
      {
        objc_msgSend(v16, "currentUser");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setUsers:", v20);

      }
    }
    if (v6)
      objc_msgSend(v14, "setUsers:", v6);
    objc_msgSend(v16, "backingStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transaction:options:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "add:withMessage:", v14, v4);
    objc_msgSend(v24, "run");

  }
  else
  {
    objc_msgSend(v4, "responseHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "responseHandler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v9, 0);

    }
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to update Presence event as parameters are NIL", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)_updateUsers:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDPresenceEvent *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDPresenceEvent _removeAllUsers](self, "_removeAllUsers");
  v22 = v7;
  objc_msgSend(v7, "usersSupportingPresence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v12;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating users: %@, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v18, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v6, "containsObject:", v20);

        if (v21)
          -[HMDPresenceEvent _addUser:](v10, "_addUser:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

}

- (void)_removeAllUsers
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEvent setUsers:](self, "setUsers:", v3);

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEvent setUserUUIDs:](self, "setUserUUIDs:", v4);

}

- (void)_addUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[HMDPresenceEvent users](self, "users");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v4, v7);

  v8 = (void *)objc_msgSend(v14, "copy");
  -[HMDPresenceEvent setUsers:](self, "setUsers:", v8);

  -[HMDPresenceEvent userUUIDs](self, "userUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v4, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  v13 = (void *)objc_msgSend(v10, "copy");
  -[HMDPresenceEvent setUserUUIDs:](self, "setUserUUIDs:", v13);

}

- (void)handleRemovalOfUser:(id)a3 transaction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[HMDPresenceEvent users](self, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDPresenceEvent userUUIDs](self, "userUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v17, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v14);

    -[HMDPresenceEvent emptyModelObject](self, "emptyModelObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v15, "setUsers:", v16);

    objc_msgSend(v6, "add:", v15);
  }

}

- (HMDPresenceEvent)initWithCoder:(id)a3
{
  id v4;
  HMDPresenceEvent *v5;
  HMDPresenceEvent *v6;
  uint64_t v7;
  NSString *presenceType;
  uint64_t v9;
  HMPresenceEventActivation *activation;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *userUUIDs;
  uint64_t v29;
  NSDictionary *users;
  HMDFeaturesDataSource *v31;
  HMDFeaturesDataSource *featuresDataSource;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)HMDPresenceEvent;
  v5 = -[HMDEvent initWithCoder:](&v40, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPresenceEventPresence"));
    v7 = objc_claimAutoreleasedReturnValue();
    presenceType = v6->_presenceType;
    v6->_presenceType = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0CBA788], "activationGranularityWithCoder:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    activation = v6->_activation;
    v6->_activation = (HMPresenceEventActivation *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v4;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kPresenceEventUsers"));
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = (void *)v14;
    +[HMDHome filterUsersSupportingPresence:](HMDHome, "filterUsersSupportingPresence:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v22, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v24);

          objc_msgSend(v22, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v26);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v16);
    v27 = objc_claimAutoreleasedReturnValue();
    userUUIDs = v6->_userUUIDs;
    v6->_userUUIDs = (NSArray *)v27;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v15);
    v29 = objc_claimAutoreleasedReturnValue();
    users = v6->_users;
    v6->_users = (NSDictionary *)v29;

    v31 = objc_alloc_init(HMDFeaturesDataSource);
    featuresDataSource = v6->_featuresDataSource;
    v6->_featuresDataSource = v31;

    v4 = v35;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  void *v17;
  void *v18;
  HMDPresenceEvent *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = self;
  v24.receiver = self;
  v24.super_class = (Class)HMDPresenceEvent;
  -[HMDEvent encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDPresenceEvent presenceType](self, "presenceType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEvent users](self, "users");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "hmd_isForNonAdminSharedUser"))
  {
    if (objc_msgSend(v4, "hmd_isForXPCTransport", lock))
    {
      -[HMDPresenceEvent _presenceTypeForClient](self, "_presenceTypeForClient");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kPresenceEventPresence"));
      if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess")
        && usersListApplicable())
      {
        objc_msgSend(v17, "allValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("kPresenceEventUsers"));

      }
    }
    else
    {
      objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("kPresenceEventPresence"));
      objc_msgSend(v17, "allValues");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kPresenceEventUsers"));
    }
    goto LABEL_19;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("kPresenceEventPresence"), lock);
  if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB98A8]) & 1) != 0
    || objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB98B0]))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v17, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v4, "hmd_user");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v11)
          {
            v25 = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("kPresenceEventUsers"));

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v6);
    }
LABEL_19:

  }
  os_unfair_lock_unlock(locka);
  -[HMDPresenceEvent activation](v19, "activation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addToCoder:", v4);

}

- (id)_presenceTypeForClient
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id *v11;
  id v12;

  -[HMDPresenceEvent presenceType](self, "presenceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB98A8];
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB98A8]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB98B0]))
  {
    -[HMDPresenceEvent userUUIDs](self, "userUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 1)
      goto LABEL_10;
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPresenceEvent thisUser](self, "thisUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if (!v10)
      goto LABEL_10;
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
    {
      v11 = (id *)MEMORY[0x1E0CB9890];
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB98B0]))
      {
LABEL_10:

        return v3;
      }
      v11 = (id *)MEMORY[0x1E0CB9898];
    }
    v12 = *v11;

    v3 = v12;
    goto LABEL_10;
  }
  return v3;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDPresenceEventModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDPresenceEventModel *v9;
  void *v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = [HMDPresenceEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEventModel setEndEvent:](v9, "setEndEvent:", v10);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDPresenceEvent presenceType](self, "presenceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEventModel setPresenceType:](v9, "setPresenceType:", v12);

  -[HMDPresenceEvent userUUIDs](self, "userUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEventModel setUsers:](v9, "setUsers:", v13);

  -[HMDPresenceEvent activation](self, "activation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "number");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPresenceEventModel setActivation:](v9, "setActivation:", v15);

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDPresenceEvent *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  void *v21;
  HMDPresenceEvent *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  os_unfair_lock_t lock;
  os_unfair_lock_s *locka;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v48 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  v14 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    lock = &v11->_lock;
    os_unfair_lock_lock_with_options();
    if (objc_msgSend(v16, "propertyWasSet:", CFSTR("presenceType"))
      && (-[HMDPresenceEvent presenceType](v11, "presenceType", lock, v46),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "presenceType"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = HMFEqualObjects(),
          v18,
          v17,
          (v19 & 1) == 0))
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v11;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDPresenceEvent presenceType](v22, "presenceType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "presenceType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v24;
        v49 = 2112;
        v50 = v25;
        v51 = 2112;
        v52 = v26;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating presence type from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v16, "presenceType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPresenceEvent setPresenceType:](v22, "setPresenceType:", v27);

      v20 = 1;
    }
    else
    {
      v20 = 0;
    }
    -[HMDEvent eventTrigger](v11, "eventTrigger", lock);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "propertyWasSet:", CFSTR("users")))
    {
      v29 = (void *)MEMORY[0x1E0C99E60];
      -[HMDPresenceEvent userUUIDs](v11, "userUUIDs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setWithArray:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v16, "users");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v31, "isEqualToSet:", v34) & 1) == 0)
      {
        objc_msgSend(v16, "users");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "home");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPresenceEvent _updateUsers:home:](v11, "_updateUsers:home:", v35, v36);

        v20 = 1;
      }

    }
    if (!objc_msgSend(v16, "propertyWasSet:", CFSTR("activation")))
      goto LABEL_19;
    -[HMDPresenceEvent activation](v11, "activation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "number");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = HMFEqualObjects();

    if ((v40 & 1) == 0)
    {
      v41 = (void *)MEMORY[0x1E0CBA788];
      objc_msgSend(v16, "activation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "activationGranularityWithNumber:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPresenceEvent setActivation:](v11, "setActivation:", v43);

      os_unfair_lock_unlock(locka);
    }
    else
    {
LABEL_19:
      os_unfair_lock_unlock(locka);
      if ((v20 & 1) == 0)
        goto LABEL_23;
    }
    objc_msgSend(v28, "markChangedForMessage:", v9);
LABEL_23:
    objc_msgSend(v9, "respondWithSuccess");

  }
}

- (id)analyticsTriggerEventData
{
  HMDAnalyticsTriggerEventData *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  -[HMDAnalyticsTriggerEventData setEndEvent:](v3, "setEndEvent:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  -[HMDPresenceEvent analyticsPresenceEventData](self, "analyticsPresenceEventData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnalyticsTriggerEventData setPresenceEvent:](v3, "setPresenceEvent:", v4);
  v5 = -[HMDPresenceEvent activationGranularity](self, "activationGranularity");
  -[HMDAnalyticsTriggerEventData presenceEvent](v3, "presenceEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPresenceEventGranularity:", v5);

  return v3;
}

- (id)analyticsPresenceEventData
{
  HMDAnalyticsPresenceEventData *v3;
  void *v4;
  uint64_t v5;

  v3 = objc_alloc_init(HMDAnalyticsPresenceEventData);
  -[HMDPresenceEvent presenceType](self, "presenceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB98A8]) & 1) != 0)
  {
    v5 = 1;
LABEL_9:
    -[HMDAnalyticsPresenceEventData setPresenceEventType:](v3, "setPresenceEventType:", v5);
    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB98B0]) & 1) != 0)
  {
    v5 = 2;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9888]) & 1) != 0)
  {
    v5 = 3;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB98A0]))
  {
    v5 = 4;
    goto LABEL_9;
  }
LABEL_10:

  return v3;
}

- (NSString)presenceType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPresenceType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (HMPresenceEventActivation)activation
{
  return self->_activation;
}

- (void)setActivation:(id)a3
{
  objc_storeStrong((id *)&self->_activation, a3);
}

- (NSDictionary)users
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUsers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSArray)userUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUserUUIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (BOOL)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(BOOL)a3
{
  self->_currentStatus = a3;
}

- (HMDEventTriggerExecutionSession)executionSession
{
  return (HMDEventTriggerExecutionSession *)objc_loadWeakRetained((id *)&self->_executionSession);
}

- (void)setExecutionSession:(id)a3
{
  objc_storeWeak((id *)&self->_executionSession, a3);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_destroyWeak((id *)&self->_executionSession);
  objc_storeStrong((id *)&self->_userUUIDs, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_activation, 0);
  objc_storeStrong((id *)&self->_presenceType, 0);
}

void __43__HMDPresenceEvent_didEndExecutionSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "executionSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating the current status to YES after the execution session is complete", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    if (objc_msgSend(*(id *)(a1 + 32), "activationGranularity") != 1)
      objc_msgSend(*(id *)(a1 + 32), "setCurrentStatus:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setExecutionSession:", 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received a callback that execution session %@ has ended, but is not known session", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __46__HMDPresenceEvent__handleHomePresenceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 40), "_evaluatePresenceEventForHomePresenceUpdate:", v4);
}

void __48__HMDPresenceEvent__activate_completionHandler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "activationType");
  if (v2 - 2 < 2)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v3 = (void *)MEMORY[0x1D17BA0A0]();
      v4 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        HMDEventTriggerActivationTypeAsString(objc_msgSend(*(id *)(a1 + 32), "activationType"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v6;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Activation is changing to %@, initializing the current status", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v3);
      objc_msgSend(*(id *)(a1 + 32), "eventTrigger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presenceMonitor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "homePresenceUpdate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_evaluatePresenceEventForHomePresenceUpdate:", v11);
    }
  }
  else if (v2 <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentStatus:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setExecutionSession:", 0);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_30097 != -1)
    dispatch_once(&logCategory__hmf_once_t5_30097, &__block_literal_global_30098);
  return (id)logCategory__hmf_once_v6_30099;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __31__HMDPresenceEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_30099;
  logCategory__hmf_once_v6_30099 = v0;

}

@end
