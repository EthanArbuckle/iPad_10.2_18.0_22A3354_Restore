@implementation HMDUserDataController

- (HMDUserDataController)initWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 timerCreator:(id)a10 isCurrentUser:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  HMDUserDataController *v20;
  HMDUserDataController *v21;
  uint64_t v22;
  NSMutableSet *assistantAccessControlAccessoryUUIDs;
  uint64_t v24;
  NSMutableSet *mediaContentProfileAccessControlAccessories;
  uint64_t v26;
  NSNotificationCenter *notificationCenter;
  id v29;
  id v30;
  id v31;
  id v32;
  id obj;
  objc_super v34;

  obj = a3;
  v17 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)HMDUserDataController;
  v20 = -[HMDUserDataController init](&v34, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_state = 2 * (v18 == 0);
    v20->_isModifyingState = 0;
    objc_storeStrong((id *)&v20->_clientQueue, a5);
    objc_storeWeak((id *)&v21->_delegate, obj);
    objc_storeStrong((id *)&v21->_timerCreator, a10);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    assistantAccessControlAccessoryUUIDs = v21->_assistantAccessControlAccessoryUUIDs;
    v21->_assistantAccessControlAccessoryUUIDs = (NSMutableSet *)v22;

    *(_WORD *)&v21->_assistantAccessControlRequiresAuthenticationForSecureRequests = 256;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = objc_claimAutoreleasedReturnValue();
    mediaContentProfileAccessControlAccessories = v21->_mediaContentProfileAccessControlAccessories;
    v21->_mediaContentProfileAccessControlAccessories = (NSMutableSet *)v24;

    objc_storeStrong((id *)&v21->_userUUID, a6);
    objc_storeStrong((id *)&v21->_homeUUID, a7);
    objc_storeStrong((id *)&v21->_sharedSettingsController, a8);
    objc_storeStrong((id *)&v21->_privateSettingsController, a9);
    objc_storeWeak((id *)&v21->_dataSource, v17);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v21->_notificationCenter;
    v21->_notificationCenter = (NSNotificationCenter *)v26;

    v21->_isCurrentUser = a11;
  }

  return v21;
}

- (HMDUserDataController)initWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 isCurrentUser:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HMDUserDataController *v25;
  uint64_t v27;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)objc_opt_new();
  LOBYTE(v27) = a10;
  v25 = -[HMDUserDataController initWithDelegate:dataSource:queue:userID:homeID:sharedSettingsController:privateSettingsController:timerCreator:isCurrentUser:](self, "initWithDelegate:dataSource:queue:userID:homeID:sharedSettingsController:privateSettingsController:timerCreator:isCurrentUser:", v23, v22, v21, v20, v19, v18, v17, v24, v27);

  return v25;
}

- (void)configure
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDUserDataController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HMDUserDataController_configure__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isInitialized
{
  return -[HMDUserDataController state](self, "state") == 1;
}

- (NSArray)assistantAccessControlAccessoriesToEncode
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HMDUserDataController isInitialized](self, "isInitialized"))
  {
    -[HMDUserDataController assistantAccessControlAccessoryUUIDs](self, "assistantAccessControlAccessoryUUIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDUserDataController mediaContentProfileAccessControlAccessories](self, "mediaContentProfileAccessControlAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDUserDataController userListeningHistoryUpdateControlModelAccessories](self, "userListeningHistoryUpdateControlModelAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[HMDUserDataController isInitialized](self, "isInitialized"))
  {
    -[HMDUserDataController sharedSettingsController](self, "sharedSettingsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeWithCoder:", v6);

    -[HMDUserDataController privateSettingsController](self, "privateSettingsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeWithCoder:", v6);

    objc_msgSend(v6, "encodeBool:forKey:", self->_state == 1, *MEMORY[0x1E0CB9B78]);
  }

}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  HMDUserDataController *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = os_unfair_lock_lock_with_options();
  if (self->_state == a3)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0](v6);
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      HMDUserDataControllerStateAsString(self->_state);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      HMDUserDataControllerStateAsString(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Moving state from %@ to %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    self->_state = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (a3 == 1)
    {
      -[HMDUserDataController notificationCenter](v8, "notificationCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("HMDUserDataControllerInitializedNotificationKey"), v8);

    }
  }
}

- (void)eventDidInitializePrivateZone
{
  NSObject *v3;
  unint64_t v4;
  void *v5;
  HMDUserDataController *v6;
  NSObject *v7;
  void *v8;
  HMDUserDataController *v9;
  uint64_t v10;
  void *v11;
  HMDUserDataController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDUserDataController *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  self->_isModifyingState = 1;
  v4 = -[HMDUserDataController state](self, "state");
  if (v4 - 1 < 2)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUserDataController state](v12, "state"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected from state on init private zone event %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (v4 == 3)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Moving to initialized on initializing private zone", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      v9 = v17;
      v10 = 1;
      goto LABEL_13;
    }
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v8;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Moving to pending shared on initializing private zone", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      v9 = v6;
      v10 = 2;
LABEL_13:
      -[HMDUserDataController setState:](v9, "setState:", v10);
    }
  }
  self->_isModifyingState = 0;
}

- (void)eventDidInitializeSharedZone
{
  NSObject *v3;
  void *v4;
  HMDUserDataController *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDUserDataController *v10;
  NSObject *v11;
  void *v12;
  HMDUserDataController *v13;
  uint64_t v14;
  void *v15;
  HMDUserDataController *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  self->_isModifyingState = 1;
  switch(-[HMDUserDataController state](self, "state"))
  {
    case 0uLL:
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Moving to pending private on initializing shared zone", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      v13 = v10;
      v14 = 3;
      goto LABEL_11;
    case 1uLL:
    case 3uLL:
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUserDataController state](v5, "state"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v7;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected from state on init shared zone event %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      break;
    case 2uLL:
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Moving to initialized on initializing shared zone", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v13 = v16;
      v14 = 1;
LABEL_11:
      -[HMDUserDataController setState:](v13, "setState:", v14);
      break;
    default:
      break;
  }
  self->_isModifyingState = 0;
}

