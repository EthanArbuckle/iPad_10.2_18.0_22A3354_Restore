@implementation HMDHAPAccessoryTask

- (HMDHAPAccessoryTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDHAPAccessoryTask *v12;
  HMDHAPAccessoryTask *v13;
  uint64_t v14;
  id completion;
  uint64_t v16;
  NSMapTable *requestToResponseMap;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDHAPAccessoryTask;
  v12 = -[HMDHAPAccessoryTask init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_requests, a4);
    -[HMDHAPAccessoryTask _updatedCompletion:](v13, "_updatedCompletion:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    completion = v13->_completion;
    v13->_completion = (id)v14;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    requestToResponseMap = v13->_requestToResponseMap;
    v13->_requestToResponseMap = (NSMapTable *)v16;

  }
  return v13;
}

- (NSNumber)identifier
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTask context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)operationName
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTask context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)requestIdentifier
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTask context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestMessageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)workQueue
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTask context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)sourceType
{
  void *v2;
  unint64_t v3;

  -[HMDHAPAccessoryTask context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceType");

  return v3;
}

- (id)activity
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTask context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)characteristicResponses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[HMDHAPAccessoryTask requestToResponseMap](self, "requestToResponseMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x24BDBD1A8];
  v6 = v4;

  return v6;
}

- (BOOL)allResponsesReceived
{
  HMDHAPAccessoryTask *v2;
  void *v3;
  _QWORD v5[5];

  v2 = self;
  -[HMDHAPAccessoryTask requests](self, "requests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__HMDHAPAccessoryTask_allResponsesReceived__block_invoke;
  v5[3] = &unk_24E79AA10;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "na_allObjectsPassTest:", v5);

  return (char)v2;
}

- (unint64_t)completedRequestsCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDHAPAccessoryTask requests](self, "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_247558);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (double)executionTimeInterval
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[HMDHAPAccessoryTask executionTime](self, "executionTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryTask executionTime](self, "executionTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  HMDHAPAccessoryTask *v18;
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __39__HMDHAPAccessoryTask_debugDescription__block_invoke;
  v17 = &unk_24E79AA78;
  v18 = self;
  v19 = v3;
  v20 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "na_each:", &v14);

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[HMDHAPAccessoryTask requests](self, "requests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Requests[%@]: (\n%@%@)"), v11, v6, v7, v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask requestIdentifier](self, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDHAPAccessoryTask completedRequestsCount](self, "completedRequestsCount");
  -[HMDHAPAccessoryTask requests](self, "requests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@/%@)[%ld/%ld]"), v5, v7, v8, v9, objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)logEventsFromAccessoryRequestMap:(id)a3 accessoryList:(id)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;

  v23 = a4;
  v22 = a3;
  -[HMDHAPAccessoryTask context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHAPAccessoryTask context](self, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v25, "operationType") == 1;
  objc_msgSend(MEMORY[0x24BE4F198], "currentTime");
  v10 = v9;
  -[HMDHAPAccessoryTask context](self, "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "requestMessageIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "requestMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userForHome:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "sourceType");
  -[HMDHAPAccessoryTask context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clientBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_getLogEventsForOperation:startTime:accessories:requestMap:identifier:userUUID:source:bundleID:", v8, v23, v22, v11, v14, v16, v10, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_updateCharacteristicsWithResponses:(id)a3 accessoryRequests:(id)a4 completedGroup:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = v9;
    v12 = MEMORY[0x24BDAC760];
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __92__HMDHAPAccessoryTask__updateCharacteristicsWithResponses_accessoryRequests_completedGroup___block_invoke;
      v19[3] = &unk_24E79AAA0;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v11;
      objc_msgSend(v8, "na_each:", v19);

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __92__HMDHAPAccessoryTask__updateCharacteristicsWithResponses_accessoryRequests_completedGroup___block_invoke_2;
    v17[3] = &unk_24E79AAA0;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    objc_msgSend(v8, "na_each:", v17);
    -[HMDHAPAccessoryTask context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = CFSTR("kModifiedCharacteristicsForAccessoryKey");
    v22[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_addResponseTuplesFromDictionary:accessoryRequestMapTable:responseTuples:completedGroup:logEvents:", v16, v11, 0, v10, 0);

  }
  else
  {
    dispatch_group_leave(v10);
  }

}

- (void)sendCharacteristicNotificationsForTaskInProgress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDHAPAccessoryTask *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  HMDHAPAccessoryTask *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "na_filter:", &__block_literal_global_108_247534);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v12;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%@] Sending characteristic notifications (%ld) for task in progress.", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  if (objc_msgSend(v8, "count"))
  {
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    -[HMDHAPAccessoryTask addCharacteristicResponses:](v10, "addCharacteristicResponses:", v8);
    -[HMDHAPAccessoryTask _updateCharacteristicsWithResponses:accessoryRequests:completedGroup:](v10, "_updateCharacteristicsWithResponses:accessoryRequests:completedGroup:", v8, 0, v13);
    -[HMDHAPAccessoryTask context](v10, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__HMDHAPAccessoryTask_sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_109;
    block[3] = &unk_24E79B440;
    block[4] = v10;
    v17 = v8;
    v18 = v7;
    dispatch_group_notify(v13, v15, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, void *, _QWORD))v7 + 2))(v7, 0, v8, 0);
  }

}

