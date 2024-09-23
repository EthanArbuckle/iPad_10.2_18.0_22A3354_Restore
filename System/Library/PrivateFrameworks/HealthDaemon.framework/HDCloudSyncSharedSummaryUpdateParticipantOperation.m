@implementation HDCloudSyncSharedSummaryUpdateParticipantOperation

- (HDCloudSyncSharedSummaryUpdateParticipantOperation)initWithConfiguration:(id)a3 codableEntry:(id)a4 authorizationIdentifiersToAdd:(id)a5 authorizationIdentifiersToDelete:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v13;
  uint64_t v14;
  HDCodableSummarySharingEntry *entry;
  uint64_t v16;
  NSArray *authorizationIdentifiersToAdd;
  uint64_t v18;
  NSArray *authorizationIdentifiersToDelete;
  objc_super v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncSharedSummaryUpdateParticipantOperation;
  v13 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v21, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    entry = v13->_entry;
    v13->_entry = (HDCodableSummarySharingEntry *)v14;

    v16 = objc_msgSend(v11, "copy");
    authorizationIdentifiersToAdd = v13->_authorizationIdentifiersToAdd;
    v13->_authorizationIdentifiersToAdd = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    authorizationIdentifiersToDelete = v13->_authorizationIdentifiersToDelete;
    v13->_authorizationIdentifiersToDelete = (NSArray *)v18;

  }
  return v13;
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
  HDCodableSummarySharingEntry *entry;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  HDCloudSyncModifyRecordsOperation *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[2];
  uint8_t buf[4];
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
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
  v40 = 0;
  objc_msgSend(v4, "privateMetadataZoneForContainerID:error:", v8, &v40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v40;

  if (v9)
  {
    entry = self->_entry;
    v39 = 0;
    -[HDCloudSyncSharedSummaryUpdateParticipantOperation _createOrUpdateParticipantRecordInZone:entry:error:](self, "_createOrUpdateParticipantRecordInZone:entry:error:", v9, entry, &v39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v39;
    if (v12)
    {
      v38 = 0;
      -[HDCloudSyncSharedSummaryUpdateParticipantOperation _createOrUpdateAuthorizationRecordInZone:participantRecord:error:](self, "_createOrUpdateAuthorizationRecordInZone:participantRecord:error:", v9, v12, &v38);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v38;
      if (v14)
      {
        v36 = [HDCloudSyncModifyRecordsOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "repository");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "primaryCKContainer");
        v35 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "record");
        v34 = v15;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v19;
        objc_msgSend(v14, "record");
        v33 = v12;
        v20 = v14;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v36, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v16, v18, v22, 0);
        v37 = v10;
        v24 = (void *)v23;

        v14 = v20;
        v12 = v33;

        v15 = v34;
        v13 = v35;

        -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v24);
        v10 = v37;
      }
      else
      {
        _HKInitializeLogging();
        v26 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v29 = v26;
          objc_msgSend(v9, "zoneIdentifier");
          v30 = v12;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = self;
          v44 = 2114;
          v45 = v31;
          v46 = 2114;
          v47 = v15;
          _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to create or update authorization record for %{public}@, %{public}@", buf, 0x20u);

          v12 = v30;
        }
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v15);
      }

    }
    else
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v27 = v25;
        objc_msgSend(v9, "zoneIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = self;
        v44 = 2114;
        v45 = v28;
        v46 = 2114;
        v47 = v13;
        _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to create or update relationship record for %{public}@, %{public}@", buf, 0x20u);

      }
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v13);
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

