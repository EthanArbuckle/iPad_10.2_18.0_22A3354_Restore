@implementation HDCloudSyncPushSequenceOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (id)operationTagDependencies
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  v3[1] = 0x1E6D4D5B8;
  v3[2] = 0x1E6D4D5D8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDCloudSyncPushSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncPushSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6
{
  id v11;
  id v12;
  HDCloudSyncPushSequenceOperation *v13;
  HDCloudSyncPushSequenceOperation *v14;
  HDSynchronousTaskGroup *v15;
  HDSynchronousTaskGroup *taskGroup;
  uint64_t v17;
  OS_dispatch_queue *syncQueue;
  NSMutableArray *v19;
  NSMutableArray *changeRecordsPendingPush;
  NSMutableArray *v21;
  NSMutableArray *recordsPendingDeletion;
  objc_super v24;

  v11 = a5;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HDCloudSyncPushSequenceOperation;
  v13 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v24, sel_initWithConfiguration_cloudState_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_target, a5);
    objc_storeStrong((id *)&v14->_sequenceRecord, a6);
    v14->_lock._os_unfair_lock_opaque = 0;
    v15 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v14->_taskGroup;
    v14->_taskGroup = v15;

    -[HDSynchronousTaskGroup setDelegate:](v14->_taskGroup, "setDelegate:", v14);
    HKCreateSerialDispatchQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    syncQueue = v14->_syncQueue;
    v14->_syncQueue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    changeRecordsPendingPush = v14->_changeRecordsPendingPush;
    v14->_changeRecordsPendingPush = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recordsPendingDeletion = v14->_recordsPendingDeletion;
    v14->_recordsPendingDeletion = v21;

  }
  return v14;
}

