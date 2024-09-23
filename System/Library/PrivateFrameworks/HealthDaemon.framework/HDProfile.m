@implementation HDProfile

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (HDDatabase)database
{
  return self->_database;
}

- (HDDataManager)dataManager
{
  return self->_dataManager;
}

- (HDUnitPreferencesManager)unitPreferencesManager
{
  return self->_unitPreferencesManager;
}

- (HDSourceManager)sourceManager
{
  return self->_sourceManager;
}

- (HDSourceOrderManager)sourceOrderManager
{
  return self->_sourceOrderManager;
}

- (HDDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (HDDataProvenanceManager)dataProvenanceManager
{
  return self->_dataProvenanceManager;
}

- (HDSyncEngine)syncEngine
{
  HDDaemonSyncEngine *syncEngine;
  void *v6;

  syncEngine = self->_syncEngine;
  if (!syncEngine)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDProfile.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_syncEngine != nil"));

    syncEngine = self->_syncEngine;
  }
  return (HDSyncEngine *)syncEngine;
}

- (HDUserCharacteristicsManager)userCharacteristicsManager
{
  return self->_userCharacteristicsManager;
}

- (HDMetadataManager)metadataManager
{
  return self->_metadataManager;
}

- (HDAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (NSURL)directoryURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_directoryPath, 1);
}

- (BOOL)requiresWeakRetention
{
  return 1;
}

- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  void (*v7)(id, _QWORD, id);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[16];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!HKFeatureIdentifierIsProvidedBySleepDaemon())
  {
    -[HDProfile profileExtensionsConformingToProtocol:](self, "profileExtensionsConformingToProtocol:", &unk_1EF1B52D8);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "featureAvailabilityExtensionForFeatureIdentifier:", v4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v8 = (void *)v13;
            goto LABEL_21;
          }
        }
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
    }
    v8 = 0;
    goto LABEL_21;
  }
  if (!_MergedGlobals_201)
  {
    *(_OWORD *)buf = xmmword_1E6CF25C0;
    v26 = 0;
    _MergedGlobals_201 = _sl_dlopen();
  }
  if (_MergedGlobals_201 && getgetSleepFeatureAvailabilityProvidingSymbolLoc())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDProfile<HKFeatureAvailabilityHealthDataSource> (%@)"), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = (void (*)(id, _QWORD, id))getgetSleepFeatureAvailabilityProvidingSymbolLoc();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<HKFeatureAvailabilityProviding>  _Nullable getSleepFeatureAvailabilityProviding(NSString *__strong, HKHealthStore *__strong, __strong HKFeatureIdentifier)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("HDProfile+HKFeatureAvailabilityHealthDataSource.m"), 31, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v7(v5, 0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
    goto LABEL_22;
  }
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_ERROR))
  {
    v16 = v14;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = objc_opt_class();
    v17 = *(id *)&buf[4];
    _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] HK_TARGET_OS_HAS_SLEEP_DAEMON true but missing getSleepFeatureAvailabilityProviding()", buf, 0xCu);

  }
  v8 = 0;
LABEL_22:

  return v8;
}

- (id)requirementSatisfactionOverridesDataSource
{
  void *v2;
  void *v3;

  -[HDProfile daemon](self, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureAvailabilityRequirementSatisfactionOverridesDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)watchLowPowerModeDataSource
{
  void *v2;
  void *v3;

  -[HDProfile daemon](self, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "watchLowPowerModeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wristDetectionSettingManager
{
  void *v2;
  void *v3;

  -[HDProfile daemon](self, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wristDetectionSettingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userCharacteristicForDataType:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HDProfile userCharacteristicsManager](self, "userCharacteristicsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userCharacteristicForType:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ageWithCurrentDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  id v15;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDProfile userCharacteristicsManager](self, "userCharacteristicsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "userCharacteristicForType:error:", v7, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;

  if (v10)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    v12 = v10;
    if (v10)
    {
      if (a4)
      {
        v13 = 0;
        *a4 = objc_retainAutorelease(v12);
        goto LABEL_11;
      }
      _HKLogDroppedError();
    }
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "hk_ageWithCurrentDate:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v13;
}

- (id)biologicalSexWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDProfile userCharacteristicsManager](self, "userCharacteristicsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "userCharacteristicForType:error:", v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v8)
  {
    v9 = v8;
    if (a3)
    {
      v10 = 0;
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError();
      v10 = 0;
    }
  }
  else
  {
    if (v7)
      v11 = objc_msgSend(v7, "integerValue");
    else
      v11 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6348]), "_initWithBiologicalSex:", v11);
  }

  return v10;
}

- (id)featureStatusProviderForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  HDProfile *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDProfile featureAvailabilityProviderForIdentifier:](self, "featureAvailabilityProviderForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6730]), "initWithFeatureAvailabilityProviding:healthDataSource:countryCodeSource:", v5, self, 0);
  }
  else
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_fault_impl(&dword_1B7802000, v7, OS_LOG_TYPE_FAULT, "[%{public}@] Unable to find feature availability provider for feature identifier %{public}@", (uint8_t *)&v9, 0x16u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)featureAvailabilityProviderForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDProfile profileExtensionsConformingToProtocol:](self, "profileExtensionsConformingToProtocol:", &unk_1EF1B52D8);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "featureAvailabilityExtensionForFeatureIdentifier:", v4, (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[HDProfile profileExtensionsConformingToProtocol:](self, "profileExtensionsConformingToProtocol:", &unk_1EF252278);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v6 = objc_msgSend(v8, "isImproveHealthRecordsDataSubmissionAllowed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("HDProfile does not have a health records profile extension, cannot determine IHR status"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v7);
  }

}

+ (unint64_t)_concurrentDatabaseReaderLimitForProfileType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 3;
  else
    return qword_1B7F56018[a3 - 2];
}

