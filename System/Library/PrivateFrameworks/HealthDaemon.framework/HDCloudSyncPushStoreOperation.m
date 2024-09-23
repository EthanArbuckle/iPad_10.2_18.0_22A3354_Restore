@implementation HDCloudSyncPushStoreOperation

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

- (HDCloudSyncPushStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncPushStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5
{
  id v9;
  HDCloudSyncPushStoreOperation *v10;
  HDCloudSyncPushStoreOperation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPushStoreOperation;
  v10 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_target, a5);
    v11->_lock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (HDCloudSyncTarget)target
{
  os_unfair_lock_s *p_lock;
  HDCloudSyncTarget *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_target;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTarget:(id)a3
{
  id v5;
  HDCloudSyncTarget *v6;
  HDCloudSyncTarget *target;
  void *v8;

  v5 = a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncPushStoreOperation.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (HDCloudSyncTarget *)objc_msgSend(v5, "copy");

  target = self->_target;
  self->_target = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  HDCloudSyncTarget *target;
  void *v4;
  _HDCloudSyncStorePersistableState *v5;
  id v6;
  _HDCloudSyncStorePersistableState *storeState;
  HDCloudSyncCompoundOperation *v8;
  void *v9;
  void *v10;
  HDCloudSyncCompoundOperation *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  target = self->_target;
  if (target)
  {
    -[HDCloudSyncTarget store](target, "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v4, "persistedStateWithError:", &v34);
    v5 = (_HDCloudSyncStorePersistableState *)objc_claimAutoreleasedReturnValue();
    v6 = v34;
    storeState = self->_storeState;
    self->_storeState = v5;

    if (self->_storeState)
    {
      v8 = [HDCloudSyncCompoundOperation alloc];
      -[HDCloudSyncOperation configuration](self, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation cloudState](self, "cloudState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v8, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v9, v10, CFSTR("Push Sequences"), 1);

      v33 = 0;
      -[HDCloudSyncPushStoreOperation _validatedSequenceRecordOperationsForPushWithError:]((id *)&self->super.super.isa, (uint64_t)&v33);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v33;
      if (v12)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v30 != v17)
                objc_enumerationMutation(v14);
              -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v11, "addOperation:transitionHandler:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), 0);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          }
          while (v16);
        }

        v19 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __37__HDCloudSyncPushStoreOperation_main__block_invoke;
        v28[3] = &unk_1E6CE77A0;
        v28[4] = self;
        -[HDCloudSyncOperation setOnError:](v11, "setOnError:", v28);
        v27[0] = v19;
        v27[1] = 3221225472;
        v27[2] = __37__HDCloudSyncPushStoreOperation_main__block_invoke_2;
        v27[3] = &unk_1E6CE7778;
        v27[4] = self;
        -[HDCloudSyncOperation setOnSuccess:](v11, "setOnSuccess:", v27);
        -[HDCloudSyncOperation progress](v11, "progress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "totalUnitCount");
        -[HDCloudSyncOperation progress](self, "progress");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTotalUnitCount:", v21);

        -[HDCloudSyncOperation progress](self, "progress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation progress](v11, "progress");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation progress](v11, "progress");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addChild:withPendingUnitCount:", v24, objc_msgSend(v25, "totalUnitCount"));

        -[HDCloudSyncCompoundOperation start](v11, "start");
      }
      else
      {
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v13);
      }

    }
    else
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v6);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("No target set when beginning push."));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0);

  }
}