- (HDCloudSyncSequenceState)sequenceState
{
  os_unfair_lock_s *p_lock;
  HDCloudSyncSequenceState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sequenceState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSequenceState:(id)a3
{
  HDCloudSyncSequenceState *v5;
  HDCloudSyncSequenceState *sequenceState;
  HDCloudSyncSequenceState *v7;
  BOOL v8;
  void *v9;

  v5 = (HDCloudSyncSequenceState *)a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncPushSequenceOperation.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  sequenceState = self->_sequenceState;
  self->_sequenceState = v5;
  v7 = v5;

  v8 = -[HDCloudSyncSequenceState shouldClearRebaselineDeadline](self->_sequenceState, "shouldClearRebaselineDeadline");
  self->_shouldClearRebaselineDeadline = v8;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  HDCloudSyncSequenceState *sequenceState;
  NSMutableArray *recordsPendingDeletion;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  HDCloudSyncSequenceRecord *sequenceRecord;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HDSyncAnchorMap *v61;
  HDCloudSyncCachedZone *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  HDSyncAnchorMap *v70;
  void *v71;
  HDSyncAnchorMap *v72;
  HDSyncAnchorMap *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  _BOOL4 v78;
  HDSyncAnchorMap *v79;
  HDSyncAnchorMap *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  HDSyncAnchorMap *v88;
  id v89;
  void *v90;
  void *v91;
  HDSyncAnchorMap *v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  HDSyncAnchorMap *v98;
  HDSyncAnchorMap *v99;
  NSObject *v100;
  void *v101;
  HDSyncAnchorMap *v102;
  HDSyncAnchorMap *v103;
  id v104;
  NSObject *v105;
  id v106;
  HDCloudSyncTarget *target;
  HDCloudSyncSequenceRecord *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  int v112;
  void *v113;
  uint64_t v114;
  int v115;
  HDSyncAnchorMap *v116;
  void *v117;
  NSObject *v118;
  const __CFString *v119;
  HDSyncAnchorMap *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *syncQueue;
  int v127;
  void *v128;
  void *v129;
  HDSyncAnchorMap *v130;
  void *v131;
  HDSyncAnchorMap *v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  HDSyncAnchorMap *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  _QWORD block[5];
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[4];
  HDSyncAnchorMap *v155;
  id v156;
  _QWORD v157[5];
  HDSyncAnchorMap *v158;
  HDSyncAnchorMap *v159;
  _BYTE buf[24];
  const __CFString *v161;
  __int128 v162;
  __int128 *v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  sequenceState = self->_sequenceState;
  if (sequenceState)
  {
    recordsPendingDeletion = self->_recordsPendingDeletion;
    -[HDCloudSyncSequenceState recordIDsToDelete](sequenceState, "recordIDsToDelete");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](recordsPendingDeletion, "addObjectsFromArray:", v5);

  }
  -[HDCloudSyncOperation progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTotalUnitCount:", 1000);

  v149 = 0;
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "addAccessibilityAssertion:", v9);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, &v149, &__block_literal_global_245, 0);

  v15 = v149;
  v141 = v15;
  if ((v14 & 1) != 0)
  {
    -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
    -[HDCloudSyncTarget store](self->_target, "store");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "syncStoreForEpoch:", -[HDCloudSyncSequenceRecord baselineEpoch](self->_sequenceRecord, "baselineEpoch"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    sequenceRecord = self->_sequenceRecord;
    -[HDCloudSyncTarget storeRecord](self->_target, "storeRecord");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tombstoneSequenceRecord");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDCloudSyncSequenceRecord isEqual:](sequenceRecord, "isEqual:", v19);

    if (v20)
    {
      objc_msgSend(v140, "syncStoreForTombstoneSyncOnly:", 1);
      v21 = objc_claimAutoreleasedReturnValue();

      v140 = (void *)v21;
    }
    -[HDCloudSyncOperation configuration](self, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "repository");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "syncEngine");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](self, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "repository");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "profile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "legacyRepositoryProfile");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = 0;
    v28 = HDUpgradedToSyncIdentity(v27, (uint64_t)&v148);
    v139 = v148;

    if (v139)
    {
      -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:");
LABEL_10:
      v29 = 0;
LABEL_72:

      goto LABEL_73;
    }
    if (v28)
    {
      v147 = 0;
      -[HDCloudSyncOperation profile](self, "profile");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "syncIdentityManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "currentSyncIdentity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "identity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&v150 = 0;
      *((_QWORD *)&v150 + 1) = &v150;
      *(_QWORD *)&v151 = 0x3032000000;
      *((_QWORD *)&v151 + 1) = __Block_byref_object_copy__21;
      *(_QWORD *)&v152 = __Block_byref_object_dispose__21;
      *((_QWORD *)&v152 + 1) = objc_alloc_init(MEMORY[0x1E0C99E60]);
      +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation configuration](self, "configuration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "accessibilityAssertion");
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "contextWithAccessibilityAssertion:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDCloudSyncOperation profile](self, "profile");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "database");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __76__HDCloudSyncPushSequenceOperation__excludedSyncIdentitiesForPushWithError___block_invoke;
      v161 = (const __CFString *)&unk_1E6CEB640;
      *(_QWORD *)&v162 = self;
      v40 = v33;
      *((_QWORD *)&v162 + 1) = v40;
      v163 = &v150;
      LOBYTE(v36) = objc_msgSend(v39, "performTransactionWithContext:error:block:inaccessibilityHandler:", v37, &v147, buf, 0);

      if ((v36 & 1) != 0)
        v135 = *(id *)(*((_QWORD *)&v150 + 1) + 40);
      else
        v135 = 0;

      _Block_object_dispose(&v150, 8);
      v50 = v147;
      v51 = v50;
      if (!v135)
      {
        -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v50);

        goto LABEL_10;
      }

      v134 = 0;
    }
    else
    {
      -[HDCloudSyncOperation configuration](self, "configuration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "repository");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "syncIdentityManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "currentSyncIdentity");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "identity");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDCloudSyncOperation configuration](self, "configuration");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "computedState");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "targets");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __62__HDCloudSyncPushSequenceOperation__excludedSyncStoresForPush__block_invoke;
      v161 = (const __CFString *)&unk_1E6CEB5F0;
      *(_QWORD *)&v162 = self;
      *((_QWORD *)&v162 + 1) = v45;
      v49 = v45;
      objc_msgSend(v48, "hk_mapToSet:", buf);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      v135 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    }
    -[HDCloudSyncOperation configuration](self, "configuration");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "repository");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "profile");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "cloudSyncManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "context");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "reason");
    HKCloudSyncReasonToString();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "accessibilityAssertion");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "syncSessionForSyncStore:reason:delegate:accessibilityAssertion:excludedStores:excludedSyncIdentities:", v140, v58, self, v60, v134, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v136, "setSequenceRecord:", self->_sequenceRecord);
    v146 = 0;
    v61 = objc_alloc_init(HDSyncAnchorMap);
    v62 = [HDCloudSyncCachedZone alloc];
    -[HDCloudSyncTarget zoneIdentifier](self->_target, "zoneIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "repository");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "accessibilityAssertion");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v62, "initForZoneIdentifier:repository:accessibilityAssertion:", v63, v65, v67);

    v69 = objc_opt_class();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __66__HDCloudSyncPushSequenceOperation__anchorsInCloudForStore_error___block_invoke;
    v161 = (const __CFString *)&unk_1E6CEB510;
    *(_QWORD *)&v162 = self;
    *((_QWORD *)&v162 + 1) = v61;
    v70 = v61;
    objc_msgSend(v68, "recordsForClass:error:filter:", v69, &v146, buf);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
      v72 = v70;
    else
      v72 = 0;
    v73 = v72;

    v29 = v146;
    if (!v73)
    {
      -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v29);
LABEL_71:

      goto LABEL_72;
    }
    v145 = 0;
    objc_msgSend(v138, "syncAnchorRangesIfRequiredForSession:startingAnchors:error:", v136, v73, &v145);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v145;
    v133 = v75;
    if (v74)
    {
      if (objc_msgSend(v74, "anchorRangeCount", v75))
      {
        v144 = v29;
        v76 = v140;
        v130 = v73;
        v131 = v76;
        objc_msgSend(v76, "shardPredicate");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "type") == 2;

        if (v78)
        {
          v132 = v131;
          v137 = v130;
          if (-[HDSyncAnchorMap anchorCount](v137, "anchorCount"))
          {
LABEL_39:
            _HKInitializeLogging();
            v100 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v132;
              *(_WORD *)&buf[22] = 2114;
              v161 = (const __CFString *)v70;
              _os_log_impl(&dword_1B7802000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@: Replace persisted anchors for store %{public}@ with (pushed-staging) %{public}@", buf, 0x20u);
            }
            -[HDCloudSyncSequenceRecord syncAnchorMap](self->_sequenceRecord, "syncAnchorMap");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[HDSyncAnchorMap replacePersistedAnchorMap:error:](v132, "replacePersistedAnchorMap:error:", v101, &v144))v102 = v70;
            else
              v102 = 0;
            v103 = v102;

LABEL_64:
LABEL_66:

            v121 = v144;
            if (v103)
            {
              -[HDCloudSyncOperation configuration](self, "configuration");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "repository");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "profile");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "database");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __77__HDCloudSyncPushSequenceOperation__setInitialForwardProgressDateIfNecessary__block_invoke;
              v161 = (const __CFString *)&unk_1E6CE80E8;
              *(_QWORD *)&v162 = self;
              objc_msgSend(v125, "performAsynchronouslySerial:", buf);

              objc_msgSend(v136, "setSequenceRecord:", self->_sequenceRecord);
              syncQueue = self->_syncQueue;
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __40__HDCloudSyncPushSequenceOperation_main__block_invoke;
              block[3] = &unk_1E6CE8080;
              block[4] = self;
              v143 = v136;
              dispatch_async(syncQueue, block);

            }
            else
            {
              -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v121);
            }

            v29 = v121;
            goto LABEL_70;
          }
          v79 = v132;
          v80 = objc_alloc_init(HDSyncAnchorMap);
          +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncOperation configuration](self, "configuration");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "accessibilityAssertion");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "contextWithAccessibilityAssertion:", v83);
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          -[HDCloudSyncOperation configuration](self, "configuration");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "repository");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "profile");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "database");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v157[0] = MEMORY[0x1E0C809B0];
          v157[1] = 3221225472;
          v157[2] = __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke;
          v157[3] = &unk_1E6CEB3F8;
          v157[4] = self;
          v88 = v79;
          v158 = v88;
          v70 = v80;
          v159 = v70;
          v127 = objc_msgSend(v87, "performTransactionWithContext:error:block:inaccessibilityHandler:", v129, &v144, v157, 0);

          v89 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          -[HDCloudSyncOperation profile](self, "profile");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "syncEngine");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "allSyncEntitiesByIdentifier");
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          v154[0] = MEMORY[0x1E0C809B0];
          v154[1] = 3221225472;
          v154[2] = __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_4;
          v154[3] = &unk_1E6CEB5C8;
          v92 = v88;
          v155 = v92;
          v93 = v89;
          v156 = v93;
          objc_msgSend(v128, "enumerateKeysAndObjectsUsingBlock:", v154);
          v152 = 0u;
          v153 = 0u;
          v150 = 0u;
          v151 = 0u;
          v94 = v93;
          v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v150, buf, 16);
          if (v95)
          {
            v96 = *(_QWORD *)v151;
            do
            {
              for (i = 0; i != v95; ++i)
              {
                if (*(_QWORD *)v151 != v96)
                  objc_enumerationMutation(v94);
                -[HDSyncAnchorMap setAnchor:forSyncEntityIdentifier:](v70, "setAnchor:forSyncEntityIdentifier:", 0, *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * i));
              }
              v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v150, buf, 16);
            }
            while (v95);
          }

          if (v127)
            v98 = v70;
          else
            v98 = 0;
          v99 = v98;

          if (v99)
          {
            -[HDCloudSyncSequenceRecord updateSyncAnchorMapWithSyncAnchorMap:](self->_sequenceRecord, "updateSyncAnchorMapWithSyncAnchorMap:", v99);
            goto LABEL_39;
          }
        }
        else
        {
          -[HDCloudSyncSequenceRecord frozenSyncAnchorMap](self->_sequenceRecord, "frozenSyncAnchorMap");
          v132 = (HDSyncAnchorMap *)objc_claimAutoreleasedReturnValue();
          if (!v132)
            v132 = objc_alloc_init(HDSyncAnchorMap);
          target = self->_target;
          v108 = self->_sequenceRecord;
          -[HDCloudSyncOperation configuration](self, "configuration");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDCloudSyncPushSequenceOperation unfrozenChangeRecordsForPushTarget:sequenceRecord:configuration:error:](HDCloudSyncPushSequenceOperation, "unfrozenChangeRecordsForPushTarget:sequenceRecord:configuration:error:", target, v108, v109, &v144);
          v137 = (HDSyncAnchorMap *)objc_claimAutoreleasedReturnValue();

          if (v137)
          {
            -[HDCloudSyncOperation profile](self, "profile");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "cloudSyncManager");
            v111 = objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend((id)v111, "isChild");

            -[HDCloudSyncOperation configuration](self, "configuration");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v111) = +[HDCloudSyncPushSequenceOperation shouldPerformRecentRecordRollingForUnfrozenRecords:configuration:](HDCloudSyncPushSequenceOperation, "shouldPerformRecentRecordRollingForUnfrozenRecords:configuration:", v137, v113);

            v114 = -[HDSyncAnchorMap count](v137, "count");
            v115 = (v112 ^ 1) & v111;
            v116 = v130;
            if (v115)
              v116 = v132;
            v70 = v116;
            if (v115 == 1)
            {
              -[HDCloudSyncSequenceRecord setFirstUnfrozenChangeRecord:](self->_sequenceRecord, "setFirstUnfrozenChangeRecord:", 0);
              -[HDSyncAnchorMap hk_map:](v137, "hk_map:", &__block_literal_global_25);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObjectsFromArray:](self->_recordsPendingDeletion, "addObjectsFromArray:", v117);
              -[HDCloudSyncSequenceRecord decrementChildRecordCount:](self->_sequenceRecord, "decrementChildRecordCount:", v114);
              -[HDCloudSyncSequenceRecord resetChangeIndex:](self->_sequenceRecord, "resetChangeIndex:", -[HDCloudSyncSequenceRecord changeIndex](self->_sequenceRecord, "changeIndex") - v114);
              -[HDCloudSyncSequenceRecord replaceSyncAnchorMapWithSyncAnchorMap:](self->_sequenceRecord, "replaceSyncAnchorMapWithSyncAnchorMap:", v132);
              self->_isPerformingRecentRecordRoll = 1;

            }
            _HKInitializeLogging();
            v118 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v119 = CFSTR("pushed");
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              if ((v115 & 1) != 0)
                v119 = CFSTR("frozen");
              *(_QWORD *)&buf[14] = v131;
              *(_WORD *)&buf[22] = 2114;
              v161 = v119;
              LOWORD(v162) = 2114;
              *(_QWORD *)((char *)&v162 + 2) = v70;
              _os_log_impl(&dword_1B7802000, v118, OS_LOG_TYPE_DEFAULT, "%{public}@: Replace persisted anchors for store %{public}@ with (%{public}@) %{public}@", buf, 0x2Au);
            }
            if (objc_msgSend(v131, "replacePersistedAnchorMap:error:", v70, &v144))
              v120 = v70;
            else
              v120 = 0;
            v103 = v120;
            goto LABEL_64;
          }
        }
        v103 = 0;
        goto LABEL_66;
      }
      v104 = v136;
      -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
      v105 = self->_syncQueue;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __67__HDCloudSyncPushSequenceOperation__synthesizeEmptySyncForSession___block_invoke;
      v161 = (const __CFString *)&unk_1E6CE8080;
      *(_QWORD *)&v162 = self;
      v106 = v104;
      *((_QWORD *)&v162 + 1) = v106;
      dispatch_async(v105, buf);

      -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
    }
    else
    {
      -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v75);
    }
