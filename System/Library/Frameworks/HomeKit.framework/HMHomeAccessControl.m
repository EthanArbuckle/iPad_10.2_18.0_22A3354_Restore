@implementation HMHomeAccessControl

- (BOOL)isAccessAllowed
{
  HMHomeAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_restrictedGuestInAllowedPeriod;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAdministrator
{
  HMHomeAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_restrictedGuest;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isOwner
{
  HMHomeAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_announceAccessAllowed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAnnounceAccessAllowed
{
  HMHomeAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_presenceAuthStatus;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMHomeAccessControl)initWithUser:(id)a3 allowAccess:(BOOL)a4 owner:(BOOL)a5 administratorPrivilege:(BOOL)a6 remoteAccess:(BOOL)a7 presenceAuthStatus:(id)a8 presenceComputeStatus:(id)a9 announceAccess:(BOOL)a10 camerasAccess:(id)a11 audioAnalysisUserDropInAccessLevel:(unint64_t)a12 restrictedGuest:(BOOL)a13 restrictedGuestAccessSettings:(id)a14
{
  id v20;
  HMHomeAccessControl *v21;
  HMHomeAccessControl *v22;
  void *v23;
  HMHomeAccessControl *v24;
  NSObject *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v31 = a8;
  v30 = a9;
  v29 = a11;
  v28 = a14;
  v32.receiver = self;
  v32.super_class = (Class)HMHomeAccessControl;
  v21 = -[HMAccessControl initWithUser:](&v32, sel_initWithUser_, v20);
  v22 = v21;
  if (v21)
  {
    v21->_restrictedGuestInAllowedPeriod = a4;
    v21->_announceAccessAllowed = a5;
    v21->_restrictedGuest = a6;
    *(&v21->_restrictedGuestInAllowedPeriod + 1) = a7;
    objc_storeStrong((id *)&v21->_presenceComputeStatus, a8);
    objc_storeStrong((id *)&v22->_camerasAccess, a9);
    objc_storeStrong((id *)&v22->_restrictedGuestAccessSettings, a11);
    LOBYTE(v22->_presenceAuthStatus) = a10;
    v22[1].super.super.isa = (Class)a12;
    BYTE1(v22->_presenceAuthStatus) = a13;
    objc_storeStrong((id *)&v22->_accessNotAllowedReasonCode, a14);
    if (BYTE1(v22->_presenceAuthStatus))
    {
      if (!v22->_accessNotAllowedReasonCode)
      {
        v23 = (void *)MEMORY[0x1A1AC1AAC]();
        v24 = v22;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v26;
          _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_FAULT, "%{public}@restricted guest cannot exist without its access settings object", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
      }
    }
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  HMHomeAccessControl *v4;
  HMHomeAccessControl *v5;
  HMHomeAccessControl *v6;
  HMHomeAccessControl *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  unint64_t v18;
  _BOOL4 v19;
  char v20;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = (HMHomeAccessControl *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HMHomeAccessControl;
    if (-[HMAccessControl isEqual:](&v24, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (!v7)
        goto LABEL_17;
      v8 = -[HMHomeAccessControl isAccessAllowed](self, "isAccessAllowed");
      if (v8 != -[HMHomeAccessControl isAccessAllowed](v7, "isAccessAllowed"))
        goto LABEL_17;
      v9 = -[HMHomeAccessControl isAdministrator](self, "isAdministrator");
      if (v9 != -[HMHomeAccessControl isAdministrator](v7, "isAdministrator"))
        goto LABEL_17;
      v10 = -[HMHomeAccessControl isOwner](self, "isOwner");
      if (v10 != -[HMHomeAccessControl isOwner](v7, "isOwner"))
        goto LABEL_17;
      v11 = -[HMHomeAccessControl isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
      if (v11 != -[HMHomeAccessControl isRemoteAccessAllowed](v7, "isRemoteAccessAllowed"))
        goto LABEL_17;
      v12 = -[HMHomeAccessControl presenceAuthorizationStatus](self, "presenceAuthorizationStatus");
      if (v12 != -[HMHomeAccessControl presenceAuthorizationStatus](v7, "presenceAuthorizationStatus"))
        goto LABEL_17;
      v13 = -[HMHomeAccessControl presenceComputationStatus](self, "presenceComputationStatus");
      if (v13 != -[HMHomeAccessControl presenceComputationStatus](v7, "presenceComputationStatus"))
        goto LABEL_17;
      -[HMHomeAccessControl camerasAccess](self, "camerasAccess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeAccessControl camerasAccess](v7, "camerasAccess");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (!v16)
        goto LABEL_17;
      v17 = -[HMHomeAccessControl isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
      if (v17 == -[HMHomeAccessControl isAnnounceAccessAllowed](v7, "isAnnounceAccessAllowed")
        && (v18 = -[HMHomeAccessControl audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"),
            v18 == -[HMHomeAccessControl audioAnalysisUserDropInAccessLevel](v7, "audioAnalysisUserDropInAccessLevel"))
        && (v19 = -[HMHomeAccessControl isRestrictedGuest](self, "isRestrictedGuest"),
            v19 == -[HMHomeAccessControl isRestrictedGuest](v7, "isRestrictedGuest")))
      {
        -[HMHomeAccessControl restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMHomeAccessControl restrictedGuestAccessSettings](v7, "restrictedGuestAccessSettings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = HMFEqualObjects();

      }
      else
      {
LABEL_17:
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (void)setOwner:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_announceAccessAllowed = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setAdministrator:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_restrictedGuest = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setAccessAllowed:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_restrictedGuestInAllowedPeriod = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isRemoteAccessAllowed
{
  HMHomeAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_restrictedGuestInAllowedPeriod + 1);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRemoteAccessAllowed:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_restrictedGuestInAllowedPeriod + 1) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMUserPresenceAuthorization)presenceAuthStatus
{
  os_unfair_lock_s *p_lock;
  HMUserPresenceCompute *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_presenceComputeStatus;
  os_unfair_lock_unlock(p_lock);
  return (HMUserPresenceAuthorization *)v4;
}

- (void)setPresenceAuthStatus:(id)a3
{
  HMUserPresenceCompute *v4;
  HMUserPresenceCompute *presenceComputeStatus;

  v4 = (HMUserPresenceCompute *)a3;
  os_unfair_lock_lock_with_options();
  presenceComputeStatus = self->_presenceComputeStatus;
  self->_presenceComputeStatus = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMUserPresenceCompute)presenceComputeStatus
{
  os_unfair_lock_s *p_lock;
  HMUserCameraAccess *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_camerasAccess;
  os_unfair_lock_unlock(p_lock);
  return (HMUserPresenceCompute *)v4;
}

- (void)setPresenceComputeStatus:(id)a3
{
  HMUserCameraAccess *v4;
  HMUserCameraAccess *camerasAccess;

  v4 = (HMUserCameraAccess *)a3;
  os_unfair_lock_lock_with_options();
  camerasAccess = self->_camerasAccess;
  self->_camerasAccess = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (unint64_t)presenceAuthorizationStatus
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMUserPresenceCompute value](self->_presenceComputeStatus, "value");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)presenceComputationStatus
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMUserCameraAccess value](self->_camerasAccess, "value");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMUserCameraAccess)camerasAccess
{
  os_unfair_lock_s *p_lock;
  HMRestrictedGuestHomeAccessSettings *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_restrictedGuestAccessSettings;
  os_unfair_lock_unlock(p_lock);
  return (HMUserCameraAccess *)v4;
}

- (void)setCamerasAccess:(id)a3
{
  HMRestrictedGuestHomeAccessSettings *v4;
  HMRestrictedGuestHomeAccessSettings *restrictedGuestAccessSettings;

  v4 = (HMRestrictedGuestHomeAccessSettings *)a3;
  os_unfair_lock_lock_with_options();
  restrictedGuestAccessSettings = self->_restrictedGuestAccessSettings;
  self->_restrictedGuestAccessSettings = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (unint64_t)camerasAccessLevel
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMRestrictedGuestHomeAccessSettings value](self->_restrictedGuestAccessSettings, "value");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAnnounceAccessAllowed:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(self->_presenceAuthStatus) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setAudioAnalysisUserDropinAccessLevel:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self[1].super.super.isa = (Class)a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)audioAnalysisUserDropInAccessLevel
{
  os_unfair_lock_s *p_lock;
  Class isa;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  isa = self[1].super.super.isa;
  os_unfair_lock_unlock(p_lock);
  return (unint64_t)isa;
}

- (void)updateAudioAnalysisUserDropinAccessLevel:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMHomeAccessControl *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMHomeAccessControl *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMHomeAccessControl *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMHomeAccessControl *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  -[HMAccessControl user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeAccessControl updateAudioAnalysisUserDropinAccessLevel:completionHandler:]", CFSTR("completion"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v29;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v25, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v9 = (void *)v8;
  if (v7)
  {
    if (v8)
    {
      if (!-[HMHomeAccessControl isRestrictedGuest](self, "isRestrictedGuest"))
      {
        objc_msgSend(v7, "userID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateAccessForUser:audioAnalysisUserDropinAccessLevel:completionHandler:", v24, a3, v6);
        goto LABEL_15;
      }
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v13;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot update audio analysis dropin, user is a restricted guest", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 2902;
    }
    else
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v23;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot update audio analysis dropin, home not present", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 2018;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update audio analysis dropin, user not present", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 2019;
  }
  objc_msgSend(v14, "hmPrivateErrorWithCode:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v24);
LABEL_15:

}

- (void)updateAdministratorAccess:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  HMHomeAccessControl *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  -[HMAccessControl user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[HMHomeAccessControl isRestrictedGuest](self, "isRestrictedGuest"))
    {
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v12;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot update restricted guest user to administrator", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2902);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v13);

    }
    else
    {
      objc_msgSend(v7, "userID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateAccessForUser:administrator:completionHandler:", v14, v4, v6);

    }
  }

}

- (void)updateRemoteAccess:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[HMAccessControl user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "userID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAccessForUser:remoteAccess:completionHandler:", v8, v4, v9);

  }
}

- (void)updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  HMHomeAccessControl *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  if (-[HMHomeAccessControl isRestrictedGuest](self, "isRestrictedGuest"))
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot update presence authorization status for the user as they are the restricted guest", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2902);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

  }
  else
  {
    -[HMAccessControl user](self, "user");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatePresenceAuthorizationStatus:completionHandler:", a3, v6);

  }
}

- (void)updateCamerasAccessLevel:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  HMHomeAccessControl *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMHomeAccessControl *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v7 = (void (**)(_QWORD, _QWORD))v6;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMUserCameraAccessLevelAsString(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating cameras access level to %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMAccessControl user](v9, "user");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (!-[HMHomeAccessControl isRestrictedGuest](v9, "isRestrictedGuest"))
      {
        objc_msgSend(v14, "userID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateAccessForUser:camerasAccessLevel:completionHandler:", v27, a3, v7);
        goto LABEL_18;
      }
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = v9;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v19;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update cameras access level for the user as they are the restricted guest", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2902);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v26;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home not present", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v20;
    v7[2](v7, v20);
LABEL_18:

    goto LABEL_19;
  }
  v21 = (void *)MEMORY[0x1A1AC1AAC]();
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v23;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@User not present", (uint8_t *)&v29, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v15);
LABEL_19:

}