- (void)_sendCharacteristicNotificationsForTaskInProgress:(id)a3 completion:(id)a4
{
  void *v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  HMDCharacteristicResponseNotificationContext *v17;
  void *v18;
  HMDCharacteristicResponseNotificationContext *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHAPAccessoryTask *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  HMDCharacteristicResponseNotificationContext *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  HMDHAPAccessoryTask *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  _QWORD v65[3];
  _QWORD v66[5];

  v66[3] = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v48 = a4;
  objc_msgSend(v47, "na_filter:", &__block_literal_global_111_247525);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[HMDHAPAccessoryTask context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHAPAccessoryTask context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workQueue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHAPAccessoryTask context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isRemote") & 1) != 0)
    {
      objc_msgSend(v7, "na_map:", &__block_literal_global_120_247532);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringForKey:", CFSTR("kRequestIdentifierKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
      {
        objc_msgSend(v9, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = -[HMDHAPAccessoryTask supportsMultiPartResponse](self, "supportsMultiPartResponse");
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_5;
      v49[3] = &unk_24E79AB68;
      v50 = v46;
      v52 = v48;
      v51 = v7;
      objc_msgSend(v12, "_handleSendingNotificationsForRequest:requestIdentifier:supportsMultiPartResponse:characteristicUpdates:completion:", v9, v15, v16, v13, v49);
      v17 = (HMDCharacteristicResponseNotificationContext *)v13;
      if (!v14)
      {

      }
      v18 = v50;
    }
    else
    {
      v19 = [HMDCharacteristicResponseNotificationContext alloc];
      objc_msgSend(v9, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMDCharacteristicResponseNotificationContext initWithRequestIdentifier:responses:pendingMultiPartResponses:](v19, "initWithRequestIdentifier:responses:pendingMultiPartResponses:", v20, v7, 1);

      v65[0] = CFSTR("kModifiedCharacteristicsForAccessoryKey");
      -[HMDCharacteristicResponseNotificationContext notificationPayloadByAccessoryUUID](v17, "notificationPayloadByAccessoryUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v21;
      v65[1] = CFSTR("kHomeUUID");
      objc_msgSend(v12, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v45 = v12;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = CFSTR("kMultiPartResponseKey");
      v66[1] = v23;
      v66[2] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
      v24 = objc_claimAutoreleasedReturnValue();

      v12 = v45;
      v25 = objc_alloc(MEMORY[0x24BE3F1B8]);
      objc_msgSend(v45, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "initWithTarget:", v26);

      v28 = objc_alloc(MEMORY[0x24BE3F1D0]);
      v29 = objc_msgSend(v9, "qualityOfService");
      if (v29)
        v30 = v29;
      else
        v30 = 17;
      v43 = (void *)v27;
      v44 = (void *)v24;
      v31 = (void *)objc_msgSend(v28, "initWithName:qualityOfService:destination:payload:", CFSTR("kMultipleCharacteristicValuesUpdatedNotificationKey"), v30, v27, v24);
      objc_msgSend(v9, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setIdentifier:", v32);

      v33 = (void *)MEMORY[0x227676638](objc_msgSend(v31, "setRequiresSPIEntitlement:", objc_msgSend(v9, "requiresSPIEntitlement")));
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v7, "count");
        objc_msgSend(v9, "shortDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v58 = v36;
        v59 = 2112;
        v60 = v34;
        v61 = 2048;
        v62 = v37;
        v63 = 2112;
        v64 = v38;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Sending the multi-part responses[%ld] to local client: %@", buf, 0x2Au);

        v12 = v45;
      }

      objc_autoreleasePoolPop(v33);
      objc_msgSend(v7, "na_each:", &__block_literal_global_116_247531);
      objc_msgSend(v9, "proxyConnection");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "canSendMessage:", v31))
      {
        objc_msgSend(v12, "handleReportingSessionResponseMessage:", v31);
        v40 = v17;
        v41 = (void *)objc_msgSend(v31, "copy");
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_2;
        v53[3] = &unk_24E79AB68;
        v54 = v46;
        v56 = v48;
        v55 = v7;
        objc_msgSend(v39, "sendMessage:completionHandler:", v41, v53);

        v17 = v40;
        v42 = v54;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *, void *))v48 + 2))(v48, 0, v7, v42);
      }

      v18 = v43;
      v14 = v44;
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, void *, _QWORD))v48 + 2))(v48, 0, v7, 0);
  }

}

