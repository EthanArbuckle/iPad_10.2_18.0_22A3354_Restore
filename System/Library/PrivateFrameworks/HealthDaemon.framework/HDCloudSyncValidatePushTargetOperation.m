@implementation HDCloudSyncValidatePushTargetOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (id)operationTagDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDCloudSyncValidatePushTargetOperation)initWithConfiguration:(id)a3
{
  HDCloudSyncValidatePushTargetOperation *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *targetsBySequenceToDelete;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDCloudSyncValidatePushTargetOperation;
  v3 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v7, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    targetsBySequenceToDelete = v3->_targetsBySequenceToDelete;
    v3->_targetsBySequenceToDelete = v4;

  }
  return v3;
}

- (void)main
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *targets;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  NSObject *v25;
  HDCloudSyncValidatePushTargetOperation *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  HDCloudSyncValidatePushTargetOperation *v30;
  uint64_t v31;
  id v32;
  HDCloudSyncDeleteSequenceOperation *v33;
  void *v34;
  void *v35;
  HDCloudSyncDeleteSequenceOperation *v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 buf;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);
  void *v45;
  HDCloudSyncValidatePushTargetOperation *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "computedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushTargets");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  targets = self->_targets;
  self->_targets = v5;

  if (-[NSArray count](self->_targets, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = self->_targets;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, &buf, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v13, "store");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Target's %@ push store not set when beginning push target validation."), v13);
            v20 = (id)objc_claimAutoreleasedReturnValue();
            v19 = v20;
            if (v20)
              v21 = objc_retainAutorelease(v20);

            v18 = 0;
            goto LABEL_16;
          }
          objc_msgSend(v13, "store");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "shardPredicate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "type");

          if (v17 != 2)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, &buf, 16);
        if (v10)
          continue;
        break;
      }
    }

    v18 = v7;
    v19 = 0;
LABEL_16:

    v22 = v19;
    if (v18)
    {
      if (objc_msgSend(v18, "count"))
      {
        v38 = v22;
        v23 = -[HDCloudSyncValidatePushTargetOperation _validateTargets:errorOut:]((uint64_t)self, v18, &v38);
        v24 = v38;

        if (v23)
        {
          if (self->_requiresOwnershipRoll)
          {
            -[HDCloudSyncValidatePushTargetOperation _rollOwnershipIdentiferAndFinish](self);
LABEL_31:
            v22 = v24;
            goto LABEL_32;
          }
          if (-[NSMutableDictionary count](self->_targetsBySequenceToDelete, "count"))
          {
            v33 = [HDCloudSyncDeleteSequenceOperation alloc];
            -[HDCloudSyncOperation configuration](self, "configuration");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)-[NSMutableDictionary copy](self->_targetsBySequenceToDelete, "copy");
            v36 = -[HDCloudSyncDeleteSequenceOperation initWithConfiguration:targetsBySequence:](v33, "initWithConfiguration:targetsBySequence:", v34, v35);

            v37 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v44 = __76__HDCloudSyncValidatePushTargetOperation__deleteOldSequenceRecordsAndFinish__block_invoke;
            v45 = &unk_1E6CE77A0;
            v46 = self;
            -[HDCloudSyncOperation setOnError:](v36, "setOnError:", &buf);
            *(_QWORD *)&v39 = v37;
            *((_QWORD *)&v39 + 1) = 3221225472;
            *(_QWORD *)&v40 = __76__HDCloudSyncValidatePushTargetOperation__deleteOldSequenceRecordsAndFinish__block_invoke_2;
            *((_QWORD *)&v40 + 1) = &unk_1E6CE7778;
            *(_QWORD *)&v41 = self;
            -[HDCloudSyncOperation setOnSuccess:](v36, "setOnSuccess:", &v39);
            -[HDCloudSyncOperation start](v36, "start");

            goto LABEL_31;
          }
          v30 = self;
          v31 = 1;
          v32 = 0;
        }
        else
        {
          v30 = self;
          v31 = 0;
          v32 = v24;
        }
        -[HDCloudSyncOperation finishWithSuccess:error:](v30, "finishWithSuccess:error:", v31, v32);
        goto LABEL_31;
      }
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: No filtered targets to validate.", (uint8_t *)&buf, 0xCu);
      }
      v26 = self;
      v27 = 1;
      v28 = 0;
    }
    else
    {
      v26 = self;
      v27 = 0;
      v28 = v22;
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](v26, "finishWithSuccess:error:", v27, v28);
LABEL_32:

    return;
  }
  _HKInitializeLogging();
  v25 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: No targets to validate.", (uint8_t *)&buf, 0xCu);
  }
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
}

