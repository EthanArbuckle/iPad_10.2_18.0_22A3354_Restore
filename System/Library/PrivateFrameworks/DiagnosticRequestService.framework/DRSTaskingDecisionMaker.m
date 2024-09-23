@implementation DRSTaskingDecisionMaker

+ (BOOL)passesPercentAccept:(double)a3
{
  if (a3 >= 100.0)
    return 1;
  if (a3 <= 0.0)
    return 0;
  return a3 * 10000.0 >= (double)arc4random_uniform(0xF4240u);
}

- (DRSTaskingDecisionMaker)initWithTimezone:(id)a3 limitingParameters:(id)a4 dbWorkingDirectoryPath:(id)a5 cloudKitHelper:(id)a6 enforceDate:(BOOL)a7 enforceBuild:(BOOL)a8 enforceSampling:(BOOL)a9 enforceTeamHysteresis:(BOOL)a10 enforceGlobalHysteresisAndCap:(BOOL)a11 errorOut:(id *)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  DRSConfigPersistedStore *v22;
  DRSConfigPersistedStore *v23;
  DRSConfigPersistedStore *v24;
  DRSTaskingDecisionMaker *v25;
  DRSTaskingDecisionMaker *v26;
  void *v27;
  DRSTaskingDecisionMaker *v28;
  NSObject *v30;
  objc_super v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  DRSConfigPersistedStore *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  if (!v17)
  {
    +[DRSTaskingLimitingParameters defaultDeviceParameters](DRSTaskingLimitingParameters, "defaultDeviceParameters");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v16;
  v21 = v20;
  if (v20)
  {
    if (v18)
      goto LABEL_5;
LABEL_8:
    v24 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_8;
LABEL_5:
  v34 = 0;
  v22 = -[DRSConfigPersistedStore initWithWorkingDirectory:isReadOnly:cloudKitHelper:errorOut:]([DRSConfigPersistedStore alloc], "initWithWorkingDirectory:isReadOnly:cloudKitHelper:errorOut:", v18, 0, v19, &v34);
  v23 = (DRSConfigPersistedStore *)v34;
  v24 = v23;
  if (v22)
  {

    v24 = v22;
LABEL_9:
    v33.receiver = self;
    v33.super_class = (Class)DRSTaskingDecisionMaker;
    v25 = -[DRSTaskingDecisionMaker init](&v33, sel_init);
    v26 = v25;
    if (v25)
    {
      objc_storeStrong((id *)&v25->_deviceTimezone, v21);
      objc_storeStrong((id *)&v26->_limitingParameters, v17);
      objc_storeStrong((id *)&v26->_dbWorkingDirectoryPath, a5);
      v26->_enforceDate = a7;
      v26->_enforceBuild = a8;
      v26->_enforceSampling = a9;
      v26->_enforceTeamHysteresis = a10;
      v26->_enforceGlobalHysteresisAndCap = a11;
      objc_storeStrong((id *)&v26->_configStore, v24);
      -[DRSTaskingDecisionMaker configStore](v26, "configStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        *(_WORD *)&v26->_enforceTeamHysteresis = 0;
      objc_storeStrong((id *)&v26->_cloudKitHelper, a6);
    }
    self = v26;
    v28 = self;
    goto LABEL_14;
  }
  DPLogHandle_TaskingDecisionMakerError();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v30))
  {
    *(_DWORD *)buf = 138543618;
    v36 = v18;
    v37 = 2114;
    v38 = v24;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingDecisionMakerInitFailure", "Failed to init with working directory: %{public}@ (Error: %{public}@)", buf, 0x16u);
  }

  if (a12)
  {
    v24 = objc_retainAutorelease(v24);
    v28 = 0;
    *a12 = v24;
  }
  else
  {
    v28 = 0;
  }
LABEL_14:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  DRSTaskingDecisionMaker *v4;
  DRSTaskingDecisionMaker *v5;
  DRSTaskingDecisionMaker *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  char IsNil;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;

  v4 = (DRSTaskingDecisionMaker *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v24 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[DRSTaskingDecisionMaker enforceDate](self, "enforceDate");
    if (v7 != -[DRSTaskingDecisionMaker enforceDate](v6, "enforceDate"))
      goto LABEL_15;
    v8 = -[DRSTaskingDecisionMaker enforceSampling](self, "enforceSampling");
    if (v8 != -[DRSTaskingDecisionMaker enforceSampling](v6, "enforceSampling"))
      goto LABEL_15;
    v9 = -[DRSTaskingDecisionMaker enforceTeamHysteresis](self, "enforceTeamHysteresis");
    if (v9 != -[DRSTaskingDecisionMaker enforceTeamHysteresis](v6, "enforceTeamHysteresis"))
      goto LABEL_15;
    v10 = -[DRSTaskingDecisionMaker enforceGlobalHysteresisAndCap](self, "enforceGlobalHysteresisAndCap");
    if (v10 != -[DRSTaskingDecisionMaker enforceGlobalHysteresisAndCap](v6, "enforceGlobalHysteresisAndCap"))
      goto LABEL_15;
    -[DRSTaskingDecisionMaker dbWorkingDirectoryPath](self, "dbWorkingDirectoryPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingDecisionMaker dbWorkingDirectoryPath](v6, "dbWorkingDirectoryPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IsNil = _oneIsNil((uint64_t)v11, (uint64_t)v12);

    if ((IsNil & 1) != 0)
      goto LABEL_15;
    -[DRSTaskingDecisionMaker dbWorkingDirectoryPath](self, "dbWorkingDirectoryPath");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[DRSTaskingDecisionMaker dbWorkingDirectoryPath](self, "dbWorkingDirectoryPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTaskingDecisionMaker dbWorkingDirectoryPath](v6, "dbWorkingDirectoryPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (!v18)
        goto LABEL_15;
    }
    -[DRSTaskingDecisionMaker limitingParameters](v6, "limitingParameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingDecisionMaker limitingParameters](self, "limitingParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
    {
      -[DRSTaskingDecisionMaker deviceTimezone](self, "deviceTimezone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTaskingDecisionMaker deviceTimezone](v6, "deviceTimezone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToTimeZone:", v23);

    }
    else
    {
LABEL_15:
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)_persistReceivedMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DRSTaskingDecisionMaker configStore](self, "configStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DRSTaskingDecisionMaker configStore](self, "configStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = objc_msgSend(v6, "addConfigMetdata:errorOut:", v4, &v11);
    v8 = v11;

    if ((v7 & 1) == 0)
    {
      DPLogHandle_TaskingDecisionMakerError();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        objc_msgSend(v4, "configUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v13 = v10;
        v14 = 2114;
        v15 = v8;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MetadataPersistanceFailure", "Failed to persist %{public}@ due to error %{public}@", buf, 0x16u);

      }
    }
    -[DRSTaskingDecisionMaker _logConfigReceipt:](self, "_logConfigReceipt:", v4);

  }
}

- (void)_logConfigReceipt:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "logTelemetry"))
  {
    if (objc_msgSend(v3, "state"))
    {
      if (objc_msgSend(v3, "state") == 2)
      {
        v4 = CFSTR("Applied");
      }
      else if (objc_msgSend(v3, "state") == 1)
      {
        v4 = CFSTR("WaitingToApply");
      }
      else
      {
        v4 = CFSTR("Unknown");
        if (objc_msgSend(v3, "state") == 3)
        {
          objc_msgSend(v3, "completionDescription");
          v5 = objc_claimAutoreleasedReturnValue();
          if (v5)
            v4 = (__CFString *)v5;
        }
      }
    }
    else
    {
      v4 = CFSTR("Unknown");
    }
    v17[0] = kUUIDKey;
    objc_msgSend(v3, "configUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = kTeamIDKey;
    objc_msgSend(v3, "teamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = kConfigReceivedEventKey_ReceiptResult;
    v18[1] = v8;
    v18[2] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    DRSCoreAnalyticsSendEvent(kConfigReceivedEventName, v9);
    if (objc_msgSend(v3, "reportToDecisionServer"))
    {
      +[DRSTaskingCloudKitHelper prodContainerHelper](DRSTaskingCloudKitHelper, "prodContainerHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "teamID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "configUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)os_transaction_create();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__DRSTaskingDecisionMaker__logConfigReceipt___block_invoke;
      v15[3] = &unk_1EA3D1C58;
      v16 = v3;
      objc_msgSend(v10, "reportTaskingConfigReceipt:uuidString:receiptResult:transaction:completionHandler:", v11, v13, v4, v14, v15);

    }
  }

}

void __45__DRSTaskingDecisionMaker__logConfigReceipt___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  DPLogHandle_ConfigPersistedStoreError();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "configUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DecisionMakerConfigReceiptTelemetryError", "Telemetry reporting for %{public}@ failed %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

- (BOOL)reportToDecisionServer
{
  void *v2;
  char v3;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternal");

  return v3;
}

- (id)_teamTaskingsPassingDate:(id)a3 logTelemetry:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teamTaskings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__DRSTaskingDecisionMaker__teamTaskingsPassingDate_logTelemetry___block_invoke;
  v15[3] = &unk_1EA3D1C80;
  v15[4] = self;
  v16 = v8;
  v17 = v6;
  v19 = a4;
  v10 = v7;
  v18 = v10;
  v11 = v6;
  v12 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);

  if (objc_msgSend(v10, "count"))
    v13 = v10;
  else
    v13 = 0;

  return v13;
}

void __65__DRSTaskingDecisionMaker__teamTaskingsPassingDate_logTelemetry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  DRSConfigMetadata *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  DRSConfigMetadata *v24;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "enforceDate"))
    goto LABEL_6;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v6, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (v10 == -1)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
  }
  else
  {
    DPLogHandle_TaskingDecisionMakerError();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      objc_msgSend(*(id *)(a1 + 48), "messageUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "config");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v5;
      v28 = 2114;
      v29 = v13;
      v30 = 2114;
      v31 = v16;
      v32 = 2114;
      v33 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectedConfig", "Rejecting TeamTasking team ID %{public}@ from TaskingMessage ID %{public}@ due to already being expired (%{public}@ (endDate) <= %{public}@ (current date))", buf, 0x2Au);

    }
    v18 = [DRSConfigMetadata alloc];
    objc_msgSend(v6, "config");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "configUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentReceivedDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_BYTE *)(a1 + 64);
    v23 = *(_QWORD *)(a1 + 40);
    BYTE1(v25) = objc_msgSend(*(id *)(a1 + 32), "reportToDecisionServer");
    LOBYTE(v25) = v22;
    v24 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v18, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v5, v20, 3, 1, v21, v23, v23, CFSTR("Received after end date"), 0, v25);

    objc_msgSend(*(id *)(a1 + 32), "_persistReceivedMetadata:", v24);
  }

}

