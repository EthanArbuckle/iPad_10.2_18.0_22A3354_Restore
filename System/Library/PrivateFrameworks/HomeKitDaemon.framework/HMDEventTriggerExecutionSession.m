@implementation HMDEventTriggerExecutionSession

- (HMDEventTriggerExecutionSession)initWithEventTrigger:(id)a3 predicateUtilities:(id)a4 triggerEvent:(id)a5 causingDevice:(id)a6 workQueue:(id)a7 actionSets:(id)a8 evaluationCondition:(id)a9 recurrences:(id)a10 endEvents:(id)a11 msgDispatcher:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMDEventTriggerExecutionSession *v24;
  void *v25;
  uint64_t v26;
  NSMutableArray *triggerEvents;
  uint64_t v28;
  NSMapTable *writeRequests;
  NSMutableSet *v30;
  NSMutableSet *mediaProfiles;
  double v32;
  void *v33;
  uint64_t v34;
  NSMutableArray *causingDevices;
  HMDEventTriggerDevice *v36;
  void *v37;
  HMDEventTriggerDevice *v38;
  HMDEventTriggerUserConfirmationSession *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  HMDEventTriggerUserConfirmationSession *userConfirmationSession;
  void *v44;
  id obj;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v53;
  objc_super v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  obj = a4;
  v51 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v50 = a8;
  v49 = a9;
  v48 = a10;
  v47 = a11;
  v21 = v19;
  v22 = a12;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v54.receiver = self;
  v54.super_class = (Class)HMDEventTriggerExecutionSession;
  v53 = v20;
  v24 = -[HMDEventTriggerSession initWithSessionID:eventTrigger:workQueue:msgDispatcher:](&v54, sel_initWithSessionID_eventTrigger_workQueue_msgDispatcher_, v23, v17, v20, v22);

  if (v24)
  {
    v56[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "mutableCopy");
    triggerEvents = v24->_triggerEvents;
    v24->_triggerEvents = (NSMutableArray *)v26;

    objc_storeStrong((id *)&v24->_predicateUtilities, obj);
    objc_storeStrong((id *)&v24->_actionSets, a8);
    objc_storeStrong((id *)&v24->_evaluationCondition, a9);
    objc_storeStrong((id *)&v24->_recurrences, a10);
    objc_storeStrong((id *)&v24->_endEvents, a11);
    v24->_restoreInProgress = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v28 = objc_claimAutoreleasedReturnValue();
    writeRequests = v24->_writeRequests;
    v24->_writeRequests = (NSMapTable *)v28;

    v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mediaProfiles = v24->_mediaProfiles;
    v24->_mediaProfiles = v30;

    v24->_executionState = 0;
    objc_msgSend(MEMORY[0x24BE4F198], "currentTime");
    v24->_executionStartTime = v32;
    if (v21)
    {
      v55 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "mutableCopy");
      causingDevices = v24->_causingDevices;
      v24->_causingDevices = (NSMutableArray *)v34;

      v36 = [HMDEventTriggerDevice alloc];
      objc_msgSend(v17, "home");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[HMDEventTriggerDevice initWithCurrentDeviceForHome:](v36, "initWithCurrentDeviceForHome:", v37);

      v39 = [HMDEventTriggerUserConfirmationSession alloc];
      -[HMDEventTriggerSession sessionID](v24, "sessionID");
      v40 = v21;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[HMDEventTriggerUserConfirmationSession initWithSessionID:eventTrigger:workQueue:msgDispatcher:requestingDevice:](v39, "initWithSessionID:eventTrigger:workQueue:msgDispatcher:requestingDevice:", v41, v17, v53, v22, v38);
      userConfirmationSession = v24->_userConfirmationSession;
      v24->_userConfirmationSession = (HMDEventTriggerUserConfirmationSession *)v42;

      v21 = v40;
      -[HMDEventTriggerUserConfirmationSession setExecutionSession:](v24->_userConfirmationSession, "setExecutionSession:", v24);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObserver:selector:name:object:", v24, sel_handleSessionPlaybackStateUpdatedNotification_, CFSTR("HMDMediaSessionDidUpdatePlaybackStateNotification"), 0);

  }
  return v24;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDEventTriggerSession logString](self, "logString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[Trigger Execution Session: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)needsUserConfirmationForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDEventTriggerExecutionSession *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDEventTriggerExecutionSession causingDevices](self, "causingDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDEventTriggerExecutionSession causingDevices](self, "causingDevices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __66__HMDEventTriggerExecutionSession_needsUserConfirmationForDevice___block_invoke;
      v14[3] = &unk_24E798808;
      v15 = v7;
      objc_msgSend(v6, "na_firstObjectPassingTest:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v6) = v9 == 0;
    }
    else
    {
      v6 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v12;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to find account for causing device %@, but will still fall back to sending user confirmation", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      LOBYTE(v6) = 1;
    }

  }
  return (char)v6;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HMDEventTriggerExecutionSession;
  -[HMDEventTriggerSession dumpState](&v17, sel_dumpState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDEventTriggerExecutionSession triggerEvents](self, "triggerEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("triggering event"));

  -[HMDEventTriggerExecutionSession monitorEvents](self, "monitorEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("monitored events"));

  -[HMDEventTriggerExecutionSession restoreInProgress](self, "restoreInProgress");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("restore in progress"));

  -[HMDEventTriggerExecutionSession writeRequests](self, "writeRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("restore writes"));

  -[HMDEventTriggerExecutionSession mediaProfiles](self, "mediaProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("pause media profiles"));

  -[HMDEventTriggerExecutionSession secureTriggerConfirmationTimer](self, "secureTriggerConfirmationTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("trigger confirmation timer"));

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (void)setExecutionState:(unint64_t)a3
{
  void *v5;
  HMDEventTriggerExecutionSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMDEventTriggerExecutionStateAsString(-[HMDEventTriggerExecutionSession executionState](v6, "executionState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMDEventTriggerExecutionStateAsString(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting the execution from %{public}@ to %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v6->_executionState = a3;
}

- (void)evaluateFiringTrigger
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMDEventTriggerExecutionSession_evaluateFiringTrigger__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_evaluateFiringTrigger
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDEventTriggerExecutionSession *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  HMDEventTriggerExecutionSession *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  HMDEventTriggerExecutionSession *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  void *v45;
  HMDEventTriggerExecutionSession *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  HMDEventTriggerExecutionSession *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v60;
  HMDEventTriggerExecutionSession *val;
  id obj;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id location;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  id v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  -[HMDEventTriggerExecutionSession recurrences](self, "recurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 512, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTriggerExecutionSession recurrences](v8, "recurrences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v80 = v10;
    v81 = 2112;
    v82 = (uint64_t)v11;
    v83 = 2112;
    v84 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@recurrences : %@, dateComponents: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDEventTriggerExecutionSession recurrences](v8, "recurrences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v6);

  if (v13)
  {

LABEL_6:
    -[HMDEventTriggerExecutionSession evaluationCondition](self, "evaluationCondition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerExecutionSession predicateUtilities](self, "predicateUtilities");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerExecutionSession evaluationCondition](self, "evaluationCondition");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0;
      objc_msgSend(v15, "rewritePredicate:currentCharacteristicInPredicate:characteristicsToRead:homePresence:", v16, &v76, v58, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v76;

      v17 = (void *)MEMORY[0x227676638]();
      val = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDEventTriggerExecutionSession evaluationCondition](val, "evaluationCondition", v56);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v80 = v19;
        v81 = 2112;
        v82 = (uint64_t)v20;
        v83 = 2112;
        v84 = v57;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Evaluation condition : %@, Re-written predicate : %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      if (objc_msgSend(v58, "count"))
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        obj = v58;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        if (v22)
        {
          v60 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v73 != v60)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              objc_msgSend(obj, "objectForKey:", v24, v56);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)MEMORY[0x227676638]();
              v27 = val;
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "name");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v80 = v29;
                v81 = 2112;
                v82 = (uint64_t)v30;
                _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Going to read characteristics from accessory %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v26);
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v31 = v25;
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
              if (v32)
              {
                v33 = *(_QWORD *)v69;
                do
                {
                  for (j = 0; j != v32; ++j)
                  {
                    if (*(_QWORD *)v69 != v33)
                      objc_enumerationMutation(v31);
                    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j));
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "addObject:", v35);

                  }
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
                }
                while (v32);
              }

            }
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
          }
          while (v22);
        }

        objc_initWeak(&location, val);
        -[HMDEventTriggerSession eventTrigger](val, "eventTrigger");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "home");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDEventTriggerExecutionSession description](val, "description");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = __57__HMDEventTriggerExecutionSession__evaluateFiringTrigger__block_invoke;
        v63[3] = &unk_24E79ACA8;
        objc_copyWeak(&v66, &location);
        v39 = v21;
        v64 = v39;
        v65 = v57;
        objc_msgSend(v37, "readCharacteristicValues:source:sourceForLogging:qualityOfService:withCompletionHandler:", v39, 3, v38, -1, v63);

        v40 = (void *)MEMORY[0x227676638](-[HMDEventTriggerExecutionSession setExecutionState:](val, "setExecutionState:", 1));
        v41 = val;
        HMFGetOSLogHandle();
        v42 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (id)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(obj, "count");
          *(_DWORD *)buf = 138543618;
          v80 = v43;
          v81 = 2048;
          v82 = v44;
          _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Waiting to read [%lu] characterics before executing the trigger", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);

        objc_destroyWeak(&v66);
        objc_destroyWeak(&location);

      }
      else
      {
        -[HMDEventTriggerExecutionSession _executeTriggerAfterEvaluatingCondition:](val, "_executeTriggerAfterEvaluatingCondition:", v57);
      }

    }
    else
    {
      v50 = -[HMDEventTriggerExecutionSession _executeTriggerAfterEvaluatingCondition:](self, "_executeTriggerAfterEvaluatingCondition:", 0);
    }
    v51 = (void *)MEMORY[0x227676638](v50);
    v52 = self;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      HMDEventTriggerExecutionStateAsString(-[HMDEventTriggerExecutionSession executionState](v52, "executionState"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v54;
      v81 = 2112;
      v82 = (uint64_t)v55;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@EventTrigger Evaluation State : [%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v51);
    return;
  }
  v45 = (void *)MEMORY[0x227676638]();
  v46 = v8;
  HMFGetOSLogHandle();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v80 = v48;
    _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Trigger not fired since recurrence does not match", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v45);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3005);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerExecutionSession _callExecutionComplete:](v46, "_callExecutionComplete:", v49);

}