- (void)sendCharacteristicNotificationsForCompletedTask:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HMDHAPAccessoryTask *v8;
  NSObject *v9;
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
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  HMDHAPAccessoryTask *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27 = a4;
  v7 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "na_each:", &__block_literal_global_122_247520));
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v10;
    v37 = 2112;
    v38 = v8;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%@] Sending characteristic notifications for completed task", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDHAPAccessoryTask context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHAPAccessoryTask context](v8, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHAPAccessoryTask context](v8, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHAPAccessoryTask requests](v8, "requests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "na_map:", &__block_literal_global_125_247522);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, v16);
  -[HMDHAPAccessoryTask context](v8, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "requestMessageIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMDHAPAccessoryTask supportsMultiPartResponse](v8, "supportsMultiPartResponse");
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_2;
  v28[3] = &unk_24E79AC30;
  objc_copyWeak(&v34, (id *)buf);
  v22 = v12;
  v29 = v22;
  v23 = v18;
  v30 = v23;
  v24 = v14;
  v31 = v24;
  v25 = v27;
  v33 = v25;
  v26 = v6;
  v32 = v26;
  objc_msgSend(v16, "_notifyChangedCharacteristics:identifier:multiPartResponse:moreMessagesInMultipart:requestMessage:withCompletionHandler:", v26, v20, v21, 0, v22, v28);

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);

}

- (void)finishTaskWithCharacteristicResponses:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  HMDHAPAccessoryTask *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  HMDHAPAccessoryTask *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHAPAccessoryTask context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isComplete");

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPAccessoryTask context](v11, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "requestMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] associated context is already completed: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 1, 0, 0);
  }
  else
  {
    -[HMDHAPAccessoryTask addCharacteristicResponses:](self, "addCharacteristicResponses:", v6);
    if (-[HMDHAPAccessoryTask supportsMultiPartResponse](self, "supportsMultiPartResponse")
      && !-[HMDHAPAccessoryTask allResponsesReceived](self, "allResponsesReceived"))
    {
      -[HMDHAPAccessoryTask sendCharacteristicNotificationsForTaskInProgress:completion:](self, "sendCharacteristicNotificationsForTaskInProgress:completion:", v6, v7);
    }
    else
    {
      -[HMDHAPAccessoryTask characteristicResponses](self, "characteristicResponses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPAccessoryTask sendCharacteristicNotificationsForCompletedTask:completion:](self, "sendCharacteristicNotificationsForCompletedTask:completion:", v16, v7);

    }
  }

}

- (BOOL)supportsMultiPartResponse
{
  void *v2;
  char v3;

  -[HMDHAPAccessoryTask context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsMultiPartResponse");

  return v3;
}

- (void)addCharacteristicResponses:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__HMDHAPAccessoryTask_addCharacteristicResponses___block_invoke;
  v3[3] = &unk_24E79AAA0;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

- (id)_updatedCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HMDHAPAccessoryTask__updatedCompletion___block_invoke;
  aBlock[3] = &unk_24E79AC58;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (void)execute
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDHAPAccessoryTaskContext)context
{
  return (HMDHAPAccessoryTaskContext *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)requests
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMapTable)requestToResponseMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 24, 1);
}