- (id)_validatedSequenceRecordOperationsForPushWithError:(id *)a1
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  BOOL v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t k;
  void *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  __int16 v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  NSObject *v129;
  void *v130;
  HDSyncAnchorMap *v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  uint64_t v136;
  void *v137;
  unint64_t v138;
  void *v139;
  int v140;
  void *v141;
  int v142;
  uint64_t v143;
  int v144;
  NSObject *v145;
  id v146;
  id v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  HDSyncAnchorMap *v154;
  void *v155;
  NSObject *v156;
  void *v157;
  id v158;
  NSObject *v159;
  void *v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void *v162;
  id v163;
  NSObject *v164;
  void *v165;
  uint64_t (*v166)(uint64_t, uint64_t);
  uint64_t v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  NSObject *v175;
  void *v176;
  uint64_t (*v177)(uint64_t, uint64_t);
  uint64_t v178;
  void *v179;
  void *v180;
  void *v182;
  id v183;
  void *v184;
  id v185;
  id v186;
  id v187;
  id v189;
  void *v190;
  id obj;
  id obja;
  id v194;
  id v195;
  _QWORD v196[4];
  id v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _BYTE buf[24];
  void *v207;
  id *v208;
  _BYTE *v209;
  _BYTE v210[24];
  uint64_t (*v211)(uint64_t, uint64_t);
  _BYTE v212[20];
  __int16 v213;
  uint64_t v214;
  __int16 v215;
  void *v216;
  uint64_t v217;

  v217 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1[13], "storeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    obj = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  objc_msgSend(a1[13], "storeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isChild");

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(a1[13], "storeRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(v6, "initWithObjects:", v8, 0);

    goto LABEL_53;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1[13], "storeRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1[13], "storeRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  objc_msgSend(a1[13], "storeRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentSequenceHeaderRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "includedSyncIdentities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(a1[13], "storeRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentSequenceHeaderRecord");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "includedSyncIdentities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionSet:", v19);

  }
  objc_msgSend(a1, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "syncIdentityManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v196[0] = MEMORY[0x1E0C809B0];
  v196[1] = 3221225472;
  v196[2] = __77__HDCloudSyncPushStoreOperation__currentOwnedSyncIdentitiesForPushWithError___block_invoke;
  v196[3] = &unk_1E6CF8E38;
  v194 = v9;
  v197 = v194;
  v22 = objc_msgSend(v21, "enumerateConcreteIdentitiesError:enumerationHandler:", a2, v196);

  if (!v22)
  {
    obj = 0;
    goto LABEL_52;
  }
  v204 = 0u;
  v205 = 0u;
  v202 = 0u;
  v203 = 0u;
  objc_msgSend(a1, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "computedState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "targets");
  obja = (id)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v202, v210, 16);
  if (!v25)
    goto LABEL_36;
  v26 = *(_QWORD *)v203;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v203 != v26)
        objc_enumerationMutation(obja);
      v28 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * i);
      if (objc_msgSend(v28, "purpose"))
        LODWORD(v29) = 0;
      else
        v29 = ((unint64_t)objc_msgSend(v28, "options") >> 2) & 1;
      if ((v29 | ((unint64_t)objc_msgSend(v28, "options") >> 1) & 1) == 1)
      {
        objc_msgSend(a1[13], "storeRecord");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sequenceRecord");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "includedChildSyncIdentities");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "storeRecord");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "syncIdentity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v32, "containsObject:", v34);

        if (v35)
        {
          _HKInitializeLogging();
          v36 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v37 = v36;
            objc_msgSend(v28, "storeRecord");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "syncIdentity");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v39;
            _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding seized target that is your own child %{public}@", buf, 0x16u);

          }
          objc_msgSend(v28, "storeRecord");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "syncIdentity");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v194, "removeObject:", v41);
          goto LABEL_32;
        }
        objc_msgSend(v28, "storeRecord");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "sequenceRecord");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v40, "includedSyncIdentities");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "count") == 0;

          if (!v44)
          {
            _HKInitializeLogging();
            v45 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v46 = v45;
              objc_msgSend(v40, "includedSyncIdentities");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v47;
              _os_log_impl(&dword_1B7802000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding includedSyncIdentities of seized target %{public}@", buf, 0x16u);

            }
          }
          objc_msgSend(v40, "includedSyncIdentities");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v194, "unionSet:", v48);

          objc_msgSend(v40, "includedChildSyncIdentities");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count") == 0;

          if (!v50)
          {
            _HKInitializeLogging();
            v51 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v52 = v51;
              objc_msgSend(v40, "includedChildSyncIdentities");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v53;
              _os_log_impl(&dword_1B7802000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding includedChildSyncIdentities of seized target %{public}@", buf, 0x16u);

            }
          }
          objc_msgSend(v40, "includedChildSyncIdentities");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v194, "unionSet:", v41);
