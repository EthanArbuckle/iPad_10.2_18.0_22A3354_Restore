@implementation HDCloudSyncManagerSyncTask

- (id)pipelineForRepository:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HDCloudSyncPipeline *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __int16 v17;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v18;
  void *v19;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v20;
  id v21;
  HDCloudSyncDetectSyncDisabledOperation *v22;
  void *v23;
  HDCloudSyncDetectSyncDisabledOperation *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  HDCloudSyncPipelineStageContextSyncPush *v40;
  void *v41;
  HDCloudSyncPipelineStageContextSyncPush *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  HDCloudSyncPipelineStageContextSyncPull *v47;
  void *v48;
  HDCloudSyncPipelineStageContextSyncPush *v49;
  HDCloudSyncPipelineStageContextSyncPush *v50;
  void *v51;
  HDCloudSyncPipelineStageContextSyncPull *v52;
  void *v53;
  HDCloudSyncPipelineStageContextSyncPull *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  HDCloudSyncPipelineStageStateSync *v64;
  void *v65;
  HDCloudSyncPipelineStageStateSync *v66;
  id v67;
  void *v68;
  HDCloudSyncPipelineStageSynchronize *v69;
  HDCloudSyncPipelineStageSynchronize *v70;
  void *v71;
  void *v72;
  HDCloudSyncPipelineStageSynchronize *v73;
  id v74;
  void *v75;
  HDCloudSyncPipelineStageCheckForRequiredProfileDeletion *v76;
  HDCloudSyncPipelineStageCheckForRequiredProfileDeletion *v77;
  void *v78;
  void *v79;
  char v80;
  void *v81;
  __int16 v82;
  HDCloudSyncPipelineStageCheckForRequiredProfileDeletion *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  int v88;
  HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState *v89;
  id v90;
  id v91;
  void *v92;
  HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState *v93;
  void *v94;
  void *v95;
  int v96;
  __objc2_class *v97;
  void *v98;
  int v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  HDCloudSyncPipelineStageMedicalID *v105;
  id v106;
  id v107;
  void *v108;
  char v109;
  void *v110;
  void *v111;
  int v112;
  HDCloudSyncPipelineStageMedicalID *v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  HDCloudSyncPipelineStagePush *v124;
  void *v125;
  HDCloudSyncPipelineStagePush *v126;
  HDCloudSyncPipelineStagePull *v127;
  void *v128;
  HDCloudSyncPipelineStagePull *v129;
  void *v130;
  int v131;
  HDCloudSyncPipelineStagePrepareForSync *v132;
  void *v133;
  HDCloudSyncPipelineStagePrepareForSync *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  int v139;
  void *v140;
  int v141;
  HDCloudSyncDeleteStoreOnChildOperation *v142;
  void *v143;
  HDCloudSyncDeleteStoreOnChildOperation *v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  id v149;
  id v150;
  void *v151;
  HDCloudSyncPipelineStageAttachments *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  char v157;
  void *v158;
  int v159;
  HDCloudSyncPipelineStageAttachments *v160;
  void *v162;
  void *v163;
  char v164;
  void *v165;
  void *v166;
  char v167;
  void *v168;
  void *v169;
  char v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  int v179;
  HDCloudSyncManagerSyncTask *v180;
  __int16 v181;
  void *v182;
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[HDCloudSyncManagerRepositoryTask context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = 138543618;
    v180 = self;
    v181 = 2114;
    v182 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting cloud sync task with context %{public}@", (uint8_t *)&v179, 0x16u);

  }
  v8 = [HDCloudSyncPipeline alloc];
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManagerPipelineTask accessibilityAssertion](self, "accessibilityAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncPipeline initForContext:repository:accessibilityAssertion:queue:](v8, "initForContext:repository:accessibilityAssertion:queue:", v9, v4, v10, v12);

  v14 = v13;
  v15 = v14;
  if (self)
  {
    -[HDCloudSyncManagerRepositoryTask context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "options");

    if ((v17 & 0x800) == 0)
    {
      v18 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
      objc_msgSend(v15, "operationConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v18, "initWithConfiguration:cloudState:", v19, 0);
      objc_msgSend(v15, "addStage:", v20);

    }
    v21 = v15;
    v22 = [HDCloudSyncDetectSyncDisabledOperation alloc];
    objc_msgSend(v21, "operationConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v22, "initWithConfiguration:cloudState:", v23, 0);

    -[HDCloudSyncOperation asPipelineStage](v24, "asPipelineStage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addStage:", v25);

    v26 = v4;
    v27 = v21;
    -[HDCloudSyncManagerRepositoryTask context](self, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "syncRequest");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = v29;
      objc_msgSend(v29, "contextSyncRequest");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_17;
    }
    else
    {

    }
    objc_msgSend(v26, "syncAvailability");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "shouldSyncDeviceContext");

    if (v33)
    {
      -[HDCloudSyncManagerRepositoryTask context](self, "context");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "syncRequest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v50 = [HDCloudSyncPipelineStageContextSyncPush alloc];
        objc_msgSend(v27, "operationConfiguration");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v50, "initWithConfiguration:cloudState:", v51, 0);

        -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v49, "setCriticalFailureOnError:", 0);
        objc_msgSend(v27, "addStage:", v49);
        v52 = [HDCloudSyncPipelineStageContextSyncPull alloc];
        objc_msgSend(v27, "operationConfiguration");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v52, "initWithConfiguration:cloudState:", v53, 0);

        -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v54, "setCriticalFailureOnError:", 0);
        objc_msgSend(v27, "addStage:", v54);

        goto LABEL_16;
      }
      -[HDCloudSyncManagerRepositoryTask context](self, "context");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "syncRequest");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "contextSyncRequest");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "push");

      if (v39)
      {
        v40 = [HDCloudSyncPipelineStageContextSyncPush alloc];
        objc_msgSend(v27, "operationConfiguration");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v40, "initWithConfiguration:cloudState:", v41, 0);

        -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v42, "setCriticalFailureOnError:", 0);
        objc_msgSend(v27, "addStage:", v42);

      }
      -[HDCloudSyncManagerRepositoryTask context](self, "context");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "syncRequest");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "contextSyncRequest");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "pull");

      if (v46)
      {
        v47 = [HDCloudSyncPipelineStageContextSyncPull alloc];
        objc_msgSend(v27, "operationConfiguration");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v47, "initWithConfiguration:cloudState:", v48, 0);

        -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v49, "setCriticalFailureOnError:", 0);
        objc_msgSend(v27, "addStage:", v49);
