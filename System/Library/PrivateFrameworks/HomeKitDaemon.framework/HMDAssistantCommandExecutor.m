@implementation HMDAssistantCommandExecutor

- (HMDAssistantCommandExecutor)initWithCommand:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDAssistantCommandExecutor *v12;
  HMDAssistantCommandExecutor *v13;
  uint64_t v14;
  NSMutableArray *actionResults;
  uint64_t v16;
  NSMutableDictionary *pendingCommands;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDAssistantCommandExecutor;
  v12 = -[HMDAssistantCommandExecutor init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_initialCommand, a3);
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeStrong((id *)&v13->_msgDispatcher, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    actionResults = v13->_actionResults;
    v13->_actionResults = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingCommands = v13->_pendingCommands;
    v13->_pendingCommands = (NSMutableDictionary *)v16;

  }
  return v13;
}

- (void)performWithCompletion:(id)a3
{
  const char *v4;
  NSObject *workQueue;
  void *v6;
  double v7;
  double v8;
  void *v9;
  HMDAssistantCommandExecutor *v10;
  NSObject *v11;
  void *v12;
  HMDAssistantCommand *v13;
  void *v14;
  HMFTimer *v15;
  HMFTimer *executionTimer;
  HMFTimer *v17;
  OS_dispatch_queue *v18;
  HMDAssistantCommand *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  BOOL v33;
  void *v34;
  id v35;
  HMDAssistantCommand *v36;
  NSMutableDictionary *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableDictionary *v52;
  void *v53;
  void *v54;
  HMDAssistantCommandExecutor *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  id newValue;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD block[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  void *v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  uint8_t v91[4];
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  newValue = a3;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    goto LABEL_50;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_executionTimer)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__HMDAssistantCommandExecutor_performWithCompletion___block_invoke;
    block[3] = &unk_24E799CC8;
    v74 = newValue;
    dispatch_async(workQueue, block);

    goto LABEL_50;
  }
  objc_setProperty_nonatomic_copy(self, v4, newValue, 64);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[HMDAssistantCommand commandTimeout](self->_initialCommand, "commandTimeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7 / 1000.0;

  if (v8 + -2.0 < 3.0)
  {
    v9 = (void *)MEMORY[0x227676638](v8 + -2.0);
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_initialCommand;
      -[HMDAssistantCommand timeout](v13, "timeout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v88 = v12;
      v89 = 2112;
      v90 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Timeout %@ specified by Siri Command is below threshold, falling back to default timeout", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = *(double *)&assistantClientReadWriteTimeoutSeconds;
  }
  v15 = (HMFTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 19, v8);
  executionTimer = self->_executionTimer;
  self->_executionTimer = v15;

  -[HMFTimer setDelegate:](self->_executionTimer, "setDelegate:", self);
  v17 = self->_executionTimer;
  v18 = self->_workQueue;
  -[HMFTimer setDelegateQueue:](v17, "setDelegateQueue:", v18);

  -[HMFTimer resume](self->_executionTimer, "resume");
  v19 = self->_initialCommand;
  -[HMDAssistantCommand actionRequests](v19, "actionRequests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {

  }
  else
  {
    -[HMDAssistantCommand actions](self->_initialCommand, "actions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
    {
      v54 = (void *)MEMORY[0x227676638]();
      v55 = self;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v91 = 138543362;
        v92 = v57;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@No actions to perform", v91, 0xCu);

      }
      objc_autoreleasePoolPop(v54);
LABEL_48:
      dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
      v35 = objc_alloc_init(MEMORY[0x24BE812B8]);
      objc_msgSend(v35, "setCommandOutcome:", *MEMORY[0x24BE81EA8]);
      -[HMDAssistantCommand serverValidity](self->_initialCommand, "serverValidity");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setServerValidity:", v58);

      objc_msgSend(v35, "dictionary");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAssistantCommandExecutor _sendResponse:]((uint64_t)self, v59);

      goto LABEL_49;
    }
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[HMDAssistantCommand actionRequests](self->_initialCommand, "actionRequests");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v80 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        objc_msgSend(v27, "actions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v76;
          while (2)
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v76 != v30)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "aceId");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32 == 0;

              if (v33)
              {

                goto LABEL_48;
              }
            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
            if (v29)
              continue;
            break;
          }
        }

      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
    }
    while (v24);

    if (!-[HMDAssistantCommandExecutor _initialCommandIsMultipleActions]((uint64_t)self))
      goto LABEL_27;
  }
  else
  {

    if (!-[HMDAssistantCommandExecutor _initialCommandIsMultipleActions]((uint64_t)self))
    {
LABEL_27:
      -[HMDAssistantCommand actions](self->_initialCommand, "actions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v35 = (id)objc_claimAutoreleasedReturnValue();

      v36 = self->_initialCommand;
      v37 = self->_pendingCommands;
      objc_msgSend(v35, "aceId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v36, v38);

      -[HMDAssistantCommandExecutor _executeCommand:]((id *)&self->super.isa, self->_initialCommand);
LABEL_49:

      goto LABEL_50;
    }
  }
  -[HMDAssistantCommand homeManager](self->_initialCommand, "homeManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[HMDAssistantCommand actionRequests](self->_initialCommand, "actionRequests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
  if (v63)
  {
    v62 = *(_QWORD *)v70;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v70 != v62)
        {
          v41 = v40;
          objc_enumerationMutation(obj);
          v40 = v41;
        }
        v64 = v40;
        v42 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v40);
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v42, "actions");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v66;
          do
          {
            for (k = 0; k != v44; ++k)
            {
              if (*(_QWORD *)v66 != v45)
                objc_enumerationMutation(v43);
              v47 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
              -[HMDAssistantCommandExecutor _command](self, "_command");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAssistantCommand serverValidity](self->_initialCommand, "serverValidity");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setServerValidity:", v49);

              objc_msgSend(v42, "filter");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setFilter:", v50);

              v83 = v47;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setActions:", v51);

              objc_msgSend(v48, "setHomeManager:", v39);
              v52 = self->_pendingCommands;
              objc_msgSend(v47, "aceId");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", v48, v53);

              -[HMDAssistantCommandExecutor _executeCommand:]((id *)&self->super.isa, v48);
            }
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
          }
          while (v44);
        }

        v40 = v64 + 1;
      }
      while (v64 + 1 != v63);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
    }
    while (v63);
  }

