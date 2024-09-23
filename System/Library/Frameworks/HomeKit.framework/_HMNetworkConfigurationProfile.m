@implementation _HMNetworkConfigurationProfile

- (id)messageTargetUUID
{
  void *v2;
  void *v3;

  -[_HMAccessoryProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  id v4;

  -[_HMAccessoryProfile context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMNCP.hostsUpdated"), self, sel__handleHostsUpdated_);
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMNCP.avUpdate"), self, sel__handleAccessViolationUpdated_);
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMNCP.wrUpdated"), self, sel__handleWiFiReconfigurationUpdated_);

}

- (id)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[_HMAccessoryProfile context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_HMNetworkConfigurationProfile)initWithAccessoryIdentifier:(id)a3 targetProtection:(int64_t)a4 currentProtection:(int64_t)a5 networkAccessRestricted:(BOOL)a6 allowedHosts:(id)a7 accessViolation:(id)a8 supportsWiFiReconfiguration:(BOOL)a9 credentialType:(int64_t)a10
{
  id v17;
  id v18;
  void *v19;
  _HMNetworkConfigurationProfile *v20;
  _HMNetworkConfigurationProfile *v21;
  objc_super v23;

  v17 = a7;
  v18 = a8;
  objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)_HMNetworkConfigurationProfile;
  v20 = -[_HMAccessoryProfile initWithUUID:services:](&v23, sel_initWithUUID_services_, v19, MEMORY[0x1E0C9AA60]);
  v21 = v20;
  if (v20)
  {
    v20->_targetProtectionMode = a4;
    v20->_currentProtectionMode = a5;
    *(&v20->_supportsWiFiReconfiguration + 3) = a6;
    objc_storeStrong((id *)&v20->_allowedHosts, a7);
    objc_storeStrong((id *)&v21->_accessViolation, a8);
    *(&v21->_supportsWiFiReconfiguration + 4) = a9;
    v21->_credentialType = a10;
  }

  return v21;
}

- (NSArray)allowedHosts
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_allowedHosts, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setAllowedHosts:(id)a3
{
  NSArray *v4;
  NSArray *allowedHosts;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  allowedHosts = self->_allowedHosts;
  self->_allowedHosts = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMAccessoryNetworkAccessViolation)accessViolation
{
  os_unfair_lock_s *p_lock;
  HMAccessoryNetworkAccessViolation *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_accessViolation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAccessViolation:(id)a3
{
  HMAccessoryNetworkAccessViolation *v4;
  HMAccessoryNetworkAccessViolation *accessViolation;

  v4 = (HMAccessoryNetworkAccessViolation *)a3;
  os_unfair_lock_lock_with_options();
  accessViolation = self->_accessViolation;
  self->_accessViolation = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (int64_t)currentProtectionMode
{
  os_unfair_lock_s *p_lock;
  int64_t currentProtectionMode;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  currentProtectionMode = self->_currentProtectionMode;
  os_unfair_lock_unlock(p_lock);
  return currentProtectionMode;
}

- (void)setCurrentProtectionMode:(int64_t)a3
{
  void *v5;
  _HMNetworkConfigurationProfile *v6;
  NSObject *v7;
  void *v8;
  int64_t currentProtectionMode;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    currentProtectionMode = v6->_currentProtectionMode;
    v10 = 138543874;
    v11 = v8;
    v12 = 2048;
    v13 = currentProtectionMode;
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Changing current protection mode from: %ld, to: %ld", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  v6->_currentProtectionMode = a3;
  os_unfair_lock_unlock(&v6->super._lock);
}

- (BOOL)isNetworkAccessRestricted
{
  _HMNetworkConfigurationProfile *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_supportsWiFiReconfiguration + 3);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setNetworkAccessRestricted:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_supportsWiFiReconfiguration + 3) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)targetProtectionMode
{
  os_unfair_lock_s *p_lock;
  int64_t targetProtectionMode;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  targetProtectionMode = self->_targetProtectionMode;
  os_unfair_lock_unlock(p_lock);
  return targetProtectionMode;
}

- (void)setTargetProtectionMode:(int64_t)a3
{
  void *v5;
  _HMNetworkConfigurationProfile *v6;
  NSObject *v7;
  void *v8;
  int64_t targetProtectionMode;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    targetProtectionMode = v6->_targetProtectionMode;
    v10 = 138543874;
    v11 = v8;
    v12 = 2048;
    v13 = targetProtectionMode;
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Changing target protection mode from: %ld, to: %ld", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  v6->_targetProtectionMode = a3;
  os_unfair_lock_unlock(&v6->super._lock);
}

- (BOOL)supportsWiFiReconfiguration
{
  _HMNetworkConfigurationProfile *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_supportsWiFiReconfiguration + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsWiFiReconfiguration:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_supportsWiFiReconfiguration + 4) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)credentialType
{
  os_unfair_lock_s *p_lock;
  int64_t credentialType;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  credentialType = self->_credentialType;
  os_unfair_lock_unlock(p_lock);
  return credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_credentialType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[_HMNetworkConfigurationProfile messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  int v20;
  int64_t v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6)
  {
    v11 = 0;
    goto LABEL_23;
  }
  v8 = objc_msgSend(v6, "currentProtectionMode");
  v9 = objc_msgSend(v7, "isNetworkAccessRestricted");
  v10 = objc_msgSend(v7, "targetProtectionMode");
  if (v8 != -[_HMNetworkConfigurationProfile currentProtectionMode](self, "currentProtectionMode"))
  {
    -[_HMNetworkConfigurationProfile setCurrentProtectionMode:](self, "setCurrentProtectionMode:", v8);
    if (v10 == -[_HMNetworkConfigurationProfile targetProtectionMode](self, "targetProtectionMode"))
    {
LABEL_11:
      -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedProtectionMode](self, "_notifyDelegateOfUpdatedProtectionMode");
      v11 = 1;
      goto LABEL_12;
    }
LABEL_10:
    -[_HMNetworkConfigurationProfile setTargetProtectionMode:](self, "setTargetProtectionMode:", v10);
    goto LABEL_11;
  }
  if (v10 != -[_HMNetworkConfigurationProfile targetProtectionMode](self, "targetProtectionMode"))
    goto LABEL_10;
  v11 = 0;