- (BOOL)_validateTargets:(_QWORD *)a3 errorOut:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  uint64_t v18;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v20 = v4;
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v20);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_BYTE *)(a1 + 120) != 0;
        if (*(_BYTE *)(a1 + 120))
          goto LABEL_21;
        v11 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        objc_msgSend(v11, "storeRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentSequenceHeaderRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "storeRecord");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "oldSequenceHeaderRecord");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            v18 = -[HDCloudSyncValidatePushTargetOperation _validateCurrentSequenceForTarget:errorOut:]((_BYTE *)a1, v11, a3);

            if ((v18 & 1) == 0)
              goto LABEL_21;
            goto LABEL_18;
          }
          v16 = objc_msgSend(v13, "isActive");
          if (v16 != objc_msgSend(v15, "isActive")
            && (!objc_msgSend(v13, "isActive") || (objc_msgSend(v15, "isActive") & 1) != 0))
          {
            v17 = -[HDCloudSyncValidatePushTargetOperation _validateCurrentSequenceForTarget:errorOut:]((_BYTE *)a1, v11, a3);

            if ((v17 & 1) == 0)
              goto LABEL_21;
            goto LABEL_18;
          }
          objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v11, v15);

        }
LABEL_18:
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }
    v10 = 1;
LABEL_21:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_rollOwnershipIdentiferAndFinish
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (a1)
  {
    objc_msgSend(a1, "profile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cloudSyncManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ownerIdentifierManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__HDCloudSyncValidatePushTargetOperation__rollOwnershipIdentiferAndFinish__block_invoke;
    v5[3] = &unk_1E6CE77C8;
    v5[4] = a1;
    objc_msgSend(v4, "rollOwnerDifferentiatorForReason:completion:", CFSTR("Found anchors from the future"), v5);

  }
}

- (uint64_t)_validateCurrentSequenceForTarget:(_QWORD *)a3 errorOut:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  uint64_t *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  __CFString *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  HDCloudSyncCachedZone *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  char v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  BOOL v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  NSObject *v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  BOOL v103;
  NSObject *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  _BYTE v117[12];
  id v118;
  id v119;
  id obj;
  id obja;
  _QWORD v123[5];
  id v124;
  id v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131[4];
  id v132;
  _BYTE *v133;
  void *v134;
  _BYTE *v135;
  const __CFString *v136;
  const __CFString *v137;
  const __CFString *v138;
  uint8_t v139[4];
  _BYTE v140[24];
  _BYTE buf[24];
  void *v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  double v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _BYTE v153[24];
  char v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "storeRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSequenceHeaderRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "childRecordCount") >= 501)
  {
    objc_msgSend(a1, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "rebaseProhibited");

    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5370];
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = v9;
        HDCloudSyncRebaseReasonToString(0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2114;
        v142 = v6;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: rebase required but prohibited (%{public}@) for sequence record %{public}@", buf, 0x20u);

      }
    }
    else
    {
      if (v10)
      {
        v13 = v9;
        HDCloudSyncRebaseReasonToString(0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        v142 = v6;
        _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: rebase required (%{public}@) for sequence record %{public}@", buf, 0x20u);

      }
      v15 = kHDEventNameCloudSync;
      v136 = CFSTR("operation");
      v137 = CFSTR("rebase-reason");
      *(_QWORD *)buf = &unk_1E6DFAF70;
      *(_QWORD *)&buf[8] = &unk_1E6DFAF70;
      v138 = CFSTR("record-count");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "childRecordCount"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf[16] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v136, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HDPowerLog(v15, v17, 2);

      -[HDCloudSyncValidatePushTargetOperation _requireRebaseForTarget:](a1, v4);
    }
  }

  v119 = v4;
  objc_msgSend(v119, "storeRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentSequenceHeaderRecord");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v119;
  if (v19
    && (-[HDCloudSyncValidatePushTargetOperation _validateAnchorRangesForSequenceRecord:target:errorOut:](a1, v19, v119, a3) & 1) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v119, "storeRecord");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "oldSequenceHeaderRecord");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v119;
  if (v22
    && (-[HDCloudSyncValidatePushTargetOperation _validateAnchorRangesForSequenceRecord:target:errorOut:](a1, v22, v119, a3) & 1) == 0)
  {

LABEL_16:
    v28 = 0;
    goto LABEL_89;
  }

  v23 = v119;
  objc_msgSend(v23, "store");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = 0;
  objc_msgSend(v24, "persistedStateWithError:", v131);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v131[0];

  if (v25)
  {
    objc_msgSend(a1, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "rebaseProhibited"))
    {

    }
    else
    {
      objc_msgSend(v25, "rebaseDeadline");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 == 0;

      if (!v32)
      {
        objc_msgSend(v25, "rebaseDeadline");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "configuration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "syncDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "timeIntervalSinceDate:", v35);
        v37 = v36;

        v38 = (uint64_t *)MEMORY[0x1E0CB7570];
        if (v37 < *MEMORY[0x1E0CB7570])
        {
          _HKInitializeLogging();
          v39 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            objc_msgSend(v23, "store");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            HDCloudSyncRebaseReasonToString(1uLL);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "rebaseDeadline");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = *v38;
            *(_DWORD *)buf = 138544642;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v41;
            *(_WORD *)&buf[22] = 2114;
            v142 = v42;
            v143 = 2114;
            v144 = v43;
            v145 = 2048;
            v146 = v44;
            v147 = 2048;
            v148 = v37;
            _os_log_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] rebase required (%{public}@), rebase deadline of %{public}@ (trigger threshold is %0.1lfs, remaining interval is %0.1lfs)", buf, 0x3Eu);

          }
          v45 = kHDEventNameCloudSync;
          *(_QWORD *)&v149 = CFSTR("operation");
          *((_QWORD *)&v149 + 1) = CFSTR("rebase-reason");
          v136 = (const __CFString *)&unk_1E6DFAF70;
          v137 = (const __CFString *)&unk_1E6DFAF88;
          *(_QWORD *)&v150 = CFSTR("deadline");
          v46 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "rebaseDeadline");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "timeIntervalSinceReferenceDate");
          objc_msgSend(v46, "numberWithDouble:");
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v138 = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v149, 3);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          HDPowerLog(v45, v49, 2);

          -[HDCloudSyncValidatePushTargetOperation _requireRebaseForTarget:](a1, v23);
        }
      }
    }

