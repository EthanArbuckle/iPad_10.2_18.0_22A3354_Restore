@implementation DRSTaskingManager

- (void)_emitTaskingSystemMessageTelemetry:(id)a3 messageType:(id)a4 dateBroadcast:(id)a5 dateReceived:(id)a6 transaction:(id)a7 cloudChannelConfig:(id)a8
{
  id v14;
  const __CFString *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  const __CFString *v20;
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
  __CFString *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[5];

  v42[3] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (const __CFString *)a4;
  v16 = a5;
  v17 = a6;
  v36 = a7;
  v18 = a8;
  v19 = v18;
  if (v15)
    v20 = v15;
  else
    v20 = CFSTR("InvalidMessage");
  v35 = (__CFString *)v20;
  if (v18)
  {
    v42[0] = v20;
    v41[0] = kMessageReceivedEventKey_MessageType;
    v41[1] = kMessageReceivedEventKey_ChannelType;
    +[DRSCloudChannelConfig stringForChannelType:](DRSCloudChannelConfig, "stringForChannelType:", objc_msgSend(v18, "type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v21;
    v41[2] = kMessageReceivedEventKey_ChannelEnvironment;
    +[DRSCloudChannelConfig stringForEnvironment:](DRSCloudChannelConfig, "stringForEnvironment:", objc_msgSend(v19, "environment"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

  }
  else
  {
    v39[0] = kMessageReceivedEventKey_MessageType;
    v39[1] = kMessageReceivedEventKey_ChannelType;
    v40[0] = v20;
    v40[1] = CFSTR("ManualInjection");
    v39[2] = kMessageReceivedEventKey_ChannelEnvironment;
    v40[2] = CFSTR("ManualInjection");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "mutableCopy");
  }

  if (v14)
  {
    objc_msgSend(v14, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, kUUIDKey);

  }
  if (v16 && v17)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v17, "timeIntervalSinceDate:", v16);
    objc_msgSend(v26, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, kMessageReceivedEventKey_ReceiptDelay);

  }
  DRSCoreAnalyticsSendEvent(kMessageReceivedEventName, v24);
  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v28, "isInternal"))
    goto LABEL_15;
  -[DRSTaskingManager cloudKitHelper](self, "cloudKitHelper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[DRSTaskingManager cloudKitHelper](self, "cloudKitHelper");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", kUUIDKey);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", kMessageReceivedEventKey_MessageType);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", kMessageReceivedEventKey_ChannelType);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", kMessageReceivedEventKey_ChannelEnvironment);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __126__DRSTaskingManager__emitTaskingSystemMessageTelemetry_messageType_dateBroadcast_dateReceived_transaction_cloudChannelConfig___block_invoke;
    v37[3] = &unk_1EA3D1C58;
    v38 = v14;
    objc_msgSend(v30, "reportTaskingSystemMessageReceipt:messageType:channelType:channelEnvironment:dateBroadcast:dateReceived:transaction:completionHandler:", v31, v32, v33, v34, v16, v17, v36, v37);

    v28 = v38;
LABEL_15:

  }
}

void __126__DRSTaskingManager__emitTaskingSystemMessageTelemetry_messageType_dateBroadcast_dateReceived_transaction_cloudChannelConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    DPLogHandle_ConfigPersistedStoreError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v3;
      v6 = "TaskingManagerMessageReceiptTelemetryError";
      v7 = "Telemetry reporting for %{public}@ failed %{public}@";
      v8 = v4;
      v9 = 22;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v6, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    DPLogHandle_ConfigPersistedStore();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543362;
      v12 = v10;
      v6 = "TaskingManagerMessageReceiptTelemetrySuccess";
      v7 = "Telemetry reporting for %{public}@ succeeded!";
      v8 = v4;
      v9 = 12;
      goto LABEL_6;
    }
  }

}

