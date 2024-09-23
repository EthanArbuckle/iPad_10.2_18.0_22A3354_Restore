@implementation HMDSiriMultiUserNewLanguageNotificationManagerContext

- (HMDSiriMultiUserNewLanguageNotificationManagerContext)initWithUser:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v8;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[HMDSiriMultiUserNewLanguageNotificationManagerContext init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_user, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

- (void)configure
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleMediaAccessorySoftwareVersionUpdated_, CFSTR("HMDAppleMediaAccessorySoftwareVersionUpdatedNotification"), 0);

}

- (void)handleMediaAccessorySoftwareVersionUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
    -[HMDSiriMultiUserNewLanguageNotificationManagerContext delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "softwareVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mediaAccessory:didUpdateSoftwareToVersion:", v7, v9);

    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@delegate is nil", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Received softwareVersion update notification with nil HMDAppleMediaAccessory", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (NSArray)mediaAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDSiriMultiUserNewLanguageNotificationManagerContext user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "appleMediaAccessories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media accessories because home is nil", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v7 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media accessories because user is nil", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v7;
}

- (BOOL)hasCurrentUserSeenNotification
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[HMDSiriMultiUserNewLanguageNotificationManagerContext cachedHasCurrentUserSeenNotification](self, "cachedHasCurrentUserSeenNotification"))
  {
    return 1;
  }
  -[HMDSiriMultiUserNewLanguageNotificationManagerContext user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v3 = objc_msgSend(v4, "ownerHasUserSeenRMVNewLanguageNotification");
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hasCurrentUserSeenNotification because user is nil", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v3 = 1;
  }

  return v3;
}

- (void)setCurrentUserHasSeenNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDSiriMultiUserNewLanguageNotificationManagerContext user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setHasUserSeenRMVNewLanguageNotification:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __90__HMDSiriMultiUserNewLanguageNotificationManagerContext_setCurrentUserHasSeenNotification__block_invoke;
    v10[3] = &unk_24E777290;
    v10[4] = self;
    objc_msgSend(v5, "getResultWithCompletion:", v10);
    -[HMDSiriMultiUserNewLanguageNotificationManagerContext setCachedHasCurrentUserSeenNotification:](self, "setCachedHasCurrentUserSeenNotification:", 1);

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to setCurrentUserHasSeenNotification because user is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (BOOL)isRMVEnabledForCurrentUser
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDSiriMultiUserNewLanguageNotificationManagerContext user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "siriIdentifyVoiceEnabled");
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to setCurrentUserHasSeenNotification because user is nil", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (NSString)currentDeviceSiriLanguage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)siriLanguagesRequiringNotificationForVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceForKey:", CFSTR("forceSiriRMVNewLanguageToEnglish"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@forceSiriRMVNewLanguageToEnglish is enabled, so forcing to english", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("en-US"));
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v17 = (void *)v12;
    goto LABEL_11;
  }
  objc_msgSend(v4, "shortVersionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@The software version is nil", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v14 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "shortVersionString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AFPreferencesMultiUserCompanionNotificationLanguageCodesForHomePodVersion();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v17;
}

- (id)siriLanguageForMediaAccessory:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "settingsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)showNotificationForNewlySupportedLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDSiriMultiUserNewLanguageNotificationManagerContext *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDSiriMultiUserNewLanguageNotificationManagerContext user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[HMDSiriMultiUserNewLanguageNotificationManagerContext userReadableLanguageFromCode:](HMDSiriMultiUserNewLanguageNotificationManagerContext, "userReadableLanguageFromCode:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertNewRMVLanguageBulletinForHome:language:", v6, v7);

    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine user readable string from language code", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Not showing new language RMV notification because home is nil", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)submitLogEventForShownNotificationWithLanguage:(id)a3
{
  id v3;
  void *v4;
  HMDMultiUserNewLanguageNotificationLogEvent *v5;

  v3 = a3;
  v5 = -[HMDMultiUserNewLanguageNotificationLogEvent initWithLanguage:]([HMDMultiUserNewLanguageNotificationLogEvent alloc], "initWithLanguage:", v3);

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitLogEvent:", v5);

}

- (HMDSiriMultiUserNewLanguageNotificationManagerContextDelegate)delegate
{
  return (HMDSiriMultiUserNewLanguageNotificationManagerContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)cachedHasCurrentUserSeenNotification
{
  return self->_cachedHasCurrentUserSeenNotification;
}

- (void)setCachedHasCurrentUserSeenNotification:(BOOL)a3
{
  self->_cachedHasCurrentUserSeenNotification = a3;
}

- (HMDUser)user
{
  return (HMDUser *)objc_loadWeakRetained((id *)&self->_user);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_destroyWeak((id *)&self->_delegate);
}

void __90__HMDSiriMultiUserNewLanguageNotificationManagerContext_setCurrentUserHasSeenNotification__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      v12 = "%{public}@Asynchronously setCurrentUserHasSeenNotification succeeded";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
      v15 = 12;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v16, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v12 = "%{public}@Asynchronously setCurrentUserHasSeenNotification failed with error: %@";
    v13 = v10;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

+ (id)userReadableLanguageFromCode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v8;
    v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@languageCode: %@", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDBCEA0], "deviceLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = v6;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v13;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@preferredLocalization: %@", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x227676638]();
  v16 = v11;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v18;
    v32 = 2112;
    v33 = v14;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@appLocale: %@", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(MEMORY[0x24BDBCEA0], "baseLanguageFromLanguage:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x227676638]();
  v21 = v16;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v23;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@shortCode: %@", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(v14, "localizedStringForLanguage:context:", v19, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x227676638]();
  v26 = v21;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v28;
    v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@languageName: %@", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v25);

  return v24;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19 != -1)
    dispatch_once(&logCategory__hmf_once_t19, &__block_literal_global_14726);
  return (id)logCategory__hmf_once_v20;
}

void __68__HMDSiriMultiUserNewLanguageNotificationManagerContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20;
  logCategory__hmf_once_v20 = v0;

}

@end
