@implementation HMDSiriEndpointOnboardingManager

- (HMDSiriEndpointOnboardingManager)initWithDataSource:(id)a3
{
  id v4;
  HMDSiriEndpointOnboardingManager *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *onboardingSelections;
  NSMutableDictionary *v8;
  NSMutableDictionary *onboardingUserUUID;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDSiriEndpointOnboardingManager;
  v5 = -[HMDSiriEndpointOnboardingManager init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    onboardingSelections = v5->_onboardingSelections;
    v5->_onboardingSelections = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    onboardingUserUUID = v5->_onboardingUserUUID;
    v5->_onboardingUserUUID = v8;

    objc_storeWeak((id *)&v5->_dataSource, v4);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel_handleCompositeSettingsControllerConfigured_, CFSTR("HMDCompositeSettingsControllerDidConfigureNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConfiguredNotification"), 0);

  return v5;
}

- (void)handleCompositeSettingsControllerConfigured:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDSiriEndpointOnboardingManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDSiriEndpointOnboardingManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDSiriEndpointOnboardingManager *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDHomeUUIDOwnerUUIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "hmf_UUIDForKey:", CFSTR("HMDCompositeSettingControllerOwnerUUIDNotificationKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v8, "hmf_UUIDForKey:", CFSTR("HMDCompositeSettingControllerHomeUUIDNotificationKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      if (v14)
      {
        -[HMDSiriEndpointOnboardingManager applyCachedOnboardingSelectionsWithAccessoryUUID:homeUUID:](self, "applyCachedOnboardingSelectionsWithAccessoryUUID:homeUUID:", v11, v14);
      }
      else
      {
        v23 = (void *)MEMORY[0x227676638]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543362;
          v28 = v26;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@CompositeSettingsController is congigured with invalid homeUUID", (uint8_t *)&v27, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
      }

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@CompositeSettingsController is congigured with invalid accessoryUUID", (uint8_t *)&v27, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@CompositeSettingsController is congigured with invalid homeUUID and ownerUUID info", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDSiriEndpointOnboardingManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDSiriEndpointOnboardingManager *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointOnboardingManager applyCachedOnboardingSelectionsWithAccessoryUUID:homeUUID:](self, "applyCachedOnboardingSelectionsWithAccessoryUUID:homeUUID:", v9, v10);

    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v18;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Accessory is configured with invalid home: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid HAP accessory is configured", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 userUUID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  HMDSiriEndpointOnboardingManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDSiriEndpointOnboardingManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDSiriEndpointOnboardingManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDSiriEndpointOnboardingManager *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  id *v39;
  NSObject *v40;
  void *v41;
  id *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *context;
  void *contexta;
  os_unfair_lock_s *lock;
  os_unfair_lock_t locka;
  id v50;
  _QWORD v51[4];
  void (**v52)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v50 = a6;
  v15 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_30;
  }
  if (!v13)
  {
LABEL_30:
    _HMFPreconditionFailure();
    goto LABEL_31;
  }
  if (!v14)
  {
LABEL_31:
    _HMFPreconditionFailure();
LABEL_32:
    _HMFPreconditionFailure();
  }
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
  if (!v15)
    goto LABEL_32;
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v54 = (uint64_t)v20;
    v55 = 2112;
    v56 = v12;
    v57 = 2112;
    v58 = v14;
    v59 = 2112;
    v60 = v13;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Apply onboarding selections: %@ homeUUID: %@ accessoryUUID: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v17);
  -[HMDSiriEndpointOnboardingManager dataSource](v18, "dataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "needsOnboardingForHomeUUID:accessoryUUID:", v14, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((objc_msgSend(v22, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v14, v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      lock = &v18->_lock;
      os_unfair_lock_lock_with_options();
      -[NSMutableDictionary objectForKey:](v18->_onboardingSelections, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      context = (void *)MEMORY[0x227676638]();
      v26 = v18;
      if (v25)
      {
        HMFGetOSLogHandle();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = (uint64_t)v28;
          v55 = 2112;
          v56 = v24;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Onboarding selections are already cached, key: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        v16[2](v16, 0, 1);
        os_unfair_lock_unlock(lock);
      }
      else
      {
        HMFGetOSLogHandle();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v38;
          v55 = 2112;
          v56 = v24;
          v45 = (void *)v38;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Caching onboarding selections, key: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        contexta = (void *)MEMORY[0x227676638](-[NSMutableDictionary setObject:forKey:](v18->_onboardingSelections, "setObject:forKey:", v12, v24));
        v39 = v26;
        HMFGetOSLogHandle();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = (uint64_t)v41;
          v55 = 2112;
          v56 = v50;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Caching onboarding user UUID %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(contexta);
        objc_msgSend(v39[2], "setObject:forKey:", v50, v24);
        os_unfair_lock_unlock(lock);
        if ((objc_msgSend(v39, "readyToApplyOnboardingSelectionsWithHomeUUID:accessoryUUID:", v14, v13) & 1) != 0)
        {
          objc_msgSend(v39, "_applyOnboardingSelections:accessoryUUID:homeUUID:userUUID:cacheKey:completion:", v12, v13, v14, v50, v24, v16);
        }
        else
        {
          locka = (os_unfair_lock_t)MEMORY[0x227676638]();
          v42 = v39;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = (uint64_t)v44;
            v55 = 2112;
            v56 = v13;
            _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@It's not ready to apply onboarding. accessoryUUID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(locka);
          v16[2](v16, 0, 3);
        }
      }
    }
    else
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = v18;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = (uint64_t)v36;
        v55 = 2112;
        v56 = v13;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Onboarding selections are already configured on the accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __105__HMDSiriEndpointOnboardingManager_applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_completion___block_invoke;
      v51[3] = &unk_24E79A050;
      v52 = v16;
      -[HMDSiriEndpointOnboardingManager _setNeedsOnboardingCompleteWitHomeUUID:accessoryUUID:completion:](v34, "_setNeedsOnboardingCompleteWitHomeUUID:accessoryUUID:completion:", v14, v13, v51);
      v24 = v52;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v18;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = (uint64_t)v32;
      v55 = 2112;
      v56 = v13;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not determine needsOnboarding state. accessoryUUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v16)[2](v16, v24, 1);
  }

}