- (void)_emitTelemetryForLoggableMesssage:(id)a3 transaction:(id)a4 cloudChannelConfig:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "messageUUID");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateBroadcast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateReceived");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[DRSTaskingManager _emitTaskingSystemMessageTelemetry:messageType:dateBroadcast:dateReceived:transaction:cloudChannelConfig:](self, "_emitTaskingSystemMessageTelemetry:messageType:dateBroadcast:dateReceived:transaction:cloudChannelConfig:", v14, v11, v12, v13, v9, v8);
}

- (void)processTaskingMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  DRSTaskingManager *v19;
  id v20;
  id v21;
  BOOL v22;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v6)
    -[DRSTaskingManager _emitTelemetryForLoggableMesssage:transaction:cloudChannelConfig:](self, "_emitTelemetryForLoggableMesssage:transaction:cloudChannelConfig:", v10, v12, v11);
  -[DRSTaskingManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__DRSTaskingManager_processTaskingMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke;
  block[3] = &unk_1EA3D1EB8;
  v18 = v10;
  v19 = self;
  v22 = v6;
  v20 = v11;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(v13, block);

}

void __96__DRSTaskingManager_processTaskingMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  id obj;
  _QWORD block[6];
  id v17;
  id v18;
  BOOL v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  DPLogHandle_TaskingManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    objc_msgSend(*(id *)(a1 + 32), "messageUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedTaskingMessage", "TaskingMessage with UUID %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "decisionMaker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acceptedConfigs:logTelemetry:allowWildcardBuild:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), objc_msgSend(*(id *)(a1 + 48), "allowsWildcardBuild"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "state") == 2;
        objc_msgSend(*(id *)(a1 + 40), "workQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __96__DRSTaskingManager_processTaskingMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_31;
        block[3] = &unk_1EA3D1EB8;
        v14 = *(void **)(a1 + 32);
        block[4] = *(_QWORD *)(a1 + 40);
        block[5] = v11;
        v19 = v12;
        v17 = v14;
        v18 = *(id *)(a1 + 56);
        dispatch_async(v13, block);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

}

void __96__DRSTaskingManager_processTaskingMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_31(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "configStateChangeBlock");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "teamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, void *, uint64_t, _QWORD, _QWORD))v2)[2](v2, v3, v4, v5, objc_msgSend(*(id *)(a1 + 40), "state"), 0, *(unsigned __int8 *)(a1 + 64));

  DPLogHandle_TaskingManager();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "configUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "teamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "messageUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptedConfig", "Accepted config %{public}@ (teamID: %{public}@) due to tasking message %{public}@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)processCancelMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  DRSTaskingManager *v17;
  id v18;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  if (v6)
    -[DRSTaskingManager _emitTelemetryForLoggableMesssage:transaction:cloudChannelConfig:](self, "_emitTelemetryForLoggableMesssage:transaction:cloudChannelConfig:", v10, v11, a4);
  -[DRSTaskingManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke;
  block[3] = &unk_1EA3D17D8;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_sync(v12, block);

}

void __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  DPLogHandle_TaskingManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    objc_msgSend(a1[4], "messageUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedCancelMessage", "CancelMessage with UUID %{public}@", buf, 0xCu);

  }
  objc_msgSend(a1[5], "decisionMaker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acceptedCancels:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_33;
    v8[3] = &unk_1EA3D1F08;
    v7 = *((int8x16_t *)a1 + 2);
    v6 = (id)v7.i64[0];
    v9 = vextq_s8(v7, v7, 8uLL);
    v10 = a1[6];
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_33(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id obj;
  _QWORD block[5];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_msgSend(a1[4], "workQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_2;
        block[3] = &unk_1EA3D1EE0;
        block[4] = a1[4];
        v15 = v5;
        v16 = v11;
        v17 = a1[5];
        v18 = a1[6];
        dispatch_async(v12, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

void __95__DRSTaskingManager_processCancelMessage_cloudChannelConfig_transaction_shouldEmitCATelemetry___block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "configStateChangeBlock");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 3, 2, 1);

  DPLogHandle_TaskingManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "messageUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelledConfig", "Cancelled config %{public}@ (teamID: %{public}@) due to cancel message %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)processPingMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v6)
    -[DRSTaskingManager _emitTelemetryForLoggableMesssage:transaction:cloudChannelConfig:](self, "_emitTelemetryForLoggableMesssage:transaction:cloudChannelConfig:", v10, v12, v11);
  DPLogHandle_TaskingManager();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedPingMesssage", (const char *)&unk_1DBC04191, v14, 2u);
  }

}