LABEL_70:

    goto LABEL_71;
  }
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v15);
LABEL_73:

}

uint64_t __40__HDCloudSyncPushSequenceOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  HDSyncAnchorMap *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v30;
  void *v31;
  HDSyncAnchorMap *v32;
  id v33;
  id v34;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 128);
  v4 = *(id *)(a1 + 40);
  dispatch_assert_queue_V2(v3);
  objc_msgSend((id)v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v2 + 136), "beginTask");
  objc_msgSend((id)v2, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v10 = objc_msgSend(v7, "performSyncSession:accessibilityAssertion:error:", v4, v9, &v34);

  v11 = v34;
  if ((v10 & 1) != 0)
  {
    v31 = v7;
    v33 = v11;
    v12 = objc_alloc_init(HDSyncAnchorMap);
    objc_msgSend(*(id *)(v2 + 104), "store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "repository");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "legacyRepositoryProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v12;
    v18 = +[HDSyncAnchorEntity getSyncAnchorsOfType:anchorMap:store:profile:error:](HDSyncAnchorEntity, "getSyncAnchorsOfType:anchorMap:store:profile:error:", 0, v12, v13, v17, &v33);

    if (v18)
    {
      objc_msgSend((id)v2, "configuration");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "syncDate");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 104), "store");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "repository");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "profile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "legacyRepositoryProfile");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)v19;
      v26 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:type:updateDate:store:updatePolicy:resetInvalid:profile:error:](HDSyncAnchorEntity, "updateSyncAnchorsWithMap:type:updateDate:store:updatePolicy:resetInvalid:profile:error:", v32, 3, v19, v20, 2, 0, v24, &v33);

    }
    else
    {
      v26 = 0;
    }

    v27 = v33;
    v28 = *(void **)(v2 + 136);
    v7 = v31;
    if (v26)
      objc_msgSend(v28, "finishTask");
    else
      objc_msgSend(v28, "failTaskWithError:", v27);
    v11 = v27;
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 136), "failTaskWithError:", v11);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "finishTask");
}

uint64_t __66__HDCloudSyncPushSequenceOperation__anchorsInCloudForStore_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "sequenceRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(v3, "decodedSyncAnchorRangeMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__HDCloudSyncPushSequenceOperation__anchorsInCloudForStore_error___block_invoke_2;
    v9[3] = &unk_1E6CEB4E8;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v9);

  }
  return 0;
}

void __66__HDCloudSyncPushSequenceOperation__anchorsInCloudForStore_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;

  v6 = a2;
  if (a4 > objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:"))
    objc_msgSend(*(id *)(a1 + 32), "setAnchor:forSyncEntityIdentifier:", a4, v6);

}

uint64_t __92__HDCloudSyncPushSequenceOperation__prepareLocalSyncAnchorMapForStore_anchorsInCloud_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

uint64_t __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v4 = a1;
  v46 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushTargets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    v33 = *(_QWORD *)v42;
    v34 = v4;
    while (2)
    {
      v11 = 0;
      v35 = v9;
      do
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        objc_msgSend(v12, "store");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "storeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v4 + 40), "storeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if ((v16 & 1) == 0)
        {
          objc_msgSend(v12, "storeRecord");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(*(id *)(v4 + 32), "configuration");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "cachedCloudState");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "recordID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v4 + 32), "configuration");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "repository");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "primaryCKContainer");
            v23 = a3;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "containerIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "zoneForRecordID:containerIdentifier:error:", v20, v25, v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            a3 = v23;
            v27 = v18;

            v4 = v34;
            if (!v26)
              goto LABEL_14;
            v28 = objc_opt_class();
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_2;
            v38[3] = &unk_1E6CEB5A0;
            v29 = v18;
            v39 = v29;
            v40 = *(id *)(v34 + 48);
            objc_msgSend(v26, "recordsForClass:error:filter:", v28, v23, v38);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
            {
LABEL_14:

              v31 = 0;
              goto LABEL_15;
            }

            v10 = v33;
            v9 = v35;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v9)
        continue;
      break;
    }
  }
  v31 = 1;
LABEL_15:

  return v31;
}

uint64_t __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(v3, "syncAnchorMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_3;
    v9[3] = &unk_1E6CEB578;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "enumerateAnchorsAndEntityIdentifiersWithBlock:", v9);

  }
  return 0;
}

void __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:") < a3)
    objc_msgSend(*(id *)(a1 + 32), "setAnchor:forSyncEntityIdentifier:", a3, v5);

}

void __80__HDCloudSyncPushSequenceOperation__startingSyncAnchorMapForStagingStore_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "syncEntityDependenciesForSyncProtocolVersion:", objc_msgSend(*(id *)(a1 + 32), "protocolVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "syncEntityIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

uint64_t __67__HDCloudSyncPushSequenceOperation__synthesizeEmptySyncForSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Synthesizing empty sync (no anchors require push).", (uint8_t *)&v5, 0xCu);
  }
  -[HDCloudSyncPushSequenceOperation _finalizePushForSession:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "finishTask");
}

- (void)_finalizePushForSession:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  char v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 144), "archiveCreator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "archiveIsValid");

    if (v5)
    {
      v12 = 0;
      v6 = -[HDCloudSyncPushSequenceOperation _lock_finalizeNextChangeRecordForUploadToSession:shouldFreeze:error:](a1, v3, 0, &v12);
      v7 = v12;
      v8 = v7;
      if ((v6 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 144), "finishProgress");
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
        goto LABEL_7;
      }

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 136), "beginTask");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__HDCloudSyncPushSequenceOperation__finalizePushForSession___block_invoke;
    v9[3] = &unk_1E6CEB718;
    v10 = v3;
    v11 = a1;
    -[HDCloudSyncPushSequenceOperation _uploadChangesForSyncSession:isFinalUpload:completion:](a1, v10, 1, v9);
    v8 = v10;