- (void)_executeTriggerAfterEvaluatingCondition:(id)a3
{
  id v4;
  void *v5;
  HMDEventTriggerExecutionSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDEventTriggerExecutionSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  HMDEventTriggerExecutionSession *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  HMDTriggerConfirmationTimer *v30;
  void *v31;
  HMDTriggerConfirmationTimer *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDEventTriggerExecutionSession *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDEventTriggerExecutionSession *v41;
  NSObject *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  const __CFString *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v8;
    v53 = 2112;
    v54 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to evaluate the trigger After evaluating : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    v49 = CFSTR("THIS_OBJECT");
    -[HMDEventTriggerExecutionSession predicateUtilities](v6, "predicateUtilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v14;
      v53 = 2112;
      v54 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Evaluating the trigger predicate using %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v4, "allowEvaluation");
    -[HMDEventTriggerExecutionSession predicateUtilities](v12, "predicateUtilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v4, "evaluateWithObject:substitutionVariables:", v15, v10);

    if ((v16 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = v12;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v52 = v38;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Trigger condition evaluated to NO, not firing action set", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3006);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerExecutionSession _callExecutionComplete:](v36, "_callExecutionComplete:", v39);

      goto LABEL_27;
    }

  }
  -[HMDEventTriggerExecutionSession causingDevices](v6, "causingDevices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v18 = -[HMDEventTriggerExecutionSession containsSecureActionSet](v6, "containsSecureActionSet");

    if (v18)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v52 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Location triggers that contain secure action sets should ask for a confirmation before execution", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      -[HMDEventTriggerExecutionSession causingDevices](v20, "causingDevices", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v45;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v45 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v27);
            -[HMDEventTriggerExecutionSession userConfirmationSession](v20, "userConfirmationSession");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "askForUserPermission:", v28);

            ++v27;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v25);
      }

      v30 = [HMDTriggerConfirmationTimer alloc];
      -[HMDEventTriggerSession sessionID](v20, "sessionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HMDTriggerConfirmationTimer initWithExecutionSessionID:timeoutInterval:](v30, "initWithExecutionSessionID:timeoutInterval:", v31, (double)(unint64_t)secureTriggerUserResponseTimeoutInSeconds);
      -[HMDEventTriggerExecutionSession setSecureTriggerConfirmationTimer:](v20, "setSecureTriggerConfirmationTimer:", v32);

      -[HMDEventTriggerExecutionSession secureTriggerConfirmationTimer](v20, "secureTriggerConfirmationTimer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDelegate:", v20);

      -[HMDEventTriggerExecutionSession secureTriggerConfirmationTimer](v20, "secureTriggerConfirmationTimer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "resume");

      -[HMDEventTriggerExecutionSession setExecutionState:](v20, "setExecutionState:", 2);
      goto LABEL_27;
    }
  }
  else
  {

  }
  v40 = (void *)MEMORY[0x227676638]();
  v41 = v6;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v43;
    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Directly executing action set as user confirmation is not required", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v40);
  -[HMDEventTriggerExecutionSession _directlyExecuteActionSetsWithCompletionHandler:](v41, "_directlyExecuteActionSetsWithCompletionHandler:", 0);