- (BOOL)processTaskingSystemMessageJSONData:(id)a3 transaction:(id)a4 shouldEmitCATelemetry:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  if (v9)
  {
    v11 = -[DRSTaskingManager processTaskingSystemMessageJSONDict:cloudChannelConfig:transaction:shouldEmitCATelemetry:](self, "processTaskingSystemMessageJSONDict:cloudChannelConfig:transaction:shouldEmitCATelemetry:", v9, 0, v8, v5);
  }
  else
  {
    DPLogHandle_TaskingManagerError();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v10, "localizedDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("Unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONData", "Could not process JSON data due to error %{public}@", buf, 0xCu);

    }
    v11 = 0;
  }

  return v11;
}

- (void)_bestEffortLogMessageReceiptTelemetry:(id)a3 transaction:(id)a4 cloudChannelConfig:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __objc2_class **v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _dateFromJSONDict(v16, (uint64_t)kDRSTaskingSystemMessage_DateBroadcastKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", kDRSTaskingSystemMessage_messageUUIDKey);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = off_1EA3D05D8;
  }
  else
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", kDRSTaskingSystemMessage_messageUUIDKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v15 = 0;
      goto LABEL_6;
    }
    v14 = off_1EA3D04C8;
  }
  -[__objc2_class messageType](*v14, "messageType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  -[DRSTaskingManager _emitTaskingSystemMessageTelemetry:messageType:dateBroadcast:dateReceived:transaction:cloudChannelConfig:](self, "_emitTaskingSystemMessageTelemetry:messageType:dateBroadcast:dateReceived:transaction:cloudChannelConfig:", v13, v15, v11, v10, v8, v9);

}

- (BOOL)processTaskingSystemMessageJSONDict:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v6 = a6;
  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[DRSTaskingManager isTaskingEnabled](self, "isTaskingEnabled"))
  {
    DRSTaskingSystemMessageFromJSONDict(v10);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      LOBYTE(v6) = -[DRSTaskingManager processTaskingSystemMessage:cloudChannelConfig:transaction:shouldEmitCATelemetry:](self, "processTaskingSystemMessage:cloudChannelConfig:transaction:shouldEmitCATelemetry:", v13, v11, v12, v6);
    }
    else
    {
      DPLogHandle_TaskingManagerError();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        LOWORD(v16) = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidTaskingSystemJSONData", "Received invalid JSON tasking system message", (uint8_t *)&v16, 2u);
      }

      if (v6)
      {
        -[DRSTaskingManager _bestEffortLogMessageReceiptTelemetry:transaction:cloudChannelConfig:](self, "_bestEffortLogMessageReceiptTelemetry:transaction:cloudChannelConfig:", v10, v12, v11);
        LOBYTE(v6) = 0;
      }
    }
  }
  else
  {
    DPLogHandle_TaskingManager();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      v16 = 138543362;
      v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IgnoringMessageDueToDisablement", "Disabled, so ignoring tasking system message dictionary: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)processTaskingSystemMessage:(id)a3 cloudChannelConfig:(id)a4 transaction:(id)a5 shouldEmitCATelemetry:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v6 = a6;
  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[DRSTaskingManager processTaskingMessage:cloudChannelConfig:transaction:shouldEmitCATelemetry:](self, "processTaskingMessage:cloudChannelConfig:transaction:shouldEmitCATelemetry:", v10, v11, v12, v6);