- (HDProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDProfile *v14;
  HDProfile *v15;
  uint64_t v16;
  NSString *directoryPath;
  uint64_t v18;
  NSString *medicalIDDirectoryPath;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  HKSynchronousObserverSet *profileInitializedObservers;
  dispatch_group_t v26;
  OS_dispatch_group *profileObserverGroup;
  id v28;
  void *v29;
  uint64_t v30;
  HKObserverSet *profileReadyObservers;
  uint64_t v32;
  HDDatabase *database;
  HDSourceManager *v34;
  HDSourceManager *sourceManager;
  HDSourceOrderManager *v36;
  HDSourceOrderManager *sourceOrderManager;
  HDDeviceManager *v38;
  HDDeviceManager *deviceManager;
  uint64_t v40;
  HDContributorManager *contributorManager;
  HDAuthorizationManager *v42;
  HDAuthorizationManager *authorizationManager;
  HDDataManager *v44;
  HDDataManager *dataManager;
  HDUnitPreferencesManager *v46;
  HDUnitPreferencesManager *unitPreferencesManager;
  uint64_t v48;
  HDUserCharacteristicsManager *userCharacteristicsManager;
  HDDataProvenanceManager *v50;
  HDDataProvenanceManager *dataProvenanceManager;
  HDDaemonSyncEngine *v52;
  HDDaemonSyncEngine *syncEngine;
  HDSyncIdentityManager *v54;
  HDSyncIdentityManager *syncIdentityManager;
  HDMetadataManager *v56;
  HDMetadataManager *metadataManager;
  HDSharedSummaryManager *v58;
  HDSharedSummaryManager *sharedSummaryManager;
  HDSharingAuthorizationManager *v60;
  HDSharingAuthorizationManager *sharingAuthorizationManager;
  HDFeatureSettingsManager *v62;
  HDFeatureSettingsManager *featureSettingsManager;
  HDOnboardingCompletionManager *v64;
  HDOnboardingCompletionManager *onboardingCompletionManager;
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *v66;
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *healthDataRequirementEvaluationManager;
  uint64_t v68;
  HKFeatureAvailabilityRequirementEvaluationDataSource *requirementEvaluationDataSource;
  HDDeviceContextStoreManager *v70;
  HDDeviceContextStoreManager *deviceContextManager;
  HDDeviceKeyValueStoreManager *v72;
  HDDeviceKeyValueStoreManager *deviceKeyValueStoreManager;
  HDKeyValueDomainManager *v74;
  HDKeyValueDomainManager *keyValueDomainManager;
  HDDatabaseDailyAnalytics *v76;
  HDDatabaseDailyAnalytics *dailyAnalytics;
  uint64_t v78;
  HDCloudSyncManager *cloudSyncManager;
  HDUserDomainConceptManager *v80;
  HDUserDomainConceptManager *userDomainConceptManager;
  id WeakRetained;
  void *v83;
  int v84;
  HDHealthRecordsAccountExistenceNotifier *v85;
  HDHealthRecordsAccountExistenceNotifier *healthRecordsAccountExistenceNotifier;
  HDOntologyDatabase *v87;
  HDOntologyDatabase *ontologyDatabase;
  HDOntologyConceptManager *v89;
  HDOntologyConceptManager *ontologyManager;
  HDConceptIndexManager *v91;
  HDConceptIndexManager *conceptIndexManager;
  HDMedicalIDDataManager *v93;
  HDMedicalIDDataManager *medicalIDDataManager;
  uint64_t v95;
  double v96;
  objc_super v98;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v98.receiver = self;
  v98.super_class = (Class)HDProfile;
  v14 = -[HDProfile init](&v98, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_profileLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v14->_daemon, v12);
    v16 = objc_msgSend(v10, "copy");
    directoryPath = v15->_directoryPath;
    v15->_directoryPath = (NSString *)v16;

    v18 = objc_msgSend(v11, "copy");
    medicalIDDirectoryPath = v15->_medicalIDDirectoryPath;
    v15->_medicalIDDirectoryPath = (NSString *)v18;

    objc_storeStrong((id *)&v15->_profileIdentifier, a6);
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("TEST_PROFILE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v15->_testModeEnabled = objc_msgSend(v21, "fileExistsAtPath:", v20);
    v15->_profileObserverLock._os_unfair_lock_opaque = 0;
    v22 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    HKLogInfrastructure();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithName:loggingCategory:", CFSTR("Profile Initialized"), v23);
    profileInitializedObservers = v15->_profileInitializedObservers;
    v15->_profileInitializedObservers = (HKSynchronousObserverSet *)v24;

    v26 = dispatch_group_create();
    profileObserverGroup = v15->_profileObserverGroup;
    v15->_profileObserverGroup = (OS_dispatch_group *)v26;

    dispatch_group_enter((dispatch_group_t)v15->_profileObserverGroup);
    v28 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogInfrastructure();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithName:loggingCategory:", CFSTR("Profile Ready"), v29);
    profileReadyObservers = v15->_profileReadyObservers;
    v15->_profileReadyObservers = (HKObserverSet *)v30;

    v32 = -[HDProfile _newDatabase](v15, "_newDatabase");
    database = v15->_database;
    v15->_database = (HDDatabase *)v32;

    v34 = -[HDSourceManager initWithProfile:]([HDSourceManager alloc], "initWithProfile:", v15);
    sourceManager = v15->_sourceManager;
    v15->_sourceManager = v34;

    v36 = -[HDSourceOrderManager initWithProfile:]([HDSourceOrderManager alloc], "initWithProfile:", v15);
    sourceOrderManager = v15->_sourceOrderManager;
    v15->_sourceOrderManager = v36;

    v38 = -[HDDeviceManager initWithProfile:]([HDDeviceManager alloc], "initWithProfile:", v15);
    deviceManager = v15->_deviceManager;
    v15->_deviceManager = v38;

    v40 = -[HDProfile _newContributorManager](v15, "_newContributorManager");
    contributorManager = v15->_contributorManager;
    v15->_contributorManager = (HDContributorManager *)v40;

    v42 = -[HDAuthorizationManager initWithProfile:]([HDAuthorizationManager alloc], "initWithProfile:", v15);
    authorizationManager = v15->_authorizationManager;
    v15->_authorizationManager = v42;

    v44 = -[HDDataManager initWithProfile:]([HDDataManager alloc], "initWithProfile:", v15);
    dataManager = v15->_dataManager;
    v15->_dataManager = v44;

    v46 = -[HDUnitPreferencesManager initWithProfile:]([HDUnitPreferencesManager alloc], "initWithProfile:", v15);
    unitPreferencesManager = v15->_unitPreferencesManager;
    v15->_unitPreferencesManager = v46;

    v48 = -[HDProfile _newUserCharacteristicsManager](v15, "_newUserCharacteristicsManager");
    userCharacteristicsManager = v15->_userCharacteristicsManager;
    v15->_userCharacteristicsManager = (HDUserCharacteristicsManager *)v48;

    v50 = -[HDDataProvenanceManager initWithProfile:]([HDDataProvenanceManager alloc], "initWithProfile:", v15);
    dataProvenanceManager = v15->_dataProvenanceManager;
    v15->_dataProvenanceManager = v50;

    v52 = -[HDDaemonSyncEngine initWithProfile:]([HDDaemonSyncEngine alloc], "initWithProfile:", v15);
    syncEngine = v15->_syncEngine;
    v15->_syncEngine = v52;

    v54 = -[HDSyncIdentityManager initWithProfile:]([HDSyncIdentityManager alloc], "initWithProfile:", v15);
    syncIdentityManager = v15->_syncIdentityManager;
    v15->_syncIdentityManager = v54;

    v56 = -[HDMetadataManager initWithProfile:]([HDMetadataManager alloc], "initWithProfile:", v15);
    metadataManager = v15->_metadataManager;
    v15->_metadataManager = v56;

    v58 = -[HDSharedSummaryManager initWithProfile:]([HDSharedSummaryManager alloc], "initWithProfile:", v15);
    sharedSummaryManager = v15->_sharedSummaryManager;
    v15->_sharedSummaryManager = v58;

    v60 = -[HDSharingAuthorizationManager initWithProfile:]([HDSharingAuthorizationManager alloc], "initWithProfile:", v15);
    sharingAuthorizationManager = v15->_sharingAuthorizationManager;
    v15->_sharingAuthorizationManager = v60;

    v62 = -[HDFeatureSettingsManager initWithProfile:]([HDFeatureSettingsManager alloc], "initWithProfile:", v15);
    featureSettingsManager = v15->_featureSettingsManager;
    v15->_featureSettingsManager = v62;

    v64 = -[HDOnboardingCompletionManager initWithProfile:]([HDOnboardingCompletionManager alloc], "initWithProfile:", v15);
    onboardingCompletionManager = v15->_onboardingCompletionManager;
    v15->_onboardingCompletionManager = v64;

    v66 = -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager initWithProfile:]([HDFeatureAvailabilityHealthDataRequirementEvaluationManager alloc], "initWithProfile:", v15);
    healthDataRequirementEvaluationManager = v15->_healthDataRequirementEvaluationManager;
    v15->_healthDataRequirementEvaluationManager = v66;

    objc_msgSend(MEMORY[0x1E0CB66D8], "dataSourceWithHealthDataSource:", v15);
    v68 = objc_claimAutoreleasedReturnValue();
    requirementEvaluationDataSource = v15->_requirementEvaluationDataSource;
    v15->_requirementEvaluationDataSource = (HKFeatureAvailabilityRequirementEvaluationDataSource *)v68;

    v70 = -[HDDeviceContextStoreManager initWithProfile:]([HDDeviceContextStoreManager alloc], "initWithProfile:", v15);
    deviceContextManager = v15->_deviceContextManager;
    v15->_deviceContextManager = v70;

    v72 = -[HDDeviceKeyValueStoreManager initWithProfile:]([HDDeviceKeyValueStoreManager alloc], "initWithProfile:", v15);
    deviceKeyValueStoreManager = v15->_deviceKeyValueStoreManager;
    v15->_deviceKeyValueStoreManager = v72;

    v74 = -[HDKeyValueDomainManager initWithProfile:]([HDKeyValueDomainManager alloc], "initWithProfile:", v15);
    keyValueDomainManager = v15->_keyValueDomainManager;
    v15->_keyValueDomainManager = v74;

    v76 = -[HDDatabaseDailyAnalytics initWithProfile:]([HDDatabaseDailyAnalytics alloc], "initWithProfile:", v15);
    dailyAnalytics = v15->_dailyAnalytics;
    v15->_dailyAnalytics = v76;

    v78 = -[HDProfile _newCloudSyncManager](v15, "_newCloudSyncManager");
    cloudSyncManager = v15->_cloudSyncManager;
    v15->_cloudSyncManager = (HDCloudSyncManager *)v78;

    if (-[HKProfileIdentifier type](v15->_profileIdentifier, "type") != 2)
    {
      v80 = -[HDUserDomainConceptManager initWithProfile:]([HDUserDomainConceptManager alloc], "initWithProfile:", v15);
      userDomainConceptManager = v15->_userDomainConceptManager;
      v15->_userDomainConceptManager = v80;

      WeakRetained = objc_loadWeakRetained((id *)&v15->_daemon);
      objc_msgSend(WeakRetained, "behavior");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "supportsOntology");

      if (v84)
      {
        v85 = -[HDHealthRecordsAccountExistenceNotifier initWithProfile:]([HDHealthRecordsAccountExistenceNotifier alloc], "initWithProfile:", v15);
        healthRecordsAccountExistenceNotifier = v15->_healthRecordsAccountExistenceNotifier;
        v15->_healthRecordsAccountExistenceNotifier = v85;

        v87 = -[HDOntologyDatabase initWithProfile:]([HDOntologyDatabase alloc], "initWithProfile:", v15);
        ontologyDatabase = v15->_ontologyDatabase;
        v15->_ontologyDatabase = v87;

        v89 = -[HDOntologyConceptManager initWithProfile:]([HDOntologyConceptManager alloc], "initWithProfile:", v15);
        ontologyManager = v15->_ontologyManager;
        v15->_ontologyManager = v89;

        v91 = -[HDConceptIndexManager initWithProfile:]([HDConceptIndexManager alloc], "initWithProfile:", v15);
        conceptIndexManager = v15->_conceptIndexManager;
        v15->_conceptIndexManager = v91;

      }
      if (v15->_medicalIDDirectoryPath)
      {
        v93 = -[HDMedicalIDDataManager initWithProfile:]([HDMedicalIDDataManager alloc], "initWithProfile:", v15);
        medicalIDDataManager = v15->_medicalIDDataManager;
        v15->_medicalIDDataManager = v93;

      }
    }
    v95 = -[HKProfileIdentifier type](v15->_profileIdentifier, "type");
    objc_opt_self();
    v96 = 0.0;
    if ((unint64_t)(v95 - 2) < 3)
      v96 = 30.0;
    -[HDDatabase setInactivityFlushInterval:](v15->_database, "setInactivityFlushInterval:", v96);
    -[HDDatabase enterStateInitialized](v15->_database, "enterStateInitialized");

  }
  return v15;
}