LABEL_7:

  }
}

id __62__HDCloudSyncPushSequenceOperation__excludedSyncStoresForPush__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  v3 = a2;
  if (objc_msgSend(v3, "purpose"))
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "container");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedOwnerIdentifierForContainer:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "storeRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pendingOwner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v11 & 1) != 0
      || (objc_msgSend(v3, "storeRecord"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "pendingSyncIdentity"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 40)),
          v13,
          v12,
          (v14 & 1) != 0))
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v3, "store");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __76__HDCloudSyncPushSequenceOperation__excludedSyncIdentitiesForPushWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HDKeyValueDomain *v31;
  void *v32;
  HDKeyValueDomain *v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  BOOL v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  _BOOL8 v68;
  id v70;
  id v71;
  _QWORD *v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  _QWORD v78[4];
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v75 = v5;
  v72 = a3;
  if (v6)
  {
    v7 = v5;
    objc_msgSend(v6, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncIdentityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v84 = 0;
    objc_msgSend(v9, "childIdentitiesForCurrentSyncIdentityWithTransaction:error:", v7, &v84);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (id)v84;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v89 = v6;
        v90 = 2114;
        v91 = v11;
        _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get child sync identities from local storage: %{public}@", buf, 0x16u);
      }
      v14 = v11;
      if (v14)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v14);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    v10 = 0;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "computedState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "targets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __76__HDCloudSyncPushSequenceOperation__excludedSyncIdentitiesForPushWithError___block_invoke_2;
  v78[3] = &unk_1E6CEB618;
  v19 = v10;
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(a1 + 40);
  v74 = v19;
  v79 = v19;
  v80 = v20;
  v81 = v21;
  v22 = v15;
  v82 = v22;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v78);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "storeRecord");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sequenceRecord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "includedSyncIdentities");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v22;
  objc_msgSend(v22, "minusSet:", v25);

  v73 = a1;
  v26 = *(void **)(a1 + 32);
  if (!v26)
  {
    v64 = 0;
    v39 = v75;
    goto LABEL_53;
  }
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "syncIdentityManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "legacySyncIdentity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = [HDKeyValueDomain alloc];
  objc_msgSend(v26, "profile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v31, "initWithCategory:domainName:profile:", 0, CFSTR("CloudSync"), v32);

  v34 = *MEMORY[0x1E0CB7618];
  *(_QWORD *)&v84 = 0;
  -[HDKeyValueDomain numberForKey:error:](v33, "numberForKey:error:", v34, &v84);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)v84;
  if (v35 && objc_msgSend(v35, "BOOLValue"))
  {
    objc_msgSend(v76, "removeObject:", v30);
    _HKInitializeLogging();
    v37 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v89 = v26;
      _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Not excluding legacySyncIdentity because device is paired to old watch", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if (!v36)
  {
LABEL_21:
    objc_msgSend(v26, "profile");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "daemon");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "behavior");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isAppleWatch");

    if (v45)
      objc_msgSend(v76, "addObject:", v30);
    v40 = 0;
    v41 = 1;
    v39 = v75;
    goto LABEL_24;
  }
  _HKInitializeLogging();
  v38 = *MEMORY[0x1E0CB5370];
  v39 = v75;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v89 = v26;
    v90 = 2114;
    v91 = v36;
    _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Unable to read if device HasEverBeenPairedToOldWatch: %{public}@", buf, 0x16u);
  }
  v40 = objc_retainAutorelease(v36);
  v41 = 0;
LABEL_24:

  v46 = v40;
  if ((v41 & 1) == 0)
  {
    v63 = v46;
    v64 = v63;
    if (v63)
    {
      v65 = v74;
      if (v72)
      {
        v64 = objc_retainAutorelease(v63);
        *v72 = v64;
      }
      else
      {
        _HKLogDroppedError();
      }
      goto LABEL_54;
    }
LABEL_53:
    v65 = v74;
LABEL_54:

    v68 = 0;
    goto LABEL_55;
  }
  v71 = v46;
  v47 = *(void **)(v73 + 32);
  v48 = v76;
  v49 = v39;
  if (v47)
  {
    v77 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v70 = v48;
    v50 = v48;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v85;
      while (2)
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v85 != v53)
            objc_enumerationMutation(v50);
          v55 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
          objc_msgSend(v47, "profile");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "syncIdentityManager");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = 0;
          objc_msgSend(v57, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v55, 0, v49, &v83);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v83;

          if (v58)
            v60 = 1;
          else
            v60 = v59 == 0;
          if (!v60)
          {
            if (v72)
              *v72 = objc_retainAutorelease(v59);
            else
              _HKLogDroppedError();
            v48 = v70;

            v62 = 0;
            v61 = v77;
            goto LABEL_49;
          }
          if (v58)
            objc_msgSend(v77, "addObject:", v58);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
        if (v52)
          continue;
        break;
      }
    }

    v61 = v77;
    v62 = v77;
    v48 = v70;
LABEL_49:

  }
  else
  {
    v62 = 0;
  }
  v39 = v75;
  v64 = v71;

  v66 = *(_QWORD *)(*(_QWORD *)(v73 + 48) + 8);
  v67 = *(void **)(v66 + 40);
  *(_QWORD *)(v66 + 40) = v62;

  v68 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v73 + 48) + 8) + 40) != 0;
  v65 = v74;
LABEL_55:

  return v68;
}

void __76__HDCloudSyncPushSequenceOperation__excludedSyncIdentitiesForPushWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
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
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "purpose"))
    goto LABEL_14;
  objc_msgSend(v3, "storeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncIdentity");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_7;
  }
  v6 = (void *)v5;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "storeRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v9);

  if (!(_DWORD)v7)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "repository");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "container");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cachedOwnerIdentifierForContainer:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "storeRecord");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pendingOwner");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "string");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    if ((v21 & 1) == 0)
    {
      objc_msgSend(v3, "storeRecord");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pendingSyncIdentity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqual:", *(_QWORD *)(a1 + 48));

      if ((v24 & 1) == 0)
      {
        objc_msgSend(v3, "storeRecord");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "syncIdentity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = *(void **)(a1 + 56);
          objc_msgSend(v3, "storeRecord");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "syncIdentity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v29);

        }
        objc_msgSend(v3, "storeRecord");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sequenceRecord");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "includedSyncIdentities");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v33 = *(void **)(a1 + 56);
          objc_msgSend(v3, "storeRecord");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "sequenceRecord");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "includedSyncIdentities");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "unionSet:", v36);

        }
      }
    }
    goto LABEL_13;
  }
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = v10;
    objc_msgSend(v3, "storeRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543618;
    v38 = v11;
    v39 = 2114;
    v40 = v14;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Not excluding my child %{public}@ from push.", (uint8_t *)&v37, 0x16u);

LABEL_13:
  }
LABEL_14:

}

uint64_t __69__HDCloudSyncPushSequenceOperation__validateArchiveFileHandle_error___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (uint64_t)_lock_finalizeNextChangeRecordForUploadToSession:(int)a3 shouldFreeze:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  HDCloudSyncChangeRecord *v23;
  void *v24;
  HDCloudSyncChangeRecord *v25;
  BOOL v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v60;
  void *v61;
  HDCloudSyncChangeRecord *v62;
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 144), "pendingAnchorRangeMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "anchorRangeCount");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 144), "archiveCreator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "archiveIsValid");

      if ((v11 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 144), "pendingAnchorRangeMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDSyncAnchorMap syncAnchorMapWithSyncAnchorRangeMap:](HDSyncAnchorMap, "syncAnchorMapWithSyncAnchorRangeMap:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 144), "archiveCreator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "closeArchive");

        objc_msgSend(v7, "sequenceRecord");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 718, CFSTR("No sequence record for current session."));
          a1 = 0;
