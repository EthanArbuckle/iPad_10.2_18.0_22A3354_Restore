@implementation HMDHAPAccessoryRemoteOperationTask

- (HMDHAPAccessoryRemoteOperationTask)initWithContext:(id)a3 remoteMessageName:(id)a4 requests:(id)a5 delegateDevice:(id)a6 timeout:(double)a7 completion:(id)a8
{
  id v15;
  id v16;
  HMDHAPAccessoryRemoteOperationTask *v17;
  HMDHAPAccessoryRemoteOperationTask *v18;
  objc_super v20;

  v15 = a4;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDHAPAccessoryRemoteOperationTask;
  v17 = -[HMDHAPAccessoryTask initWithContext:requests:completion:](&v20, sel_initWithContext_requests_completion_, a3, a5, a8);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_remoteMessageName, a4);
    objc_storeStrong((id *)&v18->_delegateDevice, a6);
    v18->_remoteMessageTimeout = a7;
  }

  return v18;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  HMDHAPAccessoryRemoteOperationTask *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id obj;
  void *v31;
  _QWORD block[5];
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  id v36;
  id location;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  HMDHAPAccessoryRemoteOperationTask *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask setExecutionTime:](self, "setExecutionTime:", v3);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask requests](self, "requests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessoryRequestMapFromRequests(v4, v31, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHAPAccessoryTask addCharacteristicResponses:](self, "addCharacteristicResponses:", v31);
  -[HMDHAPAccessoryRemoteOperationTask _remoteMessageFromAccessoryRequestMap:](self, "_remoteMessageFromAccessoryRequestMap:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryRemoteOperationTask remoteMessageTimeout](self, "remoteMessageTimeout");
  objc_msgSend(v8, "setTimeout:");
  objc_msgSend(v8, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kAccessoriesListKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask logEventsFromAccessoryRequestMap:accessoryList:](self, "logEventsFromAccessoryRequestMap:accessoryList:", v7, v10);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[HMDHAPAccessoryTask activity](self, "activity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPAccessoryRemoteOperationTask activityRequestEventName](self, "activityRequestEventName");

        -[HMDHAPAccessoryTask operationName](self, "operationName");
        objc_msgSend(v15, "uuid");

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v12);
  }

  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  objc_initWeak(&location, self);
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke;
  v33[3] = &unk_24E79ACA8;
  objc_copyWeak(&v36, &location);
  v29 = v11;
  v34 = v29;
  v18 = v17;
  v35 = v18;
  objc_msgSend(v8, "setResponseHandler:", v33);
  objc_storeStrong((id *)&self->_logEvents, obj);
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription", v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationTask delegateDevice](v20, "delegateDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shortDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v43 = v22;
    v44 = 2114;
    v45 = v20;
    v46 = 2114;
    v47 = v23;
    v48 = 2114;
    v49 = v25;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Dispatching message: %{public}@ to device: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDHAPAccessoryTask context](v20, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryRemoteOperationTask delegateDevice](v20, "delegateDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dispatchMessage:delegateDevice:", v8, v27);

  -[HMDHAPAccessoryTask workQueue](v20, "workQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke_262;
  block[3] = &unk_24E79C240;
  block[4] = v20;
  dispatch_group_notify(v18, v28, block);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

- (void)_receivedRemotelyChangedCharacteristicResponses:(id)a3 message:(id)a4
{
  id v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[HMDHAPAccessoryTask workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v14, "count")
    && -[HMDHAPAccessoryTask supportsMultiPartResponse](self, "supportsMultiPartResponse")
    && !-[HMDHAPAccessoryRemoteOperationTask isFinished](self, "isFinished"))
  {
    -[HMDHAPAccessoryTask completion](self, "completion");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v14);

    if (-[HMDHAPAccessoryTask allResponsesReceived](self, "allResponsesReceived"))
      -[HMDHAPAccessoryRemoteOperationTask setFinished:](self, "setFinished:", 1);
    v9 = (void *)objc_opt_class();
    -[HMDHAPAccessoryRemoteOperationTask logEvents](self, "logEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryTask requestIdentifier](self, "requestIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateLogEvents:withResponses:remoteMessageResponse:forTaskID:shouldSubmit:", v10, v14, v11, v13, 1);

  }
}