LABEL_16:

      }
    }
  }
  else
  {

    v171 = v4;
    v172 = v15;
  }
LABEL_17:

  v55 = v4;
  v56 = v15;
  v57 = v56;
  if (!self)
  {

    v173 = v57;
    v174 = v173;

    v175 = v55;
    v176 = v174;
    goto LABEL_50;
  }
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "syncRequest");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = v59;
    objc_msgSend(v59, "stateSyncRequest");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
      goto LABEL_23;
  }
  else
  {

  }
  objc_msgSend(v55, "syncAvailability");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "shouldSyncStateEntities");

  if (v63)
  {
    v64 = [HDCloudSyncPipelineStageStateSync alloc];
    objc_msgSend(v57, "operationConfiguration");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v64, "initWithConfiguration:cloudState:", v65, 0);

    -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v66, "setCriticalFailureOnError:", 0);
    objc_msgSend(v57, "addStage:", v66);

  }
LABEL_23:

  v67 = v57;
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "syncRequest");
  v69 = (HDCloudSyncPipelineStageSynchronize *)(id)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (!v69
    || (-[HDCloudSyncPipelineStageSynchronize summarySharingSyncRequest](v69, "summarySharingSyncRequest"),
        v71 = (void *)objc_claimAutoreleasedReturnValue(),
        v71,
        v71)
    || (-[HDCloudSyncPipelineStageSynchronize medicalIDSyncRequest](v70, "medicalIDSyncRequest"),
        v72 = (void *)objc_claimAutoreleasedReturnValue(),
        v72,
        v72))
  {

    goto LABEL_27;
  }
  -[HDCloudSyncPipelineStageSynchronize changesSyncRequest](v70, "changesSyncRequest");
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v168)
  {

    goto LABEL_28;
  }
  -[HDCloudSyncPipelineStageSynchronize changesSyncRequest](v70, "changesSyncRequest");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = objc_msgSend(v169, "lite");

  if ((v170 & 1) == 0)
  {
LABEL_27:
    v73 = [HDCloudSyncPipelineStageSynchronize alloc];
    objc_msgSend(v67, "operationConfiguration");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v73, "initWithConfiguration:cloudState:", v68, 0);
    objc_msgSend(v67, "addStage:", v70);