- (id)_teamTaskingsPassingBuild:(id)a3 logTelemetry:(BOOL)a4 allowWildcardBuild:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
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
  void *v34;
  void *v35;
  void *v36;
  DRSConfigMetadata *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  DRSConfigMetadata *v42;
  id v43;
  uint64_t v45;
  void *v46;
  _BOOL4 v47;
  id v48;
  void *v50;
  DRSTaskingDecisionMaker *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v5 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v9 = v7;
  v53 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v55;
    v48 = v9;
    v47 = v5;
    v51 = self;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v55 != v52)
          objc_enumerationMutation(v9);
        v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if (!-[DRSTaskingDecisionMaker enforceBuild](self, "enforceBuild"))
          goto LABEL_11;
        if (v5)
        {
          objc_msgSend(v11, "config");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "build");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", kDRConfigWildcardBuild);

          if (v14)
          {
            +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "build");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "config");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setBuild:", v16);

          }
        }
        +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "build");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "config");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "build");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "isEqualToString:", v21);

        self = v51;
        if ((v22 & 1) == 0)
        {
          DPLogHandle_TaskingDecisionMakerError();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v23))
          {
            objc_msgSend(v11, "config");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "configUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "teamID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "config");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "build");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "build");
            v29 = v8;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v59 = v24;
            v60 = 2114;
            v61 = v25;
            v62 = 2114;
            v63 = v27;
            v64 = 2114;
            v65 = v30;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectedConfig", "Rejecting config %{public}@ for Team ID %{public}@ due to mismatching build: %{public}@ vs. %{public}@ (expected)", buf, 0x2Au);

            v8 = v29;
            self = v51;

          }
          v31 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "config");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "build");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "build");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("Config build did not match device: %@ vs. %@ (expected)"), v33, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = [DRSConfigMetadata alloc];
          objc_msgSend(v11, "teamID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "config");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "configUUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSTaskingDecisionMaker currentReceivedDate](self, "currentReceivedDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          BYTE1(v45) = -[DRSTaskingDecisionMaker reportToDecisionServer](self, "reportToDecisionServer");
          LOBYTE(v45) = a4;
          v42 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v37, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v38, v40, 3, 1, v41, v50, v36, 0, v45);

          -[DRSTaskingDecisionMaker _persistReceivedMetadata:](self, "_persistReceivedMetadata:", v42);
          v9 = v48;
          v5 = v47;
        }
        else
        {
LABEL_11:
          objc_msgSend(v8, "addObject:", v11);
        }
      }
      v53 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v53);
  }

  if (objc_msgSend(v8, "count"))
    v43 = v8;
  else
    v43 = 0;

  return v43;
}