- (void)initializeSharedZoneController:(id)a3 userDataModel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDUserDataController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HMDUserDataController *v28;
  NSObject *v29;
  NSObject *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDUserDataController *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  HMDUserDataController *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HMDUserDataController *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  HMDUserDataController *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  HMDUserDataController *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  HMDUserDataController *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  HMDUserDataController *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  id v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "assistantAccessControlModelUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setAssistantAccessControlModelUUID:](self, "setAssistantAccessControlModelUUID:", v9);

  v101 = v7;
  objc_msgSend(v7, "mediaContentProfileAccessControlModelUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setMediaContentProfileAccessControlModelUUID:](self, "setMediaContentProfileAccessControlModelUUID:", v10);

  -[HMDUserDataController userUUID](self, "userUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForSharedUserDataModelUpdates:modelID:", self, v11);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v7, "userListeningHistoryUpdateControlModelUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setUserListeningHistoryUpdateControlModelUUID:](self, "setUserListeningHistoryUpdateControlModelUUID:", v12);

  }
  objc_msgSend(v7, "supportsAutomaticHH2MigrationModelUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setSupportsAutomaticHH2MigrationModelUUID:](self, "setSupportsAutomaticHH2MigrationModelUUID:", v13);

  objc_msgSend(v7, "settingsRootUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setSharedSettingsRootUUID:](self, "setSharedSettingsRootUUID:", v14);

  -[HMDUserDataController assistantAccessControlModelUUID](self, "assistantAccessControlModelUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForAssistantAccessControlModelUpdates:modelID:", self, v15);

  -[HMDUserDataController mediaContentProfileAccessControlModelUUID](self, "mediaContentProfileAccessControlModelUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMediaContentAccessControlModelUpdates:modelID:", self, v16);

  if (_os_feature_enabled_impl())
  {
    -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](self, "userListeningHistoryUpdateControlModelUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerForUserListeningHistoryUpdateControlModelUpdates:modelID:", self, v17);

  }
  -[HMDUserDataController supportsAutomaticHH2MigrationModelUUID](self, "supportsAutomaticHH2MigrationModelUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForUserSupportsAutomaticHH2MigrationModelUpdates:modelID:", self, v18);

  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController assistantAccessControlModelUUID](v20, "assistantAccessControlModelUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v107 = v22;
    v108 = 2112;
    v109 = v23;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Loading assistant access control model %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDUserDataController assistantAccessControlModelUUID](v20, "assistantAccessControlModelUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0;
  objc_msgSend(v6, "loadAssistantAccessControlModelWithModelID:error:", v24, &v105);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v105;

  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = v20;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v31 = 0x1E0C99000;
  if (v25)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "requiresAuthenticationForSecureRequests");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activityNotificationsEnabledForPersonalRequests");
      v34 = v26;
      v35 = v6;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "accessoryUUIDs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v107 = v32;
      v108 = 2112;
      v109 = v33;
      v110 = 2112;
      v111 = v36;
      v112 = 2112;
      v113 = v37;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Loaded assistant access control requires auth: %@, activity notifications enabled for personal requests: %@, accessories: %@", buf, 0x2Au);

      v6 = v35;
      v26 = v34;

      v31 = 0x1E0C99000uLL;
    }

    objc_autoreleasePoolPop(v27);
    objc_msgSend(*(id *)(v31 + 3616), "set");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "accessoryUUIDs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "na_safeAddObjectsFromArray:", v39);

    objc_msgSend(v25, "siriEndpointAccessoryUUIDs");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "na_safeAddObjectsFromArray:", v40);

    -[HMDUserDataController setAssistantAccessControlAccessoryUUIDs:](v28, "setAssistantAccessControlAccessoryUUIDs:", v38);
    objc_msgSend(v25, "requiresAuthenticationForSecureRequests");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setAssistantAccessControlRequiresAuthenticationForSecureRequests:](v28, "setAssistantAccessControlRequiresAuthenticationForSecureRequests:", objc_msgSend(v41, "BOOLValue"));

    if (objc_msgSend(v25, "hmbPropertyWasSet:", CFSTR("activityNotificationsEnabledForPersonalRequests")))
    {
      objc_msgSend(v25, "activityNotificationsEnabledForPersonalRequests");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:](v28, "setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:", objc_msgSend(v42, "BOOLValue"));

    }
    else
    {
      -[HMDUserDataController setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:](v28, "setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:", 1);
    }

  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v107 = v43;
      v108 = 2112;
      v109 = v26;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to load assistant access control %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
  }

  v44 = (void *)MEMORY[0x1D17BA0A0]();
  v45 = v28;
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController mediaContentProfileAccessControlModelUUID](v45, "mediaContentProfileAccessControlModelUUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v107 = v47;
    v108 = 2112;
    v109 = v48;
    _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Loading media content profile access control model %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v44);
  -[HMDUserDataController mediaContentProfileAccessControlModelUUID](v45, "mediaContentProfileAccessControlModelUUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0;
  objc_msgSend(v6, "loadMediaContentAccessControlModelWithModelID:error:", v49, &v104);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v104;

  v52 = (void *)MEMORY[0x1D17BA0A0]();
  v53 = v45;
  HMFGetOSLogHandle();
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v50)
  {
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "accessories");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v107 = v56;
      v108 = 2112;
      v109 = v57;
      _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_INFO, "%{public}@Loaded media content profile access control accessories %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v52);
    v58 = *(void **)(v31 + 3616);
    objc_msgSend(v50, "accessories");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setWithArray:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setMediaContentProfileAccessControlAccessories:](v53, "setMediaContentProfileAccessControlAccessories:", v60);

  }
  else
  {
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v107 = v61;
      v108 = 2112;
      v109 = v51;
      _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_ERROR, "%{public}@Unable to load media content profile accessories %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v52);
  }

  if (_os_feature_enabled_impl())
  {
    v62 = (void *)MEMORY[0x1D17BA0A0]();
    v63 = v53;
    HMFGetOSLogHandle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v63, "userListeningHistoryUpdateControlModelUUID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v107 = v65;
      v108 = 2112;
      v109 = v66;
      _os_log_impl(&dword_1CD062000, v64, OS_LOG_TYPE_INFO, "%{public}@Loading user listening history update model %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v62);
    -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v63, "userListeningHistoryUpdateControlModelUUID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0;
    objc_msgSend(v6, "loadUserListeningHistoryUpdateControlModelWithModelID:error:", v67, &v103);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v103;

    v70 = (void *)MEMORY[0x1D17BA0A0]();
    v71 = v63;
    HMFGetOSLogHandle();
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v68)
    {
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "accessories");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v107 = v74;
        v108 = 2112;
        v109 = v75;
        _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_INFO, "%{public}@Loaded user listening history update accessories %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v70);
      v76 = *(void **)(v31 + 3616);
      objc_msgSend(v68, "accessories");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setWithArray:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController setUserListeningHistoryUpdateControlModelAccessories:](v71, "setUserListeningHistoryUpdateControlModelAccessories:", v78);

    }
    else
    {
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v107 = v79;
        v108 = 2112;
        v109 = v69;
        _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_ERROR, "%{public}@Unable to load update listening history accessories %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v70);
    }

  }
  v80 = (void *)MEMORY[0x1D17BA0A0]();
  v81 = v53;
  HMFGetOSLogHandle();
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController supportsAutomaticHH2MigrationModelUUID](v81, "supportsAutomaticHH2MigrationModelUUID");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v107 = v83;
    v108 = 2112;
    v109 = v84;
    _os_log_impl(&dword_1CD062000, v82, OS_LOG_TYPE_INFO, "%{public}@Loading user supports automatic HH2 migration model %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v80);
  -[HMDUserDataController supportsAutomaticHH2MigrationModelUUID](v81, "supportsAutomaticHH2MigrationModelUUID");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0;
  objc_msgSend(v6, "loadUserSupportsAutomaticHH2MigrationModelWithModelID:error:", v85, &v102);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v102;

  if (v86)
  {
    objc_msgSend(v86, "supportsAutomaticHH2Migration");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setSupportsHH2MigrationByOwnerManual:](v81, "setSupportsHH2MigrationByOwnerManual:", objc_msgSend(v88, "BOOLValue"));

    objc_msgSend(v86, "supportsHH2MigrationByOwnerAuto");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setSupportsHH2MigrationByOwnerAuto:](v81, "setSupportsHH2MigrationByOwnerAuto:", objc_msgSend(v89, "BOOLValue"));

    v90 = (void *)MEMORY[0x1D17BA0A0]();
    v91 = v81;
    HMFGetOSLogHandle();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController supportsHH2MigrationByOwnerManual](v91, "supportsHH2MigrationByOwnerManual");
      HMFBooleanToString();
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController supportsHH2MigrationByOwnerAuto](v91, "supportsHH2MigrationByOwnerAuto");
      HMFBooleanToString();
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v107 = v93;
      v108 = 2114;
      v109 = v94;
      v110 = 2114;
      v111 = v95;
      _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_INFO, "%{public}@Loaded user supports automatic HH2 migration model by owner manual = %{public}@, by owner auto = %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v90 = (void *)MEMORY[0x1D17BA0A0]();
    v96 = v81;
    HMFGetOSLogHandle();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v107 = v97;
      v108 = 2112;
      v109 = v87;
      _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_ERROR, "%{public}@Unable to load user supports automatic HH2 migration model %@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v90);
  objc_msgSend(v6, "loadUserSettings");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController sharedSettingsController](v81, "sharedSettingsController");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "loadWithModels:", v98);

  -[HMDUserDataController sharedSettingsController](v81, "sharedSettingsController");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "configure");

  -[HMDUserDataController eventDidInitializeSharedZone](v81, "eventDidInitializeSharedZone");
}

- (id)_migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel:(id)a3 transaction:(id)a4 settingModels:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDUserDataController *v13;
  NSObject *v14;
  void *v15;
  HMDUserListeningHistoryUpdateControlModel *v16;
  void *v17;
  void *v18;
  HMDUserListeningHistoryUpdateControlModel *v19;
  HMDSharedUserDataModel *v20;
  void *v21;
  void *v22;
  HMDSharedUserDataModel *v23;
  void *v24;
  void *v25;
  HMDUserDataController *v26;
  NSObject *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  HMDUserDataController *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v41[5];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "userListeningHistoryUpdateControlModelUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@current data model has UUID, not migrating ULH", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v16 = [HMDUserListeningHistoryUpdateControlModel alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userUUID](self, "userUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMBModel initWithModelID:parentModelID:](v16, "initWithModelID:parentModelID:", v17, v18);

    v20 = [HMDSharedUserDataModel alloc];
    -[HMDUserDataController userUUID](self, "userUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController homeUUID](self, "homeUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMBModel initWithModelID:parentModelID:](v20, "initWithModelID:parentModelID:", v21, v22);

    objc_msgSend(v10, "na_map:", &__block_literal_global_137497);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v28;
      v44 = 2112;
      v45 = v24;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Filtered Setting MOdels: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v29 = -[HMDUserDataController _userListeningHistoryValueFromModels:](v26, "_userListeningHistoryValueFromModels:", v24);
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = v26;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v33)
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v34;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@ULH was true for the user, migrating accessories", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      -[HMDUserDataController dataSource](v31, "dataSource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "allAccessoryUUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __117__HMDUserDataController__migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel_transaction_settingModels___block_invoke_70;
      v41[3] = &unk_1E89C2198;
      v41[4] = v31;
      objc_msgSend(v36, "na_filter:", v41);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDUserListeningHistoryUpdateControlModel setAccessories:](v19, "setAccessories:", v37);
    }
    else
    {
      if (v33)
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v38;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@ULH was False for the user, NOT migrating accessories", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      -[HMDUserListeningHistoryUpdateControlModel setAccessories:](v19, "setAccessories:", MEMORY[0x1E0C9AA60]);
    }
    -[HMBModel hmbModelID](v19, "hmbModelID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSharedUserDataModel setUserListeningHistoryUpdateControlModelUUID:](v23, "setUserListeningHistoryUpdateControlModelUUID:", v39);

    objc_msgSend(v9, "addModel:", v19);
    objc_msgSend(v9, "addModel:", v23);

  }
  return v9;
}

- (BOOL)_userListeningHistoryValueFromModels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDUserDataController *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserDataController _keyPathToModelFromKeyPath:models:](self, "_keyPathToModelFromKeyPath:models:", CFSTR("root.music.playbackInfluencesForYou"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@setting model =%@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "numberValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@no setting model for ULH", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v12 = 1;
  }

  return v12;
}

- (id)_keyPathToModelFromKeyPath:(id)a3 models:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__HMDUserDataController__keyPathToModelFromKeyPath_models___block_invoke;
  v21[3] = &unk_1E89B7DA8;
  v10 = v8;
  v22 = v10;
  objc_msgSend(v6, "na_each:", v21);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __59__HMDUserDataController__keyPathToModelFromKeyPath_models___block_invoke_2;
  v18[3] = &unk_1E89B7DD0;
  v19 = v10;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  v12 = v10;
  objc_msgSend(v12, "na_each:", v18);
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EFAADEE0))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

- (void)_migrateUserSupportsAutomaticHH2MigrationUserCurrentDataModel:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDUserDataController *v10;
  NSObject *v11;
  void *v12;
  HMDUserSupportsAutomaticHH2MigrationModel *v13;
  void *v14;
  void *v15;
  HMDUserSupportsAutomaticHH2MigrationModel *v16;
  HMDSharedUserDataModel *v17;
  void *v18;
  void *v19;
  HMDSharedUserDataModel *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "supportsAutomaticHH2MigrationModelUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@current data model has UUID, not migrating user supports automatic HH2 migration", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v13 = [HMDUserSupportsAutomaticHH2MigrationModel alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userUUID](self, "userUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMBModel initWithModelID:parentModelID:](v13, "initWithModelID:parentModelID:", v14, v15);

    v17 = [HMDSharedUserDataModel alloc];
    -[HMDUserDataController userUUID](self, "userUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController homeUUID](self, "homeUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMBModel initWithModelID:parentModelID:](v17, "initWithModelID:parentModelID:", v18, v19);

    -[HMBModel hmbModelID](v16, "hmbModelID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSharedUserDataModel setSupportsAutomaticHH2MigrationModelUUID:](v20, "setSupportsAutomaticHH2MigrationModelUUID:", v21);

    v22 = MEMORY[0x1E0C9AAA0];
    -[HMDUserSupportsAutomaticHH2MigrationModel setSupportsAutomaticHH2Migration:](v16, "setSupportsAutomaticHH2Migration:", MEMORY[0x1E0C9AAA0]);
    -[HMDUserSupportsAutomaticHH2MigrationModel setSupportsHH2MigrationByOwnerAuto:](v16, "setSupportsHH2MigrationByOwnerAuto:", v22);
    objc_msgSend(v7, "addModel:", v16);
    objc_msgSend(v7, "addModel:", v20);

  }
}

