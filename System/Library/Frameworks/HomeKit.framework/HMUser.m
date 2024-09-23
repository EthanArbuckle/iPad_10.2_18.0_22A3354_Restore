@implementation HMUser

- (HMHomeAccessControl)homeAccessControl
{
  os_unfair_lock_s *p_lock;
  HMHomeAccessControl *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_homeAccessControl;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMUser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  HMSettingsController *settingsController;
  void *privateSettingsController;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
    v22 = 138543618;
    v23 = v11;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMUser setHome:](v9, "setHome:", v7);
  -[HMUser setContext:](v9, "setContext:", v6);
  objc_msgSend(v7, "homeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDaemonRunningWithROARFramework");

  if (v13)
  {
    -[HMUser pendingPrivateSettings](v9, "pendingPrivateSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser createConfigureAndMergePrivateSettingsIfNecessary:withContext:](v9, "createConfigureAndMergePrivateSettingsIfNecessary:withContext:", v14, v6);

    -[HMUser setPendingPrivateSettings:](v9, "setPendingPrivateSettings:", 0);
    -[HMUser pendingSharedSettings](v9, "pendingSharedSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser createConfigureAndMergeSharedSettingsIfNecessary:withContext:](v9, "createConfigureAndMergeSharedSettingsIfNecessary:withContext:", v15, v6);

    -[HMUser setPendingSharedSettings:](v9, "setPendingSharedSettings:", 0);
    settingsController = v9->_settingsController;
    v9->_settingsController = 0;

    privateSettingsController = v9->_privateSettingsController;
    v9->_privateSettingsController = 0;
  }
  else
  {
    -[HMUser createHH1SettingsControllerIfNecessary](v9, "createHH1SettingsControllerIfNecessary");
    -[HMUser createHH1PrivateSettingsControllerIfNecessary](v9, "createHH1PrivateSettingsControllerIfNecessary");
    -[HMUser settingsController](v9, "settingsController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configureWithContext:", v6);

    -[HMUser privateSettingsController](v9, "privateSettingsController");
    privateSettingsController = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(privateSettingsController, "configureWithContext:", v6);
  }

  -[HMUser photosPersonManagerSettings](v9, "photosPersonManagerSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUser configurePhotosPersonManagerWithSettings:](v9, "configurePhotosPersonManagerWithSettings:", v19);

  -[HMUser _registerNotificationHandlers](v9, "_registerNotificationHandlers");
  -[HMUser homeAccessControl](v9, "homeAccessControl");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "restrictedGuestAccessSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fixupAccessoriesForHome:", v7);

}

- (HMSettings)settings
{
  void *v3;
  void *v4;
  void *v5;

  -[HMUser sharedSettingsAdapter](self, "sharedSettingsAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HMUser sharedSettingsAdapter](self, "sharedSettingsAdapter");
  else
    -[HMUser settingsController](self, "settingsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMSettings *)v5;
}

- (HMSettings)privateSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[HMUser privateSettingsAdapter](self, "privateSettingsAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HMUser privateSettingsAdapter](self, "privateSettingsAdapter");
  else
    -[HMUser privateSettingsController](self, "privateSettingsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMSettings *)v5;
}

- (HMSettingsController)privateSettingsController
{
  return (HMSettingsController *)objc_getProperty(self, a2, 168, 1);
}

- (HMUserSettingsAdapter)privateSettingsAdapter
{
  return (HMUserSettingsAdapter *)objc_getProperty(self, a2, 176, 1);
}

- (HMSettingsController)settingsController
{
  return (HMSettingsController *)objc_getProperty(self, a2, 160, 1);
}

- (HMUserSettingsAdapter)sharedSettingsAdapter
{
  return (HMUserSettingsAdapter *)objc_getProperty(self, a2, 184, 1);
}

- (void)configurePhotosPersonManagerWithSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMUser *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMUser *v12;
  NSObject *v13;
  void *v14;
  HMPhotosPersonManager *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isImportingFromPhotoLibraryEnabled")
    && (-[HMUser photosPersonManager](self, "photosPersonManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating photos person manager because importing from photo library is enabled", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v15 = -[HMPhotosPersonManager initWithUser:]([HMPhotosPersonManager alloc], "initWithUser:", v12);
    -[HMUser setPhotosPersonManager:](v12, "setPhotosPersonManager:", v15);

    -[HMUser photosPersonManager](v12, "photosPersonManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configure");

  }
  else if ((objc_msgSend(v4, "isImportingFromPhotoLibraryEnabled") & 1) == 0)
  {
    -[HMUser photosPersonManager](self, "photosPersonManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1A1AC1AAC]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v10;
        _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Destroying photos person manager because importing from photo library is disabled", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      -[HMUser setPhotosPersonManager:](v8, "setPhotosPersonManager:", 0);
    }
  }

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

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (HMPhotosPersonManager)photosPersonManager
{
  os_unfair_lock_s *p_lock;
  HMPhotosPersonManager *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_photosPersonManager;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMPhotosPersonManagerSettings)photosPersonManagerSettings
{
  os_unfair_lock_s *p_lock;
  HMPhotosPersonManagerSettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_photosPersonManagerSettings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMUser)initWithUserID:(id)a3 name:(id)a4 uuid:(id)a5 home:(id)a6 homeAccessControl:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMHomeAccessControl *v16;
  HMUser *v17;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *userID;
  uint64_t v22;
  NSUUID *uuid;
  void *v24;
  uint64_t v25;
  HMMutableArray *pendingAccessoryInvitations;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (HMHomeAccessControl *)a7;
  v30.receiver = self;
  v30.super_class = (Class)HMUser;
  v17 = -[HMUser init](&v30, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    name = v17->_name;
    v17->_name = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
    userID = v17->_userID;
    v17->_userID = (NSString *)v20;

    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v14);
    v22 = objc_claimAutoreleasedReturnValue();
    uuid = v17->_uuid;
    v17->_uuid = (NSUUID *)v22;

    objc_storeWeak((id *)&v17->_home, v15);
    v17->_currentUser = 0;
    -[HMUser createHH1SettingsControllerIfNecessary](v17, "createHH1SettingsControllerIfNecessary");
    -[HMUser createHH1PrivateSettingsControllerIfNecessary](v17, "createHH1PrivateSettingsControllerIfNecessary");
    if (!v16)
    {
      +[HMUserCameraAccess accessWithValue:](HMUserCameraAccess, "accessWithValue:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v29) = 0;
      LOBYTE(v28) = 0;
      v16 = -[HMHomeAccessControl initWithUser:allowAccess:owner:administratorPrivilege:remoteAccess:presenceAuthStatus:presenceComputeStatus:announceAccess:camerasAccess:audioAnalysisUserDropInAccessLevel:restrictedGuest:restrictedGuestAccessSettings:]([HMHomeAccessControl alloc], "initWithUser:allowAccess:owner:administratorPrivilege:remoteAccess:presenceAuthStatus:presenceComputeStatus:announceAccess:camerasAccess:audioAnalysisUserDropInAccessLevel:restrictedGuest:restrictedGuestAccessSettings:", v17, 1, 0, 0, 1, 0, 0, v28, v24, 0, v29, 0);

    }
    objc_storeStrong((id *)&v17->_homeAccessControl, v16);
    +[HMMutableArray array](HMMutableArray, "array");
    v25 = objc_claimAutoreleasedReturnValue();
    pendingAccessoryInvitations = v17->_pendingAccessoryInvitations;
    v17->_pendingAccessoryInvitations = (HMMutableArray *)v25;

  }
  return v17;
}

- (void)createHH1SettingsControllerIfNecessary
{
  HMSettingsController *v3;
  NSUUID *uuid;
  void *v5;
  HMSettingsController *v6;
  HMSettingsController *settingsController;
  id WeakRetained;

  if (!self->_settingsController)
  {
    v3 = [HMSettingsController alloc];
    uuid = self->_uuid;
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    objc_msgSend(WeakRetained, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HMSettingsController initWithParentIdentifier:homeUUID:codingKey:](v3, "initWithParentIdentifier:homeUUID:codingKey:", uuid, v5, CFSTR("HMS.settings.shared"));
    settingsController = self->_settingsController;
    self->_settingsController = v6;

  }
}

- (void)createHH1PrivateSettingsControllerIfNecessary
{
  HMSettingsController *v3;
  NSUUID *uuid;
  void *v5;
  HMSettingsController *v6;
  HMSettingsController *privateSettingsController;
  id WeakRetained;

  if (!self->_privateSettingsController)
  {
    v3 = [HMSettingsController alloc];
    uuid = self->_uuid;
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    objc_msgSend(WeakRetained, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HMSettingsController initWithParentIdentifier:homeUUID:codingKey:](v3, "initWithParentIdentifier:homeUUID:codingKey:", uuid, v5, CFSTR("HMS.settings.private"));
    privateSettingsController = self->_privateSettingsController;
    self->_privateSettingsController = v6;

  }
}

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HMUser context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMU.au"), self, sel__handleUpdatedAssistantAccessControl_);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUser home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleMultiUserStatusChangedNotification_, CFSTR("HMHomeMultiUserEnabledChangeNotificationKey"), v7);

  -[HMUser context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:selector:", CFSTR("HM.u.rg.start"), self, sel__handleRGAllowedPeriodStarted_);

  -[HMUser context](self, "context");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:selector:", CFSTR("HM.u.rg.end"), self, sel__handleRGAllowedPeriodEnded_);

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMUser context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 216, 1);
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

- (BOOL)needsiTunesMultiUserRepair
{
  return self->_needsiTunesMultiUserRepair;
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
  return self->_uuid;
}

- (void)setCurrentUser:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_currentUser = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __21__HMUser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v89;
  logCategory__hmf_once_v89 = v0;

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t88 != -1)
    dispatch_once(&logCategory__hmf_once_t88, &__block_literal_global_38412);
  return (id)logCategory__hmf_once_v89;
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

- (HMAnnounceUserSettings)announceUserSettings
{
  os_unfair_lock_s *p_lock;
  HMAnnounceUserSettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_announceUserSettings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updatePhotosPersonManagerSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMUser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMUser *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  HMUser *v32;
  id v33;
  id v34;
  id v35;
  const __CFString *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMUser context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Update photos person manager settings"));
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v13;
      v40 = 2114;
      v41 = v15;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Updating photos person manager settings: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v36 = CFSTR("HMU.mk.ppms");
    encodeRootObject(v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMUser uuid](v11, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMU.m.uppms"), v20, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __63__HMUser_Person__updatePhotosPersonManagerSettings_completion___block_invoke;
    v31 = &unk_1E3AB4B08;
    v32 = v11;
    v33 = v9;
    v34 = v6;
    v35 = v7;
    v22 = v9;
    objc_msgSend(v21, "setResponseHandler:", &v28);
    objc_msgSend(v8, "messageDispatcher", v28, v29, v30, v31, v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendMessage:completionHandler:", v21, 0);

    goto LABEL_9;
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
    v39 = v27;
    v40 = 2080;
    v41 = "-[HMUser(Person) updatePhotosPersonManagerSettings:completion:]";
    _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
LABEL_9:

  }
}

void __63__HMUser_Person__updatePhotosPersonManagerSettings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to update photos person manager settings: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully updated photos person manager settings", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "setPhotosPersonManagerSettings:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegateCaller");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

- (HMUser)init
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

- (HMUser)initWithUserID:(id)a3 name:(id)a4 uuid:(id)a5 home:(id)a6
{
  return -[HMUser initWithUserID:name:uuid:home:homeAccessControl:](self, "initWithUserID:name:uuid:home:homeAccessControl:", a3, a4, a5, a6, 0);
}

- (void)_unconfigureContext
{
  void *v3;
  void *v4;
  _HMContext *context;

  -[_HMContext messageDispatcher](self->_context, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  HMUser *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  HMHomeAccessControl *homeAccessControl;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
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
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring user", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMUser setHome:](v5, "setHome:", 0);
    homeAccessControl = v5->_homeAccessControl;
    v5->_homeAccessControl = 0;

    -[HMUser _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHomeAccessControl:(id)a3
{
  HMHomeAccessControl *v4;
  HMHomeAccessControl *homeAccessControl;

  v4 = (HMHomeAccessControl *)a3;
  os_unfair_lock_lock_with_options();
  homeAccessControl = self->_homeAccessControl;
  self->_homeAccessControl = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateHomeAccessControl:(BOOL)a3 remoteAccess:(BOOL)a4 announceAccess:(BOOL)a5 camerasAccess:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  -[HMUser homeAccessControl](self, "homeAccessControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdministrator:", v8);

  -[HMUser homeAccessControl](self, "homeAccessControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteAccessAllowed:", v7);

  -[HMUser homeAccessControl](self, "homeAccessControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCamerasAccess:", v10);

  -[HMUser homeAccessControl](self, "homeAccessControl");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAnnounceAccessAllowed:", v6);

}

- (void)_handleMultiUserStatusChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMUser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying settings delegate of update on multi-user status change.", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMUser settingsController](v6, "settingsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyDelegateOfUpdate");

  -[HMUser privateSettingsController](v6, "privateSettingsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyDelegateOfUpdate");

}

- (HMFPairingIdentity)pairingIdentity
{
  os_unfair_lock_s *p_lock;
  HMFPairingIdentity *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_pairingIdentity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPairingIdentity:(id)a3
{
  id obj;

  objc_msgSend(a3, "publicPairingIdentity");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_pairingIdentity, obj);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (HMAssistantAccessControl)assistantAccessControl
{
  os_unfair_lock_s *p_lock;
  HMAssistantAccessControl *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_assistantAccessControl;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssistantAccessControl:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(v5, "copy");
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_assistantAccessControl, v4);
  objc_msgSend(v4, "setUser:", self);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)updateAssistantAccessControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HMUser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMUser *v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUser updateAssistantAccessControl:forHome:completionHandler:]", CFSTR("completionHandler"));
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
      v33 = v25;
      v34 = 2112;
      v35 = (const char *)v21;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  v11 = (void (**)(_QWORD, _QWORD))v10;
  v12 = (void *)objc_msgSend(v8, "copy");
  -[HMUser context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_12;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke;
    block[3] = &unk_1E3AB52E0;
    block[4] = self;
    v31 = v11;
    v28 = v9;
    v29 = v12;
    v30 = v14;
    dispatch_async(v15, block);

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
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      v34 = 2080;
      v35 = "-[HMUser updateAssistantAccessControl:forHome:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v20);

  }
}

- (void)_handleRGAllowedPeriodStarted:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (self)
  {
    -[HMUser home](self, "home");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[HMUser context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[HMUser delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE45A2F0))
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMUser context](self, "context");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "queue");
          v13 = objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __40__HMUser__handleRGAllowedPeriodStarted___block_invoke;
          v14[3] = &unk_1E3AB5ED8;
          v14[4] = self;
          v15 = v11;
          dispatch_async(v13, v14);

        }
      }
    }
  }

}

