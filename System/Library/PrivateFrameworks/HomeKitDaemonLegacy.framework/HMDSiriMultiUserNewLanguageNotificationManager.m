@implementation HMDSiriMultiUserNewLanguageNotificationManager

- (HMDSiriMultiUserNewLanguageNotificationManager)initWithContext:(id)a3
{
  id v5;
  HMDSiriMultiUserNewLanguageNotificationManager *v6;
  HMDSiriMultiUserNewLanguageNotificationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSiriMultiUserNewLanguageNotificationManager;
  v6 = -[HMDSiriMultiUserNewLanguageNotificationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    -[HMDSiriMultiUserNewLanguageNotificationManagerContext setDelegate:](v7->_context, "setDelegate:", v7);
  }

  return v7;
}

- (void)checkAllMediaAccessoriesAndPostNotificationIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDSiriMultiUserNewLanguageNotificationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDSiriMultiUserNewLanguageNotificationManager *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDSiriMultiUserNewLanguageNotificationManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
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
    v17 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Checking all media accessories for RMV new language notification", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSiriMultiUserNewLanguageNotificationManager context](v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaAccessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hmf_isEmpty"))
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@No media accessories in home", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__HMDSiriMultiUserNewLanguageNotificationManager_checkAllMediaAccessoriesAndPostNotificationIfNecessary__block_invoke;
    v15[3] = &unk_1E89BC3F8;
    v15[4] = v6;
    objc_msgSend(v10, "na_each:", v15);
  }

}

- (void)mediaAccessory:(id)a3 didUpdateSoftwareToVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDSiriMultiUserNewLanguageNotificationManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__HMDSiriMultiUserNewLanguageNotificationManager_mediaAccessory_didUpdateSoftwareToVersion___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)_postNotificationIfNecessaryForMediaAccessory:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  HMDSiriMultiUserNewLanguageNotificationManager *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDSiriMultiUserNewLanguageNotificationManager *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDSiriMultiUserNewLanguageNotificationManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDSiriMultiUserNewLanguageNotificationManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  HMDSiriMultiUserNewLanguageNotificationManager *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint32_t v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSiriMultiUserNewLanguageNotificationManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (objc_msgSend(v4, "isHomePod"))
  {
    -[HMDSiriMultiUserNewLanguageNotificationManager context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasCurrentUserSeenNotification");

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
        *(_DWORD *)buf = 138543362;
        v61 = v12;
        v13 = "%{public}@Not posting RMV new language notification because current user has already seen the notification";
LABEL_8:
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, v13, buf, 0xCu);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    -[HMDSiriMultiUserNewLanguageNotificationManager context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isRMVEnabledForCurrentUser");

    if (v15)
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
        v61 = v12;
        v13 = "%{public}@Not posting RMV new language notification because RMV is already enabled for the current user";
        goto LABEL_8;
      }
LABEL_9:

      objc_autoreleasePoolPop(v9);
      goto LABEL_36;
    }
    -[HMDSiriMultiUserNewLanguageNotificationManager context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentDeviceSiriLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDSiriMultiUserNewLanguageNotificationManager context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "siriLanguageForMediaAccessory:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "softwareVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriMultiUserNewLanguageNotificationManager context](self, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "siriLanguagesRequiringNotificationForVersion:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v17 && v19)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v27;
        v62 = 2112;
        v63 = v17;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Current device siri language: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = v24;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v31;
        v62 = 2112;
        v63 = v19;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Media accessory siri language: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v29;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortVersionString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v35;
        v62 = 2112;
        v63 = v36;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Media accessory software version: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      v37 = objc_msgSend(v19, "isEqualToString:", v17);
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v33;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      v38 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if ((v37 & 1) != 0)
      {
        if (v38)
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = v39;
          v62 = 2112;
          v63 = v22;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Siri languages requiring notification: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        if ((objc_msgSend(v22, "containsObject:", v19) & 1) != 0)
        {
          -[HMDSiriMultiUserNewLanguageNotificationManager context](v24, "context");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "mediaAccessories");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "na_filter:", &__block_literal_global_114_162404);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __96__HMDSiriMultiUserNewLanguageNotificationManager__postNotificationIfNecessaryForMediaAccessory___block_invoke_2;
          v58[3] = &unk_1E89C1088;
          v59 = v20;
          v43 = objc_msgSend(v42, "na_all:", v58);

          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = v24;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
          if ((v43 & 1) != 0)
          {
            if (v47)
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v61 = v48;
              v62 = 2112;
              v63 = v19;
              _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Posting notification for language: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v44);
            -[HMDSiriMultiUserNewLanguageNotificationManager context](v45, "context");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "showNotificationForNewlySupportedLanguage:", v19);

            -[HMDSiriMultiUserNewLanguageNotificationManager context](v45, "context");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setCurrentUserHasSeenNotification");

            -[HMDSiriMultiUserNewLanguageNotificationManager context](v45, "context");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "submitLogEventForShownNotificationWithLanguage:", v19);

          }
          else
          {
            if (v47)
            {
              HMFGetLogIdentifier();
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v61 = v57;
              _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Not posting RMV new language notification because at least one homepod is on a lower software version", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v44);
          }

          goto LABEL_35;
        }
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = v24;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v61 = v52;
          v53 = "%{public}@Not posting RMV new language notification because media accessory siri language is not in the "
                "set of siri languages requiring notification";
          goto LABEL_32;
        }
      }
      else if (v38)
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v61 = v52;
        v53 = "%{public}@Not posting RMV new language notification media accessory language does not match current device siri language";
LABEL_32:
        v54 = v26;
        v55 = OS_LOG_TYPE_INFO;
        v56 = 12;
        goto LABEL_33;
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v61 = v52;
      v62 = 2112;
      v63 = v17;
      v64 = 2112;
      v65 = v19;
      v53 = "%{public}@Encountered unexpected missing value. currentDeviceSiriLanguage: %@, mediaAccessorySiriLanguage: %@";
      v54 = v26;
      v55 = OS_LOG_TYPE_ERROR;
      v56 = 32;
LABEL_33:
      _os_log_impl(&dword_1CD062000, v54, v55, v53, buf, v56);

    }
    objc_autoreleasePoolPop(v23);
LABEL_35:

  }
LABEL_36:

}

- (HMDSiriMultiUserNewLanguageNotificationManagerContext)context
{
  return (HMDSiriMultiUserNewLanguageNotificationManagerContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __96__HMDSiriMultiUserNewLanguageNotificationManager__postNotificationIfNecessaryForMediaAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAtLeastVersion:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __96__HMDSiriMultiUserNewLanguageNotificationManager__postNotificationIfNecessaryForMediaAccessory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHomePod");
}

uint64_t __92__HMDSiriMultiUserNewLanguageNotificationManager_mediaAccessory_didUpdateSoftwareToVersion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Media accessory: %@, did update to software version: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationIfNecessaryForMediaAccessory:", *(_QWORD *)(a1 + 40));
}

uint64_t __104__HMDSiriMultiUserNewLanguageNotificationManager_checkAllMediaAccessoriesAndPostNotificationIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postNotificationIfNecessaryForMediaAccessory:", a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_162413 != -1)
    dispatch_once(&logCategory__hmf_once_t33_162413, &__block_literal_global_115);
  return (id)logCategory__hmf_once_v34_162414;
}

void __61__HMDSiriMultiUserNewLanguageNotificationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v34_162414;
  logCategory__hmf_once_v34_162414 = v0;

}

@end