- (void)initializePrivateZoneController:(id)a3 userDataModel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "settingsRootUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserDataController setPrivateSettingsRootUUID:](self, "setPrivateSettingsRootUUID:", v9);
  objc_msgSend(v7, "loadUserSettings");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDUserDataController privateSettingsController](self, "privateSettingsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadWithModels:", v12);

  -[HMDUserDataController privateSettingsController](self, "privateSettingsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configure");

  -[HMDUserDataController eventDidInitializePrivateZone](self, "eventDidInitializePrivateZone");
}

- (void)performFirstRunOperationsOnSharedZoneController:(id)a3
{
  NSObject *v4;
  void *v5;
  HMDUserDataController *v6;
  NSObject *v7;
  void *v8;
  id v9;
  HMDAssistantAccessControlModelV2 *v10;
  void *v11;
  void *v12;
  HMDAssistantAccessControlModelV2 *v13;
  uint64_t v14;
  HMDMediaContentProfileAccessControlModel *v15;
  void *v16;
  void *v17;
  HMDMediaContentProfileAccessControlModel *v18;
  HMDUserSupportsAutomaticHH2MigrationModel *v19;
  void *v20;
  void *v21;
  HMDUserSupportsAutomaticHH2MigrationModel *v22;
  uint64_t v23;
  void *v24;
  HMDUserDataController *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDSharedUserDataModel *v30;
  void *v31;
  void *v32;
  HMDSharedUserDataModel *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  HMDUserListeningHistoryUpdateControlModel *v41;
  void *v42;
  void *v43;
  HMDUserListeningHistoryUpdateControlModel *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  HMDSharedUserDataModel *v54;
  id v55;
  HMDMediaContentProfileAccessControlModel *v56;
  id v57;
  _QWORD v58[5];
  id v59;
  HMDSharedUserDataModel *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v68 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating user data model for shared user zone", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[HMDSettingTransaction initForInitialCreationWithTransactionLabel:]([HMDSettingTransaction alloc], "initForInitialCreationWithTransactionLabel:", CFSTR("Creating Shared User Data"));
  v10 = [HMDAssistantAccessControlModelV2 alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController userUUID](v6, "userUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMBModel initWithModelID:parentModelID:](v10, "initWithModelID:parentModelID:", v11, v12);

  v14 = MEMORY[0x1E0C9AA60];
  -[HMDAssistantAccessControlModelV2 setAccessoryUUIDs:](v13, "setAccessoryUUIDs:", MEMORY[0x1E0C9AA60]);
  -[HMDAssistantAccessControlModelV2 setSiriEndpointAccessoryUUIDs:](v13, "setSiriEndpointAccessoryUUIDs:", v14);
  v15 = [HMDMediaContentProfileAccessControlModel alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController userUUID](v6, "userUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMBModel initWithModelID:parentModelID:](v15, "initWithModelID:parentModelID:", v16, v17);

  -[HMDMediaContentProfileAccessControlModel setAccessories:](v18, "setAccessories:", v14);
  v19 = [HMDUserSupportsAutomaticHH2MigrationModel alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController userUUID](v6, "userUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMBModel initWithModelID:parentModelID:](v19, "initWithModelID:parentModelID:", v20, v21);

  v23 = MEMORY[0x1E0C9AAA0];
  -[HMDUserSupportsAutomaticHH2MigrationModel setSupportsAutomaticHH2Migration:](v22, "setSupportsAutomaticHH2Migration:", MEMORY[0x1E0C9AAA0]);
  v24 = (void *)MEMORY[0x1D17BA0A0](-[HMDUserSupportsAutomaticHH2MigrationModel setSupportsHH2MigrationByOwnerAuto:](v22, "setSupportsHH2MigrationByOwnerAuto:", v23));
  v25 = v6;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v68 = v27;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Configuring and making shared settings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  -[HMDUserDataController sharedSettingsController](v25, "sharedSettingsController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "modelsToMakeSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = [HMDSharedUserDataModel alloc];
  -[HMDUserDataController userUUID](v25, "userUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController homeUUID](v25, "homeUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[HMBModel initWithModelID:parentModelID:](v30, "initWithModelID:parentModelID:", v31, v32);

  -[HMBModel hmbModelID](v13, "hmbModelID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSharedUserDataModel setAssistantAccessControlModelUUID:](v33, "setAssistantAccessControlModelUUID:", v34);

  -[HMBModel hmbModelID](v18, "hmbModelID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSharedUserDataModel setMediaContentProfileAccessControlModelUUID:](v33, "setMediaContentProfileAccessControlModelUUID:", v35);

  -[HMBModel hmbModelID](v22, "hmbModelID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSharedUserDataModel setSupportsAutomaticHH2MigrationModelUUID:](v33, "setSupportsAutomaticHH2MigrationModelUUID:", v36);

  -[HMDUserDataController userUUID](v25, "userUUID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  __rootSettingUUIDInSettingModels(v29, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSharedUserDataModel setSettingsRootUUID:](v33, "setSettingsRootUUID:", v38);

  objc_msgSend(v9, "addModelToBeUpdated:", v33);
  objc_msgSend(v9, "addModelToBeUpdated:", v13);
  v56 = v18;
  objc_msgSend(v9, "addModelToBeUpdated:", v18);
  v39 = _os_feature_enabled_impl();
  v40 = MEMORY[0x1E0C809B0];
  if (v39)
  {
    v41 = [HMDUserListeningHistoryUpdateControlModel alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userUUID](v25, "userUUID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[HMBModel initWithModelID:parentModelID:](v41, "initWithModelID:parentModelID:", v42, v43);

    -[HMDUserDataController dataSource](v25, "dataSource");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "allAccessoryUUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __73__HMDUserDataController_performFirstRunOperationsOnSharedZoneController___block_invoke;
    v65[3] = &unk_1E89C2198;
    v65[4] = v25;
    objc_msgSend(v46, "na_filter:", v65);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = MEMORY[0x1E0C809B0];
    -[HMDUserListeningHistoryUpdateControlModel setAccessories:](v44, "setAccessories:", v47);
    -[HMBModel hmbModelID](v44, "hmbModelID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSharedUserDataModel setUserListeningHistoryUpdateControlModelUUID:](v33, "setUserListeningHistoryUpdateControlModelUUID:", v48);

    objc_msgSend(v9, "addModelToBeUpdated:", v44);
  }
  objc_msgSend(v9, "addModelToBeUpdated:", v22);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v49 = v29;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v62;
    do
    {
      v53 = 0;
      do
      {
        if (*(_QWORD *)v62 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(v9, "addModelToBeUpdated:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v53++));
      }
      while (v51 != v53);
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v51);
  }

  v58[0] = v40;
  v58[1] = 3221225472;
  v58[2] = __73__HMDUserDataController_performFirstRunOperationsOnSharedZoneController___block_invoke_2;
  v58[3] = &unk_1E89C0DA8;
  v58[4] = v25;
  v59 = v57;
  v60 = v33;
  v54 = v33;
  v55 = v57;
  objc_msgSend(v55, "runTransaction:waitForCloudPush:completion:", v9, 1, v58);

}

- (void)_startSharedZoneFirstLoadTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDUserDataController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserDataController sharedZoneFirstLoadTimer](self, "sharedZoneFirstLoadTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HMDUserDataController timerCreator](self, "timerCreator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createExponentialBackoffTimerForZoneFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setSharedZoneFirstLoadTimer:](self, "setSharedZoneFirstLoadTimer:", v6);

    -[HMDUserDataController sharedZoneFirstLoadTimer](self, "sharedZoneFirstLoadTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController sharedZoneFirstLoadTimer](v9, "sharedZoneFirstLoadTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting timer to perform first run operations on shared zone. %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDUserDataController sharedZoneFirstLoadTimer](v9, "sharedZoneFirstLoadTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");

  }
}

- (void)_invalidateSharedZoneFirstLoadTimer
{
  void *v3;
  void *v4;

  -[HMDUserDataController sharedZoneFirstLoadTimer](self, "sharedZoneFirstLoadTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDUserDataController sharedZoneFirstLoadTimer](self, "sharedZoneFirstLoadTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[HMDUserDataController setSharedZoneFirstLoadTimer:](self, "setSharedZoneFirstLoadTimer:", 0);
  }
}

- (void)performFirstRunOperationsOnPrivateZoneController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDUserDataController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDUserDataController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDPrivateUserDataModel *v16;
  void *v17;
  void *v18;
  HMDPrivateUserDataModel *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  HMDPrivateUserDataModel *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  HMDPrivateUserDataModel *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating user data model for private user zone", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = v7;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring and making private settings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDUserDataController privateSettingsController](v11, "privateSettingsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelsToMakeSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [HMDPrivateUserDataModel alloc];
  -[HMDUserDataController userUUID](v11, "userUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController homeUUID](v11, "homeUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMBModel initWithModelID:parentModelID:](v16, "initWithModelID:parentModelID:", v17, v18);

  -[HMDUserDataController userUUID](v11, "userUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  __rootSettingUUIDInSettingModels(v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPrivateUserDataModel setSettingsRootUUID:](v19, "setSettingsRootUUID:", v21);

  v22 = -[HMDSettingTransaction initForInitialCreationWithTransactionLabel:]([HMDSettingTransaction alloc], "initForInitialCreationWithTransactionLabel:", CFSTR("Creating Private User Data"));
  objc_msgSend(v22, "addModelToBeUpdated:", v19);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = v15;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v34;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v22, "addModelToBeUpdated:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v27++));
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v25);
  }

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __74__HMDUserDataController_performFirstRunOperationsOnPrivateZoneController___block_invoke;
  v30[3] = &unk_1E89C0DA8;
  v30[4] = v11;
  v31 = v4;
  v32 = v19;
  v28 = v19;
  v29 = v4;
  objc_msgSend(v29, "runTransaction:waitForCloudPush:completion:", v22, 1, v30);

}

- (void)_startPrivateZoneFirstLoadTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDUserDataController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserDataController privateZoneFirstLoadTimer](self, "privateZoneFirstLoadTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HMDUserDataController timerCreator](self, "timerCreator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createExponentialBackoffTimerForZoneFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setPrivateZoneFirstLoadTimer:](self, "setPrivateZoneFirstLoadTimer:", v6);

    -[HMDUserDataController privateZoneFirstLoadTimer](self, "privateZoneFirstLoadTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController privateZoneFirstLoadTimer](v9, "privateZoneFirstLoadTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting timer to perform first run operations on shared zone. %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDUserDataController privateZoneFirstLoadTimer](v9, "privateZoneFirstLoadTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");

  }
}

- (void)_invalidatePrivateZoneFirstLoadTimer
{
  void *v3;
  void *v4;

  -[HMDUserDataController privateZoneFirstLoadTimer](self, "privateZoneFirstLoadTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDUserDataController privateZoneFirstLoadTimer](self, "privateZoneFirstLoadTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[HMDUserDataController setPrivateZoneFirstLoadTimer:](self, "setPrivateZoneFirstLoadTimer:", 0);
  }
}

- (void)_startupSharedZone
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDUserDataController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDSettingTransaction *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  HMDUserDataController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDUserDataController *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedZoneControllerForUserDataController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  objc_msgSend(v4, "loadSharedUserDataModelWithError:", &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Loaded user data model from local zone.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "loadUserSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDUserDataController isCurrentUser](v8, "isCurrentUser"))
    {
      -[HMDUserDataController sharedSettingsController](v8, "sharedSettingsController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loadWithModels:", v11);

      v13 = -[HMDSettingTransaction initWithTransactionLabel:]([HMDSettingTransaction alloc], "initWithTransactionLabel:", CFSTR("Migration"));
      -[HMDUserDataController sharedSettingsController](v8, "sharedSettingsController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v6;
      v15 = (id)objc_msgSend(v14, "migrateSettingsTransactionWithTransaction:error:", v13, &v30);
      v16 = v30;

      if (_os_feature_enabled_impl())
        v17 = -[HMDUserDataController _migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel:transaction:settingModels:](v8, "_migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel:transaction:settingModels:", v5, v13, v11);
      v18 = -[HMDUserDataController _migrateUserSupportsAutomaticHH2MigrationUserCurrentDataModel:transaction:](v8, "_migrateUserSupportsAutomaticHH2MigrationUserCurrentDataModel:transaction:", v5, v13);
      if (v16)
      {
        v19 = (void *)MEMORY[0x1D17BA0A0](v18);
        v20 = v8;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v22;
          v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error migrating user data models in shared zone %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        -[HMDUserDataController _startSharedZoneFirstLoadTimer](v20, "_startSharedZoneFirstLoadTimer");
      }
      else
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __43__HMDUserDataController__startupSharedZone__block_invoke;
        v27[3] = &unk_1E89C0DA8;
        v27[4] = v8;
        v28 = 0;
        v29 = v4;
        objc_msgSend(v29, "runTransaction:waitForCloudPush:completion:", v13, 1, v27);

      }
      v6 = v16;
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v8;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v26;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@We are not current user, no migration should happen on a non-current user zone", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      -[HMDUserDataController initializeSharedZoneController:userDataModel:](v24, "initializeSharedZoneController:userDataModel:", v4, v5);
      -[HMDUserDataController _invalidateSharedZoneFirstLoadTimer](v24, "_invalidateSharedZoneFirstLoadTimer");
    }

  }
  else
  {
    -[HMDUserDataController performFirstRunOperationsOnSharedZoneController:](self, "performFirstRunOperationsOnSharedZoneController:", v4);
  }

}

- (void)_startupPrivateZone
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDUserDataController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDSettingTransaction *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  HMDUserDataController *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateZoneControllerForUserDataController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v4, "loadPrivateUserDataModelWithError:", &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Loaded user data model from local zone.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "loadUserSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController privateSettingsController](v8, "privateSettingsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadWithModels:", v11);

    v13 = -[HMDSettingTransaction initWithTransactionLabel:]([HMDSettingTransaction alloc], "initWithTransactionLabel:", CFSTR("Private user setting model migration"));
    -[HMDUserDataController privateSettingsController](v8, "privateSettingsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v6;
    v15 = (id)objc_msgSend(v14, "migrateSettingsTransactionWithTransaction:error:", v13, &v24);
    v16 = v24;

    if (v16)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v8;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v20;
        v28 = 2112;
        v29 = v16;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error migrating user data models in private zone %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDUserDataController _startPrivateZoneFirstLoadTimer](v18, "_startPrivateZoneFirstLoadTimer");
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __44__HMDUserDataController__startupPrivateZone__block_invoke;
      v21[3] = &unk_1E89C0DA8;
      v21[4] = v8;
      v22 = v4;
      v23 = v5;
      objc_msgSend(v22, "runTransaction:waitForCloudPush:completion:", v13, 1, v21);

    }
  }
  else
  {
    -[HMDUserDataController performFirstRunOperationsOnPrivateZoneController:](self, "performFirstRunOperationsOnPrivateZoneController:", v4);
    v16 = v6;
  }

}

