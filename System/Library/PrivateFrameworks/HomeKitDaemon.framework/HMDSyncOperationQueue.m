@implementation HMDSyncOperationQueue

- (id)initName:(id)a3 syncManager:(id)a4 initialDelay:(double)a5 initialBackoff:(double)a6 hasBackoff:(BOOL)a7
{
  id v13;
  id v14;
  HMDSyncOperationQueue *v15;
  HMDSyncOperationQueue *v16;
  uint64_t v17;
  NSMutableArray *stagedOperations;
  uint64_t v19;
  NSMutableArray *waitingOperations;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HMDSyncOperationQueue;
  v15 = -[HMDSyncOperationQueue init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeWeak((id *)&v16->_manager, v14);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    stagedOperations = v16->_stagedOperations;
    v16->_stagedOperations = (NSMutableArray *)v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    waitingOperations = v16->_waitingOperations;
    v16->_waitingOperations = (NSMutableArray *)v19;

    v16->_initialDelay = a5;
    v16->_initialBackoff = a6;
    v16->_hasExponentialBackoff = a7;
  }

  return v16;
}

- (NSArray)stagedOperations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_stagedOperations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)waitingOperations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_waitingOperations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)_addStagedOperation:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_stagedOperations, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_removeStagedOperation:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_stagedOperations, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_addWaitingOperation:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_waitingOperations, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_removeWaitingOperation:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_waitingOperations, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[HMDSyncOperationQueue name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %@, Staged Operations = %@, Waiting Operations = %@>"), v5, v6, self->_stagedOperations, self->_waitingOperations);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v7;
}

- (int64_t)countTotal
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  int64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableArray count](self->_stagedOperations, "count");
  v5 = -[NSMutableArray count](self->_waitingOperations, "count") + v4;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[HMDSyncOperationQueue stagedOperations](self, "stagedOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)_createBackoffTimer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (-[HMDSyncOperationQueue hasExponentialBackoff](self, "hasExponentialBackoff"))
  {
    -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc(MEMORY[0x24BE3F170]);
      -[HMDSyncOperationQueue initialBackoff](self, "initialBackoff");
      v5 = (void *)objc_msgSend(v4, "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", cloudUploadTimerIntervalExponentialFactor, 1);
      -[HMDSyncOperationQueue setBackoffTimer:](self, "setBackoffTimer:", v5);

      -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDSyncOperationQueue manager](self, "manager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", v6);

    }
  }
}

- (void)resetBackoffTimer
{
  void *v3;
  void *v4;

  -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[HMDSyncOperationQueue setBackoffTimer:](self, "setBackoffTimer:", 0);
  }
}

- (void)_addOperation:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  HMDSyncOperationQueue *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *k;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  HMDSyncOperationQueue *v47;
  NSObject *v48;
  void *v49;
  const char *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  HMDSyncOperationQueue *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  HMDSyncOperationQueue *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  HMDSyncOperationQueue *v74;
  void *v75;
  const char *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  HMDSyncOperationQueue *v86;
  _BOOL4 v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  HMDSyncOperationQueue *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  char v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  HMDSyncOperationQueue *v106;
  _BOOL4 v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  HMDSyncOperationQueue *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  void *v124;
  uint64_t v125;
  void *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t v139[128];
  uint8_t buf[4];
  void *v141;
  __int16 v142;
  id v143;
  __int16 v144;
  void *v145;
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  -[HMDSyncOperationQueue stagedOperations](self, "stagedOperations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v136;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v136 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(v4, "zoneName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "zoneName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          objc_msgSend(v4, "options");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isDelayRespected");

          v16 = (void *)MEMORY[0x227676638]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
          if (!v15)
          {
            if (v19)
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v141 = v35;
              _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Dropping new operation, already have staged operation", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v16);
            objc_msgSend(v4, "options");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "isCloudConflict");

            if (v37)
            {
              objc_msgSend(v4, "options");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "isCloudConflict");
              objc_msgSend(v10, "options");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setCloudConflict:", v39);

            }
            objc_msgSend(v4, "operationCompletions");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v10;
            goto LABEL_92;
          }
          if (v19)
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v141 = v20;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Dropping staged operation, new operation has longer delay that must be respected", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v16);
          -[HMDSyncOperationQueue _removeStagedOperation:](v17, "_removeStagedOperation:", v10);
          objc_msgSend(v10, "options");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isCloudConflict");

          if (v22)
          {
            objc_msgSend(v10, "options");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isCloudConflict");
            objc_msgSend(v4, "options");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setCloudConflict:", v24);

          }
          objc_msgSend(v10, "operationCompletions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "updateOperationCompletionsWithArray:", v26);

          goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_16:

  objc_msgSend(v4, "delayTimer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    v129 = 0uLL;
    v130 = 0uLL;
    *((_QWORD *)&v127 + 1) = 0;
    v128 = 0uLL;
    -[HMDSyncOperationQueue waitingOperations](self, "waitingOperations", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
    if (!v52)
      goto LABEL_44;
    v53 = v52;
    v54 = *(_QWORD *)v128;
    while (1)
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v128 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
        objc_msgSend(v4, "zoneName");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "zoneName");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v57, "isEqualToString:", v58);

        if (v59)
        {
          v60 = (void *)MEMORY[0x227676638]();
          v61 = self;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "zoneName");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v141 = v63;
            v142 = 2112;
            v143 = v64;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Dropping scheduled operation, new operation being added directly to staged for %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v60);
          v5 = v56;

          if (v5)
          {
            objc_msgSend(v5, "options");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "isDelayRespected");

            if (v66)
            {
              v67 = (void *)MEMORY[0x227676638]();
              v68 = v61;
              HMFGetOSLogHandle();
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v141 = v70;
                _os_log_impl(&dword_2218F0000, v69, OS_LOG_TYPE_INFO, "%{public}@Dropping new operation, found operation has delay that must respected", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v67);
LABEL_91:
              objc_msgSend(v4, "operationCompletions");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v5;
LABEL_92:
              objc_msgSend(v42, "updateOperationCompletionsWithArray:", v41);
              goto LABEL_93;
            }
            objc_msgSend(v5, "delayTimer");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "suspend");

            objc_msgSend(v5, "setDelayTimer:", 0);
            -[HMDSyncOperationQueue _removeWaitingOperation:](v61, "_removeWaitingOperation:", v5);
            objc_msgSend(v5, "options");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend(v89, "isCloudConflict");

            if (v90)
            {
              objc_msgSend(v5, "options");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = objc_msgSend(v91, "isCloudConflict");
              objc_msgSend(v4, "options");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "setCloudConflict:", v92);

            }
            objc_msgSend(v5, "operationCompletions");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "updateOperationCompletionsWithArray:", v51);
