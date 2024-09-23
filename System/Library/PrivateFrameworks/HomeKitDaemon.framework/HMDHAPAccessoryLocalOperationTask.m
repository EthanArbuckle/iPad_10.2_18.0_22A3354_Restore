@implementation HMDHAPAccessoryLocalOperationTask

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDHAPAccessoryLocalOperationTask *v16;
  NSObject *v17;
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
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *group;
  uint64_t v35;
  HMDHAPAccessoryLocalOperationTask *v36;
  id obj;
  _QWORD block[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  HMDHAPAccessoryLocalOperationTask *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask setExecutionTime:](self, "setExecutionTime:", v3);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  -[HMDHAPAccessoryTask context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v4;
  accessoryRequestMapFromRequests(v5, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  group = dispatch_group_create();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v8;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v35)
  {
    v33 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPAccessoryTask activity](v36, "activity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPAccessoryTask operationName](v36, "operationName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "markWithFormat:", CFSTR("Starting %@ for accessory: %@"), v13, v14);

        v15 = (void *)MEMORY[0x227676638]();
        v16 = v36;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "UUIDString");
          v32 = v15;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v11, "count");
          *(_DWORD *)buf = 138544642;
          v44 = v18;
          v45 = 2114;
          v46 = v36;
          v47 = 2112;
          v48 = v19;
          v49 = 2114;
          v50 = v21;
          v51 = 2114;
          v52 = v22;
          v53 = 2048;
          v54 = v23;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting for accessory %@/%{public}@/%{public}@ with %ld requests", buf, 0x3Eu);

          v15 = v32;
        }

        objc_autoreleasePoolPop(v15);
        -[HMDHAPAccessoryTask activity](v16, "activity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPAccessoryLocalOperationTask activityRequestEventName](v16, "activityRequestEventName");

        -[HMDHAPAccessoryTask operationName](v16, "operationName");
        objc_msgSend(v10, "uuid");

        objc_msgSend(v11, "count");
        -[HMDHAPAccessoryLocalOperationTask logEvents](v16, "logEvents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(group);
        -[HMDHAPAccessoryLocalOperationTask _completionHandlerForAccessory:accessoryRequests:responseWaitGroup:](v16, "_completionHandlerForAccessory:accessoryRequests:responseWaitGroup:", v10, v11, group);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPAccessoryLocalOperationTask _dispatchToAccessory:requests:logEvent:completion:](v16, "_dispatchToAccessory:requests:logEvent:completion:", v10, v11, v28, v29);

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    }
    while (v35);
  }

  -[HMDHAPAccessoryTask addCharacteristicResponses:](v36, "addCharacteristicResponses:", v31);
  -[HMDHAPAccessoryTask workQueue](v36, "workQueue");
  v30 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__HMDHAPAccessoryLocalOperationTask_execute__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v36;
  dispatch_group_notify(group, v30, block);

}

- (id)_completionHandlerForAccessory:(id)a3 accessoryRequests:(id)a4 responseWaitGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__HMDHAPAccessoryLocalOperationTask__completionHandlerForAccessory_accessoryRequests_responseWaitGroup___block_invoke;
  v16[3] = &unk_24E79AC80;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = _Block_copy(v16);

  return v14;
}

- (NSString)activityRequestEventName
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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HMDHAPAccessoryLocalOperationTask.MultiCharacteristic%@Accessory"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)activityResponseEventName
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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HMDHAPAccessoryLocalOperationTask.MultiCharacteristic%@Response"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)_dispatchToAccessory:(id)a3 requests:(id)a4 logEvent:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDBCE88];
  v15 = *MEMORY[0x24BDBCAB0];
  v16 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ is unavailable"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v18, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v19);
}

- (NSDictionary)logEvents
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLogEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvents, 0);
}

void __104__HMDHAPAccessoryLocalOperationTask__completionHandlerForAccessory_accessoryRequests_responseWaitGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD);
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v50, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v8), "error");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (void *)v10;
        else
          v12 = v9;
        v6 = v12;

        objc_msgSend(*(id *)(a1 + 32), "activity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "activityResponseEventName");

        objc_msgSend(*(id *)(a1 + 40), "uuid");
        objc_msgSend(v11, "domain");

        objc_msgSend(v11, "code");
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v50, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v14 = (void *)MEMORY[0x227676638]();
  v15 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v27 = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v3, "count");
    v21 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(*(id *)(a1 + 32), "executionTimeInterval");
    *(_DWORD *)buf = 138545410;
    v33 = v17;
    v34 = 2114;
    v35 = v18;
    v36 = 2112;
    v37 = v25;
    v38 = 2114;
    v39 = v19;
    v40 = 2114;
    v41 = v20;
    v42 = 2048;
    v43 = v24;
    v44 = 2048;
    v45 = v21;
    v46 = 2048;
    v47 = v22;
    v48 = 2114;
    v49 = v6;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Completed operation for accessory %@/%{public}@/%{public}@ with %ld/%ld responses. Execution Time: %.3fs. Error: %{public}@", buf, 0x5Cu);

    v14 = v27;
  }

  objc_autoreleasePoolPop(v14);
  objc_msgSend(*(id *)(a1 + 32), "addCharacteristicResponses:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 32), "supportsMultiPartResponse"))
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v23)[2](v23, v3);

  }
}

void __44__HMDHAPAccessoryLocalOperationTask_execute__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  if ((objc_msgSend(*(id *)(a1 + 32), "supportsMultiPartResponse") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "characteristicResponses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v2);

  }
}

@end
