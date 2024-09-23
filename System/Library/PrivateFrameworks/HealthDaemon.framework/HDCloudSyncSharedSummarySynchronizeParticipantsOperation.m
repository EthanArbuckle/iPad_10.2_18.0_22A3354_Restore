@implementation HDCloudSyncSharedSummarySynchronizeParticipantsOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *v19;
  void *v20;
  HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation *v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  HDCloudSyncSharedSummarySynchronizeParticipantsOperation *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSyncSummarySharingPush");

  if ((v6 & 1) != 0)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedCloudState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "repository");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryCKContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v8, "privateMetadataZoneForContainerID:error:", v12, &v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;

    if (!v13 && v14)
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v14);
LABEL_15:

      return;
    }
    if (v13)
    {
      v25 = 0;
      objc_msgSend(v13, "recordsForClass:error:", objc_opt_class(), &v25);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v25;
      v18 = v17;
      if (!v16)
      {
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v17);
        goto LABEL_14;
      }

      v18 = (void *)v16;
    }
    else
    {
      v18 = 0;
    }
    v19 = [HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HDCloudSyncSharedSummaryMergeLocalAndCloudParticipantsOperation initWithConfiguration:privateMetadataZone:participants:](v19, "initWithConfiguration:privateMetadataZone:participants:", v20, v13, v18);

    v22 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__HDCloudSyncSharedSummarySynchronizeParticipantsOperation_main__block_invoke;
    v24[3] = &unk_1E6D03E08;
    v24[4] = self;
    -[HDCloudSyncOperation setOnSuccess:](v21, "setOnSuccess:", v24);
    v23[0] = v22;
    v23[1] = 3221225472;
    v23[2] = __64__HDCloudSyncSharedSummarySynchronizeParticipantsOperation_main__block_invoke_2;
    v23[3] = &unk_1E6D03E30;
    v23[4] = self;
    -[HDCloudSyncOperation setOnError:](v21, "setOnError:", v23);
    -[HDCloudSyncOperation start](v21, "start");

LABEL_14:
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v15 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping operation because platform/profile does not support summary sharing", buf, 0xCu);
  }
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
}

void __64__HDCloudSyncSharedSummarySynchronizeParticipantsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "updatedLocalEntries");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedAuthorizationRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedParticipantRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "updateRequiredLocalEntries:participants:updatedAuthorizationRecords:updatedRecordIDs:", v7, v4, v5, v6);
}

void __64__HDCloudSyncSharedSummarySynchronizeParticipantsOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[summary-sharing] Failed to merge local & cloud participants %{public}@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

- (void)updateRequiredLocalEntries:(id)a3 participants:(id)a4 updatedAuthorizationRecords:(id)a5 updatedRecordIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDCloudSyncCompoundOperation *v14;
  void *v15;
  HDCloudSyncSharedSummaryUpdateCodableEntryOperation *v16;
  void *v17;
  HDCloudSyncSharedSummaryParticipantProfileCreationOperation *v18;
  void *v19;
  HDCloudSyncSharedSummaryUpdateCodableEntryOperation *v20;
  void *v21;
  HDCloudSyncSharedSummaryUpdateCodableEntryOperation *v22;
  HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation *v23;
  void *v24;
  HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation *v25;
  id v26;
  void *v27;
  void *v28;
  HDCloudSyncModifyRecordsOperation *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HDCloudSyncModifyRecordsOperation *v34;
  HDCloudSyncSharedSummaryParticipantProfileCreationOperation *v35;
  HDCloudSyncSharedSummaryUpdateCodableEntryOperation *v36;
  HDCloudSyncCompoundOperation *v37;
  _QWORD v38[4];
  id v39;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v14, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v15, 0, CFSTR("Synchronize Participants"), 0);

  v16 = [HDCloudSyncSharedSummaryUpdateCodableEntryOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[HDCloudSyncSharedSummaryUpdateCodableEntryOperation initWithConfiguration:updatedLocalEntries:isActive:shouldResolveCNContact:](v16, "initWithConfiguration:updatedLocalEntries:isActive:shouldResolveCNContact:", v17, v13, 0, 0);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v37, "addOperation:transitionHandler:", v36, 0);
  v18 = [HDCloudSyncSharedSummaryParticipantProfileCreationOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[HDCloudSyncSharedSummaryParticipantProfileCreationOperation initWithConfiguration:participants:](v18, "initWithConfiguration:participants:", v19, v12);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v37, "addOperation:transitionHandler:", v35, 0);
  v20 = [HDCloudSyncSharedSummaryUpdateCodableEntryOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HDCloudSyncSharedSummaryUpdateCodableEntryOperation initWithConfiguration:updatedLocalEntries:isActive:shouldResolveCNContact:](v20, "initWithConfiguration:updatedLocalEntries:isActive:shouldResolveCNContact:", v21, v13, 1, 1);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v37, "addOperation:transitionHandler:", v22, 0);
  v23 = [HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation initWithConfiguration:participants:](v23, "initWithConfiguration:participants:", v24, v12);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v37, "addOperation:transitionHandler:", v25, 0);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __145__HDCloudSyncSharedSummarySynchronizeParticipantsOperation_updateRequiredLocalEntries_participants_updatedAuthorizationRecords_updatedRecordIDs___block_invoke;
  v38[3] = &unk_1E6CF8890;
  v39 = v10;
  v26 = v10;
  objc_msgSend(v12, "hk_map:", v38);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = [HDCloudSyncModifyRecordsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "repository");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "primaryCKContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v29, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v30, v33, v28, 0);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v37, "addOperation:transitionHandler:", v34, 0);
  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v37);

}

id __145__HDCloudSyncSharedSummarySynchronizeParticipantsOperation_updateRequiredLocalEntries_participants_updatedAuthorizationRecords_updatedRecordIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "record");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
