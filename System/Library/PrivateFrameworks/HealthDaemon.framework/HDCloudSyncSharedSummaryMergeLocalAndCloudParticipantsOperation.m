@implementation HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation

- (HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation)initWithConfiguration:(id)a3 privateMetadataZone:(id)a4 participants:(id)a5
{
  id v9;
  id v10;
  HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *v11;
  uint64_t v12;
  NSArray *participantRecords;
  NSMutableSet *v14;
  NSMutableSet *updatedParticipantRecordIDs;
  NSMutableArray *v16;
  NSMutableArray *updatedLocalEntries;
  NSMutableArray *v18;
  NSMutableArray *updatedAuthorizationRecords;
  HDSynchronousTaskGroup *v20;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v23;

  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation;
  v11 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v23, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    participantRecords = v11->_participantRecords;
    v11->_participantRecords = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_privateMetadataZone, a4);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    updatedParticipantRecordIDs = v11->_updatedParticipantRecordIDs;
    v11->_updatedParticipantRecordIDs = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedLocalEntries = v11->_updatedLocalEntries;
    v11->_updatedLocalEntries = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedAuthorizationRecords = v11->_updatedAuthorizationRecords;
    v11->_updatedAuthorizationRecords = v18;

    v20 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v11->_taskGroup;
    v11->_taskGroup = v20;

    -[HDSynchronousTaskGroup setDelegate:](v11->_taskGroup, "setDelegate:", v11);
  }

  return v11;
}

- (void)main
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_participantRecords;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __71__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation_main__block_invoke;
        v10[3] = &unk_1E6CE77C8;
        v10[4] = self;
        -[HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation _mergeLocalAndCloudParticipant:completion:](self, "_mergeLocalAndCloudParticipant:completion:", v9, v10);
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
}

void __71__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation_main__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "finishTask");
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to merge local and cloud participants: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "failTaskWithError:", v5);
  }

}

- (void)_mergeLocalAndCloudParticipant:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudSyncShimProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "summarySharingEntryShim");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __109__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation__mergeLocalAndCloudParticipant_completion___block_invoke;
  v16[3] = &unk_1E6D0A858;
  v17 = v6;
  v18 = v7;
  v16[4] = self;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v11, "codableEntryWithUUID:configuration:completion:", v12, v13, v16);

}

void __109__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation__mergeLocalAndCloudParticipant_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if ((objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 118) & 1) == 0)
    {
      (*(void (**)(void))(a1[6] + 16))();
      goto LABEL_8;
    }
    v11 = (void *)a1[4];
    v12 = a1[5];
    v15 = v7;
    objc_msgSend(v11, "_createSummarySharingEntryForParticipant:error:", v12, &v15);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v15;

    if (!v5)
    {
      (*(void (**)(void))(a1[6] + 16))();
      v7 = v13;
      goto LABEL_8;
    }
    v7 = v13;
  }
  v8 = (void *)a1[4];
  v9 = a1[5];
  v14 = v7;
  objc_msgSend(v8, "_mergeFoundEntry:withParticipant:error:", v5, v9, &v14);
  v10 = v14;

  (*(void (**)(void))(a1[6] + 16))();
  v7 = v10;
LABEL_8:

}

- (id)_createSummarySharingEntryForParticipant:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HDCodableSummarySharingEntry *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *v39;
  void *v40;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "shareSetupMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "shareSetupMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v42 = self;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: No local entry found for participant: %@", buf, 0x16u);
  }
  -[HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation _authorizationRecordForParticipant:error:](self, "_authorizationRecordForParticipant:error:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v38 = v10;
    objc_msgSend(v10, "authorizationIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKSharingAuthorizationsFromAuthorizationIdentifiers();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = [HDCodableSummarySharingEntry alloc];
    objc_msgSend(v6, "UUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invitationUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudKitIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allContactIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userWheelchairMode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v34, "longValue");
    objc_msgSend(v6, "relationshipType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v32, "longValue");
    objc_msgSend(v6, "relationshipDirection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self;
    v23 = objc_msgSend(v27, "longValue");
    objc_msgSend(v6, "relationshipStatus");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v26, "longValue");
    objc_msgSend(v6, "notificationStatus");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v25, "longValue");
    objc_msgSend(v6, "entryModificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryInvitationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryAcceptanceDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ownerParticipant");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[HDCodableSummarySharingEntry initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:](v35, "initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:", v40, v33, v31, v30, v29, v28, v22, v12, v37, v24, v23, v13, v14, v15, v16,
            v17,
            v8,
            v18);

    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = v39;
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Local save required for participant: %@", buf, 0x16u);
    }
    v20 = (void *)v36;
    -[NSMutableArray addObject:](v39->_updatedLocalEntries, "addObject:", v36);

    v10 = v38;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)_mergeFoundEntry:(id)a3 withParticipant:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *v27;
  NSMutableArray *updatedAuthorizationRecords;
  void *v29;
  os_log_t *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSMutableSet *updatedParticipantRecordIDs;
  void *v38;
  NSObject *v39;
  HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *v41;
  void *v42;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "entryModificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  objc_msgSend(v8, "dateModified");
  v14 = v13;
  v15 = 0;
  v16 = 0;
  switch(objc_msgSend(v9, "mergeWithLocalEntry:error:", v8, a5))
  {
    case 1:
      v16 = 0;
      v15 = 1;
      goto LABEL_6;
    case 2:
      v15 = 0;
      goto LABEL_5;
    case 3:
      v15 = 1;
LABEL_5:
      v16 = 1;
      goto LABEL_6;
    case 4:
      goto LABEL_6;
    case 5:
      _HKInitializeLogging();
      v30 = (os_log_t *)MEMORY[0x1E0CB5370];
      v31 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v44 = self;
        v45 = 2112;
        v46 = v9;
        _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Participant: %@", buf, 0x16u);
      }
      _HKInitializeLogging();
      v32 = *v30;
      if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v44 = self;
        v45 = 2112;
        v46 = v8;
        _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Entry: %@", buf, 0x16u);
      }
      _HKInitializeLogging();
      v33 = *v30;
      if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v44 = self;
        _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: An error occured merging the participant and entry.", buf, 0xCu);
      }
      v19 = 1;
      goto LABEL_31;
    default:
      v16 = 0;
