@implementation HDCloudSyncRepository

- (HDCloudSyncRepository)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDCloudSyncRepository)initWithProfile:(id)a3 syncCircleIdentifier:(id)a4 primaryCKContainer:(id)a5 secondaryCKContainers:(id)a6 userRecordName:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HDCloudSyncRepository *v19;
  HDCloudSyncRepository *v20;
  uint64_t v21;
  HKProfileIdentifier *profileIdentifier;
  uint64_t v23;
  NSSet *allCKContainers;
  uint64_t v25;
  NSArray *secondaryCKContainers;
  uint64_t v27;
  NSSet *v28;
  uint64_t v29;
  NSString *syncCircleIdentifier;
  uint64_t v31;
  NSString *userRecordName;
  void *v33;
  uint64_t v34;
  _HKBehavior *behavior;
  HDCloudSyncAvailability *v36;
  int64_t profileType;
  void *v38;
  void *v39;
  uint64_t v40;
  HDCloudSyncAvailability *syncAvailability;
  uint64_t v42;
  HDCloudSyncMedicalIDDataManager *medicalIDDataManager;
  uint64_t v44;
  HDCloudSyncAttachmentManager *attachmentManager;
  void *v46;
  uint64_t v47;
  HDCloudSyncProfileManager *profileManager;
  uint64_t v49;
  HDCloudSyncSummarySharingEntryManager *sharingEntryManager;
  uint64_t v51;
  HDCloudSyncSharingAuthorizationManager *sharingAuthorizationManager;
  uint64_t v53;
  HDCloudSyncSharedSummaryManager *sharedSummaryManager;
  uint64_t v55;
  HDCloudSyncSyncIdentityManager *syncIdentityManager;
  uint64_t v57;
  HDSyncEngine *syncEngine;
  HDCloudSyncShimProvider *v59;
  void *v60;
  uint64_t v61;
  HDCloudSyncShimProviderProtocol *cloudSyncShimProvider;
  int64_t v63;
  void *v64;
  void *v65;
  int v66;
  void *v68;
  id v69;
  objc_super v70;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncRepository.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

  }
  v70.receiver = self;
  v70.super_class = (Class)HDCloudSyncRepository;
  v19 = -[HDCloudSyncRepository init](&v70, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_profile, a3);
    -[HDCloudSyncRepositoryProfile profileIdentifier](v20->_profile, "profileIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    profileIdentifier = v20->_profileIdentifier;
    v20->_profileIdentifier = (HKProfileIdentifier *)v21;

    v20->_profileType = -[HKProfileIdentifier type](v20->_profileIdentifier, "type");
    objc_storeStrong((id *)&v20->_primaryCKContainer, a5);
    v69 = v16;
    if (v20->_primaryCKContainer)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    allCKContainers = v20->_allCKContainers;
    v20->_allCKContainers = (NSSet *)v23;

    v25 = objc_msgSend(v17, "copy");
    secondaryCKContainers = v20->_secondaryCKContainers;
    v20->_secondaryCKContainers = (NSArray *)v25;

    -[NSSet setByAddingObjectsFromArray:](v20->_allCKContainers, "setByAddingObjectsFromArray:", v20->_secondaryCKContainers);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v20->_allCKContainers;
    v20->_allCKContainers = (NSSet *)v27;

    v29 = objc_msgSend(v15, "copy");
    syncCircleIdentifier = v20->_syncCircleIdentifier;
    v20->_syncCircleIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v18, "copy");
    userRecordName = v20->_userRecordName;
    v20->_userRecordName = (NSString *)v31;

    -[HDCloudSyncRepositoryProfile daemon](v20->_profile, "daemon");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "behavior");
    v34 = objc_claimAutoreleasedReturnValue();
    behavior = v20->_behavior;
    v20->_behavior = (_HKBehavior *)v34;

    v36 = [HDCloudSyncAvailability alloc];
    profileType = v20->_profileType;
    -[HDCloudSyncRepositoryProfile daemon](v20->_profile, "daemon");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "behavior");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[HDCloudSyncAvailability initWithProfileType:behavior:](v36, "initWithProfileType:behavior:", profileType, v39);
    syncAvailability = v20->_syncAvailability;
    v20->_syncAvailability = (HDCloudSyncAvailability *)v40;

    objc_msgSend(v14, "medicalIDDataManager");
    v42 = objc_claimAutoreleasedReturnValue();
    medicalIDDataManager = v20->_medicalIDDataManager;
    v20->_medicalIDDataManager = (HDCloudSyncMedicalIDDataManager *)v42;

    objc_msgSend(v14, "attachmentManager");
    v44 = objc_claimAutoreleasedReturnValue();
    attachmentManager = v20->_attachmentManager;
    v20->_attachmentManager = (HDCloudSyncAttachmentManager *)v44;

    objc_msgSend(v14, "daemon");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "profileManager");
    v47 = objc_claimAutoreleasedReturnValue();
    profileManager = v20->_profileManager;
    v20->_profileManager = (HDCloudSyncProfileManager *)v47;

    objc_msgSend(v14, "sharingEntryManager");
    v49 = objc_claimAutoreleasedReturnValue();
    sharingEntryManager = v20->_sharingEntryManager;
    v20->_sharingEntryManager = (HDCloudSyncSummarySharingEntryManager *)v49;

    objc_msgSend(v14, "sharingAuthorizationManager");
    v51 = objc_claimAutoreleasedReturnValue();
    sharingAuthorizationManager = v20->_sharingAuthorizationManager;
    v20->_sharingAuthorizationManager = (HDCloudSyncSharingAuthorizationManager *)v51;

    objc_msgSend(v14, "sharedSummaryManager");
    v53 = objc_claimAutoreleasedReturnValue();
    sharedSummaryManager = v20->_sharedSummaryManager;
    v20->_sharedSummaryManager = (HDCloudSyncSharedSummaryManager *)v53;

    objc_msgSend(v14, "syncIdentityManager");
    v55 = objc_claimAutoreleasedReturnValue();
    syncIdentityManager = v20->_syncIdentityManager;
    v20->_syncIdentityManager = (HDCloudSyncSyncIdentityManager *)v55;

    objc_msgSend(v14, "syncEngine");
    v57 = objc_claimAutoreleasedReturnValue();
    syncEngine = v20->_syncEngine;
    v20->_syncEngine = (HDSyncEngine *)v57;

    v59 = [HDCloudSyncShimProvider alloc];
    objc_msgSend(v14, "legacyRepositoryProfile");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[HDCloudSyncShimProvider initWithProfile:](v59, "initWithProfile:", v60);
    cloudSyncShimProvider = v20->_cloudSyncShimProvider;
    v20->_cloudSyncShimProvider = (HDCloudSyncShimProviderProtocol *)v61;

    v63 = v20->_profileType;
    if ((unint64_t)(v63 - 2) < 3 || v63 == 100)
    {
      v20->_shouldPushToUnifiedZone = 1;
    }
    else if (v63 == 1)
    {
      v20->_shouldPushToUnifiedZone = _os_feature_enabled_impl();
    }
    -[HDCloudSyncRepositoryProfile daemon](v20->_profile, "daemon");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "behavior");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "isAppleWatch");

    v16 = v69;
    if (v66)
      v20->_shouldPushToUnifiedZone = 1;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncRepository;
  -[HDCloudSyncRepository dealloc](&v4, sel_dealloc);
}