LABEL_28:

  }
  v74 = v67;
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "syncRequest");
  v76 = (HDCloudSyncPipelineStageCheckForRequiredProfileDeletion *)(id)objc_claimAutoreleasedReturnValue();
  if (!v76)
  {

LABEL_33:
    -[HDCloudSyncManagerRepositoryTask context](self, "context");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "options");

    if ((v82 & 0x200) == 0)
    {
      v83 = [HDCloudSyncPipelineStageCheckForRequiredProfileDeletion alloc];
      objc_msgSend(v74, "operationConfiguration");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v83, "initWithConfiguration:cloudState:", v75, 0);
      objc_msgSend(v74, "addStage:", v77);
LABEL_36:

      goto LABEL_37;
    }
    goto LABEL_37;
  }
  v77 = v76;
  -[HDCloudSyncPipelineStageCheckForRequiredProfileDeletion changesSyncRequest](v76, "changesSyncRequest");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v78)
  {

    goto LABEL_36;
  }
  -[HDCloudSyncPipelineStageCheckForRequiredProfileDeletion changesSyncRequest](v77, "changesSyncRequest");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "lite");

  if ((v80 & 1) == 0)
    goto LABEL_33;
LABEL_37:

  v84 = v55;
  v85 = v74;
  objc_msgSend(v84, "syncAvailability");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v86, "shouldSyncSummarySharingPull"))
  {

  }
  else
  {
    objc_msgSend(v84, "syncAvailability");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "shouldSyncSummarySharingPush");

    if (!v88)
      goto LABEL_50;
  }
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v89 = (HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState syncRequest](v89, "syncRequest");
  v90 = (id)objc_claimAutoreleasedReturnValue();
  v91 = v84;
  if (!v90
    || (objc_msgSend(v90, "summarySharingSyncRequest"),
        v92 = (void *)objc_claimAutoreleasedReturnValue(),
        v92,
        v92))
  {

    goto LABEL_43;
  }
  objc_msgSend(v90, "changesSyncRequest");
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v162)
  {

    goto LABEL_48;
  }
  objc_msgSend(v90, "changesSyncRequest");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = objc_msgSend(v163, "lite");

  if ((v164 & 1) == 0)
  {
LABEL_43:
    v93 = [HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState alloc];
    objc_msgSend(v85, "operationConfiguration");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v93, "initWithConfiguration:cloudState:", v94, 0);

    -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v89, "setCriticalFailureOnError:", 0);
    objc_msgSend(v91, "syncAvailability");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "shouldSyncSummarySharingPull");

    if (v96)
    {
      v97 = HDCloudSyncPipelineStageSharedSummaryPull;
    }
    else
    {
      objc_msgSend(v91, "syncAvailability");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "shouldSyncSummarySharingPush");

      if (!v99)
      {
LABEL_49:

        goto LABEL_50;
      }
      v97 = HDCloudSyncPipelineStageSharedSummaryPush;
    }
    v100 = [v97 alloc];
    objc_msgSend(v85, "operationConfiguration");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (id)objc_msgSend(v100, "initWithConfiguration:cloudState:", v101, 0);

    objc_msgSend(v90, "setCriticalFailureOnError:", 0);
    objc_msgSend(v85, "addStage:", v89);
    objc_msgSend(v85, "addStage:", v90);