LABEL_12:
  if ((_DWORD)v9 != -[_HMNetworkConfigurationProfile isNetworkAccessRestricted](self, "isNetworkAccessRestricted"))
  {
    -[_HMNetworkConfigurationProfile setNetworkAccessRestricted:](self, "setNetworkAccessRestricted:", v9);
    -[_HMNetworkConfigurationProfile _notifyDelegateOfNetworkAccessModeChanged](self, "_notifyDelegateOfNetworkAccessModeChanged");
    v11 = 1;
  }
  objc_msgSend(v7, "allowedHosts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E60];
  -[_HMNetworkConfigurationProfile allowedHosts](self, "allowedHosts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((HMFEqualObjects() & 1) == 0)
  {
    -[_HMNetworkConfigurationProfile setAllowedHosts:](self, "setAllowedHosts:", v12);
    -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedAllowedHosts](self, "_notifyDelegateOfUpdatedAllowedHosts");
    v11 = 1;
  }
  objc_msgSend(v7, "accessViolation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMNetworkConfigurationProfile accessViolation](self, "accessViolation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = HMFEqualObjects();

  if ((v19 & 1) == 0)
  {
    -[_HMNetworkConfigurationProfile setAccessViolation:](self, "setAccessViolation:", v17);
    -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedAccessViolation](self, "_notifyDelegateOfUpdatedAccessViolation");
    v11 = 1;
  }
  v20 = -[_HMNetworkConfigurationProfile supportsWiFiReconfiguration](self, "supportsWiFiReconfiguration");
  if (v20 != objc_msgSend(v7, "supportsWiFiReconfiguration"))
  {
    -[_HMNetworkConfigurationProfile setSupportsWiFiReconfiguration:](self, "setSupportsWiFiReconfiguration:", objc_msgSend(v7, "supportsWiFiReconfiguration"));
    -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedWiFiReconfigurationSupport](self, "_notifyDelegateOfUpdatedWiFiReconfigurationSupport");
    v11 = 1;
  }
  v21 = -[_HMNetworkConfigurationProfile credentialType](self, "credentialType");
  if (v21 != objc_msgSend(v7, "credentialType"))
  {
    -[_HMNetworkConfigurationProfile setCredentialType:](self, "setCredentialType:", objc_msgSend(v7, "credentialType"));
    -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedWiFiCredentialType](self, "_notifyDelegateOfUpdatedWiFiCredentialType");
    v11 = 1;
  }