- (void)handleStartForZoneController:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserDataController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "sharedZoneControllerForUserDataController:", self);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      -[HMDUserDataController _startupSharedZone](self, "_startupSharedZone");
    }
    else
    {
      objc_msgSend(v5, "privateZoneControllerForUserDataController:", self);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v8)
        -[HMDUserDataController _startupPrivateZone](self, "_startupPrivateZone");
    }
  }

}

- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 requireAuthenticationForSecureRequests:(BOOL)a4 activityNotificationsEnabledForPersonalRequests:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void (**v11)(id, void *);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDUserDataController *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDAssistantAccessControlModelV2 *v30;
  void *v31;
  void *v32;
  HMDAssistantAccessControlModelV2 *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDSettingTransaction *v42;
  void *v43;
  HMDUserDataController *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  HMDUserDataController *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  HMDUserDataController *v56;
  NSObject *v57;
  void *v58;
  unsigned int v59;
  _BOOL4 v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  HMDUserDataController *v64;
  _QWORD v65[4];
  id v66;
  HMDUserDataController *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v7 = a5;
  v8 = a4;
  v79 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (-[HMDUserDataController isInitialized](self, "isInitialized"))
  {
    v59 = v8;
    v60 = v7;
    -[HMDUserDataController assistantAccessControlAccessoryUUIDs](self, "assistantAccessControlAccessoryUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v10;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_setByRemovingObjectsFromSet:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDUserDataController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v69;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v69 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          if ((objc_msgSend(v16, "userDataController:isPersonalRequestCapableAccessoryID:", self, v22) & 1) == 0)
          {
            v47 = (void *)MEMORY[0x1D17BA0A0]();
            v48 = self;
            HMFGetOSLogHandle();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v73 = v50;
              v74 = 2112;
              v75 = v22;
              _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_INFO, "%{public}@Unable to validate accessory %@, skipping", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v47);
            v51 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2025);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Could not validate accessory"), CFSTR("Need all newly added accessories to be valid"), 0, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v11[2](v11, v53);

            v10 = v61;
            goto LABEL_22;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        if (v19)
          continue;
        break;
      }
    }

    -[HMDUserDataController assistantAccessControlAccessoryUUIDs](self, "assistantAccessControlAccessoryUUIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v61;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v61);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToSet:", v24)
      && -[HMDUserDataController assistantAccessControlActivityNotificationsEnabledForPersonalRequests](self, "assistantAccessControlActivityNotificationsEnabledForPersonalRequests") == v60)
    {
      v54 = -[HMDUserDataController assistantAccessControlRequiresAuthenticationForSecureRequests](self, "assistantAccessControlRequiresAuthenticationForSecureRequests");

      if (v54 == v59)
      {
        v55 = (void *)MEMORY[0x1D17BA0A0]();
        v56 = self;
        HMFGetOSLogHandle();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v73 = v58;
          _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_INFO, "%{public}@Nothing to modify.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v55);
        v11[2](v11, 0);
        goto LABEL_22;
      }
    }
    else
    {

    }
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v60);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v73 = v28;
      v74 = 2112;
      v75 = v61;
      v76 = 2112;
      v77 = v29;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Updating user assistant access control accessories: %@, activity notifications enabled for personal requests: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    v30 = [HMDAssistantAccessControlModelV2 alloc];
    -[HMDUserDataController assistantAccessControlModelUUID](v26, "assistantAccessControlModelUUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userUUID](v26, "userUUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HMBModel initWithModelID:parentModelID:](v30, "initWithModelID:parentModelID:", v31, v32);

    v34 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __173__HMDUserDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_requireAuthenticationForSecureRequests_activityNotificationsEnabledForPersonalRequests_completion___block_invoke;
    v65[3] = &unk_1E89B7DF8;
    v35 = v16;
    v66 = v35;
    v67 = v26;
    objc_msgSend(v61, "na_filter:", v65);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControlModelV2 setAccessoryUUIDs:](v33, "setAccessoryUUIDs:", v36);

    v62[0] = v34;
    v10 = v61;
    v62[1] = 3221225472;
    v62[2] = __173__HMDUserDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_requireAuthenticationForSecureRequests_activityNotificationsEnabledForPersonalRequests_completion___block_invoke_2;
    v62[3] = &unk_1E89B7DF8;
    v37 = v35;
    v63 = v37;
    v64 = v26;
    objc_msgSend(v61, "na_filter:", v62);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControlModelV2 setSiriEndpointAccessoryUUIDs:](v33, "setSiriEndpointAccessoryUUIDs:", v38);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v60);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControlModelV2 setActivityNotificationsEnabledForPersonalRequests:](v33, "setActivityNotificationsEnabledForPersonalRequests:", v39);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControlModelV2 setRequiresAuthenticationForSecureRequests:](v33, "setRequiresAuthenticationForSecureRequests:", v40);

    objc_msgSend(v37, "sharedZoneControllerForUserDataController:", v26);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[HMDSettingTransaction initWithTransactionLabel:]([HMDSettingTransaction alloc], "initWithTransactionLabel:", CFSTR("Update user assistant access control"));
    -[HMDSettingTransaction addModelToBeUpdated:](v42, "addModelToBeUpdated:", v33);
    objc_msgSend(v41, "runTransaction:waitForCloudPush:completion:", v42, 0, v11);

LABEL_22:
    goto LABEL_23;
  }
  v43 = (void *)MEMORY[0x1D17BA0A0]();
  v44 = self;
  HMFGetOSLogHandle();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v73 = v46;
    _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Not initialized yet", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v43);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Not ready"), CFSTR("Initialization is not complete"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v13);
LABEL_23:

}

- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, HMDSettingTransaction *);
  NSObject *v8;
  HMDSettingTransaction *v9;
  void *v10;
  HMDMediaContentProfileAccessControlModel *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  HMDUserDataController *v18;
  NSObject *v19;
  void *v20;
  HMDMediaContentProfileAccessControlModel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDSettingTransaction *v26;
  void *v27;
  HMDUserDataController *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDUserDataController *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, HMDSettingTransaction *))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[HMDUserDataController isInitialized](self, "isInitialized"))
  {
    -[HMDUserDataController delegate](self, "delegate");
    v9 = (HMDSettingTransaction *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v11 = (HMDMediaContentProfileAccessControlModel *)v6;
    v12 = -[HMDMediaContentProfileAccessControlModel countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (!-[HMDSettingTransaction userDataController:isMediaContentProfileCapableAccessoryID:](v9, "userDataController:isMediaContentProfileCapableAccessoryID:", self, v16, (_QWORD)v36))
          {
            v31 = (void *)MEMORY[0x1D17BA0A0]();
            v32 = self;
            HMFGetOSLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v41 = v34;
              v42 = 2112;
              v43 = v16;
              _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Unable to validate accessory %@, skipping", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v31);
            v35 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2026);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Could not validate accessory"), CFSTR("Need all accessories to be valid"), 0, v25);
            v26 = (HMDSettingTransaction *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v26);
            goto LABEL_19;
          }
          objc_msgSend(v10, "addObject:", v16);
        }
        v13 = -[HMDMediaContentProfileAccessControlModel countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v13)
          continue;
        break;
      }
    }

    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      v42 = 2112;
      v43 = v10;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Running transaction to update media content profile access control to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v21 = [HMDMediaContentProfileAccessControlModel alloc];
    -[HMDUserDataController mediaContentProfileAccessControlModelUUID](v18, "mediaContentProfileAccessControlModelUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userUUID](v18, "userUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMBModel initWithModelID:parentModelID:](v21, "initWithModelID:parentModelID:", v22, v23);

    objc_msgSend(v10, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaContentProfileAccessControlModel setAccessories:](v11, "setAccessories:", v24);

    -[HMDSettingTransaction sharedZoneControllerForUserDataController:](v9, "sharedZoneControllerForUserDataController:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HMDSettingTransaction initWithTransactionLabel:]([HMDSettingTransaction alloc], "initWithTransactionLabel:", CFSTR("Update media content profile access control"));
    -[HMDSettingTransaction addModelToBeUpdated:](v26, "addModelToBeUpdated:", v11);
    objc_msgSend(v25, "runTransaction:waitForCloudPush:completion:", v26, 0, v7);
LABEL_19:

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v30;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Not initialized yet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Not ready"), CFSTR("Initialization is not complete"), 0);
    v9 = (HMDSettingTransaction *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);
  }

}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, HMDSettingTransaction *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDUserListeningHistoryUpdateControlModel *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  HMDUserDataController *v22;
  NSObject *v23;
  void *v24;
  HMDUserListeningHistoryUpdateControlModel *v25;
  void *v26;
  void *v27;
  HMDUserListeningHistoryUpdateControlModel *v28;
  void *v29;
  void *v30;
  HMDSettingTransaction *v31;
  HMDSettingTransaction *v32;
  void *v33;
  HMDUserDataController *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDUserDataController *v38;
  NSObject *v39;
  void *v40;
  HMDSettingTransaction *v41;
  void *v42;
  HMDUserDataController *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, HMDSettingTransaction *))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (-[HMDUserDataController isInitialized](self, "isInitialized"))
    {
      -[HMDUserDataController userListeningHistoryUpdateControlModelAccessories](self, "userListeningHistoryUpdateControlModelAccessories");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v9;
      objc_msgSend(v10, "na_setByRemovingObjectsFromSet:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDUserDataController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v14 = v11;
      v15 = -[HMDUserListeningHistoryUpdateControlModel countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v49 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if ((objc_msgSend(v12, "userDataController:isAccessoryUserListeningHistoryUpdateCapable:", self, v19) & 1) == 0)
            {
              v42 = (void *)MEMORY[0x1D17BA0A0]();
              v43 = self;
              HMFGetOSLogHandle();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v53 = v45;
                v54 = 2112;
                v55 = v19;
                _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Unable to validate accessory %@, skipping", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v42);
              v46 = (void *)MEMORY[0x1E0CB35C8];
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2027);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Could not validate accessory"), CFSTR("Need all accessories to be valid"), 0, v30);
              v31 = (HMDSettingTransaction *)objc_claimAutoreleasedReturnValue();
              v7[2](v7, v31);
              v28 = v14;
              goto LABEL_23;
            }
          }
          v16 = -[HMDUserListeningHistoryUpdateControlModel countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v16)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v24;
        v54 = 2112;
        v55 = v20;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Running transaction to update user listening history update control to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v25 = [HMDUserListeningHistoryUpdateControlModel alloc];
      -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v22, "userListeningHistoryUpdateControlModelUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController userUUID](v22, "userUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HMBModel initWithModelID:parentModelID:](v25, "initWithModelID:parentModelID:", v26, v27);

      objc_msgSend(v20, "allObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserListeningHistoryUpdateControlModel setAccessories:](v28, "setAccessories:", v29);

      objc_msgSend(v12, "sharedZoneControllerForUserDataController:", v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[HMDSettingTransaction initWithTransactionLabel:]([HMDSettingTransaction alloc], "initWithTransactionLabel:", CFSTR("Update user listening history update control"));
      -[HMDSettingTransaction addModelToBeUpdated:](v31, "addModelToBeUpdated:", v28);
      objc_msgSend(v30, "runTransaction:waitForCloudPush:completion:", v31, 0, v7);
      v13 = v20;
LABEL_23:

    }
    else
    {
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v40;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Not initialized yet", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Not ready"), CFSTR("Initialization is not complete"), 0);
      v41 = (HMDSettingTransaction *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v41);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
    v32 = (HMDSettingTransaction *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v32);

    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v36;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@FF disabled, not updating ULH", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
  }

}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDUserDataController *v7;
  NSObject *v8;
  void *v9;
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
  -[HMDUserDataController userListeningHistoryUpdateControlModelAccessories](self, "userListeningHistoryUpdateControlModelAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@ULH for accessory %@ is already enabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    objc_msgSend(v5, "addObject:", v4);
    v10 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v5, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObjects:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__HMDUserDataController_enableUserListeningHistoryForAccessory___block_invoke;
    v13[3] = &unk_1E89C21C0;
    v13[4] = self;
    v14 = v4;
    -[HMDUserDataController handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:completion:](self, "handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:completion:", v12, v13);

  }
}

- (void)updateSupportsHH2MigrationByOwnerManual:(BOOL)a3 supportsHH2MigrationByOwnerAuto:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void (**v8)(id, _QWORD);
  void *v9;
  HMDUserSupportsAutomaticHH2MigrationModel *v10;
  void *v11;
  void *v12;
  HMDUserSupportsAutomaticHH2MigrationModel *v13;
  BOOL v14;
  void *v15;
  void *v16;
  HMDUserDataController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDUserDataController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDUserDataController *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDUserDataController *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDSettingTransaction *v38;
  void *v39;
  void *v40;
  HMDUserSupportsAutomaticHH2MigrationModel *v41;
  HMDUserSupportsAutomaticHH2MigrationModel *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v5 = a4;
  v6 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD))a5;
  if (-[HMDUserDataController isInitialized](self, "isInitialized"))
  {
    -[HMDUserDataController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [HMDUserSupportsAutomaticHH2MigrationModel alloc];
    -[HMDUserDataController supportsAutomaticHH2MigrationModelUUID](self, "supportsAutomaticHH2MigrationModelUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userUUID](self, "userUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMBModel initWithModelID:parentModelID:](v10, "initWithModelID:parentModelID:", v11, v12);

    v14 = -[HMDUserDataController supportsHH2MigrationByOwnerManual](self, "supportsHH2MigrationByOwnerManual") ^ v6;
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserSupportsAutomaticHH2MigrationModel setSupportsAutomaticHH2Migration:](v13, "setSupportsAutomaticHH2Migration:", v15);

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v39 = v20;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v23;
        v45 = 2112;
        v46 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Supports automatic HH2 migration by owner manual is already set to %@", buf, 0x16u);

        v20 = v39;
        v13 = v41;
      }

      objc_autoreleasePoolPop(v20);
    }
    if (-[HMDUserDataController supportsHH2MigrationByOwnerAuto](self, "supportsHH2MigrationByOwnerAuto", v39) == v5)
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = v26;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v42 = v13;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v29;
        v45 = 2112;
        v46 = v30;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Supports automatic HH2 migration by owner auto is already set to %@", buf, 0x16u);

        v13 = v42;
        v26 = v40;
      }

      objc_autoreleasePoolPop(v26);
      if (!v14)
      {
        v8[2](v8, 0);
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserSupportsAutomaticHH2MigrationModel setSupportsHH2MigrationByOwnerAuto:](v13, "setSupportsHH2MigrationByOwnerAuto:", v25);

    }
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v34;
      v45 = 2112;
      v46 = v35;
      v47 = 2112;
      v48 = v36;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Running transaction to update user supports HH2 migration status by owner manual to %@, by owner auto to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(v9, "sharedZoneControllerForUserDataController:", v32);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HMDSettingTransaction initWithTransactionLabel:]([HMDSettingTransaction alloc], "initWithTransactionLabel:", CFSTR("Update user supports automatic HH2 migration"));
    -[HMDSettingTransaction addModelToBeUpdated:](v38, "addModelToBeUpdated:", v13);
    objc_msgSend(v37, "runTransaction:waitForCloudPush:completion:", v38, 0, v8);

    goto LABEL_19;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v19;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Not initialized yet", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Not ready"), CFSTR("Initialization is not complete"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v8)[2](v8, v9);
LABEL_20:

}

- (void)handleRemovedAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (HMBModel)assistantAccessControlModelToReset
{
  void *v3;
  HMDAssistantAccessControlModelV2 *v4;
  void *v5;
  void *v6;
  HMDAssistantAccessControlModelV2 *v7;
  uint64_t v8;

  -[HMDUserDataController assistantAccessControlModelUUID](self, "assistantAccessControlModelUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HMDAssistantAccessControlModelV2 alloc];
    -[HMDUserDataController assistantAccessControlModelUUID](self, "assistantAccessControlModelUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userUUID](self, "userUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMBModel initWithModelID:parentModelID:](v4, "initWithModelID:parentModelID:", v5, v6);

    v8 = MEMORY[0x1E0C9AA60];
    -[HMDAssistantAccessControlModelV2 setAccessoryUUIDs:](v7, "setAccessoryUUIDs:", MEMORY[0x1E0C9AA60]);
    -[HMDAssistantAccessControlModelV2 setSiriEndpointAccessoryUUIDs:](v7, "setSiriEndpointAccessoryUUIDs:", v8);
  }
  else
  {
    v7 = 0;
  }
  return (HMBModel *)v7;
}

