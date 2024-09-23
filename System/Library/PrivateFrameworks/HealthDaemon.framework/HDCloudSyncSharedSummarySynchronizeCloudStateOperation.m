@implementation HDCloudSyncSharedSummarySynchronizeCloudStateOperation

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
  HDCloudSyncCachedZone *v13;
  id v14;
  HDCloudSyncCachedZone *privateMetadataZone;
  NSObject *v16;
  NSArray *participantRecords;
  NSDictionary *participantRecordsByUUID;
  NSMutableSet *v19;
  NSMutableSet *sharesToDelete;
  HDCloudSyncCachedZone *v21;
  NSArray *v22;
  id v23;
  NSArray *v24;
  void *v25;
  NSArray *v26;
  NSObject *v27;
  uint64_t v28;
  NSDictionary *v29;
  NSDictionary *v30;
  NSMutableSet *v31;
  NSMutableSet *updatedParticipantRecordIDs;
  BOOL v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  HDCloudSyncCompoundOperation *v40;
  void *v41;
  HDCloudSyncCompoundOperation *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSArray *v47;
  void *v48;
  HDCloudSyncModifyRecordsOperation *v49;
  HDCloudSyncCompoundOperation *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HDCloudSyncModifyRecordsOperation *v55;
  void *v56;
  void *v57;
  HDCloudSyncModifyRecordsOperation *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HDCloudSyncModifyRecordsOperation *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  id v68;
  id v69;
  _QWORD v70[5];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint8_t buf[4];
  HDCloudSyncSharedSummarySynchronizeCloudStateOperation *v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
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
    v75 = 0;
    objc_msgSend(v8, "privateMetadataZoneForContainerID:error:", v12, &v75);
    v13 = (HDCloudSyncCachedZone *)objc_claimAutoreleasedReturnValue();
    v14 = v75;
    privateMetadataZone = self->_privateMetadataZone;
    self->_privateMetadataZone = v13;

    if (!self->_privateMetadataZone && v14)
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v14);
LABEL_38:

      return;
    }
    v69 = v14;
    participantRecords = self->_participantRecords;
    self->_participantRecords = (NSArray *)MEMORY[0x1E0C9AA60];

    participantRecordsByUUID = self->_participantRecordsByUUID;
    self->_participantRecordsByUUID = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sharesToDelete = self->_sharesToDelete;
    self->_sharesToDelete = v19;

    v21 = self->_privateMetadataZone;
    if (v21)
    {
      v74 = 0;
      -[HDCloudSyncCachedZone recordsForClass:error:](v21, "recordsForClass:error:", objc_opt_class(), &v74);
      v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v23 = v74;
      v24 = self->_participantRecords;
      self->_participantRecords = v22;

      if (!self->_participantRecords)
      {
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v23);

        goto LABEL_38;
      }
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_participantRecords;
        v27 = v25;
        v28 = -[NSArray count](v26, "count");
        *(_DWORD *)buf = 138543618;
        v77 = self;
        v78 = 2048;
        v79 = v28;
        _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Found %lu participant records in private metadata zone", buf, 0x16u);

      }
      -[NSArray hk_mapToDictionary:](self->_participantRecords, "hk_mapToDictionary:", &__block_literal_global_96);
      v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v30 = self->_participantRecordsByUUID;
      self->_participantRecordsByUUID = v29;

    }
    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    updatedParticipantRecordIDs = self->_updatedParticipantRecordIDs;
    self->_updatedParticipantRecordIDs = v31;

    v73 = 0;
    v33 = -[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _validateParticipantRecordCloudStateWithError:](self, "_validateParticipantRecordCloudStateWithError:", &v73);
    v34 = v73;
    v35 = v34;
    if (v33)
    {
      v72 = v34;
      -[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _removeInvalidSharesOperationWithError:](self, "_removeInvalidSharesOperationWithError:", &v72);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v72;

      if (v36)
      {
        v71 = v37;
        -[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _deleteInvalidZonesOperationWithError:](self, "_deleteInvalidZonesOperationWithError:", &v71);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v71;

        if (v38)
        {
          v68 = v39;
          v40 = [HDCloudSyncCompoundOperation alloc];
          -[HDCloudSyncOperation configuration](self, "configuration");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v40, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v41, 0, CFSTR("Synchronize Cloud Summary State"), 0);

          objc_msgSend(v36, "deletedRecordIDs");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "count");

          if (v44)
            -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v42, "addOperation:transitionHandler:", v36, 0);
          objc_msgSend(v38, "recordZoneIDsToDelete");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "count");

          if (v46)
            -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v42, "addOperation:transitionHandler:", v38, 0);
          if (-[NSMutableSet count](self->_updatedParticipantRecordIDs, "count"))
          {
            v47 = self->_participantRecords;
            v70[0] = MEMORY[0x1E0C809B0];
            v70[1] = 3221225472;
            v70[2] = __62__HDCloudSyncSharedSummarySynchronizeCloudStateOperation_main__block_invoke_188;
            v70[3] = &unk_1E6CF8890;
            v70[4] = self;
            -[NSArray hk_map:](v47, "hk_map:", v70);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = [HDCloudSyncModifyRecordsOperation alloc];
            -[HDCloudSyncOperation configuration](self, "configuration");
            v67 = v38;
            v50 = v42;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncOperation configuration](self, "configuration");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "repository");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "primaryCKContainer");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v49, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v51, v54, v48, 0);

            v42 = v50;
            v38 = v67;
            -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v42, "addOperation:transitionHandler:", v55, 0);

          }
          if (-[NSMutableSet count](self->_sharesToDelete, "count"))
          {
            -[NSMutableSet hk_map:](self->_sharesToDelete, "hk_map:", &__block_literal_global_192_1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "allObjects");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            v58 = [HDCloudSyncModifyRecordsOperation alloc];
            -[HDCloudSyncOperation configuration](self, "configuration");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncOperation configuration](self, "configuration");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "repository");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "primaryCKContainer");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:scope:recordsToSave:recordIDsToDelete:](v58, "initWithConfiguration:container:scope:recordsToSave:recordIDsToDelete:", v59, v62, 3, 0, v57);

            -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v42, "addOperation:transitionHandler:", v63, 0);
          }
          -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v42);

          v39 = v68;
          v14 = v69;
        }
        else
        {
          _HKInitializeLogging();
          v66 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v77 = self;
            v78 = 2114;
            v79 = (uint64_t)v39;
            _os_log_error_impl(&dword_1B7802000, v66, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to compute invalid zones for removal: %{public}@", buf, 0x16u);
          }
          -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v39);
        }

        v37 = v39;
      }
      else
      {
        _HKInitializeLogging();
        v65 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v77 = self;
          v78 = 2114;
          v79 = (uint64_t)v37;
          _os_log_error_impl(&dword_1B7802000, v65, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to compute invalid shares for removal: %{public}@", buf, 0x16u);
        }
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v37);
      }

      v35 = v37;
    }
    else
    {
      _HKInitializeLogging();
      v64 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v77 = self;
        v78 = 2114;
        v79 = (uint64_t)v35;
        _os_log_error_impl(&dword_1B7802000, v64, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to validate participant records: %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v35);
    }

    goto LABEL_38;
  }
  _HKInitializeLogging();
  v16 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v77 = self;
    _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping operation because platform/profile does not support summary sharing", buf, 0xCu);
  }
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
}