- (id)_configsPassingSampling:(id)a3 logTelemetry:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  DRSConfigMetadata *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  DRSConfigMetadata *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  DRSConfigMetadata *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  DRSConfigMetadata *v55;
  uint64_t v57;
  void *v58;
  void *v59;
  DRSTaskingDecisionMaker *v60;
  uint64_t v61;
  void *v62;
  uint64_t v64;
  id obj;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v58 = v5;
  if (!v5)
    goto LABEL_31;
  if (!objc_msgSend(v5, "count"))
  {
    v6 = 0;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
  if (!v8)
    goto LABEL_26;
  v9 = v8;
  v10 = *(_QWORD *)v68;
  v60 = self;
  v64 = *(_QWORD *)v68;
  do
  {
    v11 = 0;
    v61 = v9;
    do
    {
      if (*(_QWORD *)v68 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v11);
      if (!-[DRSTaskingDecisionMaker enforceSampling](self, "enforceSampling"))
        goto LABEL_16;
      +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deviceModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTaskingDecisionMaker deviceTimezone](self, "deviceTimezone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "abbreviation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "samplingParametersForHWModel:timezoneAbbreviation:", v14, v16);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      DPLogHandle_TaskingDecisionMaker();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        objc_msgSend(v12, "config");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "configUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "jsonDictRepresentationAbbreviated");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v19;
        v73 = 2114;
        v74 = v20;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamSamplingEvaluation", "Evaluating sampling for: %{public}@:\n%{public}@", buf, 0x16u);

      }
      DPLogHandle_TaskingDecisionMaker();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_signpost_enabled(v21);
      v23 = v66;
      if (v66)
      {
        if (v22)
        {
          objc_msgSend(v12, "config");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "configUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "teamID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "samplingPercentage");
          v27 = v26;
          +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "deviceModel");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSTaskingDecisionMaker deviceTimezone](self, "deviceTimezone");
          v30 = v7;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "abbreviation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v72 = v24;
          v73 = 2114;
          v74 = v25;
          v75 = 2050;
          v76 = v27;
          v77 = 2114;
          v78 = v29;
          v79 = 2114;
          v80 = v32;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamConfigSampling", "%{public}@ for team %{public}@: Got sampling percentage of %{public}.2f for HW model %{public}@, TZ: %{public}@", buf, 0x34u);

          self = v60;
          v7 = v30;
          v23 = v66;

          v9 = v61;
        }

        objc_msgSend(v23, "samplingPercentage");
        if (+[DRSTaskingDecisionMaker passesPercentAccept:](DRSTaskingDecisionMaker, "passesPercentAccept:"))
        {

          v10 = v64;
LABEL_16:
          objc_msgSend(v12, "config");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v33);
          goto LABEL_24;
        }
        DPLogHandle_TaskingDecisionMaker();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v43))
        {
          objc_msgSend(v12, "config");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "configUUID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "teamID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "samplingPercentage");
          *(_DWORD *)buf = 138543874;
          v72 = v45;
          v73 = 2114;
          v74 = v46;
          v75 = 2048;
          v76 = v47;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamHysteresisRejection", "Rejecting config %{public}@ for team ID %{public}@ due to failed roll (%f%% chance of success)", buf, 0x20u);

        }
        v48 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v23, "samplingPercentage");
        objc_msgSend(v48, "stringWithFormat:", CFSTR("Failed roll (%f%% chance of success)"), v49);
        v42 = (DRSConfigMetadata *)objc_claimAutoreleasedReturnValue();
        v50 = [DRSConfigMetadata alloc];
        objc_msgSend(v12, "teamID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "config");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "configUUID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSTaskingDecisionMaker currentReceivedDate](v60, "currentReceivedDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE1(v57) = -[DRSTaskingDecisionMaker reportToDecisionServer](v60, "reportToDecisionServer");
        LOBYTE(v57) = a4;
        v55 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v50, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v51, v53, 3, 1, v54, v62, v42, 0, v57);

        self = v60;
        -[DRSTaskingDecisionMaker _persistReceivedMetadata:](v60, "_persistReceivedMetadata:", v55);

        v9 = v61;
      }
      else
      {
        if (v22)
        {
          objc_msgSend(v12, "config");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "configUUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "teamID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v72 = v35;
          v73 = 2114;
          v74 = v36;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamHysteresisRejection", "Rejecting config %{public}@ for team %{public}@ to missing sampling parameters", buf, 0x16u);

        }
        v37 = [DRSConfigMetadata alloc];
        objc_msgSend(v12, "teamID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "config");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "configUUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSTaskingDecisionMaker currentReceivedDate](self, "currentReceivedDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE1(v57) = -[DRSTaskingDecisionMaker reportToDecisionServer](self, "reportToDecisionServer");
        LOBYTE(v57) = a4;
        v42 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v37, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v38, v40, 3, 1, v41, v62, CFSTR("No applicable sampling parameters"), 0, v57);

        -[DRSTaskingDecisionMaker _persistReceivedMetadata:](self, "_persistReceivedMetadata:", v42);
      }

      v10 = v64;
      v33 = v66;