LABEL_6:
      -[HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation _authorizationRecordForParticipant:error:](self, "_authorizationRecordForParticipant:error:", v9, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = v17 != 0;
      if (!v17)
        goto LABEL_30;
      v41 = self;
      objc_msgSend(v17, "authorizationIdentifiers");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sharingAuthorizations");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HDAuthorizationIdentifiersFromCodableSharingAuthorizations(v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)v20;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)v22;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = objc_msgSend(v23, "isEqual:", v25);

      if ((v20 & 1) != 0)
        goto LABEL_21;
      if (v14 > v12)
      {
        _HKInitializeLogging();
        v26 = *MEMORY[0x1E0CB5370];
        v27 = v41;
        v19 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v44 = v41;
          v45 = 2112;
          v46 = v18;
          _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Cloud save required for authorization: %@", buf, 0x16u);
        }
        objc_msgSend(v18, "replaceAuthorizationIdentifiers:", v24);
        updatedAuthorizationRecords = v41->_updatedAuthorizationRecords;
        objc_msgSend(v18, "record");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](updatedAuthorizationRecords, "addObject:", v29);

        if (!v15)
          goto LABEL_25;
LABEL_22:
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v44 = v27;
          v45 = 2112;
          v46 = v9;
          _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Cloud save required for participant: %@", buf, 0x16u);
        }
        updatedParticipantRecordIDs = v27->_updatedParticipantRecordIDs;
        objc_msgSend(v9, "recordID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](updatedParticipantRecordIDs, "addObject:", v38);

        goto LABEL_25;
      }
      v34 = (void *)objc_msgSend(v42, "mutableCopy");
      objc_msgSend(v8, "setAuthorizationCategories:", v34);

      HDCodableSharingAuthorizationsFromAuthorizationIdentifiers(v42);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSharingAuthorizations:", v35);

      v16 = 1;
LABEL_21:
      v27 = v41;
      v19 = 1;
      if (v15)
        goto LABEL_22;
LABEL_25:
      if (v16)
      {
        _HKInitializeLogging();
        v39 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v44 = v27;
          v45 = 2112;
          v46 = v9;
          _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Local save required for participant: %@", buf, 0x16u);
        }
        -[NSMutableArray addObject:](v27->_updatedLocalEntries, "addObject:", v8);
      }

LABEL_30:
LABEL_31:

      return v19;
  }
}

- (id)_authorizationRecordForParticipant:(id)a3 error:(id *)a4
{
  id v6;
  HDCloudSyncCachedZone *privateMetadataZone;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  privateMetadataZone = self->_privateMetadataZone;
  if (privateMetadataZone)
  {
    v8 = objc_opt_class();
    v20 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __108__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation__authorizationRecordForParticipant_error___block_invoke;
    v18 = &unk_1E6CF2138;
    v19 = v6;
    -[HDCloudSyncCachedZone recordsForClass:error:filter:](privateMetadataZone, "recordsForClass:error:filter:", v8, &v20, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v9, "firstObject", v15, v16, v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v10;
      if (v13)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v13);
        else
          _HKLogDroppedError();
      }

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __108__HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation__authorizationRecordForParticipant_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "participantRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v5, v7);

}

- (NSArray)participantRecords
{
  return self->_participantRecords;
}

- (NSMutableSet)updatedParticipantRecordIDs
{
  return self->_updatedParticipantRecordIDs;
}

- (NSMutableArray)updatedAuthorizationRecords
{
  return self->_updatedAuthorizationRecords;
}

- (NSMutableArray)updatedLocalEntries
{
  return self->_updatedLocalEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_participantRecords, 0);
  objc_storeStrong((id *)&self->_updatedLocalEntries, 0);
  objc_storeStrong((id *)&self->_updatedAuthorizationRecords, 0);
  objc_storeStrong((id *)&self->_updatedParticipantRecordIDs, 0);
  objc_storeStrong((id *)&self->_privateMetadataZone, 0);
}

@end