LABEL_54:

          goto LABEL_55;
        }
        objc_msgSend(v15, "incrementChangeIndex");
        objc_msgSend(v16, "updateSyncAnchorMapWithSyncAnchorMap:", v13);
        objc_msgSend(*(id *)(a1 + 144), "archiveCreator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fileHandle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v18;
        if ((objc_msgSend(v19, "seekToOffset:error:", 0, a4) & 1) != 0)
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB7080]), "initWithFileHandle:", v19);
          v67 = 0;
          v68 = &v67;
          v69 = 0x2020000000;
          v70 = 0;
          v65[4] = &v67;
          v66 = 0;
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __69__HDCloudSyncPushSequenceOperation__validateArchiveFileHandle_error___block_invoke;
          v65[3] = &unk_1E6CEB668;
          v21 = objc_msgSend(v20, "enumerateEntriesWithError:block:", &v66, v65);
          v22 = v66;
          if ((v21 & 1) != 0)
          {

            _Block_object_dispose(&v67, 8);
            v23 = [HDCloudSyncChangeRecord alloc];
            objc_msgSend(*(id *)(a1 + 144), "pendingAnchorRangeMap");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[HDCloudSyncChangeRecord initWithSyncAnchorRangeMap:finalForSequence:changesetArchiveFileHandle:sequenceRecord:protocolVersion:](v23, "initWithSyncAnchorRangeMap:finalForSequence:changesetArchiveFileHandle:sequenceRecord:protocolVersion:", v24, objc_msgSend(*(id *)(a1 + 144), "hasOpenSequence") ^ 1, v19, v16, 16);

            v64 = 0;
            v62 = v25;
            v26 = -[HDCloudSyncRecord validateWithError:](v25, "validateWithError:", &v64);
            v27 = v64;
            v28 = v27;
            if (v26)
            {

              v65[0] = 0;
              v63 = 0;
              v29 = objc_msgSend(v19, "seekToEndReturningOffset:error:", v65, &v63);
              v30 = v63;
              if ((v29 & 1) != 0)
              {
                v31 = v65[0];
                -[HDCloudSyncChangeRecord changeSize](v62, "changeSize");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v31) = v31 == objc_msgSend(v32, "unsignedLongLongValue");

                if ((v31 & 1) != 0)
                {
                  if (a3 && *(_BYTE *)(a1 + 168))
                  {
                    _HKInitializeLogging();
                    v33 = *MEMORY[0x1E0CB5370];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v72 = a1;
                      v73 = 2114;
                      v74 = (unint64_t)v13;
                      _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Update sequence record's frozen sync anchors with %{public}@", buf, 0x16u);
                    }
                    objc_msgSend(v16, "updateFrozenSyncAnchorMapWithSyncAnchorMap:", v13);
                    objc_msgSend(v16, "setFirstUnfrozenChangeRecord:", 0);
                  }
                  else
                  {
                    objc_msgSend(v16, "firstUnfrozenChangeRecord");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = v45 == 0;

                    if (v46)
                    {
                      -[HDCloudSyncRecord record](v62, "record");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "recordID");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "setFirstUnfrozenChangeRecord:", v48);

                    }
                  }
                  v49 = objc_msgSend(*(id *)(a1 + 144), "archiveSize");
                  _HKInitializeLogging();
                  v50 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                  {
                    v51 = *(void **)(a1 + 144);
                    v52 = v50;
                    objc_msgSend(v51, "pendingAnchorRangeMap");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v72 = a1;
                    v73 = 2048;
                    v74 = v49;
                    v75 = 2114;
                    v76 = v53;
                    _os_log_impl(&dword_1B7802000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@: Finalized change record for push: assetSize: (%llu), anchorRangeMap: %{public}@", buf, 0x20u);

                  }
                  if (v49 > 0x100000)
                  {
                    objc_msgSend((id)a1, "configuration");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "operationGroup");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "setExpectedSendSize:", 2);

                  }
                  objc_msgSend(*(id *)(a1 + 152), "addObject:", v62);
                  a1 = 1;
                  goto LABEL_52;
                }
                _HKInitializeLogging();
                v42 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
                {
                  v60 = v42;
                  -[HDCloudSyncChangeRecord changeSize](v62, "changeSize");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v72 = a1;
                  v73 = 2114;
                  v74 = (unint64_t)v61;
                  v75 = 2048;
                  v76 = (void *)v65[0];
                  _os_log_fault_impl(&dword_1B7802000, v60, OS_LOG_TYPE_FAULT, "%{public}@: Change size %{public}@ does not match computed file size: %llu", buf, 0x20u);

                }
                v43 = (void *)MEMORY[0x1E0CB35C8];
                -[HDCloudSyncChangeRecord changeSize](v62, "changeSize");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "hk_assignError:code:format:", a4, 709, CFSTR("Change size %@ does not match computed file size: %llu"), v44, v65[0]);

              }
              else
              {
                _HKInitializeLogging();
                v38 = *MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v72 = a1;
                  v73 = 2114;
                  v74 = (unint64_t)v30;
                  _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Failed to compute archive file size: %{public}@", buf, 0x16u);
                }
                v39 = v30;
                v40 = v39;
                if (v39)
                {
                  if (a4)
                    *a4 = objc_retainAutorelease(v39);
                  else
                    _HKLogDroppedError();
                }

              }
            }
            else
            {
              _HKInitializeLogging();
              v36 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543618;
                v72 = a1;
                v73 = 2114;
                v74 = (unint64_t)v28;
                _os_log_fault_impl(&dword_1B7802000, v36, OS_LOG_TYPE_FAULT, "%{public}@: Failed to validate store record after creation: %{public}@", buf, 0x16u);
              }
              v37 = v28;
              v30 = v37;
              if (v37)
              {
                if (a4)
                  *a4 = objc_retainAutorelease(v37);
                else
                  _HKLogDroppedError();
              }

            }
            a1 = 0;
LABEL_52:

            goto LABEL_53;
          }
          v34 = v22;
          v35 = v34;
          if (v34)
          {
            if (a4)
              *a4 = objc_retainAutorelease(v34);
            else
              _HKLogDroppedError();
          }

          _HKInitializeLogging();
          v41 = (id)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 144), "archiveURL");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "path");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)v68[3];
            *(_DWORD *)buf = 138544130;
            v72 = a1;
            v73 = 2114;
            v74 = (unint64_t)v57;
            v75 = 2048;
            v76 = v58;
            v77 = 2114;
            v78 = v35;
            _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Failed to validate change record archive %{public}@ (enumerated %lld entries): %{public}@", buf, 0x2Au);

          }
          _Block_object_dispose(&v67, 8);

        }
        else
        {

        }
        a1 = 0;
LABEL_53:

        goto LABEL_54;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 717, CFSTR("Unable to create change record with invalid archive."));
      a1 = 0;
    }
    else
    {
      a1 = 1;
    }
  }
LABEL_55:

  return a1;
}