- (void)_handleRGAllowedPeriodEnded:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (self)
  {
    -[HMUser home](self, "home");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[HMUser context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[HMUser delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE45A2F0))
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMUser context](self, "context");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "queue");
          v13 = objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __38__HMUser__handleRGAllowedPeriodEnded___block_invoke;
          v14[3] = &unk_1E3AB5ED8;
          v14[4] = self;
          v15 = v11;
          dispatch_async(v13, v14);

        }
      }
    }
  }

}

- (void)_handleUpdatedAssistantAccessControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMUser *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  HMUser *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMUser *v40;
  NSObject *v41;
  void *v42;
  HMUser *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  HMUser *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  HMUser *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  HMUser *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  HMUser *v73;
  uint64_t v74;
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMUser context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retrieveCompletionBlockForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_2:
    objc_msgSend(v4, "respondWithPayload:", 0);
    goto LABEL_3;
  }
  objc_msgSend(v4, "dataForKey:", CFSTR("assistantAC"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v83 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v83);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v83;
    v73 = self;
    if (v11)
    {
      objc_msgSend(v4, "arrayForKey:", CFSTR("accessories"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = v13;
        v69 = v11;
        v70 = v12;
        v71 = v10;
        v72 = v4;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v80;
          v74 = *(_QWORD *)v80;
          v75 = v16;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v80 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v21);
              if (v22)
              {
                -[HMUser home](self, "home");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "accessoryWithUUID:", v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                {
                  objc_msgSend(v15, "addObject:", v24);
                }
                else
                {
                  v25 = v15;
                  v26 = (void *)MEMORY[0x1A1AC1AAC]();
                  v27 = self;
                  HMFGetOSLogHandle();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v86 = v29;
                    v87 = 2112;
                    v88 = v21;
                    _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Unable to find accessory with identifier: %@", buf, 0x16u);

                    self = v73;
                  }

                  objc_autoreleasePoolPop(v26);
                  v15 = v25;
                  v19 = v74;
                  v16 = v75;
                }

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
          }
          while (v18);
        }

        if (objc_msgSend(v15, "count"))
        {
          v30 = (void *)objc_msgSend(v69, "mutableCopy");
          objc_msgSend(v30, "setAccessories:", v15);
          v31 = objc_msgSend(v30, "copy");

          v32 = v71;
          v8 = 0;
        }
        else
        {
          v32 = v71;
          v8 = 0;
          v31 = (uint64_t)v69;
        }

        -[HMUser assistantAccessControl](self, "assistantAccessControl");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)v31;
        v49 = HMFEqualObjects();

        v50 = (void *)MEMORY[0x1A1AC1AAC]();
        v51 = self;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v52;
        if ((v49 & 1) != 0)
        {
          v4 = v72;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v86 = v54;
            _os_log_impl(&dword_19B1B0000, v53, OS_LOG_TYPE_INFO, "%{public}@Assistant access control did not change. Don't need to notify.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v50);
          v55 = v48;
        }
        else
        {
          v55 = v48;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v86 = v56;
            v87 = 2112;
            v88 = v48;
            _os_log_impl(&dword_19B1B0000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Updated assistant access control: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v50);
          -[HMUser setAssistantAccessControl:](v51, "setAssistantAccessControl:", v48);
          -[HMUser home](v51, "home");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
          {
            -[HMUser context](v51, "context");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v58;
            if (v58)
            {
              objc_msgSend(v58, "delegateCaller");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v76[0] = MEMORY[0x1E0C809B0];
              v76[1] = 3221225472;
              v76[2] = __47__HMUser__handleUpdatedAssistantAccessControl___block_invoke;
              v76[3] = &unk_1E3AB5CD0;
              v76[4] = v51;
              v77 = v48;
              v78 = v57;
              objc_msgSend(v60, "invokeBlock:", v76);

            }
            else
            {
              v65 = (void *)MEMORY[0x1A1AC1AAC]();
              v66 = v51;
              HMFGetOSLogHandle();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v86 = v68;
                v87 = 2112;
                v88 = v48;
                _os_log_impl(&dword_19B1B0000, v67, OS_LOG_TYPE_ERROR, "%{public}@Nil context. Cannot notify delegate of updated assistant access control: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v65);
              v55 = v48;
            }

          }
          else
          {
            v61 = (void *)MEMORY[0x1A1AC1AAC]();
            v62 = v51;
            HMFGetOSLogHandle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v86 = v64;
              _os_log_impl(&dword_19B1B0000, v63, OS_LOG_TYPE_ERROR, "%{public}@No home found to perform callback on.", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v61);
            v55 = v48;
          }

          v4 = v72;
        }

        goto LABEL_2;
      }
      v39 = (void *)MEMORY[0x1A1AC1AAC]();
      v43 = self;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v44 = v11;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v86 = v42;
        v87 = 2112;
        v88 = v45;
        _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Missing updated access control accessories from message payload: %@", buf, 0x16u);

        v11 = v44;
        goto LABEL_30;
      }
    }
    else
    {
      v39 = (void *)MEMORY[0x1A1AC1AAC]();
      v40 = self;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v86 = v42;
        v87 = 2112;
        v88 = v12;
        _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive assistant access control from access control data: %@", buf, 0x16u);
LABEL_30:

      }
    }

    objc_autoreleasePoolPop(v39);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v46);

    goto LABEL_3;
  }
  v33 = (void *)MEMORY[0x1A1AC1AAC]();
  v34 = self;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v86 = v36;
    v87 = 2112;
    v88 = v37;
    _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Missing updated serialized access control from message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v33);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v38);

LABEL_3:
}

- (void)updateAnnounceUserSettings:(id)a3 forHome:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HMUser *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMUser *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUser updateAnnounceUserSettings:forHome:completionHandler:]", CFSTR("completionHandler"));
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
      v32 = v24;
      v33 = 2112;
      v34 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v11 = (void (**)(_QWORD, _QWORD))v10;
  -[HMUser context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_12;
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke;
    block[3] = &unk_1E3AB52E0;
    block[4] = self;
    v30 = v11;
    v27 = v9;
    v28 = v8;
    v29 = v13;
    dispatch_async(v14, block);

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v18;
      v33 = 2080;
      v34 = "-[HMUser updateAnnounceUserSettings:forHome:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v19);

  }
}

- (void)setAnnounceUserSettings:(id)a3
{
  HMAnnounceUserSettings *v4;
  HMAnnounceUserSettings *announceUserSettings;

  v4 = (HMAnnounceUserSettings *)a3;
  os_unfair_lock_lock_with_options();
  announceUserSettings = self->_announceUserSettings;
  self->_announceUserSettings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)assistantAccessControlForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMUser *v10;
  SEL v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[HMUser home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      -[HMUser assistantAccessControl](self, "assistantAccessControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    return v8;
  }
  else
  {
    v10 = (HMUser *)_HMFPreconditionFailure();
    return -[HMUser mediaContentProfileAccessControl](v10, v11);
  }
}

- (HMMediaContentProfileAccessControl)mediaContentProfileAccessControl
{
  os_unfair_lock_s *p_lock;
  HMMediaContentProfileAccessControl *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaContentProfileAccessControl;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMediaContentProfileAccessControl:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(v5, "copy");
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControl, v4);
  objc_msgSend(v4, "setUser:", self);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)mediaContentProfileAccessControlForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id result;
  HMUser *v10;
  SEL v11;
  id v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[HMUser home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      -[HMUser mediaContentProfileAccessControl](self, "mediaContentProfileAccessControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    return v8;
  }
  else
  {
    v10 = (HMUser *)_HMFPreconditionFailure();
    -[HMUser updateMediaContentProfileAccessControl:forHome:completionHandler:](v10, v11, v12, v13, v14);
  }
  return result;
}

- (void)updateMediaContentProfileAccessControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HMUser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMUser *v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUser updateMediaContentProfileAccessControl:forHome:completionHandler:]", CFSTR("completionHandler"));
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
      v33 = v25;
      v34 = 2112;
      v35 = (const char *)v21;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  v11 = (void (**)(_QWORD, _QWORD))v10;
  v12 = (void *)objc_msgSend(v8, "copy");
  -[HMUser context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_12;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke;
    block[3] = &unk_1E3AB52E0;
    block[4] = self;
    v31 = v11;
    v28 = v9;
    v29 = v12;
    v30 = v14;
    dispatch_async(v15, block);

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
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      v34 = 2080;
      v35 = "-[HMUser updateMediaContentProfileAccessControl:forHome:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v20);

  }
}

- (HMUserListeningHistoryUpdateControl)userListeningHistoryUpdateControl
{
  os_unfair_lock_s *p_lock;
  HMUserListeningHistoryUpdateControl *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_userListeningHistoryUpdateControl;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUserListeningHistoryUpdateControl:(id)a3
{
  HMUserListeningHistoryUpdateControl *v4;
  HMUserListeningHistoryUpdateControl *userListeningHistoryUpdateControl;

  v4 = (HMUserListeningHistoryUpdateControl *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock_with_options();
  userListeningHistoryUpdateControl = self->_userListeningHistoryUpdateControl;
  self->_userListeningHistoryUpdateControl = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)userListeningHistoryUpdateControlForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id result;
  HMUser *v10;
  SEL v11;
  id v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[HMUser home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      -[HMUser userListeningHistoryUpdateControl](self, "userListeningHistoryUpdateControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    return v8;
  }
  else
  {
    v10 = (HMUser *)_HMFPreconditionFailure();
    -[HMUser updateUserListeningHistoryUpdateControl:forHome:completionHandler:](v10, v11, v12, v13, v14);
  }
  return result;
}

- (void)updateUserListeningHistoryUpdateControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  HMUser *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  HMUser *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMUser *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
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
      v39 = v19;
      v20 = "%{public}@nil home value on ULH update";
LABEL_10:
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v16);
    -[HMUser context](v17, "context");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "callCompletion:error:", v10, v21);

    goto LABEL_12;
  }
  if (!v8)
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
      v39 = v19;
      v20 = "%{public}@nil ULH value on ULH update";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v11 = (id)objc_msgSend(v8, "copy");
  -[HMUser context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUser updateUserListeningHistoryUpdateControl:forHome:completionHandler:]", CFSTR("completionHandler"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v31;
      v40 = 2112;
      v41 = (const char *)v27;
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v27, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke;
    block[3] = &unk_1E3AB52E0;
    block[4] = self;
    v37 = v10;
    v34 = v9;
    v11 = v11;
    v35 = v11;
    v15 = v13;
    v36 = v15;
    dispatch_async(v14, block);

  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v25;
      v40 = 2080;
      v41 = "-[HMUser updateUserListeningHistoryUpdateControl:forHome:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v26);

    v15 = 0;
  }
LABEL_12:

}