- (int64_t)profileType
{
  return -[HKProfileIdentifier type](self->_profileIdentifier, "type");
}

- (HDActivityCacheManagerInterface)activityCacheInterface
{
  return 0;
}

- (HDAgeGatingManager)ageGatingManager
{
  return 0;
}

- (HDAppSubscriptionManager)appSubscriptionManager
{
  return 0;
}

- (HDAssociationManager)associationManager
{
  return 0;
}

- (HDAttachmentManager)attachmentManager
{
  return 0;
}

- (HDCurrentActivitySummaryHelper)currentActivitySummaryHelper
{
  return 0;
}

- (HDProtectedDataOperationScheduler)protectedDataOperationScheduler
{
  return 0;
}

- (HDDataCollectionManager)dataCollectionManager
{
  return 0;
}

- (HDNanoSyncManager)nanoSyncManager
{
  return 0;
}

- (HDNotificationManager)notificationManager
{
  return 0;
}

- (HDNotificationSyncManager)notificationSyncManager
{
  return 0;
}

- (HDRapportMessenger)rapportMessenger
{
  return 0;
}

- (HDServiceConnectionManager)serviceConnectionManager
{
  return 0;
}

- (HDHealthServiceManager)serviceManager
{
  return 0;
}

- (HDAssertionManager)sessionAssertionManager
{
  return 0;
}