- (id)updateListeningHistoryModelToReset
{
  void *v3;
  HMDUserListeningHistoryUpdateControlModel *v4;
  void *v5;
  void *v6;
  HMDUserListeningHistoryUpdateControlModel *v7;

  -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](self, "userListeningHistoryUpdateControlModelUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HMDUserListeningHistoryUpdateControlModel alloc];
    -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](self, "userListeningHistoryUpdateControlModelUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userUUID](self, "userUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMBModel initWithModelID:parentModelID:](v4, "initWithModelID:parentModelID:", v5, v6);

    -[HMDUserListeningHistoryUpdateControlModel setAccessories:](v7, "setAccessories:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)sharedUserDataModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  HMDUserDataController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDUserDataController *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDUserDataController *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  HMDUserDataController *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDUserDataController *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  HMDUserDataController *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  HMDUserDataController *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (_os_feature_enabled_impl())
  {
    -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](self, "userListeningHistoryUpdateControlModelUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userListeningHistoryUpdateControlModelUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) != 0)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v85 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@User Shared model changed, but no diff in ULH uuid", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }
    else
    {
      v80 = v10;
      -[HMDUserDataController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sharedZoneControllerForUserDataController:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v22, "userListeningHistoryUpdateControlModelUUID");
        v75 = v20;
        v25 = v19;
        v26 = v9;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "userListeningHistoryUpdateControlModelUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v85 = v24;
        v86 = 2112;
        v87 = v27;
        v88 = 2112;
        v89 = v28;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Registering and Loading user listening history update since the UUID flipped from =%@, to =%@", buf, 0x20u);

        v9 = v26;
        v19 = v25;
        v20 = v75;

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v8, "userListeningHistoryUpdateControlModelUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController setUserListeningHistoryUpdateControlModelUUID:](v22, "setUserListeningHistoryUpdateControlModelUUID:", v29);

      -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v22, "userListeningHistoryUpdateControlModelUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      objc_msgSend(v20, "loadUserListeningHistoryUpdateControlModelWithModelID:error:", v30, &v83);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v83;

      -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v22, "userListeningHistoryUpdateControlModelUUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "registerForUserListeningHistoryUpdateControlModelUpdates:modelID:", v22, v32);

      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v22;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v31)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "accessories");
          v76 = v20;
          v38 = v19;
          v39 = v9;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = v37;
          v86 = 2112;
          v87 = v40;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Loaded user listening history update accessories %@", buf, 0x16u);

          v9 = v39;
          v19 = v38;
          v20 = v76;

        }
        objc_autoreleasePoolPop(v33);
        v41 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(v31, "accessories");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setWithArray:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserDataController setUserListeningHistoryUpdateControlModelAccessories:](v34, "setUserListeningHistoryUpdateControlModelAccessories:", v43);

        objc_msgSend(v19, "userDataControllerDidUpdateUserListeningHistoryUpdateControl:", v34);
      }
      else
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = v44;
          v86 = 2112;
          v87 = v78;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to load update listening history accessories %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
      }

      v10 = v80;
    }
  }
  -[HMDUserDataController supportsAutomaticHH2MigrationModelUUID](self, "supportsAutomaticHH2MigrationModelUUID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supportsAutomaticHH2MigrationModelUUID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v45, "isEqual:", v46);

  if ((v47 & 1) == 0)
  {
    v79 = v9;
    v81 = v10;
    -[HMDUserDataController delegate](self, "delegate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "sharedZoneControllerForUserDataController:", self);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x1D17BA0A0]();
    v55 = self;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController supportsAutomaticHH2MigrationModelUUID](v55, "supportsAutomaticHH2MigrationModelUUID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "supportsAutomaticHH2MigrationModelUUID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v85 = v57;
      v86 = 2112;
      v87 = v58;
      v88 = 2112;
      v89 = v59;
      _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_INFO, "%{public}@Registering and Loading user support automatic HH2 migration UUID flipped from =%@, to =%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v54);
    objc_msgSend(v8, "supportsAutomaticHH2MigrationModelUUID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setSupportsAutomaticHH2MigrationModelUUID:](v55, "setSupportsAutomaticHH2MigrationModelUUID:", v60);

    -[HMDUserDataController supportsAutomaticHH2MigrationModelUUID](v55, "supportsAutomaticHH2MigrationModelUUID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    objc_msgSend(v53, "loadUserSupportsAutomaticHH2MigrationModelWithModelID:error:", v61, &v82);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v82;

    -[HMDUserDataController supportsAutomaticHH2MigrationModelUUID](v55, "supportsAutomaticHH2MigrationModelUUID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "registerForUserSupportsAutomaticHH2MigrationModelUpdates:modelID:", v55, v64);

    if (v62)
    {
      objc_msgSend(v62, "supportsAutomaticHH2Migration");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController setSupportsHH2MigrationByOwnerManual:](v55, "setSupportsHH2MigrationByOwnerManual:", objc_msgSend(v65, "BOOLValue"));

      objc_msgSend(v62, "supportsHH2MigrationByOwnerAuto");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController setSupportsHH2MigrationByOwnerAuto:](v55, "setSupportsHH2MigrationByOwnerAuto:", objc_msgSend(v66, "BOOLValue"));

      v67 = (void *)MEMORY[0x1D17BA0A0]();
      v68 = v55;
      HMFGetOSLogHandle();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserDataController supportsHH2MigrationByOwnerManual](v68, "supportsHH2MigrationByOwnerManual");
        HMFBooleanToString();
        v77 = v63;
        v71 = v52;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserDataController supportsHH2MigrationByOwnerAuto](v68, "supportsHH2MigrationByOwnerAuto");
        HMFBooleanToString();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v85 = v70;
        v86 = 2114;
        v87 = v72;
        v88 = 2114;
        v89 = v73;
        _os_log_impl(&dword_1CD062000, v69, OS_LOG_TYPE_INFO, "%{public}@Loaded user supports automatic HH2 migration model by owner manual = %{public}@, by owner auto = %{public}@", buf, 0x20u);

        v52 = v71;
        v63 = v77;
LABEL_27:

      }
    }
    else
    {
      v67 = (void *)MEMORY[0x1D17BA0A0]();
      v74 = v55;
      HMFGetOSLogHandle();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v85 = v70;
        v86 = 2112;
        v87 = v63;
        _os_log_impl(&dword_1CD062000, v69, OS_LOG_TYPE_ERROR, "%{public}@Unable to load user supports automatic HH2 migration model %@", buf, 0x16u);
        goto LABEL_27;
      }
    }

    objc_autoreleasePoolPop(v67);
    v9 = v79;
    v10 = v81;
    goto LABEL_29;
  }
  v48 = (void *)MEMORY[0x1D17BA0A0]();
  v49 = self;
  HMFGetOSLogHandle();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v85 = v51;
    _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_INFO, "%{public}@User Shared model changed, but no diff in USAHH2M uuid", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v48);
LABEL_29:

}

- (void)assistantAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDUserDataController *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void (**v25)(id, id);
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  int v30;
  void *v31;
  HMDUserDataController *v32;
  NSObject *v33;
  void *v34;
  unsigned int v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (objc_msgSend(v8, "hmbPropertyWasSet:", CFSTR("activityNotificationsEnabledForPersonalRequests")))
  {
    objc_msgSend(v8, "activityNotificationsEnabledForPersonalRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

  }
  else
  {
    v13 = 1;
  }
  objc_msgSend(v8, "requiresAuthenticationForSecureRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryUUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_safeAddObjectsFromArray:", v17);

  objc_msgSend(v8, "siriEndpointAccessoryUUIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_safeAddObjectsFromArray:", v18);

  -[HMDUserDataController assistantAccessControlAccessoryUUIDs](self, "assistantAccessControlAccessoryUUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "isEqualToSet:", v16)
    || (_DWORD)v13 != -[HMDUserDataController assistantAccessControlActivityNotificationsEnabledForPersonalRequests](self, "assistantAccessControlActivityNotificationsEnabledForPersonalRequests"))
  {

LABEL_7:
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = v15;
      v23 = v9;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requiresAuthenticationForSecureRequests");
      v25 = v10;
      v26 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v24;
      v38 = 2112;
      v39 = v27;
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating assistant access control on zone update to require auth: %@, accessories:%@", buf, 0x20u);

      v13 = v26;
      v10 = v25;

      v9 = v23;
      v15 = v35;
    }

    objc_autoreleasePoolPop(v20);
    -[HMDUserDataController setAssistantAccessControlAccessoryUUIDs:](v21, "setAssistantAccessControlAccessoryUUIDs:", v16);
    -[HMDUserDataController setAssistantAccessControlRequiresAuthenticationForSecureRequests:](v21, "setAssistantAccessControlRequiresAuthenticationForSecureRequests:", v15);
    -[HMDUserDataController setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:](v21, "setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:", v13);
    -[HMDUserDataController delegate](v21, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "userDataControllerDidUpdateAssistantAccessControl:", v21);

    goto LABEL_10;
  }
  v30 = -[HMDUserDataController assistantAccessControlRequiresAuthenticationForSecureRequests](self, "assistantAccessControlRequiresAuthenticationForSecureRequests");

  if ((_DWORD)v15 != v30)
    goto LABEL_7;
  v31 = (void *)MEMORY[0x1D17BA0A0]();
  v32 = self;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v34;
    v38 = 2112;
    v39 = v8;
    _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Model in zone update has no changes %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v31);
LABEL_10:
  v29 = objc_alloc_init(MEMORY[0x1E0D32C18]);
  v10[2](v10, v29);

}

- (void)assistantAccessControlModelRemoved:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  HMDUserDataController *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Assistant access control was removed", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v13 = objc_alloc_init(MEMORY[0x1E0D32C18]);
  v7[2](v7, v13);

}

- (NSDictionary)sharedSettingValuesByKeyPath
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDUserDataController sharedSettingsController](self, "sharedSettingsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDUserDataController sharedSettingsController](self, "sharedSettingsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingValuesByKeyPathWithPrefix:", CFSTR("shared"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v5;
}

- (NSDictionary)privateSettingValuesByKeyPath
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDUserDataController privateSettingsController](self, "privateSettingsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDUserDataController privateSettingsController](self, "privateSettingsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingValuesByKeyPathWithPrefix:", CFSTR("private"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v5;
}

- (BOOL)isRecognizeMyVoiceEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDUserDataController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDUserDataController *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController sharedSettingsController](self, "sharedSettingsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "settingForKeyPath:", CFSTR("root.siri.identifyVoice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch isRecognizeMyVoiceEnabled because the setting is nil", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v8 = 0;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch isRecognizeMyVoiceEnabled because privateSettingsController is nil", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasUserSeenRMVNewLanguageNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDUserDataController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDUserDataController *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController privateSettingsController](self, "privateSettingsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "settingForKeyPath:", CFSTR("root.home.hasUserSeenRMVNewLanguageNotification"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hasUserSeenRMVNewLanguageNotification because the setting is nil", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v8 = 1;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hasUserSeenRMVNewLanguageNotification because privateSettingsController is nil", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 1;
  }

  return v8;
}

- (void)setHasUserSeenRMVNewLanguageNotification:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDUserDataController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDUserDataController *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[HMDUserDataController privateSettingsController](self, "privateSettingsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "settingForKeyPath:", CFSTR("root.home.hasUserSeenRMVNewLanguageNotification"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CBA820]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initNumberSettingWithValue:", v9);

      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__HMDUserDataController_setHasUserSeenRMVNewLanguageNotification___block_invoke;
      v19[3] = &unk_1E89C2350;
      v19[4] = self;
      objc_msgSend(v6, "updateWithValue:onSetting:completion:", v10, v7, v19);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to setHasUserSeenRMVNewLanguageNotification because the setting is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to setHasUserSeenRMVNewLanguageNotification because privateSettingsController is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (int64_t)sharedUserSettingsLogEventBackingStoreControllerRunState
{
  void *v3;
  void *v4;
  int64_t v5;

  -[HMDUserDataController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedZoneControllerForUserDataController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "logEventRunState");

  return v5;
}

- (void)mediaContentProfileAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDUserDataController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v8, "accessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserDataController mediaContentProfileAccessControlAccessories](self, "mediaContentProfileAccessControlAccessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToSet:", v14);

  if ((v16 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating media content profile access control to %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDUserDataController setMediaContentProfileAccessControlAccessories:](v18, "setMediaContentProfileAccessControlAccessories:", v14);
    -[HMDUserDataController delegate](v18, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "userDataControllerDidUpdateMediaContentProfile:", v18);

  }
  v22 = objc_alloc_init(MEMORY[0x1E0D32C18]);
  v10[2](v10, v22);

}

- (void)mediaContentProfileAccessControlModelRemoved:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  HMDUserDataController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Media content profile access control was removed", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setMediaContentProfileAccessControlAccessories:](v10, "setMediaContentProfileAccessControlAccessories:", v13);

  v14 = objc_alloc_init(MEMORY[0x1E0D32C18]);
  v7[2](v7, v14);

}

- (void)userListeningHistoryUpdateControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDUserDataController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v8, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v8, "accessories");
    else
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userListeningHistoryUpdateControlModelAccessories](self, "userListeningHistoryUpdateControlModelAccessories");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToSet:", v14);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating listening history update accessories to %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDUserDataController setUserListeningHistoryUpdateControlModelAccessories:](v18, "setUserListeningHistoryUpdateControlModelAccessories:", v14);
      -[HMDUserDataController delegate](v18, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userDataControllerDidUpdateUserListeningHistoryUpdateControl:", v18);

    }
    v22 = objc_alloc_init(MEMORY[0x1E0D32C18]);
    v10[2](v10, v22);

  }
}

- (void)userListeningHistoryUpdateControlModelRemoved:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  HMDUserDataController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@user update listening history access control was removed", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setUserListeningHistoryUpdateControlModelAccessories:](v10, "setUserListeningHistoryUpdateControlModelAccessories:", v13);

  v14 = objc_alloc_init(MEMORY[0x1E0D32C18]);
  v7[2](v7, v14);

}

- (void)userSupportsAutomaticHH2MigrationModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDUserDataController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMDUserDataController *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDUserDataController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supportsAutomaticHH2Migration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((_DWORD)v14 != -[HMDUserDataController supportsHH2MigrationByOwnerManual](self, "supportsHH2MigrationByOwnerManual"))
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2114;
      v32 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating user supports automatic HH2 migration by owner manual to %{public}@", buf, 0x16u);

      v9 = v28;
    }

    objc_autoreleasePoolPop(v15);
    -[HMDUserDataController setSupportsHH2MigrationByOwnerManual:](v16, "setSupportsHH2MigrationByOwnerManual:", v14);
    objc_msgSend(v12, "userDataControllerDidUpdateSupportsAutomaticHH2Migration:", v16);
  }
  objc_msgSend(v8, "supportsHH2MigrationByOwnerAuto");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  if ((_DWORD)v21 != -[HMDUserDataController supportsHH2MigrationByOwnerAuto](self, "supportsHH2MigrationByOwnerAuto"))
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      v31 = 2114;
      v32 = v26;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating user supports automatic HH2 migration by owner auto to %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDUserDataController setSupportsHH2MigrationByOwnerAuto:](v23, "setSupportsHH2MigrationByOwnerAuto:", v21);
    objc_msgSend(v12, "userDataControllerDidUpdateSupportsAutomaticHH2Migration:", v23);
  }
  v27 = objc_alloc_init(MEMORY[0x1E0D32C18]);
  v10[2](v10, v27);

}

- (void)userSupportsAutomaticHH2MigrationModelRemoved:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  HMDUserDataController *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@User supports automatic HH2 migration was removed", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDUserDataController setSupportsHH2MigrationByOwnerManual:](v10, "setSupportsHH2MigrationByOwnerManual:", 0);
  v13 = objc_alloc_init(MEMORY[0x1E0D32C18]);
  v7[2](v7, v13);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDUserDataController *v9;

  v4 = a3;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HMDUserDataController_timerDidFire___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDUserDataController userUUID](self, "userUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)assistantAccessControlRequiresAuthenticationForSecureRequests
{
  return self->_assistantAccessControlRequiresAuthenticationForSecureRequests;
}

- (void)setAssistantAccessControlRequiresAuthenticationForSecureRequests:(BOOL)a3
{
  self->_assistantAccessControlRequiresAuthenticationForSecureRequests = a3;
}

- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests
{
  return self->_assistantAccessControlActivityNotificationsEnabledForPersonalRequests;
}

- (void)setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  self->_assistantAccessControlActivityNotificationsEnabledForPersonalRequests = a3;
}

- (BOOL)supportsHH2MigrationByOwnerManual
{
  return self->_supportsHH2MigrationByOwnerManual;
}

- (void)setSupportsHH2MigrationByOwnerManual:(BOOL)a3
{
  self->_supportsHH2MigrationByOwnerManual = a3;
}

- (BOOL)supportsHH2MigrationByOwnerAuto
{
  return self->_supportsHH2MigrationByOwnerAuto;
}

- (void)setSupportsHH2MigrationByOwnerAuto:(BOOL)a3
{
  self->_supportsHH2MigrationByOwnerAuto = a3;
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMDUserDataControllerDelegate)delegate
{
  return (HMDUserDataControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDUserDataControllerDataSource)dataSource
{
  return (HMDUserDataControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMDUserDataControllerTimerCreator)timerCreator
{
  return (HMDUserDataControllerTimerCreator *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)sharedSettingsRootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSharedSettingsRootUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSUUID)assistantAccessControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAssistantAccessControlModelUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableSet)assistantAccessControlAccessoryUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssistantAccessControlAccessoryUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSUUID)mediaContentProfileAccessControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMediaContentProfileAccessControlModelUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableSet)mediaContentProfileAccessControlAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMediaContentProfileAccessControlAccessories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSUUID)userListeningHistoryUpdateControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUserListeningHistoryUpdateControlModelUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableSet)userListeningHistoryUpdateControlModelAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserListeningHistoryUpdateControlModelAccessories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSUUID)supportsAutomaticHH2MigrationModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSupportsAutomaticHH2MigrationModelUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSUUID)privateSettingsRootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPrivateSettingsRootUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (HMFTimer)sharedZoneFirstLoadTimer
{
  return self->_sharedZoneFirstLoadTimer;
}

- (void)setSharedZoneFirstLoadTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sharedZoneFirstLoadTimer, a3);
}

- (HMFTimer)privateZoneFirstLoadTimer
{
  return self->_privateZoneFirstLoadTimer;
}

- (void)setPrivateZoneFirstLoadTimer:(id)a3
{
  objc_storeStrong((id *)&self->_privateZoneFirstLoadTimer, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 168, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (HMDSettingsControllerProtocol)sharedSettingsController
{
  return (HMDSettingsControllerProtocol *)objc_getProperty(self, a2, 176, 1);
}

- (HMDSettingsControllerProtocol)privateSettingsController
{
  return (HMDSettingsControllerProtocol *)objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateSettingsController, 0);
  objc_storeStrong((id *)&self->_sharedSettingsController, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_privateZoneFirstLoadTimer, 0);
  objc_storeStrong((id *)&self->_sharedZoneFirstLoadTimer, 0);
  objc_storeStrong((id *)&self->_privateSettingsRootUUID, 0);
  objc_storeStrong((id *)&self->_supportsAutomaticHH2MigrationModelUUID, 0);
  objc_storeStrong((id *)&self->_userListeningHistoryUpdateControlModelAccessories, 0);
  objc_storeStrong((id *)&self->_userListeningHistoryUpdateControlModelUUID, 0);
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControlAccessories, 0);
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControlModelUUID, 0);
  objc_storeStrong((id *)&self->_assistantAccessControlAccessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_assistantAccessControlModelUUID, 0);
  objc_storeStrong((id *)&self->_sharedSettingsRootUUID, 0);
  objc_storeStrong((id *)&self->_timerCreator, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

void __38__HMDUserDataController_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sharedZoneFirstLoadTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Attempting to recreate data in shared user data zone", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "_startupSharedZone");
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "privateZoneFirstLoadTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Attempting to recreate data in private user data zone", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(*(id *)(a1 + 40), "_startupPrivateZone");
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        v18 = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v17;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected timer fired %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
  }
}