void __62__HDCloudSyncSharedSummarySynchronizeCloudStateOperation_main__block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "UUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v5, v7, v6);

}

id __62__HDCloudSyncSharedSummarySynchronizeCloudStateOperation_main__block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
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

uint64_t __62__HDCloudSyncSharedSummarySynchronizeCloudStateOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

- (BOOL)_validateCloudStateForParticipantRecord:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSMutableSet *updatedParticipantRecordIDs;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double Current;
  void *v38;
  double v39;
  double v40;
  _BOOL4 v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  _BYTE v46[24];
  void *v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "relationshipType");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "relationshipType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "longValue");

    if (!v10)
    {
      objc_msgSend(v6, "relationshipStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "longValue");

      -[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _zonesForParticipant:error:](self, "_zonesForParticipant:error:", v6, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
      {
        v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v14, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _currentZoneStateForParticipant:zone:error:](self, "_currentZoneStateForParticipant:zone:error:", v6, v16, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
        goto LABEL_10;
      v19 = objc_msgSend(v17, "longValue");
      objc_msgSend(v6, "relationshipStatus");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        if ((unint64_t)(v13 - 2) < 3)
        {
          objc_msgSend(v6, "relationshipDirection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "longValue") == 1)
          {
            v22 = -[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _updateShareForAllNonOwnerParticipantsInZone:error:](self, "_updateShareForAllNonOwnerParticipantsInZone:error:", v16, a4);

            if (!v22)
            {
LABEL_10:
              v11 = 0;
LABEL_19:

              goto LABEL_20;
            }
LABEL_18:
            v11 = 1;
            goto LABEL_19;
          }
LABEL_17:

          goto LABEL_18;
        }
        if (v13 == 1)
        {
          if (v19 >= 2)
          {
            _HKInitializeLogging();
            v31 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v32 = v31;
              HKStringForSharingStatus();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              HKStringForSharingStatus();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v46 = 138544130;
              *(_QWORD *)&v46[4] = self;
              *(_WORD *)&v46[12] = 2112;
              *(_QWORD *)&v46[14] = v6;
              *(_WORD *)&v46[22] = 2114;
              v47 = v33;
              LOWORD(v48) = 2114;
              *(_QWORD *)((char *)&v48 + 2) = v34;
              _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] %@: Updating status from %{public}@ to %{public}@ due to zone state.", v46, 0x2Au);

            }
            objc_msgSend(v6, "setRelationshipStatus:", v18);
          }
          objc_msgSend(v6, "relationshipDirection");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "longValue") == 1)
          {
            objc_msgSend(v6, "ownerParticipant");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v36)
            {
              if (!-[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _updateOwnerParticipantForParticipantRecord:zone:error:](self, "_updateOwnerParticipantForParticipantRecord:zone:error:", v6, v16, a4))goto LABEL_10;
              goto LABEL_16;
            }
          }
          else
          {

          }
          if (v19 < 2)
            goto LABEL_18;
          goto LABEL_16;
        }
        if (v13)
          goto LABEL_18;
        objc_msgSend(v6, "relationshipDirection");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "longValue");

        if (!v19)
          goto LABEL_18;
        if (v29)
        {
          if (v19 == 4)
            goto LABEL_18;
          _HKInitializeLogging();
          v30 = (void *)*MEMORY[0x1E0CB5370];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            goto LABEL_15;
        }
        else
        {
          Current = CFAbsoluteTimeGetCurrent();
          objc_msgSend(v6, "entryInvitationDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "timeIntervalSinceReferenceDate");
          v40 = Current - v39;

          _HKInitializeLogging();
          v30 = (void *)*MEMORY[0x1E0CB5370];
          v41 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
          if (v40 < 3600.0 && v19 != 1)
          {
            if (v41)
            {
              v42 = v30;
              HKStringForSharingStatus();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v46 = 138543874;
              *(_QWORD *)&v46[4] = self;
              *(_WORD *)&v46[12] = 2112;
              *(_QWORD *)&v46[14] = v6;
              *(_WORD *)&v46[22] = 2114;
              v47 = v43;
              _os_log_impl(&dword_1B7802000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] %@: Ignoring new pending participant despite mismatch with zone status %{public}@.", v46, 0x20u);

            }
            goto LABEL_18;
          }
          if (!v41)
            goto LABEL_15;
        }
        v24 = v30;
        HKStringForSharingStatus();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        HKStringForSharingStatus();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v46 = 138544130;
        *(_QWORD *)&v46[4] = self;
        *(_WORD *)&v46[12] = 2112;
        *(_QWORD *)&v46[14] = v6;
        *(_WORD *)&v46[22] = 2114;
        v47 = v44;
        LOWORD(v48) = 2114;
        *(_QWORD *)((char *)&v48 + 2) = v45;
        _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] %@: Updating status from %{public}@ to %{public}@ due to zone state.", v46, 0x2Au);

      }
      else
      {
        _HKInitializeLogging();
        v23 = (void *)*MEMORY[0x1E0CB5370];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:
          objc_msgSend(v6, "setRelationshipStatus:", v18, *(_OWORD *)v46, *(_QWORD *)&v46[16], v47, v48);
LABEL_16:
          updatedParticipantRecordIDs = self->_updatedParticipantRecordIDs;
          objc_msgSend(v6, "recordID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](updatedParticipantRecordIDs, "addObject:", v21);
          goto LABEL_17;
        }
        v24 = v23;
        HKStringForSharingStatus();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v46 = 138543874;
        *(_QWORD *)&v46[4] = self;
        *(_WORD *)&v46[12] = 2112;
        *(_QWORD *)&v46[14] = v6;
        *(_WORD *)&v46[22] = 2114;
        v47 = v25;
        _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] %@: Filling out initial status from zone state: %{public}@.", v46, 0x20u);

      }
      goto LABEL_15;
    }
  }
  v11 = 1;