- (HDWorkoutManager)workoutManager
{
  return 0;
}

- (HDWorkoutCondenser)workoutCondenser
{
  return 0;
}

- (HDFitnessMachineManager)fitnessMachineManager
{
  return 0;
}

- (HDOntologyDatabase)ontologyDatabase
{
  return self->_ontologyDatabase;
}

- (HDOntologyConceptManager)ontologyConceptManager
{
  return self->_ontologyManager;
}

- (HDConceptIndexManager)conceptIndexManager
{
  return self->_conceptIndexManager;
}

- (HDTinkerPrivacyAlertCoordinator)tinkerPrivacyAlertCoordinator
{
  return 0;
}

- (HDSummarySharingEntryManager)sharingEntryManager
{
  return 0;
}

- (HDSummarySharingEntryIDSManager)summarySharingEntryIDSManager
{
  return 0;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (int64_t)currentSyncIdentityPersistentID
{
  void *v2;
  void *v3;
  int64_t v4;

  -[HDSyncIdentityManager currentSyncIdentity](self->_syncIdentityManager, "currentSyncIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "persistentID");

  return v4;
}

- (void)daemonReady:(id)a3
{
  os_unfair_lock_s *p_profileLock;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_profileLock = &self->_profileLock;
  os_unfair_lock_lock(&self->_profileLock);
  -[HDProfile _createExtensionsIfNeeded]((uint64_t)self);
  os_unfair_lock_unlock(p_profileLock);
  -[HDDatabase enterStateAddResources](self->_database, "enterStateAddResources");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDProfile daemon](self, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protectedResourceStoreProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "protectedResourceStoreForProfile:", self, (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v5, "count"))
    -[HDDatabase addProtectedResourceStores:](self->_database, "addProtectedResourceStores:", v5);
  -[HDDatabase enterStateRun](self->_database, "enterStateRun", (_QWORD)v14);
  -[HDProfile _notifyProfileReadyObservers](self, "_notifyProfileReadyObservers");

}

- (void)_createExtensionsIfNeeded
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
    if (!*(_QWORD *)(a1 + 104))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 168));
      objc_msgSend(WeakRetained, "pluginManager");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "createExtensionsForProfile:", a1);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v3;

    }
  }
}

- (void)registerProfileInitializedObserver:(id)a3 queue:(id)a4
{
  id v5;
  HKSynchronousObserverSet *profileInitializedObservers;
  _QWORD v7[5];

  v5 = a3;
  os_unfair_lock_lock(&self->_profileObserverLock);
  -[HKSynchronousObserverSet registerObserver:](self->_profileInitializedObservers, "registerObserver:", v5);
  if (self->_hasNotifiedProfileInitializedObservers)
  {
    profileInitializedObservers = self->_profileInitializedObservers;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__HDProfile_registerProfileInitializedObserver_queue___block_invoke;
    v7[3] = &unk_1E6D0C9C8;
    v7[4] = self;
    -[HKSynchronousObserverSet notifyObservers:](profileInitializedObservers, "notifyObservers:", v7);
    -[HKSynchronousObserverSet unregisterObserver:](self->_profileInitializedObservers, "unregisterObserver:", v5);
  }
  os_unfair_lock_unlock(&self->_profileObserverLock);

}

uint64_t __54__HDProfile_registerProfileInitializedObserver_queue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profileDidInitialize:", *(_QWORD *)(a1 + 32));
}

- (void)notifyProfileInitializedObservers
{
  os_unfair_lock_s *p_profileObserverLock;
  void *v4;
  HKSynchronousObserverSet *profileInitializedObservers;
  NSObject *v6;
  HKSynchronousObserverSet *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  HDProfile *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_profileObserverLock = &self->_profileObserverLock;
  os_unfair_lock_lock(&self->_profileObserverLock);
  self->_hasNotifiedProfileInitializedObservers = 1;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
  {
    profileInitializedObservers = self->_profileInitializedObservers;
    v6 = v4;
    *(_DWORD *)buf = 134218242;
    v22 = -[HKSynchronousObserverSet count](profileInitializedObservers, "count");
    v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "Notify (%lu) profile initialized observers for profile %@", buf, 0x16u);

  }
  v7 = self->_profileInitializedObservers;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__HDProfile_notifyProfileInitializedObservers__block_invoke;
  v19[3] = &unk_1E6D0C9C8;
  v19[4] = self;
  -[HKSynchronousObserverSet notifyObservers:](v7, "notifyObservers:", v19);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HKSynchronousObserverSet allObservers](self->_profileInitializedObservers, "allObservers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[HKSynchronousObserverSet unregisterObserver:](self->_profileInitializedObservers, "unregisterObserver:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_profileObserverLock);
  dispatch_group_leave((dispatch_group_t)self->_profileObserverGroup);
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  HKCreateSerialDispatchQueue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "registerDaemonReadyObserver:queue:", self, v14);

}

