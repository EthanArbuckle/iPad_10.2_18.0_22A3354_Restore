@implementation HMDHAPAccessoryReaderWriter

- (HMDHAPAccessoryReaderWriter)initWithHome:(id)a3
{
  id v4;
  HMDHAPAccessoryReaderWriterDataSource *v5;
  HMDHAPAccessoryReaderWriter *v6;

  v4 = a3;
  v5 = objc_alloc_init(HMDHAPAccessoryReaderWriterDataSource);
  v6 = -[HMDHAPAccessoryReaderWriter initWithHome:dataSource:](self, "initWithHome:dataSource:", v4, v5);

  return v6;
}

- (HMDHAPAccessoryReaderWriter)initWithHome:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  HMDHAPAccessoryReaderWriter *v8;
  HMDHAPAccessoryTaskTracker *v9;
  HMDHAPAccessoryTaskTracker *tracker;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHAPAccessoryReaderWriter;
  v8 = -[HMDHAPAccessoryReaderWriter init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(HMDHAPAccessoryTaskTracker);
    tracker = v8->_tracker;
    v8->_tracker = v9;

    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v8;
}

- (void)handleRemotelyUpdatedCharacteristicsMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kRequestIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDHAPAccessoryReaderWriter tracker](self, "tracker", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pendingRemoteTasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "supportsMultiPartResponse"))
        {
          if ((objc_msgSend(v12, "allResponsesReceived") & 1) == 0)
          {
            objc_msgSend(v12, "requestIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "UUIDString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v5);

            if (v15)
            {
              objc_msgSend(v12, "requests");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "messagePayload");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDCharacteristicResponse responsesWithRequests:characteristicUpdateDictionary:](HMDCharacteristicResponse, "responsesWithRequests:characteristicUpdateDictionary:", v16, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "_receivedRemotelyChangedCharacteristicResponses:message:", v18, v4);
            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (void)submitReadRequests:(id)a3 sourceType:(unint64_t)a4 requestMessage:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMDHAPAccessoryTaskContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDHAPAccessoryTaskContext *v19;
  void *v20;
  void *v21;
  HMDHAPAccessoryReaderWriter *v22;
  NSObject *v23;
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
  HMDHAPAccessoryTaskContext *v34;
  void *v35;
  id v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[HMDHAPAccessoryReaderWriter tracker](self, "tracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "nextTaskIdentifier"));
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = [HMDHAPAccessoryTaskContext alloc];
  -[HMDHAPAccessoryReaderWriter home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@, %s:%ld"), v17, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/HMDHAPAccessoryReaderWriter.m", 2390);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v13;
  v19 = -[HMDHAPAccessoryTaskContext initWithIdentifier:operationType:home:sourceType:requestMessage:name:](v14, "initWithIdentifier:operationType:home:sourceType:requestMessage:name:", v13, 0, v15, a4, v10, v18);

  -[HMDHAPAccessoryReaderWriter _defaultTaskForCurrentDeviceWithContext:requests:](self, "_defaultTaskForCurrentDeviceWithContext:requests:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = v19;
    v24 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shortDescription");
    v36 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDD16E0];
    -[HMDHAPAccessoryReaderWriter tracker](v22, "tracker");
    v35 = v21;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pendingTasks");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v24, "timeout");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v39 = v25;
    v40 = 2114;
    v41 = v20;
    v42 = 2114;
    v43 = v26;
    v44 = 2114;
    v45 = v30;
    v46 = 2114;
    v47 = v32;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Executing with request: %{public}@. Current Tasks: %{public}@. Request Timeout %{public}@", buf, 0x34u);

    v21 = v35;
    v9 = v36;

    v10 = v24;
    v19 = v34;
  }

  objc_autoreleasePoolPop(v21);
  -[HMDHAPAccessoryReaderWriter tracker](v22, "tracker");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "executeTask:", v20);

}