- (id)_createOrUpdateParticipantRecordInZone:(id)a3 entry:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  HDCloudSyncSharedSummaryParticipantRecord *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v9, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

  v13 = objc_opt_class();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __105__HDCloudSyncSharedSummaryUpdateParticipantOperation__createOrUpdateParticipantRecordInZone_entry_error___block_invoke;
  v27[3] = &unk_1E6CF2110;
  v14 = v12;
  v28 = v14;
  objc_msgSend(v8, "recordsForClass:error:filter:", v13, a5, v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    goto LABEL_12;
  objc_msgSend(v15, "firstObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v30 = self;
      v31 = 2113;
      v32 = v9;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating participant with entry %{private}@.", buf, 0x16u);
    }
    if (objc_msgSend(v18, "updateWithLocalEntry:error:", v9, a5))
      v20 = v18;
    else
      v20 = 0;
    v21 = v20;

    goto LABEL_13;
  }
  if (!-[HDCloudSyncSharedSummaryUpdateParticipantOperation _containsOnlyCategoriesToAddWithError:](self, "_containsOnlyCategoriesToAddWithError:", a5))
  {
LABEL_12:
    v21 = 0;
    goto LABEL_13;
  }
  v22 = [HDCloudSyncSharedSummaryParticipantRecord alloc];
  objc_msgSend(v8, "zoneIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "zoneIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HDCloudSyncSharedSummaryParticipantRecord initInZone:codableEntry:](v22, "initInZone:codableEntry:", v24, v9);

  _HKInitializeLogging();
  v25 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = self;
    _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Adding new participant.", buf, 0xCu);
  }
LABEL_13:

  return v21;
}

uint64_t __105__HDCloudSyncSharedSummaryUpdateParticipantOperation__createOrUpdateParticipantRecordInZone_entry_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_createOrUpdateAuthorizationRecordInZone:(id)a3 participantRecord:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  _UNKNOWN **v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "authorizationRecordIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = &off_1E6CE2000;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v26 = objc_alloc((Class)v12[465]);
    objc_msgSend(v9, "zoneIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "zoneIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = (id *)objc_msgSend(v26, "initInZone:UUID:authorizationIdentifiers:participantRecord:", v28, v15, self->_authorizationIdentifiersToAdd, v10);

    objc_msgSend(v10, "setAuthorizationRecord:", a5);
    goto LABEL_19;
  }
  v13 = (void *)v11;
  v14 = objc_opt_class();
  v35 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __119__HDCloudSyncSharedSummaryUpdateParticipantOperation__createOrUpdateAuthorizationRecordInZone_participantRecord_error___block_invoke;
  v33[3] = &unk_1E6CF2138;
  v15 = v13;
  v34 = v15;
  objc_msgSend(v9, "recordsForClass:error:filter:", v14, &v35, v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v35;
  v18 = v17;
  if (v16)
  {
    v32 = v17;
    objc_msgSend(v16, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "updateAuthorizationWithIdentifiersToAdd:identifiersToDelete:", self->_authorizationIdentifiersToAdd, self->_authorizationIdentifiersToDelete);
      objc_msgSend(v20, "authorizationIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        a5 = v20;
        v23 = 1;
        v12 = &off_1E6CE2000;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("There are no remaining authorization categories. You must remove the participant from the share instead."));
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v12 = &off_1E6CE2000;
        if (v25)
        {
          if (a5)
            *a5 = objc_retainAutorelease(v25);
          else
            _HKLogDroppedError();
        }

        a5 = 0;
        v23 = 1;
      }
    }
    else
    {
      v23 = 0;
    }

    v18 = v32;
  }
  else
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v30 = v24;
      objc_msgSend(v9, "zoneIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = self;
      v38 = 2114;
      v39 = v31;
      v40 = 2114;
      v41 = v18;
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to get authorization records for %{public}@, %{public}@", buf, 0x20u);

    }
    a5 = 0;
    v23 = 1;
  }

  if (!v23)
    goto LABEL_18;
LABEL_19:

  return a5;
}

uint64_t __119__HDCloudSyncSharedSummaryUpdateParticipantOperation__createOrUpdateAuthorizationRecordInZone_participantRecord_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_containsOnlyCategoriesToAddWithError:(id *)a3
{
  NSUInteger v5;
  id v6;

  v5 = -[NSArray count](self->_authorizationIdentifiersToDelete, "count");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Deleting authorization categories is not supported for new records"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError();
    }

  }
  return v5 == 0;
}

- (HDCodableSummarySharingEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiersToDelete, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiersToAdd, 0);
}

@end