LABEL_48:

    goto LABEL_49;
  }
LABEL_50:

  v102 = v55;
  v103 = v57;
  v104 = v103;
  if (self)
  {
    -[HDCloudSyncManagerRepositoryTask context](self, "context");
    v105 = (HDCloudSyncPipelineStageMedicalID *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncPipelineStageMedicalID syncRequest](v105, "syncRequest");
    v106 = (id)objc_claimAutoreleasedReturnValue();
    v107 = v102;
    objc_msgSend(v107, "behavior");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "isRealityDevice");

    if ((v109 & 1) != 0)
    {
LABEL_52:

LABEL_58:
      goto LABEL_59;
    }
    if (v106
      && (objc_msgSend(v106, "medicalIDSyncRequest"),
          v110 = (void *)objc_claimAutoreleasedReturnValue(),
          v110,
          !v110))
    {
      objc_msgSend(v106, "changesSyncRequest");
      v165 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v165)
        goto LABEL_52;
      objc_msgSend(v106, "changesSyncRequest");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(v166, "lite");

      if ((v167 & 1) != 0)
      {
LABEL_59:

        v115 = v107;
        v116 = v104;
        -[HDCloudSyncManagerRepositoryTask context](self, "context");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "syncRequest");
        v118 = (id)objc_claimAutoreleasedReturnValue();
        if (v118)
        {
          v119 = v118;
          objc_msgSend(v118, "changesSyncRequest");
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v120)
            goto LABEL_79;
        }
        else
        {

        }
        objc_msgSend(v115, "syncAvailability");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v121, "shouldPush"))
        {

        }
        else
        {
          objc_msgSend(v115, "syncAvailability");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = objc_msgSend(v122, "shouldPull");

          if (!v123)
            goto LABEL_79;
        }
        v124 = [HDCloudSyncPipelineStagePush alloc];
        objc_msgSend(v116, "operationConfiguration");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = -[HDCloudSyncPipelineStagePush initWithConfiguration:cloudState:](v124, "initWithConfiguration:cloudState:", v125, 0);

        -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v126, "setCriticalFailureOnError:", 0);
        v127 = [HDCloudSyncPipelineStagePull alloc];
        objc_msgSend(v116, "operationConfiguration");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = -[HDCloudSyncPipelineStagePull initWithConfiguration:cloudState:](v127, "initWithConfiguration:cloudState:", v128, 0);

        -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v129, "setCriticalFailureOnError:", 0);
        -[HDCloudSyncManagerRepositoryTask context](self, "context");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = objc_msgSend(v130, "isFastPushOrPull");

        v132 = [HDCloudSyncPipelineStagePrepareForSync alloc];
        objc_msgSend(v116, "operationConfiguration");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v132, "initWithConfiguration:cloudState:", v133, 0);
        objc_msgSend(v116, "addStage:", v134);

        if (v131)
        {
          -[HDCloudSyncManagerRepositoryTask context](self, "context");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v135, "options") & 0x80) != 0)
          {
            objc_msgSend(v115, "syncAvailability");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = objc_msgSend(v140, "shouldPush");

            if (v141)
            {
              v142 = [HDCloudSyncDeleteStoreOnChildOperation alloc];
              objc_msgSend(v116, "operationConfiguration");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              v144 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v142, "initWithConfiguration:cloudState:", v143, 0);
              -[HDCloudSyncOperation asPipelineStage](v144, "asPipelineStage");
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "addStage:", v145);

              objc_msgSend(v116, "addStage:", v126);
            }
          }
          else
          {

          }
          -[HDCloudSyncManagerRepositoryTask context](self, "context");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v146, "options") & 0x1000) == 0)
          {

LABEL_78:
            goto LABEL_79;
          }
          objc_msgSend(v115, "syncAvailability");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v148 = objc_msgSend(v147, "shouldPull");

          if (!v148)
            goto LABEL_78;
        }
        else
        {
          objc_msgSend(v115, "syncAvailability");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = objc_msgSend(v136, "shouldPush");

          if (v137)
            objc_msgSend(v116, "addStage:", v126);
          objc_msgSend(v115, "syncAvailability");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = objc_msgSend(v138, "shouldPull");

          if (!v139)
            goto LABEL_78;
        }
        objc_msgSend(v116, "addStage:", v129);
        goto LABEL_78;
      }
    }
    else
    {

    }
    objc_msgSend(v107, "syncAvailability");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v111, "shouldSyncMedicalID");

    if (!v112)
      goto LABEL_59;
    v113 = [HDCloudSyncPipelineStageMedicalID alloc];
    objc_msgSend(v104, "operationConfiguration");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v113, "initWithConfiguration:cloudState:", v114, 0);

    -[HDCloudSyncPipelineStage setCriticalFailureOnError:](v105, "setCriticalFailureOnError:", 0);
    objc_msgSend(v104, "addStage:", v105);
    goto LABEL_58;
  }

  v177 = v102;
  v178 = v104;
