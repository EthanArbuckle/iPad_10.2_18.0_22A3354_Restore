@implementation HDCloudSyncSharedSummaryRevokeParticipantOperation

- (HDCloudSyncSharedSummaryRevokeParticipantOperation)initWithConfiguration:(id)a3 codableEntry:(id)a4
{
  id v6;
  HDCloudSyncSharedSummaryRevokeParticipantOperation *v7;
  uint64_t v8;
  HDCodableSummarySharingEntry *codableEntry;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncSharedSummaryRevokeParticipantOperation;
  v7 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v11, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    codableEntry = v7->_codableEntry;
    v7->_codableEntry = (HDCodableSummarySharingEntry *)v8;

  }
  return v7;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HDCodableSummarySharingEntry *codableEntry;
  void *v12;
  id v13;
  void *v14;
  id v15;
  HDCloudSyncCompoundOperation *v16;
  void *v17;
  HDCloudSyncCompoundOperation *v18;
  HDCloudSyncModifyRecordsOperation *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HDCloudSyncModifyRecordsOperation *v27;
  void *v28;
  HDCloudSyncModifyRecordsOperation *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryRevokeParticipantOperation *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedCloudState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryCKContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v4, "privateMetadataZoneForContainerID:error:", v8, &v45);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v45;

  if (v9)
  {
    codableEntry = self->_codableEntry;
    v44 = 0;
    -[HDCloudSyncSharedSummaryRevokeParticipantOperation _updatedParticipantRecordInZone:entry:error:](self, "_updatedParticipantRecordInZone:entry:error:", v9, codableEntry, &v44);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v44;
    if (v12)
    {
      v43 = 0;
      -[HDCloudSyncSharedSummaryRevokeParticipantOperation _deleteZonesOperationForParticipant:error:](self, "_deleteZonesOperationForParticipant:error:", v12, &v43);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v43;
      if (v14)
      {
        v16 = [HDCloudSyncCompoundOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v16, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v17, 0, CFSTR("Revoke Participant"), 0);

        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v18, "addOperation:transitionHandler:", v14, 0);
        v39 = v15;
        v19 = [HDCloudSyncModifyRecordsOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v20 = objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "repository");
        v41 = v13;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "primaryCKContainer");
        v40 = v14;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "record");
        v42 = v10;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
        v24 = v9;
        v25 = v12;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v19;
        v28 = (void *)v20;
        v29 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v27, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v20, v22, v26, 0);

        v12 = v25;
        v9 = v24;

        v10 = v42;
        v14 = v40;

        v13 = v41;
        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v18, "addOperation:transitionHandler:", v29, 0);
        -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v18);

        v15 = v39;
      }
      else
      {
        _HKInitializeLogging();
        v33 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v36 = v33;
          objc_msgSend(v9, "zoneIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = self;
          v49 = 2114;
          v50 = v37;
          v51 = 2114;
          v52 = v15;
          _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to find zone for participant %{public}@, %{public}@", buf, 0x20u);

        }
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v15);
      }

    }
    else
    {
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v34 = v30;
        objc_msgSend(v9, "zoneIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = self;
        v49 = 2114;
        v50 = v35;
        v51 = 2114;
        v52 = v13;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to find participant record for %{public}@, %{public}@", buf, 0x20u);

      }
      if (v13)
      {
        v31 = 0;
        v32 = v13;
      }
      else
      {
        v31 = 1;
        v32 = 0;
      }
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v31, v32);
    }

  }
  else
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 724, CFSTR("Private metadata zone not present."));
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v10);
  }

}

- (id)_updatedParticipantRecordInZone:(id)a3 entry:(id)a4 error:(id *)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0CB3A28];
  v9 = a3;
  v10 = [v8 alloc];
  objc_msgSend(v7, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

  v13 = objc_opt_class();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__HDCloudSyncSharedSummaryRevokeParticipantOperation__updatedParticipantRecordInZone_entry_error___block_invoke;
  v21[3] = &unk_1E6CF2110;
  v22 = v12;
  v14 = v12;
  objc_msgSend(v9, "recordsForClass:error:filter:", v13, a5, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "updateWithLocalEntry:error:", v7, a5))
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __98__HDCloudSyncSharedSummaryRevokeParticipantOperation__updatedParticipantRecordInZone_entry_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_deleteZonesOperationForParticipant:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  HDCloudSyncDeleteZonesOperation *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  HDCloudSyncDeleteZonesOperation *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  void *v34;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryRevokeParticipantOperation *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "repository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C95098];
  objc_msgSend(v8, "syncCircleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hd_sharedSummaryZoneIDWithSyncCircleIdentifier:userIdentifier:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "primaryCKContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncZoneIdentifier identifierForZone:container:scope:](HDCloudSyncZoneIdentifier, "identifierForZone:container:scope:", v12, v14, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cachedCloudState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v17, "zonesByIdentifierWithError:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;

  if (v18 || !v19)
  {
    objc_msgSend(v18, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __96__HDCloudSyncSharedSummaryRevokeParticipantOperation__deleteZonesOperationForParticipant_error___block_invoke;
    v31[3] = &unk_1E6CE93D8;
    v22 = v15;
    v32 = v22;
    objc_msgSend(v21, "hk_filter:", v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v23, "count") >= 2)
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        v37 = 2114;
        v38 = v22;
        _os_log_fault_impl(&dword_1B7802000, v24, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@ Retrieved multiple cached participant zones for identifier %{public}@. This is unexpected.", buf, 0x16u);
      }
    }
    objc_msgSend(v23, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = [HDCloudSyncDeleteZonesOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDCloudSyncDeleteZonesOperation initWithConfiguration:cloudState:](v26, "initWithConfiguration:cloudState:", v27, 0);

    if (v25)
    {
      objc_msgSend(v25, "zoneIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncDeleteZonesOperation setZonesToDelete:](v20, "setZonesToDelete:", v29);

    }
  }
  else if (a4)
  {
    v20 = 0;
    *a4 = objc_retainAutorelease(v19);
  }
  else
  {
    _HKLogDroppedError();
    v20 = 0;
  }

  return v20;
}

uint64_t __96__HDCloudSyncSharedSummaryRevokeParticipantOperation__deleteZonesOperationForParticipant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "zoneType") == 3)
  {
    objc_msgSend(v3, "zoneIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