void __66__HMDUserDataController_setHasUserSeenRMVNewLanguageNotification___block_invoke(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Updated hasUserSeenRMVNewLanguageNotification value with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __48__HMDUserDataController_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void **p_vtable;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  HMDAssistantAccessControlModelV2 *v12;
  void *v13;
  void *v14;
  HMDAssistantAccessControlModelV2 *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDSettingTransaction *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  HMDMediaContentProfileAccessControlModel *v38;
  void *v39;
  void *v40;
  HMDMediaContentProfileAccessControlModel *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  HMDUserListeningHistoryUpdateControlModel *v55;
  void *v56;
  void *v57;
  HMDUserListeningHistoryUpdateControlModel *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[4];
  id v72;
  uint64_t v73;
  _QWORD v74[5];
  uint64_t v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assistantAccessControlAccessoryUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  v5 = MEMORY[0x1E0C809B0];
  p_vtable = (void **)(&OBJC_METACLASS___HMDSharingDeviceDiscovery + 24);
  if (v4)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v77 = v10;
      v78 = 2112;
      v79 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Found removed accessory %@ in assistant access control list removing.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = [HMDAssistantAccessControlModelV2 alloc];
    objc_msgSend(*(id *)(a1 + 32), "assistantAccessControlModelUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMBModel initWithModelID:parentModelID:](v12, "initWithModelID:parentModelID:", v13, v14);

    objc_msgSend(*(id *)(a1 + 32), "assistantAccessControlAccessoryUUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E60];
    v75 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "na_setByRemovingObjectsFromSet:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v74[0] = v5;
    v74[1] = 3221225472;
    v74[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_155;
    v74[3] = &unk_1E89C2198;
    v74[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v21, "na_filter:", v74);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControlModelV2 setAccessoryUUIDs:](v15, "setAccessoryUUIDs:", v22);

    v71[0] = v5;
    v71[1] = 3221225472;
    v71[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_2;
    v71[3] = &unk_1E89B7DF8;
    v23 = v2;
    v24 = *(_QWORD *)(a1 + 32);
    v72 = v23;
    v73 = v24;
    objc_msgSend(v21, "na_filter:", v71);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControlModelV2 setSiriEndpointAccessoryUUIDs:](v15, "setSiriEndpointAccessoryUUIDs:", v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "assistantAccessControlRequiresAuthenticationForSecureRequests"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControlModelV2 setRequiresAuthenticationForSecureRequests:](v15, "setRequiresAuthenticationForSecureRequests:", v26);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "assistantAccessControlActivityNotificationsEnabledForPersonalRequests"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControlModelV2 setActivityNotificationsEnabledForPersonalRequests:](v15, "setActivityNotificationsEnabledForPersonalRequests:", v27);

    objc_msgSend(v23, "sharedZoneControllerForUserDataController:", *(_QWORD *)(a1 + 32));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    p_vtable = &OBJC_METACLASS___HMDSharingDeviceDiscovery.vtable;
    v29 = -[HMDSettingTransaction initWithTransactionLabel:]([HMDSettingTransaction alloc], "initWithTransactionLabel:", CFSTR("Remove accessory from user assistant access control"));
    -[HMDSettingTransaction addModelToBeUpdated:](v29, "addModelToBeUpdated:", v15);
    v69[0] = v5;
    v69[1] = 3221225472;
    v69[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_3;
    v69[3] = &unk_1E89C21C0;
    v30 = *(void **)(a1 + 40);
    v69[4] = *(_QWORD *)(a1 + 32);
    v70 = v30;
    objc_msgSend(v28, "runTransaction:waitForCloudPush:completion:", v29, 0, v69);

  }
  objc_msgSend(*(id *)(a1 + 32), "mediaContentProfileAccessControlAccessories");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v32)
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v77 = v36;
      v78 = 2112;
      v79 = v37;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Found removed accessory %@ in media content profile list removing.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v38 = [HMDMediaContentProfileAccessControlModel alloc];
    objc_msgSend(*(id *)(a1 + 32), "mediaContentProfileAccessControlModelUUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userUUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[HMBModel initWithModelID:parentModelID:](v38, "initWithModelID:parentModelID:", v39, v40);

    objc_msgSend(*(id *)(a1 + 32), "mediaContentProfileAccessControlAccessories");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");

    objc_msgSend(v43, "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v43, "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaContentProfileAccessControlModel setAccessories:](v41, "setAccessories:", v44);

    objc_msgSend(v2, "sharedZoneControllerForUserDataController:", *(_QWORD *)(a1 + 32));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(objc_alloc((Class)(p_vtable + 347)), "initWithTransactionLabel:", CFSTR("Remove accessory from media content profile access control"));
    objc_msgSend(v46, "addModelToBeUpdated:", v41);
    v67[0] = v5;
    v67[1] = 3221225472;
    v67[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_160;
    v67[3] = &unk_1E89C21C0;
    v47 = *(void **)(a1 + 40);
    v67[4] = *(_QWORD *)(a1 + 32);
    v68 = v47;
    objc_msgSend(v45, "runTransaction:waitForCloudPush:completion:", v46, 0, v67);

  }
  objc_msgSend(*(id *)(a1 + 32), "userListeningHistoryUpdateControlModelAccessories");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v49)
  {
    v50 = (void *)MEMORY[0x1D17BA0A0]();
    v51 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v77 = v53;
      v78 = 2112;
      v79 = v54;
      _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Found removed accessory %@ in update listening history list removing.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v50);
    v55 = [HMDUserListeningHistoryUpdateControlModel alloc];
    objc_msgSend(*(id *)(a1 + 32), "userListeningHistoryUpdateControlModelUUID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userUUID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[HMBModel initWithModelID:parentModelID:](v55, "initWithModelID:parentModelID:", v56, v57);

    objc_msgSend(*(id *)(a1 + 32), "userListeningHistoryUpdateControlModelAccessories");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v59, "mutableCopy");

    objc_msgSend(v60, "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v60, "allObjects");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserListeningHistoryUpdateControlModel setAccessories:](v58, "setAccessories:", v61);

    objc_msgSend(v2, "sharedZoneControllerForUserDataController:", *(_QWORD *)(a1 + 32));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(objc_alloc((Class)(p_vtable + 347)), "initWithTransactionLabel:", CFSTR("Remove accessory from update listening history control"));
    objc_msgSend(v63, "addModelToBeUpdated:", v58);
    v65[0] = v5;
    v65[1] = 3221225472;
    v65[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_163;
    v65[3] = &unk_1E89C21C0;
    v64 = *(void **)(a1 + 40);
    v65[4] = *(_QWORD *)(a1 + 32);
    v66 = v64;
    objc_msgSend(v62, "runTransaction:waitForCloudPush:completion:", v63, 0, v65);

  }
}

uint64_t __48__HMDUserDataController_handleRemovedAccessory___block_invoke_155(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userDataController:isAppleMediaAccessory:", *(_QWORD *)(a1 + 32), v4);

  return v6;
}

uint64_t __48__HMDUserDataController_handleRemovedAccessory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDataController:isHAPAccessory:", *(_QWORD *)(a1 + 40), a2);
}

void __48__HMDUserDataController_handleRemovedAccessory___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@ from assistant access control list on accessory removal.", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __48__HMDUserDataController_handleRemovedAccessory___block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@ from media content profile access control list on accessory removal.", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __48__HMDUserDataController_handleRemovedAccessory___block_invoke_163(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@ from ULH list on accessory removal.", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __64__HMDUserDataController_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Enabling ULH for accessory %@ failed with %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __173__HMDUserDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_requireAuthenticationForSecureRequests_activityNotificationsEnabledForPersonalRequests_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDataController:isAppleMediaAccessory:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __173__HMDUserDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_requireAuthenticationForSecureRequests_activityNotificationsEnabledForPersonalRequests_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDataController:isHAPAccessory:", *(_QWORD *)(a1 + 40), a2);
}

void __44__HMDUserDataController__startupPrivateZone__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error migrating user data models in private zone %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_startPrivateZoneFirstLoadTimer");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated models for private zone.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "initializePrivateZoneController:userDataModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePrivateZoneFirstLoadTimer");
  }

}

void __43__HMDUserDataController__startupSharedZone__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
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
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error migrating user data models in shared zone %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_startSharedZoneFirstLoadTimer");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated models for shared zone.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "loadSharedUserDataModelWithError:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "initializeSharedZoneController:userDataModel:", *(_QWORD *)(a1 + 48), v11);
    objc_msgSend(*(id *)(a1 + 32), "_invalidateSharedZoneFirstLoadTimer");

  }
}

void __74__HMDUserDataController_performFirstRunOperationsOnPrivateZoneController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error creating user data models in private zone %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_startPrivateZoneFirstLoadTimer");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully created and pushed models for private zone.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "initializePrivateZoneController:userDataModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePrivateZoneFirstLoadTimer");
  }

}

uint64_t __73__HMDUserDataController_performFirstRunOperationsOnSharedZoneController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userDataController:isAccessoryUserListeningHistoryUpdateCapable:", *(_QWORD *)(a1 + 32), v4);

  return v6;
}

void __73__HMDUserDataController_performFirstRunOperationsOnSharedZoneController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error creating user data models in shared zone %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_startSharedZoneFirstLoadTimer");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully created and pushed models for shared zone.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "initializeSharedZoneController:userDataModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_invalidateSharedZoneFirstLoadTimer");
  }

}

void __59__HMDUserDataController__keyPathToModelFromKeyPath_models___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "hmbModelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __59__HMDUserDataController__keyPathToModelFromKeyPath_models___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v19 = v6;
  if (v6)
  {
    v7 = v6;
    do
    {
      objc_msgSend(v7, "hmbModelID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_8;
      v9 = (void *)v8;
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v7, "hmbModelID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_8:
        v15 = (uint64_t)v5;
        if (v5)
          goto LABEL_7;
        goto LABEL_9;
      }
      v13 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v7, "nameForKeyPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@"), v14, v5);
      v15 = objc_claimAutoreleasedReturnValue();

      v16 = *(void **)(a1 + 32);
      objc_msgSend(v7, "hmbParentModelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v18;
      v5 = (void *)v15;
    }
    while (v18);
    if (v15)
    {
LABEL_7:
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v19, v15);
      v5 = (void *)v15;
      goto LABEL_11;
    }
LABEL_9:
    v5 = 0;
  }
  else
  {
    v7 = 0;
  }
LABEL_11:

}

uint64_t __117__HMDUserDataController__migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel_transaction_settingModels___block_invoke_70(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userDataController:isAccessoryUserListeningHistoryUpdateCapable:", *(_QWORD *)(a1 + 32), v4);

  return v6;
}

id __117__HMDUserDataController__migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel_transaction_settingModels___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EFA697D0))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __34__HMDUserDataController_configure__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedZoneControllerForUserDataController:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

  objc_msgSend(v4, "privateZoneControllerForUserDataController:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t100 != -1)
    dispatch_once(&logCategory__hmf_once_t100, &__block_literal_global_174_137538);
  return (id)logCategory__hmf_once_v101;
}

void __36__HMDUserDataController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v101;
  logCategory__hmf_once_v101 = v0;

}

@end