- (NSString)userID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_userID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUserID:(id)a3
{
  NSString *v4;
  NSString *userID;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  userID = self->_userID;
  self->_userID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (IDSURI)userIDSURI
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMUser userID](self, "userID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_8;
  if (!IDSFoundationLibraryCore_frameworkLibrary_38350)
  {
    v12 = xmmword_1E3AB3B10;
    v13 = 0;
    IDSFoundationLibraryCore_frameworkLibrary_38350 = _sl_dlopen();
  }
  if (IDSFoundationLibraryCore_frameworkLibrary_38350)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v3 = (void *)getIDSURIClass_softClass;
    v11 = getIDSURIClass_softClass;
    if (!getIDSURIClass_softClass)
    {
      *(_QWORD *)&v12 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v12 + 1) = 3221225472;
      v13 = __getIDSURIClass_block_invoke;
      v14 = &unk_1E3AB4620;
      v15 = &v8;
      __getIDSURIClass_block_invoke((uint64_t)&v12);
      v3 = (void *)v9[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v8, 8);
    v5 = [v4 alloc];
    v6 = (void *)objc_msgSend(v5, "initWithUnprefixedURI:", v2, v8);
  }
  else
  {
LABEL_8:
    v6 = 0;
  }

  return (IDSURI *)v6;
}

- (BOOL)isCurrentUser
{
  HMUser *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_currentUser;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)senderCorrelationIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_senderCorrelationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)pendingAccessoryInvitations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray array](self->_pendingAccessoryInvitations, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_filterAccessoryInvitationsFromOutgoingInvitation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "accessoryInvitations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "state") != 1)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setPendingAccessoryInvitationsWithOutgoingInvitation:(id)a3
{
  os_unfair_lock_s *p_lock;
  HMMutableArray *pendingAccessoryInvitations;
  void *v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  pendingAccessoryInvitations = self->_pendingAccessoryInvitations;
  -[HMUser _filterAccessoryInvitationsFromOutgoingInvitation:](self, "_filterAccessoryInvitationsFromOutgoingInvitation:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMutableArray setArray:](pendingAccessoryInvitations, "setArray:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)mergePendingAccessoryInvitationsWithOutgoingInvitation:(id)a3
{
  HMUser *v3;
  void *v4;

  v3 = self;
  -[HMUser _filterAccessoryInvitationsFromOutgoingInvitation:](self, "_filterAccessoryInvitationsFromOutgoingInvitation:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[HMUser _mergeWithNewAccessoryInvitations:](v3, "_mergeWithNewAccessoryInvitations:", v4);

  return (char)v3;
}

- (void)updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMUser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMUser *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  unint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMUser context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUser updatePresenceAuthorizationStatus:completionHandler:]", CFSTR("completion"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__HMUser_updatePresenceAuthorizationStatus_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5668;
    block[4] = self;
    v23 = a3;
    v22 = v6;
    dispatch_async(v9, block);

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
      v25 = v13;
      v26 = 2080;
      v27 = "-[HMUser updatePresenceAuthorizationStatus:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v14);

  }
}

- (void)_updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[HMUser home](self, "home");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMUser userID](self, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateForUser:presenceAuthorizationStatus:completionHandler:", v7, a3, v6);

}

- (void)pairingIdentityWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMUser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMUser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMUser *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  HMUser *v32;
  id v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMUser context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4)
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
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v27);
    }
    if (CFPreferencesGetAppBooleanValue(CFSTR("kHMDDemoModeStatusKey"), CFSTR("com.apple.homed"), 0))
    {
      v6 = (void *)MEMORY[0x1A1AC1AAC]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v9;
        _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@pairingIdentityWithCompletionHandler completing with nil because demo mode is on.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
    else
    {
      v34 = CFSTR("kUserUUIDKey");
      -[HMUser uuid](self, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x1E0D285F8]);
      v18 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMUser uuid](self, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);
      v21 = (void *)objc_msgSend(v17, "initWithName:destination:payload:", CFSTR("HM.u.pairingIdentity"), v20, v16);

      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __47__HMUser_pairingIdentityWithCompletionHandler___block_invoke;
      v31 = &unk_1E3AB59B8;
      v32 = self;
      v33 = v4;
      objc_msgSend(v21, "setResponseHandler:", &v28);
      objc_msgSend(v5, "messageDispatcher", v28, v29, v30, v31, v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendMessage:", v21);

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
      v37 = v13;
      v38 = 2080;
      v39 = "-[HMUser pairingIdentityWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)fetchAllPairingIdentitiesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMUser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMUser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMUser *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  HMUser *v32;
  id v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMUser context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4)
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
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v27);
    }
    if (CFPreferencesGetAppBooleanValue(CFSTR("kHMDDemoModeStatusKey"), CFSTR("com.apple.homed"), 0))
    {
      v6 = (void *)MEMORY[0x1A1AC1AAC]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v9;
        _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@fetchAllPairingIdentitiesWithCompletionHandler completing with empty array because demo mode is on.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AA60], 0);
    }
    else
    {
      v34 = CFSTR("kUserUUIDKey");
      -[HMUser uuid](self, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x1E0D285F8]);
      v18 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMUser uuid](self, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);
      v21 = (void *)objc_msgSend(v17, "initWithName:destination:payload:", CFSTR("HM.u.legacy.pairingIdentities"), v20, v16);

      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __57__HMUser_fetchAllPairingIdentitiesWithCompletionHandler___block_invoke;
      v31 = &unk_1E3AB59B8;
      v32 = self;
      v33 = v4;
      objc_msgSend(v21, "setResponseHandler:", &v28);
      objc_msgSend(v5, "messageDispatcher", v28, v29, v30, v31, v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendMessage:", v21);

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
      v37 = v13;
      v38 = 2080;
      v39 = "-[HMUser fetchAllPairingIdentitiesWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)fetchShareLookupInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMUser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMUser *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  HMUser *v29;
  id v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
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
      v34 = v23;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v5 = v4;
  -[HMUser context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v31 = CFSTR("kUserUUIDKey");
    -[HMUser uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0D285F8]);
    v11 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMUser uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);
    v14 = (void *)objc_msgSend(v10, "initWithName:destination:payload:", CFSTR("HM.shareLookup"), v13, v9);

    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __31__HMUser_fetchShareLookupInfo___block_invoke;
    v28 = &unk_1E3AB59B8;
    v29 = self;
    v30 = v5;
    objc_msgSend(v14, "setResponseHandler:", &v25);
    objc_msgSend(v6, "messageDispatcher", v25, v26, v27, v28, v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendMessage:", v14);

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
      *(_DWORD *)buf = 138543618;
      v34 = v19;
      v35 = 2080;
      v36 = "-[HMUser fetchShareLookupInfo:]";
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)sendClientShareURL:(id)a3 shareToken:(id)a4 containerID:(id)a5 fromUser:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, uint64_t);
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMUser *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HMUser *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  void (**v57)(id, _QWORD, uint64_t);
  id v58;
  _QWORD v59[6];
  _QWORD v60[6];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  const char *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, uint64_t))a7;
  -[HMUser context](self, "context");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUser sendClientShareURL:shareToken:containerID:fromUser:completion:]", CFSTR("completion"));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x1A1AC1AAC]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v47;
      v63 = 2112;
      v64 = (const char *)v43;
      _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v44);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v43, 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v48);
  }
  v18 = (void *)v17;
  if (!v17)
  {
    v34 = (void *)MEMORY[0x1A1AC1AAC]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v37;
      v63 = 2080;
      v64 = "-[HMUser sendClientShareURL:shareToken:containerID:fromUser:completion:]";
      _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (!v15 || (objc_msgSend(v15, "uuid"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, !v19))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("From user is invalid"), CFSTR("Valid from user is required."), 0);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v21 = (void *)v33;
    v16[2](v16, 0, v33);
    goto LABEL_15;
  }
  -[HMUser home](self, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20 || (objc_msgSend(v20, "uuid"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, !v22))
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v39 = CFSTR("Home is invalid");
    v40 = CFSTR("Valid home not found.");
    v41 = 2;
LABEL_17:
    objc_msgSend(v38, "hmErrorWithCode:description:reason:suggestion:", v41, v39, v40, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, (uint64_t)v42);

    goto LABEL_15;
  }
  if (!v12)
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v39 = CFSTR("Share URL is missing");
    v40 = CFSTR("Need share URL.");
    v41 = 3;
    goto LABEL_17;
  }
  v58 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v58);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v58;
  if (v23)
  {
    v59[0] = CFSTR("HM.u.to");
    -[HMUser uuid](self, "uuid");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "UUIDString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v51;
    v59[1] = CFSTR("HM.u.from");
    objc_msgSend(v15, "uuid");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "UUIDString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v49;
    v60[2] = v23;
    v59[2] = CFSTR("HM.u.url");
    v59[3] = CFSTR("HM.u.token");
    v60[3] = v13;
    v60[4] = v14;
    v59[4] = CFSTR("HM.u.container");
    v59[5] = CFSTR("HM.u.home");
    objc_msgSend(v21, "uuid");
    v53 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v54 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60[5] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 6);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_alloc(MEMORY[0x1E0D285F8]);
    v28 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMUser uuid](self, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithTarget:", v29);
    v31 = (void *)objc_msgSend(v27, "initWithName:destination:payload:", CFSTR("HM.shareClientPayload"), v30, v55);

    v24 = v53;
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __72__HMUser_sendClientShareURL_shareToken_containerID_fromUser_completion___block_invoke;
    v56[3] = &unk_1E3AB3A50;
    v57 = v16;
    objc_msgSend(v31, "setResponseHandler:", v56);
    objc_msgSend(v18, "messageDispatcher");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sendMessage:", v31);

    v23 = v54;
  }
  else
  {
    v16[2](v16, 0, (uint64_t)v24);
  }

LABEL_15:
}

- (void)sendClientShareRepairRequest:(id)a3 containerID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  HMUser *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  HMUser *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  _QWORD v49[4];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMUser context](self, "context");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUser sendClientShareRepairRequest:containerID:completion:]", CFSTR("completion"));
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1A1AC1AAC]();
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v42;
      v52 = 2112;
      v53 = (const char *)v38;
      _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v38, 0);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v43);
  }
  v12 = (void *)v11;
  if (v11)
  {
    -[HMUser home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "uuid"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15))
    {
      objc_msgSend(v14, "currentUser");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "owner");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if ((v18 & 1) != 0)
      {
        if (v8)
        {
          v48[0] = CFSTR("HM.u.to");
          -[HMUser uuid](self, "uuid");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "UUIDString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = v19;
          v49[1] = v9;
          v48[1] = CFSTR("HM.u.container");
          v48[2] = CFSTR("HM.u.home");
          objc_msgSend(v14, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "UUIDString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v49[2] = v21;
          v48[3] = CFSTR("HM.u.repairInfo");
          encodeRootObject(v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v49[3] = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_alloc(MEMORY[0x1E0D285F8]);
          v24 = objc_alloc(MEMORY[0x1E0D285D8]);
          -[HMUser uuid](self, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v24, "initWithTarget:", v25);
          v27 = (void *)objc_msgSend(v23, "initWithName:destination:payload:", CFSTR("HM.shareRepair"), v26, v44);

          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __62__HMUser_sendClientShareRepairRequest_containerID_completion___block_invoke;
          v46[3] = &unk_1E3AB3A50;
          v47 = v10;
          objc_msgSend(v27, "setResponseHandler:", v46);
          objc_msgSend(v12, "messageDispatcher");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "sendMessage:", v27);

          goto LABEL_16;
        }
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v30 = CFSTR("Repair request is missing");
        v31 = CFSTR("Need valid repair request.");
      }
      else
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v30 = CFSTR("Current User is not owner");
        v31 = CFSTR("Can only send from owner user.");
      }
      v32 = 3;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = CFSTR("Home is invalid");
      v31 = CFSTR("Valid home not found.");
      v32 = 2;
    }
    objc_msgSend(v29, "hmErrorWithCode:description:reason:suggestion:", v32, v30, v31, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v37);

    goto LABEL_16;
  }
  v33 = (void *)MEMORY[0x1A1AC1AAC]();
  v34 = self;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v36;
    v52 = 2080;
    v53 = "-[HMUser sendClientShareRepairRequest:containerID:completion:]";
    _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v33);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v14);
LABEL_16:

}

- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id location;
  const __CFString *v25;
  _QWORD v26[2];

  v4 = a3;
  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMUser home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", self);

  if ((v9 & 1) != 0)
  {
    v25 = CFSTR("HM.u.itunesRepair");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0D285F8];
    -[HMUser messageDestination](self, "messageDestination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("HM.itunesRepair"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __51__HMUser_setNeedsiTunesMultiUserRepair_completion___block_invoke;
    v21 = &unk_1E3AB4AE0;
    objc_copyWeak(&v23, &location);
    v22 = v6;
    objc_msgSend(v14, "setResponseHandler:", &v18);
    -[HMUser context](self, "context", v18, v19, v20, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "messageDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendMessage:", v14);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("User is not current user"), CFSTR("Can only set for current user."), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v17);

  }
}