LABEL_27:

}

- (BOOL)containsSecureActionSet
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDEventTriggerExecutionSession actionSets](self, "actionSets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "containsSecureCharacteristic") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)cancelSessionIfWaitingForUserResponse
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMDEventTriggerExecutionSession_cancelSessionIfWaitingForUserResponse__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)postponeRestoreIfWaitingForEndEvent
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDEventTriggerExecutionSession_postponeRestoreIfWaitingForEndEvent__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)durationEndEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDEventTriggerExecutionSession endEvents](self, "endEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)userResponse:(unint64_t)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__HMDEventTriggerExecutionSession_userResponse_device_completionHandler___block_invoke;
  v13[3] = &unk_24E79BE60;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_userResponse:(unint64_t)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  HMDEventTriggerExecutionSession *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(void *, void *);
  void *v18;
  uint64_t v19;
  void *v20;
  HMDEventTriggerExecutionSession *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HMDEventTriggerExecutionSession *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMDEventTriggerExecutionSession *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[HMDEventTriggerExecutionSession secureTriggerConfirmationTimer](self, "secureTriggerConfirmationTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543362;
      v49 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@There is no confirmation timer running, not processing the confirmation", (uint8_t *)&v48, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v17 = (void (**)(void *, void *))_Block_copy(v9);
    if (!v17)
      goto LABEL_12;
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = 58;
    goto LABEL_11;
  }
  v11 = -[HMDEventTriggerExecutionSession actionSetExecutionInProgress](self, "actionSetExecutionInProgress");
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543362;
      v49 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Action set execution is already in progress", (uint8_t *)&v48, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v17 = (void (**)(void *, void *))_Block_copy(v9);
    if (!v17)
      goto LABEL_12;
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = 15;
LABEL_11:
    objc_msgSend(v18, "hmErrorWithCode:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v24);

LABEL_12:
    goto LABEL_13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HMDUserConfirmationResponseAsString(a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138543874;
    v49 = v25;
    v50 = 2112;
    v51 = v8;
    v52 = 2112;
    v53 = v26;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Received response from %@ with %@", (uint8_t *)&v48, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  switch(a3)
  {
    case 1uLL:
    case 4uLL:
      -[HMDEventTriggerExecutionSession causingDevices](v13, "causingDevices");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeObject:", v8);

      -[HMDEventTriggerExecutionSession causingDevices](v13, "causingDevices");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (!v29)
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = v13;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 138543362;
          v49 = v33;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@None of the devices have answered the dialog, ending the session", (uint8_t *)&v48, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
        v34 = _Block_copy(v9);
        v35 = v34;
        if (v34)
          (*((void (**)(void *, _QWORD))v34 + 2))(v34, 0);

        v36 = (void *)MEMORY[0x24BDD1540];
        v37 = 3000;
        goto LABEL_31;
      }
      break;
    case 2uLL:
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v13;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543362;
        v49 = v41;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@User confirms to execute trigger", (uint8_t *)&v48, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      -[HMDEventTriggerExecutionSession _removeUserDialog](v39, "_removeUserDialog");
      -[HMDEventTriggerExecutionSession _directlyExecuteActionSetsWithCompletionHandler:](v39, "_directlyExecuteActionSetsWithCompletionHandler:", v9);
      break;
    case 3uLL:
      v42 = (void *)MEMORY[0x227676638]();
      v31 = v13;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543362;
        v49 = v44;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@User confirms not to execute trigger", (uint8_t *)&v48, 0xCu);

      }
      objc_autoreleasePoolPop(v42);
      v45 = _Block_copy(v9);
      v46 = v45;
      if (v45)
        (*((void (**)(void *, _QWORD))v45 + 2))(v45, 0);

      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = 3001;
LABEL_31:
      objc_msgSend(v36, "hmInternalErrorWithCode:", v37);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerExecutionSession _callExecutionComplete:](v31, "_callExecutionComplete:", v47);

      break;
    default:
      break;
  }
LABEL_13:

}

- (void)addEvent:(id)a3 causingDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMDEventTriggerExecutionSession_addEvent_causingDevice___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_addEvent:(id)a3 causingDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  HMDEventTriggerExecutionSession *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HMDEventTriggerExecutionSession *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  HMDEventTriggerExecutionSession *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[HMDEventTriggerExecutionSession executionState](self, "executionState") > 2)
  {
    v16 = MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMDEventTriggerExecutionStateAsString(-[HMDEventTriggerExecutionSession executionState](v17, "executionState"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v19;
      v34 = 2112;
      v35 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Current state has moved beyond waiting for user response: %@", (uint8_t *)&v32, 0x16u);

    }
    v15 = (void *)v16;
    goto LABEL_9;
  }
  -[HMDEventTriggerExecutionSession causingDevices](self, "causingDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((v9 & 1) != 0)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v14;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Device is already in the causing devices list, %@", (uint8_t *)&v32, 0x16u);

    }
    v15 = v10;
LABEL_9:
    objc_autoreleasePoolPop(v15);
    goto LABEL_17;
  }
  if (v13)
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v21;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding device to ask for confirmation, %@", (uint8_t *)&v32, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDEventTriggerExecutionSession causingDevices](v11, "causingDevices");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v7);

  -[HMDEventTriggerExecutionSession triggerEvents](v11, "triggerEvents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", v6);

  if ((v24 & 1) == 0)
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = v11;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v28;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding event as an additional event, %@", (uint8_t *)&v32, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    -[HMDEventTriggerExecutionSession triggerEvents](v26, "triggerEvents");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v6);

  }
  -[HMDEventTriggerExecutionSession userConfirmationSession](v11, "userConfirmationSession");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "askForUserPermission:", v7);

  -[HMDEventTriggerExecutionSession secureTriggerConfirmationTimer](v11, "secureTriggerConfirmationTimer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "resume");

LABEL_17:
}