LABEL_24:

      ++v11;
    }
    while (v9 != v11);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
  }
  while (v9);
LABEL_26:

  if (objc_msgSend(v7, "count"))
    v6 = v7;
  else
    v6 = 0;

LABEL_31:
  return v6;
}

- (id)_hysteresisPredicate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("completionType == %llu OR (completionType >= %llu AND completedDate >= %@)"), 4097, 8193, a3);
}

- (id)_hysteresisPredicate:(id)a3 config:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if ((objc_msgSend(a4, "skippedHysteresis") & 1) != 0
    || !-[DRSTaskingDecisionMaker enforceTeamHysteresis](self, "enforceTeamHysteresis"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("completionType == %llu"), 4097);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DRSTaskingDecisionMaker _hysteresisPredicate:](self, "_hysteresisPredicate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (BOOL)_configDoesPassTeamHysteresis:(id)a3 logTelemetry:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  DRSConfigMetadata *v27;
  DRSConfigMetadata *v28;
  void *v29;
  void *v30;
  void *v31;
  DRSConfigMetadata *v32;
  NSObject *v33;
  void *v34;
  DRSConfigMetadata *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "teamID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("teamID == %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99D68];
  -[DRSTaskingDecisionMaker limitingParameters](self, "limitingParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "perTeamTaskingHysteresisInterval");
  v13 = -v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateWithTimeInterval:sinceDate:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[DRSTaskingDecisionMaker _hysteresisPredicate:config:](self, "_hysteresisPredicate:config:", v15, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3528];
  v51[0] = v9;
  v51[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[DRSTaskingDecisionMaker configStore](self, "configStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v21 = objc_msgSend(v20, "metadataCountForPredicate:fetchLimit:withErrorOut:", v19, 1, &v46);
  v22 = v46;

  if (v22)
  {
    v42 = v16;
    v43 = v15;
    v44 = v9;
    DPLogHandle_TaskingDecisionMakerError();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      objc_msgSend(v5, "configUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v24;
      v49 = 2114;
      v50 = (uint64_t)v22;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PerTeamHysteresisError", "Rejecting config %{public}@ due to team hysteresis error %{public}@", buf, 0x16u);

    }
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v22, "localizedDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Per-team hysteresis error %@"), v26);
    v27 = (DRSConfigMetadata *)objc_claimAutoreleasedReturnValue();

    v28 = [DRSConfigMetadata alloc];
    objc_msgSend(v5, "teamID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingDecisionMaker currentReceivedDate](self, "currentReceivedDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v41) = -[DRSTaskingDecisionMaker reportToDecisionServer](self, "reportToDecisionServer");
    LOBYTE(v41) = a4;
    v32 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v28, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v29, v30, 3, 1, v31, v6, v6, v27, 0, v41);

    -[DRSTaskingDecisionMaker _persistReceivedMetadata:](self, "_persistReceivedMetadata:", v32);
  }
  else
  {
    if (!v21)
    {
      v39 = 1;
      goto LABEL_10;
    }
    v42 = v16;
    v43 = v15;
    v44 = v9;
    DPLogHandle_TaskingDecisionMaker();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v33))
    {
      objc_msgSend(v5, "configUUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v34;
      v49 = 2048;
      v50 = v21;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamHysteresisRejection", "Rejecting config %{public}@ due to team hysteresis (matching count of %lu)", buf, 0x16u);

    }
    v35 = [DRSConfigMetadata alloc];
    objc_msgSend(v5, "teamID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingDecisionMaker currentReceivedDate](self, "currentReceivedDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v41) = -[DRSTaskingDecisionMaker reportToDecisionServer](self, "reportToDecisionServer");
    LOBYTE(v41) = a4;
    v27 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v35, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v36, v37, 3, 1, v38, v6, v6, CFSTR("Rejected by per-team hysteresis"), 0, v41);

    -[DRSTaskingDecisionMaker _persistReceivedMetadata:](self, "_persistReceivedMetadata:", v27);
  }

  v39 = 0;
  v15 = v43;
  v9 = v44;
  v16 = v42;
LABEL_10:

  return v39;
}