LABEL_26:
    v118 = v23;
    objc_msgSend(a1, "configuration");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "repository");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "zoneIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "containerIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "containerForContainerIdentifier:", v53);
    *(_QWORD *)&v117[4] = objc_claimAutoreleasedReturnValue();

    if (!*(_QWORD *)&v117[4])
    {
      v85 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v118, "zoneIdentifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "containerIdentifier");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "hk_error:format:", 723, CFSTR("Unable to find container for identifier %@"), v87);
      v88 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v117 = v88 == 0;
      if (v88)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v88);
        else
          _HKLogDroppedError();
      }

      goto LABEL_88;
    }
    objc_msgSend(v118, "storeRecord");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "currentSequenceHeaderRecord");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55)
    {
      *(_DWORD *)v117 = 1;
LABEL_88:

      v20 = v119;
      v28 = *(unsigned int *)v117;
      goto LABEL_89;
    }
    objc_msgSend(v118, "storeRecord");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = [HDCloudSyncCachedZone alloc];
    objc_msgSend(v118, "zoneIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuration");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "repository");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "accessibilityAssertion");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v57, "initForZoneIdentifier:repository:accessibilityAssertion:", v58, v60, v62);

    v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v65 = objc_opt_class();
    v126 = 0;
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __92__HDCloudSyncValidatePushTargetOperation__validateCurrentSequenceChangesForTarget_errorOut___block_invoke;
    v123[3] = &unk_1E6CF52A0;
    v123[4] = a1;
    v113 = v56;
    v124 = v113;
    v116 = v64;
    v125 = v116;
    v114 = v63;
    *(_DWORD *)v117 = objc_msgSend(v63, "recordsForClass:epoch:error:enumerationHandler:", v65, 0, &v126, v123);
    v115 = v126;
    if ((v117[0] & 1) == 0)
    {
      _HKInitializeLogging();
      v89 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v105 = v89;
        objc_msgSend(v63, "zoneIdentifier");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v106;
        _os_log_error_impl(&dword_1B7802000, v105, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached change records from zone %{public}@", buf, 0x16u);

      }
      v90 = v115;
      v91 = v90;
      if (v90)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v90);
        else
          _HKLogDroppedError();
      }

      goto LABEL_87;
    }
    objc_msgSend(v116, "sortUsingSelector:", sel_compare_);
    v66 = v116;
    objc_msgSend(v66, "lastObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v67;
    if (v67)
    {
      v68 = objc_msgSend(v67, "finalForSequence");
      _HKInitializeLogging();
      v69 = *MEMORY[0x1E0CB5370];
      v70 = *MEMORY[0x1E0CB5370];
      if ((v68 & 1) != 0)
      {
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          v71 = v69;
          v72 = objc_msgSend(v66, "count");
          *(_DWORD *)v153 = 138543618;
          *(_QWORD *)&v153[4] = a1;
          *(_WORD *)&v153[12] = 2048;
          *(_QWORD *)&v153[14] = v72;
          _os_log_impl(&dword_1B7802000, v71, OS_LOG_TYPE_INFO, "%{public}@: Checking for hole in %ld fetched records", v153, 0x16u);

        }
        *(_QWORD *)v153 = 0;
        *(_QWORD *)&v153[8] = v153;
        *(_QWORD *)&v153[16] = 0x2020000000;
        v154 = 0;
        v111 = (void *)objc_opt_new();
        v151 = 0u;
        v152 = 0u;
        v149 = 0u;
        v150 = 0u;
        obj = v66;
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, buf, 16);
        v74 = 0;
        if (v73)
        {
          v75 = *(_QWORD *)v150;
          while (2)
          {
            for (i = 0; i != v73; ++i)
            {
              if (*(_QWORD *)v150 != v75)
                objc_enumerationMutation(obj);
              v77 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
              objc_msgSend(v77, "decodedSyncAnchorRangeMap");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              _HKInitializeLogging();
              v79 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
              {
                v80 = v79;
                if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v77, "record");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "recordID");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "recordName");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v139 = 67109634;
                  *(_DWORD *)v140 = v74;
                  *(_WORD *)&v140[4] = 2114;
                  *(_QWORD *)&v140[6] = v83;
                  *(_WORD *)&v140[14] = 2114;
                  *(_QWORD *)&v140[16] = v78;
                  _os_log_impl(&dword_1B7802000, v80, OS_LOG_TYPE_INFO, "\t%02d: [Record: %{public}@] %{public}@", v139, 0x1Cu);

                  ++v74;
                }

              }
              if (!v78 || !objc_msgSend(v78, "anchorRangeCount"))
              {
                _HKInitializeLogging();
                v92 = (id)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v77, "record");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v108, "recordID");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v109, "recordName");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v139 = 138543618;
                  *(_QWORD *)v140 = a1;
                  *(_WORD *)&v140[8] = 2114;
                  *(_QWORD *)&v140[10] = v110;
                  _os_log_error_impl(&dword_1B7802000, v92, OS_LOG_TYPE_ERROR, "%{public}@: [Record: %{public}@]: ordered change record with nil or empty anchor range map found, this may indicate a hole in the sequence", v139, 0x16u);

                }
                *(_BYTE *)(*(_QWORD *)&v153[8] + 24) = 1;