LABEL_23:
  return v11;
}

- (void)reconfigureWiFiWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _HMNetworkConfigurationProfile *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _HMNetworkConfigurationProfile *v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE location[12];
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HMAccessoryProfile context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMNetworkConfigurationProfile reconfigureWiFiWithOptions:completionHandler:]", CFSTR("completionHandler"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v30;
      v38 = 2112;
      v39 = (const char *)v26;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v26, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v9 = (void *)v8;
  if (v8)
  {
    if (-[_HMNetworkConfigurationProfile supportsWiFiReconfiguration](self, "supportsWiFiReconfiguration"))
    {
      v35[0] = CFSTR("credential-type");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "credentialType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = CFSTR("rotate");
      v36[0] = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "rotate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0D285F8];
      -[_HMNetworkConfigurationProfile messageDestination](self, "messageDestination");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("HMNCP.wr"), v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)location, self);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __79___HMNetworkConfigurationProfile_reconfigureWiFiWithOptions_completionHandler___block_invoke;
      v32[3] = &unk_1E3AB4AE0;
      objc_copyWeak(&v34, (id *)location);
      v33 = v7;
      objc_msgSend(v15, "setResponseHandler:", v32);
      objc_msgSend(v9, "messageDispatcher");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendMessage:", v15);

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)location);

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
        *(_DWORD *)location = 138543362;
        *(_QWORD *)&location[4] = v23;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Does not support Wi-Fi reconfiguration", location, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[_HMAccessoryProfile context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegateCaller");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "callCompletion:error:", v7, v25);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v20;
      v38 = 2080;
      v39 = "-[_HMNetworkConfigurationProfile reconfigureWiFiWithOptions:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }

}

- (void)previewAllowedHostsForAutoProtectionModeWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _HMNetworkConfigurationProfile *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _HMNetworkConfigurationProfile *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMAccessoryProfile context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMNetworkConfigurationProfile previewAllowedHostsForAutoProtectionModeWithCompletionHandler:]", CFSTR("completionHandler"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v19;
      v25 = 2112;
      v26 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v6 = (void *)v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0D285F8];
    -[_HMNetworkConfigurationProfile messageDestination](self, "messageDestination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("HMNCP.pvAllowed"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __96___HMNetworkConfigurationProfile_previewAllowedHostsForAutoProtectionModeWithCompletionHandler___block_invoke;
    v21[3] = &unk_1E3AB4AE0;
    objc_copyWeak(&v23, (id *)location);
    v22 = v4;
    objc_msgSend(v9, "setResponseHandler:", v21);
    objc_msgSend(v6, "messageDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:", v9);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
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
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v14;
      v25 = 2080;
      v26 = "-[_HMNetworkConfigurationProfile previewAllowedHostsForAutoProtectionModeWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);
  }

}