uint64_t __46__HDProfile_notifyProfileInitializedObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profileDidInitialize:", *(_QWORD *)(a1 + 32));
}

- (void)registerProfileReadyObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  HKObserverSet *profileReadyObservers;
  _QWORD v9[5];

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_profileObserverLock);
  -[HKObserverSet registerObserver:queue:](self->_profileReadyObservers, "registerObserver:queue:", v6, v7);

  if (self->_hasNotifiedProfileReadyObservers)
  {
    profileReadyObservers = self->_profileReadyObservers;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__HDProfile_registerProfileReadyObserver_queue___block_invoke;
    v9[3] = &unk_1E6D0C9F0;
    v9[4] = self;
    -[HKObserverSet notifyObserver:handler:](profileReadyObservers, "notifyObserver:handler:", v6, v9);
    -[HKObserverSet unregisterObserver:](self->_profileReadyObservers, "unregisterObserver:", v6);
  }
  os_unfair_lock_unlock(&self->_profileObserverLock);

}

uint64_t __48__HDProfile_registerProfileReadyObserver_queue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profileDidBecomeReady:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyProfileReadyObservers
{
  NSObject *profileObserverGroup;
  dispatch_time_t v4;
  NSObject *v5;
  os_log_t *v6;
  void *v7;
  HKObserverSet *profileReadyObservers;
  NSObject *v9;
  uint64_t v10;
  HKObserverSet *v11;
  uint64_t v12;
  OS_dispatch_group *v13;
  NSMutableArray *v14;
  NSMutableArray *postProfileReadyBlocks;
  os_log_t v16;
  NSObject *v17;
  uint64_t v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD block[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  HDProfile *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  profileObserverGroup = self->_profileObserverGroup;
  v4 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(profileObserverGroup, v4))
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      v35 = 0x403E000000000000;
      v36 = 2112;
      v37 = self;
      _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "Timeout (%0.1f) waiting on profile initialized observers for profile %@", buf, 0x16u);
    }

  }
  os_unfair_lock_lock(&self->_profileObserverLock);
  self->_hasNotifiedProfileReadyObservers = 1;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E0CB52C0];
  v7 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
  {
    profileReadyObservers = self->_profileReadyObservers;
    v9 = v7;
    v10 = -[HKObserverSet count](profileReadyObservers, "count");
    *(_DWORD *)buf = 134218242;
    v35 = v10;
    v36 = 2112;
    v37 = self;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, "Notify (%lu) profile ready observers for profile %@", buf, 0x16u);

  }
  v11 = self->_profileReadyObservers;
  v12 = MEMORY[0x1E0C809B0];
  v13 = self->_profileObserverGroup;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __41__HDProfile__notifyProfileReadyObservers__block_invoke;
  v32[3] = &unk_1E6D0C9F0;
  v32[4] = self;
  -[HKObserverSet notifyObserversInGroup:handler:](v11, "notifyObserversInGroup:handler:", v13, v32);
  -[HKObserverSet unregisterAllObservers](self->_profileReadyObservers, "unregisterAllObservers");
  v14 = self->_postProfileReadyBlocks;
  postProfileReadyBlocks = self->_postProfileReadyBlocks;
  self->_postProfileReadyBlocks = 0;

  os_unfair_lock_unlock(&self->_profileObserverLock);
  if (_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    v16 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      v17 = v16;
      v18 = -[NSMutableArray count](v14, "count");
      *(_DWORD *)buf = 134218242;
      v35 = v18;
      v36 = 2112;
      v37 = self;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_INFO, "Notify (%lu) profile ready blocks for profile %@", buf, 0x16u);

    }
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v14;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23++) + 16))();
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v21);
  }

  if (_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    v24 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (uint64_t)self;
      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_INFO, "Adding unitTest_didReadyProfile for profile %@", buf, 0xCu);
    }
    v25 = self->_profileObserverGroup;
    dispatch_get_global_queue(25, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __41__HDProfile__notifyProfileReadyObservers__block_invoke_237;
    block[3] = &unk_1E6CE80E8;
    block[4] = self;
    dispatch_group_notify(v25, v26, block);

  }
}

void __41__HDProfile__notifyProfileReadyObservers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t *v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (os_log_t *)MEMORY[0x1E0CB52C0];
  if (_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      v7 = (void *)objc_opt_class();
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v15 = 138412546;
      *(_QWORD *)&v15[4] = v7;
      *(_WORD *)&v15[12] = 2112;
      *(_QWORD *)&v15[14] = v8;
      v9 = v7;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "Notifying observer (%@) profile ready for profile %@", v15, 0x16u);

    }
  }
  objc_msgSend(v3, "profileDidBecomeReady:", *(_QWORD *)(a1 + 32), *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 120));
  if (_HDIsUnitTesting)
  {
    _HKInitializeLogging();
    v10 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      v12 = (void *)objc_opt_class();
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v15 = 138412546;
      *(_QWORD *)&v15[4] = v12;
      *(_WORD *)&v15[12] = 2112;
      *(_QWORD *)&v15[14] = v13;
      v14 = v12;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "Notified observer (%@) profile ready for profile %@", v15, 0x16u);

    }
  }

}

void __41__HDProfile__notifyProfileReadyObservers__block_invoke_237(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_INFO, "Calling unitTest_didReadyProfile for profile %@", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unitTest_didReadyProfile:", *(_QWORD *)(a1 + 32));

}

- (BOOL)hasNotifiedProfileReadyObservers
{
  HDProfile *v2;
  os_unfair_lock_s *p_profileObserverLock;

  v2 = self;
  p_profileObserverLock = &self->_profileObserverLock;
  os_unfair_lock_lock(&self->_profileObserverLock);
  LOBYTE(v2) = v2->_hasNotifiedProfileReadyObservers;
  os_unfair_lock_unlock(p_profileObserverLock);
  return (char)v2;
}