LABEL_21:

  return v11;
}

- (id)_zoneIdentifierForParticipant:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "relationshipDirection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "relationshipDirection"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "longValue"),
        v7,
        v6,
        v8))
  {
    v9 = 3;
  }
  else
  {
    v9 = 2;
  }
  v21 = v9;
  v10 = (void *)MEMORY[0x1E0C95098];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syncContainerPrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hd_sharedSummaryZoneIDWithSyncCircleIdentifier:userIdentifier:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "repository");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryCKContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "containerIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncZoneIdentifier identifierForZone:container:scope:](HDCloudSyncZoneIdentifier, "identifierForZone:container:scope:", v14, v18, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)_validateParticipantRecordCloudStateWithError:(id *)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_participantRecords;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!-[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _validateCloudStateForParticipantRecord:error:](self, "_validateCloudStateForParticipantRecord:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), a3, (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)_zonesForParticipant:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  HDCloudSyncSharedSummarySynchronizeCloudStateOperation *v26;
  uint8_t buf[4];
  HDCloudSyncSharedSummarySynchronizeCloudStateOperation *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _zoneIdentifierForParticipant:](self, "_zoneIdentifierForParticipant:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relationshipDirection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "relationshipDirection"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "longValue"),
        v9,
        v8,
        v10))
  {
    v11 = 3;
  }
  else
  {
    v11 = 2;
  }
  -[HDCloudSyncOperation configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cachedCloudState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "repository");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "primaryCKContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "containerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v17, v11, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __85__HDCloudSyncSharedSummarySynchronizeCloudStateOperation__zonesForParticipant_error___block_invoke;
    v24[3] = &unk_1E6CF88F8;
    v19 = v23;
    v25 = v23;
    v26 = self;
    objc_msgSend(v18, "hk_map:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v28 = self;
      v29 = 2112;
      v30 = v6;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to load zones when looking for state for participant %@", buf, 0x16u);
    }
    v20 = 0;
    v19 = v23;
  }

  return v20;
}