LABEL_71:

                goto LABEL_72;
              }
              v131[0] = (id)MEMORY[0x1E0C809B0];
              v131[1] = (id)3221225472;
              v131[2] = __85__HDCloudSyncValidatePushTargetOperation__orderedChangeRecordSequenceRequiresRebase___block_invoke;
              v131[3] = &unk_1E6CF52C8;
              v132 = v111;
              v133 = a1;
              v134 = v77;
              v135 = v153;
              objc_msgSend(v78, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v131);
              v84 = *(_BYTE *)(*(_QWORD *)&v153[8] + 24) == 0;

              if (!v84)
                goto LABEL_71;

            }
            v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, buf, 16);
            if (v73)
              continue;
            break;
          }
        }
LABEL_72:

        if (!*(_BYTE *)(*(_QWORD *)&v153[8] + 24))
        {

          _Block_object_dispose(v153, 8);
          goto LABEL_87;
        }
        _HKInitializeLogging();
        v93 = (id)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          v107 = objc_msgSend(obj, "count");
          *(_DWORD *)v139 = 138543618;
          *(_QWORD *)v140 = a1;
          *(_WORD *)&v140[8] = 2048;
          *(_QWORD *)&v140[10] = v107;
          _os_log_error_impl(&dword_1B7802000, v93, OS_LOG_TYPE_ERROR, "%{public}@: Found hole in %ld fetched records", v139, 0x16u);
        }

        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        obja = obj;
        v94 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v127, &v136, 16);
        if (v94)
        {
          v95 = *(_QWORD *)v128;
          do
          {
            for (j = 0; j != v94; ++j)
            {
              if (*(_QWORD *)v128 != v95)
                objc_enumerationMutation(obja);
              v97 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
              objc_msgSend(v97, "decodedSyncAnchorRangeMap");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              _HKInitializeLogging();
              v99 = (id)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v97, "record");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "recordID");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "recordName");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v139 = 67109634;
                *(_DWORD *)v140 = v74;
                *(_WORD *)&v140[4] = 2114;
                *(_QWORD *)&v140[6] = v102;
                *(_WORD *)&v140[14] = 2114;
                *(_QWORD *)&v140[16] = v98;
                _os_log_impl(&dword_1B7802000, v99, OS_LOG_TYPE_DEFAULT, "\t%02d: [Record: %{public}@] %{public}@", v139, 0x1Cu);

                ++v74;
              }

            }
            v94 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v127, &v136, 16);
          }
          while (v94);
        }

        v103 = *(_BYTE *)(*(_QWORD *)&v153[8] + 24) == 0;
        _Block_object_dispose(v153, 8);

        if (v103)
          goto LABEL_87;
      }
      else
      {
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v153 = 138543618;
          *(_QWORD *)&v153[4] = a1;
          *(_WORD *)&v153[12] = 2114;
          *(_QWORD *)&v153[14] = v112;
          _os_log_error_impl(&dword_1B7802000, v69, OS_LOG_TYPE_ERROR, "%{public}@: Final ordered change record (%{public}@) is not final for sequence; rebase required to repair damage.",
            v153,
            0x16u);
        }

      }
      -[HDCloudSyncValidatePushTargetOperation _requireRebaseForTarget:](a1, v118);
    }
    else
    {

    }