LABEL_7:
    v13 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[DRSTaskingManager processCancelMessage:cloudChannelConfig:transaction:shouldEmitCATelemetry:](self, "processCancelMessage:cloudChannelConfig:transaction:shouldEmitCATelemetry:", v10, v11, v12, v6);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[DRSTaskingManager processPingMessage:cloudChannelConfig:transaction:shouldEmitCATelemetry:](self, "processPingMessage:cloudChannelConfig:transaction:shouldEmitCATelemetry:", v10, v11, v12, v6);
    goto LABEL_7;
  }
  DPLogHandle_TaskingManagerError();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v17;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnknownMessageClass", "Received unknown message class: %{pbulic}@", (uint8_t *)&v18, 0xCu);

  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (DRSTaskingManager)initWithDecisionMaker:(id)a3 configStateChangeBlock:(id)a4
{
  return -[DRSTaskingManager initWithDecisionMaker:cloudKitHelper:configStateChangeBlock:](self, "initWithDecisionMaker:cloudKitHelper:configStateChangeBlock:", a3, 0, a4);
}

- (DRSTaskingManager)initWithDecisionMaker:(id)a3 cloudKitHelper:(id)a4 configStateChangeBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  DRSTaskingManager *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  void *v15;
  id configStateChangeBlock;
  DRSTaskingManager *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    DPLogHandle_TaskingManagerError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      v19 = "No config state change block specified";
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingManagerInitFailure", v19, buf, 2u);
    }
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  if (!v9)
  {
    DPLogHandle_TaskingManagerError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      v19 = "No decision maker provided";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v21.receiver = self;
  v21.super_class = (Class)DRSTaskingManager;
  v12 = -[DRSTaskingManager init](&v21, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("DRSTaskingManager message queue", 0);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v13;

    v15 = _Block_copy(v11);
    configStateChangeBlock = v12->_configStateChangeBlock;
    v12->_configStateChangeBlock = v15;

    objc_storeStrong((id *)&v12->_decisionMaker, a3);
    objc_storeStrong((id *)&v12->_cloudKitHelper, a4);
  }
  self = v12;
  v17 = self;
LABEL_12:

  return v17;
}

- (void)clientRejectsConfigUUID:(id)a3 teamID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  char v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DPLogHandle_TaskingManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientRejectsConfig", "Client rejects config %{public}@ (teamID: %{public}@)", buf, 0x16u);
  }

  -[DRSTaskingManager decisionMaker](self, "decisionMaker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v10, "configMetadataForUUID:errorOut:", v6, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;

  if (v11)
  {
    if (objc_msgSend(v11, "state") == 3)
    {
      DPLogHandle_TaskingManagerError();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled((os_log_t)v13))
      {
        *(_DWORD *)buf = 138543618;
        v21 = v7;
        v22 = 2114;
        v23 = v6;
        v14 = "Client (teamID %{public}@) attempting to reject completed config %{public}@";
LABEL_13:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, (os_log_t)v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientRejectsConfigError", v14, buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v11, "teamID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v7);

      if ((v16 & 1) != 0)
      {
        -[DRSTaskingManager decisionMaker](self, "decisionMaker");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "clientRejectsConfigUUID:", v6);

        v18 = objc_msgSend(v11, "state") == 2;
        -[DRSTaskingManager configStateChangeBlock](self, "configStateChangeBlock");
        v13 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, id, id, _QWORD, uint64_t, uint64_t, _BOOL8))(v13 + 16))(v13, v7, v6, 0, 3, 5, v18);
      }
      else
      {
        DPLogHandle_TaskingManagerError();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled((os_log_t)v13))
        {
          *(_DWORD *)buf = 138543618;
          v21 = v7;
          v22 = 2114;
          v23 = v6;
          v14 = "Client (teamID %{public}@) attempting to reject config %{public}@ for wrong team";
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
    DPLogHandle_TaskingManagerError();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled((os_log_t)v13))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2114;
      v23 = v6;
      v14 = "Client (teamID %{public}@) attempting to reject non-existent config %{public}@";
      goto LABEL_13;
    }
  }

}