- (void)setPhotosPersonManager:(id)a3
{
  HMPhotosPersonManager *v4;
  HMPhotosPersonManager *photosPersonManager;

  v4 = (HMPhotosPersonManager *)a3;
  os_unfair_lock_lock_with_options();
  photosPersonManager = self->_photosPersonManager;
  self->_photosPersonManager = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPhotosPersonManagerSettings:(id)a3
{
  HMPhotosPersonManagerSettings *v4;
  HMPhotosPersonManagerSettings *photosPersonManagerSettings;
  HMPhotosPersonManagerSettings *v6;

  v4 = (HMPhotosPersonManagerSettings *)a3;
  os_unfair_lock_lock_with_options();
  photosPersonManagerSettings = self->_photosPersonManagerSettings;
  self->_photosPersonManagerSettings = v4;
  v6 = v4;

  os_unfair_lock_unlock(&self->_lock);
  -[HMUser configurePhotosPersonManagerWithSettings:](self, "configurePhotosPersonManagerWithSettings:", v6);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMUser uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMUser)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  HMUser *v12;
  HMUser *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  unint64_t v25;
  void *v26;
  HMUser *v27;
  NSObject *v28;
  void *v29;
  char v30;
  void *v31;
  id *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMHomeAccessControl *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  HMUser *v46;
  void *v47;
  id *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  HMMediaContentProfileAccessControl *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id *v64;
  void *v65;
  HMUserListeningHistoryUpdateControl *v66;
  id v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  HMUser *v91;
  void *v92;
  void *v93;
  char v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[4];
  id *v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  unint64_t v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userUUID"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v101);
  if (!v5)
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v105 = v17;
      v106 = 2112;
      v107 = 0;
      v108 = 2112;
      v109 = v101;
      v18 = "%{public}@Failed to initialize from decoded uuid: %@/%@";
      v19 = v16;
      v20 = 32;
LABEL_26:
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);

    }
LABEL_27:

    objc_autoreleasePoolPop(v15);
    v46 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userDisplayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.isCurrentUser"));
  v8 = v7;
  if (!v6)
  {
    if (v7)
    {
      +[HMLocalization sharedManager](HMLocalization, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getLocalizedString:", CFSTR("CURRENT_USER"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v105 = v17;
      v106 = 2112;
      v107 = 0;
      v108 = 1024;
      LODWORD(v109) = 0;
      v18 = "%{public}@Failed to initialize from decoded name: %@, isCurrentUser: %{BOOL}d";
      v19 = v16;
      v20 = 28;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
LABEL_5:
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMUser initWithUserID:name:uuid:home:](self, "initWithUserID:name:uuid:home:", v10, v6, v5, v11);
  v13 = v12;
  if (v12)
  {
    v12->_currentUser = v8;
    v95 = v10;
    v96 = v6;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.userAccessAllowed")))
      v14 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.userAccessAllowed"));
    else
      v14 = 1;
    v92 = v11;
    v93 = v5;
    v98 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.isOwnerUser"));
    v97 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAdminUser"));
    v21 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.isUserAllowedRemoteAccess"));
    LOBYTE(v5) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.u.announce.access"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDUserAudioAnalysisUserDropInAccessLevelCodingKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    v90 = objc_msgSend(v24, "unsignedIntegerValue");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMHomeAccessControlOverrideCodingKey")))
    {
      v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMHomeAccessControlOverrideCodingKey"));
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = v13;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v105 = v29;
        v106 = 2048;
        v107 = v25;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Overriding Home Access Control for current user to 0x%08lx", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v97 = (v25 >> 1) & 1;
      v98 = (v25 >> 2) & 1;
      v89 = (v25 >> 3) & 1;
      v14 = v25 & 1;
      v5 = (void *)((v25 >> 4) & 1);
    }
    else
    {
      v89 = v21;
    }
    v88 = v14;
    v30 = (char)v5;
    v94 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.u.isRG"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.RG.homeAccessSettings"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1A1AC1AAC]();
    v91 = v13;
    v32 = v13;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v105 = v34;
      v106 = 2112;
      v107 = (unint64_t)v95;
      v108 = 2112;
      v109 = v96;
      v110 = 2112;
      v111 = v35;
      v112 = 2112;
      v113 = v36;
      v114 = 2112;
      v115 = v37;
      v116 = 2112;
      v117 = v38;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_DEBUG, "%{public}@userID: %@, name: %@, isCurrentUser: %@, isOwner: %@, isAdmin: %@, isRG: %@", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v31);
    v39 = [HMHomeAccessControl alloc];
    +[HMUserPresenceAuthorization authWithCoder:](HMUserPresenceAuthorization, "authWithCoder:", v4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMUserPresenceCompute computeWithCoder:](HMUserPresenceCompute, "computeWithCoder:", v4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMUserCameraAccess accessWithCoder:](HMUserCameraAccess, "accessWithCoder:", v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v87) = v94;
    LOBYTE(v86) = v30;
    v43 = -[HMHomeAccessControl initWithUser:allowAccess:owner:administratorPrivilege:remoteAccess:presenceAuthStatus:presenceComputeStatus:announceAccess:camerasAccess:audioAnalysisUserDropInAccessLevel:restrictedGuest:restrictedGuestAccessSettings:](v39, "initWithUser:allowAccess:owner:administratorPrivilege:remoteAccess:presenceAuthStatus:presenceComputeStatus:announceAccess:camerasAccess:audioAnalysisUserDropInAccessLevel:restrictedGuest:restrictedGuestAccessSettings:", v32, v88, v98, v97, v89, v40, v41, v86, v42, v90, v87, v100);
    v44 = v32[7];
    v32[7] = (id)v43;

    if ((v88 & 1) == 0)
    {
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMHomeAccessNotAllowedReasonCodeCodingKey")))
        v45 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMHomeAccessNotAllowedReasonCodeCodingKey"));
      else
        v45 = 1;
      v47 = (void *)MEMORY[0x1A1AC1AAC]();
      v48 = v32;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v105 = v50;
        v106 = 2112;
        v107 = (unint64_t)v51;
        _os_log_impl(&dword_19B1B0000, v49, OS_LOG_TYPE_INFO, "%{public}@Access is not allowed due to : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      objc_msgSend(v32[7], "setAccessNotAllowedReasonCode:", v45);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.assistantAccessControl"));
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v32[8];
    v32[8] = (id)v52;

    v54 = (void *)MEMORY[0x1E0C99E60];
    v55 = objc_opt_class();
    objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("HM.u.mu.accessories"));
    v57 = objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      v58 = -[HMMediaContentProfileAccessControl initWithUser:accessories:]([HMMediaContentProfileAccessControl alloc], "initWithUser:accessories:", v32, v57);
      v59 = v32[9];
      v32[9] = v58;

    }
    v99 = (void *)v57;
    v60 = (void *)MEMORY[0x1E0C99E60];
    v61 = objc_opt_class();
    objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("HM.u.mc.accessories"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __24__HMUser_initWithCoder___block_invoke;
    v102[3] = &unk_1E3AB3AB8;
    v64 = v32;
    v103 = v64;
    objc_msgSend(v63, "na_map:", v102);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      v66 = -[HMUserListeningHistoryUpdateControl initWithAccessories:]([HMUserListeningHistoryUpdateControl alloc], "initWithAccessories:", v65);
      v67 = v64[10];
      v64[10] = v66;

    }
    v13 = v91;
    if (objc_msgSend(v64, "isCurrentUser"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.u.announce.Settings"));
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v64[16];
      v64[16] = (id)v68;

    }
    v70 = (void *)MEMORY[0x1E0C99E60];
    v71 = objc_opt_class();
    v72 = objc_opt_class();
    objc_msgSend(v70, "setWithObjects:", v71, v72, objc_opt_class(), 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v73, CFSTR("HM2.u.s.private"));
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = v64[24];
    v64[24] = (id)v74;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v73, CFSTR("HM2.u.s.shared"));
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = v64[25];
    v64[25] = (id)v76;

    objc_msgSend(v64[20], "decodeWithCoder:", v4);
    objc_msgSend(v64[21], "decodeWithCoder:", v4);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.senderCorrelationIdentifier"));
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = v64[3];
    v64[3] = (id)v78;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.photosPersonManagerSettings"));
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = v64[18];
    v64[18] = (id)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.u.itunesRepair"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v64 + 33) = objc_msgSend(v82, "BOOLValue");

    *((_BYTE *)v64 + 34) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMSettingsContainerSettingsInitializedKey"));
    *((_BYTE *)v64 + 35) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.u.automaticHH2migration"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.pairingIdentity"));
    v83 = objc_claimAutoreleasedReturnValue();
    v84 = v64[13];
    v64[13] = (id)v83;

    v11 = v92;
    v5 = v93;
    v10 = v95;
    v6 = v96;
  }
  self = v13;

  v46 = self;
LABEL_40:

  return v46;
}