- (void)applyCachedOnboardingSelectionsWithAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSiriEndpointOnboardingManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_unfair_lock_s *p_lock;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDSiriEndpointOnboardingManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDSiriEndpointOnboardingManager *v28;
  NSObject *v29;
  void *v30;
  HMDSiriEndpointOnboardingManager *v31;
  NSObject *v32;
  void *v33;
  HMDSiriEndpointOnboardingManager *v34;
  NSObject *v35;
  void *v36;
  void *context;
  void *contexta;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v11;
    v41 = 2112;
    v42 = v7;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Apply cached onboarding selections: homeUUID: %@ accessoryUUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDSiriEndpointOnboardingManager dataSource](v9, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "needsOnboardingForHomeUUID:accessoryUUID:", v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v7, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      p_lock = &v9->_lock;
      os_unfair_lock_lock_with_options();
      -[NSMutableDictionary objectForKey:](v9->_onboardingSelections, "objectForKey:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (v19)
      {
        context = (void *)MEMORY[0x227676638]();
        v31 = v9;
        HMFGetOSLogHandle();
        v32 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v33;
          v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Onboarding selections matching key not found in the cache: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        os_unfair_lock_unlock(p_lock);
      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](v9->_onboardingSelections, "objectForKeyedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v9->_onboardingUserUUID, "objectForKey:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v9->_onboardingUserUUID, "objectForKeyedSubscript:", v16);
          v22 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v22;
        }
        os_unfair_lock_unlock(&v9->_lock);
        if (-[HMDSiriEndpointOnboardingManager readyToApplyOnboardingSelectionsWithHomeUUID:accessoryUUID:](v9, "readyToApplyOnboardingSelectionsWithHomeUUID:accessoryUUID:", v7, v6))
        {
          -[HMDSiriEndpointOnboardingManager _applyOnboardingSelections:accessoryUUID:homeUUID:userUUID:cacheKey:completion:](v9, "_applyOnboardingSelections:accessoryUUID:homeUUID:userUUID:cacheKey:completion:", v20, v6, v7, v15, v16, 0);

        }
        else
        {
          contexta = (void *)MEMORY[0x227676638]();
          v34 = v9;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v40 = v36;
            v41 = 2112;
            v42 = v6;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@It's not ready to apply onboarding. accessoryUUID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(contexta);

        }
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v9;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v30;
        v41 = 2112;
        v42 = v6;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Onboarding selections are already configured on the accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      -[HMDSiriEndpointOnboardingManager _setNeedsOnboardingCompleteWitHomeUUID:accessoryUUID:completion:](v28, "_setNeedsOnboardingCompleteWitHomeUUID:accessoryUUID:completion:", v7, v6, 0);
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v9;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v26;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not determine needsOnboarding state. accessoryUUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

- (void)_applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 userUUID:(id)a6 cacheKey:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a3;
  -[HMDSiriEndpointOnboardingManager dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __115__HMDSiriEndpointOnboardingManager__applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_cacheKey_completion___block_invoke;
  v26[3] = &unk_24E78E0D8;
  v26[4] = self;
  v27 = v15;
  v28 = v14;
  v29 = v17;
  v30 = v16;
  v31 = v18;
  v21 = v18;
  v22 = v16;
  v23 = v17;
  v24 = v14;
  v25 = v15;
  objc_msgSend(v20, "applyOnboardingSelections:accessoryUUID:homeUUID:completion:", v19, v24, v25, v26);

}

- (void)_setNeedsOnboardingCompleteWitHomeUUID:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDSiriEndpointOnboardingManager dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __100__HMDSiriEndpointOnboardingManager__setNeedsOnboardingCompleteWitHomeUUID_accessoryUUID_completion___block_invoke;
  v13[3] = &unk_24E79B3A0;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "setNeedsOnboardingCompleteWitHomeUUID:accessoryUUID:completion:", v10, v9, v13);

}