LABEL_32:

        }
        continue;
      }
    }
    v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v202, v210, 16);
  }
  while (v25);
LABEL_36:

  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  objc_msgSend(a1, "configuration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "computedState");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "targets");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v198, buf, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v199;
    do
    {
      for (j = 0; j != v57; ++j)
      {
        if (*(_QWORD *)v199 != v58)
          objc_enumerationMutation(v56);
        v60 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * j);
        if (objc_msgSend(v60, "purpose") == 1 && (objc_msgSend(v60, "options") & 2) == 0)
        {
          objc_msgSend(v60, "storeRecord");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "sequenceRecord");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62)
          {
            objc_msgSend(v62, "includedSyncIdentities");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v194, "minusSet:", v63);

            objc_msgSend(v62, "includedChildSyncIdentities");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v194, "minusSet:", v64);

          }
        }
      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v198, buf, 16);
    }
    while (v57);
  }

  objc_msgSend(a1, "profile");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "daemon");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "behavior");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "isAppleWatch");

  if (v68)
  {
    objc_msgSend(a1, "profile");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "syncIdentityManager");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "legacySyncIdentity");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "identity");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v194, "removeObject:", v72);
  }
  objc_msgSend(a1, "profile");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "syncIdentityManager");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "currentSyncIdentity");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "identity");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "addObject:", v76);

  obj = v194;
LABEL_52:

LABEL_53:
  if (obj)
  {
    *(_QWORD *)v210 = 0;
    *(_QWORD *)&v210[8] = v210;
    *(_QWORD *)&v210[16] = 0x3032000000;
    v211 = __Block_byref_object_copy__95;
    *(_QWORD *)v212 = __Block_byref_object_dispose__95;
    *(_QWORD *)&v212[8] = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_msgSend(a1[13], "storeRecord");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "isChild");

    if (v78)
      goto LABEL_56;
    objc_msgSend(a1, "profile");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "database");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __82__HDCloudSyncPushStoreOperation__currentOwnedChildSyncIdentitiesForPushWithError___block_invoke;
    v207 = &unk_1E6CE8D70;
    v208 = a1;
    v209 = v210;
    v81 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performReadTransactionWithHealthDatabase:error:block:", v80, a2, buf);

    if (v81)