- (void)updateAnnounceAccess:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMHomeAccessControl *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMHomeAccessControl *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMHomeAccessControl *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  -[HMAccessControl user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeAccessControl updateAnnounceAccess:completionHandler:]", CFSTR("completion"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v25;
      v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  v9 = (void *)v8;
  if (!v7)
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      v19 = "%{public}@Cannot update announce, user not present";
LABEL_12:
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);

    }
LABEL_13:

    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      v19 = "%{public}@Missing home, can't update announce access";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!-[HMHomeAccessControl isRestrictedGuest](self, "isRestrictedGuest"))
  {
    objc_msgSend(v7, "userID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateAccessForUser:announceAccess:completionHandler:", v20, v4, v6);
    goto LABEL_15;
  }
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v13;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot update announce access for the user as they are the restricted guest", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2902);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v20 = (void *)v14;
  v6[2](v6, v14);
LABEL_15:

}

- (BOOL)isRestrictedGuest
{
  HMHomeAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = BYTE1(v2->_presenceAuthStatus);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRestrictedGuest:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  BYTE1(self->_presenceAuthStatus) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMRestrictedGuestHomeAccessSettings)restrictedGuestAccessSettings
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (id)self->_accessNotAllowedReasonCode;
  os_unfair_lock_unlock(p_lock);
  return (HMRestrictedGuestHomeAccessSettings *)v4;
}