LABEL_87:

    goto LABEL_88;
  }
  v29 = v26;
  if (!v29)
  {

    goto LABEL_26;
  }
  v30 = v29;
  if (a3)
    *a3 = objc_retainAutorelease(v29);
  else
    _HKLogDroppedError();

  v28 = 0;
  v20 = v119;
LABEL_89:

  return v28;
}

uint64_t __76__HDCloudSyncValidatePushTargetOperation__deleteOldSequenceRecordsAndFinish__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

void __76__HDCloudSyncValidatePushTargetOperation__deleteOldSequenceRecordsAndFinish__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  id v5;
  _BYTE *v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v2 + 112), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = -[HDCloudSyncValidatePushTargetOperation _validateTargets:errorOut:](v2, v3, &v9);
  v5 = v9;

  v6 = *(_BYTE **)(a1 + 32);
  if (!v4)
  {
    v7 = 0;
    v8 = v5;
LABEL_6:
    objc_msgSend(v6, "finishWithSuccess:error:", v7, v8);
    goto LABEL_7;
  }
  if (!v6[120])
  {
    v7 = 1;
    v8 = 0;
    goto LABEL_6;
  }
  -[HDCloudSyncValidatePushTargetOperation _rollOwnershipIdentiferAndFinish](v6);
LABEL_7:

}

void __74__HDCloudSyncValidatePushTargetOperation__rollOwnershipIdentiferAndFinish__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  id *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(id **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v4[13], "hk_map:", &__block_literal_global_79);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "computedState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceTargets:", v7);

    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
  }
  else
  {
    objc_msgSend(v4, "finishWithSuccess:error:", 0, a3);
  }
}

uint64_t __74__HDCloudSyncValidatePushTargetOperation__rollOwnershipIdentiferAndFinish__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "targetByUpdatingPurpose:", 1);
}