- (void)_uploadChangesForSyncSession:(int)a3 isFinalUpload:(void *)a4 completion:
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  os_log_t *v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void (**v58)(id, _QWORD, void *);
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  HDCloudSyncModifyRecordsOperation *v64;
  void *v65;
  HDCloudSyncModifyRecordsOperation *v66;
  uint64_t v67;
  void (**v68)(id, _QWORD, void *);
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void (**v75)(id, _QWORD, void *);
  void *v76;
  void *v77;
  _QWORD v78[5];
  void (**v79)(id, _QWORD, void *);
  _BYTE buf[24];
  void *v81;
  __int128 v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a1)
  {
    objc_msgSend(a2, "sequenceRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 718, CFSTR("No sequence record for current session."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v17);
LABEL_31:

      goto LABEL_32;
    }
    v75 = v7;
    objc_msgSend(*(id *)(a1 + 104), "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shardPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 104), "storeRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShardPredicate:", v10);

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 152), "hk_map:", &__block_literal_global_232);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 152), "removeAllObjects");
    v77 = (void *)objc_msgSend(*(id *)(a1 + 160), "copy");
    v14 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;

    v76 = (void *)v13;
    if (!a3)
    {
      v18 = 0;
LABEL_12:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
      objc_msgSend(*(id *)(a1 + 104), "storeRecord");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "record");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "modificationDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "syncDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v27);
      v29 = v28;

      if ((v18 & 1) != 0 || v29 < -1209600.0 || objc_msgSend(v77, "count") || objc_msgSend(v76, "count"))
      {
        _HKInitializeLogging();
        v30 = (os_log_t *)MEMORY[0x1E0CB5370];
        v31 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v32 = "interim";
          if (a3)
            v32 = "FINAL";
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v32;
          _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Uploading %{public}s changeset record to CloudKit", buf, 0x16u);
        }
        objc_msgSend((id)a1, "configuration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "repository");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "behavior");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "currentDeviceProductType");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 104), "storeRecord");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setProductType:", v36);

        objc_msgSend(v35, "currentOSBuild");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 104), "storeRecord");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setSystemBuildVersion:", v38);

        objc_msgSend(v35, "currentDeviceDisplayName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 104), "storeRecord");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setDeviceName:", v40);

        objc_msgSend(*(id *)(a1 + 104), "storeRecord");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setSupportedProtocolVersion:", 0);

        objc_msgSend(*(id *)(a1 + 104), "storeRecord");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setRequiredProtocolVersion:", 0);

        objc_msgSend((id)a1, "configuration");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "repository");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "deviceMode");
        objc_msgSend(*(id *)(a1 + 104), "storeRecord");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setDeviceMode:", v46);

        objc_msgSend(*(id *)(a1 + 104), "storeRecord");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "record");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "addObject:", v49);

        v74 = v8;
        objc_msgSend(v8, "record");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "addObject:", v50);

        v51 = *(void **)(a1 + 176);
        if (v51)
        {
          objc_msgSend(v51, "recordsToSave");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "addObjectsFromArray:", v52);

          v53 = *(void **)(a1 + 176);
          *(_QWORD *)(a1 + 176) = 0;

        }
        objc_msgSend((id)a1, "configuration");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "repository");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "primaryCKContainer");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "containerIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v76;
        v56 = v77;
        v57 = v54;
        v58 = v7;
        objc_msgSend((id)a1, "configuration");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "repository");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "containerForContainerIdentifier:", v57);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
        {
          objc_msgSend(v55, "hk_map:", &__block_literal_global_238);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          v63 = *v30;
          if (os_log_type_enabled(*v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v62;
            *(_WORD *)&buf[22] = 2114;
            v81 = v56;
            LOWORD(v82) = 2114;
            *(_QWORD *)((char *)&v82 + 2) = v61;
            _os_log_impl(&dword_1B7802000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@: save:%{public}@, delete:%{public}@ container:%{public}@", buf, 0x2Au);
          }
          v64 = [HDCloudSyncModifyRecordsOperation alloc];
          objc_msgSend((id)a1, "configuration");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v64, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v65, v61, v55, v56);

          v67 = MEMORY[0x1E0C809B0];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke_240;
          v81 = &unk_1E6CE8F80;
          *(_QWORD *)&v82 = a1;
          v68 = v58;
          *((_QWORD *)&v82 + 1) = v68;
          -[HDCloudSyncOperation setOnError:](v66, "setOnError:", buf);
          v78[0] = v67;
          v78[1] = 3221225472;
          v78[2] = __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke_242;
          v78[3] = &unk_1E6CEB6F0;
          v78[4] = a1;
          v79 = v68;
          -[HDCloudSyncOperation setOnSuccess:](v66, "setOnSuccess:", v78);
          -[HDCloudSyncOperation start](v66, "start");

          v7 = v75;
        }
        else
        {
          _HKInitializeLogging();
          v69 = *v30;
          if (os_log_type_enabled(*v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v57;
            _os_log_error_impl(&dword_1B7802000, v69, OS_LOG_TYPE_ERROR, "%{public}@: Container not found for container ID: %{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 723, CFSTR("Invalid container ID %@"), v57);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v58[2](v58, 0, v62);
        }

        v8 = v74;
      }
      else
      {
        _HKInitializeLogging();
        v70 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = a1;
          _os_log_impl(&dword_1B7802000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@: No upload required at the present time; skipping record save.",
            buf,
            0xCu);
        }
        *(_BYTE *)(a1 + 184) = 1;
        v7[2](v7, 1, 0);
      }
      v17 = v76;

      goto LABEL_31;
    }
    objc_msgSend(*(id *)(a1 + 104), "storeRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pendingOwner");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 104), "storeRecord");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pendingSyncIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v18 = 0;
LABEL_10:
        if ((objc_msgSend(v8, "isActive") & 1) == 0)
        {
          v18 = 1;
          objc_msgSend(v8, "setActive:", 1);
        }
        goto LABEL_12;
      }
    }
    objc_msgSend(*(id *)(a1 + 104), "storeRecord");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPendingOwner:", 0);

    objc_msgSend(*(id *)(a1 + 104), "storeRecord");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPendingSyncIdentity:", 0);

    v18 = 1;
    goto LABEL_10;
  }
LABEL_32:

}

uint64_t __90__HDCloudSyncPushSequenceOperation__uploadChangesForSyncSession_isFinalUpload_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "record");
}

uint64_t __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

void __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke_240(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to upload changes: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __90__HDCloudSyncPushSequenceOperation__pushRecords_recordIDsToDelete_containerID_completion___block_invoke_242(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  __int128 buf;
  void (*v25)(uint64_t);
  void *v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully uploaded changes", (uint8_t *)&buf, 0xCu);
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v25 = __62__HDCloudSyncPushSequenceOperation__recordForwardProgressDate__block_invoke;
  v26 = &unk_1E6CE80E8;
  v27 = v4;
  objc_msgSend(v8, "performAsynchronouslySerial:", &buf);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 184) = 1;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v9 + 169))
    goto LABEL_16;
  objc_msgSend(*(id *)(v9 + 104), "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  objc_msgSend(v10, "persistedStateWithError:", &buf);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)buf;

  if (v11)
  {
    objc_msgSend(v11, "stateByResettingRebaselineDeadline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v9 + 104), "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    v15 = objc_msgSend(v14, "persistState:error:", v13, &v23);
    v16 = v23;

    if ((v15 & 1) != 0)
    {
      v17 = 0;
      v18 = 1;
      goto LABEL_14;
    }
    v19 = v16;
    if (!v19)
    {
      v17 = 0;
      v18 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    v19 = v12;
    v17 = 0;
    if (!v19)
    {
      v18 = 1;
      v13 = 0;
      goto LABEL_13;
    }
    v13 = 0;
  }
  v17 = objc_retainAutorelease(v19);
  v18 = 0;
LABEL_13:

  v16 = v17;
LABEL_14:

  v20 = v17;
  v21 = v20;
  v22 = *(_QWORD *)(a1 + 32);
  if (v18)
  {
    *(_BYTE *)(v22 + 169) = 0;

    v9 = *(_QWORD *)(a1 + 32);
LABEL_16:
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 120));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 120));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__HDCloudSyncPushSequenceOperation__finalizePushForSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  os_log_t *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "syncStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v6, "persistedStateWithError:", &v32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v32;

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "syncDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stateByRecordingLastSyncDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "lastCheckDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v11, "stateByRecordingLastCheckDate:", v10);
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
      _HKInitializeLogging();
      v14 = (os_log_t *)MEMORY[0x1E0CB5370];
      v15 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(void **)(a1 + 32);
        v17 = *(_QWORD *)(a1 + 40);
        v18 = v15;
        objc_msgSend(v16, "syncStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastSyncDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v17;
        v35 = 2114;
        v36 = v19;
        v37 = 2114;
        v38 = v20;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Update persisted state for %{public}@ with successful sync date %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "syncStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v8;
      v22 = objc_msgSend(v21, "persistState:error:", v11, &v31);
      v23 = v31;

      if ((v22 & 1) == 0)
      {
        _HKInitializeLogging();
        v24 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          v30 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v34 = v30;
          v35 = 2114;
          v36 = v23;
          _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record sync completion date: %{public}@", buf, 0x16u);
        }
      }

    }
    else
    {
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v29 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v34 = v29;
        v35 = 2114;
        v36 = v8;
        _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve persisted sync store state for recording completion date: %{public}@", buf, 0x16u);
      }
      v23 = v8;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "finishTask");

  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v28 = *(void **)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      v35 = 2114;
      v36 = v28;
      v37 = 2114;
      v38 = v5;
      _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Sync session %{public}@ failed during upload: %{public}@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "failTaskWithError:", v5);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "finishProgress");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 120));

}