- (void)_directlyExecuteActionSetsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[HMDEventTriggerExecutionSession setActionSetExecutionInProgress:](self, "setActionSetExecutionInProgress:", 1);
  -[HMDEventTriggerExecutionSession setSecureTriggerConfirmationTimer:](self, "setSecureTriggerConfirmationTimer:", 0);
  objc_initWeak(&location, self);
  -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerExecutionSession actionSets](self, "actionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__HMDEventTriggerExecutionSession__directlyExecuteActionSetsWithCompletionHandler___block_invoke;
  v8[3] = &unk_24E79AFA0;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "_executeActionSets:captureCurrentState:completionHandler:", v6, 1, v8);

  -[HMDEventTriggerExecutionSession setExecutionState:](self, "setExecutionState:", 3);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_handleActionSetExecutionResponse:(id)a3 actionSetError:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDEventTriggerExecutionSession *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDEventTriggerExecutionSession *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  HMDEventTriggerExecutionSession *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDEventTriggerExecutionSession *v33;
  id v34;
  void *v35;
  HMDEventTriggerExecutionSession *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  HMDEventTriggerExecutionSession *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  _BYTE v50[22];
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "triggerFired");

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v50 = 138543874;
    *(_QWORD *)&v50[4] = v15;
    *(_WORD *)&v50[12] = 2112;
    *(_QWORD *)&v50[14] = v9;
    v51 = 2112;
    v52 = v8;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Action set execution responded with error %@ and response %@", v50, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v16 = _Block_copy(v10);
  v17 = v16;
  if (v16)
    (*((void (**)(void *, id))v16 + 2))(v16, v9);

  if (v9)
  {
    objc_msgSend(v9, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD5BD8]))
    {
      v19 = objc_msgSend(v9, "code");

      if (v19 == 64)
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = v13;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v50 = 138543362;
          *(_QWORD *)&v50[4] = v23;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Action set has resulted in partial success, proceeding with successful ones", v50, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        goto LABEL_11;
      }
    }
    else
    {

    }
    v33 = v13;
    v34 = v9;
LABEL_22:
    -[HMDEventTriggerExecutionSession _callExecutionComplete:](v33, "_callExecutionComplete:", v34, *(_OWORD *)v50);
    goto LABEL_27;
  }
LABEL_11:
  -[HMDEventTriggerExecutionSession endEvents](v13, "endEvents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v13;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
LABEL_21:

      objc_autoreleasePoolPop(v35);
      v33 = v36;
      v34 = 0;
      goto LABEL_22;
    }
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v50 = 138543362;
    *(_QWORD *)&v50[4] = v38;
    v39 = "%{public}@There are no end events, declaring execution is complete";
LABEL_20:
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, v39, v50, 0xCu);

    goto LABEL_21;
  }
  -[HMDEventTriggerExecutionSession _monitoringEventsFromActionSetResponse:](v13, "_monitoringEventsFromActionSetResponse:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerExecutionSession setMonitorEvents:](v13, "setMonitorEvents:", v26);

  v27 = (void *)MEMORY[0x227676638]();
  v28 = v13;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTriggerExecutionSession monitorEvents](v28, "monitorEvents");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v50 = 138543618;
    *(_QWORD *)&v50[4] = v30;
    *(_WORD *)&v50[12] = 2112;
    *(_QWORD *)&v50[14] = v31;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Created monitoring events %@", v50, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  -[HMDEventTriggerExecutionSession writeRequests](v28, "writeRequests");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v32, "count"))
  {
    -[HMDEventTriggerExecutionSession mediaProfiles](v28, "mediaProfiles");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");

    if (v41)
      goto LABEL_24;
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v28;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v50 = 138543362;
    *(_QWORD *)&v50[4] = v38;
    v39 = "%{public}@There are no characteristic writes or media profiles playback actions to perform upon restore, decla"
          "ring execution is complete";
    goto LABEL_20;
  }

LABEL_24:
  v42 = (void *)MEMORY[0x227676638]();
  v43 = v28;
  HMFGetOSLogHandle();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v50 = 138543362;
    *(_QWORD *)&v50[4] = v45;
    _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@There are end events with the execution session, activating them", v50, 0xCu);

  }
  objc_autoreleasePoolPop(v42);
  -[HMDEventTriggerExecutionSession _activateDurationEvents](v43, "_activateDurationEvents");
  -[HMDEventTriggerExecutionSession setExecutionState:](v43, "setExecutionState:", 4);
  v46 = objc_alloc(MEMORY[0x24BE3F298]);
  v47 = (void *)objc_msgSend(v46, "initWithTimeInterval:options:", 1, (double)(unint64_t)startCharacteristicsMonitorWaitPeriod);
  -[HMDEventTriggerExecutionSession setStartCharacteristicsMonitorTimer:](v43, "setStartCharacteristicsMonitorTimer:", v47);

  -[HMDEventTriggerExecutionSession startCharacteristicsMonitorTimer](v43, "startCharacteristicsMonitorTimer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDelegate:", v43);

  -[HMDEventTriggerExecutionSession startCharacteristicsMonitorTimer](v43, "startCharacteristicsMonitorTimer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "resume");

LABEL_27:
}