- (BOOL)_mergeWithNewAccessoryInvitations:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  HMObjectMergeCollection *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[5];
  _QWORD v16[5];

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMUser pendingAccessoryInvitations](self, "pendingAccessoryInvitations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v6, v4);

  -[HMObjectMergeCollection removedObjects](v7, "removedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__HMUser__mergeWithNewAccessoryInvitations___block_invoke;
  v16[3] = &unk_1E3AB3AE0;
  v16[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);

  -[HMObjectMergeCollection addedObjects](v7, "addedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __44__HMUser__mergeWithNewAccessoryInvitations___block_invoke_250;
  v15[3] = &unk_1E3AB3AE0;
  v15[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  -[HMObjectMergeCollection mergeCommonObjects](v7, "mergeCommonObjects");
  -[HMObjectMergeCollection finalObjects](v7, "finalObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMutableArray setArray:](self->_pendingAccessoryInvitations, "setArray:", v11);

  if (-[HMObjectMergeCollection isModified](v7, "isModified"))
  {
    -[HMUser home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyDelegateOfAccesoryInvitationsUpdateForUser:", self);

  }
  v13 = -[HMObjectMergeCollection isModified](v7, "isModified");

  return v13;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  HMUser *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  HMUser *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  HMUser *v43;
  NSObject *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  char *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  HMUser *v57;
  NSObject *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  char *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  HMUser *v71;
  NSObject *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  char *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  HMUser *v86;
  NSObject *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  char *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  HMUser *v102;
  NSObject *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  char *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  char v116;
  void *v117;
  HMUser *v118;
  NSObject *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  char *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  char v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  int v135;
  void *v136;
  HMUser *v137;
  NSObject *v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  char *v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  void *v148;
  int v149;
  void *v150;
  HMUser *v151;
  NSObject *v152;
  id v153;
  void *v154;
  id v155;
  void *v156;
  char *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  char v166;
  void *v167;
  HMUser *v168;
  NSObject *v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  char *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  HMUser *v182;
  NSObject *v183;
  id v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  char *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  NSObject *v196;
  id v197;
  id v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t i;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  HMUser *v206;
  NSObject *v207;
  id v208;
  void *v209;
  void *v210;
  uint64_t v211;
  void *v212;
  char v213;
  void *v214;
  void *v215;
  id v216;
  void *v217;
  NSObject *v218;
  void *v219;
  HMUser *v220;
  NSObject *v221;
  id v222;
  void *v223;
  char v224;
  char v225;
  void *v226;
  NSObject *v227;
  id v228;
  id v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t j;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  HMUser *v237;
  NSObject *v238;
  id v239;
  void *v240;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  id v246;
  void *v247;
  NSObject *v248;
  void *v249;
  HMUser *v250;
  NSObject *v251;
  id v252;
  void *v253;
  char v254;
  void *v255;
  NSObject *v256;
  id v257;
  id v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t k;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  HMUser *v266;
  NSObject *v267;
  id v268;
  void *v269;
  void *v270;
  uint64_t v271;
  void *v272;
  void *v273;
  void *v274;
  id v275;
  void *v276;
  NSObject *v277;
  void *v278;
  HMUser *v279;
  NSObject *v280;
  id v281;
  HMUser *v282;
  void *v283;
  NSObject *v284;
  void *v285;
  void *v286;
  char v287;
  uint64_t v288;
  NSString *senderCorrelationIdentifier;
  void *v290;
  void *v291;
  char v292;
  void *v293;
  HMUser *v294;
  NSObject *v295;
  id v296;
  void *v297;
  char *v298;
  void *v299;
  void *v300;
  void *v301;
  id v302;
  void *v303;
  NSObject *v304;
  void *v305;
  NSObject *v306;
  int v307;
  void *v308;
  HMUser *v309;
  NSObject *v310;
  id v311;
  void *v312;
  void *v313;
  void *v314;
  id v315;
  void *v316;
  NSObject *v317;
  int v318;
  void *v319;
  HMUser *v320;
  NSObject *v321;
  id v322;
  id v323;
  void *v324;
  void *v325;
  id v326;
  void *v327;
  void *v328;
  _BOOL4 v329;
  unsigned int v330;
  void *v331;
  int v332;
  uint64_t v333;
  void *v334;
  void *v335;
  BOOL v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  BOOL v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  char v350;
  void *v351;
  void *v352;
  void *v354;
  void *v355;
  char v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  int v362;
  HMUser *v363;
  id v364;
  HMUser *v365;
  HMUser *v366;
  HMUser *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  _QWORD v372[4];
  id v373;
  HMUser *v374;
  _QWORD v375[5];
  id v376;
  _QWORD v377[5];
  id v378;
  _QWORD v379[5];
  id v380;
  _QWORD v381[5];
  id v382;
  _QWORD v383[5];
  id v384;
  id v385;
  id v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  _QWORD v391[5];
  id v392;
  id v393;
  id v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  _QWORD block[5];
  id v400;
  id v401;
  id v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  _BYTE v407[128];
  _BYTE v408[128];
  uint8_t v409[128];
  uint8_t buf[4];
  id v411;
  __int16 v412;
  id v413;
  __int16 v414;
  const char *v415;
  uint64_t v416;

  v416 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v355 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v363 = self;
    v364 = v4;
    -[HMUser home](self, "home");
    v371 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser setName:](self, "setName:", v5);

    objc_msgSend(v364, "userID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser setUserID:](self, "setUserID:", v6);

    objc_msgSend(v364, "pendingAccessoryInvitations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser _mergeWithNewAccessoryInvitations:](self, "_mergeWithNewAccessoryInvitations:", v7);

    -[HMUser homeAccessControl](self, "homeAccessControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAccessAllowed");
    objc_msgSend(v364, "homeAccessControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 ^ objc_msgSend(v10, "isAccessAllowed");

    v362 = v11;
    if (v11 == 1)
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = v363;
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v13, "homeAccessControl");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "isAccessAllowed");
        HMFBooleanToString();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "isAccessAllowed");
        HMFBooleanToString();
        v19 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v15;
        v412 = 2112;
        v413 = v17;
        v414 = 2112;
        v415 = v19;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Updated isAccessAllowed from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMUser homeAccessControl](v13, "homeAccessControl");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "homeAccessControl");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAccessAllowed:", objc_msgSend(v21, "isAccessAllowed"));

    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "accessNotAllowedReasonCode");
    objc_msgSend(v364, "homeAccessControl");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = v23 == objc_msgSend(v24, "accessNotAllowedReasonCode");

    if ((v23 & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      v26 = v363;
      HMFGetOSLogHandle();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB37E8];
        -[HMUser homeAccessControl](v26, "homeAccessControl");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "accessNotAllowedReasonCode"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v364, "homeAccessControl");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "accessNotAllowedReasonCode"));
        v34 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v28;
        v412 = 2112;
        v413 = v31;
        v414 = 2112;
        v415 = v34;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Updated access not allowed reason code from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(v364, "homeAccessControl");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "accessNotAllowedReasonCode");
      -[HMUser homeAccessControl](v26, "homeAccessControl");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAccessNotAllowedReasonCode:", v36);

      v362 = 1;
    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isOwner");
    objc_msgSend(v364, "homeAccessControl");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isOwner");

    if (v39 != v41)
    {
      v42 = (void *)MEMORY[0x1A1AC1AAC]();
      v43 = v363;
      HMFGetOSLogHandle();
      v44 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v43, "homeAccessControl");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "isOwner");
        HMFBooleanToString();
        v47 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "isOwner");
        HMFBooleanToString();
        v49 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v45;
        v412 = 2112;
        v413 = v47;
        v414 = 2112;
        v415 = v49;
        _os_log_impl(&dword_19B1B0000, v44, OS_LOG_TYPE_INFO, "%{public}@Updated isOwner from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v42);
      -[HMUser homeAccessControl](v43, "homeAccessControl");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "homeAccessControl");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setOwner:", objc_msgSend(v51, "isOwner"));

      v362 = 1;
    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isAdministrator");
    objc_msgSend(v364, "homeAccessControl");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "isAdministrator");

    if (v53 != v55)
    {
      v56 = (void *)MEMORY[0x1A1AC1AAC]();
      v57 = v363;
      HMFGetOSLogHandle();
      v58 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v59 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v57, "homeAccessControl");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "isAdministrator");
        HMFBooleanToString();
        v61 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "isAdministrator");
        HMFBooleanToString();
        v63 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v59;
        v412 = 2112;
        v413 = v61;
        v414 = 2112;
        v415 = v63;
        _os_log_impl(&dword_19B1B0000, v58, OS_LOG_TYPE_INFO, "%{public}@Updated isAdministrator from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v56);
      -[HMUser homeAccessControl](v57, "homeAccessControl");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "homeAccessControl");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setAdministrator:", objc_msgSend(v65, "isAdministrator"));

      v362 = 1;
    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "isRemoteAccessAllowed");
    objc_msgSend(v364, "homeAccessControl");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "isRemoteAccessAllowed");

    if (v67 != v69)
    {
      v70 = (void *)MEMORY[0x1A1AC1AAC]();
      v71 = v363;
      HMFGetOSLogHandle();
      v72 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v73 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v71, "homeAccessControl");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "isRemoteAccessAllowed");
        HMFBooleanToString();
        v75 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "isRemoteAccessAllowed");
        HMFBooleanToString();
        v77 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v73;
        v412 = 2112;
        v413 = v75;
        v414 = 2112;
        v415 = v77;
        _os_log_impl(&dword_19B1B0000, v72, OS_LOG_TYPE_INFO, "%{public}@Updated isRemoteAccessAllowed from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v70);
      -[HMUser homeAccessControl](v71, "homeAccessControl");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "homeAccessControl");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setRemoteAccessAllowed:", objc_msgSend(v79, "isRemoteAccessAllowed"));

      v362 = 1;
    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "presenceAuthStatus");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "homeAccessControl");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "presenceAuthStatus");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = HMFEqualObjects();

    if ((v84 & 1) == 0)
    {
      v85 = (void *)MEMORY[0x1A1AC1AAC]();
      v86 = v363;
      HMFGetOSLogHandle();
      v87 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v88 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v86, "homeAccessControl");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "presenceAuthStatus");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "presenceAuthStatus");
        v92 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v88;
        v412 = 2112;
        v413 = v90;
        v414 = 2112;
        v415 = v92;
        _os_log_impl(&dword_19B1B0000, v87, OS_LOG_TYPE_INFO, "%{public}@Updated presence auth status from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v85);
      objc_msgSend(v364, "homeAccessControl");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "presenceAuthStatus");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUser homeAccessControl](v86, "homeAccessControl");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setPresenceAuthStatus:", v94);

      v362 = 1;
    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "presenceComputeStatus");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "homeAccessControl");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "presenceComputeStatus");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = HMFEqualObjects();

    if ((v100 & 1) == 0)
    {
      v101 = (void *)MEMORY[0x1A1AC1AAC]();
      v102 = v363;
      HMFGetOSLogHandle();
      v103 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v104 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v102, "homeAccessControl");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "presenceComputeStatus");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "presenceComputeStatus");
        v108 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v104;
        v412 = 2112;
        v413 = v106;
        v414 = 2112;
        v415 = v108;
        _os_log_impl(&dword_19B1B0000, v103, OS_LOG_TYPE_INFO, "%{public}@Updated presence compute status from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v101);
      objc_msgSend(v364, "homeAccessControl");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "presenceComputeStatus");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUser homeAccessControl](v102, "homeAccessControl");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "setPresenceComputeStatus:", v110);

      v362 = 1;
    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "camerasAccess");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "homeAccessControl");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "camerasAccess");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = HMFEqualObjects();

    if ((v116 & 1) == 0)
    {
      v117 = (void *)MEMORY[0x1A1AC1AAC]();
      v118 = v363;
      HMFGetOSLogHandle();
      v119 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v120 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v118, "homeAccessControl");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "camerasAccess");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "camerasAccess");
        v124 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v120;
        v412 = 2112;
        v413 = v122;
        v414 = 2112;
        v415 = v124;
        _os_log_impl(&dword_19B1B0000, v119, OS_LOG_TYPE_INFO, "%{public}@Updated cameras access from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v117);
      objc_msgSend(v364, "homeAccessControl");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "camerasAccess");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUser homeAccessControl](v118, "homeAccessControl");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "setCamerasAccess:", v126);

      v362 = 1;
    }
    -[HMUser announceUserSettings](v363, "announceUserSettings");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "announceUserSettings");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = HMFEqualObjects();

    if ((v130 & 1) == 0)
    {
      objc_msgSend(v364, "announceUserSettings");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUser setAnnounceUserSettings:](v363, "setAnnounceUserSettings:", v131);

    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v132, "isAnnounceAccessAllowed");
    objc_msgSend(v364, "homeAccessControl");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v134, "isAnnounceAccessAllowed");

    if (v133 != v135)
    {
      v136 = (void *)MEMORY[0x1A1AC1AAC]();
      v137 = v363;
      HMFGetOSLogHandle();
      v138 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v139 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v137, "homeAccessControl");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "isAnnounceAccessAllowed");
        HMFBooleanToString();
        v141 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "isAnnounceAccessAllowed");
        HMFBooleanToString();
        v143 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v139;
        v412 = 2112;
        v413 = v141;
        v414 = 2112;
        v415 = v143;
        _os_log_impl(&dword_19B1B0000, v138, OS_LOG_TYPE_INFO, "%{public}@Updated isAnnounceAccessAllowed from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v136);
      -[HMUser homeAccessControl](v137, "homeAccessControl");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "homeAccessControl");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "setAnnounceAccessAllowed:", objc_msgSend(v145, "isAnnounceAccessAllowed"));

      v362 = 1;
    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v146, "isRestrictedGuest");
    objc_msgSend(v364, "homeAccessControl");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "isRestrictedGuest");

    if (v147 != v149)
    {
      v150 = (void *)MEMORY[0x1A1AC1AAC]();
      v151 = v363;
      HMFGetOSLogHandle();
      v152 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v153 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v151, "homeAccessControl");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "isRestrictedGuest");
        HMFBooleanToString();
        v155 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "isRestrictedGuest");
        HMFBooleanToString();
        v157 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v153;
        v412 = 2112;
        v413 = v155;
        v414 = 2112;
        v415 = v157;
        _os_log_impl(&dword_19B1B0000, v152, OS_LOG_TYPE_INFO, "%{public}@Updated isRestrictedGuest from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v150);
      -[HMUser homeAccessControl](v151, "homeAccessControl");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "homeAccessControl");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "setRestrictedGuest:", objc_msgSend(v159, "isRestrictedGuest"));

      v362 = 1;
    }
    objc_msgSend(v364, "homeAccessControl");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "restrictedGuestAccessSettings");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "fixupAccessoriesForHome:", v371);

    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "restrictedGuestAccessSettings");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "homeAccessControl");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "restrictedGuestAccessSettings");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = HMFEqualObjects();

    if ((v166 & 1) == 0)
    {
      v167 = (void *)MEMORY[0x1A1AC1AAC]();
      v168 = v363;
      HMFGetOSLogHandle();
      v169 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v170 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser homeAccessControl](v168, "homeAccessControl");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "restrictedGuestAccessSettings");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "homeAccessControl");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "restrictedGuestAccessSettings");
        v174 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v170;
        v412 = 2112;
        v413 = v172;
        v414 = 2112;
        v415 = v174;
        _os_log_impl(&dword_19B1B0000, v169, OS_LOG_TYPE_INFO, "%{public}@Updated restricted guest access settings from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v167);
      objc_msgSend(v364, "homeAccessControl");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "restrictedGuestAccessSettings");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUser homeAccessControl](v168, "homeAccessControl");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "setRestrictedGuestAccessSettings:", v176);

      v362 = 1;
    }
    -[HMUser homeAccessControl](v363, "homeAccessControl");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend(v178, "audioAnalysisUserDropInAccessLevel");
    objc_msgSend(v364, "homeAccessControl");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v179) = v179 == objc_msgSend(v180, "audioAnalysisUserDropInAccessLevel");

    if ((v179 & 1) == 0)
    {
      v181 = (void *)MEMORY[0x1A1AC1AAC]();
      v182 = v363;
      HMFGetOSLogHandle();
      v183 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v184 = (id)objc_claimAutoreleasedReturnValue();
        v185 = (void *)MEMORY[0x1E0CB37E8];
        -[HMUser homeAccessControl](v182, "homeAccessControl");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "numberWithUnsignedInteger:", objc_msgSend(v186, "audioAnalysisUserDropInAccessLevel"));
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        v188 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v364, "homeAccessControl");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "numberWithUnsignedInteger:", objc_msgSend(v189, "audioAnalysisUserDropInAccessLevel"));
        v190 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v184;
        v412 = 2112;
        v413 = v187;
        v414 = 2112;
        v415 = v190;
        _os_log_impl(&dword_19B1B0000, v183, OS_LOG_TYPE_INFO, "%{public}@Updating audio analysis drop in user access from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v181);
      objc_msgSend(v364, "homeAccessControl");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = objc_msgSend(v191, "audioAnalysisUserDropInAccessLevel");
      -[HMUser homeAccessControl](v182, "homeAccessControl");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "setAudioAnalysisUserDropInAccessLevel:", v192);

      v362 = 1;
    }
    objc_msgSend(v364, "assistantAccessControl");
    v361 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser assistantAccessControl](v363, "assistantAccessControl");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v356 = HMFEqualObjects();

    if ((v356 & 1) == 0)
    {
      v195 = (void *)MEMORY[0x1A1AC1AAC]();
      v365 = v363;
      HMFGetOSLogHandle();
      v196 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v197 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v411 = v197;
        v412 = 2112;
        v413 = v361;
        _os_log_impl(&dword_19B1B0000, v196, OS_LOG_TYPE_DEFAULT, "%{public}@Updated assistant access control via merge: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v195);
      objc_msgSend(v361, "accessories");
      v359 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v359, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v359, "count"));
        v368 = (void *)objc_claimAutoreleasedReturnValue();
        v405 = 0u;
        v406 = 0u;
        v403 = 0u;
        v404 = 0u;
        v198 = v359;
        v199 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v403, v409, 16);
        if (v199)
        {
          v200 = *(_QWORD *)v404;
          do
          {
            for (i = 0; i != v199; ++i)
            {
              if (*(_QWORD *)v404 != v200)
                objc_enumerationMutation(v198);
              v202 = *(void **)(*((_QWORD *)&v403 + 1) + 8 * i);
              objc_msgSend(v202, "uuid");
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v371, "accessoryWithUUID:", v203);
              v204 = (void *)objc_claimAutoreleasedReturnValue();

              if (v204)
              {
                objc_msgSend(v368, "addObject:", v204);
              }
              else
              {
                v205 = (void *)MEMORY[0x1A1AC1AAC]();
                v206 = v365;
                HMFGetOSLogHandle();
                v207 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v207, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v208 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v202, "uuid");
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v411 = v208;
                  v412 = 2112;
                  v413 = v209;
                  _os_log_impl(&dword_19B1B0000, v207, OS_LOG_TYPE_INFO, "%{public}@Unable to find accessory with identifier: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v205);
              }

            }
            v199 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v403, v409, 16);
          }
          while (v199);
        }

        v210 = (void *)objc_msgSend(v361, "mutableCopy");
        objc_msgSend(v210, "setAccessories:", v368);
        v211 = objc_msgSend(v210, "copy");

        v212 = (void *)v211;
      }
      else
      {
        v212 = v361;
      }
      v361 = v212;
      -[HMUser setAssistantAccessControl:](v365, "setAssistantAccessControl:");
      if (v371)
      {
        -[HMUser delegate](v365, "delegate");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v214, "conformsToProtocol:", &unk_1EE45A2F0))
          v215 = v214;
        else
          v215 = 0;
        v216 = v215;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMUser context](v365, "context");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v217, "queue");
          v218 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __29__HMUser_mergeFromNewObject___block_invoke;
          block[3] = &unk_1E3AB59E8;
          block[4] = v365;
          v400 = v361;
          v401 = v216;
          v402 = v371;
          dispatch_async(v218, block);

        }
        else
        {
          v219 = (void *)MEMORY[0x1A1AC1AAC]();
          v220 = v365;
          HMFGetOSLogHandle();
          v221 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v222 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v411 = v222;
            v412 = 2112;
            v413 = v216;
            v414 = 2112;
            v415 = (const char *)v361;
            _os_log_impl(&dword_19B1B0000, v221, OS_LOG_TYPE_INFO, "%{public}@No delegate set to notify: %@, assistant access control via merge: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v219);
        }

      }
    }
    objc_msgSend(v364, "mediaContentProfileAccessControl");
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser mediaContentProfileAccessControl](v363, "mediaContentProfileAccessControl");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = HMFEqualObjects();

    if ((v224 & 1) != 0)
    {
      v225 = v356 ^ 1;
    }
    else
    {
      v226 = (void *)MEMORY[0x1A1AC1AAC]();
      v366 = v363;
      HMFGetOSLogHandle();
      v227 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v228 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v411 = v228;
        v412 = 2112;
        v413 = v360;
        _os_log_impl(&dword_19B1B0000, v227, OS_LOG_TYPE_DEFAULT, "%{public}@Updated media content profile access control: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v226);
      objc_msgSend(v360, "accessories");
      v357 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v357, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v357, "count"));
        v369 = (void *)objc_claimAutoreleasedReturnValue();
        v397 = 0u;
        v398 = 0u;
        v395 = 0u;
        v396 = 0u;
        v229 = v357;
        v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v395, v408, 16);
        if (v230)
        {
          v231 = *(_QWORD *)v396;
          do
          {
            for (j = 0; j != v230; ++j)
            {
              if (*(_QWORD *)v396 != v231)
                objc_enumerationMutation(v229);
              v233 = *(void **)(*((_QWORD *)&v395 + 1) + 8 * j);
              objc_msgSend(v233, "uuid");
              v234 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v371, "accessoryWithUUID:", v234);
              v235 = (void *)objc_claimAutoreleasedReturnValue();

              if (v235)
              {
                objc_msgSend(v369, "addObject:", v235);
              }
              else
              {
                v236 = (void *)MEMORY[0x1A1AC1AAC]();
                v237 = v366;
                HMFGetOSLogHandle();
                v238 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v238, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v239 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v233, "uuid");
                  v240 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v411 = v239;
                  v412 = 2112;
                  v413 = v240;
                  _os_log_impl(&dword_19B1B0000, v238, OS_LOG_TYPE_INFO, "%{public}@Unable to find accessory with identifier: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v236);
              }

            }
            v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v395, v408, 16);
          }
          while (v230);
        }

        v241 = (void *)objc_msgSend(v360, "mutableCopy");
        objc_msgSend(v241, "setAccessories:", v369);
        v242 = objc_msgSend(v241, "copy");

        v243 = (void *)v242;
      }
      else
      {
        v243 = v360;
      }
      v360 = v243;
      -[HMUser setMediaContentProfileAccessControl:](v366, "setMediaContentProfileAccessControl:");
      if (v371)
      {
        -[HMUser delegate](v366, "delegate");
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v244, "conformsToProtocol:", &unk_1EE45A2F0))
          v245 = v244;
        else
          v245 = 0;
        v246 = v245;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMUser context](v366, "context");
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v247, "queue");
          v248 = objc_claimAutoreleasedReturnValue();
          v391[0] = MEMORY[0x1E0C809B0];
          v391[1] = 3221225472;
          v391[2] = __29__HMUser_mergeFromNewObject___block_invoke_253;
          v391[3] = &unk_1E3AB59E8;
          v391[4] = v366;
          v392 = v360;
          v393 = v246;
          v394 = v371;
          dispatch_async(v248, v391);

        }
        else
        {
          v249 = (void *)MEMORY[0x1A1AC1AAC]();
          v250 = v366;
          HMFGetOSLogHandle();
          v251 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v251, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v252 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v411 = v252;
            v412 = 2112;
            v413 = v246;
            v414 = 2112;
            v415 = (const char *)v360;
            _os_log_impl(&dword_19B1B0000, v251, OS_LOG_TYPE_DEBUG, "%{public}@No delegate set to notify: %@, media content profile access control via merge: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v249);
        }

      }
      v225 = 1;
    }
    objc_msgSend(v364, "userListeningHistoryUpdateControl");
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser userListeningHistoryUpdateControl](v363, "userListeningHistoryUpdateControl");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = HMFEqualObjects();

    if ((v254 & 1) == 0)
    {
      v255 = (void *)MEMORY[0x1A1AC1AAC]();
      v367 = v363;
      HMFGetOSLogHandle();
      v256 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v257 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v411 = v257;
        v412 = 2112;
        v413 = v358;
        _os_log_impl(&dword_19B1B0000, v256, OS_LOG_TYPE_DEFAULT, "%{public}@Updated user listening history update control: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v255);
      objc_msgSend(v358, "accessories");
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v354, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v354, "count"));
        v370 = (void *)objc_claimAutoreleasedReturnValue();
        v389 = 0u;
        v390 = 0u;
        v387 = 0u;
        v388 = 0u;
        v258 = v354;
        v259 = objc_msgSend(v258, "countByEnumeratingWithState:objects:count:", &v387, v407, 16);
        if (v259)
        {
          v260 = *(_QWORD *)v388;
          do
          {
            for (k = 0; k != v259; ++k)
            {
              if (*(_QWORD *)v388 != v260)
                objc_enumerationMutation(v258);
              v262 = *(void **)(*((_QWORD *)&v387 + 1) + 8 * k);
              objc_msgSend(v262, "uuid");
              v263 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v371, "accessoryWithUUID:", v263);
              v264 = (void *)objc_claimAutoreleasedReturnValue();

              if (v264)
              {
                objc_msgSend(v370, "addObject:", v264);
              }
              else
              {
                v265 = (void *)MEMORY[0x1A1AC1AAC]();
                v266 = v367;
                HMFGetOSLogHandle();
                v267 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v267, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v268 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v262, "uuid");
                  v269 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v411 = v268;
                  v412 = 2112;
                  v413 = v269;
                  v414 = 2080;
                  v415 = "-[HMUser mergeFromNewObject:]";
                  _os_log_impl(&dword_19B1B0000, v267, OS_LOG_TYPE_INFO, "%{public}@Unable to find accessory with identifier: %@, %s", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v265);
              }

            }
            v259 = objc_msgSend(v258, "countByEnumeratingWithState:objects:count:", &v387, v407, 16);
          }
          while (v259);
        }

        v270 = (void *)objc_msgSend(v358, "mutableCopy");
        objc_msgSend(v270, "setAccessories:", v370);
        v271 = objc_msgSend(v270, "copy");

        v272 = (void *)v271;
      }
      else
      {
        v272 = v358;
      }
      v358 = v272;
      -[HMUser setUserListeningHistoryUpdateControl:](v367, "setUserListeningHistoryUpdateControl:");
      if (v371)
      {
        -[HMUser delegate](v367, "delegate");
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v273, "conformsToProtocol:", &unk_1EE45A2F0))
          v274 = v273;
        else
          v274 = 0;
        v275 = v274;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMUser context](v367, "context");
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v276, "queue");
          v277 = objc_claimAutoreleasedReturnValue();
          v383[0] = MEMORY[0x1E0C809B0];
          v383[1] = 3221225472;
          v383[2] = __29__HMUser_mergeFromNewObject___block_invoke_256;
          v383[3] = &unk_1E3AB59E8;
          v383[4] = v367;
          v384 = v358;
          v385 = v275;
          v386 = v371;
          dispatch_async(v277, v383);

        }
        else
        {
          v278 = (void *)MEMORY[0x1A1AC1AAC]();
          v279 = v367;
          HMFGetOSLogHandle();
          v280 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v280, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v281 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v411 = v281;
            v412 = 2112;
            v413 = v275;
            v414 = 2112;
            v415 = (const char *)v358;
            _os_log_impl(&dword_19B1B0000, v280, OS_LOG_TYPE_DEBUG, "%{public}@No delegate set to notify: %@, updated user update listening history via merge: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v278);
        }

      }
      v225 = 1;
    }
    v282 = v363;
    if (v362 && v363 && v371)
    {
      -[HMUser context](v363, "context");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "queue");
      v284 = objc_claimAutoreleasedReturnValue();
      v381[0] = MEMORY[0x1E0C809B0];
      v381[1] = 3221225472;
      v381[2] = __29__HMUser_mergeFromNewObject___block_invoke_258;
      v381[3] = &unk_1E3AB5ED8;
      v381[4] = v363;
      v382 = v371;
      dispatch_async(v284, v381);

      v282 = v363;
    }
    -[HMUser senderCorrelationIdentifier](v282, "senderCorrelationIdentifier");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "senderCorrelationIdentifier");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    v287 = HMFEqualObjects();

    if ((v287 & 1) == 0)
    {
      os_unfair_lock_lock_with_options();
      objc_msgSend(v364, "senderCorrelationIdentifier");
      v288 = objc_claimAutoreleasedReturnValue();
      senderCorrelationIdentifier = v363->_senderCorrelationIdentifier;
      v363->_senderCorrelationIdentifier = (NSString *)v288;

      os_unfair_lock_unlock(&v363->_lock);
    }
    -[HMUser photosPersonManagerSettings](v363, "photosPersonManagerSettings");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "photosPersonManagerSettings");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = HMFEqualObjects();

    if ((v292 & 1) == 0)
    {
      v293 = (void *)MEMORY[0x1A1AC1AAC]();
      v294 = v363;
      HMFGetOSLogHandle();
      v295 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v295, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v296 = (id)objc_claimAutoreleasedReturnValue();
        -[HMUser photosPersonManagerSettings](v294, "photosPersonManagerSettings");
        v297 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "photosPersonManagerSettings");
        v298 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v411 = v296;
        v412 = 2112;
        v413 = v297;
        v414 = 2112;
        v415 = v298;
        _os_log_impl(&dword_19B1B0000, v295, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings updated from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v293);
      objc_msgSend(v364, "photosPersonManagerSettings");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUser setPhotosPersonManagerSettings:](v294, "setPhotosPersonManagerSettings:", v299);

      -[HMUser delegate](v294, "delegate");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v300, "conformsToProtocol:", &unk_1EE45A2F0))
        v301 = v300;
      else
        v301 = 0;
      v302 = v301;

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMUser context](v294, "context");
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v303, "queue");
        v304 = objc_claimAutoreleasedReturnValue();
        v379[0] = MEMORY[0x1E0C809B0];
        v379[1] = 3221225472;
        v379[2] = __29__HMUser_mergeFromNewObject___block_invoke_261;
        v379[3] = &unk_1E3AB5ED8;
        v379[4] = v294;
        v380 = v302;
        dispatch_async(v304, v379);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMUser context](v294, "context");
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v305, "queue");
        v306 = objc_claimAutoreleasedReturnValue();
        v377[0] = MEMORY[0x1E0C809B0];
        v377[1] = 3221225472;
        v377[2] = __29__HMUser_mergeFromNewObject___block_invoke_264;
        v377[3] = &unk_1E3AB5ED8;
        v377[4] = v294;
        v378 = v302;
        dispatch_async(v306, v377);

      }
      v225 = 1;
    }
    v307 = -[HMUser needsiTunesMultiUserRepair](v363, "needsiTunesMultiUserRepair");
    if (v307 != objc_msgSend(v364, "needsiTunesMultiUserRepair"))
    {
      v308 = (void *)MEMORY[0x1A1AC1AAC]();
      v309 = v363;
      HMFGetOSLogHandle();
      v310 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v310, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v311 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v364, "needsiTunesMultiUserRepair"));
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v411 = v311;
        v412 = 2112;
        v413 = v312;
        _os_log_impl(&dword_19B1B0000, v310, OS_LOG_TYPE_DEFAULT, "%{public}@Updated needs iTunes repair to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v308);
      -[HMUser setNeedsiTunesMultiUserRepair:](v309, "setNeedsiTunesMultiUserRepair:", objc_msgSend(v364, "needsiTunesMultiUserRepair"));
      -[HMUser delegate](v309, "delegate");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v313, "conformsToProtocol:", &unk_1EE45A2F0))
        v314 = v313;
      else
        v314 = 0;
      v315 = v314;

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMUser context](v309, "context");
        v316 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v316, "queue");
        v317 = objc_claimAutoreleasedReturnValue();
        v375[0] = MEMORY[0x1E0C809B0];
        v375[1] = 3221225472;
        v375[2] = __29__HMUser_mergeFromNewObject___block_invoke_267;
        v375[3] = &unk_1E3AB5ED8;
        v375[4] = v309;
        v376 = v315;
        dispatch_async(v317, v375);

      }
      v225 = 1;
    }
    v318 = -[HMUser supportsSharedHomeHH2AutoMigration](v363, "supportsSharedHomeHH2AutoMigration");
    if (v318 != objc_msgSend(v364, "supportsSharedHomeHH2AutoMigration"))
    {
      v319 = (void *)MEMORY[0x1A1AC1AAC]();
      v320 = v363;
      HMFGetOSLogHandle();
      v321 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v321, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v322 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "supportsSharedHomeHH2AutoMigration");
        HMFBooleanToString();
        v323 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v411 = v322;
        v412 = 2112;
        v413 = v323;
        _os_log_impl(&dword_19B1B0000, v321, OS_LOG_TYPE_DEFAULT, "%{public}@Updated supports automatic HH2 migration by owner to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v319);
      -[HMUser setSupportsSharedHomeHH2AutoMigration:](v320, "setSupportsSharedHomeHH2AutoMigration:", objc_msgSend(v364, "supportsSharedHomeHH2AutoMigration"));
      -[HMUser delegate](v320, "delegate");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v324, "conformsToProtocol:", &unk_1EE45A2F0))
        v325 = v324;
      else
        v325 = 0;
      v326 = v325;

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMUser context](v320, "context");
        v327 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v327, "delegateCaller");
        v328 = (void *)objc_claimAutoreleasedReturnValue();
        v372[0] = MEMORY[0x1E0C809B0];
        v372[1] = 3221225472;
        v372[2] = __29__HMUser_mergeFromNewObject___block_invoke_270;
        v372[3] = &unk_1E3AB5ED8;
        v373 = v326;
        v374 = v320;
        objc_msgSend(v328, "invokeBlock:", v372);

      }
      v225 = 1;
    }
    v329 = -[HMUser settingsInitialized](v363, "settingsInitialized");
    v330 = objc_msgSend(v364, "settingsInitialized");
    objc_msgSend(v371, "homeManager");
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    v332 = objc_msgSend(v331, "isDaemonRunningWithROARFramework");

    v333 = v329 ^ v330;
    if (v332)
    {
      -[HMUser context](v363, "context");
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      if (v334)
      {
        objc_msgSend(v364, "pendingPrivateSettings");
        v335 = (void *)objc_claimAutoreleasedReturnValue();
        v336 = v335 == 0;

        if (!v336)
        {
          objc_msgSend(v364, "pendingPrivateSettings");
          v337 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMUser context](v363, "context");
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMUser createConfigureAndMergePrivateSettingsIfNecessary:withContext:](v363, "createConfigureAndMergePrivateSettingsIfNecessary:withContext:", v337, v338);

          objc_msgSend(v364, "setPendingPrivateSettings:", 0);
        }
      }
      -[HMUser context](v363, "context");
      v339 = (void *)objc_claimAutoreleasedReturnValue();
      if (v339)
      {
        objc_msgSend(v364, "pendingSharedSettings");
        v340 = (void *)objc_claimAutoreleasedReturnValue();
        v341 = v340 == 0;

        if (!v341)
        {
          objc_msgSend(v364, "pendingSharedSettings");
          v342 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMUser context](v363, "context");
          v343 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMUser createConfigureAndMergeSharedSettingsIfNecessary:withContext:](v363, "createConfigureAndMergeSharedSettingsIfNecessary:withContext:", v342, v343);

          objc_msgSend(v364, "setPendingSharedSettings:", 0);
        }
      }
    }
    else
    {
      -[HMUser settingsController](v363, "settingsController");
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "settingsController");
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v344, "mergeWith:settingsInitializedWasModified:", v345, v333);

      -[HMUser privateSettingsController](v363, "privateSettingsController");
      v346 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "privateSettingsController");
      v347 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v346, "mergeWith:settingsInitializedWasModified:", v347, v333);

    }
    -[HMUser pairingIdentity](v363, "pairingIdentity");
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v364, "pairingIdentity");
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    v350 = HMFEqualObjects();

    if ((v350 & 1) != 0)
    {
      v213 = v333 | v225;
    }
    else
    {
      -[HMUser pairingIdentity](v363, "pairingIdentity");
      v351 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v364, "pairingIdentity");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUser _mergeUserPairingIdentityIfNecessary:withNewPairingIdentity:](v363, "_mergeUserPairingIdentityIfNecessary:withNewPairingIdentity:", v351, v352);

      v213 = 1;
    }

  }
  else
  {
    v213 = 0;
  }

  return v213;
}