- (id)_configsPassingPerTeamHysteresis:(id)a3 logTelemetry:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[DRSTaskingDecisionMaker _configDoesPassTeamHysteresis:logTelemetry:](self, "_configDoesPassTeamHysteresis:logTelemetry:", v13, v4, (_QWORD)v15))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_configsPassingOverallHysteresis:(id)a3 logTelemetry:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  DRSConfigMetadata *v26;
  void *v27;
  void *v28;
  void *v29;
  DRSConfigMetadata *v30;
  id v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  NSObject *v56;
  void *v57;
  DRSConfigMetadata *v58;
  void *v59;
  void *v60;
  void *v61;
  DRSConfigMetadata *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  DRSConfigMetadata *v73;
  void *v74;
  void *v75;
  void *v76;
  DRSConfigMetadata *v77;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  unint64_t v84;
  id obj;
  id obja;
  void *v87;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  uint8_t buf[4];
  uint64_t v108;
  __int16 v109;
  unint64_t v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[DRSTaskingDecisionMaker enforceGlobalHysteresisAndCap](self, "enforceGlobalHysteresisAndCap"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99D68];
    -[DRSTaskingDecisionMaker limitingParameters](self, "limitingParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "taskingHysteresisInterval");
    v9 = -v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[DRSTaskingDecisionMaker configStore](self, "configStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingDecisionMaker _hysteresisPredicate:](self, "_hysteresisPredicate:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTaskingDecisionMaker limitingParameters](self, "limitingParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0;
    v15 = objc_msgSend(v12, "metadataCountForPredicate:fetchLimit:withErrorOut:", v13, objc_msgSend(v14, "acceptedConfigCountCap"), &v106);
    v16 = v106;

    v87 = v16;
    v80 = v11;
    v81 = v5;
    if (v16)
    {
      DPLogHandle_TaskingDecisionMakerError();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        *(_DWORD *)buf = 138543362;
        v108 = (uint64_t)v16;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OverallHysteresisError", "Rejecting all configs due to overall hysteresis error %{public}@", buf, 0xCu);
      }

      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      obj = v5;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v103;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v103 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v87, "localizedDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithFormat:", CFSTR("Overall hysteresis error %@"), v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = [DRSConfigMetadata alloc];
            objc_msgSend(v22, "teamID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "configUUID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[DRSTaskingDecisionMaker currentReceivedDate](self, "currentReceivedDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            BYTE1(v79) = -[DRSTaskingDecisionMaker reportToDecisionServer](self, "reportToDecisionServer");
            LOBYTE(v79) = a4;
            v30 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v26, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v27, v28, 3, 1, v29, v89, v25, 0, v79);

            -[DRSTaskingDecisionMaker _persistReceivedMetadata:](self, "_persistReceivedMetadata:", v30);
          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
        }
        while (v19);
      }

      v31 = 0;
      v11 = v80;
      v5 = v81;
    }
    else
    {
      -[DRSTaskingDecisionMaker limitingParameters](self, "limitingParameters");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "acceptedConfigCountCap");

      if (v15 >= v33)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        DPLogHandle_TaskingDecisionMaker();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v64))
        {
          -[DRSTaskingDecisionMaker limitingParameters](self, "limitingParameters");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "acceptedConfigCountCap");
          *(_DWORD *)buf = 134217984;
          v108 = v66;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v64, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OverallHysteresisRejection", "Rejecting all configs due to being at or over the accepted config count cap %lu", buf, 0xCu);

        }
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v67 = v5;
        v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
        if (v68)
        {
          v69 = v68;
          v70 = *(_QWORD *)v99;
          do
          {
            for (j = 0; j != v69; ++j)
            {
              if (*(_QWORD *)v99 != v70)
                objc_enumerationMutation(v67);
              v72 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
              if (objc_msgSend(v72, "skippedHysteresis"))
              {
                objc_msgSend(v63, "addObject:", v72);
              }
              else
              {
                v73 = [DRSConfigMetadata alloc];
                objc_msgSend(v72, "teamID");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "configUUID");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                -[DRSTaskingDecisionMaker currentReceivedDate](self, "currentReceivedDate");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                BYTE1(v79) = -[DRSTaskingDecisionMaker reportToDecisionServer](self, "reportToDecisionServer");
                LOBYTE(v79) = a4;
                v77 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v73, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v74, v75, 3, 1, v76, v89, CFSTR("No open overall slots"), 0, v79);

                -[DRSTaskingDecisionMaker _persistReceivedMetadata:](self, "_persistReceivedMetadata:", v77);
              }
            }
            v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
          }
          while (v69);
        }

        if (objc_msgSend(v63, "count"))
          v31 = v63;
        else
          v31 = 0;
        v11 = v80;

        v5 = v81;
      }
      else
      {
        -[DRSTaskingDecisionMaker limitingParameters](self, "limitingParameters");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "acceptedConfigCountCap");

        v84 = v35 - v15;
        if (v35 - v15 >= objc_msgSend(v5, "count"))
        {
          v31 = v5;
        }
        else
        {
          v36 = (void *)objc_msgSend(v5, "mutableCopy");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35 != v15)
          {
            v38 = v35 - v15;
            do
            {
              v39 = arc4random_uniform(objc_msgSend(v36, "count"));
              objc_msgSend(v36, "objectAtIndexedSubscript:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v40);
              objc_msgSend(v36, "removeObjectAtIndex:", v39);

              --v38;
            }
            while (v38);
          }
          v83 = v37;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v42 = v36;
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v94, v112, 16);
          v82 = v41;
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v95;
            do
            {
              for (k = 0; k != v44; ++k)
              {
                if (*(_QWORD *)v95 != v45)
                  objc_enumerationMutation(v42);
                v47 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
                if (objc_msgSend(v47, "skippedHysteresis"))
                {
                  objc_msgSend(v41, "addObject:", v47);
                  objc_msgSend(v37, "addObject:", v47);
                  DPLogHandle_TaskingDecisionMaker();
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_signpost_enabled(v48))
                  {
                    objc_msgSend(v47, "configUUID");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v108 = (uint64_t)v49;
                    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigAcceptedBySkippingHysteresis", "Accepted %{public}@ due to 'skipHysteresis'", buf, 0xCu);

                  }
                  v41 = v82;
                }
              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v94, v112, 16);
            }
            while (v44);
          }

          if (objc_msgSend(v41, "count"))
            objc_msgSend(v42, "removeObjectsInArray:", v41);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not selected for one of the %llu open slots"), v84);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          obja = v42;
          v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v90, v111, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v91;
            do
            {
              for (m = 0; m != v52; ++m)
              {
                if (*(_QWORD *)v91 != v53)
                  objc_enumerationMutation(obja);
                v55 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * m);
                DPLogHandle_TaskingDecisionMaker();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_signpost_enabled(v56))
                {
                  objc_msgSend(v55, "configUUID");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v108 = (uint64_t)v57;
                  v109 = 2048;
                  v110 = v84;
                  _os_signpost_emit_with_name_impl(&dword_1DBB92000, v56, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OverallHysteresisRejection", "Rejected %{public}@ due to not being picked for one of the %llu open slots", buf, 0x16u);

                }
                v58 = [DRSConfigMetadata alloc];
                objc_msgSend(v55, "teamID");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "configUUID");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                -[DRSTaskingDecisionMaker currentReceivedDate](self, "currentReceivedDate");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                BYTE1(v79) = -[DRSTaskingDecisionMaker reportToDecisionServer](self, "reportToDecisionServer");
                LOBYTE(v79) = a4;
                v62 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v58, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v59, v60, 3, 1, v61, v89, v50, 0, v79);

                -[DRSTaskingDecisionMaker _persistReceivedMetadata:](self, "_persistReceivedMetadata:", v62);
              }
              v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v90, v111, 16);
            }
            while (v52);
          }

          v11 = v80;
          v5 = v81;
          v31 = v83;
        }
      }
    }

  }
  else
  {
    v31 = v5;
  }

  return v31;
}

