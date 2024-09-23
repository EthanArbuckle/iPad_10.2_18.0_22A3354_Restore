@implementation HDCloudSyncValidateSubscriptionsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  HDCloudSyncCompoundOperation *v15;
  void *v16;
  HDCloudSyncCompoundOperation *v17;
  HDCloudSyncCompoundOperation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  HDCloudSyncCreateZonesOperation *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HDCloudSyncCreateZonesOperation *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  _BYTE v62[128];
  const __CFString *v63;
  const __CFString *v64;
  __CFString *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[HDCloudSyncOperation profile](self, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "profileType");

    switch(v4)
    {
      case 1:
        -[HDCloudSyncOperation profile](self, "profile");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "daemon");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "behavior");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "tinkerModeEnabled");

        if (v12)
        {
          *(_QWORD *)&v66 = HDCloudSyncPrimaryProfileDataRequestedSubscriptionIdentifier;
          *((_QWORD *)&v66 + 1) = HDCloudSyncPrimaryProfileDataAvailableForDownloadSubscriptionIdentifier;
          v63 = CFSTR("CloudSyncDataUploadRequestRecord");
          v64 = CFSTR("CloudSyncStoreRecord");
          *(_QWORD *)&v67 = HDCloudSyncPrimaryMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
          v65 = CFSTR("CloudSyncMedicalIDRecord");
          v6 = (void *)MEMORY[0x1E0C99D80];
          v7 = 3;
          goto LABEL_5;
        }
        *(_QWORD *)&v66 = HDCloudSyncPrimaryMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
        v5 = CFSTR("CloudSyncMedicalIDRecord");
        goto LABEL_4;
      case 2:
      case 4:
        *(_QWORD *)&v66 = HDCloudSyncSharedSummaryDataAvailableForDownloadSubscriptionIdentifier;
        v5 = CFSTR("SharedSummaryTransactionRecordType");
LABEL_4:
        v63 = v5;
        v6 = (void *)MEMORY[0x1E0C99D80];
        v7 = 1;
        goto LABEL_5;
      case 3:
        -[HDCloudSyncOperation profile](self, "profile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "profileType");

        if (v14 != 3)
          goto LABEL_10;
        *(_QWORD *)&v66 = HDCloudSyncTinkerProfileDataAvailableForDownloadSubscriptionIdentifier;
        *((_QWORD *)&v66 + 1) = HDCloudSyncTinkerMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
        v63 = CFSTR("CloudSyncStoreRecord");
        v64 = CFSTR("CloudSyncMedicalIDRecord");
        v6 = (void *)MEMORY[0x1E0C99D80];
        v7 = 2;
LABEL_5:
        objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", &v63, &v66, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_10:
        v8 = (void *)MEMORY[0x1E0C9AA70];
        break;
    }
  }
  else
  {
    v8 = 0;
  }
  v15 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v15, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v16, 0, CFSTR("Validate subscriptions."), 0);

  v18 = v17;
  if (self)
  {
    v56 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HDCloudSyncOperation profile](self, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "profileType") == 1)
    {
      -[HDCloudSyncOperation profile](self, "profile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "daemon");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "behavior");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "tinkerModeEnabled");

      if ((v23 & 1) != 0)
      {
LABEL_23:

        goto LABEL_24;
      }
      -[HDCloudSyncOperation profile](self, "profile");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "daemon");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "cloudSyncCoordinator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stateSyncDomainForSubscriptionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend(v19, "allKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, &v63, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v67 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
            objc_msgSend(v56, "setObject:forKeyedSubscript:", 0x1E6D38078, v32);
            objc_msgSend(v19, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "addObject:", v33);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, &v63, 16);
        }
        while (v29);
      }

      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __79__HDCloudSyncValidateSubscriptionsOperation__createZonesForStateEntityDomains___block_invoke;
      v61[3] = &unk_1E6CE7E50;
      v61[4] = self;
      objc_msgSend(v55, "hk_map:", v61);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = [HDCloudSyncCreateZonesOperation alloc];
      -[HDCloudSyncOperation configuration](self, "configuration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation configuration](self, "configuration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "repository");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "primaryCKContainer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v35, "initWithConfiguration:cloudState:zones:container:", v36, 0, v34, v39);

      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v18, "addOperation:transitionHandler:", v40, 0);
    }

    goto LABEL_23;
  }
  v56 = 0;
LABEL_24:

  objc_msgSend(v8, "hk_dictionaryByAddingEntriesFromDictionary:", v56);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "repository");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "primaryCKContainer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncValidateSubscriptionsOperation _registerOperationForSubscriptions:container:]((HDCloudSyncRegisterSubscriptionsOperation *)self, v41, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v18, "addOperation:transitionHandler:", v45, 0);
  if (self->_includeSecondaryContainers)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "repository");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "secondaryCKContainers");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v58 != v51)
            objc_enumerationMutation(v48);
          -[HDCloudSyncValidateSubscriptionsOperation _registerOperationForSubscriptions:container:]((HDCloudSyncRegisterSubscriptionsOperation *)self, v8, *(void **)(*((_QWORD *)&v57 + 1) + 8 * j));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "operationIgnoringErrors");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v18, "addOperation:transitionHandler:", v54, 0);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v50);
    }

  }
  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v18);

}

- (HDCloudSyncRegisterSubscriptionsOperation)_registerOperationForSubscriptions:(void *)a3 container:
{
  HDCloudSyncRegisterSubscriptionsOperation *v3;
  id v5;
  id v6;
  HDCloudSyncRegisterSubscriptionsOperation *v7;
  void *v8;

  v3 = a1;
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    v7 = [HDCloudSyncRegisterSubscriptionsOperation alloc];
    -[HDCloudSyncOperation configuration](v3, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[HDCloudSyncRegisterSubscriptionsOperation initWithConfiguration:cloudState:container:subscriptions:](v7, "initWithConfiguration:cloudState:container:subscriptions:", v8, 0, v5, v6);

  }
  return v3;
}

id __79__HDCloudSyncValidateSubscriptionsOperation__createZonesForStateEntityDomains___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0C95088];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = (void *)MEMORY[0x1E0C95098];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncContainerPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hd_stateSyncZoneIDForSyncCircleIdentifier:domain:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v5, "initWithZoneID:", v9);
  return v10;
}

- (BOOL)includeSecondaryContainers
{
  return self->_includeSecondaryContainers;
}

- (void)setIncludeSecondaryContainers:(BOOL)a3
{
  self->_includeSecondaryContainers = a3;
}

@end