- (uint64_t)_validateAnchorRangesForSequenceRecord:(void *)a3 target:(_QWORD *)a4 errorOut:
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  __CFString *v31;
  id v32;
  uint64_t *v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  id v39;
  uint8_t buf[4];
  _BYTE *v41;
  __int16 v42;
  __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(a1, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rebaseProhibited");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v8, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncStoreForEpoch:", objc_msgSend(v7, "baselineEpoch"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0;
    objc_msgSend(v13, "getPersistedAnchorMapWithError:", &v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v39;
    v16 = v15;
    if (v14)
    {
      objc_msgSend(a1, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDCloudSyncPushSequenceOperation unfrozenChangeRecordsForPushTarget:sequenceRecord:configuration:error:](HDCloudSyncPushSequenceOperation, "unfrozenChangeRecordsForPushTarget:sequenceRecord:configuration:error:", v8, v7, v17, a4);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(a1, "configuration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = +[HDCloudSyncPushSequenceOperation shouldPerformRecentRecordRollingForUnfrozenRecords:configuration:](HDCloudSyncPushSequenceOperation, "shouldPerformRecentRecordRollingForUnfrozenRecords:configuration:", v18, v19);

        if (v20)
          objc_msgSend(v7, "frozenSyncAnchorMap");
        else
          objc_msgSend(v7, "syncAnchorMap");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqual:", v22) & 1) == 0)
        {
          v23 = CFSTR("pushed");
          if (v20)
            v23 = CFSTR("frozen");
          v24 = v23;
          v35 = 0;
          v36 = &v35;
          v37 = 0x2020000000;
          v38 = 0;
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __97__HDCloudSyncValidatePushTargetOperation__validateAnchorRangesForSequenceRecord_target_errorOut___block_invoke;
          v28[3] = &unk_1E6CF5278;
          v34 = v20;
          v29 = v14;
          v30 = a1;
          v25 = v24;
          v31 = v25;
          v32 = v13;
          v33 = &v35;
          objc_msgSend(v22, "enumerateAnchorsAndEntityIdentifiersWithBlock:", v28);
          if (*((_BYTE *)v36 + 24))
          {
            a1[120] = 1;
            _HKInitializeLogging();
            v26 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v41 = a1;
              v42 = 2112;
              v43 = v25;
              _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Found %@ anchors from the future", buf, 0x16u);
            }
          }

          _Block_object_dispose(&v35, 8);
        }

        goto LABEL_19;
      }
    }
    else
    {
      v21 = v15;
      v18 = v21;
      if (!v21)
      {
LABEL_19:
        v11 = 1;
        goto LABEL_22;
      }
      if (a4)
      {
        v18 = objc_retainAutorelease(v21);
        v11 = 0;
        *a4 = v18;
LABEL_22:

        goto LABEL_23;
      }
      _HKLogDroppedError();
    }
    v11 = 0;
    goto LABEL_22;
  }
  v11 = 1;
LABEL_23:

  return v11;
}

void __97__HDCloudSyncValidatePushTargetOperation__validateAnchorRangesForSequenceRecord_target_errorOut___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:", v5);
  v7 = v6;
  if (v6 <= a3)
  {
    if (v6 < a3)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v15 = 138544386;
        v16 = v13;
        v17 = 2114;
        v18 = v14;
        v19 = 2048;
        v20 = a3;
        v21 = 2048;
        v22 = v7;
        v23 = 2114;
        v24 = v5;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Sequence Record %{public}@ sync anchor (%lld) greater than local sync anchor (%lld) for sync entity %{public}@. Invalid state can be fixed with a forced ownership change", (uint8_t *)&v15, 0x34u);
      }
    }
  }
  else if (!*(_BYTE *)(a1 + 72))
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v15 = 138544642;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2048;
      v20 = a3;
      v21 = 2048;
      v22 = v7;
      v23 = 2114;
      v24 = v5;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Sequence Record %{public}@ sync anchor (%lld) less than local sync anchor (%lld) for sync entity %{public}@. Last upload to store %{public}@ must have failed", (uint8_t *)&v15, 0x3Eu);
    }
  }

}

- (void)_requireRebaseForTarget:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "targetByAddingOptions:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceTargets:", v7);

}

uint64_t __92__HDCloudSyncValidatePushTargetOperation__validateCurrentSequenceChangesForTarget_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v7 = v5;
  v8 = v6;
  if (v4 && +[HDCloudSyncChangeRecord isChangeRecord:](HDCloudSyncChangeRecord, "isChangeRecord:", v7))
  {
    objc_msgSend(v8, "currentSequenceHeaderRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[HDCloudSyncChangeRecord isChangeRecord:inSequence:](HDCloudSyncChangeRecord, "isChangeRecord:inSequence:", v7, v9);

    if (v10)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }
  else
  {

  }
  return 1;
}

void __85__HDCloudSyncValidatePushTargetOperation__orderedChangeRecordSequenceRequiresRebase___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:", v9);
  if (a3 <= v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAnchor:forSyncEntityIdentifier:", a4, v9);
  }
  else
  {
    v11 = v10;
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(a1 + 48);
      v15 = v12;
      objc_msgSend(v13, "record");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "recordName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      v20 = v14;
      v21 = 2114;
      v22 = v18;
      v23 = 2114;
      v24 = v9;
      v25 = 2048;
      v26 = a3;
      v27 = 2048;
      v28 = v11;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [Record: %{public}@]: hole found for %{public}@: %lld != %lld", (uint8_t *)&v19, 0x34u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a5 = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetsBySequenceToDelete, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

@end