LABEL_66:

          }
          v94 = (void *)MEMORY[0x227676638]();
          v95 = self;
          HMFGetOSLogHandle();
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v141 = v97;
            v142 = 2112;
            v143 = v4;
            _os_log_impl(&dword_2218F0000, v96, OS_LOG_TYPE_INFO, "%{public}@Schedule operation without delay %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v94);
          -[HMDSyncOperationQueue _addStagedOperation:](v95, "_addStagedOperation:", v4);
          goto LABEL_94;
        }
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
      if (!v53)
      {
LABEL_44:
        v5 = 0;
        goto LABEL_66;
      }
    }
  }
  v133 = 0uLL;
  v134 = 0uLL;
  v131 = 0uLL;
  v132 = 0uLL;
  -[HMDSyncOperationQueue waitingOperations](self, "waitingOperations");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
  if (!v5)
    goto LABEL_80;
  v29 = *(_QWORD *)v132;
  while (2)
  {
    for (k = 0; k != v5; k = (char *)k + 1)
    {
      if (*(_QWORD *)v132 != v29)
        objc_enumerationMutation(v28);
      v31 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)k);
      objc_msgSend(v4, "zoneName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "zoneName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqualToString:", v33);

      if ((v34 & 1) != 0)
      {
        v5 = v31;

        if (!v5)
          goto LABEL_81;
        objc_msgSend(v4, "options");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v43, "isDelayRespected") & 1) != 0)
        {
          objc_msgSend(v5, "options");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isDelayRespected");

          if ((v45 & 1) == 0)
          {
            v46 = (void *)MEMORY[0x227676638]();
            v47 = self;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v141 = v49;
              v50 = "%{public}@Dropping found operation, must respect delay for new operation";
LABEL_76:
              _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, v50, buf, 0xCu);

              goto LABEL_77;
            }
            goto LABEL_77;
          }
        }
        else
        {

        }
        objc_msgSend(v4, "options");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v71, "isDelayRespected"))
        {

        }
        else
        {
          objc_msgSend(v5, "options");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "isDelayRespected");

          if (v73)
          {
            v46 = (void *)MEMORY[0x227676638]();
            v74 = self;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              goto LABEL_89;
            HMFGetLogIdentifier();
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v141 = v75;
            v76 = "%{public}@Dropping new operation, must respect delay for found operation";
            goto LABEL_88;
          }
        }
        objc_msgSend(v4, "options");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v77, "isDelayRespected") & 1) != 0)
        {
          objc_msgSend(v5, "options");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "isDelayRespected");

          if (v79)
          {
            objc_msgSend(v5, "delayTimer");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "timeInterval");
            v82 = v81;
            objc_msgSend(v4, "delayTimer");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "timeInterval");
            v85 = v84;

            v46 = (void *)MEMORY[0x227676638]();
            v86 = self;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            v87 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
            if (v82 < v85)
            {
              if (v87)
              {
                HMFGetLogIdentifier();
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v141 = v49;
                v50 = "%{public}@Dropping found operation, new operation delay is longer and must respected";
                goto LABEL_76;
              }
LABEL_77:

              objc_autoreleasePoolPop(v46);
              objc_msgSend(v5, "delayTimer");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "suspend");

              objc_msgSend(v5, "setDelayTimer:", 0);
              -[HMDSyncOperationQueue _removeWaitingOperation:](self, "_removeWaitingOperation:", v5);
              objc_msgSend(v5, "options");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = objc_msgSend(v109, "isCloudConflict");

              if (v110)
              {
                objc_msgSend(v5, "options");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                v112 = objc_msgSend(v111, "isCloudConflict");
                objc_msgSend(v4, "options");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "setCloudConflict:", v112);

              }
              objc_msgSend(v5, "operationCompletions");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "updateOperationCompletionsWithArray:", v28);
              goto LABEL_80;
            }
            if (v87)
            {
              HMFGetLogIdentifier();
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v141 = v75;
              v76 = "%{public}@Dropping new operation, found operation delay is longer and must respected";
LABEL_88:
              _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, v76, buf, 0xCu);

              goto LABEL_89;
            }
            goto LABEL_89;
          }
        }
        else
        {

        }
        objc_msgSend(v4, "options");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "isDelayRespected") & 1) != 0)
          goto LABEL_80;
        objc_msgSend(v5, "options");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_msgSend(v98, "isDelayRespected");

        if ((v99 & 1) != 0)
          goto LABEL_81;
        objc_msgSend(v5, "delayTimer");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "timeInterval");
        v102 = v101;
        objc_msgSend(v4, "delayTimer");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "timeInterval");
        v105 = v104;

        v46 = (void *)MEMORY[0x227676638]();
        v106 = self;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        v107 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
        if (v102 > v105)
        {
          if (v107)
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v141 = v49;
            v50 = "%{public}@Dropping found operation, new operation delay is shorter";
            goto LABEL_76;
          }
          goto LABEL_77;
        }
        if (v107)
        {
          HMFGetLogIdentifier();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v141 = v75;
          v76 = "%{public}@Dropping new operation, found operation delay is shorter";
          goto LABEL_88;
        }
