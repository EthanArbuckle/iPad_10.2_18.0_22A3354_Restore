@implementation _HMSiriEndpointProfile

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HMSiriEndpointProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  _HMSiriEndpointProfile *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543874;
    v16 = v11;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring siri endpoint profile: %@ with context: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v14.receiver = v9;
  v14.super_class = (Class)_HMSiriEndpointProfile;
  -[_HMAccessoryProfile __configureWithContext:accessory:](&v14, sel___configureWithContext_accessory_, v6, v7);
  -[_HMAccessoryProfile home](v9, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createSiriEndpointProfilesMessenger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMSiriEndpointProfile setMessenger:](v9, "setMessenger:", v13);

}

- (void)_registerNotificationHandlers
{
  void *v3;
  id v4;

  -[_HMAccessoryProfile context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("HMSE.up"), self, sel__handleUpdateProfileState_);

}

- (void)applyOnboardingSelections:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _HMSiriEndpointProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  -[_HMSiriEndpointProfile messenger](self, "messenger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_HMAccessoryProfile accessory](self, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sendApplyOnboardingSelectionsRequestWithAccessoryUUID:onboardingSelections:completionHandler:", v10, v6, v7);
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
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to apply onboarding selections due to no messenger", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v15, 1);

  }
}

- (void)deleteSiriHistoryWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _HMSiriEndpointProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[_HMSiriEndpointProfile messenger](self, "messenger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_HMAccessoryProfile accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "sendDeleteSiriHistoryRequestWithAccessoryUUID:completionHandler:", v7, v4);
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
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete siri history due to no messenger", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v12);

  }
}

- (void)notifyClientDidUpdateSessionState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _HMSiriEndpointProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _HMSiriEndpointProfile *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _HMSiriEndpointProfile *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[_HMAccessoryProfile context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_HMSiriEndpointProfile delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v9;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did update session state using delegate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59___HMSiriEndpointProfile_notifyClientDidUpdateSessionState__block_invoke;
      v14[3] = &unk_1E3AB5ED8;
      v15 = v5;
      v16 = v7;
      objc_msgSend(v4, "invokeBlock:", v14);

    }
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
      v18 = v13;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated session state due to no delgate caller from context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (int64_t)sessionState
{
  os_unfair_lock_s *p_lock;
  int64_t sessionState;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  sessionState = self->_sessionState;
  os_unfair_lock_unlock(p_lock);
  return sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_sessionState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)sessionHubIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_sessionHubIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSessionHubIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *sessionHubIdentifier;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  sessionHubIdentifier = self->_sessionHubIdentifier;
  self->_sessionHubIdentifier = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)siriEndpointVersion
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_siriEndpointVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSiriEndpointVersion:(id)a3
{
  NSString *v4;
  NSString *siriEndpointVersion;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  siriEndpointVersion = self->_siriEndpointVersion;
  self->_siriEndpointVersion = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (unint64_t)capability
{
  os_unfair_lock_s *p_lock;
  unint64_t capability;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  capability = self->_capability;
  os_unfair_lock_unlock(p_lock);
  return capability;
}

- (void)setCapability:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_capability = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)siriEngineVersion
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_siriEngineVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSiriEngineVersion:(id)a3
{
  NSString *v4;
  NSString *siriEngineVersion;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  siriEngineVersion = self->_siriEngineVersion;
  self->_siriEngineVersion = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSNumber)activeIdentifier
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_activeIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setActiveIdentifier:(id)a3
{
  NSNumber *v4;
  NSNumber *activeIdentifier;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  activeIdentifier = self->_activeIdentifier;
  self->_activeIdentifier = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (BOOL)manuallyDisabled
{
  _HMSiriEndpointProfile *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_manuallyDisabled + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setManuallyDisabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_manuallyDisabled + 4) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)multifunctionButton
{
  os_unfair_lock_s *p_lock;
  int64_t multifunctionButton;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  multifunctionButton = self->_multifunctionButton;
  os_unfair_lock_unlock(p_lock);
  return multifunctionButton;
}

