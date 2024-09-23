@implementation HMDUserDataController

- (HMDUserDataController)initWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 timerCreator:(id)a10 isCurrentUser:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMDUserDataController *v21;
  HMDUserDataController *v22;
  uint64_t v23;
  NSMutableSet *assistantAccessControlAccessoryUUIDs;
  uint64_t v25;
  NSMutableSet *mediaContentProfileAccessControlAccessories;
  uint64_t v27;
  NSNotificationCenter *notificationCenter;
  id v30;
  id v31;
  objc_super v32;

  v16 = a3;
  v17 = a4;
  v31 = a5;
  v30 = a6;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  v32.receiver = self;
  v32.super_class = (Class)HMDUserDataController;
  v21 = -[HMDUserDataController init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_state = 2 * (v19 == 0);
    v21->_isModifyingState = 0;
    objc_storeStrong((id *)&v21->_clientQueue, a5);
    objc_storeWeak((id *)&v22->_delegate, v16);
    objc_storeStrong((id *)&v22->_timerCreator, a10);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    assistantAccessControlAccessoryUUIDs = v22->_assistantAccessControlAccessoryUUIDs;
    v22->_assistantAccessControlAccessoryUUIDs = (NSMutableSet *)v23;

    *(_WORD *)&v22->_assistantAccessControlRequiresAuthenticationForSecureRequests = 256;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v25 = objc_claimAutoreleasedReturnValue();
    mediaContentProfileAccessControlAccessories = v22->_mediaContentProfileAccessControlAccessories;
    v22->_mediaContentProfileAccessControlAccessories = (NSMutableSet *)v25;

    objc_storeStrong((id *)&v22->_userUUID, a6);
    objc_storeStrong((id *)&v22->_homeUUID, a7);
    objc_storeWeak((id *)&v22->_dataSource, v17);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v27 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v22->_notificationCenter;
    v22->_notificationCenter = (NSNotificationCenter *)v27;

    v22->_isCurrentUser = a11;
  }

  return v22;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMDUserDataController_configure__block_invoke;
  block[3] = &unk_24E79C240;
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

  v20 = *MEMORY[0x24BDAC8D0];
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
    v7 = (void *)MEMORY[0x227676638](v6);
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Moving state from %@ to %@", (uint8_t *)&v14, 0x20u);

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

  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  self->_isModifyingState = 1;
  v4 = -[HMDUserDataController state](self, "state");
  if (v4 - 1 < 2)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserDataController state](v12, "state"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected from state on init private zone event %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (v4 == 3)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Moving to initialized on initializing private zone", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      v9 = v17;
      v10 = 1;
      goto LABEL_13;
    }
    if (!v4)
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Moving to pending shared on initializing private zone", (uint8_t *)&v20, 0xCu);

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

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  self->_isModifyingState = 1;
  switch(-[HMDUserDataController state](self, "state"))
  {
    case 0uLL:
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Moving to pending private on initializing shared zone", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      v13 = v10;
      v14 = 3;
      goto LABEL_11;
    case 1uLL:
    case 3uLL:
      v4 = (void *)MEMORY[0x227676638]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserDataController state](v5, "state"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v7;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected from state on init shared zone event %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      break;
    case 2uLL:
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Moving to initialized on initializing shared zone", (uint8_t *)&v19, 0xCu);

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
  HMDUserDataController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  HMDUserDataController *v26;
  NSObject *v27;
  NSObject *v28;
  unint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDUserDataController *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  HMDUserDataController *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDUserDataController *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  HMDUserDataController *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  id v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "assistantAccessControlModelUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setAssistantAccessControlModelUUID:](self, "setAssistantAccessControlModelUUID:", v9);

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
  objc_msgSend(v7, "settingsRootUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setSharedSettingsRootUUID:](self, "setSharedSettingsRootUUID:", v13);

  -[HMDUserDataController assistantAccessControlModelUUID](self, "assistantAccessControlModelUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForAssistantAccessControlModelUpdates:modelID:", self, v14);

  -[HMDUserDataController mediaContentProfileAccessControlModelUUID](self, "mediaContentProfileAccessControlModelUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMediaContentAccessControlModelUpdates:modelID:", self, v15);

  if (_os_feature_enabled_impl())
  {
    -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](self, "userListeningHistoryUpdateControlModelUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerForUserListeningHistoryUpdateControlModelUpdates:modelID:", self, v16);

  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController assistantAccessControlModelUUID](v18, "assistantAccessControlModelUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v83 = v20;
    v84 = 2112;
    v85 = v21;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Loading assistant access control model %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  -[HMDUserDataController assistantAccessControlModelUUID](v18, "assistantAccessControlModelUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  objc_msgSend(v6, "loadAssistantAccessControlModelWithModelID:error:", v22, &v81);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v81;

  v25 = (void *)MEMORY[0x227676638]();
  v26 = v18;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v29 = 0x24BDBC000;
  if (v23)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "requiresAuthenticationForSecureRequests");
      v78 = v24;
      v31 = v6;
      v32 = v7;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activityNotificationsEnabledForPersonalRequests");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "accessoryUUIDs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v83 = v30;
      v84 = 2112;
      v85 = v33;
      v86 = 2112;
      v87 = v34;
      v88 = 2112;
      v89 = v35;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Loaded assistant access control requires auth: %@, activity notifications enabled for personal requests: %@, accessories: %@", buf, 0x2Au);

      v29 = 0x24BDBC000uLL;
      v7 = v32;
      v6 = v31;
      v24 = v78;

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(*(id *)(v29 + 3824), "set");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "accessoryUUIDs");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "na_safeAddObjectsFromArray:", v37);

    objc_msgSend(v23, "siriEndpointAccessoryUUIDs");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "na_safeAddObjectsFromArray:", v38);

    -[HMDUserDataController setAssistantAccessControlAccessoryUUIDs:](v26, "setAssistantAccessControlAccessoryUUIDs:", v36);
    objc_msgSend(v23, "requiresAuthenticationForSecureRequests");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setAssistantAccessControlRequiresAuthenticationForSecureRequests:](v26, "setAssistantAccessControlRequiresAuthenticationForSecureRequests:", objc_msgSend(v39, "BOOLValue"));

    if (objc_msgSend(v23, "hmbPropertyWasSet:", CFSTR("activityNotificationsEnabledForPersonalRequests")))
    {
      objc_msgSend(v23, "activityNotificationsEnabledForPersonalRequests");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:](v26, "setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:", objc_msgSend(v40, "BOOLValue"));

    }
    else
    {
      -[HMDUserDataController setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:](v26, "setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:", 1);
    }

  }
  else
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v41;
      v84 = 2112;
      v85 = v24;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to load assistant access control %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
  }

  v42 = (void *)MEMORY[0x227676638]();
  v43 = v26;
  HMFGetOSLogHandle();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController mediaContentProfileAccessControlModelUUID](v43, "mediaContentProfileAccessControlModelUUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v83 = v45;
    v84 = 2112;
    v85 = v46;
    _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Loading media content profile access control model %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v42);
  -[HMDUserDataController mediaContentProfileAccessControlModelUUID](v43, "mediaContentProfileAccessControlModelUUID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v6, "loadMediaContentAccessControlModelWithModelID:error:", v47, &v80);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v80;

  v50 = (void *)MEMORY[0x227676638]();
  v51 = v43;
  HMFGetOSLogHandle();
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v48)
  {
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "accessories");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v54;
      v84 = 2112;
      v85 = v55;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Loaded media content profile access control accessories %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v50);
    v56 = *(void **)(v29 + 3824);
    objc_msgSend(v48, "accessories");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setWithArray:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController setMediaContentProfileAccessControlAccessories:](v51, "setMediaContentProfileAccessControlAccessories:", v58);

  }
  else
  {
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v59;
      v84 = 2112;
      v85 = v49;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Unable to load media content profile accessories %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v50);
  }

  if (_os_feature_enabled_impl())
  {
    v60 = (void *)MEMORY[0x227676638]();
    v61 = v51;
    HMFGetOSLogHandle();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v61, "userListeningHistoryUpdateControlModelUUID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v63;
      v84 = 2112;
      v85 = v64;
      _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Loading user listening history update model %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v60);
    -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v61, "userListeningHistoryUpdateControlModelUUID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    objc_msgSend(v6, "loadUserListeningHistoryUpdateControlModelWithModelID:error:", v65, &v79);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v79;

    v68 = (void *)MEMORY[0x227676638]();
    v69 = v61;
    HMFGetOSLogHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v66)
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "accessories");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v72;
        v84 = 2112;
        v85 = v73;
        _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_INFO, "%{public}@Loaded user listening history update accessories %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v68);
      v74 = *(void **)(v29 + 3824);
      objc_msgSend(v66, "accessories");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setWithArray:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController setUserListeningHistoryUpdateControlModelAccessories:](v69, "setUserListeningHistoryUpdateControlModelAccessories:", v76);

    }
    else
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v77;
        v84 = 2112;
        v85 = v67;
        _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_ERROR, "%{public}@Unable to load update listening history accessories %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v68);
    }

  }
}