- (void)_mergeUserPairingIdentityIfNecessary:(id)a3 withNewPairingIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMUser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Pairing Identity for the user has changed from : %@ to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMUser setPairingIdentity:](v9, "setPairingIdentity:", v7);
  -[HMUser delegate](v9, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EE45A2F0))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMUser context](v9, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70__HMUser__mergeUserPairingIdentityIfNecessary_withNewPairingIdentity___block_invoke;
    v19[3] = &unk_1E3AB5CD0;
    v19[4] = v9;
    v20 = v7;
    v21 = v16;
    objc_msgSend(v18, "invokeBlock:", v19);

  }
}

- (void)createConfigureAndMergePrivateSettingsIfNecessary:(id)a3 withContext:(id)a4
{
  id v6;
  HMUserSettingsAdapter *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[HMUser privateSettingsAdapter](self, "privateSettingsAdapter");
  v7 = (HMUserSettingsAdapter *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[HMUserSettingsAdapter initWithUser:settingsType:]([HMUserSettingsAdapter alloc], "initWithUser:settingsType:", self, 1);
    -[HMUserSettingsAdapter configureWithContext:](v7, "configureWithContext:", v6);
    -[HMUser setPrivateSettingsAdapter:](self, "setPrivateSettingsAdapter:", v7);
  }
  if (v8)
    -[HMUserSettingsAdapter mergeWithDictionary:](v7, "mergeWithDictionary:", v8);

}