- (void)setUserAccessSettings:(id)a3
{
  id v4;
  void *accessNotAllowedReasonCode;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  accessNotAllowedReasonCode = (void *)self->_accessNotAllowedReasonCode;
  self->_accessNotAllowedReasonCode = (unint64_t)v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (BOOL)isRestrictedGuestInAllowedPeriod
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  -[HMHomeAccessControl restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guestAccessSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[HMAccessControl user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeAccessControl restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "guestAccessSchedule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[HMRestrictedGuestHomeAccessSchedule isDate:withinAllowedTimeForSchedule:forHomeInTimeZone:](HMRestrictedGuestHomeAccessSchedule, "isDate:withinAllowedTimeForSchedule:forHomeInTimeZone:", v12, v14, v11);

  return v15;
}

- (void)updateRestrictedGuestSchedule:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMHomeAccessControl *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMHomeAccessControl restrictedGuestAccessSettings](self, "restrictedGuestAccessSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "setGuestAccessSchedule:", v6);
    v11 = (void *)objc_msgSend(v10, "copy");
    -[HMHomeAccessControl updateRestrictedGuestSettings:completionHandler:](self, "updateRestrictedGuestSettings:completionHandler:", v11, v7);

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
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot update restricted guest schedule, existing accessSettings are nil.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2901);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
  }

}