- (void)_activateDurationEvents
{
  id v3;

  -[HMDEventTriggerExecutionSession durationEndEvents](self, "durationEndEvents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerExecutionSession _activateEvents:](self, "_activateEvents:", v3);

}

- (void)_activateMonitoringEvents
{
  id v3;

  -[HMDEventTriggerExecutionSession monitorEvents](self, "monitorEvents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerExecutionSession _activateEvents:](self, "_activateEvents:", v3);

}

- (void)_activateEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_msgSend(v5, "msgDispatcher");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDEventTriggerSession workQueue](self, "workQueue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "configure:messageDispatcher:queue:delegate:", v5, v11, v12, self);

        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __51__HMDEventTriggerExecutionSession__activateEvents___block_invoke;
        v14[3] = &unk_24E79BCC8;
        v14[4] = self;
        v14[5] = v10;
        objc_msgSend(v10, "_activate:completionHandler:", 3, v14);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)_monitoringEventsFromActionSetResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDEventTriggerExecutionSession *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;
  HMDCharacteristicEventModel *v49;
  void *v50;
  HMDCharacteristicEventModel *v51;
  void *v52;
  void *v53;
  HMDCharacteristicMonitorEvent *v54;
  void *v55;
  HMDEventTriggerExecutionSession *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  HMDEventTriggerExecutionSession *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  HMDEventTriggerExecutionSession *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  HMDEventTriggerExecutionSession *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  id obj;
  id v91;
  HMDEventTriggerExecutionSession *v92;
  void *v93;
  void *v94;
  const char *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint8_t buf[4];
  uint64_t v117;
  __int16 v118;
  const char *v119;
  __int16 v120;
  const char *v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v4;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
  if (v74)
  {
    v73 = *(_QWORD *)v113;
    v92 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v113 != v73)
          objc_enumerationMutation(obj);
        v75 = v6;
        v89 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * v6);
        objc_msgSend(obj, "hmf_dictionaryForKey:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("kCharacteristicValuesBeforeWrite"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v109;
          v76 = *(_QWORD *)v109;
          v77 = v8;
          do
          {
            v12 = 0;
            v78 = v10;
            do
            {
              if (*(_QWORD *)v109 != v11)
                objc_enumerationMutation(v8);
              v13 = *(const char **)(*((_QWORD *)&v108 + 1) + 8 * v12);
              if ((HMFEqualObjects() & 1) == 0)
              {
                objc_msgSend(v79, "hmf_dictionaryForKey:", v13);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "hmf_dictionaryForKey:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v95 = v13;
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
                objc_msgSend(v88, "accessoryWithUUID:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v17 = v16;
                else
                  v17 = 0;
                v18 = v17;

                v96 = v18;
                if (!v18)
                {
                  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v95);
                  objc_msgSend(v88, "mediaProfileWithUUID:", v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v21 = v20;
                  else
                    v21 = 0;
                  v22 = v21;

                  if (v22)
                  {
                    objc_msgSend(v22, "uniqueIdentifier");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "objectForKey:", v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v24, "playbackState") == 1)
                    {

                      goto LABEL_69;
                    }
                    -[HMDEventTriggerExecutionSession mediaProfiles](self, "mediaProfiles");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "addObject:", v22);

                  }
                }
                v106 = 0u;
                v107 = 0u;
                v104 = 0u;
                v105 = 0u;
                v22 = v14;
                v85 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
                if (v85)
                {
                  v80 = v14;
                  v81 = v12;
                  v82 = *(_QWORD *)v105;
                  v83 = v22;
                  while (1)
                  {
                    v26 = 0;
                    do
                    {
                      if (*(_QWORD *)v105 != v82)
                        objc_enumerationMutation(v22);
                      v86 = v26;
                      v27 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v26);
                      objc_msgSend(v22, "hmf_dictionaryForKey:", v27);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v84, "hmf_dictionaryForKey:", v27);
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      v100 = 0u;
                      v101 = 0u;
                      v102 = 0u;
                      v103 = 0u;
                      v91 = v28;
                      v98 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
                      if (v98)
                      {
                        v97 = *(_QWORD *)v101;
                        v99 = v27;
                        do
                        {
                          v29 = 0;
                          do
                          {
                            if (*(_QWORD *)v101 != v97)
                              objc_enumerationMutation(v91);
                            v30 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v29);
                            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v30, "integerValue"));
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v27, "integerValue"));
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v96, "findCharacteristic:forService:", v31, v32);
                            v33 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v33)
                            {
                              objc_msgSend(v93, "objectForKey:", v30);
                              v34 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v34, "objectForKey:", CFSTR("kCharacteristicValue"));
                              v35 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v33, "type");
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              v37 = isRestoreSupportedForCharacteristic();

                              if (!v37)
                                goto LABEL_39;
                              if (v35 && (objc_msgSend(v35, "isEqual:", MEMORY[0x24BDBD1C0]) & 1) == 0)
                              {
                                v67 = (void *)MEMORY[0x227676638]();
                                v68 = self;
                                HMFGetOSLogHandle();
                                v69 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                                {
                                  HMFGetLogIdentifier();
                                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138543618;
                                  v117 = (uint64_t)v70;
                                  v118 = 2112;
                                  v119 = (const char *)v33;
                                  _os_log_impl(&dword_2218F0000, v69, OS_LOG_TYPE_INFO, "%{public}@Did not create write request for characteristic because it was ON prior to trigger, %@", buf, 0x16u);

                                }
                                objc_autoreleasePoolPop(v67);
                                v27 = v99;
                              }
                              else
                              {
                                objc_msgSend(v33, "authorizationData");
                                v38 = (void *)objc_claimAutoreleasedReturnValue();
                                +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v33, MEMORY[0x24BDBD1C0], v38, 1);
                                v39 = (void *)objc_claimAutoreleasedReturnValue();

                                -[HMDEventTriggerExecutionSession writeRequests](self, "writeRequests");
                                v40 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v40, "setObject:forKey:", v39, v33);

LABEL_39:
                                v41 = (void *)MEMORY[0x227676638]();
                                v42 = self;
                                HMFGetOSLogHandle();
                                v43 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                                {
                                  HMFGetLogIdentifier();
                                  v44 = objc_claimAutoreleasedReturnValue();
                                  v45 = (void *)v44;
                                  *(_DWORD *)buf = 138544130;
                                  v46 = "Did not create";
                                  if (v37)
                                    v46 = "Created";
                                  v117 = v44;
                                  v47 = "is not";
                                  if (v37)
                                    v47 = "is";
                                  v118 = 2080;
                                  v119 = v46;
                                  v120 = 2080;
                                  v121 = v47;
                                  v122 = 2112;
                                  v123 = v33;
                                  _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@%s write request for characteristic because characteristic type %s supported for Duration Event, %@", buf, 0x2Au);

                                  self = v92;
                                }

                                objc_autoreleasePoolPop(v41);
                                v27 = v99;
                                -[HMDEventTriggerExecutionSession valueInActionSetWriteResponse:actionSetUUID:accUUID:serviceID:characteristicID:](v42, "valueInActionSetWriteResponse:actionSetUUID:accUUID:serviceID:characteristicID:", obj, v89, v95, v99, v30);
                                v48 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v48)
                                {
                                  v94 = v34;
                                  v49 = [HMDCharacteristicEventModel alloc];
                                  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                                  v51 = -[HMDBackingStoreModelObject initWithUUID:](v49, "initWithUUID:", v50);

                                  -[HMDCharacteristicEventModel setAccessory:](v51, "setAccessory:", v95);
                                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v99, "integerValue"));
                                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[HMDCharacteristicEventModel setServiceID:](v51, "setServiceID:", v52);

                                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v30, "integerValue"));
                                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[HMDCharacteristicEventModel setCharacteristicID:](v51, "setCharacteristicID:", v53);

                                  -[HMDCharacteristicEventModel setEventValue:](v51, "setEventValue:", v48);
                                  v54 = -[HMDCharacteristicEvent initWithModel:home:]([HMDCharacteristicMonitorEvent alloc], "initWithModel:home:", v51, v88);
                                  if (v54)
                                  {
                                    objc_msgSend(v87, "addObject:", v54);
                                  }
                                  else
                                  {
                                    v63 = (void *)MEMORY[0x227676638]();
                                    v64 = v42;
                                    HMFGetOSLogHandle();
                                    v65 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                                    {
                                      HMFGetLogIdentifier();
                                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                                      *(_DWORD *)buf = 138543618;
                                      v117 = (uint64_t)v66;
                                      v118 = 2112;
                                      v119 = (const char *)v33;
                                      _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_ERROR, "%{public}@Failed to create monitor event for %@", buf, 0x16u);

                                    }
                                    objc_autoreleasePoolPop(v63);
                                  }

                                  self = v92;
                                  v27 = v99;
                                  v34 = v94;
                                }
                                else
                                {
                                  v59 = (void *)MEMORY[0x227676638]();
                                  v60 = v42;
                                  HMFGetOSLogHandle();
                                  v61 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                                  {
                                    HMFGetLogIdentifier();
                                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)buf = 138543618;
                                    v117 = (uint64_t)v62;
                                    v118 = 2112;
                                    v119 = (const char *)v33;
                                    _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@No value reported in action set result, Not creating the monitor event for %@", buf, 0x16u);

                                    v27 = v99;
                                  }

                                  objc_autoreleasePoolPop(v59);
                                }

                              }
                              goto LABEL_60;
                            }
                            v55 = (void *)MEMORY[0x227676638]();
                            v56 = self;
                            HMFGetOSLogHandle();
                            v57 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                            {
                              HMFGetLogIdentifier();
                              v58 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138544130;
                              v117 = (uint64_t)v58;
                              v118 = 2112;
                              v119 = v95;
                              v120 = 2112;
                              v121 = (const char *)v27;
                              v122 = 2112;
                              v123 = v30;
                              _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Could not find the characteristic %@/%@/%@", buf, 0x2Au);

                            }
                            objc_autoreleasePoolPop(v55);