- (id)activityRequestEventName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDHAPAccessoryTask operationName](self, "operationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capitalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HMDHAPAccessoryRemoteOperationTask.Forward%@sToResident"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_remoteMessageFromAccessoryRequestMap:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  _QWORD v57[6];

  v57[5] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHAPAccessoryRemoteOperationTask _buildMessageAccessoryListFromAccessoryRequestMap:accessoryList:](self, "_buildMessageAccessoryListFromAccessoryRequestMap:accessoryList:", v5, v6);

  if (objc_msgSend(v6, "count"))
  {
    if (v7)
    {
      v8 = 1;
    }
    else
    {
      -[HMDHAPAccessoryTask context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "BOOLForKey:", CFSTR("kShortActionKey"));

    }
    -[HMDHAPAccessoryTask context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuidForKey:", CFSTR("kActionSetUUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = 1;
    else
      v15 = v8;
    v52 = (void *)MEMORY[0x24BDBCED8];
    v55 = v6;
    v56[0] = CFSTR("kAccessoriesListKey");
    v54 = (void *)objc_msgSend(v6, "copy");
    v57[0] = v54;
    v56[1] = CFSTR("kHomeUUID");
    -[HMDHAPAccessoryTask context](self, "context");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "homeUniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v17;
    v56[2] = CFSTR("kShortActionKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v18;
    v56[3] = CFSTR("kDoNotForwardMessageKey");
    v19 = (void *)MEMORY[0x24BDD16E0];
    -[HMDHAPAccessoryRemoteOperationTask delegateDevice](self, "delegateDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInt:", v20 != 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v21;
    v56[4] = CFSTR("kRequestIdentifierKey");
    -[HMDHAPAccessoryTask requestIdentifier](self, "requestIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v57[4] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryWithDictionary:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHAPAccessoryTask context](self, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "requestMessage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberForKey:", CFSTR("kMessageOriginalSourceKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("kMessageOriginalSourceKey"));
    -[HMDHAPAccessoryTask context](self, "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "requestMessage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringForKey:", CFSTR("kMessageUserOverrideKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, CFSTR("kMessageUserOverrideKey"));
    -[HMDHAPAccessoryRemoteOperationTask remoteMessageName](self, "remoteMessageName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryTask context](self, "context");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "requestMessage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("kCharacteristicReadRequestKey"));

    if (v36)
    {
      -[HMDHAPAccessoryTask context](self, "context");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "requestMessage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "name");
      v39 = objc_claimAutoreleasedReturnValue();

      -[HMDHAPAccessoryTask context](self, "context");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "requestMessage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "messagePayload");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addEntriesFromDictionary:", v42);

      v32 = (void *)v39;
    }
    if (-[HMDHAPAccessoryTask supportsMultiPartResponse](self, "supportsMultiPartResponse"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDHAPAccessoryTask supportsMultiPartResponse](self, "supportsMultiPartResponse"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v43, CFSTR("kMultiPartResponseKey"));

    }
    -[HMDHAPAccessoryTask context](self, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "qualityOfService");

    if (v45 <= 17)
      v46 = 17;
    else
      v46 = v45;
    v47 = (void *)MEMORY[0x24BE3F1D0];
    -[HMDHAPAccessoryTask context](self, "context");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "homeMessageDestination");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v47, "messageWithName:qualityOfService:destination:payload:", v32, v46, v49, v50);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v55;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_buildMessageAccessoryListFromAccessoryRequestMap:(id)a3 accessoryList:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 |= -[HMDHAPAccessoryRemoteOperationTask _buildMessageAccessoryListFromRequests:accessoryList:](self, "_buildMessageAccessoryListFromRequests:accessoryList:", v13, v7);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10 & 1;
}