LABEL_89:

        objc_autoreleasePoolPop(v46);
        objc_msgSend(v4, "options");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend(v122, "isCloudConflict");

        if (v123)
        {
          objc_msgSend(v4, "options");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = objc_msgSend(v124, "isCloudConflict");
          objc_msgSend(v5, "options");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "setCloudConflict:", v125);

        }
        goto LABEL_91;
      }
    }
    v5 = (id)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
    if (v5)
      continue;
    break;
  }
LABEL_80:

LABEL_81:
  v114 = (void *)MEMORY[0x227676638]();
  v115 = self;
  HMFGetOSLogHandle();
  v116 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delayTimer");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "timeInterval");
    v120 = v119;
    objc_msgSend(v5, "zoneName");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v141 = v117;
    v142 = 2048;
    v143 = v120;
    v144 = 2112;
    v145 = v121;
    _os_log_impl(&dword_2218F0000, v116, OS_LOG_TYPE_INFO, "%{public}@Schedule operation with delay %g: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v114);
  -[HMDSyncOperationQueue _addWaitingOperation:](v115, "_addWaitingOperation:", v4);
  objc_msgSend(v4, "delayTimer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "resume");
LABEL_93:

LABEL_94:
}

- (void)addOperation:(id)a3 withDelay:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  HMDSyncOperationQueue *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(double);
  void *v18;
  void *v19;
  void (**v20)(double);
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    -[HMDSyncOperationQueue manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDSyncOperationQueue hasExponentialBackoff](self, "hasExponentialBackoff"))
    {
      -[HMDSyncOperationQueue initialDelay](self, "initialDelay");
      v9 = v8;
      -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeInterval");
        v9 = v12;

      }
      if (v9 >= a4)
        a4 = v9;
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v16;
        v25 = 2048;
        v26 = a4;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Current delay is %g", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      if (a4 > 0.0)
      {
        objc_msgSend(v7, "timerFactory");
        v17 = (void (**)(double))objc_claimAutoreleasedReturnValue();
        v17[2](a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setDelayTimer:", v18);

        objc_msgSend(v6, "delayTimer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setDelegate:", v7);

      }
      -[HMDSyncOperationQueue _createBackoffTimer](v14, "_createBackoffTimer");
    }
    else if (a4 > 0.0)
    {
      objc_msgSend(v7, "timerFactory");
      v20 = (void (**)(double))objc_claimAutoreleasedReturnValue();
      v20[2](a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDelayTimer:", v21);

      objc_msgSend(v6, "delayTimer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setDelegate:", v7);

    }
    -[HMDSyncOperationQueue _addOperation:](self, "_addOperation:", v6);

  }
}