- (void)_enableUserListeningHistoryForHomeUUID:(id)a3 accessoryUUID:(id)a4 userUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDSiriEndpointOnboardingManager dataSource](self, "dataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enableUserListeningHistoryForHomeUUID:accessoryUUID:userUUID:", v10, v9, v8);

}

- (BOOL)readyToApplyOnboardingSelectionsWithHomeUUID:(id)a3 accessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  HMDSiriEndpointOnboardingManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDSiriEndpointOnboardingManager *v22;
  NSObject *v23;
  void *v24;
  HMDSiriEndpointOnboardingManager *v25;
  void *v26;
  const char *v27;
  HMDSiriEndpointOnboardingManager *v28;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDSiriEndpointOnboardingManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithHomeUUID:accessoryUUID:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    objc_opt_class();
    v12 = objc_opt_isKindOfClass() & 1;
    if (v12)
      v13 = v11;
    else
      v13 = 0;
    v14 = v13;

    if (!v12)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v24;
        v32 = 2112;
        v33 = v7;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@HAP accessory is not found. accessoryUUID: %@", (uint8_t *)&v30, 0x16u);

      }
      goto LABEL_19;
    }
    if ((objc_msgSend(v11, "isSecureSessionEstablished") & 1) != 0)
    {
      objc_msgSend(v11, "siriEndpointProfile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = 1;
LABEL_20:

        goto LABEL_21;
      }
      v21 = (void *)MEMORY[0x227676638]();
      v28 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v26;
        v32 = 2112;
        v33 = v11;
        v27 = "%{public}@Siri endpoint profile is not created. Accessory: %@";
        goto LABEL_18;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v26;
        v32 = 2112;
        v33 = v11;
        v27 = "%{public}@Accessory is not configured. Accessory: %@";
LABEL_18:
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v30, 0x16u);

      }
    }
LABEL_19:

    objc_autoreleasePoolPop(v21);
    v16 = 0;
    goto LABEL_20;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v20;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Accessory is not found. accessoryUUID: %@", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v16 = 0;
LABEL_21:

  return v16;
}

- (HMDSiriEndpointOnboardingManagerDataSource)dataSource
{
  return (HMDSiriEndpointOnboardingManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_onboardingUserUUID, 0);
  objc_storeStrong((id *)&self->_onboardingSelections, 0);
}

void __100__HMDSiriEndpointOnboardingManager__setNeedsOnboardingCompleteWitHomeUUID_accessoryUUID_completion___block_invoke(uint64_t a1, void *a2)
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
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Setting needsOnboarding complete failed with error: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void __115__HMDSiriEndpointOnboardingManager__applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_cacheKey_completion___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, uint64_t);
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1[4];
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMSiriEndpointOnboardingResultAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    v26 = 2114;
    v27 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Apply result received from controller: %{public}@ error:%{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  if (v5 || a3 != 2)
  {
    v14 = (void (**)(id, _QWORD, uint64_t))a1[9];
    if (v14)
      v14[2](v14, 0, a3);
  }
  else
  {
    objc_initWeak((id *)buf, a1[4]);
    v11 = a1[5];
    v12 = a1[4];
    v13 = a1[6];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __115__HMDSiriEndpointOnboardingManager__applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_cacheKey_completion___block_invoke_17;
    v15[3] = &unk_24E78E0B0;
    objc_copyWeak(&v21, (id *)buf);
    v16 = a1[7];
    v17 = a1[5];
    v18 = a1[6];
    v19 = a1[8];
    v20 = a1[9];
    objc_msgSend(v12, "_setNeedsOnboardingCompleteWitHomeUUID:accessoryUUID:completion:", v11, v13, v15);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

}

void __115__HMDSiriEndpointOnboardingManager__applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_cacheKey_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  uint64_t v5;
  void *v6;
  id *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 72));
  if (!v3)
  {
    v5 = os_unfair_lock_lock_with_options();
    v6 = (void *)MEMORY[0x227676638](v5);
    v7 = WeakRetained;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing cached onboarding selections, key: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v7[1], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v7[2], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v7, "_enableUserListeningHistoryForHomeUUID:accessoryUUID:userUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v11 = *(_QWORD *)(a1 + 64);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v11 + 16))(v11, 0, 2);
    os_unfair_lock_unlock(WeakRetained + 6);
  }

}

uint64_t __105__HMDSiriEndpointOnboardingManager_applyOnboardingSelections_accessoryUUID_homeUUID_userUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