- (void)updateRestrictedGuestSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMHomeAccessControl *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HMHomeAccessControl *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMHomeAccessControl *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  void *v31;
  HMHomeAccessControl *v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[HMAccessControl user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeAccessControl updateRestrictedGuestSettings:completionHandler:]", CFSTR("completion"));
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
      v37 = v34;
      v38 = 2112;
      v39 = v30;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v30, 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }
  v10 = (void *)v9;
  if (!v8 || (objc_msgSend(v8, "userID"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v18 = (void *)v17;
      v7[2](v7, v17);

      goto LABEL_14;
    }
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v15;
    v16 = "%{public}@Cannot update user access settings, user not present";
LABEL_11:
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    goto LABEL_12;
  }
  if (!v10)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v15;
    v16 = "%{public}@Missing home, can't update user access settings";
    goto LABEL_11;
  }
  if (!-[HMHomeAccessControl isRestrictedGuest](self, "isRestrictedGuest"))
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot update user access settings, user is not a restricted guest", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2901);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!v6)
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v26;
      v27 = "%{public}@Cannot update user access settings, user access settings is nil";
      v28 = v25;
      v29 = 12;
LABEL_24:
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);

    }
LABEL_25:

    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "doAllAccessoriesBelongToHome:", v10) & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v26;
      v38 = 2112;
      v39 = (uint64_t)v10;
      v27 = "%{public}@Cannot update user access settings, not all accessories belong to the home : %@";
      v28 = v25;
      v29 = 22;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  -[HMHomeAccessControl _updateAccessForUser:restrictedGuestAccessSettings:completionHandler:](self, "_updateAccessForUser:restrictedGuestAccessSettings:completionHandler:", v8, v6, v7);