- (void)_rejectTaskingMessageDueToDisabledState:(id)a3 logTelemetry:(BOOL)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "teamTaskings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__DRSTaskingDecisionMaker__rejectTaskingMessageDueToDisabledState_logTelemetry___block_invoke;
  v11[3] = &unk_1EA3D1CA8;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v10 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __80__DRSTaskingDecisionMaker__rejectTaskingMessageDueToDisabledState_logTelemetry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  DRSConfigMetadata *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  DRSConfigMetadata *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  DPLogHandle_TaskingDecisionMaker();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    objc_msgSend(v5, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectingConfig", "Decision maker is disabled (active config cap is 0). Rejecting config %{public}@", buf, 0xCu);

  }
  v10 = [DRSConfigMetadata alloc];
  objc_msgSend(v5, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentReceivedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_BYTE *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 40);
  BYTE1(v17) = objc_msgSend(*(id *)(a1 + 32), "reportToDecisionServer");
  LOBYTE(v17) = v14;
  v16 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v10, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v6, v12, 3, 2, v13, v15, v15, CFSTR("Tasking is disabled"), 0, v17);

  objc_msgSend(*(id *)(a1 + 32), "_persistReceivedMetadata:", v16);
}

- (id)acceptedConfigs:(id)a3 logTelemetry:(BOOL)a4 allowWildcardBuild:(BOOL)a5
{
  uint64_t v5;
  _BOOL8 v6;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  _BOOL8 v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t i;
  void *v33;
  NSObject *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  DRSConfigMetadata *v42;
  void *v43;
  void *v44;
  DRSTaskingDecisionMaker *v45;
  void *v46;
  DRSConfigMetadata *v47;
  NSObject *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id obj;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  uint64_t v80;
  unsigned int v81;
  _BOOL4 v82;
  DRSTaskingDecisionMaker *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t v89[128];
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  const __CFString *v93;
  __int16 v94;
  const __CFString *v95;
  __int16 v96;
  const __CFString *v97;
  __int16 v98;
  const __CFString *v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  id v103;
  __int16 v104;
  void *v105;
  uint64_t v106;

  v5 = a5;
  v6 = a4;
  v106 = *MEMORY[0x1E0C80C00];
  v84 = a3;
  DPLogHandle_TaskingDecisionMaker();
  v8 = objc_claimAutoreleasedReturnValue();
  v83 = self;
  if (os_signpost_enabled(v8))
  {
    objc_msgSend(v84, "messageUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DRSTaskingDecisionMaker enforceDate](self, "enforceDate"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    if (-[DRSTaskingDecisionMaker enforceSampling](v83, "enforceSampling"))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v79 = v11;
    if (-[DRSTaskingDecisionMaker enforceTeamHysteresis](v83, "enforceTeamHysteresis"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v6;
    if (-[DRSTaskingDecisionMaker enforceGlobalHysteresisAndCap](v83, "enforceGlobalHysteresisAndCap"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    -[DRSTaskingDecisionMaker limitingParameters](v83, "limitingParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "acceptedConfigCountCap");
    -[DRSTaskingDecisionMaker limitingParameters](v83, "limitingParameters");
    v81 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "taskingHysteresisInterval");
    v19 = v18;
    -[DRSTaskingDecisionMaker limitingParameters](v83, "limitingParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "perTeamTaskingHysteresisInterval");
    *(_DWORD *)buf = 138545154;
    v91 = v9;
    v92 = 2114;
    v93 = v10;
    self = v83;
    v94 = 2114;
    v95 = v79;
    v96 = 2114;
    v97 = v12;
    v98 = 2114;
    v99 = v14;
    v6 = v13;
    v100 = 2048;
    v101 = v16;
    v102 = 2048;
    v103 = v19;
    v104 = 2048;
    v105 = v21;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessingTaskingMessage", "Processing tasking message %{public}@ with:\n\t-enforceDate: %{public}@\n\t-enforceSampling: %{public}@\n\t-enforceTeamHysteresis: %{public}@\n\t-enforceGlobalHysteresisAndCap: %{public}@\n\nLimiting Parameters:\n\t-acceptedCountCap: %lu\n\t-taskingHysteresisInterval: %f\n\t-perTeamTaskingHysteresisInterval: %f", buf, 0x52u);

    v5 = v81;
  }

  objc_msgSend(v84, "dateReceived");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSTaskingDecisionMaker setCurrentReceivedDate:](self, "setCurrentReceivedDate:", v22);

  -[DRSTaskingDecisionMaker limitingParameters](self, "limitingParameters");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "acceptedConfigCountCap");

  if (v24)
  {
    v82 = v6;
    -[DRSTaskingDecisionMaker _teamTaskingsPassingDate:logTelemetry:](self, "_teamTaskingsPassingDate:logTelemetry:", v84, v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25 && objc_msgSend(v25, "count"))
    {
      -[DRSTaskingDecisionMaker _teamTaskingsPassingBuild:logTelemetry:allowWildcardBuild:](self, "_teamTaskingsPassingBuild:logTelemetry:allowWildcardBuild:", v26, v82, v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        -[DRSTaskingDecisionMaker _configsPassingSampling:logTelemetry:](self, "_configsPassingSampling:logTelemetry:", v27, v82);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v28;
        if (v28 && objc_msgSend(v28, "count"))
        {
          -[DRSTaskingDecisionMaker _configsPassingPerTeamHysteresis:logTelemetry:](self, "_configsPassingPerTeamHysteresis:logTelemetry:", v72, v82);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v29;
          if (v29 && objc_msgSend(v29, "count"))
          {
            -[DRSTaskingDecisionMaker _configsPassingOverallHysteresis:logTelemetry:](self, "_configsPassingOverallHysteresis:logTelemetry:", v71, v82);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30;
            if (v30 && objc_msgSend(v30, "count"))
            {
              v69 = v27;
              v70 = v26;
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v75 = (id)objc_claimAutoreleasedReturnValue();
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v88 = 0u;
              obj = v31;
              v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
              if (v80)
              {
                v76 = *(_QWORD *)v86;
                v77 = v31;
                do
                {
                  for (i = 0; i != v80; ++i)
                  {
                    if (*(_QWORD *)v86 != v76)
                      objc_enumerationMutation(obj);
                    v33 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                    DPLogHandle_TaskingDecisionMaker();
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (os_signpost_enabled(v34))
                    {
                      objc_msgSend(v84, "messageUUID");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "configUUID");
                      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v91 = v35;
                      v92 = 2114;
                      v93 = v36;
                      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptedConfig", "TaskingMessage %{public}@: Accepted config %{public}@", buf, 0x16u);

                    }
                    objc_msgSend(v33, "startDate");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = objc_msgSend(v37, "compare:", v78);

                    if (v38 == 1)
                      v39 = 1;
                    else
                      v39 = 2;
                    if (v38 == 1)
                      v40 = 0;
                    else
                      v40 = v78;
                    v41 = v40;
                    v42 = [DRSConfigMetadata alloc];
                    objc_msgSend(v33, "teamID");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "configUUID");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DRSTaskingDecisionMaker currentReceivedDate](self, "currentReceivedDate");
                    v45 = self;
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    BYTE1(v68) = -[DRSTaskingDecisionMaker reportToDecisionServer](v45, "reportToDecisionServer");
                    LOBYTE(v68) = v82;
                    v47 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v42, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v43, v44, v39, 4097, v46, v41, 0, 0, v33, v68);

                    if (v47)
                    {
                      -[DRSTaskingDecisionMaker _persistReceivedMetadata:](v45, "_persistReceivedMetadata:", v47);
                      objc_msgSend(v75, "addObject:", v47);
                      self = v45;
                    }
                    else
                    {
                      DPLogHandle_TaskingDecisionMakerError();
                      v48 = objc_claimAutoreleasedReturnValue();
                      if (os_signpost_enabled(v48))
                      {
                        objc_msgSend(v84, "messageUUID");
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v33, "teamID");
                        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v33, "configUUID");
                        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        DRConfigStringForState();
                        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        DRConfigCompletionTypeString(4097);
                        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        -[DRSTaskingDecisionMaker currentReceivedDate](v83, "currentReceivedDate");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v33, "jsonDictRepresentation");
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138545154;
                        v91 = v74;
                        v92 = 2114;
                        v93 = v49;
                        v94 = 2114;
                        v95 = v50;
                        v96 = 2114;
                        v97 = v51;
                        v98 = 2114;
                        v99 = v52;
                        v100 = 2114;
                        v101 = (uint64_t)v53;
                        v102 = 2114;
                        v103 = v41;
                        v104 = 2114;
                        v105 = v54;
                        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidConfigMetadata", "TaskingMessage %{public}@: Invalid config metadata:\n\tTeamID: %{public}@\n\tConfigUUID: %{public}@\n\tState: %{public}@\n\tCompletionType: %{public}@\n\tReceived Date: %{public}@\n\tApplied Date: %{public}@\n\tConfig:%{public}@\n", buf, 0x52u);

                      }
                      self = v83;
                    }
                    v31 = v77;

                  }
                  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
                }
                while (v80);
              }

              -[DRSTaskingDecisionMaker setCurrentReceivedDate:](self, "setCurrentReceivedDate:", 0);
              v27 = v69;
              v26 = v70;
            }
            else
            {
              DPLogHandle_TaskingDecisionMaker();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v65))
              {
                objc_msgSend(v84, "messageUUID");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v91 = v66;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v65, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "No configs from TaskingMessage %{public}@ passed overall hysteresis", buf, 0xCu);

              }
              -[DRSTaskingDecisionMaker setCurrentReceivedDate:](self, "setCurrentReceivedDate:", 0);
              v75 = 0;
            }

          }
          else
          {
            DPLogHandle_TaskingDecisionMaker();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v63))
            {
              objc_msgSend(v84, "messageUUID");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v91 = v64;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v63, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "No configs from TaskingMessage %{public}@ passed per-team hysteresis", buf, 0xCu);

            }
            -[DRSTaskingDecisionMaker setCurrentReceivedDate:](self, "setCurrentReceivedDate:", 0);
            v75 = 0;
          }

        }
        else
        {
          DPLogHandle_TaskingDecisionMaker();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v59))
          {
            objc_msgSend(v84, "messageUUID");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v91 = v60;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v59, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "No configs from TaskingMessage %{public}@ passed sampling", buf, 0xCu);

          }
          -[DRSTaskingDecisionMaker setCurrentReceivedDate:](self, "setCurrentReceivedDate:", 0);
          v75 = 0;
        }

      }
      else
      {
        DPLogHandle_TaskingDecisionMaker();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v61))
        {
          objc_msgSend(v84, "messageUUID");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v91 = v62;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v61, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "All configs from TaskingMessage %{public}@ rejected by build", buf, 0xCu);

        }
        -[DRSTaskingDecisionMaker setCurrentReceivedDate:](self, "setCurrentReceivedDate:", 0);
        v75 = 0;
      }

    }
    else
    {
      DPLogHandle_TaskingDecisionMaker();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v55))
      {
        objc_msgSend(v84, "messageUUID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v56;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v55, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "All configs from TaskingMessage %{public}@ rejected by date", buf, 0xCu);

      }
      -[DRSTaskingDecisionMaker setCurrentReceivedDate:](self, "setCurrentReceivedDate:", 0);
      v75 = 0;
    }

  }
  else
  {
    DPLogHandle_TaskingDecisionMaker();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v57))
    {
      objc_msgSend(v84, "messageUUID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v58;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v57, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectingTaskingMessage", "Decision maker is disabled (active config cap is 0). Rejecting message %{public}@ entirely", buf, 0xCu);

    }
    -[DRSTaskingDecisionMaker _rejectTaskingMessageDueToDisabledState:logTelemetry:](self, "_rejectTaskingMessageDueToDisabledState:logTelemetry:", v84, v6);
    v75 = 0;
  }

  return v75;
}