id __85__HDCloudSyncSharedSummarySynchronizeCloudStateOperation__zonesForParticipant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDCloudSyncCachedZone *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if (objc_msgSend(v3, "isEquivalentIgnoringOwnerToZone:", *(_QWORD *)(a1 + 32)))
  {
    v4 = [HDCloudSyncCachedZone alloc];
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v4, "initForZoneIdentifier:repository:accessibilityAssertion:", v3, v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_currentZoneStateForParticipant:(id)a3 zone:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  HDCloudSyncSharedSummarySynchronizeCloudStateOperation *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v38 = 0;
    objc_msgSend(a4, "zoneShareWithError:", &v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v38;
    v12 = v11;
    if (v10)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v10, "participants", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v35;
        v17 = &unk_1E6DFC428;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v19, "role") != 1)
            {
              if (objc_msgSend(v19, "acceptanceStatus") == 2)
                goto LABEL_23;
              if (objc_msgSend(v19, "acceptanceStatus") == 1)
              {
                v17 = &unk_1E6DFC440;
LABEL_23:

                goto LABEL_35;
              }
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v15)
            continue;
          break;
        }
      }

      objc_msgSend(v9, "relationshipStatus");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "longValue") == 1)
      {

      }
      else
      {
        objc_msgSend(v9, "relationshipStatus");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "longValue");

        if (v28)
        {
LABEL_29:
          v17 = &unk_1E6DFC458;
LABEL_35:

          goto LABEL_36;
        }
      }
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v41 = self;
        v42 = 2112;
        v43 = v9;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to find participant on share for %@: Marking as declined.", buf, 0x16u);
      }
      goto LABEL_29;
    }
    if (v11)
    {
      if (a5)
      {
        v17 = 0;
        *a5 = objc_retainAutorelease(v11);
      }
      else
      {
        _HKLogDroppedError();
        v17 = 0;
      }
      goto LABEL_35;
    }
    objc_msgSend(v9, "relationshipStatus");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "longValue") == 1)
    {

    }
    else
    {
      objc_msgSend(v9, "relationshipStatus");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "longValue");

      if (v31)
      {
LABEL_34:
        v17 = &unk_1E6DFC410;
        goto LABEL_35;
      }
    }
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v41 = self;
      v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to find share for %@: Marking as revoked.", buf, 0x16u);
    }
    goto LABEL_34;
  }
  objc_msgSend(v8, "relationshipStatus");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "longValue");

  if (v22 == 1)
  {
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      -[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _zoneIdentifierForParticipant:](self, "_zoneIdentifierForParticipant:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = self;
      v42 = 2114;
      v43 = v25;
      v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to find zone %{public}@ for %@: Marking as revoked", buf, 0x20u);

    }
  }
  v17 = &unk_1E6DFC410;