LABEL_14:

}

- (void)_updateAccessForUser:(id)a3 restrictedGuestAccessSettings:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMHomeAccessControl *v16;
  NSObject *v17;
  id v18;
  void *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HMHomeAccessControl *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  HMHomeAccessControl *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[3];
  _QWORD v47[3];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "context");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeAccessControl _updateAccessForUser:restrictedGuestAccessSettings:completionHandler:]", CFSTR("completion"));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v36;
      v50 = 2112;
      v51 = (const char *)v32;
      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v32, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  v13 = (void *)v12;
  if (v12)
  {
    v39 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = v11;
      v18 = v9;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUID");
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v49 = v19;
      v50 = 2112;
      v51 = v20;
      v52 = 2112;
      v53 = v18;
      v54 = 2112;
      v55 = v21;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating restricted guest settings: %@ for userID: %@", buf, 0x2Au);

      v9 = v18;
      v11 = v38;
    }

    objc_autoreleasePoolPop(v15);
    v46[0] = CFSTR("kUserIDKey");
    objc_msgSend(v8, "userID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v22;
    v46[1] = CFSTR("HMRestrictedGuestHomeAccessControlSettingsKey");
    encodeRootObject(v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v23;
    v46[2] = *MEMORY[0x1E0D28010];
    HMFEncodedRootObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __92__HMHomeAccessControl__updateAccessForUser_restrictedGuestAccessSettings_completionHandler___block_invoke;
    v40[3] = &unk_1E3AAE1D0;
    v40[4] = v16;
    v41 = v14;
    v42 = v8;
    v43 = v39;
    v45 = v10;
    v44 = v9;
    v27 = v14;
    v13 = v39;
    -[_HMContext sendMessage:target:payload:responseHandler:](v43, CFSTR("HMUpdateRestrictedGuestSettingsMessage"), v26, v25, v40);

  }
  else
  {
    v28 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v31;
      v50 = 2080;
      v51 = "-[HMHomeAccessControl _updateAccessForUser:restrictedGuestAccessSettings:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v25);
  }

}

- (void)setRestrictedGuestAccessSettings:(id)a3
{
  objc_storeStrong((id *)&self->_accessNotAllowedReasonCode, a3);
}

- (unint64_t)accessNotAllowedReasonCode
{
  return self->_audioAnalysisUserDropInAccessLevel;
}

- (void)setAccessNotAllowedReasonCode:(unint64_t)a3
{
  self->_audioAnalysisUserDropInAccessLevel = a3;
}

- (void)setRestrictedGuestInAllowedPeriod:(BOOL)a3
{
  BYTE2(self->_presenceAuthStatus) = a3;
}

- (void)setAudioAnalysisUserDropInAccessLevel:(unint64_t)a3
{
  self[1].super.super.isa = (Class)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessNotAllowedReasonCode, 0);
  objc_storeStrong((id *)&self->_restrictedGuestAccessSettings, 0);
  objc_storeStrong((id *)&self->_camerasAccess, 0);
  objc_storeStrong((id *)&self->_presenceComputeStatus, 0);
}

void __92__HMHomeAccessControl__updateAccessForUser_restrictedGuestAccessSettings_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "userID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138544130;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update restricted guest settings for userID:%@, error: %@", (uint8_t *)&v24, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 56), "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 72);
    v16 = v5;
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 32), "setRestrictedGuestAccessSettings:", *(_QWORD *)(a1 + 64)));
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "userID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 64);
      v24 = 138544130;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully updated restricted guest settings for userID:%@, settings: %@", (uint8_t *)&v24, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(*(id *)(a1 + 56), "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 72);
    v16 = 0;
  }
  objc_msgSend(v13, "callCompletion:error:", v15, v16);

}

@end