LABEL_56:
      v82 = *(id *)(*(_QWORD *)&v210[8] + 40);
    else
      v82 = 0;
    v190 = v82;
    _Block_object_dispose(v210, 8);

    v83 = v190;
    if (v190)
    {
      objc_msgSend(obj, "minusSet:");
      v84 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(a1[13], "store");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "storeIdentifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "addObject:", v86);

      objc_msgSend(a1[13], "storeRecord");
      v87 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v87, "currentSequenceHeaderRecord");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "includedIdentifiers");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "unionSet:", v89);

      objc_msgSend(a1[13], "storeRecord");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v87) = objc_msgSend(v90, "isChild");

      if ((v87 & 1) == 0)
      {
        v204 = 0u;
        v205 = 0u;
        v202 = 0u;
        v203 = 0u;
        objc_msgSend(a1, "configuration");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "computedState");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "targets");
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v202, v210, 16);
        if (v94)
        {
          v95 = *(_QWORD *)v203;
          do
          {
            for (k = 0; k != v94; ++k)
            {
              if (*(_QWORD *)v203 != v95)
                objc_enumerationMutation(v93);
              v97 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * k);
              if (objc_msgSend(v97, "purpose"))
                LODWORD(v98) = 0;
              else
                v98 = ((unint64_t)objc_msgSend(v97, "options") >> 2) & 1;
              if ((v98 | ((unint64_t)objc_msgSend(v97, "options") >> 1) & 1) == 1)
              {
                objc_msgSend(v97, "storeRecord");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "sequenceRecord");
                v100 = (void *)objc_claimAutoreleasedReturnValue();

                if (v100)
                {
                  objc_msgSend(v100, "includedIdentifiers");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "unionSet:", v101);

                }
              }
            }
            v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v202, v210, 16);
          }
          while (v94);
        }

        v200 = 0u;
        v201 = 0u;
        v198 = 0u;
        v199 = 0u;
        objc_msgSend(a1, "configuration");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "computedState");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "targets");
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v198, buf, 16);
        if (v105)
        {
          v106 = *(_QWORD *)v199;
          do
          {
            for (m = 0; m != v105; ++m)
            {
              if (*(_QWORD *)v199 != v106)
                objc_enumerationMutation(v104);
              v108 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * m);
              if (objc_msgSend(v108, "purpose") == 1 && (objc_msgSend(v108, "options") & 2) == 0)
              {
                objc_msgSend(v108, "storeRecord");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "sequenceRecord");
                v110 = (void *)objc_claimAutoreleasedReturnValue();

                if (v110)
                {
                  objc_msgSend(v110, "includedIdentifiers");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "minusSet:", v111);

                }
              }
            }
            v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v198, buf, 16);
          }
          while (v105);
        }

      }
      v195 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v187 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(a1, "configuration");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "context");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v113, "options");

      if ((v114 & 0x100) != 0)
      {
        objc_msgSend(a1[13], "storeRecord");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "tombstoneSequenceRecord");
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        if (v116)
        {
          -[HDCloudSyncPushStoreOperation _operationForExistingSequenceRecord:includedChildSyncIdentites:](a1, v116, v190);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v195, "addObject:", v117);

        }
        else
        {
          _HKInitializeLogging();
          v118 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v210 = 138543362;
            *(_QWORD *)&v210[4] = a1;
            _os_log_impl(&dword_1B7802000, v118, OS_LOG_TYPE_DEFAULT, "%{public}@: Sync options require separate tombstones but no tombstone sequence record exists. Creating it now.", v210, 0xCu);
          }
          objc_msgSend(a1[13], "storeRecord");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "addNewTombstoneSequenceHeaderRecordWithIncludedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:", v84, obj, v190);
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          -[HDCloudSyncPushStoreOperation _operationForNewSequenceRecord:replacingSequence:isRebaseline:](a1, v116, 0, 0);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v195, "addObject:", v120);

        }
        objc_msgSend(v187, "addObject:", CFSTR("tombstone"));

      }
      objc_msgSend(a1[13], "storeRecord");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "activeSequenceHeaderRecord");
      v184 = (void *)objc_claimAutoreleasedReturnValue();

      if (v184)
      {
        -[HDCloudSyncPushStoreOperation _operationForExistingSequenceRecord:includedChildSyncIdentites:](a1, v184, v190);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v195, "addObject:", v122);

        objc_msgSend(v187, "addObject:", CFSTR("active"));
      }
      v189 = v84;
      v185 = obj;
      v186 = v190;
      objc_msgSend(a1[13], "storeRecord");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "activeSequenceHeaderRecord");
      v124 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[13], "storeRecord");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "pendingSequenceHeaderRecord");
      v126 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[13], "storeRecord");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "currentSequenceHeaderRecord");
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      if (!(v124 | v126))
      {
        _HKInitializeLogging();
        v129 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v210 = 138543362;
          *(_QWORD *)&v210[4] = a1;
          _os_log_impl(&dword_1B7802000, v129, OS_LOG_TYPE_DEFAULT, "%{public}@: No current or active sequence; creating a new one and syncing.",
            v210,
            0xCu);
        }
        objc_msgSend(a1[13], "storeRecord");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = objc_alloc_init(HDSyncAnchorMap);
        objc_msgSend(v130, "addNewSequenceHeaderRecordWithSyncAnchorMap:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:", v131, v189, v185, v186);
        v132 = (void *)objc_claimAutoreleasedReturnValue();

        -[HDCloudSyncPushStoreOperation _operationForNewSequenceRecord:replacingSequence:isRebaseline:](a1, v132, 0, 1);
        v182 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_118;
      }
      objc_msgSend(a1, "configuration");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v133, "rebaseProhibited"))
      {

        goto LABEL_113;
      }
      objc_msgSend(a1[13], "store");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend(v134, "supportsRebase");

      if (!v135)
        goto LABEL_113;
      objc_msgSend(a1, "configuration");
      v136 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v136, "context");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = objc_msgSend(v137, "options");

      LOBYTE(v136) = objc_msgSend(a1[13], "options");
      objc_msgSend(v128, "includedIdentifiers");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v139, "isEqualToSet:", v189);

      objc_msgSend(v128, "includedSyncIdentities");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = objc_msgSend(v141, "isEqualToSet:", v185);

      v143 = (v138 >> 3) & 1;
      v144 = v136 & 1;
      if ((v136 & 1) != 0)
        LODWORD(v143) = 1;
      if ((v143 | v140 ^ 1 | v142 ^ 1) == 1)
      {
        _HKInitializeLogging();
        v145 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v210 = 138544386;
          *(_QWORD *)&v210[4] = a1;
          *(_WORD *)&v210[12] = 1024;
          *(_DWORD *)&v210[14] = (v138 & 8) >> 3;
          *(_WORD *)&v210[18] = 1024;
          *(_DWORD *)&v210[20] = v144;
          LOWORD(v211) = 1024;
          *(_DWORD *)((char *)&v211 + 2) = v142 ^ 1;
          HIWORD(v211) = 1024;
          *(_DWORD *)v212 = v140 ^ 1;
          _os_log_impl(&dword_1B7802000, v145, OS_LOG_TYPE_DEFAULT, "%{public}@: Rebasing and pushing to new sequence record (requested: %{BOOL}d, target: %{BOOL}d, mismatch identities: %{BOOL}d, mismatch identifiers: %{BOOL}d).", v210, 0x24u);
        }
        v146 = a1[13];
        v147 = v186;
        v148 = v185;
        v183 = v189;
        objc_msgSend(v146, "storeRecord");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "pendingSequenceHeaderRecord");
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        if (v150)
        {
          objc_msgSend(a1[13], "storeRecord");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = (id)objc_msgSend(v151, "clearPendingSequenceHeaderRecord");

        }
        objc_msgSend(a1[13], "storeRecord");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = objc_alloc_init(HDSyncAnchorMap);
        objc_msgSend(v153, "addNewSequenceHeaderRecordWithSyncAnchorMap:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:", v154, v183, v148, v147);
        v155 = (void *)objc_claimAutoreleasedReturnValue();

        -[HDCloudSyncPushStoreOperation _operationForNewSequenceRecord:replacingSequence:isRebaseline:](a1, v155, (void *)v126, 1);
        v182 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_113:
        if (v126)
        {
          _HKInitializeLogging();
          v156 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v210 = 138543362;
            *(_QWORD *)&v210[4] = a1;
            _os_log_impl(&dword_1B7802000, v156, OS_LOG_TYPE_DEFAULT, "%{public}@: Pushing to existing incomplete sequence.", v210, 0xCu);
          }
          -[HDCloudSyncPushStoreOperation _operationForExistingSequenceRecord:includedChildSyncIdentites:](a1, (void *)v126, v186);
          v182 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v182 = 0;
        }
      }