- (id)completion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSDate)executionTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExecutionTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_requestToResponseMap, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __42__HMDHAPAccessoryTask__updatedCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addCharacteristicResponses:", v3);
    v6 = objc_msgSend(v5, "supportsMultiPartResponse");
    v7 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
    }
    else
    {
      objc_msgSend(v5, "characteristicResponses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for fallback task completion handler", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1A8]);
  }

}

void __50__HMDHAPAccessoryTask_addCharacteristicResponses___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "requestToResponseMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v4);

}

void __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (objc_msgSend(*(id *)(a1 + 32), "isRemote"))
    objc_msgSend(WeakRetained, "_sendCoalescedRemoteNotificationsForRequestMessage:accessories:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v5) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_3;
  block[3] = &unk_24E79B440;
  v14 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 56);
  v13 = v8;
  v10 = v8;
  dispatch_async(v9, block);

}

uint64_t __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

uint64_t __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke_123(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

void __82__HMDHAPAccessoryTask_sendCharacteristicNotificationsForCompletedTask_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "request");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompleted:", 1);

}

void __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_3;
  block[3] = &unk_24E79B440;
  v9 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (objc_msgSend(v3, "isHMError"))
  {
    v4 = v3;
    if (objc_msgSend(v3, "code") == 48)
    {

      v4 = 0;
    }
  }
  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_6;
  block[3] = &unk_24E79B440;
  v10 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 0, a1[4], a1[5]);
}

HMDCharacteristicUpdateTuple *__84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  HMDCharacteristicUpdateTuple *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCharacteristicUpdateTuple *v7;

  v2 = a2;
  v3 = [HMDCharacteristicUpdateTuple alloc];
  objc_msgSend(v2, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCharacteristicUpdateTuple initWithCharacteristic:updatedValue:isBroadcast:](v3, "initWithCharacteristic:updatedValue:isBroadcast:", v5, v6, 0);

  -[HMDCharacteristicUpdateTuple setCharacteristicResponse:](v7, "setCharacteristicResponse:", v2);
  return v7;
}

uint64_t __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 0, a1[4], a1[5]);
}

void __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_115(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "request");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompleted:", 1);

}

BOOL __84__HMDHAPAccessoryTask__sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isCompleted") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

uint64_t __83__HMDHAPAccessoryTask_sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke_109(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCharacteristicNotificationsForTaskInProgress:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

BOOL __83__HMDHAPAccessoryTask_sendCharacteristicNotificationsForTaskInProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isCompleted") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

void __92__HMDHAPAccessoryTask__updateCharacteristicsWithResponses_accessoryRequests_completedGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v12 = v3;
  objc_msgSend(v3, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "addObject:", v12);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v12, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v11);

}

void __92__HMDHAPAccessoryTask__updateCharacteristicsWithResponses_accessoryRequests_completedGroup___block_invoke_2(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "instanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v12 && v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "hmf_mutableDictionaryForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    objc_msgSend(v16, "hmf_mutableDictionaryForKey:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    objc_msgSend(v22, "characteristicUpdateDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v7);

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, v12);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v10);

  }
}

void __39__HMDHAPAccessoryTask_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  id v26;

  v26 = a2;
  objc_msgSend(*(id *)(a1 + 32), "requestToResponseMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v26, "isCompleted");
  v8 = 48;
  if (v7)
    v8 = 40;
  v9 = *(id *)(a1 + v8);
  v10 = objc_msgSend(v26, "isCompleted");
  v11 = CFSTR("-");
  if (v10)
    v11 = CFSTR("*");
  v25 = v11;
  objc_msgSend(v6, "value");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_24E79DB48;
  objc_msgSend(v6, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "domain");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v2, "code"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)v17;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@"), v17, v3);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &stru_24E79DB48;
  }
  objc_msgSend(v6, "valueUpdatedTime");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_24E79DB48;
  objc_msgSend(v9, "appendFormat:", CFSTR("\t[%@] %@ --> Response: <%@%@(%@)>\n"), v25, v26, v14, v19, v22);

  if (v15)
  {

  }
}

uint64_t __45__HMDHAPAccessoryTask_completedRequestsCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCompleted");
}

BOOL __43__HMDHAPAccessoryTask_allResponsesReceived__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "requestToResponseMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

@end