LABEL_36:

  return v17;
}

- (BOOL)_updateShareForAllNonOwnerParticipantsInZone:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  os_log_t *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  HDCloudSyncSharedSummarySynchronizeCloudStateOperation *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v31 = 0;
    objc_msgSend(v6, "zoneShareWithError:", &v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v31;
    if (v8)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v8, "participants");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v12)
      {
        v13 = v12;
        v24 = v9;
        v25 = v8;
        v26 = v7;
        v14 = 0;
        v15 = (os_log_t *)MEMORY[0x1E0CB5370];
        v16 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v11);
            v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v18, "role") != 1)
            {
              _HKInitializeLogging();
              v19 = *v15;
              if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v34 = self;
                _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Participant on the share is not an owner.", buf, 0xCu);
              }
              if (objc_msgSend(v18, "acceptanceStatus") == 1 || objc_msgSend(v18, "acceptanceStatus") == 2)
              {
                _HKInitializeLogging();
                v20 = *v15;
                if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v34 = self;
                  v35 = 2112;
                  v36 = v18;
                  _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Deleting share for participant %@.", buf, 0x16u);
                }
                v14 = 1;
              }
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v13);

        v9 = v24;
        if ((v14 & 1) != 0)
        {
          v8 = v25;
          -[NSMutableSet addObject:](self->_sharesToDelete, "addObject:", v25);
          v21 = 1;
        }
        else
        {
          v21 = 1;
          v8 = v25;
        }
        v7 = v26;
        goto LABEL_31;
      }

    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v34 = self;
        v35 = 2112;
        v36 = v7;
        v37 = 2114;
        v38 = v9;
        _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Failed to find share for zone %@ with error %{public}@.", buf, 0x20u);
      }
      if (v9)
      {
        if (a4)
        {
          v21 = 0;
          *a4 = objc_retainAutorelease(v9);
        }
        else
        {
          _HKLogDroppedError();
          v21 = 0;
        }
        goto LABEL_31;
      }
    }
    v21 = 1;
LABEL_31:

    goto LABEL_32;
  }
  v21 = 1;
LABEL_32:

  return v21;
}

- (BOOL)_updateOwnerParticipantForParticipantRecord:(id)a3 zone:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  HDCloudSyncSharedSummarySynchronizeCloudStateOperation *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    v19 = 0;
    objc_msgSend(a4, "zoneShareWithError:", &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v9, "participants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hk_firstObjectPassingTest:", &__block_literal_global_202_0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v8, "setOwnerParticipant:", v13);
      }
      else
      {
        _HKInitializeLogging();
        v16 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v21 = self;
          v22 = 2112;
          v23 = v8;
          _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Share contains no owner attempting to update owner participant for %@.", buf, 0x16u);
        }
      }

    }
    else
    {
      if (v10)
      {
        if (a5)
        {
          v15 = 0;
          *a5 = objc_retainAutorelease(v10);
        }
        else
        {
          _HKLogDroppedError();
          v15 = 0;
        }
        goto LABEL_15;
      }
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v21 = self;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: No share for participant %@ when attempting to update owner participant.", buf, 0x16u);
      }
    }
    v15 = 1;