- (void)clientCompletedConfigUUID:(id)a3 teamID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  char v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DPLogHandle_TaskingManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientCompletedConfig", "Client completed config %{public}@ (teamID: %{public}@)", buf, 0x16u);
  }

  -[DRSTaskingManager decisionMaker](self, "decisionMaker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v10, "configMetadataForUUID:errorOut:", v6, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;

  if (v11)
  {
    if (objc_msgSend(v11, "state") == 3)
    {
      DPLogHandle_TaskingManagerError();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled((os_log_t)v13))
      {
        *(_DWORD *)buf = 138543618;
        v21 = v7;
        v22 = 2114;
        v23 = v6;
        v14 = "Client (teamID %{public}@) attempting to complete already-completed config %{public}@";
LABEL_13:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, (os_log_t)v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientCompletedConfigError", v14, buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v11, "teamID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v7);

      if ((v16 & 1) != 0)
      {
        -[DRSTaskingManager decisionMaker](self, "decisionMaker");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "clientCompletedConfigUUID:", v6);

        v18 = objc_msgSend(v11, "state") == 2;
        -[DRSTaskingManager configStateChangeBlock](self, "configStateChangeBlock");
        v13 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, id, id, _QWORD, uint64_t, uint64_t, _BOOL8))(v13 + 16))(v13, v7, v6, 0, 3, 6, v18);
      }
      else
      {
        DPLogHandle_TaskingManagerError();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled((os_log_t)v13))
        {
          *(_DWORD *)buf = 138543618;
          v21 = v7;
          v22 = 2114;
          v23 = v6;
          v14 = "Client (teamID %{public}@) attempting to complete config %{public}@ for wrong team";
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
    DPLogHandle_TaskingManagerError();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled((os_log_t)v13))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2114;
      v23 = v6;
      v14 = "Client (teamID %{public}@) attempting to complete non-existent config %{public}@";
      goto LABEL_13;
    }
  }

}

- (id)metadataForConfigUUID:(id)a3 teamID:(id)a4 errorOut:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(teamID == %@) AND (configUUID == %@)"), a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSTaskingManager decisionMaker](self, "decisionMaker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "configMetadatasForPredicate:sortDescriptors:fetchLimit:errorOut:", v7, 0, 1, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (!v11)
  {
    if (v10 && objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  DPLogHandle_TaskingManagerError();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MetadataLookupFailure", "Failed to lookup metadata due to error: %{public}@", buf, 0xCu);
  }

  if (!a5)
    goto LABEL_9;
  v13 = 0;
  *a5 = objc_retainAutorelease(v11);
LABEL_10:

  return v13;
}

- (BOOL)clearTaskingHistoryWithErrorOut:(id *)a3
{
  void *v4;
  void *v5;

  -[DRSTaskingManager decisionMaker](self, "decisionMaker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "clearStoreWithErrorOut:", a3);

  return (char)a3;
}

- (id)persistedCloudChannelConfig
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[DRSTaskingManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__DRSTaskingManager_persistedCloudChannelConfig__block_invoke;
  v6[3] = &unk_1EA3D18C8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__DRSTaskingManager_persistedCloudChannelConfig__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "decisionMaker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudChannelConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)updatePersistedChannelConfig:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[DRSTaskingManager decisionMaker](self, "decisionMaker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "updateCloudChannelConfig:errorOut:", v6, a4);

  return (char)a4;
}