- (void)awakeFromDisk
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[5];

  if (-[HDProfile profileType](self, "profileType") != 1)
  {
    -[HDProfile daemon](self, "daemon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "behavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsSecondaryProfiles");

    if ((v5 & 1) == 0)
    {
      -[HDProfile database](self, "database");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __26__HDProfile_awakeFromDisk__block_invoke;
      v7[3] = &unk_1E6CE80E8;
      v7[4] = self;
      objc_msgSend(v6, "performWhenDataProtectedByFirstUnlockIsAvailable:", v7);

    }
  }
}

uint64_t __26__HDProfile_awakeFromDisk__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "profileType");
    HKStringFromProfileType();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Device ineligible for loading profile of type %{public}@. Deleting.", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "triggerDeletion");
}

- (void)prepareForObliterationWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  HDProfile *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Preparing for obliteration (%{public}@).", buf, 0x16u);
  }

  -[HDProfile allProfileExtensions](self, "allProfileExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "prepareForObliteration");
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)invalidateAndWaitWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HDProfile *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating (%{public}@).", (uint8_t *)&v11, 0x16u);
  }

  -[HDProfile nanoSyncManager](self, "nanoSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateAndWait");

  -[HDProfile database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateAndWait");

  -[HDProfile conceptIndexManager](self, "conceptIndexManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateAndWait");

  -[HDProfile ontologyDatabase](self, "ontologyDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateAndWait");

  -[HDProfile summarySharingEntryIDSManager](self, "summarySharingEntryIDSManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateAndWait");

}

- (void)obliterateAndTerminateWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  -[HDProfile daemon](self, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDProfile profileIdentifier](self, "profileIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "obliterateAndTerminateProfiles:options:reason:completion:", v12, a3, v9, v8);

}

- (void)obliterateWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HDProfile daemon](self, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleInternalInstall");

  if ((a3 & 1) != 0)
  {
    if ((a3 & 4) == 0)
    {
      -[HDProfile medicalIDDataManager](self, "medicalIDDataManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[HDProfile medicalIDDataManager](self, "medicalIDDataManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v12 = objc_msgSend(v11, "obliterateMedicalIDDataWithReason:error:", v6, &v18);
        v13 = v18;

        if ((v12 & 1) == 0)
        {
          _HKInitializeLogging();
          HKLogInfrastructure();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v20 = v13;
            _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to obliterate Medical ID: %{public}@", buf, 0xCu);
          }

        }
      }
    }
    -[HDProfile nanoSyncManager](self, "nanoSyncManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "obliterateWithOptions:reason:", a3, v6);

  }
  -[HDProfile database](self, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "obliterateWithReason:preserveCopy:", v6, v9 & (a3 >> 1));

}

- (void)executeBlockAfterProfileReady:(id)a3
{
  os_unfair_lock_s *p_profileObserverLock;
  NSMutableArray *postProfileReadyBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  p_profileObserverLock = &self->_profileObserverLock;
  os_unfair_lock_lock(&self->_profileObserverLock);
  if (self->_hasNotifiedProfileReadyObservers)
  {
    os_unfair_lock_unlock(&self->_profileObserverLock);
    aBlock[2]();
  }
  else
  {
    postProfileReadyBlocks = self->_postProfileReadyBlocks;
    if (!postProfileReadyBlocks)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_postProfileReadyBlocks;
      self->_postProfileReadyBlocks = v6;

      postProfileReadyBlocks = self->_postProfileReadyBlocks;
    }
    v8 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](postProfileReadyBlocks, "addObject:", v8);

    os_unfair_lock_unlock(p_profileObserverLock);
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %@>"), objc_opt_class(), self->_directoryPath);
}

- (BOOL)fetchDisplayFirstName:(id *)a3 lastName:(id *)a4 error:(id *)a5
{
  void *v8;
  HDKeyValueDomain *v9;
  void *v10;
  BOOL v11;
  HDKeyValueDomain *v12;
  id v13;

  v8 = self;
  if (self)
  {
    v9 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 0, CFSTR("profile"), self);
    -[HDKeyValueDomain stringForKey:error:](v9, "stringForKey:error:", CFSTR("displayName"), a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (*a5)
  {
    v11 = 0;
  }
  else
  {
    if (a3 && v10)
      *a3 = objc_retainAutorelease(v10);
    if (v8)
    {
      v12 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 0, CFSTR("profile"), v8);
      -[HDKeyValueDomain stringForKey:error:](v12, "stringForKey:error:", CFSTR("displayLastName"), a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = *a5;
    v11 = *a5 == 0;
    if (!v13 && a4 && v8)
      *a4 = objc_retainAutorelease(v8);

  }
  return v11;
}

- (BOOL)setDisplayFirstName:(id)a3 lastName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HDKeyValueDomain *v10;
  HDDatabase *database;
  void *v12;
  id v13;
  id v14;
  HDKeyValueDomain *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  HDKeyValueDomain *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 0, CFSTR("profile"), self);
  database = self->_database;
  +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__HDProfile_setDisplayFirstName_lastName_error___block_invoke;
  v20[3] = &unk_1E6CEB3F8;
  v21 = v10;
  v22 = v8;
  v23 = v9;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  v16 = -[HDDatabase performTransactionWithContext:error:block:inaccessibilityHandler:](database, "performTransactionWithContext:error:block:inaccessibilityHandler:", v12, a5, v20, 0);

  if (v16)
  {
    -[HDProfile daemon](self, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "profileManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dispatchProfileListDidChange");

  }
  return v16;
}

uint64_t __48__HDProfile_setDisplayFirstName_lastName_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "setString:forKey:error:", *(_QWORD *)(a1 + 40), CFSTR("displayName"), a3);
  if ((_DWORD)result)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      return objc_msgSend(*(id *)(a1 + 32), "setString:forKey:error:", v6, CFSTR("displayLastName"), a3);
    else
      return 1;
  }
  return result;
}

- (id)profileExtensionWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_profileLock;
  id v5;
  void *v6;

  p_profileLock = &self->_profileLock;
  v5 = a3;
  os_unfair_lock_lock(p_profileLock);
  -[HDProfile _createExtensionsIfNeeded]((uint64_t)self);
  -[NSDictionary objectForKeyedSubscript:](self->_profileExtensionsByIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_profileLock);
  return v6;
}