- (int)deviceMode
{
  int64_t profileType;
  int v3;
  void *v4;
  void *v5;

  profileType = self->_profileType;
  if (profileType == 1)
  {
    -[HDCloudSyncRepositoryProfile daemon](self->_profile, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "tinkerModeEnabled"))
      v3 = 2;
    else
      v3 = 1;

  }
  else if (profileType == 3)
  {
    return 2;
  }
  else
  {
    return 1;
  }
  return v3;
}

- (void)unitTest_setShouldPushToUnifiedZone:(BOOL)a3
{
  self->_shouldPushToUnifiedZone = a3;
}

- (id)containerForContainerIdentifier:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_allCKContainers;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "containerIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)cacheAllOwnerIdentifiersWithCompletion:(id)a3
{
  HDCloudSyncRepositoryProfile *profile;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  profile = self->_profile;
  v5 = a3;
  -[HDCloudSyncRepositoryProfile cloudSyncManager](profile, "cloudSyncManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ownerIdentifierManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRepository allCKContainers](self, "allCKContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheOwnerIdentifiersForContainers:completion:", v8, v5);

}

- (id)cachedOwnerIdentifierForContainer:(id)a3
{
  HDCloudSyncRepositoryProfile *profile;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  profile = self->_profile;
  v4 = a3;
  -[HDCloudSyncRepositoryProfile cloudSyncManager](profile, "cloudSyncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ownerIdentifierManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedOwnerIdentifierForContainer:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  HKProfileIdentifier *profileIdentifier;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSArray hk_mapToSet:](self->_secondaryCKContainers, "hk_mapToSet:", &__block_literal_global_57);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  profileIdentifier = self->_profileIdentifier;
  -[CKContainer containerIdentifier](self->_primaryCKContainer, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p [%@] %@ (%@)>"), v5, self, profileIdentifier, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __36__HDCloudSyncRepository_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containerIdentifier");
}

- (HDCloudSyncRepositoryProfile)profile
{
  return self->_profile;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (int64_t)profileType
{
  return self->_profileType;
}

- (CKContainer)primaryCKContainer
{
  return self->_primaryCKContainer;
}

- (NSArray)secondaryCKContainers
{
  return self->_secondaryCKContainers;
}

- (NSSet)allCKContainers
{
  return self->_allCKContainers;
}

- (HDCloudSyncAvailability)syncAvailability
{
  return self->_syncAvailability;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (unint64_t)repositorySettings
{
  return self->_repositorySettings;
}

- (void)setRepositorySettings:(unint64_t)a3
{
  self->_repositorySettings = a3;
}

- (NSString)syncCircleIdentifier
{
  return self->_syncCircleIdentifier;
}

- (NSString)userRecordName
{
  return self->_userRecordName;
}

- (HDCloudSyncShimProviderProtocol)cloudSyncShimProvider
{
  return self->_cloudSyncShimProvider;
}

- (HDCloudSyncMedicalIDDataManager)medicalIDDataManager
{
  return self->_medicalIDDataManager;
}

- (HDCloudSyncAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (HDCloudSyncSummarySharingEntryManager)sharingEntryManager
{
  return self->_sharingEntryManager;
}

- (HDCloudSyncSharedSummaryManager)sharedSummaryManager
{
  return self->_sharedSummaryManager;
}

- (HDCloudSyncSharingAuthorizationManager)sharingAuthorizationManager
{
  return self->_sharingAuthorizationManager;
}

- (HDCloudSyncSyncIdentityManager)syncIdentityManager
{
  return self->_syncIdentityManager;
}

- (HDCloudSyncProfileManager)profileManager
{
  return self->_profileManager;
}

- (HDSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (BOOL)shouldPushToUnifiedZone
{
  return self->_shouldPushToUnifiedZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_profileManager, 0);
  objc_storeStrong((id *)&self->_syncIdentityManager, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_sharedSummaryManager, 0);
  objc_storeStrong((id *)&self->_sharingEntryManager, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_medicalIDDataManager, 0);
  objc_storeStrong((id *)&self->_cloudSyncShimProvider, 0);
  objc_storeStrong((id *)&self->_userRecordName, 0);
  objc_storeStrong((id *)&self->_syncCircleIdentifier, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_syncAvailability, 0);
  objc_storeStrong((id *)&self->_allCKContainers, 0);
  objc_storeStrong((id *)&self->_secondaryCKContainers, 0);
  objc_storeStrong((id *)&self->_primaryCKContainer, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