void __77__HDCloudSyncPushSequenceOperation__setInitialForwardProgressDateIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacyRepositoryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncKeyValueDomainWithProfile(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(v6, "dateForKey:error:", CFSTR("HDCloudSyncPrimaryLastPushForwardProgressDate"), &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (v10)
  {
    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "syncDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      v13 = objc_msgSend(v6, "setDate:forKey:error:", v12, CFSTR("HDCloudSyncPrimaryLastPushForwardProgressDate"), &v18);
      v14 = v18;

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v21 = CFSTR("HDCloudSyncPrimaryLastPushForwardProgressDate");
          v22 = 2114;
          v23 = v14;
          _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Failed to update %{public}@: %{public}@.", buf, 0x16u);
        }
      }
      v9 = v14;
    }
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = CFSTR("HDCloudSyncPrimaryLastPushForwardProgressDate");
      v22 = 2114;
      v23 = v9;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Unable to determine value for %{public}@: %{public}@.", buf, 0x16u);
    }
  }

}

void __62__HDCloudSyncPushSequenceOperation__recordForwardProgressDate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profile");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "legacyRepositoryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncKeyValueDomainWithProfile(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  LOBYTE(v4) = objc_msgSend(v6, "setDate:forKey:error:", v8, CFSTR("HDCloudSyncPrimaryLastPushForwardProgressDate"), &v11);
  v9 = v11;

  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to record push operation forward progress: %{public}@.", buf, 0xCu);
    }
  }

}

uint64_t __85__HDCloudSyncPushSequenceOperation__canPerformProtectedDatabaseTransactionWithError___block_invoke()
{
  return 1;
}

+ (BOOL)shouldPerformRecentRecordRollingForUnfrozenRecords:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "changeSize");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v9 += objc_msgSend(v12, "longLongValue");

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    v14 = objc_msgSend(v5, "count");
    objc_msgSend(v6, "repository");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cloudSyncManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "bytesPerChangeRecordAssetThreshold");

    v13 = v14 > 21 || v9 > v18 || v14 == 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)unfrozenChangeRecordsForPushTarget:(id)a3 sequenceRecord:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  HDSyncAnchorMap *v12;
  HDCloudSyncCachedZone *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  HDSyncAnchorMap *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  HDSyncAnchorMap *v25;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "frozenSyncAnchorMap");
  v12 = (HDSyncAnchorMap *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = objc_alloc_init(HDSyncAnchorMap);
  v13 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(v11, "zoneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "repository");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityAssertion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v13, "initForZoneIdentifier:repository:accessibilityAssertion:", v14, v15, v16);
  v18 = objc_opt_class();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__HDCloudSyncPushSequenceOperation_unfrozenChangeRecordsForPushTarget_sequenceRecord_configuration_error___block_invoke;
  v23[3] = &unk_1E6CEB510;
  v24 = v9;
  v25 = v12;
  v19 = v12;
  v20 = v9;
  objc_msgSend(v17, "recordsForClass:error:filter:", v18, a6, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

BOOL __106__HDCloudSyncPushSequenceOperation_unfrozenChangeRecordsForPushTarget_sequenceRecord_configuration_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a2;
  objc_msgSend(v3, "sequenceRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend(v3, "decodedSyncAnchorRangeMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __106__HDCloudSyncPushSequenceOperation_unfrozenChangeRecordsForPushTarget_sequenceRecord_configuration_error___block_invoke_2;
    v10[3] = &unk_1E6CEB760;
    v11 = *(id *)(a1 + 40);
    v12 = &v13;
    objc_msgSend(v7, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v10);

    v8 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __106__HDCloudSyncPushSequenceOperation_unfrozenChangeRecordsForPushTarget_sequenceRecord_configuration_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:", a2);
  if (a4 > result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)syncSessionWillBegin:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  os_log_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  HDCloudSyncPushSequenceOperation *v12;
  int v13;
  HDCloudSyncPushSequenceOperation *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x1E0CB5370];
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning sync session: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  _HKInitializeLogging();
  v7 = *v5;
  if (os_signpost_enabled(*v5))
  {
    v8 = v7;
    v9 = os_signpost_id_make_with_pointer(*v5, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        -[HDCloudSyncOperation configuration](self, "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "descriptionForSignpost");
        v12 = (HDCloudSyncPushSequenceOperation *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "cloud-sync-push-session", "%{public}@", (uint8_t *)&v13, 0xCu);

      }
    }

  }
}

- (void)syncSession:(id)a3 willSyncAnchorRanges:(id)a4
{
  HDCloudSyncSessionContext *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HDCloudSyncSessionContext *v11;
  HDCloudSyncSessionContext *sessionContext;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (!self->_sessionContext)
  {
    v5 = [HDCloudSyncSessionContext alloc];
    v6 = objc_msgSend(v16, "anchorRangeCount");
    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "repository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "legacyRepositoryProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HDCloudSyncSessionContext initWithChangedSyncEntityCount:profile:](v5, "initWithChangedSyncEntityCount:profile:", v6, v10);
    sessionContext = self->_sessionContext;
    self->_sessionContext = v11;

    -[HDCloudSyncOperation progress](self, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncSessionContext progress](self->_sessionContext, "progress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation progress](self, "progress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, objc_msgSend(v15, "totalUnitCount"));

  }
}

- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  HDCloudSyncSessionContext *sessionContext;
  void *v24;
  id v25;
  BOOL v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  BOOL v44;
  NSObject *v45;
  char v46;
  NSObject *v47;
  NSObject *v48;
  char v49;
  void *v50;
  HDCloudSyncSessionContext *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void (**v55)(id, _QWORD, void *);
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  HDCloudSyncPushSequenceOperation *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  unint64_t v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncPushSequenceOperation.m"), 1058, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[session isKindOfClass:[HDCloudSyncSession class]]"));

  }
  -[HDCloudSyncOperation configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "xpcActivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "shouldDefer");

  if (v15)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = self;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Operation deferral requested.", buf, 0xCu);
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "xpcActivity");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_error:format:", 708, CFSTR("Canceling sync, xpc activity %@ indicated deferral."), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v21);

    goto LABEL_33;
  }
  objc_msgSend(v10, "hk_mapToSet:", &__block_literal_global_253);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  sessionContext = self->_sessionContext;
  v61 = v9;
  objc_msgSend(v9, "sessionUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v25 = v10;
  v26 = -[HDCloudSyncSessionContext resetInvalidArchiveCreatorWithSessionUUID:error:](sessionContext, "resetInvalidArchiveCreatorWithSessionUUID:error:", v24, &v64);
  v20 = v64;

  v27 = -[HDCloudSyncSessionContext archiveSize](self->_sessionContext, "archiveSize");
  os_unfair_lock_unlock(&self->_lock);
  if (v26)
  {
    v55 = v11;
    v58 = v18;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    v59 = v25;
    objc_msgSend(v28, "encodeObject:forKey:", v25, CFSTR("changes"));
    v56 = v28;
    objc_msgSend(v28, "encodedData");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v60, "length") + v27;
    _HKInitializeLogging();
    v30 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = objc_msgSend(v60, "length");
      *(_DWORD *)buf = 138544386;
      v66 = self;
      v67 = 2112;
      v68 = v19;
      v69 = 2048;
      v70 = v29;
      v71 = 2048;
      v72 = v27;
      v73 = 2048;
      v74 = v32;
      _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Archiving changes for (%@): total: (%llu), assetSize: (%llu), data.length: (%lu)", buf, 0x34u);

    }
    v57 = v19;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "repository");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "profile");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "cloudSyncManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "bytesPerChangeRecordAssetThresholdHardLimit");

    -[HDCloudSyncOperation configuration](self, "configuration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "repository");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "profile");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "cloudSyncManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "bytesPerChangeRecordAssetThreshold");

    v43 = v29;
    v44 = v29 >= v37;
    v9 = v61;
    if (v44)
    {
      _HKInitializeLogging();
      v48 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v66 = self;
        v67 = 2114;
        v68 = v61;
        v69 = 2048;
        v70 = v43;
        v71 = 2048;
        v72 = v37;
        _os_log_impl(&dword_1B7802000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Estimated asset data size (%llu) is over threshold hard limit (%ld), and needs to be uploaded", buf, 0x2Au);
      }

      os_unfair_lock_lock(&self->_lock);
      v63 = 0;
      v49 = -[HDCloudSyncPushSequenceOperation _lock_finalizeNextChangeRecordForUploadToSession:shouldFreeze:error:]((uint64_t)self, v61, 1, &v63);
      v20 = v63;
      os_unfair_lock_unlock(&self->_lock);
      if ((v49 & 1) == 0)
      {
        v11 = v55;
        v55[2](v55, 0, v20);
        v10 = v59;
        goto LABEL_31;
      }
    }
    else if (v43 >= v42)
    {
      _HKInitializeLogging();
      v45 = *MEMORY[0x1E0CB5370];
      v11 = v55;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v66 = self;
        v67 = 2114;
        v68 = v61;
        v69 = 2048;
        v70 = v43;
        v71 = 2048;
        v72 = v42;
        _os_log_impl(&dword_1B7802000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Estimated asset data size (%llu) is over threshold (%ld), and needs to be uploaded", buf, 0x2Au);
      }
      v46 = 1;
      v10 = v59;
      goto LABEL_22;
    }
    v46 = 0;
    v10 = v59;
    v11 = v55;