LABEL_50:
}

- (id)_command
{
  return objc_alloc_init(HMDAssistantCommand);
}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  HMFTimer *executionTimer;
  void *v6;
  HMDAssistantCommandExecutor *v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *pendingCommands;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    executionTimer = self->_executionTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    executionTimer = 0;
  }
  if (executionTimer == v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Timer expired - reporting results", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    if (self)
    {
      -[HMFTimer suspend](v7->_executionTimer, "suspend");
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      pendingCommands = v7->_pendingCommands;
    }
    else
    {
      objc_msgSend(0, "suspend");
      pendingCommands = 0;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
    }
    v11 = pendingCommands;
    v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          if (self)
            v16 = v7->_pendingCommands;
          else
            v16 = 0;
          -[NSMutableDictionary objectForKey:](v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeoutAndReportResults");

          ++v15;
        }
        while (v13 != v15);
        v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v13 = v18;
      }
      while (v18);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_executionTimer, 0);
  objc_storeStrong((id *)&self->_clientValidity, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_initialCommand, 0);
}

void __53__HMDAssistantCommandExecutor_performWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)_initialCommandIsMultipleActions
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "actions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") == 0;

  return v2;
}

- (void)_executeCommand:(id *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v4 = a1[1];
    objc_msgSend(v4, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gatherer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[3];
    v8 = a1[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__HMDAssistantCommandExecutor__executeCommand___block_invoke;
    v9[3] = &unk_24E7861E8;
    objc_copyWeak(&v11, &location);
    v10 = v3;
    objc_msgSend(v10, "performWithGather:queue:msgDispatcher:completion:", v6, v7, v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __47__HMDAssistantCommandExecutor__executeCommand___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[3]);
    objc_msgSend(*(id *)(a1 + 32), "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(*(id *)(v5 + 40), "removeObjectForKey:", v8);
    if (!v3)
    {
      v10 = (void *)MEMORY[0x227676638](v9);
      v11 = (id)v5;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v13;
        v32 = 2112;
        v33 = v8;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Nil response for action %@", (uint8_t *)&v30, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }
    if (-[HMDAssistantCommandExecutor _initialCommandIsMultipleActions](v5))
    {
      v14 = *(void **)(a1 + 32);
      v15 = v3;
      v16 = v14;
      if (v3)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE812B8]), "initWithDictionary:", v15);
        objc_msgSend(v17, "clientValidity");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(v5 + 48);
        *(_QWORD *)(v5 + 48) = v18;

        objc_msgSend(v17, "commandOutcome");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (mapToFailureActionOutcome_onceToken != -1)
          dispatch_once(&mapToFailureActionOutcome_onceToken, &__block_literal_global_122739);
        objc_msgSend((id)mapToFailureActionOutcome_outcomeMap, "objectForKey:", v20);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          failedActionResultFor(v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setOutcome:", v21);
          objc_msgSend(*(id *)(v5 + 32), "addObject:", v22);
        }
        else
        {
          v23 = *(id *)(v5 + 32);
          objc_msgSend(v17, "actionResults");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObjectsFromArray:", v22);

        }
      }
      else
      {
        v21 = *(id *)(v5 + 32);
        failedActionResultFor(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v17);
      }

      if (!objc_msgSend(*(id *)(v5 + 40), "count"))
      {
        v24 = *(NSObject **)(v5 + 24);
        v25 = (id)*MEMORY[0x24BE81EB0];
        dispatch_assert_queue_V2(v24);
        v26 = objc_alloc_init(MEMORY[0x24BE812B8]);
        objc_msgSend(v26, "setCommandOutcome:", v25);

        v27 = (void *)objc_msgSend(*(id *)(v5 + 32), "copy");
        objc_msgSend(v26, "setActionResults:", v27);

        objc_msgSend(*(id *)(v5 + 8), "serverValidity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setServerValidity:", v28);

        objc_msgSend(v26, "setClientValidity:", *(_QWORD *)(v5 + 48));
        objc_msgSend(v26, "dictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantCommandExecutor _sendResponse:](v5, v29);

      }
    }
    else
    {
      -[HMDAssistantCommandExecutor _sendResponse:](v5, v3);
    }

  }
}

- (void)_sendResponse:(uint64_t)a1
{
  id v3;
  void *v4;
  void (**v5)(id, id, _QWORD);
  SEL v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    v5 = v4;
    objc_setProperty_nonatomic_copy((id)a1, v6, 0, 64);
    v5[2](v5, v3, 0);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = (id)a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Results already reported for Siri command - aborting report", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

+ (id)executorWithCommand:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDAssistantCommandExecutor *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDAssistantCommandExecutor initWithCommand:workQueue:messageDispatcher:]([HMDAssistantCommandExecutor alloc], "initWithCommand:workQueue:messageDispatcher:", v9, v8, v7);

  return v10;
}

@end