LABEL_60:

                            ++v29;
                          }
                          while (v98 != v29);
                          v71 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
                          v98 = v71;
                        }
                        while (v71);
                      }

                      v26 = v86 + 1;
                      v22 = v83;
                    }
                    while (v86 + 1 != v85);
                    v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
                    if (!v85)
                    {
                      v11 = v76;
                      v8 = v77;
                      v10 = v78;
                      v14 = v80;
                      v12 = v81;
                      break;
                    }
                  }
                }
LABEL_69:

              }
              ++v12;
            }
            while (v12 != v10);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
          }
          while (v10);
        }

        v6 = v75 + 1;
      }
      while (v75 + 1 != v74);
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
    }
    while (v74);
  }

  return v87;
}

- (id)valueInActionSetWriteResponse:(id)a3 actionSetUUID:(id)a4 accUUID:(id)a5 serviceID:(id)a6 characteristicID:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  objc_msgSend(a3, "hmf_dictionaryForKey:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hmf_dictionaryForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "hmf_dictionaryForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "hmf_dictionaryForKey:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_callExecutionComplete:(id)a3 callDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  HMDEventTriggerExecutionSession *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  id v18;
  void *v19;
  HMDEventTriggerExecutionSession *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  HMDEventTriggerExecutionSession *v33;
  NSObject *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v4 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[HMDEventTriggerExecutionSession executionCompleteCalled](self, "executionCompleteCalled"))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Execution complete already called, ignoring", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[HMDEventTriggerExecutionSession triggerEvents](self, "triggerEvents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_2557CDE40))
            v17 = v16;
          else
            v17 = 0;
          v18 = v17;

          if (v18)
            objc_msgSend(v18, "didEndExecutionSession:", self);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v13);
    }

    v19 = (void *)MEMORY[0x227676638](-[HMDEventTriggerExecutionSession _removeUserDialog](self, "_removeUserDialog"));
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    v36 = v6;
    if (v4)
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v23;
        v48 = 2114;
        v49 = v6;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Informing that trigger action set execution is complete with error %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDEventTriggerSession eventTrigger](v20, "eventTrigger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "executionComplete:error:", v20, v6);

    }
    else
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v25;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Not calling the delegate", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
    }
    -[HMDEventTriggerExecutionSession setSecureTriggerConfirmationTimer:](v20, "setSecureTriggerConfirmationTimer:", 0);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[HMDEventTriggerExecutionSession endEvents](v20, "endEvents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          v32 = (void *)MEMORY[0x227676638]();
          v33 = v20;
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v47 = v35;
            v48 = 2112;
            v49 = v31;
            _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Deactivating end event %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v32);
          objc_msgSend(v31, "_activate:completionHandler:", 0, 0);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v28);
    }

    v6 = v36;
    if (!v36)
      -[HMDEventTriggerExecutionSession setExecutionState:](v20, "setExecutionState:", 6);
    -[HMDEventTriggerExecutionSession setExecutionCompleteCalled:](v20, "setExecutionCompleteCalled:", 1);
    -[HMDEventTriggerExecutionSession _submitAnalyticsData:](v20, "_submitAnalyticsData:", v36);
  }

}

- (void)_submitAnalyticsData:(id)a3
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
  void *v13;
  HomeKitEventTriggerExecutionSessionLogEvent *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  HomeKitEventTriggerExecutionSessionLogEvent *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *context;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  context = (void *)MEMORY[0x227676638]();
  v5 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDEventTriggerExecutionSession triggerEvents](self, "triggerEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[HMDEventTriggerExecutionSession triggerEvents](self, "triggerEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v44;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v12), "analyticsTriggerEventData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v10);
  }

  v14 = [HomeKitEventTriggerExecutionSessionLogEvent alloc];
  -[HMDEventTriggerExecutionSession executionStartTime](self, "executionStartTime");
  v16 = v15;
  -[HMDEventTriggerSession sessionID](self, "sessionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HomeKitEventTriggerExecutionSessionLogEvent initWithStartTime:sessionID:](v14, "initWithStartTime:sessionID:", v18, v16);

  v20 = (void *)objc_msgSend(v7, "copy");
  -[HomeKitEventTriggerExecutionSessionLogEvent analyticsData](v19, "analyticsData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTriggerEvents:", v20);

  v22 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDEventTriggerExecutionSession endEvents](self, "endEvents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[HMDEventTriggerExecutionSession endEvents](self, "endEvents");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v29), "analyticsTriggerEventData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v27);
  }

  v31 = (void *)objc_msgSend(v24, "copy");
  -[HomeKitEventTriggerExecutionSessionLogEvent analyticsData](v19, "analyticsData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setEndEvents:", v31);

  v33 = -[HMDEventTriggerExecutionSession executionState](self, "executionState");
  -[HomeKitEventTriggerExecutionSessionLogEvent analyticsData](v19, "analyticsData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setExecutionState:", v33);

  v35 = objc_msgSend(v4, "code");
  -[HomeKitEventTriggerExecutionSessionLogEvent analyticsData](v19, "analyticsData");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setResultErrorCode:", v35);

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "submitLogEvent:error:", v19, v4);

  objc_autoreleasePoolPop(context);
}

- (void)_callExecutionComplete:(id)a3
{
  -[HMDEventTriggerExecutionSession _callExecutionComplete:callDelegate:](self, "_callExecutionComplete:callDelegate:", a3, 1);
}