- (id)profileExtensionsConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HDProfile allProfileExtensions](self, "allProfileExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HDProfile_profileExtensionsConformingToProtocol___block_invoke;
  v9[3] = &unk_1E6D0CA18;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __51__HDProfile_profileExtensionsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32));
}

- (id)allProfileExtensions
{
  os_unfair_lock_s *p_profileLock;
  void *v4;
  void *v5;
  id v6;

  p_profileLock = &self->_profileLock;
  os_unfair_lock_lock(&self->_profileLock);
  -[HDProfile _createExtensionsIfNeeded]((uint64_t)self);
  -[NSDictionary allValues](self->_profileExtensionsByIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_profileLock);
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

- (id)fetchDisplayImageDataWithError:(id *)a3
{
  HDKeyValueDomain *v4;
  void *v5;

  v4 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 101, CFSTR("profile"), self);
  -[HDKeyValueDomain dataForKey:error:](v4, "dataForKey:error:", CFSTR("displayImageData"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)setDisplayImageData:(id)a3 error:(id *)a4
{
  id v6;
  HDKeyValueDomain *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 101, CFSTR("profile"), self);
  v8 = -[HDKeyValueDomain setData:forKey:error:](v7, "setData:forKey:error:", v6, CFSTR("displayImageData"), a4);

  if (v8)
  {
    -[HDProfile daemon](self, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "profileManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dispatchProfileListDidChange");

  }
  return v8;
}

- (void)setTestModeEnabled:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_profileLock;
  NSObject *v6;
  _BOOL4 testModeEnabled;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  char v13;
  id v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  HDProfile *v21;
  __int16 v22;
  _WORD v23[9];

  v3 = a3;
  *(_QWORD *)&v23[5] = *MEMORY[0x1E0C80C00];
  p_profileLock = &self->_profileLock;
  os_unfair_lock_lock(&self->_profileLock);
  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    testModeEnabled = self->_testModeEnabled;
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 1024;
    *(_DWORD *)v23 = testModeEnabled;
    v23[2] = 1024;
    *(_DWORD *)&v23[3] = v3;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating test mode %{BOOL}d -> %{BOOL}d", buf, 0x18u);
  }

  v8 = self->_testModeEnabled;
  self->_testModeEnabled = v3;
  os_unfair_lock_unlock(p_profileLock);
  if (v8 != v3)
  {
    -[HDProfile directoryURL](self, "directoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("TEST_PROFILE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    HKLogInfrastructure();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      *(_QWORD *)v23 = v10;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Test mode indicator URL: %{public}@", buf, 0x16u);
    }

    if (v3)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99D50]);
      v19 = 0;
      v13 = objc_msgSend(v12, "writeToURL:options:error:", v10, 0x10000000, &v19);
      v14 = v19;

      if ((v13 & 1) != 0)
      {
LABEL_15:

        return;
      }
      _HKInitializeLogging();
      HKLogInfrastructure();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v21 = self;
        v22 = 2114;
        *(_QWORD *)v23 = v14;
        _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to enable testing mode: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      v18 = 0;
      v16 = objc_msgSend(v14, "removeItemAtURL:error:", v10, &v18);
      v15 = v18;
      if ((v16 & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogInfrastructure();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v21 = self;
          v22 = 2114;
          *(_QWORD *)v23 = v15;
          _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to disable testing mode: %{public}@", buf, 0x16u);
        }

      }
    }

    goto LABEL_15;
  }
}

- (void)triggerDeletion
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HDProfile daemon](self, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDProfile profileIdentifier](self, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v4, "deleteProfile:error:", v5, &v11);
  v7 = v11;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      -[HDProfile profileIdentifier](self, "profileIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Error deleting profile %{public}@, error: %{public}@ (#t0)", buf, 0x16u);

    }
  }

}

- (id)_newDatabase
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HDDatabase *v10;

  v3 = +[HDProfile _concurrentDatabaseReaderLimitForProfileType:](HDProfile, "_concurrentDatabaseReaderLimitForProfileType:", -[HDProfile profileType](self, "profileType"));
  v4 = objc_alloc(MEMORY[0x1E0D29820]);
  -[HDProfile daemon](self, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDProfile daemon](self, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentProtectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithBehavior:concurrentReaderLimit:contentProtectionManager:", v6, v3, v8);

  v10 = -[HDDatabase initWithConfiguration:profile:]([HDDatabase alloc], "initWithConfiguration:profile:", v9, self);
  return v10;
}

- (id)_newAWDSubmissionManager
{
  return 0;
}

- (id)_newWorkoutManager
{
  return 0;
}

- (id)_newUserCharacteristicsManager
{
  return -[HDUserCharacteristicsManager initWithProfile:]([HDUserCharacteristicsManager alloc], "initWithProfile:", self);
}

- (id)_newCloudSyncManager
{
  return -[HDCloudSyncManager initWithProfile:]([HDCloudSyncManager alloc], "initWithProfile:", self);
}

- (id)_newContributorManager
{
  return -[HDContributorManager initWithProfile:]([HDContributorManager alloc], "initWithProfile:", self);
}

- (void)_setOnboardingCompletionManager:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingCompletionManager, a3);
}

- (HDRestorableAlarmScheduler)alarmScheduler
{
  return self->_alarmScheduler;
}

- (HDCloudSyncManager)cloudSyncManager
{
  return self->_cloudSyncManager;
}

- (HDContributorManager)contributorManager
{
  return self->_contributorManager;
}

- (HDDeviceContextStoreManager)deviceContextManager
{
  return self->_deviceContextManager;
}

- (HDDeviceKeyValueStoreManager)deviceKeyValueStoreManager
{
  return self->_deviceKeyValueStoreManager;
}

- (HDFeatureSettingsManager)featureSettingsManager
{
  return self->_featureSettingsManager;
}

- (HDHealthRecordsAccountExistenceNotifier)healthRecordsAccountExistenceNotifier
{
  return self->_healthRecordsAccountExistenceNotifier;
}

- (HDMedicalIDDataManager)medicalIDDataManager
{
  return self->_medicalIDDataManager;
}

- (HDOnboardingCompletionManager)onboardingCompletionManager
{
  return self->_onboardingCompletionManager;
}