- (void)stageOperation:(id)a3
{
  if (a3)
    -[HMDSyncOperationQueue _addOperation:](self, "_addOperation:");
}

- (void)dropOperation:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    v7 = v4;
    os_unfair_lock_lock_with_options();
    if (-[NSMutableArray containsObject:](self->_waitingOperations, "containsObject:", v7))
    {
      -[NSMutableArray removeObject:](self->_waitingOperations, "removeObject:", v7);
      objc_msgSend(v7, "delayTimer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "suspend");

      objc_msgSend(v7, "setDelayTimer:", 0);
    }
    else if (-[NSMutableArray containsObject:](self->_stagedOperations, "containsObject:", v7))
    {
      -[NSMutableArray removeObject:](self->_stagedOperations, "removeObject:", v7);
    }
    os_unfair_lock_unlock(p_lock);
    v4 = v7;
  }

}

- (void)dropAllOperations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDSyncOperationQueue waitingOperations](self, "waitingOperations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "delayTimer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "suspend");

        objc_msgSend(v7, "setDelayTimer:", 0);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_stagedOperations, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_waitingOperations, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)processFiredTimer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  BOOL v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  HMDSyncOperationQueue *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "suspend");

    if (!-[HMDSyncOperationQueue countTotal](self, "countTotal"))
      -[HMDSyncOperationQueue setBackoffTimer:](self, "setBackoffTimer:", 0);
    v13 = 1;
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[HMDSyncOperationQueue waitingOperations](self, "waitingOperations", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        objc_msgSend(v10, "delayTimer");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v11 == v4;

        if (v12)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = v10;
      objc_msgSend(v14, "delayTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "suspend");

      objc_msgSend(v14, "setDelayTimer:", 0);
      if (!v14)
      {
        v13 = 0;
        goto LABEL_20;
      }
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Sync queue delay timer fired, staging %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      os_unfair_lock_lock_with_options();
      -[NSMutableArray removeObject:](v17->_waitingOperations, "removeObject:", v14);
      -[NSMutableArray addObject:](v17->_stagedOperations, "addObject:", v14);
      os_unfair_lock_unlock(&v17->_lock);
      v13 = 1;
      v6 = v14;
    }
    else
    {
LABEL_10:
      v13 = 0;
    }

  }
LABEL_20:

  return v13;
}

- (BOOL)isInMaximumTimeInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  BOOL v9;

  -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeInterval");
    v6 = v5;
    -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maximumTimeInterval");
    v9 = v6 >= v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)nextOperation
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDSyncOperationQueue stagedOperations](self, "stagedOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "count");

  if (v4)
  {
    os_unfair_lock_lock_with_options();
    -[NSMutableArray objectAtIndex:](self->_stagedOperations, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_stagedOperations, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(&self->_lock);
    -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resume");

  }
  return v4;
}

- (id)allOperations
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  objc_msgSend(v3, "addObjectsFromArray:", self->_stagedOperations);
  objc_msgSend(v3, "addObjectsFromArray:", self->_waitingOperations);
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (id)operationsToCancel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDSyncOperationQueue waitingOperations](self, "waitingOperations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "delayTimer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "suspend");

        objc_msgSend(v8, "setDelayTimer:", 0);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[HMDSyncOperationQueue backoffTimer](self, "backoffTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suspend");

  -[HMDSyncOperationQueue setBackoffTimer:](self, "setBackoffTimer:", 0);
  -[HMDSyncOperationQueue allOperations](self, "allOperations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_stagedOperations, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_waitingOperations, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (HMFExponentialBackoffTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimer, a3);
}

- (HMDSyncOperationManager)manager
{
  return (HMDSyncOperationManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (double)initialBackoff
{
  return self->_initialBackoff;
}

- (void)setInitialBackoff:(double)a3
{
  self->_initialBackoff = a3;
}

- (BOOL)hasExponentialBackoff
{
  return self->_hasExponentialBackoff;
}

- (void)setHasExponentialBackoff:(BOOL)a3
{
  self->_hasExponentialBackoff = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_waitingOperations, 0);
  objc_storeStrong((id *)&self->_stagedOperations, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_132114 != -1)
    dispatch_once(&logCategory__hmf_once_t28_132114, &__block_literal_global_132115);
  return (id)logCategory__hmf_once_v29_132116;
}

void __36__HMDSyncOperationQueue_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v29_132116;
  logCategory__hmf_once_v29_132116 = v0;

}

@end