- (void)_removeUserDialog
{
  void *v3;
  void *v4;
  id v5;

  -[HMDEventTriggerExecutionSession userConfirmationSession](self, "userConfirmationSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerExecutionSession causingDevices](self, "causingDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeUserDialog:", v4);

  -[HMDEventTriggerExecutionSession causingDevices](self, "causingDevices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (void)_restoreState
{
  void *v3;
  HMDEventTriggerExecutionSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDEventTriggerExecutionSession *v19;
  NSObject *v20;
  id v21;
  void *v22;
  HMDEventTriggerExecutionSession *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  int v40;
  __int16 v41;
  __int128 *v42;
  __int16 v43;
  HMDEventTriggerExecutionSession *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (-[HMDEventTriggerExecutionSession restoreInProgress](self, "restoreInProgress"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@State restoration is already in progress, ignoring", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    -[HMDEventTriggerExecutionSession setRestoreInProgress:](self, "setRestoreInProgress:", 1);
    -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[HMDEventTriggerExecutionSession writeRequests](self, "writeRequests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v32;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v32 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13);
            -[HMDEventTriggerExecutionSession writeRequests](self, "writeRequests");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
        }
        while (v11);
      }

      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v35 = 0uLL;
        if (v17)
          objc_msgSend(v17, "getUUIDBytes:", &v35);
        else
          v35 = *MEMORY[0x24BE3F2C8];
        v36 = v35;
        v26 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 138544386;
        v38 = v21;
        v39 = 1042;
        v40 = 16;
        v41 = 2098;
        v42 = &v36;
        v43 = 2114;
        v44 = v19;
        v45 = 2048;
        v46 = v26;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Executing write requests for request identifier: %{public,uuid_t}.16P from event trigger execution session: %{public}@ count: %lu", buf, 0x30u);

      }
      objc_autoreleasePoolPop(v18);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __48__HMDEventTriggerExecutionSession__restoreState__block_invoke;
      v27[3] = &unk_24E798D90;
      objc_copyWeak(&v29, &location);
      v28 = v8;
      objc_msgSend(v28, "writeCharacteristicValues:source:identifier:transport:qualityOfService:withCompletionHandler:", v9, 3, v17, 0, -1, v27);
      -[HMDEventTriggerExecutionSession setExecutionState:](v19, "setExecutionState:", 5);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v25;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to get valid Home reference", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerExecutionSession _callExecutionComplete:](v23, "_callExecutionComplete:", v9);
    }

  }
}

- (void)_handleMonitoringEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDEventTriggerExecutionSession *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  HMDEventTriggerExecutionSession *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v26 = v4;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMDEventTriggerExecutionSession writeRequests](self, "writeRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      v27 = v10;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        objc_msgSend(v6, "characteristic");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "service");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "service");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v16)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = v11;
            v21 = v6;
            v22 = v8;
            v23 = self;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v24;
            v34 = 2112;
            v35 = v13;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Removing the write requests on characteristic as it was changed, %@", buf, 0x16u);

            self = v23;
            v8 = v22;
            v6 = v21;
            v11 = v20;
            v10 = v27;
          }

          objc_autoreleasePoolPop(v17);
          -[HMDEventTriggerExecutionSession writeRequests](v18, "writeRequests");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeObjectForKey:", v13);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v10);
  }

  -[HMDEventTriggerExecutionSession _callExecutionCompleteIfNoMoreOutstandingRequests](self, "_callExecutionCompleteIfNoMoreOutstandingRequests");
}

- (void)handleSessionPlaybackStateUpdatedNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD6750]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__HMDEventTriggerExecutionSession_handleSessionPlaybackStateUpdatedNotification___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

- (void)_callExecutionCompleteIfNoMoreOutstandingRequests
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HMDEventTriggerExecutionSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDEventTriggerExecutionSession *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDEventTriggerExecutionSession writeRequests](self, "writeRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerExecutionSession writeRequests](v7, "writeRequests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDEventTriggerExecutionSession mediaProfiles](v7, "mediaProfiles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v9;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Not ending the trigger execution session because there are write requests left %@ or media profiles %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    return;
  }
  -[HMDEventTriggerExecutionSession mediaProfiles](self, "mediaProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@No more write requests in restore list, declaring execution complete", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDEventTriggerExecutionSession _callExecutionComplete:](v14, "_callExecutionComplete:", 0);
}

- (id)didOccurEvent:(id)a3 causingDevice:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__HMDEventTriggerExecutionSession_didOccurEvent_causingDevice___block_invoke;
  v9[3] = &unk_24E79C268;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDEventTriggerExecutionSession_timerDidFire___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSMutableArray)triggerEvents
{
  return self->_triggerEvents;
}

- (NSMutableArray)causingDevices
{
  return self->_causingDevices;
}

- (NSArray)endEvents
{
  return self->_endEvents;
}

- (NSArray)monitorEvents
{
  return self->_monitorEvents;
}

- (void)setMonitorEvents:(id)a3
{
  objc_storeStrong((id *)&self->_monitorEvents, a3);
}

- (unint64_t)executionState
{
  return self->_executionState;
}

- (HMDPredicateUtilities)predicateUtilities
{
  return self->_predicateUtilities;
}

- (NSArray)actionSets
{
  return self->_actionSets;
}

- (NSPredicate)evaluationCondition
{
  return self->_evaluationCondition;
}

- (NSArray)recurrences
{
  return self->_recurrences;
}

- (HMDEventTriggerUserConfirmationSession)userConfirmationSession
{
  return self->_userConfirmationSession;
}

- (HMDTriggerConfirmationTimer)secureTriggerConfirmationTimer
{
  return self->_secureTriggerConfirmationTimer;
}

- (void)setSecureTriggerConfirmationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_secureTriggerConfirmationTimer, a3);
}

- (HMFTimer)startCharacteristicsMonitorTimer
{
  return self->_startCharacteristicsMonitorTimer;
}

- (void)setStartCharacteristicsMonitorTimer:(id)a3
{
  objc_storeStrong((id *)&self->_startCharacteristicsMonitorTimer, a3);
}

- (BOOL)actionSetExecutionInProgress
{
  return self->_actionSetExecutionInProgress;
}

- (void)setActionSetExecutionInProgress:(BOOL)a3
{
  self->_actionSetExecutionInProgress = a3;
}

- (BOOL)restoreInProgress
{
  return self->_restoreInProgress;
}

- (void)setRestoreInProgress:(BOOL)a3
{
  self->_restoreInProgress = a3;
}

- (BOOL)executionCompleteCalled
{
  return self->_executionCompleteCalled;
}

- (void)setExecutionCompleteCalled:(BOOL)a3
{
  self->_executionCompleteCalled = a3;
}

- (NSMapTable)writeRequests
{
  return self->_writeRequests;
}

- (NSMutableSet)mediaProfiles
{
  return self->_mediaProfiles;
}

- (double)executionStartTime
{
  return self->_executionStartTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
  objc_storeStrong((id *)&self->_writeRequests, 0);
  objc_storeStrong((id *)&self->_startCharacteristicsMonitorTimer, 0);
  objc_storeStrong((id *)&self->_secureTriggerConfirmationTimer, 0);
  objc_storeStrong((id *)&self->_userConfirmationSession, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_evaluationCondition, 0);
  objc_storeStrong((id *)&self->_actionSets, 0);
  objc_storeStrong((id *)&self->_predicateUtilities, 0);
  objc_storeStrong((id *)&self->_monitorEvents, 0);
  objc_storeStrong((id *)&self->_endEvents, 0);
  objc_storeStrong((id *)&self->_causingDevices, 0);
  objc_storeStrong((id *)&self->_triggerEvents, 0);
}