- (void)setMultifunctionButton:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_multifunctionButton = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)assistants
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_assistants;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssistants:(id)a3
{
  NSArray *v4;
  NSArray *assistants;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  assistants = self->_assistants;
  self->_assistants = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _HMSiriEndpointProfile *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMAccessoryProfile context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v12);
    }
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60___HMSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v15 = v4;
    v14 = v6;
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
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_handleUpdateProfileState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  _HMSiriEndpointProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[4];
  id v79;
  _HMSiriEndpointProfile *v80;
  id v81;
  _QWORD v82[4];
  id v83;
  _HMSiriEndpointProfile *v84;
  _QWORD v85[4];
  id v86;
  _HMSiriEndpointProfile *v87;
  _QWORD v88[4];
  id v89;
  _HMSiriEndpointProfile *v90;
  _QWORD v91[4];
  id v92;
  _HMSiriEndpointProfile *v93;
  _QWORD v94[4];
  id v95;
  _HMSiriEndpointProfile *v96;
  _QWORD v97[4];
  id v98;
  _HMSiriEndpointProfile *v99;
  _QWORD v100[4];
  id v101;
  _HMSiriEndpointProfile *v102;
  _QWORD v103[2];
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMAccessoryProfile context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v6;
  objc_msgSend(v6, "removeCompletionBlockForIdentifier:", v7);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HMSiriEndpointProfile delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("session-state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_HMSiriEndpointProfile sessionState](self, "sessionState");
  v76 = v9;
  if (v9)
  {
    v11 = v10;
    if (objc_msgSend(v9, "integerValue") != v10)
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HMSiriEndpointProfileSessionStateTypeToString(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HMSiriEndpointProfileSessionStateTypeToString(objc_msgSend(v9, "integerValue"));
        v17 = v8;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v105 = v15;
        v106 = 2112;
        v107 = v16;
        v108 = 2112;
        v109 = v18;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating session state due to message from session state: %@ to sessionState: %@", buf, 0x20u);

        v8 = v17;
        v9 = v76;

      }
      objc_autoreleasePoolPop(v12);
      -[_HMSiriEndpointProfile setSessionState:](v13, "setSessionState:", objc_msgSend(v9, "integerValue"));
      -[_HMSiriEndpointProfile notifyClientDidUpdateSessionState](v13, "notifyClientDidUpdateSessionState");
    }
  }
  objc_msgSend(v4, "uuidForKey:", CFSTR("session-hub-id"));
  v19 = objc_claimAutoreleasedReturnValue();
  -[_HMSiriEndpointProfile sessionHubIdentifier](self, "sessionHubIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = HMFEqualObjects();

  if ((v21 & 1) == 0)
  {
    -[_HMSiriEndpointProfile setSessionHubIdentifier:](self, "setSessionHubIdentifier:", v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_HMAccessoryProfile context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke;
      v100[3] = &unk_1E3AB5ED8;
      v101 = v8;
      v102 = self;
      objc_msgSend(v23, "invokeBlock:", v100);

    }
  }
  objc_msgSend(v4, "stringForKey:", CFSTR("version"));
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[_HMSiriEndpointProfile siriEndpointVersion](self, "siriEndpointVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = HMFEqualObjects();

    if ((v26 & 1) == 0)
      -[_HMSiriEndpointProfile setSiriEndpointVersion:](self, "setSiriEndpointVersion:", v24);
  }
  objc_msgSend(v4, "stringForKey:", CFSTR("siri-engine-version"));
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[_HMSiriEndpointProfile siriEngineVersion](self, "siriEngineVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = HMFEqualObjects();

    if ((v29 & 1) == 0)
    {
      -[_HMSiriEndpointProfile setSiriEngineVersion:](self, "setSiriEngineVersion:", v27);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "delegateCaller");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v97[0] = MEMORY[0x1E0C809B0];
        v97[1] = 3221225472;
        v97[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_2;
        v97[3] = &unk_1E3AB5ED8;
        v98 = v8;
        v99 = self;
        objc_msgSend(v31, "invokeBlock:", v97);

      }
    }
  }
  objc_msgSend(v4, "numberForKey:", CFSTR("capability"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v34 = objc_msgSend(v32, "integerValue");
    if (v34 != -[_HMSiriEndpointProfile capability](self, "capability"))
    {
      v35 = -[_HMSiriEndpointProfile capability](self, "capability");
      -[_HMSiriEndpointProfile setCapability:](self, "setCapability:", objc_msgSend(v33, "integerValue"));
      if (((-[_HMSiriEndpointProfile capability](self, "capability") ^ v35) & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "delegateCaller");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_3;
        v94[3] = &unk_1E3AB5ED8;
        v95 = v8;
        v96 = self;
        objc_msgSend(v37, "invokeBlock:", v94);

      }
      if (((-[_HMSiriEndpointProfile capability](self, "capability") ^ v35) & 2) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "delegateCaller");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v91[0] = MEMORY[0x1E0C809B0];
        v91[1] = 3221225472;
        v91[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_4;
        v91[3] = &unk_1E3AB5ED8;
        v92 = v8;
        v93 = self;
        objc_msgSend(v39, "invokeBlock:", v91);

      }
    }
  }
  v73 = (void *)v19;
  objc_msgSend(v4, "numberForKey:", CFSTR("active-identifier"));
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    -[_HMSiriEndpointProfile activeIdentifier](self, "activeIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = HMFEqualObjects();

    if ((v42 & 1) == 0)
    {
      -[_HMSiriEndpointProfile setActiveIdentifier:](self, "setActiveIdentifier:", v40);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "delegateCaller");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_5;
        v88[3] = &unk_1E3AB5ED8;
        v89 = v8;
        v90 = self;
        objc_msgSend(v44, "invokeBlock:", v88);

      }
    }
  }
  v72 = (void *)v24;
  objc_msgSend(v4, "numberForKey:", CFSTR("manually-disabled"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
  {
    v47 = objc_msgSend(v45, "BOOLValue");
    if (v47 != -[_HMSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled"))
    {
      -[_HMSiriEndpointProfile setManuallyDisabled:](self, "setManuallyDisabled:", objc_msgSend(v46, "BOOLValue"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "delegateCaller");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_6;
        v85[3] = &unk_1E3AB5ED8;
        v86 = v8;
        v87 = self;
        objc_msgSend(v49, "invokeBlock:", v85);

      }
    }
  }
  v70 = v33;
  v71 = (void *)v27;
  objc_msgSend(v4, "numberForKey:", CFSTR("multifunction-button"), v40);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    v52 = objc_msgSend(v50, "integerValue");
    if (v52 != -[_HMSiriEndpointProfile multifunctionButton](self, "multifunctionButton"))
    {
      -[_HMSiriEndpointProfile setMultifunctionButton:](self, "setMultifunctionButton:", objc_msgSend(v51, "integerValue"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "delegateCaller");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = MEMORY[0x1E0C809B0];
        v82[1] = 3221225472;
        v82[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_7;
        v82[3] = &unk_1E3AB5ED8;
        v83 = v8;
        v84 = self;
        objc_msgSend(v54, "invokeBlock:", v82);

      }
    }
  }
  v77 = v8;
  objc_msgSend(v4, "dataForKey:", CFSTR("assistants"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)MEMORY[0x1E0CB3710];
  v57 = (void *)MEMORY[0x1E0C99E60];
  v103[0] = objc_opt_class();
  v103[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setWithArray:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  objc_msgSend(v56, "unarchivedObjectOfClasses:fromData:error:", v59, v55, &v81);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v81;

  v62 = v60;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v63 = v62;
  else
    v63 = 0;
  v64 = v63;

  if (v64
    && -[_HMSiriEndpointProfile _mergeAssistants:](self, "_mergeAssistants:", v64)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMAccessoryProfile context](self, "context");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "delegateCaller");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_8;
    v78[3] = &unk_1E3AB5ED8;
    v79 = v77;
    v80 = self;
    objc_msgSend(v66, "invokeBlock:", v78);

  }
  if (v74)
  {
    -[_HMAccessoryProfile context](self, "context");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "delegateCaller");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "callCompletion:error:", v74, 0);

  }
}

- (void)setNotifications:(BOOL)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _HMSiriEndpointProfile *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  unint64_t v20;
  BOOL v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[_HMAccessoryProfile context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v16);
    }
    objc_msgSend(v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69___HMSiriEndpointProfile_setNotifications_options_completionHandler___block_invoke;
    block[3] = &unk_1E3AB2640;
    v21 = a3;
    v20 = a4;
    block[4] = self;
    v19 = v8;
    v18 = v10;
    dispatch_async(v11, block);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[_HMAccessoryProfile messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (_HMSiriEndpointProfile)initWithCoder:(id)a3
{
  id v4;
  _HMSiriEndpointProfile *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  NSNumber *activeIdentifier;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *assistants;
  void *v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HMSiriEndpointProfile;
  v5 = -[_HMAccessoryProfile initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session-state"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sessionState = objc_msgSend(v28, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session-hub-id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_zeroUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_storeStrong((id *)&v5->_sessionHubIdentifier, v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E3AB7688;
    objc_storeStrong((id *)&v5->_siriEndpointVersion, v11);
    v5->_capability = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("capability"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siri-engine-version"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = &stru_1E3AB7688;
    objc_storeStrong((id *)&v5->_siriEngineVersion, v14);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("active-identifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    activeIdentifier = v5->_activeIdentifier;
    v5->_activeIdentifier = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manually-disabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      *(&v5->_manuallyDisabled + 4) = objc_msgSend(v17, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multifunction-button"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v5->_multifunctionButton = objc_msgSend(v19, "integerValue");
    v21 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("assistants"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    assistants = v5->_assistants;
    v5->_assistants = (NSArray *)v25;

  }
  return v5;
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

- (BOOL)_mergeAssistants:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  HMObjectMergeCollection *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[_HMSiriEndpointProfile assistants](self, "assistants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v6, v4);

  -[HMObjectMergeCollection mergeCommonObjects](v7, "mergeCommonObjects");
  if (-[HMObjectMergeCollection isModified](v7, "isModified"))
  {
    -[HMObjectMergeCollection finalObjects](v7, "finalObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMSiriEndpointProfile setAssistants:](self, "setAssistants:", v8);

  }
  v9 = -[HMObjectMergeCollection isModified](v7, "isModified");

  return v9;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  _HMSiriEndpointProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  NSObject *v51;
  int v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  void *v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[5];
  id v73;
  _QWORD v74[5];
  id v75;
  _QWORD block[5];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[_HMSiriEndpointProfile delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "sessionState");
    v9 = -[_HMSiriEndpointProfile sessionState](self, "sessionState");
    v10 = v8 == v9;
    v11 = v8 != v9;
    if (!v10)
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v59 = v7;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HMSiriEndpointProfileSessionStateTypeToString(objc_msgSend(v6, "sessionState"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HMSiriEndpointProfileSessionStateTypeToString(-[_HMSiriEndpointProfile sessionState](v13, "sessionState"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v78 = v15;
        v79 = 2112;
        v80 = v16;
        v81 = 2112;
        v82 = v17;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating session state during merge to session state: %@ from session state: %@", buf, 0x20u);

        v7 = v59;
      }

      objc_autoreleasePoolPop(v12);
      -[_HMSiriEndpointProfile setSessionState:](v13, "setSessionState:", objc_msgSend(v6, "sessionState"));
      -[_HMAccessoryProfile context](v13, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "queue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke;
      block[3] = &unk_1E3AB5E18;
      block[4] = v13;
      dispatch_async(v19, block);

    }
    objc_msgSend(v6, "sessionHubIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMSiriEndpointProfile sessionHubIdentifier](self, "sessionHubIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = HMFEqualObjects();

    if ((v22 & 1) == 0)
    {
      objc_msgSend(v6, "sessionHubIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMSiriEndpointProfile setSessionHubIdentifier:](self, "setSessionHubIdentifier:", v23);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "queue");
        v25 = objc_claimAutoreleasedReturnValue();
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2;
        v74[3] = &unk_1E3AB5ED8;
        v74[4] = self;
        v75 = v7;
        dispatch_async(v25, v74);

      }
      v11 = 1;
    }
    objc_msgSend(v6, "siriEndpointVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMSiriEndpointProfile siriEndpointVersion](self, "siriEndpointVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = HMFEqualObjects();

    if ((v28 & 1) == 0)
    {
      objc_msgSend(v6, "siriEndpointVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMSiriEndpointProfile setSiriEndpointVersion:](self, "setSiriEndpointVersion:", v29);

      v11 = 1;
    }
    v30 = objc_msgSend(v6, "capability");
    if (v30 != -[_HMSiriEndpointProfile capability](self, "capability"))
    {
      v31 = -[_HMSiriEndpointProfile capability](self, "capability");
      -[_HMSiriEndpointProfile setCapability:](self, "setCapability:", objc_msgSend(v6, "capability"));
      if (((-[_HMSiriEndpointProfile capability](self, "capability") ^ v31) & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "queue");
        v33 = objc_claimAutoreleasedReturnValue();
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_40;
        v72[3] = &unk_1E3AB5ED8;
        v72[4] = self;
        v73 = v7;
        dispatch_async(v33, v72);

      }
      if (((-[_HMSiriEndpointProfile capability](self, "capability") ^ v31) & 2) != 0
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "queue");
        v35 = objc_claimAutoreleasedReturnValue();
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_42;
        v70[3] = &unk_1E3AB5ED8;
        v70[4] = self;
        v71 = v7;
        dispatch_async(v35, v70);

      }
      v11 = 1;
    }
    objc_msgSend(v6, "siriEngineVersion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMSiriEndpointProfile siriEngineVersion](self, "siriEngineVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = HMFEqualObjects();

    if ((v38 & 1) == 0)
    {
      objc_msgSend(v6, "siriEngineVersion");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMSiriEndpointProfile setSiriEngineVersion:](self, "setSiriEngineVersion:", v39);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "queue");
        v41 = objc_claimAutoreleasedReturnValue();
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_44;
        v68[3] = &unk_1E3AB5ED8;
        v68[4] = self;
        v69 = v7;
        dispatch_async(v41, v68);

      }
      v11 = 1;
    }
    objc_msgSend(v6, "assistants");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[_HMSiriEndpointProfile _mergeAssistants:](self, "_mergeAssistants:", v42);

    if (v43 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_HMAccessoryProfile context](self, "context");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "queue");
      v45 = objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_46;
      v66[3] = &unk_1E3AB5ED8;
      v66[4] = self;
      v67 = v7;
      dispatch_async(v45, v66);

    }
    objc_msgSend(v6, "activeIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMSiriEndpointProfile activeIdentifier](self, "activeIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = HMFEqualObjects();

    if ((v48 & 1) == 0)
    {
      objc_msgSend(v6, "activeIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMSiriEndpointProfile setActiveIdentifier:](self, "setActiveIdentifier:", v49);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "queue");
        v51 = objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_48;
        v64[3] = &unk_1E3AB5ED8;
        v64[4] = self;
        v65 = v7;
        dispatch_async(v51, v64);

      }
      v11 = 1;
    }
    v52 = objc_msgSend(v6, "manuallyDisabled");
    if (v52 != -[_HMSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled"))
    {
      -[_HMSiriEndpointProfile setManuallyDisabled:](self, "setManuallyDisabled:", objc_msgSend(v6, "manuallyDisabled"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "queue");
        v54 = objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_50;
        v62[3] = &unk_1E3AB5ED8;
        v62[4] = self;
        v63 = v7;
        dispatch_async(v54, v62);

      }
      v11 = 1;
    }
    v55 = objc_msgSend(v6, "multifunctionButton");
    if (v55 != -[_HMSiriEndpointProfile multifunctionButton](self, "multifunctionButton"))
    {
      -[_HMSiriEndpointProfile setMultifunctionButton:](self, "setMultifunctionButton:", objc_msgSend(v6, "multifunctionButton"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAccessoryProfile context](self, "context");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "queue");
        v57 = objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_52;
        v60[3] = &unk_1E3AB5ED8;
        v60[4] = self;
        v61 = v7;
        dispatch_async(v57, v60);

      }
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[11];

  v33[9] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[_HMAccessoryProfile accessory](self, "accessory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "uniqueIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryUniqueIdentifier"), v31);
  v33[0] = v30;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  HMSiriEndpointProfileSessionStateTypeToString(-[_HMSiriEndpointProfile sessionState](self, "sessionState"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("sessionState"), v29);
  v33[1] = v28;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[_HMSiriEndpointProfile sessionHubIdentifier](self, "sessionHubIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("sessionHubIdentifier"), v27);
  v33[2] = v26;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[_HMSiriEndpointProfile siriEndpointVersion](self, "siriEndpointVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("siriEndpointVersion"), v25);
  v33[3] = v24;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  HMSiriEndpointProfileCapabilityToString(-[_HMSiriEndpointProfile capability](self, "capability"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("capability"), v23);
  v33[4] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[_HMSiriEndpointProfile siriEngineVersion](self, "siriEngineVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("siriEngineVersion"), v10);
  v33[5] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[_HMSiriEndpointProfile activeIdentifier](self, "activeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("activeIdentifier"), v13);
  v33[6] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[_HMSiriEndpointProfile manuallyDisabled](self, "manuallyDisabled");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("manuallyDisabled"), v16);
  v33[7] = v17;
  v18 = objc_alloc(MEMORY[0x1E0D28548]);
  HMSiriEndpointProfileMultifunctionButtonTypeToString(-[_HMSiriEndpointProfile multifunctionButton](self, "multifunctionButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("multifunctionButton"), v19);
  v33[8] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v21;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[_HMAccessoryProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_HMSiriEndpointProfileDelegate)delegate
{
  return (_HMSiriEndpointProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMSiriEndpointProfilesMessenger)messenger
{
  return (HMSiriEndpointProfilesMessenger *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMessenger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assistants, 0);
  objc_storeStrong((id *)&self->_activeIdentifier, 0);
  objc_storeStrong((id *)&self->_siriEngineVersion, 0);
  objc_storeStrong((id *)&self->_siriEndpointVersion, 0);
  objc_storeStrong((id *)&self->_sessionHubIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t37 != -1)
    dispatch_once(&logCategory__hmf_once_t37, &__block_literal_global_29095);
  return (id)logCategory__hmf_once_v38;
}

@end