- (void)initializePrivateZoneController:(id)a3 userDataModel:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v5, "settingsRootUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDUserDataController setPrivateSettingsRootUUID:](self, "setPrivateSettingsRootUUID:", v7);
}

- (void)performFirstRunOperationsOnSharedZoneController:(id)a3
{
  id v4;
  void *v5;
  HMDUserDataController *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@In HH2: Not running performFirstRunOperationsOnSharedZoneController", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

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

  v18 = *MEMORY[0x24BDAC8D0];
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

    v8 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting timer to perform first run operations on shared zone. %@", (uint8_t *)&v14, 0x16u);

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
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@HMDUserDataController: Code disabled as we are running in HH2", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);

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

  v18 = *MEMORY[0x24BDAC8D0];
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

    v8 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting timer to perform first run operations on shared zone. %@", (uint8_t *)&v14, 0x16u);

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
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))_Block_copy(a6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
}

- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))_Block_copy(a4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v4);

  }
}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))_Block_copy(a4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v4);

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

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDUserDataController userListeningHistoryUpdateControlModelAccessories](self, "userListeningHistoryUpdateControlModelAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    v6 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@ULH for accessory %@ is already enabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    objc_msgSend(v5, "addObject:", v4);
    v10 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v5, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObjects:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64__HMDUserDataController_enableUserListeningHistoryForAccessory___block_invoke;
    v13[3] = &unk_24E79BCC8;
    v13[4] = self;
    v14 = v4;
    -[HMDUserDataController handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:completion:](self, "handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:completion:", v12, v13);

  }
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

    v8 = MEMORY[0x24BDBD1A8];
    -[HMDAssistantAccessControlModelV2 setAccessoryUUIDs:](v7, "setAccessoryUUIDs:", MEMORY[0x24BDBD1A8]);
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

    -[HMDUserListeningHistoryUpdateControlModel setAccessories:](v7, "setAccessories:", MEMORY[0x24BDBD1A8]);
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
  HMDUserDataController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  HMDUserDataController *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
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
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@User Shared model changed, but no diff in ULH uuid", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }
    else
    {
      -[HMDUserDataController delegate](self, "delegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "sharedZoneControllerForUserDataController:", self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v21, "userListeningHistoryUpdateControlModelUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "userListeningHistoryUpdateControlModelUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v23;
        v47 = 2112;
        v48 = v24;
        v49 = 2112;
        v50 = v25;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Registering and Loading user listening history update since the UUID flipped from =%@, to =%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v8, "userListeningHistoryUpdateControlModelUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserDataController setUserListeningHistoryUpdateControlModelUUID:](v21, "setUserListeningHistoryUpdateControlModelUUID:", v26);

      -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v21, "userListeningHistoryUpdateControlModelUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v19, "loadUserListeningHistoryUpdateControlModelWithModelID:error:", v27, &v44);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v44;

      -[HMDUserDataController userListeningHistoryUpdateControlModelUUID](v21, "userListeningHistoryUpdateControlModelUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "registerForUserListeningHistoryUpdateControlModelUpdates:modelID:", v21, v30);

      v31 = (void *)MEMORY[0x227676638]();
      v32 = v21;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v28)
      {
        v42 = v29;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "accessories");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v35;
          v47 = 2112;
          v48 = v36;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Loaded user listening history update accessories %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        v37 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend(v28, "accessories");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setWithArray:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserDataController setUserListeningHistoryUpdateControlModelAccessories:](v32, "setUserListeningHistoryUpdateControlModelAccessories:", v39);

        v40 = v43;
        objc_msgSend(v43, "userDataControllerDidUpdateUserListeningHistoryUpdateControl:", v32);
        v29 = v42;
      }
      else
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v41;
          v47 = 2112;
          v48 = v29;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to load update listening history accessories %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        v40 = v43;
      }

    }
  }

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

  v42 = *MEMORY[0x24BDAC8D0];
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

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
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
    v20 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating assistant access control on zone update to require auth: %@, accessories:%@", buf, 0x20u);

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
  v31 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Model in zone update has no changes %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v31);