- (HDPeriodicCountryMonitor)periodicCountryMonitor
{
  return self->_periodicCountryMonitor;
}

- (HDSharedSummaryManager)sharedSummaryManager
{
  return self->_sharedSummaryManager;
}

- (HDSharingAuthorizationManager)sharingAuthorizationManager
{
  return self->_sharingAuthorizationManager;
}

- (HDSyncIdentityManager)syncIdentityManager
{
  return self->_syncIdentityManager;
}

- (HDUserDomainConceptManager)userDomainConceptManager
{
  return self->_userDomainConceptManager;
}

- (HDDatabaseDailyAnalytics)dailyAnalytics
{
  return self->_dailyAnalytics;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSString)medicalIDDirectoryPath
{
  return self->_medicalIDDirectoryPath;
}

- (BOOL)testModeEnabled
{
  return self->_testModeEnabled;
}

- (HDAWDSubmissionManager)awdSubmissionManager
{
  return self->_awdSubmissionManager;
}

- (HDFeatureAvailabilityHealthDataRequirementEvaluationManager)healthDataRequirementEvaluationManager
{
  return self->_healthDataRequirementEvaluationManager;
}

- (HKFeatureAvailabilityRequirementEvaluationDataSource)requirementEvaluationDataSource
{
  return self->_requirementEvaluationDataSource;
}

- (HDKeyValueDomainManager)keyValueDomainManager
{
  return self->_keyValueDomainManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomainManager, 0);
  objc_storeStrong((id *)&self->_requirementEvaluationDataSource, 0);
  objc_storeStrong((id *)&self->_healthDataRequirementEvaluationManager, 0);
  objc_storeStrong((id *)&self->_awdSubmissionManager, 0);
  objc_storeStrong((id *)&self->_unitPreferencesManager, 0);
  objc_storeStrong((id *)&self->_medicalIDDirectoryPath, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_userDomainConceptManager, 0);
  objc_storeStrong((id *)&self->_userCharacteristicsManager, 0);
  objc_storeStrong((id *)&self->_sourceOrderManager, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_sharedSummaryManager, 0);
  objc_storeStrong((id *)&self->_periodicCountryMonitor, 0);
  objc_storeStrong((id *)&self->_onboardingCompletionManager, 0);
  objc_storeStrong((id *)&self->_metadataManager, 0);
  objc_storeStrong((id *)&self->_medicalIDDataManager, 0);
  objc_storeStrong((id *)&self->_healthRecordsAccountExistenceNotifier, 0);
  objc_storeStrong((id *)&self->_featureSettingsManager, 0);
  objc_storeStrong((id *)&self->_deviceKeyValueStoreManager, 0);
  objc_storeStrong((id *)&self->_deviceContextManager, 0);
  objc_storeStrong((id *)&self->_dataProvenanceManager, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_contributorManager, 0);
  objc_storeStrong((id *)&self->_cloudSyncManager, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_postProfileReadyBlocks, 0);
  objc_storeStrong((id *)&self->_profileReadyObservers, 0);
  objc_storeStrong((id *)&self->_profileInitializedObservers, 0);
  objc_storeStrong((id *)&self->_profileObserverGroup, 0);
  objc_storeStrong((id *)&self->_profileExtensionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_dailyAnalytics, 0);
  objc_storeStrong((id *)&self->_syncIdentityManager, 0);
  objc_storeStrong((id *)&self->_conceptIndexManager, 0);
  objc_storeStrong((id *)&self->_ontologyManager, 0);
  objc_storeStrong((id *)&self->_ontologyDatabase, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_sourceManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (BOOL)setPairedGuardianParticipant:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  HDTinkerKeyValueDomainWithProfile(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v7, "setData:forKey:error:", v8, CFSTR("TinkerPairedGuardianParticipantKey"), a4);
  else
    v9 = 0;

  return v9;
}

- (id)pairedGuardianParticipantWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  HDTinkerKeyValueDomainWithProfile(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForKey:error:", CFSTR("TinkerPairedGuardianParticipantKey"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)setPairedGuardianUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v15;
  uint64_t v17;

  v6 = a3;
  HDTinkerProtectedKeyValueDomainWithProfile(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "setString:forKey:error:", v8, CFSTR("TinkerSharedUserFirstName"), a4);

  if (!v9)
    goto LABEL_8;
  objc_msgSend(v6, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "setString:forKey:error:", v10, CFSTR("TinkerSharedUserLastName"), a4);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("TinkerSharedUserFirstName"), 0, v17);
LABEL_7:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeValuesForKeys:error:", v15, a4);

LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "dsid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "setNumber:forKey:error:", v12, CFSTR("TinkerSharedUserDSID"), a4);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("TinkerSharedUserFirstName"), CFSTR("TinkerSharedUserLastName"), 0);
    goto LABEL_7;
  }
  v14 = 1;
LABEL_9:

  return v14;
}

- (id)pairedGuardianUserInfoWithError:(id *)a3
{
  void *v4;
  HDTinkerPairedUserInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDTinkerPairedUserInfo *v12;

  HDTinkerProtectedKeyValueDomainWithProfile(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(HDTinkerPairedUserInfo);
  objc_msgSend(v4, "stringForKey:error:", CFSTR("TinkerSharedUserFirstName"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTinkerPairedUserInfo setFirstName:](v5, "setFirstName:", v6);

  -[HDTinkerPairedUserInfo firstName](v5, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (*a3)
  {
    goto LABEL_12;
  }
  objc_msgSend(v4, "stringForKey:error:", CFSTR("TinkerSharedUserLastName"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTinkerPairedUserInfo setLastName:](v5, "setLastName:", v8);

  -[HDTinkerPairedUserInfo lastName](v5, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else if (*a3)
  {
    goto LABEL_12;
  }
  objc_msgSend(v4, "numberForKey:error:", CFSTR("TinkerSharedUserDSID"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTinkerPairedUserInfo setDsid:](v5, "setDsid:", v10);

  -[HDTinkerPairedUserInfo dsid](v5, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_13:
    v12 = v5;
    goto LABEL_14;
  }
  if (!*a3)
    goto LABEL_13;
LABEL_12:
  v12 = 0;
LABEL_14:

  return v12;
}

@end