- (BOOL)unsubscribeFromSubscribedChannelWithErrorOut:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  *a3 = 0;
  -[DRSTaskingManager taskingMessageChannel](self, "taskingMessageChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  -[DRSTaskingManager taskingMessageChannel](self, "taskingMessageChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsubscribe:", a3);

  if (v7)
  {
    -[DRSTaskingManager setTaskingMessageChannel:](self, "setTaskingMessageChannel:", 0);
    return 1;
  }
  if (!*a3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("Unknown unsubscribe failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticRequestCloudChannelError"), 0, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  DPLogHandle_TaskingManagerError();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    -[DRSTaskingManager taskingMessageChannel](self, "taskingMessageChannel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *a3;
    v15 = 138543618;
    v16 = v13;
    v17 = 2114;
    v18 = v14;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnsubscribeChannelFailed", "Failed to unsubscribe from %{public}@ due to error: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  return 0;
}

- (BOOL)isTaskingEnabled
{
  void *v2;
  char v3;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTaskingEnabled");

  return v3;
}

- (BOOL)subscribeToChannelWithConfig:(id)a3 errorOut:(id *)a4
{
  id v6;
  DRSTaskingMessageChannel *v7;
  DRSTaskingMessageChannel *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *a4 = 0;
  if (v6)
  {
    v7 = [DRSTaskingMessageChannel alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__DRSTaskingManager_subscribeToChannelWithConfig_errorOut___block_invoke;
    v15[3] = &unk_1EA3D1F30;
    v15[4] = self;
    v8 = -[DRSTaskingMessageChannel initWithCloudChannelConfig:payloadProcessingBlock:](v7, "initWithCloudChannelConfig:payloadProcessingBlock:", v6, v15);
    LODWORD(v9) = -[DRSTaskingMessageChannel subscribe:](v8, "subscribe:", a4);
    if ((_DWORD)v9)
    {
      -[DRSTaskingManager setTaskingMessageChannel:](self, "setTaskingMessageChannel:", v8);
    }
    else
    {
      DPLogHandle_TaskingManagerError();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        objc_msgSend(v6, "debugDescription");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = (const __CFString *)*a4;
        if (!*a4)
          v13 = CFSTR("Unknown");
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        v18 = 2114;
        v19 = v13;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscriptionFailed", "Failed to subscribe to %{public}@ to error: %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    DPLogHandle_TaskingManager();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NotSubscribingToTaskingChannel", "nil config means no subscription", buf, 2u);
    }

    LOBYTE(v9) = 1;
  }

  return (char)v9;
}

void __59__DRSTaskingManager_subscribeToChannelWithConfig_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)os_transaction_create();
  DPLogHandle_TaskingManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    v9 = 138543362;
    v10 = v5;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingSystemMessageReceived", "Tasking system message: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "processTaskingSystemMessageJSONDict:cloudChannelConfig:transaction:shouldEmitCATelemetry:", v5, v6, v7, 1);
}

- (BOOL)checkConfigsForInvalidation:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  __CFString *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  const __CFString *v77;
  void *v79;
  id obj;
  DRSTaskingManager *v81;
  uint64_t v82;
  NSObject *v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  DRSTaskingManager *v92;
  NSObject *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  id v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  const __CFString *v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  *a3 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(state == %u) || (state == %u)"), 2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSTaskingManager decisionMaker](self, "decisionMaker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configMetadatasForPredicate:sortDescriptors:fetchLimit:errorOut:", v5, 0, 0, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = *a3;
  if (*a3)
  {
    DPLogHandle_TaskingManagerError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11 = *a3;
      *(_DWORD *)buf = 138543362;
      v99 = v11;
      v12 = "InvalidationCheckFailed";
      v13 = "Failed to fetch waiting or active configs due to error: %{public}@";
      v14 = v10;
      v15 = 12;
LABEL_52:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, buf, v15);
      goto LABEL_53;
    }
    goto LABEL_53;
  }
  if (v8 && objc_msgSend(v8, "count"))
  {
    v81 = self;
    v79 = v5;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v95 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v23, "teamID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "teamID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v26);

          }
          objc_msgSend(v25, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
      }
      while (v20);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __49__DRSTaskingManager_checkConfigsForInvalidation___block_invoke;
    v90[3] = &unk_1EA3D1F08;
    v28 = v27;
    v91 = v28;
    v92 = v81;
    v83 = v16;
    v93 = v83;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v90);
    v29 = v28;

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v8 = v29;
    v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
    if (!v30)
    {
LABEL_49:

      v9 = 0;
      v5 = v79;
      v10 = v83;
      goto LABEL_53;
    }
    v31 = v30;
    v32 = 0x1EA3D0000uLL;
    v82 = *(_QWORD *)v87;
    obj = v8;