- (id)_defaultTaskForCurrentDeviceWithContext:(id)a3 requests:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  objc_class *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "operationType");
  objc_msgSend(v6, "requestMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDHAPAccessoryReaderWriter _cannotForwardMessage:](self, "_cannotForwardMessage:", v8);

  -[HMDHAPAccessoryReaderWriter _completionHandlerWithContext:](self, "_completionHandlerWithContext:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_9;
  if (!-[HMDHAPAccessoryReaderWriter _isNotResidentDevice](self, "_isNotResidentDevice"))
  {
    if (!-[HMDHAPAccessoryReaderWriter _isSecondaryResidentDevice](self, "_isSecondaryResidentDevice")
      || (objc_msgSend(v6, "requestMessage"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "isRemote"),
          v12,
          (v13 & 1) != 0))
    {
      if (!-[HMDHAPAccessoryReaderWriter _isPrimaryResidentDevice](self, "_isPrimaryResidentDevice"))
        goto LABEL_9;
      -[HMDHAPAccessoryReaderWriter dataSource](self, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isWholeHomeBluetoothSupported");

      if ((v15 & 1) != 0)
        goto LABEL_9;
    }
  }
  v11 = (objc_class *)objc_opt_class();
  if (!v11)
LABEL_9:
    v11 = (objc_class *)objc_opt_class();
  v16 = (void *)objc_msgSend([v11 alloc], "initWithContext:requests:completion:", v6, v7, v10);

  return v16;
}

- (void)submitWriteRequests:(id)a3 sourceType:(unint64_t)a4 requestMessage:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMDHAPAccessoryTaskContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDHAPAccessoryTaskContext *v19;
  void *v20;
  void *v21;
  HMDHAPAccessoryReaderWriter *v22;
  NSObject *v23;
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
  HMDHAPAccessoryTaskContext *v34;
  void *v35;
  id v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[HMDHAPAccessoryReaderWriter tracker](self, "tracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "nextTaskIdentifier"));
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = [HMDHAPAccessoryTaskContext alloc];
  -[HMDHAPAccessoryReaderWriter home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x227675180](self, a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@, %s:%ld"), v17, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/HMDHAPAccessoryReaderWriter.m", 2436);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v13;
  v19 = -[HMDHAPAccessoryTaskContext initWithIdentifier:operationType:home:sourceType:requestMessage:name:](v14, "initWithIdentifier:operationType:home:sourceType:requestMessage:name:", v13, 1, v15, a4, v10, v18);

  -[HMDHAPAccessoryReaderWriter _defaultTaskForCurrentDeviceWithContext:requests:](self, "_defaultTaskForCurrentDeviceWithContext:requests:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = v19;
    v24 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shortDescription");
    v36 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDD16E0];
    -[HMDHAPAccessoryReaderWriter tracker](v22, "tracker");
    v35 = v21;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pendingTasks");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v24, "timeout");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v39 = v25;
    v40 = 2114;
    v41 = v20;
    v42 = 2114;
    v43 = v26;
    v44 = 2114;
    v45 = v30;
    v46 = 2114;
    v47 = v32;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Executing with request: %{public}@. Current Tasks: %{public}@. Request Timeout %{public}@", buf, 0x34u);

    v21 = v35;
    v9 = v36;

    v10 = v24;
    v19 = v34;
  }

  objc_autoreleasePoolPop(v21);
  -[HMDHAPAccessoryReaderWriter tracker](v22, "tracker");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "executeTask:", v20);

}

- (BOOL)_cannotForwardMessage:(id)a3
{
  return objc_msgSend(a3, "BOOLForKey:", CFSTR("kDoNotForwardMessageKey"));
}

- (BOOL)_isNotResidentDevice
{
  void *v2;
  char v3;

  -[HMDHAPAccessoryReaderWriter home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDeviceAvailableResident") ^ 1;

  return v3;
}

- (BOOL)_isSecondaryResidentDevice
{
  void *v2;
  int v3;

  -[HMDHAPAccessoryReaderWriter home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isCurrentDeviceAvailableResident"))
    v3 = objc_msgSend(v2, "isCurrentDevicePrimaryResident") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (BOOL)_isPrimaryResidentDevice
{
  void *v2;
  char v3;

  -[HMDHAPAccessoryReaderWriter home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevicePrimaryResident");

  return v3;
}

- (id)_completionHandlerWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD aBlock[5];
  id v12;
  id v13;

  v4 = a3;
  -[HMDHAPAccessoryReaderWriter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HMDHAPAccessoryReaderWriter__completionHandlerWithContext___block_invoke;
  aBlock[3] = &unk_24E79AE58;
  aBlock[4] = self;
  v12 = v4;
  v13 = v6;
  v7 = v6;
  v8 = v4;
  v9 = _Block_copy(aBlock);

  return v9;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHAPAccessoryReaderWriter home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDHAPAccessoryTaskTracker)tracker
{
  return (HMDHAPAccessoryTaskTracker *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDHAPAccessoryReaderWriterDataSource)dataSource
{
  return (HMDHAPAccessoryReaderWriterDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_tracker, 0);
}

void __61__HMDHAPAccessoryReaderWriter__completionHandlerWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "tracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__HMDHAPAccessoryReaderWriter__completionHandlerWithContext___block_invoke_2;
  v13[3] = &unk_24E79AE30;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v14 = v9;
  v15 = v10;
  v16 = v8;
  v17 = v11;
  v12 = v8;
  objc_msgSend(v12, "finishTaskWithCharacteristicResponses:completion:", v4, v13);

}

void __61__HMDHAPAccessoryReaderWriter__completionHandlerWithContext___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
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
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "tracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removePendingTaskWithIdentifier:", v10);

    objc_msgSend(*(id *)(a1 + 56), "activity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "end");

    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 48);
      objc_msgSend(v16, "executionTimeInterval");
      v18 = v17;
      v19 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 40), "tracker");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pendingTasks");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138544386;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      v32 = 2114;
      v33 = v8;
      v34 = 2048;
      v35 = v18;
      v36 = 2114;
      v37 = v22;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Done sending all responses with error: %{public}@. Execution Time: %.3fs. Remaining Tasks: %{public}@", (uint8_t *)&v28, 0x34u);

LABEL_6:
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "executionTimeInterval");
      v26 = v25;
      objc_msgSend(*(id *)(a1 + 48), "debugDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138544642;
      v29 = v15;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v8;
      v36 = 2048;
      v37 = v26;
      v38 = 2112;
      v39 = v27;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Done sending multi-part response(s)[%@] with error: %@. Execution Time: %.3fs. %@", (uint8_t *)&v28, 0x3Eu);

      goto LABEL_6;
    }
  }

  objc_autoreleasePoolPop(v12);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t43_247796 != -1)
    dispatch_once(&logCategory__hmf_once_t43_247796, &__block_literal_global_408_247797);
  return (id)logCategory__hmf_once_v44_247798;
}

void __42__HMDHAPAccessoryReaderWriter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v44_247798;
  logCategory__hmf_once_v44_247798 = v0;

}

@end
