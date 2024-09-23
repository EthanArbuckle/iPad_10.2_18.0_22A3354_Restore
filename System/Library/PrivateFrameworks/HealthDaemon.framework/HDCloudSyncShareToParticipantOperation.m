@implementation HDCloudSyncShareToParticipantOperation

- (HDCloudSyncShareToParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncShareToParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5 requireExistingRelationship:(BOOL)a6 requireZoneDeviceMode:(id)a7
{
  id v12;
  id v13;
  HDCloudSyncShareToParticipantOperation *v14;
  HDCloudSyncShareToParticipantOperation *v15;
  uint64_t v16;
  CKUserIdentityLookupInfo *identityLookupInfo;
  uint64_t v18;
  NSNumber *expectedDeviceMode;
  objc_super v21;

  v12 = a5;
  v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncShareToParticipantOperation;
  v14 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v21, sel_initWithConfiguration_cloudState_, a3, a4);
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    v16 = objc_msgSend(v12, "copy");
    identityLookupInfo = v15->_identityLookupInfo;
    v15->_identityLookupInfo = (CKUserIdentityLookupInfo *)v16;

    v15->_requireExistingRelationship = a6;
    v18 = objc_msgSend(v13, "copy");
    expectedDeviceMode = v15->_expectedDeviceMode;
    v15->_expectedDeviceMode = (NSNumber *)v18;

  }
  return v15;
}

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  HDCloudSyncCompoundOperation *v5;
  HDCloudSyncLookupParticipantOperation *v6;
  void *v7;
  HDCloudSyncLookupParticipantOperation *v8;
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v9;
  void *v10;
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v11;
  HDCloudSyncLookupParticipantOperation *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HDCloudSyncCreateZonesOperation *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HDCloudSyncCreateZonesOperation *v26;
  HDCloudSyncAddSharingParticipantOperation *v27;
  void *v28;
  HDCloudSyncAddSharingParticipantOperation *v29;
  uint64_t v30;
  HDCloudSyncAddSharingParticipantOperation *v31;
  HDCloudSyncLookupParticipantOperation *v32;
  uint64_t v33;
  HDCloudSyncAddSharingParticipantOperation *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  HDCloudSyncAddSharingParticipantOperation *v43;
  _QWORD v44[4];
  HDCloudSyncAddSharingParticipantOperation *v45;
  HDCloudSyncLookupParticipantOperation *v46;
  HDCloudSyncShareToParticipantOperation *v47;
  _QWORD v48[4];
  HDCloudSyncLookupParticipantOperation *v49;
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, 0, CFSTR("Add Sharing Participant"), 0);

  v6 = [HDCloudSyncLookupParticipantOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDCloudSyncLookupParticipantOperation initWithConfiguration:cloudState:identityLookupInfo:](v6, "initWithConfiguration:cloudState:identityLookupInfo:", v7, 0, self->_identityLookupInfo);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v8, 0);
  v9 = [HDCloudSyncRemoveInvalidShareParticipantsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDCloudSyncRemoveInvalidShareParticipantsOperation initWithConfiguration:cloudState:](v9, "initWithConfiguration:cloudState:", v10, 0);

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke;
  v48[3] = &unk_1E6CE9AA0;
  v12 = v8;
  v49 = v12;
  v50 = v11;
  v40 = v11;
  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v40, v48);
  v13 = objc_alloc(MEMORY[0x1E0C95088]);
  v14 = (void *)MEMORY[0x1E0C95098];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "repository");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "syncCircleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v13, "initWithZoneID:", v18);

  v20 = [HDCloudSyncCreateZonesOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "repository");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "primaryCKContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v20, "initWithConfiguration:cloudState:zones:container:", v21, 0, v22, v25);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v26, 0);
  v27 = [HDCloudSyncAddSharingParticipantOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[HDCloudSyncAddSharingParticipantOperation initWithConfiguration:cloudState:](v27, "initWithConfiguration:cloudState:", v28, 0);

  -[HDCloudSyncAddSharingParticipantOperation setRequireExistingRelationship:](v29, "setRequireExistingRelationship:", self->_requireExistingRelationship);
  v30 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_2;
  v44[3] = &unk_1E6D003D0;
  v31 = v29;
  v45 = v31;
  v46 = v12;
  v47 = self;
  v32 = v12;
  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v31, v44);
  v42[0] = v30;
  v33 = v30;
  v42[1] = 3221225472;
  v42[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_196;
  v42[3] = &unk_1E6CE98F8;
  v42[4] = self;
  v43 = v31;
  v34 = v31;
  -[HDCloudSyncOperation setOnSuccess:](v5, "setOnSuccess:", v42);
  v41[0] = v33;
  v41[1] = 3221225472;
  v41[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_2_202;
  v41[3] = &unk_1E6CE77A0;
  v41[4] = self;
  -[HDCloudSyncOperation setOnError:](v5, "setOnError:", v41);
  -[HDCloudSyncCompoundOperation start](v5, "start");
  -[HDCloudSyncOperation progress](v5, "progress");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "totalUnitCount");

  -[HDCloudSyncOperation progress](self, "progress");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTotalUnitCount:", objc_msgSend(v37, "totalUnitCount") + v36);

  -[HDCloudSyncOperation progress](self, "progress");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation progress](v5, "progress");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addChild:withPendingUnitCount:", v39, v36);

}

void __46__HDCloudSyncShareToParticipantOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "participant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setParticipantsToCheck:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setParticipantsToCheck:", MEMORY[0x1E0C9AA60]);
  }
}

void __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[5], "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setParticipant:", v2);

  objc_msgSend(a1[6], "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedCloudState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "zonesByIdentifierWithError:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setZoneIdentifiers:", v7);

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v9 = a1[6];
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
    }
  }

}

void __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_196(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  os_log_t *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  os_log_t v16;
  os_log_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedCloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryCKContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v5, "unifiedSyncZoneForContainerID:error:", v7, &v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v38;

  if (v8)
    v10 = 1;
  else
    v10 = v9 == 0;
  v11 = (os_log_t *)MEMORY[0x1E0CB5370];
  if (!v10)
  {
    _HKInitializeLogging();
    v12 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v40 = v25;
      v41 = 2114;
      v42 = v9;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
    }
  }
  v37 = 0;
  objc_msgSend(v8, "recordsForClass:error:", objc_opt_class(), &v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v37;
  v15 = v14;
  if (!v13)
  {
    if (v14)
    {
      _HKInitializeLogging();
      v16 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 32);
        v27 = v16;
        objc_msgSend(v8, "zoneIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v26;
        v41 = 2114;
        v42 = v28;
        v43 = 2114;
        v44 = v15;
        _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);

      }
    }
  }
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    _HKInitializeLogging();
    v17 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_FAULT))
    {
      v29 = *(_QWORD *)(a1 + 32);
      v30 = v17;
      objc_msgSend(v8, "zoneIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      v41 = 2114;
      v42 = v31;
      _os_log_fault_impl(&dword_1B7802000, v30, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple registry records for %{public}@. This is unexpected.", buf, 0x16u);

    }
  }
  objc_msgSend(v13, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sharedProfileIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    _HKInitializeLogging();
    v20 = *v11;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v32 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v40 = v32;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieved shared profile identifier for registry record when adding a sharing participant.", buf, 0xCu);
    }
  }
  objc_msgSend(v3, "primaryCKContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_198;
  v33[3] = &unk_1E6D003F8;
  v22 = *(void **)(a1 + 40);
  v33[4] = *(_QWORD *)(a1 + 32);
  v34 = v3;
  v35 = v19;
  v36 = v22;
  v23 = v19;
  v24 = v3;
  objc_msgSend(v21, "fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:", v33);

}

void __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_198(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  HDCloudSyncShareSetupMetadata *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  if (a4)
  {
    v6 = *(void **)(a1 + 32);
    v7 = 0;
    v8 = a4;
  }
  else
  {
    v9 = [HDCloudSyncShareSetupMetadata alloc];
    objc_msgSend(*(id *)(a1 + 40), "syncCircleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 48);
    v12 = v11;
    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "profileIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 56), "shareURLs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "participant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "invitationTokensByShareURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDCloudSyncShareSetupMetadata initWithSyncCircleIdentifier:profileIdentifier:shareURLs:ownerCloudKitEmailAddress:shareParticipant:invitationTokensByShareURL:](v9, "initWithSyncCircleIdentifier:profileIdentifier:shareURLs:ownerCloudKitEmailAddress:shareParticipant:invitationTokensByShareURL:", v10, v12, v13, v19, v14, v15);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 168);
    *(_QWORD *)(v17 + 168) = v16;

    if (!v11)
    v6 = *(void **)(a1 + 32);
    v7 = 1;
    v8 = 0;
  }
  objc_msgSend(v6, "finishWithSuccess:error:", v7, v8);

}

uint64_t __46__HDCloudSyncShareToParticipantOperation_main__block_invoke_2_202(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

- (HDCloudSyncShareSetupMetadata)result
{
  return (HDCloudSyncShareSetupMetadata *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_addedParticipants, 0);
  objc_storeStrong((id *)&self->_participantPushZone, 0);
  objc_storeStrong((id *)&self->_expectedDeviceMode, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_identityLookupInfo, 0);
}

@end