- (void)_notifyDelegateOfUpdatedProtectionMode
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _HMNetworkConfigurationProfile *v8;

  -[_HMNetworkConfigurationProfile delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMAccessoryProfile context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedProtectionMode__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)_notifyDelegateOfNetworkAccessModeChanged
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _HMNetworkConfigurationProfile *v8;

  -[_HMNetworkConfigurationProfile delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMAccessoryProfile context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75___HMNetworkConfigurationProfile__notifyDelegateOfNetworkAccessModeChanged__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)_notifyDelegateOfUpdatedAllowedHosts
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _HMNetworkConfigurationProfile *v8;

  -[_HMNetworkConfigurationProfile delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMAccessoryProfile context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedAllowedHosts__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)_notifyDelegateOfUpdatedAccessViolation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _HMNetworkConfigurationProfile *v8;

  -[_HMNetworkConfigurationProfile delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMAccessoryProfile context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedAccessViolation__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)_notifyDelegateOfUpdatedWiFiReconfigurationSupport
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _HMNetworkConfigurationProfile *v8;

  -[_HMNetworkConfigurationProfile delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMAccessoryProfile context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedWiFiReconfigurationSupport__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)_notifyDelegateOfUpdatedWiFiCredentialType
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _HMNetworkConfigurationProfile *v8;

  -[_HMNetworkConfigurationProfile delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMAccessoryProfile context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76___HMNetworkConfigurationProfile__notifyDelegateOfUpdatedWiFiCredentialType__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)_handleHostsUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _HMNetworkConfigurationProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dataForKey:", CFSTR("allowed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    if (v10)
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
        v21 = v14;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory allowed hosts from allowed hosts data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C99E60];
      -[_HMNetworkConfigurationProfile allowedHosts](self, "allowedHosts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((HMFEqualObjects() & 1) == 0)
      {
        -[_HMNetworkConfigurationProfile setAllowedHosts:](self, "setAllowedHosts:", v9);
        -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedAllowedHosts](self, "_notifyDelegateOfUpdatedAllowedHosts");
      }

    }
  }

}

- (void)_handleAccessViolationUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _HMNetworkConfigurationProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dataForKey:", CFSTR("access-violation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v7)
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
        v16 = v11;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory network access violation from access violation data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      -[_HMNetworkConfigurationProfile accessViolation](self, "accessViolation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HMFEqualObjects();

      if ((v13 & 1) == 0)
      {
        -[_HMNetworkConfigurationProfile setAccessViolation:](self, "setAccessViolation:", v6);
        -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedAccessViolation](self, "_notifyDelegateOfUpdatedAccessViolation");
      }
    }

  }
}

- (void)_handleWiFiReconfigurationUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  -[_HMAccessoryProfile context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCompletionBlockForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v14, "BOOLForKey:", CFSTR("reconfig-support"));
  if ((_DWORD)v8 == -[_HMNetworkConfigurationProfile supportsWiFiReconfiguration](self, "supportsWiFiReconfiguration"))
  {
    if (!v7)
      goto LABEL_6;
  }
  else
  {
    -[_HMNetworkConfigurationProfile setSupportsWiFiReconfiguration:](self, "setSupportsWiFiReconfiguration:", v8);
    if (!v7)
    {
      -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedWiFiReconfigurationSupport](self, "_notifyDelegateOfUpdatedWiFiReconfigurationSupport");
      goto LABEL_6;
    }
  }
  -[_HMAccessoryProfile context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegateCaller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callCompletion:error:", v7, 0);

LABEL_6:
  objc_msgSend(v14, "numberForKey:", CFSTR("credential-type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  if ((unint64_t)(v12 - 1) >= 3)
    v13 = 0;
  else
    v13 = v12;
  if (-[_HMNetworkConfigurationProfile credentialType](self, "credentialType") != v13)
  {
    -[_HMNetworkConfigurationProfile setCredentialType:](self, "setCredentialType:", v13);
    -[_HMNetworkConfigurationProfile _notifyDelegateOfUpdatedWiFiCredentialType](self, "_notifyDelegateOfUpdatedWiFiCredentialType");
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[_HMAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_HMNetworkConfigurationProfileDelegate)delegate
{
  return (_HMNetworkConfigurationProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessViolation, 0);
  objc_storeStrong((id *)&self->_allowedHosts, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25 != -1)
    dispatch_once(&logCategory__hmf_once_t25, &__block_literal_global_22970);
  return (id)logCategory__hmf_once_v26;
}

@end