- (BOOL)_buildMessageAccessoryListFromRequests:(id)a3 accessoryList:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  uint64_t v32;
  HMDHAPAccessoryRemoteOperationTask *v33;
  uint64_t v34;
  id obj;
  id v36;
  id v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v36 = a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v41;
    v32 = *(_QWORD *)v41;
    v33 = self;
    do
    {
      v10 = 0;
      v34 = v7;
      do
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
        objc_msgSend(v11, "characteristic");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "service");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accessory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          v16 = v13 == 0;
        else
          v16 = 1;
        if (!v16 && v12 != 0)
        {
          v18 = v8;
          objc_msgSend(v14, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "hmf_mutableDictionaryForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v21, v20);
          }
          -[HMDHAPAccessoryTask context](self, "context");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isShortActionOperation");

          v24 = v18;
          if (v23)
          {
            objc_msgSend(v36, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kShortActionKey"));
            v24 = 1;
          }
          if (objc_msgSend(v15, "hasBTLELink") && (objc_msgSend(v15, "hasIPLink") & 1) == 0)
          {
            v39 = 0;
            v38 = 5;
            objc_msgSend(v15, "home");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0;
            objc_msgSend(v25, "retrieveStateForTrackedAccessory:stateNumber:isReachable:linkQuality:lastSeen:", v26, 0, &v39, &v38, &v37);
            v31 = v37;

            if (v39)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v38);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", v20);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("kAccessoryLinkQuality"));

              objc_msgSend(v36, "objectForKeyedSubscript:", v20);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("kAccessoryLastSeen"));

            }
          }
          self = v33;
          v8 = -[HMDHAPAccessoryRemoteOperationTask _appendServiceListWithRequest:serviceList:](v33, "_appendServiceListWithRequest:serviceList:", v11, v21) | v24;

          v7 = v34;
          v9 = v32;
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (BOOL)_appendServiceListWithRequest:(id)a3 serviceList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (NSString)remoteMessageName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (HMDDevice)delegateDevice
{
  return (HMDDevice *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)logEvents
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (double)remoteMessageTimeout
{
  return self->_remoteMessageTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvents, 0);
  objc_storeStrong((id *)&self->_delegateDevice, 0);
  objc_storeStrong((id *)&self->_remoteMessageName, 0);
}

void __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v45 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v41 = v6;
      v42 = v5;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = *(id *)(a1 + 32);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      if (v46)
      {
        v44 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v52 != v44)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(v45 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v48;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v48 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
                  objc_msgSend(v8, "requestToResponseMap");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKey:", v16);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v18)
                    objc_msgSend(v9, "addObject:", v16);
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
              }
              while (v13);
            }

          }
          v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        }
        while (v46);
      }

      v5 = v42;
      +[HMDCharacteristicResponse responsesWithRequests:error:](HMDCharacteristicResponse, "responsesWithRequests:error:", v9, v42);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v8;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 138544130;
        v56 = v23;
        v57 = 2112;
        v58 = v21;
        v59 = 2048;
        v60 = v24;
        v61 = 2112;
        v62 = v42;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received remote characteristic responses: [%ld] with error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v20);

      v6 = v41;
    }
    else
    {
      objc_msgSend(WeakRetained, "requests");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicResponse responsesWithRequests:characteristicUpdateDictionary:](HMDCharacteristicResponse, "responsesWithRequests:characteristicUpdateDictionary:", v28, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x227676638]();
      v30 = v8;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = v32;
        v57 = 2112;
        v58 = v30;
        v59 = 2048;
        v60 = objc_msgSend(v19, "count");
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received remote characteristic responses: [%ld]", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v29);
    }
    objc_msgSend(v8, "addCharacteristicResponses:", v19);
    objc_msgSend(v8, "context");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "home");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isCurrentDevicePrimaryResident");

    if ((v35 & 1) == 0)
    {
      objc_msgSend(v8, "characteristicResponses");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_updateCharacteristicsWithResponses:accessoryRequests:completedGroup:", v36, *(_QWORD *)(v45 + 32), *(_QWORD *)(v45 + 40));

    }
    v37 = (void *)objc_opt_class();
    objc_msgSend(v8, "logEvents");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "UUIDString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "updateLogEvents:withResponses:remoteMessageResponse:forTaskID:shouldSubmit:", v38, v19, v6, v40, 0);

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for remote operation message response handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

}

void __45__HMDHAPAccessoryRemoteOperationTask_execute__block_invoke_262(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "characteristicResponses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v2);

  }
}

@end