- (void)createConfigureAndMergeSharedSettingsIfNecessary:(id)a3 withContext:(id)a4
{
  id v6;
  HMUserSettingsAdapter *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[HMUser sharedSettingsAdapter](self, "sharedSettingsAdapter");
  v7 = (HMUserSettingsAdapter *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[HMUserSettingsAdapter initWithUser:settingsType:]([HMUserSettingsAdapter alloc], "initWithUser:settingsType:", self, 2);
    -[HMUserSettingsAdapter configureWithContext:](v7, "configureWithContext:", v6);
    -[HMUser setSharedSettingsAdapter:](self, "setSharedSettingsAdapter:", v7);
  }
  if (v8)
    -[HMUserSettingsAdapter mergeWithDictionary:](v7, "mergeWithDictionary:", v8);

}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMUser messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3
{
  self->_needsiTunesMultiUserRepair = a3;
}

- (BOOL)settingsInitialized
{
  return self->_settingsInitialized;
}

- (BOOL)supportsSharedHomeHH2AutoMigration
{
  return self->_supportsSharedHomeHH2AutoMigration;
}

- (void)setSupportsSharedHomeHH2AutoMigration:(BOOL)a3
{
  self->_supportsSharedHomeHH2AutoMigration = a3;
}

- (HMUserDelegatePrivate)delegate
{
  return (HMUserDelegatePrivate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setPrivateSettingsAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setSharedSettingsAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSDictionary)pendingPrivateSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPendingPrivateSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSDictionary)pendingSharedSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPendingSharedSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (BOOL)rgAllowedPeriod
{
  return self->_rgAllowedPeriod;
}

- (void)setRgAllowedPeriod:(BOOL)a3
{
  self->_rgAllowedPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_pendingSharedSettings, 0);
  objc_storeStrong((id *)&self->_pendingPrivateSettings, 0);
  objc_storeStrong((id *)&self->_sharedSettingsAdapter, 0);
  objc_storeStrong((id *)&self->_privateSettingsAdapter, 0);
  objc_storeStrong((id *)&self->_privateSettingsController, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photosPersonManagerSettings, 0);
  objc_storeStrong((id *)&self->_photosPersonManager, 0);
  objc_storeStrong((id *)&self->_announceUserSettings, 0);
  objc_storeStrong((id *)&self->_privateSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_userListeningHistoryUpdateControl, 0);
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControl, 0);
  objc_storeStrong((id *)&self->_assistantAccessControl, 0);
  objc_storeStrong((id *)&self->_homeAccessControl, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingAccessoryInvitations, 0);
}

void __70__HMUser__mergeUserPairingIdentityIfNecessary_withNewPairingIdentity___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client that pairing identity has changed to : %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 48);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "user:didUpdatePairingIdentity:", v8, v9);

}