LABEL_118:

      if (v182)
      {
        objc_msgSend(v195, "addObject:", v182);
        objc_msgSend(v187, "addObject:", CFSTR("current"));
      }
      _HKInitializeLogging();
      v157 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v158 = a1[13];
        v159 = v157;
        objc_msgSend(v158, "store");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[13], "storeRecord");
        v161 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v210 = 138543874;
        *(_QWORD *)&v210[4] = a1;
        *(_WORD *)&v210[12] = 2114;
        *(_QWORD *)&v210[14] = v160;
        *(_WORD *)&v210[22] = 2114;
        v211 = v161;
        _os_log_impl(&dword_1B7802000, v159, OS_LOG_TYPE_DEFAULT, "%{public}@: Pushing to store: %{public}@ with storeRecord: %{public}@", v210, 0x20u);

      }
      _HKInitializeLogging();
      v162 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v163 = a1[13];
        v164 = v162;
        objc_msgSend(v163, "store");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "componentsJoinedByString:", CFSTR(", "));
        v166 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        v167 = objc_msgSend(v189, "count");
        objc_msgSend(v189, "allObjects");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "componentsJoinedByString:", CFSTR(", "));
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = objc_msgSend(v185, "count");
        objc_msgSend(v185, "allObjects");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "componentsJoinedByString:", CFSTR(", "));
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v210 = 138544898;
        *(_QWORD *)&v210[4] = a1;
        *(_WORD *)&v210[12] = 2114;
        *(_QWORD *)&v210[14] = v165;
        *(_WORD *)&v210[22] = 2114;
        v211 = v166;
        *(_WORD *)v212 = 2048;
        *(_QWORD *)&v212[2] = v167;
        *(_WORD *)&v212[10] = 2114;
        *(_QWORD *)&v212[12] = v169;
        v213 = 2048;
        v214 = v170;
        v215 = 2114;
        v216 = v172;
        _os_log_impl(&dword_1B7802000, v164, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Pushing to sequences (%{public}@) with %ld included sync identifiers: %{public}@ and %ld included sync identities: %{public}@", v210, 0x48u);

      }
      if (objc_msgSend(v186, "count"))
      {
        _HKInitializeLogging();
        v173 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v174 = a1[13];
          v175 = v173;
          objc_msgSend(v174, "store");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v187, "componentsJoinedByString:", CFSTR(", "));
          v177 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          v178 = objc_msgSend(v186, "count");
          objc_msgSend(v186, "allObjects");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "componentsJoinedByString:", CFSTR(", "));
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v210 = 138544386;
          *(_QWORD *)&v210[4] = a1;
          *(_WORD *)&v210[12] = 2114;
          *(_QWORD *)&v210[14] = v176;
          *(_WORD *)&v210[22] = 2114;
          v211 = v177;
          *(_WORD *)v212 = 2048;
          *(_QWORD *)&v212[2] = v178;
          *(_WORD *)&v212[10] = 2114;
          *(_QWORD *)&v212[12] = v180;
          _os_log_impl(&dword_1B7802000, v175, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Pushing to sequences (%{public}@) with %ld included child sync identities: %{public}@", v210, 0x34u);

        }
      }

      v83 = v190;
    }
    else
    {
      v195 = 0;
    }

  }
  else
  {
    v195 = 0;
  }

  return v195;
}