- (id)acceptedConfigs:(id)a3 logTelemetry:(BOOL)a4
{
  return -[DRSTaskingDecisionMaker acceptedConfigs:logTelemetry:allowWildcardBuild:](self, "acceptedConfigs:logTelemetry:allowWildcardBuild:", a3, a4, 0);
}

- (id)acceptedCancels:(id)a3
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
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v4 = a3;
  -[DRSTaskingDecisionMaker configStore](self, "configStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "messageUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Cancelled by cancel tasking message %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "perTeamCancelledConfigUUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__DRSTaskingDecisionMaker_acceptedCancels___block_invoke;
    v18[3] = &unk_1EA3D1CD0;
    v18[4] = self;
    v19 = v7;
    v20 = v11;
    v21 = v4;
    v13 = v6;
    v22 = v13;
    v14 = v11;
    v15 = v7;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);

    if (objc_msgSend(v13, "count"))
      v16 = v13;
    else
      v16 = 0;

  }
  else
  {
    objc_msgSend(v4, "perTeamCancelledConfigUUIDs");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __43__DRSTaskingDecisionMaker_acceptedCancels___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12);
      objc_msgSend(*(id *)(a1 + 32), "configStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v14, "configMetadataForUUID:errorOut:", v13, &v31);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v31;

      if (v16)
        break;
      if (-[NSObject state](v15, "state") == 3)
      {
        DPLogHandle_TaskingDecisionMaker();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v17))
        {
          *(_DWORD *)buf = 138543362;
          v37 = v13;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigAlreadyCompleted", "Config %{public}@ already completed", buf, 0xCu);
        }

      }
      else
      {

        objc_msgSend(*(id *)(a1 + 32), "configStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v30 = 0;
        v21 = objc_msgSend(v18, "completeConfigWithUUID:completedDate:completionType:completionDescription:errorOut:", v13, v19, 8195, v20, &v30);
        v15 = v30;

        if ((v21 & 1) == 0)
        {
          *a4 = 1;
          DPLogHandle_TaskingDecisionMakerError();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v26))
          {
            -[NSObject localizedDescription](v15, "localizedDescription");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v13;
            v38 = 2114;
            v39 = v27;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelFailed", "Failed to cancel %{public}@ to error: %{public}@", buf, 0x16u);

          }
          v16 = v15;
LABEL_25:

          goto LABEL_26;
        }
        DPLogHandle_TaskingDecisionMaker();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v22))
        {
          objc_msgSend(*(id *)(a1 + 56), "messageUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v37 = v13;
          v38 = 2114;
          v39 = v29;
          v40 = 2114;
          v41 = v23;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelConfig", "Cancelled %{public}@ (teamID %{public}@) due to cancel message %{public}@", buf, 0x20u);

        }
        objc_msgSend(v7, "addObject:", v13);
      }

      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    *a4 = 1;
    DPLogHandle_TaskingDecisionMakerError();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      -[NSObject localizedDescription](v16, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v13;
      v38 = 2114;
      v39 = v25;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptedCancelsFailure", "Lookup of %{public}@ failed due to error: %{public}@", buf, 0x16u);

    }
    v26 = v15;
    goto LABEL_25;
  }