void __29__HMUser_mergeFromNewObject___block_invoke(uint64_t a1)
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
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2;
  v5[3] = &unk_1E3AB59E8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __29__HMUser_mergeFromNewObject___block_invoke_253(uint64_t a1)
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
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_254;
  v5[3] = &unk_1E3AB59E8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __29__HMUser_mergeFromNewObject___block_invoke_256(uint64_t a1)
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
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_257;
  v5[3] = &unk_1E3AB59E8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __29__HMUser_mergeFromNewObject___block_invoke_258(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_259;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __29__HMUser_mergeFromNewObject___block_invoke_261(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_262;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __29__HMUser_mergeFromNewObject___block_invoke_264(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_265;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __29__HMUser_mergeFromNewObject___block_invoke_267(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_268;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_270(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "user:didUpdateSupportsSharedHomeHH2AutoMigration:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "supportsSharedHomeHH2AutoMigration"));
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2_268(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 32), "needsiTunesMultiUserRepair");
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateNeedsiTunesMultiUserRepair : %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "user:didUpdateNeedsiTunesMultiUserRepair:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "needsiTunesMultiUserRepair"));
}

void __29__HMUser_mergeFromNewObject___block_invoke_2_265(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
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
    objc_msgSend(*(id *)(a1 + 32), "photosPersonManagerSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdatePhotosPersonManagerSettings : %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v9 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(v9 + 8);
  objc_msgSend(v7, "photosPersonManagerSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "user:didUpdatePhotosPersonManagerSettings:", v7, v10);

}

void __29__HMUser_mergeFromNewObject___block_invoke_2_262(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
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
    objc_msgSend(*(id *)(a1 + 32), "photosPersonManagerSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdatePersonManagerSettings : %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v9 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(v9 + 8);
  objc_msgSend(v7, "photosPersonManagerSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "user:didUpdatePersonManagerSettings:", v7, v10);

}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2_259(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 32), "homeAccessControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated access control via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "notifyDelegateOfAccessControlUpdateForUser:", *(_QWORD *)(a1 + 32));
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2_257(uint64_t a1)
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
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated user listening history update control via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "user:didUpdateUserListeningHistoryUpdateControl:forHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2_254(uint64_t a1)
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
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated media content profile access control via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "user:didUpdateMediaContentProfileAccessControl:forHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2(uint64_t a1)
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
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated assistant access control via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "user:didUpdateAssistantAccessControl:forHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

void __44__HMUser__mergeWithNewAccessoryInvitations___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory invitation via user merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __44__HMUser__mergeWithNewAccessoryInvitations___block_invoke_250(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added accessory invitation via user merge: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_firstObjectWithUniqueIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessory:", v12);
}

id __24__HMUser_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __51__HMUser_setNeedsiTunesMultiUserRepair_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__HMUser_setNeedsiTunesMultiUserRepair_completion___block_invoke_2;
    v8[3] = &unk_1E3AB60A0;
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __51__HMUser_setNeedsiTunesMultiUserRepair_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __62__HMUser_sendClientShareRepairRequest_containerID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__HMUser_sendClientShareURL_shareToken_containerID_fromUser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "hmf_dataForKey:", CFSTR("HM.u.clientInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __31__HMUser_fetchShareLookupInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v11;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@share lookup response %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0CB3710];
    v13 = objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HM.shareLookupInfoKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v12, "unarchivedObjectOfClass:fromData:error:", v13, v14, &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;

    if (!v7)
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v19;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive user share lookup info from response data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("No share lookup info"), CFSTR("Unable to find or decode share lookup"), 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v20;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__HMUser_fetchAllPairingIdentitiesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v11;
      v39 = 2112;
      v40 = v12;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve pairing identity for user : %@ / %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HM.pairingIdentity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3710];
      v15 = (void *)MEMORY[0x1E0C99E60];
      v36[0] = objc_opt_class();
      v36[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v14, "unarchivedObjectOfClasses:fromData:error:", v17, v13, &v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v35;

      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v18)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "uuid");
          v34 = v20;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v24;
          v39 = 2112;
          v40 = v25;
          v41 = 2112;
          v42 = v18;
          _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved pairing identities for User : %@ / %@", buf, 0x20u);

          v20 = v34;
        }

        objc_autoreleasePoolPop(v20);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v31;
          v39 = 2112;
          v40 = v19;
          _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identities for user from encoded pairing identity data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        v32 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v32 + 16))(v32, 0, v33);

      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v29;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@The payload did not contain any pairing identities", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      v30 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v30 + 16))(v30, 0, v19);
    }

  }
}

void __47__HMUser_pairingIdentityWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HM.pairingIdentity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, &v28);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v28;
      v16 = v15;
      if (!v14)
      {
        v22 = (void *)MEMORY[0x1A1AC1AAC]();
        v23 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v25;
          v31 = 2112;
          v32 = v16;
          _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identity for user from encoded pairing identity data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        v26 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v27);

        goto LABEL_15;
      }

      v16 = (void *)v14;
    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 32), "setPairingIdentity:", v16));
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved pairing identity for User : %@ / %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_15:

    goto LABEL_16;
  }
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve pairing identity for user : %@ / %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_16:

}

uint64_t __62__HMUser_updatePresenceAuthorizationStatus_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePresenceAuthorizationStatus:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1[4], "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "delegateCaller");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v31 = (void *)v30;
    objc_msgSend(v28, "callCompletion:error:", v29, v30);

    goto LABEL_9;
  }
  if ((objc_msgSend(a1[5], "isEqual:", v2) & 1) == 0)
  {
    objc_msgSend(a1[4], "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "delegateCaller");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = a1[4];
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    *(_DWORD *)buf = 138543618;
    v44 = v6;
    v45 = 2112;
    v46 = v7;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Will update user listening history update %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(a1[6], "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMAccessoryUUIDsAsStringForAccessories(v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(v2, "messageTargetUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

  v12 = (void *)MEMORY[0x1E0D285F8];
  v41[1] = CFSTR("kUserUUIDKey");
  v42[0] = v32;
  v41[0] = CFSTR("accessories");
  objc_msgSend(a1[4], "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("HMU.mc"), v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, a1[4]);
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke_195;
  aBlock[3] = &unk_1E3AB5538;
  objc_copyWeak(&v40, (id *)buf);
  v38 = a1[6];
  v39 = a1[8];
  v18 = _Block_copy(aBlock);
  objc_msgSend(a1[4], "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pendingRequests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _Block_copy(v18);
  objc_msgSend(v20, "addCompletionBlock:forIdentifier:", v22, v21);

  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke_196;
  v33[3] = &unk_1E3AB60C8;
  v23 = v20;
  v34 = v23;
  v24 = v21;
  v35 = v24;
  v25 = v18;
  v36 = v25;
  objc_msgSend(v16, "setResponseHandler:", v33);
  objc_msgSend(a1[7], "messageDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendMessage:completionHandler:", v16, 0);

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

LABEL_9:
}

void __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke_195(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v3)
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated user listening history update control %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v6, "setUserListeningHistoryUpdateControl:", v10);

  }
  objc_msgSend(WeakRetained, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateCaller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "callCompletion:error:", *(_QWORD *)(a1 + 40), v3);

}

void __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke_196(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD aBlock[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[3];
  _QWORD v43[3];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1[4], "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "delegateCaller");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v31 = (void *)v30;
    objc_msgSend(v28, "callCompletion:error:", v29, v30);

    goto LABEL_9;
  }
  if ((objc_msgSend(a1[5], "isEqual:", v2) & 1) == 0)
  {
    objc_msgSend(a1[4], "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "delegateCaller");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = a1[4];
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    *(_DWORD *)buf = 138543618;
    v45 = v6;
    v46 = 2112;
    v47 = v7;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Will update media content profile access control %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(a1[6], "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMAccessoryUUIDsAsStringForAccessories(v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(v2, "messageTargetUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

  v11 = (void *)MEMORY[0x1E0D285F8];
  v42[0] = CFSTR("mediaContentAC");
  encodeRootObject(a1[6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v12;
  v43[1] = v33;
  v42[1] = CFSTR("accessories");
  v42[2] = CFSTR("kUserUUIDKey");
  objc_msgSend(a1[4], "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("HMU.mu"), v32, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, a1[4]);
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke_193;
  aBlock[3] = &unk_1E3AB5538;
  objc_copyWeak(&v41, (id *)buf);
  v39 = a1[6];
  v40 = a1[8];
  v18 = _Block_copy(aBlock);
  objc_msgSend(a1[4], "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pendingRequests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _Block_copy(v18);
  objc_msgSend(v20, "addCompletionBlock:forIdentifier:", v22, v21);

  v34[0] = v17;
  v34[1] = 3221225472;
  v34[2] = __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke_194;
  v34[3] = &unk_1E3AB60C8;
  v23 = v20;
  v35 = v23;
  v24 = v21;
  v36 = v24;
  v25 = v18;
  v37 = v25;
  objc_msgSend(v16, "setResponseHandler:", v34);
  objc_msgSend(a1[7], "messageDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendMessage:completionHandler:", v16, 0);

  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)buf);

LABEL_9:
}

void __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke_193(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v3)
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated media content profile access control %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "setMediaContentProfileAccessControl:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(WeakRetained, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callCompletion:error:", *(_QWORD *)(a1 + 40), v3);

}

void __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke_194(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke(id *a1)
{
  char v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  id v41;
  id v42;
  const __CFString *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "isCurrentUser");
  v3 = a1[4];
  if ((v2 & 1) == 0)
  {
    objc_msgSend(v3, "context");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "delegateCaller");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "callCompletion:error:", v27, v28);

    return;
  }
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_msgSend(a1[5], "isEqual:", v4) & 1) != 0)
    {
      v5 = (void *)MEMORY[0x1A1AC1AAC]();
      v6 = a1[4];
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "announceUserSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = a1[6];
        *(_DWORD *)buf = 138543874;
        v46 = v8;
        v47 = 2112;
        v48 = v9;
        v49 = 2112;
        v50 = v10;
        _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating Announce User Settings from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      v11 = (void *)MEMORY[0x1E0D285F8];
      objc_msgSend(a1[4], "messageDestination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("HM.u.announce.Settings");
      encodeRootObject(a1[6]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("HM.u.announce.settings.update"), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, a1[4]);
      v16 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke_191;
      aBlock[3] = &unk_1E3AB5538;
      objc_copyWeak(&v42, (id *)buf);
      v40 = a1[6];
      v41 = a1[8];
      v17 = _Block_copy(aBlock);
      objc_msgSend(a1[4], "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pendingRequests");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = _Block_copy(v17);
      objc_msgSend(v19, "addCompletionBlock:forIdentifier:", v21, v20);

      v35[0] = v16;
      v35[1] = 3221225472;
      v35[2] = __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke_192;
      v35[3] = &unk_1E3AB60C8;
      v22 = v19;
      v36 = v22;
      v23 = v20;
      v37 = v23;
      v24 = v17;
      v38 = v24;
      objc_msgSend(v15, "setResponseHandler:", v35);
      objc_msgSend(a1[7], "messageDispatcher");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sendMessage:completionHandler:", v15, 0);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);

      goto LABEL_11;
    }
    objc_msgSend(a1[4], "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "delegateCaller");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1[4], "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "delegateCaller");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v32;
  objc_msgSend(v30, "callCompletion:error:", v31, v32);

LABEL_11:
}

void __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke_191(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (!v3)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(WeakRetained, "setAnnounceUserSettings:", *(_QWORD *)(a1 + 32)));
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "announceUserSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated Announce Settings to %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  objc_msgSend(v5, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateCaller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "callCompletion:error:", *(_QWORD *)(a1 + 40), v3);

}

void __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke_192(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __47__HMUser__handleUpdatedAssistantAccessControl___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE45A2F0))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_opt_respondsToSelector();
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);
      v14 = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated assistant access control: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "user:didUpdateAssistantAccessControl:forHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@No delegate set to notify: %@, assistant access control: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __38__HMUser__handleRGAllowedPeriodEnded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__HMUser__handleRGAllowedPeriodEnded___block_invoke_2;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __38__HMUser__handleRGAllowedPeriodEnded___block_invoke_2(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 32), "homeAccessControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of RG allowed period ended: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "restrictedGuestAllowedPeriodEnded:", *(_QWORD *)(a1 + 32));
}

void __40__HMUser__handleRGAllowedPeriodStarted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__HMUser__handleRGAllowedPeriodStarted___block_invoke_2;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __40__HMUser__handleRGAllowedPeriodStarted___block_invoke_2(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 32), "homeAccessControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of RG allowed period started: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "restrictedGuestAllowedPeriodStarted:", *(_QWORD *)(a1 + 32));
}

void __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id location;
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1[4], "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "delegateCaller");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v26 = (void *)v25;
    objc_msgSend(v23, "callCompletion:error:", v24, v25);

    goto LABEL_7;
  }
  if ((objc_msgSend(a1[5], "isEqual:", v2) & 1) == 0)
  {
    objc_msgSend(a1[4], "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "delegateCaller");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(a1[6], "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HMAccessoryUUIDsAsStringForAccessories(v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(v2, "messageTargetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v4, "initWithTarget:", v5);

  v6 = (void *)MEMORY[0x1E0D285F8];
  v38[0] = CFSTR("assistantAC");
  encodeRootObject(a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v7;
  v39[1] = v28;
  v38[1] = CFSTR("accessories");
  v38[2] = CFSTR("kUserUUIDKey");
  objc_msgSend(a1[4], "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMU.au"), v27, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, a1[4]);
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E3AB5538;
  objc_copyWeak(&v36, &location);
  v34 = a1[6];
  v35 = a1[8];
  v13 = _Block_copy(aBlock);
  objc_msgSend(a1[4], "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pendingRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _Block_copy(v13);
  objc_msgSend(v15, "addCompletionBlock:forIdentifier:", v17, v16);

  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke_118;
  v29[3] = &unk_1E3AB4B08;
  v29[4] = a1[4];
  v18 = v15;
  v30 = v18;
  v19 = v16;
  v31 = v19;
  v20 = v13;
  v32 = v20;
  objc_msgSend(v11, "setResponseHandler:", v29);
  objc_msgSend(a1[7], "messageDispatcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendMessage:completionHandler:", v11, 0);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_7:
}

void __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (!v3)
    objc_msgSend(WeakRetained, "setAssistantAccessControl:", *(_QWORD *)(a1 + 32));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = v5;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated assistant access control. error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callCompletion:error:", *(_QWORD *)(a1 + 40), v3);

}

void __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished to update assistant access control. error: %@, response payload: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