uint64_t __37__HDCloudSyncPushStoreOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

void __37__HDCloudSyncPushStoreOperation_main__block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  HDCloudSyncDeleteSequenceOperation *v8;
  void *v9;
  void *v10;
  HDCloudSyncDeleteSequenceOperation *v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1[13], "storeRecord");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "oldSequenceHeaderRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1[13], "storeRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentSequenceHeaderRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isActive");

    if (v6)
      v7 = v3 == 0;
    else
      v7 = 1;
    if (v7)
    {
      objc_msgSend(v1, "finishWithSuccess:error:", 1, 0);
    }
    else
    {
      v8 = [HDCloudSyncDeleteSequenceOperation alloc];
      objc_msgSend(v1, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v3;
      v16[0] = v1[13];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HDCloudSyncDeleteSequenceOperation initWithConfiguration:targetsBySequence:](v8, "initWithConfiguration:targetsBySequence:", v9, v10);

      v12 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69__HDCloudSyncPushStoreOperation__sequencePushesDidFinishSuccessfully__block_invoke;
      v14[3] = &unk_1E6CE77A0;
      v14[4] = v1;
      -[HDCloudSyncOperation setOnError:](v11, "setOnError:", v14);
      v13[0] = v12;
      v13[1] = 3221225472;
      v13[2] = __69__HDCloudSyncPushStoreOperation__sequencePushesDidFinishSuccessfully__block_invoke_2;
      v13[3] = &unk_1E6CE7778;
      v13[4] = v1;
      -[HDCloudSyncOperation setOnSuccess:](v11, "setOnSuccess:", v13);
      -[HDCloudSyncOperation start](v11, "start");

    }
  }
}

uint64_t __77__HDCloudSyncPushStoreOperation__currentOwnedSyncIdentitiesForPushWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