void __48__HMDEventTriggerExecutionSession_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "secureTriggerConfirmationTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@No user has responded to the confirmation yet, declaring confirmation denied", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_callExecutionComplete:", v23);

    objc_msgSend(*(id *)(a1 + 32), "setSecureTriggerConfirmationTimer:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "startCharacteristicsMonitorTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);

    if (v4 == v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Start char monitor timer has fired, activating monitoring events", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "monitorEvents", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v15, "characteristic");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setEventValue:", v17);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v12);
      }

      objc_msgSend(*(id *)(a1 + 32), "setStartCharacteristicsMonitorTimer:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_activateMonitoringEvents");
    }
  }
}

void __63__HMDEventTriggerExecutionSession_didOccurEvent_causingDevice___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "endEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v22 = 138543618;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@End Event has occurred, declaring execution complete, %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_restoreState");
  }
  objc_msgSend(*(id *)(a1 + 32), "endEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 40)))
  {

LABEL_9:
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v22 = 138543618;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Monitored Event %{public}@ has occurred", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 32), "_handleMonitoringEvent:", *(_QWORD *)(a1 + 40));
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "monitorEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", *(_QWORD *)(a1 + 40));

    if (v11)
      goto LABEL_9;
  }
  else
  {

  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    v22 = 138543618;
    v23 = v20;
    v24 = 2112;
    v25 = v21;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Received a delegate callback on event occurrence from %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
}

void __81__HMDEventTriggerExecutionSession_handleSessionPlaybackStateUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v38 = v5;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received notification userInfo %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, "mediaSessionWithUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "mediaProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "mediaProfiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v30 = v10;
    v16 = 0;
    v17 = *(_QWORD *)v33;
    v18 = v13;
    do
    {
      v19 = 0;
      v31 = v15;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v18);
        v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v19);
        if (objc_msgSend(v11, "containsObject:", v20))
        {
          v21 = (void *)MEMORY[0x227676638]();
          v22 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v24 = v17;
            v25 = v11;
            v26 = a1;
            v27 = v18;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v28;
            v39 = 2112;
            v40 = v20;
            _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Removing the media profile as it was changed, %@", buf, 0x16u);

            v18 = v27;
            a1 = v26;
            v11 = v25;
            v17 = v24;
            v15 = v31;
          }

          objc_autoreleasePoolPop(v21);
          objc_msgSend(*(id *)(a1 + 32), "mediaProfiles");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "removeObject:", v20);

          v16 = 1;
        }
        ++v19;
      }
      while (v15 != v19);
      v15 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);

    v10 = v30;
    if ((v16 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_callExecutionCompleteIfNoMoreOutstandingRequests");
  }
  else
  {

  }
}

void __48__HMDEventTriggerExecutionSession__restoreState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDMediaPlaybackAction *v10;
  void *v11;
  void *v12;
  HMDMediaPlaybackAction *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD aBlock[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_2;
    aBlock[3] = &unk_24E79BD80;
    aBlock[4] = WeakRetained;
    v7 = _Block_copy(aBlock);
    objc_msgSend(v5, "mediaProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = [HMDMediaPlaybackAction alloc];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaProfiles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDMediaPlaybackAction initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:](v10, "initWithUUID:mediaProfiles:playbackState:volume:playbackArchive:actionSet:", v11, v12, 2, 0, 0, 0);

      objc_msgSend(*(id *)(a1 + 32), "mediaActionRouter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_4;
      v15[3] = &unk_24E79B3A0;
      v17 = v7;
      v16 = v3;
      objc_msgSend(v14, "routeMediaActionForExecution:source:clientName:completion:", v13, 3, CFSTR("com.apple.homed"), v15);

    }
    else
    {
      (*((void (**)(void *, id))v7 + 2))(v7, v3);
    }

  }
}

void __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_3;
  v6[3] = &unk_24E79C268;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32))
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);
}

uint64_t __48__HMDEventTriggerExecutionSession__restoreState__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callExecutionComplete:", *(_QWORD *)(a1 + 40));
}

void __51__HMDEventTriggerExecutionSession__activateEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__HMDEventTriggerExecutionSession__activateEvents___block_invoke_2;
    block[3] = &unk_24E79BBD0;
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    v9 = v6;
    dispatch_async(v4, block);

  }
}

uint64_t __51__HMDEventTriggerExecutionSession__activateEvents___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Activating event failed with error %@, %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callExecutionComplete:", *(_QWORD *)(a1 + 40));
}

void __83__HMDEventTriggerExecutionSession__directlyExecuteActionSetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __83__HMDEventTriggerExecutionSession__directlyExecuteActionSetsWithCompletionHandler___block_invoke_55;
    v13[3] = &unk_24E79B3F0;
    v13[4] = v8;
    v14 = v6;
    v15 = v5;
    v16 = *(id *)(a1 + 32);
    dispatch_async(v9, v13);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self while executing action set", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

uint64_t __83__HMDEventTriggerExecutionSession__directlyExecuteActionSetsWithCompletionHandler___block_invoke_55(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleActionSetExecutionResponse:actionSetError:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __58__HMDEventTriggerExecutionSession_addEvent_causingDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addEvent:causingDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __73__HMDEventTriggerExecutionSession_userResponse_device_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_userResponse:device:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __70__HMDEventTriggerExecutionSession_postponeRestoreIfWaitingForEndEvent__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "executionState");
  if (result == 4)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Waiting for end event, received request to postpone the end event", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "_activateDurationEvents");
  }
  return result;
}

void __72__HMDEventTriggerExecutionSession_cancelSessionIfWaitingForUserResponse__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "executionState") == 2)
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Waiting for user response, received request to cancel the session", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_callExecutionComplete:", v7);

  }
}

void __57__HMDEventTriggerExecutionSession__evaluateFiringTrigger__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to fulfill read requests before evaluating trigger due to error (%@), (%@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "_callExecutionComplete:", v5);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    if (WeakRetained)
    {
      v14 = WeakRetained;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Finished read requests %@ with response %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v14, "workQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __57__HMDEventTriggerExecutionSession__evaluateFiringTrigger__block_invoke_50;
      v21[3] = &unk_24E79C268;
      v21[4] = v14;
      v22 = *(id *)(a1 + 40);
      dispatch_async(v18, v21);

    }
    else
    {
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Execution session is no more valid", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
    }
  }

}

uint64_t __57__HMDEventTriggerExecutionSession__evaluateFiringTrigger__block_invoke_50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeTriggerAfterEvaluatingCondition:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__HMDEventTriggerExecutionSession_evaluateFiringTrigger__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateFiringTrigger");
}

uint64_t __66__HMDEventTriggerExecutionSession_needsUserConfirmationForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isSameAccountWithDevice:", v3);

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_237517 != -1)
    dispatch_once(&logCategory__hmf_once_t0_237517, &__block_literal_global_237518);
  return (id)logCategory__hmf_once_v1_237519;
}

void __46__HMDEventTriggerExecutionSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_237519;
  logCategory__hmf_once_v1_237519 = v0;

}

@end