LABEL_17:

  if (objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v7, v29);
LABEL_26:

}

- (void)clientCompletedConfigUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DRSTaskingDecisionMaker configStore](self, "configStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v5, "completeConfigWithUUID:completedDate:completionType:completionDescription:errorOut:", v4, v6, 8196, CFSTR("Completed by client"), &v13);
  v8 = v13;

  if ((v7 & 1) == 0)
  {
    DPLogHandle_TaskingDecisionMakerError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(v8, "localizedDescription");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("Unknown");
      if (v10)
        v12 = (const __CFString *)v10;
      *(_DWORD *)buf = 138543618;
      v15 = v4;
      v16 = 2114;
      v17 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientCompletionFailed", "Failed to complete config UUID %{public}@ due to error: %{public}@", buf, 0x16u);

    }
  }

}

- (void)clientRejectsConfigUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DRSTaskingDecisionMaker configStore](self, "configStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v5, "completeConfigWithUUID:completedDate:completionType:completionDescription:errorOut:", v4, v6, 1, CFSTR("Rejected by client"), &v13);
  v8 = v13;

  if ((v7 & 1) == 0)
  {
    DPLogHandle_TaskingDecisionMakerError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(v8, "localizedDescription");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("Unknown");
      if (v10)
        v12 = (const __CFString *)v10;
      *(_DWORD *)buf = 138543618;
      v15 = v4;
      v16 = 2114;
      v17 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientRejectionFailed", "Failed to reject config UUID %{public}@ due to error: %{public}@", buf, 0x16u);

    }
  }

}

- (NSTimeZone)deviceTimezone
{
  return self->_deviceTimezone;
}

- (DRSTaskingLimitingParameters)limitingParameters
{
  return self->_limitingParameters;
}

- (NSString)dbWorkingDirectoryPath
{
  return self->_dbWorkingDirectoryPath;
}

- (DRSConfigPersistedStore)configStore
{
  return self->_configStore;
}

- (BOOL)enforceDate
{
  return self->_enforceDate;
}

- (BOOL)enforceBuild
{
  return self->_enforceBuild;
}

- (BOOL)enforceSampling
{
  return self->_enforceSampling;
}

- (BOOL)enforceTeamHysteresis
{
  return self->_enforceTeamHysteresis;
}

- (BOOL)enforceGlobalHysteresisAndCap
{
  return self->_enforceGlobalHysteresisAndCap;
}

- (DRSTaskingCloudKitHelper)cloudKitHelper
{
  return self->_cloudKitHelper;
}

- (NSDate)currentReceivedDate
{
  return self->_currentReceivedDate;
}

- (void)setCurrentReceivedDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentReceivedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentReceivedDate, 0);
  objc_storeStrong((id *)&self->_cloudKitHelper, 0);
  objc_storeStrong((id *)&self->_configStore, 0);
  objc_storeStrong((id *)&self->_dbWorkingDirectoryPath, 0);
  objc_storeStrong((id *)&self->_limitingParameters, 0);
  objc_storeStrong((id *)&self->_deviceTimezone, 0);
}

@end