LABEL_17:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v87 != v82)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v33);
      objc_msgSend(*(id *)(v32 + 1432), "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "build");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "config");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "build");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v36, "isEqualToString:", v38);

      if ((v39 & 1) != 0)
      {
        objc_msgSend(v34, "config");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "endDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[NSObject compare:](v83, "compare:", v41);

        if (v42 == -1)
        {
          DPLogHandle_TaskingManager();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v48))
          {
            objc_msgSend(v34, "configUUID");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "teamID");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v99 = v73;
            v100 = 2114;
            v101 = (uint64_t)v74;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigStillValid", "Config %{public}@ (Team ID %{public}@) is still valid", buf, 0x16u);

          }
          v32 = 0x1EA3D0000;
          goto LABEL_47;
        }
        if (objc_msgSend(v34, "state") == 1)
          v43 = 1;
        else
          v43 = 8194;
        -[DRSTaskingManager decisionMaker](v81, "decisionMaker");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "configStore");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "configUUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0;
        v47 = objc_msgSend(v45, "completeConfigWithUUID:completedDate:completionType:completionDescription:errorOut:", v46, v83, v43, CFSTR("Expired"), &v84);
        v48 = v84;

        if ((v47 & 1) != 0)
        {
          -[DRSTaskingManager configStateChangeBlock](v81, "configStateChangeBlock");
          v49 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "teamID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "configUUID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *, _QWORD, uint64_t, uint64_t, BOOL))(v49 + 16))(v49, v50, v51, 0, 3, 4, objc_msgSend(v34, "state") == 2);

          goto LABEL_45;
        }
        DPLogHandle_TaskingManagerError();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled((os_log_t)v49))
        {
          objc_msgSend(v34, "configUUID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "teamID");
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = (void *)v75;
          *(_DWORD *)buf = 138543874;
          v77 = CFSTR("Unknown");
          if (v48)
            v77 = (const __CFString *)v48;
          v99 = v50;
          v100 = 2114;
          v101 = v75;
          v102 = 2114;
          v103 = (uint64_t)v77;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, (os_log_t)v49, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidationFailed", "Failed to invalidate expiring config %{public}@ (Team ID: %{public}@) due to error: %{public}@", buf, 0x20u);

LABEL_45:
        }
        v32 = 0x1EA3D0000;

        goto LABEL_47;
      }
      v52 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v34, "config");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "build");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v32 + 1432), "sharedInstance");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "build");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringWithFormat:", CFSTR("Build changed (%@ -> %@)"), v54, v56);
      v48 = objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v34, "state") == 1)
        v57 = 1;
      else
        v57 = 8193;
      -[DRSTaskingManager decisionMaker](v81, "decisionMaker");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "configStore");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "configUUID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = 0;
      v61 = objc_msgSend(v59, "completeConfigWithUUID:completedDate:completionType:completionDescription:errorOut:", v60, v83, v57, v48, &v85);
      v62 = (__CFString *)v85;

      if ((v61 & 1) != 0)
      {
        -[DRSTaskingManager configStateChangeBlock](v81, "configStateChangeBlock");
        v63 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "teamID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "configUUID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, _QWORD, uint64_t, uint64_t, BOOL))(v63 + 16))(v63, v64, v65, 0, 3, 3, objc_msgSend(v34, "state") == 2);

      }
      else
      {
        DPLogHandle_TaskingManagerError();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled((os_log_t)v63))
        {
          objc_msgSend(v34, "configUUID");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "config");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "build");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "build");
          v70 = objc_claimAutoreleasedReturnValue();
          v71 = (void *)v70;
          *(_DWORD *)buf = 138544130;
          v72 = CFSTR("Unknown");
          if (v62)
            v72 = v62;
          v99 = v66;
          v100 = 2114;
          v101 = (uint64_t)v68;
          v102 = 2114;
          v103 = v70;
          v104 = 2114;
          v105 = v72;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, (os_log_t)v63, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidationFailed", "Failed to invalidate config %{public}@ (%{public}@ -> %{public}@) due to error: %{public}@", buf, 0x2Au);

          v32 = 0x1EA3D0000;
          goto LABEL_37;
        }
      }
      v32 = 0x1EA3D0000;