LABEL_79:

  v149 = v102;
  v150 = v104;
  if (!self)
    goto LABEL_90;
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "syncRequest");
  v152 = (HDCloudSyncPipelineStageAttachments *)(id)objc_claimAutoreleasedReturnValue();
  v153 = v149;
  v154 = v153;
  if (!v152)
  {

LABEL_84:
    -[HDCloudSyncManagerRepositoryTask context](self, "context");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v151, "options") & 0x800) != 0)
    {
LABEL_89:

      goto LABEL_90;
    }
    objc_msgSend(v154, "syncAvailability");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = objc_msgSend(v158, "shouldSyncAttachments");

    if (v159)
    {
      v160 = [HDCloudSyncPipelineStageAttachments alloc];
      objc_msgSend(v150, "operationConfiguration");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v160, "initWithConfiguration:cloudState:", v151, 0);
      objc_msgSend(v150, "addStage:", v152);
LABEL_88:

      goto LABEL_89;
    }
    goto LABEL_90;
  }
  -[HDCloudSyncPipelineStageAttachments changesSyncRequest](v152, "changesSyncRequest");
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v155)
  {

    goto LABEL_88;
  }
  -[HDCloudSyncPipelineStageAttachments changesSyncRequest](v152, "changesSyncRequest");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v156, "lite");

  if ((v157 & 1) == 0)
    goto LABEL_84;
LABEL_90:

  return v150;
}

- (void)didFinishWithSuccess
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateErrorRequiringUserAction:", 0);

  -[HDCloudSyncManagerPipelineTask callCompletionWithSuccess:error:](self, "callCompletionWithSuccess:error:", 1, 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HDCloudSyncManagerTask mirroringTasks](self, "mirroringTasks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "didFinishWithSuccess");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)didFailWithErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateErrorRequiringUserAction:", v6);

  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManagerPipelineTask callCompletionWithSuccess:error:](self, "callCompletionWithSuccess:error:", 0, v7);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HDCloudSyncManagerTask mirroringTasks](self, "mirroringTasks", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "didFailWithErrors:", v4);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)combineWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEquivalent:", v6) & 1) == 0)
  {

    goto LABEL_6;
  }
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profileIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v9, "isEqual:", v12);

  if (!v15)
  {
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "mirrorTask:", self);
  v13 = 1;
LABEL_7:

  return v13;
}

@end