LABEL_15:

    goto LABEL_16;
  }
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: No zone for participant %@ when attempting to update owner participant.", buf, 0x16u);
  }
  v15 = 1;
LABEL_16:

  return v15;
}

BOOL __113__HDCloudSyncSharedSummarySynchronizeCloudStateOperation__updateOwnerParticipantForParticipantRecord_zone_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "role") == 1;
}

- (id)_removeInvalidSharesOperationWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  HDCloudSyncModifyRecordsOperation *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HDCloudSyncModifyRecordsOperation *v36;
  HDCloudSyncModifyRecordsOperation *v37;
  void *v39;
  uint64_t v40;
  void *v41;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedCloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryCKContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v11, 3, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v41 = v5;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v39 = v12;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      v40 = *MEMORY[0x1E0C949F0];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v17, "zoneIdentifier", v39);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v44 = 0;
          v19 = objc_msgSend(v18, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v44, &v43);
          v20 = v44;
          v21 = v43;

          if (v19)
          {
            -[HDCloudSyncOperation configuration](self, "configuration");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "syncContainerPrefix");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v21, "isEqualToString:", v23);

            if (v24)
            {
              -[NSDictionary objectForKeyedSubscript:](self->_participantRecordsByUUID, "objectForKeyedSubscript:", v20);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "relationshipDirection");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "longValue");

              if (v27 == 1
                && !-[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _isActiveParticipant:](self, "_isActiveParticipant:", v25))
              {
                v28 = objc_alloc(MEMORY[0x1E0C95070]);
                objc_msgSend(v17, "zoneIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = (void *)objc_msgSend(v28, "initWithRecordName:zoneID:", v40, v29);

                objc_msgSend(v41, "addObject:", v30);
              }

            }
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v14);
    }

    v31 = [HDCloudSyncModifyRecordsOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "repository");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "primaryCKContainer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v31;
    v5 = v41;
    v37 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:scope:recordsToSave:recordIDsToDelete:](v36, "initWithConfiguration:container:scope:recordsToSave:recordIDsToDelete:", v32, v35, 3, 0, v41);

    v12 = v39;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)_deleteInvalidZonesOperationWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HDCloudSyncModifyRecordZonesOperation *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HDCloudSyncModifyRecordZonesOperation *v34;
  void *v36;
  void *v37;
  id obj;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedCloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryCKContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v11, 2, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v36 = v12;
    v37 = v5;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v17, "zoneIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          v40 = 0;
          v19 = objc_msgSend(v18, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v40, &v39);
          v20 = v40;
          v21 = v39;

          if (v19)
          {
            -[HDCloudSyncOperation configuration](self, "configuration");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "syncContainerPrefix");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v21, "isEqualToString:", v23);

            if (v24)
            {
              -[NSDictionary objectForKeyedSubscript:](self->_participantRecordsByUUID, "objectForKeyedSubscript:", v20);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "relationshipDirection");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "longValue");

              if (!v27
                && !-[HDCloudSyncSharedSummarySynchronizeCloudStateOperation _isActiveParticipant:](self, "_isActiveParticipant:", v25))
              {
                objc_msgSend(v17, "zoneIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "addObject:", v28);

              }
            }
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v14);
    }

    v29 = [HDCloudSyncModifyRecordZonesOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "repository");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "primaryCKContainer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v37;
    v34 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:](v29, "initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:", v30, v33, 2, 0, v37);

    v12 = v36;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (BOOL)_isActiveParticipant:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "relationshipStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "longValue"))
    {
      objc_msgSend(v4, "relationshipStatus");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "longValue") == 1;

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharesToDelete, 0);
  objc_storeStrong((id *)&self->_updatedParticipantRecordIDs, 0);
  objc_storeStrong((id *)&self->_participantRecordsByUUID, 0);
  objc_storeStrong((id *)&self->_participantRecords, 0);
  objc_storeStrong((id *)&self->_privateMetadataZone, 0);
}

@end