LABEL_37:

LABEL_47:
      if (v31 == ++v33)
      {
        v8 = obj;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
        if (!v31)
          goto LABEL_49;
        goto LABEL_17;
      }
    }
  }
  DPLogHandle_TaskingManager();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    v12 = "NoOpInvalidation";
    v13 = "No active or waiting configs";
    v14 = v10;
    v15 = 2;
    goto LABEL_52;
  }
LABEL_53:

  return v9 == 0;
}

void __49__DRSTaskingManager_checkConfigsForInvalidation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  id v26;
  __CFString *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    DPLogHandle_TaskingManagerError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 134349314;
      v36 = objc_msgSend(v5, "count");
      v37 = 2114;
      v38 = v27;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CollidingConfigsForTeam", "Found %{public}lu active or waiting configs for team ID %{public}@. Invalidating team configs", buf, 0x16u);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (!v7)
    {
LABEL_24:

      v5 = v26;
      goto LABEL_25;
    }
    v8 = v7;
    v9 = *(_QWORD *)v31;
LABEL_7:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
      DPLogHandle_TaskingManagerError();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v12))
      {
        objc_msgSend(v11, "configUUID");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = (uint64_t)v27;
        v37 = 2114;
        v38 = v13;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidatingCollidingConfigs", "Invalidating %{public}@: %{public}@ due to colliding configs", buf, 0x16u);

      }
      v14 = objc_msgSend(v11, "state") == 1 ? 1 : 8193;
      objc_msgSend(*(id *)(a1 + 40), "decisionMaker");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "configStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 48);
      v29 = 0;
      v19 = objc_msgSend(v16, "completeConfigWithUUID:completedDate:completionType:completionDescription:errorOut:", v17, v18, v14, CFSTR("Collided with active config for team"), &v29);
      v20 = (__CFString *)v29;

      if ((v19 & 1) != 0)
        break;
      DPLogHandle_TaskingManagerError();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled((os_log_t)v21))
      {
        objc_msgSend(v11, "configUUID");
        v24 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v24;
        *(_DWORD *)buf = 138543618;
        v25 = CFSTR("Unknown");
        if (v20)
          v25 = v20;
        v36 = v24;
        v37 = 2114;
        v38 = v25;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, (os_log_t)v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidationFailed", "Failed to invalidate colliding config %{public}@ due to error: %{public}@", buf, 0x16u);
        goto LABEL_21;
      }
LABEL_22:

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (!v8)
          goto LABEL_24;
        goto LABEL_7;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "configStateChangeBlock");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "teamID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD, uint64_t, uint64_t, BOOL))(v21 + 16))(v21, v22, v23, 0, 3, 3, objc_msgSend(v11, "state") == 2);

LABEL_21:
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
LABEL_25:

}

- (DRSTaskingDecisionMaker)decisionMaker
{
  return self->_decisionMaker;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)configStateChangeBlock
{
  return self->_configStateChangeBlock;
}

- (DRSTaskingMessageChannel)taskingMessageChannel
{
  return self->_taskingMessageChannel;
}

- (void)setTaskingMessageChannel:(id)a3
{
  objc_storeStrong((id *)&self->_taskingMessageChannel, a3);
}

- (DRSTaskingCloudKitHelper)cloudKitHelper
{
  return self->_cloudKitHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitHelper, 0);
  objc_storeStrong((id *)&self->_taskingMessageChannel, 0);
  objc_storeStrong(&self->_configStateChangeBlock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_decisionMaker, 0);
}

@end