LABEL_22:
    v50 = v20;
    v51 = self->_sessionContext;
    objc_msgSend(v61, "sessionUUID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v20;
    LOBYTE(v51) = -[HDCloudSyncSessionContext addChangeData:changes:sessionIdentifier:outError:](v51, "addChangeData:changes:sessionIdentifier:outError:", v60, v10, v52, &v62);
    v20 = v62;

    if ((v51 & 1) != 0)
    {
      v18 = v58;
      if ((v46 & 1) != 0 || -[NSMutableArray count](self->_changeRecordsPendingPush, "count"))
      {
        if (-[HDCloudSyncSessionContext hasOpenSequence](self->_sessionContext, "hasOpenSequence"))
          v53 = 1;
        else
          v53 = 2;
      }
      else
      {
        v53 = 1;
      }
      v19 = v57;
      v11[2](v11, v53, 0);
      goto LABEL_32;
    }
    v11[2](v11, 0, v20);
LABEL_31:
    v19 = v57;
    v18 = v58;
LABEL_32:

    goto LABEL_33;
  }
  _HKInitializeLogging();
  v47 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v66 = self;
    v67 = 2114;
    v68 = v20;
    _os_log_error_impl(&dword_1B7802000, v47, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset invalid archive creator: (%{public}@)", buf, 0x16u);
  }
  v11[2](v11, 0, v20);
  v10 = v25;
LABEL_33:

}

uint64_t __71__HDCloudSyncPushSequenceOperation_syncSession_sendChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "syncEntityIdentifier");
}

- (BOOL)syncSession:(id)a3 didEndTransactionWithError:(id *)a4
{
  id v7;
  NSObject *v8;
  int v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncPushSequenceOperation.m"), 1129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[session isKindOfClass:[HDCloudSyncSession class]]"));

  }
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: didEndTransaction called for session: %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  v9 = -[HDCloudSyncPushSequenceOperation _lock_finalizeNextChangeRecordForUploadToSession:shouldFreeze:error:]((uint64_t)self, v7, 1, a4);
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__21;
    v27 = __Block_byref_object_dispose__21;
    v28 = 0;
    v10 = dispatch_semaphore_create(0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__HDCloudSyncPushSequenceOperation_syncSession_didEndTransactionWithError___block_invoke;
    v17[3] = &unk_1E6CEB7C8;
    v19 = &v21;
    v20 = buf;
    v11 = v10;
    v18 = v11;
    -[HDCloudSyncPushSequenceOperation _uploadChangesForSyncSession:isFinalUpload:completion:]((uint64_t)self, v7, 0, v17);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v22 + 24))
    {
      v12 = 1;
    }
    else
    {
      v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
      v14 = v13;
      if (v13)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v13);
        else
          _HKLogDroppedError();
      }

      v12 = *((_BYTE *)v22 + 24) != 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __75__HDCloudSyncPushSequenceOperation_syncSession_didEndTransactionWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  _BYTE v22[18];
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncPushSequenceOperation.m"), 1163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[session isKindOfClass:[HDCloudSyncSession class]]"));

  }
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x1E0CB5370];
  v12 = (void *)*MEMORY[0x1E0CB5370];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB5370]))
  {
    v13 = v12;
    v14 = os_signpost_id_make_with_pointer(*v11, self);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        -[HDCloudSyncOperation configuration](self, "configuration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "descriptionForSignpost");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v22 = v6;
        *(_WORD *)&v22[4] = 2114;
        *(_QWORD *)&v22[6] = v17;
        _os_signpost_emit_with_name_impl(&dword_1B7802000, v13, OS_SIGNPOST_INTERVAL_END, v15, "cloud-sync-push-session", "success=%{BOOL}d, %{public}@", buf, 0x12u);

      }
    }

  }
  _HKInitializeLogging();
  v18 = *v11;
  v19 = *v11;
  if (v6)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v22 = self;
      *(_WORD *)&v22[8] = 2114;
      *(_QWORD *)&v22[10] = v9;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished session: %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncPushSequenceOperation _finalizePushForSession:]((uint64_t)self, v9);
    -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v22 = self;
      *(_WORD *)&v22[8] = 2114;
      *(_QWORD *)&v22[10] = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Sync session %{public}@ failed: %{public}@", buf, 0x20u);
    }
    os_unfair_lock_lock(&self->_lock);
    -[HDCloudSyncSessionContext finishProgress](self->_sessionContext, "finishProgress");
    os_unfair_lock_unlock(&self->_lock);
    -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v10);
  }

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

- (BOOL)hasMadeForwardProgress
{
  return self->_hasMadeForwardProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceState, 0);
  objc_storeStrong((id *)&self->_recordsPendingDeletion, 0);
  objc_storeStrong((id *)&self->_changeRecordsPendingPush, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_sequenceRecord, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