LABEL_10:
  v29 = objc_alloc_init(MEMORY[0x24BE4EC48]);
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

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Assistant access control was removed", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v13 = objc_alloc_init(MEMORY[0x24BE4EC48]);
  v7[2](v7, v13);

}

- (NSDictionary)sharedSettingValuesByKeyPath
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

- (NSDictionary)privateSettingValuesByKeyPath
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
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

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "accessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserDataController mediaContentProfileAccessControlAccessories](self, "mediaContentProfileAccessControlAccessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToSet:", v14);

  if ((v16 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating media content profile access control to %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDUserDataController setMediaContentProfileAccessControlAccessories:](v18, "setMediaContentProfileAccessControlAccessories:", v14);
    -[HMDUserDataController delegate](v18, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "userDataControllerDidUpdateMediaContentProfile:", v18);

  }
  v22 = objc_alloc_init(MEMORY[0x24BE4EC48]);
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

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Media content profile access control was removed", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setMediaContentProfileAccessControlAccessories:](v10, "setMediaContentProfileAccessControlAccessories:", v13);

  v14 = objc_alloc_init(MEMORY[0x24BE4EC48]);
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

  v27 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserDataController userListeningHistoryUpdateControlModelAccessories](self, "userListeningHistoryUpdateControlModelAccessories");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToSet:", v14);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating listening history update accessories to %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDUserDataController setUserListeningHistoryUpdateControlModelAccessories:](v18, "setUserListeningHistoryUpdateControlModelAccessories:", v14);
      -[HMDUserDataController delegate](v18, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userDataControllerDidUpdateUserListeningHistoryUpdateControl:", v18);

    }
    v22 = objc_alloc_init(MEMORY[0x24BE4EC48]);
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

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[HMDUserDataController clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@user update listening history access control was removed", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserDataController setUserListeningHistoryUpdateControlModelAccessories:](v10, "setUserListeningHistoryUpdateControlModelAccessories:", v13);

  v14 = objc_alloc_init(MEMORY[0x24BE4EC48]);
  v7[2](v7, v14);

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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__HMDUserDataController_timerDidFire___block_invoke;
  v7[3] = &unk_24E79C268;
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

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
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
  return (HMDUserDataControllerTimerCreator *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)sharedSettingsRootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSharedSettingsRootUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSUUID)assistantAccessControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAssistantAccessControlModelUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableSet)assistantAccessControlAccessoryUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAssistantAccessControlAccessoryUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSUUID)mediaContentProfileAccessControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMediaContentProfileAccessControlModelUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableSet)mediaContentProfileAccessControlAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMediaContentProfileAccessControlAccessories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSUUID)userListeningHistoryUpdateControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUserListeningHistoryUpdateControlModelUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableSet)userListeningHistoryUpdateControlModelAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUserListeningHistoryUpdateControlModelAccessories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSUUID)privateSettingsRootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPrivateSettingsRootUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
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
  return (NSNotificationCenter *)objc_getProperty(self, a2, 152, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (HMDSettingsControllerProtocol)sharedSettingsController
{
  return (HMDSettingsControllerProtocol *)objc_getProperty(self, a2, 160, 1);
}

- (HMDSettingsControllerProtocol)privateSettingsController
{
  return (HMDSettingsControllerProtocol *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateSettingsController, 0);
  objc_storeStrong((id *)&self->_sharedSettingsController, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_privateZoneFirstLoadTimer, 0);
  objc_storeStrong((id *)&self->_sharedZoneFirstLoadTimer, 0);
  objc_storeStrong((id *)&self->_privateSettingsRootUUID, 0);
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

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sharedZoneFirstLoadTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Attempting to recreate data in shared user data zone", (uint8_t *)&v18, 0xCu);

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

    v11 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Attempting to recreate data in private user data zone", (uint8_t *)&v18, 0xCu);

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
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected timer fired %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
  }
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

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Enabling ULH for accessory %@ failed with %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

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
  if (logCategory__hmf_once_t41 != -1)
    dispatch_once(&logCategory__hmf_once_t41, &__block_literal_global_190897);
  return (id)logCategory__hmf_once_v42;
}

void __36__HMDUserDataController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v42;
  logCategory__hmf_once_v42 = v0;

}

@end