uint64_t __82__HDCloudSyncPushStoreOperation__currentOwnedChildSyncIdentitiesForPushWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncIdentityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v8, "childIdentitiesForCurrentSyncIdentityWithTransaction:error:", v6, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v19;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(id *)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
LABEL_3:
    v14 = 1;
    goto LABEL_4;
  }
  _HKInitializeLogging();
  v16 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v18 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v21 = v18;
    v22 = 2114;
    v23 = v10;
    _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get child sync identities from local storage: %{public}@", buf, 0x16u);
  }
  v17 = v10;
  v13 = v17;
  if (!v17)
    goto LABEL_3;
  if (a3)
  {
    v13 = objc_retainAutorelease(v17);
    v14 = 0;
    *a3 = v13;
  }
  else
  {
    _HKLogDroppedError();
    v14 = 0;
  }
LABEL_4:

  return v14;
}

- (HDCloudSyncCompoundOperation)_operationForNewSequenceRecord:(void *)a3 replacingSequence:(uint64_t)a4 isRebaseline:
{
  id v7;
  id v8;
  HDCloudSyncCompoundOperation *v9;
  void *v10;
  void *v11;
  HDCloudSyncCompoundOperation *v12;
  void *v13;
  void *v14;
  int v15;
  HDCloudSyncModifyRecordsOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HDCloudSyncModifyRecordsOperation *v21;
  HDCloudSyncStartSequenceOperation *v22;
  void *v23;
  void *v24;
  HDCloudSyncStartSequenceOperation *v25;
  HDCloudSyncPushSequenceOperation *v26;
  void *v27;
  void *v28;
  HDCloudSyncPushSequenceOperation *v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = [HDCloudSyncCompoundOperation alloc];
  objc_msgSend(a1, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cloudState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v9, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v10, v11, CFSTR("Setup & Push"), 0);

  objc_msgSend(v8, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15)
  {
    v16 = [HDCloudSyncModifyRecordsOperation alloc];
    objc_msgSend(a1, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[13], "container");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v16, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v17, v18, 0, v20);

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v12, "addOperation:transitionHandler:", v21, 0);
    v8 = 0;
  }
  v22 = [HDCloudSyncStartSequenceOperation alloc];
  objc_msgSend(a1, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cloudState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HDCloudSyncStartSequenceOperation initWithConfiguration:cloudState:target:sequence:replacingSequence:shouldClearRebaselineDeadline:](v22, "initWithConfiguration:cloudState:target:sequence:replacingSequence:shouldClearRebaselineDeadline:", v23, v24, a1[13], v7, v8, a4);

  v26 = [HDCloudSyncPushSequenceOperation alloc];
  objc_msgSend(a1, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cloudState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[HDCloudSyncPushSequenceOperation initWithConfiguration:cloudState:target:sequence:](v26, "initWithConfiguration:cloudState:target:sequence:", v27, v28, a1[13], v7);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v12, "addOperation:transitionHandler:", v25, 0);
  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v12, "addOperation:transitionHandler:", v29, &__block_literal_global_101);

  return v12;
}

void __95__HDCloudSyncPushStoreOperation__operationForNewSequenceRecord_replacingSequence_isRebaseline___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "sequenceState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSequenceState:", v5);

}

- (HDCloudSyncPushSequenceOperation)_operationForExistingSequenceRecord:(void *)a3 includedChildSyncIdentites:
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HDCloudSyncPushSequenceOperation *v13;
  void *v14;
  void *v15;
  HDCloudSyncPushSequenceOperation *v16;
  int v18;
  _QWORD *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "includedChildSyncIdentities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToSet:", v6);

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v6, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = a1;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating sequence record to include child sync identities: %{public}@.", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(v5, "setIncludedChildSyncIdentities:", v6);
  }
  v13 = [HDCloudSyncPushSequenceOperation alloc];
  objc_msgSend(a1, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cloudState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDCloudSyncPushSequenceOperation initWithConfiguration:cloudState:target:sequence:](v13, "initWithConfiguration:cloudState:target:sequence:", v14, v15, a1[13], v5);

  return v16;
}

uint64_t __69__HDCloudSyncPushStoreOperation__sequencePushesDidFinishSuccessfully__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

uint64_t __69__HDCloudSyncPushStoreOperation__sequencePushesDidFinishSuccessfully__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "cloudState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudState:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeState, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
