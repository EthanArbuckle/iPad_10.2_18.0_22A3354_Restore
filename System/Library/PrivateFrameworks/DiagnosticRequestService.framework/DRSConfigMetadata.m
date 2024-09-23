@implementation DRSConfigMetadata

+ (BOOL)_isValidState:(unsigned __int8)a3 completionType:(unint64_t)a4 receivedDate:(id)a5 appliedDate:(id)a6 completedDate:(id)a7 completionDescription:(id)a8
{
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  BOOL v23;
  _DWORD v25[2];
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v12 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = v16;
  if (v13)
  {
    if ((v12 - 1) >= 2)
      v18 = a4 != 4097;
    else
      v18 = a4 == 4097;
    if (v18)
    {
      if (v12 == 3 || !v16)
      {
        switch(v12)
        {
          case 3:
            if (!v14)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Missing applied date";
              goto LABEL_12;
            }
            if (!v15)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Complete state must have a non-nil completed date";
              goto LABEL_12;
            }
            if (objc_msgSend(v14, "compare:", v13) == -1)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Applied date < received date";
              goto LABEL_12;
            }
            if (objc_msgSend(v15, "compare:", v14) == -1)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Completed date > applied date";
              goto LABEL_12;
            }
            break;
          case 2:
            if (!v14)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Missing applied date";
              goto LABEL_12;
            }
            if (v15)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Active state must have a nil completed date";
              goto LABEL_12;
            }
            if (objc_msgSend(v14, "compare:", v13) == -1)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Applied date > received date";
              goto LABEL_12;
            }
            break;
          case 1:
            if (v14)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Waiting state must have nil applied date";
              goto LABEL_12;
            }
            if (v15)
            {
              DPLogHandle_ConfigPersistedStoreError();
              v19 = objc_claimAutoreleasedReturnValue();
              if (!os_signpost_enabled(v19))
                goto LABEL_16;
              LOWORD(v25[0]) = 0;
              v20 = "Waiting state must have nil completed date";
              goto LABEL_12;
            }
            break;
        }
        v23 = 1;
        goto LABEL_17;
      }
      DPLogHandle_ConfigPersistedStoreError();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        LOWORD(v25[0]) = 0;
        v20 = "Waiting state must have nil completion description";
LABEL_12:
        v21 = v19;
        v22 = 2;
LABEL_15:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMetadataConfiguration", v20, (uint8_t *)v25, v22);
      }
    }
    else
    {
      DPLogHandle_ConfigPersistedStoreError();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        v25[0] = 67109376;
        v25[1] = v12;
        v26 = 2048;
        v27 = a4;
        v20 = "State %u is incompatible with completion type: %llu";
        v21 = v19;
        v22 = 18;
        goto LABEL_15;
      }
    }
  }
  else
  {
    DPLogHandle_ConfigPersistedStoreError();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      LOWORD(v25[0]) = 0;
      v20 = "Missing received date";
      goto LABEL_12;
    }
  }
LABEL_16:

  v23 = 0;
LABEL_17:

  return v23;
}

- (DRSConfigMetadata)initWithTeamID:(id)a3 configUUID:(id)a4 state:(unsigned __int8)a5 completionType:(unint64_t)a6 receivedDate:(id)a7 appliedDate:(id)a8 completedDate:(id)a9 completionDescription:(id)a10 config:(id)a11 logTelemetry:(BOOL)a12 reportToDecisionServer:(BOOL)a13
{
  id v18;
  id v19;
  void *v20;
  char v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  DRSConfigMetadata *v26;
  DRSConfigMetadata *v27;
  DRSConfigMetadata *v29;
  DRSConfigMetadata *v30;
  unsigned int v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  objc_super v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v31 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v38 = a4;
  v37 = a7;
  v36 = a8;
  v35 = a9;
  v34 = a10;
  v19 = a11;
  v39 = v19;
  if (!v18)
  {
    DPLogHandle_ConfigPersistedStoreError();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      v23 = "Missing teamID";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    v26 = 0;
    v27 = self;
    goto LABEL_19;
  }
  v32 = v18;
  if (v19
    && (objc_msgSend(v19, "teamID"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "isEqualToString:", v32),
        v20,
        v19 = v39,
        (v21 & 1) == 0))
  {
    DPLogHandle_ConfigPersistedStoreError();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      objc_msgSend(v39, "teamID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v32;
      v43 = 2114;
      v44 = v25;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMetadataConfiguration", "teamID does not match config teamID (%{public}@ vs %{public}@)", buf, 0x16u);

    }
    v26 = 0;
    v18 = v32;
    v27 = self;
  }
  else
  {
    if (!v38)
    {
      DPLogHandle_ConfigPersistedStoreError();
      v22 = objc_claimAutoreleasedReturnValue();
      v18 = v32;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        v23 = "Missing UUID";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    v18 = v32;
    if (v31 != 3 && !v19)
    {
      DPLogHandle_ConfigPersistedStoreError();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        v23 = "Waiting or active state must have config";
LABEL_16:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMetadataConfiguration", v23, buf, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    if (!objc_msgSend((id)objc_opt_class(), "_isValidState:completionType:receivedDate:appliedDate:completedDate:completionDescription:", v31, a6, v37, v36, v35, v34))goto LABEL_18;
    v40.receiver = self;
    v40.super_class = (Class)DRSConfigMetadata;
    v29 = -[DRSConfigMetadata init](&v40, sel_init);
    if (v29)
    {
      v30 = v29;
      objc_storeStrong((id *)&v29->_teamID, a3);
      objc_storeStrong((id *)&v30->_configUUID, a4);
      v30->_state = v31;
      v30->_completionType = a6;
      objc_storeStrong((id *)&v30->_receivedDate, a7);
      objc_storeStrong((id *)&v30->_appliedDate, a8);
      objc_storeStrong((id *)&v30->_completedDate, a9);
      objc_storeStrong((id *)&v30->_completionDescription, a10);
      objc_storeStrong((id *)&v30->_config, a11);
      v29 = v30;
      v30->_logTelemetry = a12;
      v18 = v32;
      v29->_reportToDecisionServer = a13;
    }
    v27 = v29;
    v26 = v27;
  }
LABEL_19:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  DRSConfigMetadata *v4;
  DRSConfigMetadata *v5;
  DRSConfigMetadata *v6;
  int v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char IsNil;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  char v46;
  char v47;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = (DRSConfigMetadata *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_23;
  if (v4 == self)
  {
    v47 = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[DRSConfigMetadata state](self, "state");
    if (v7 != -[DRSConfigMetadata state](v6, "state"))
      goto LABEL_21;
    v8 = -[DRSConfigMetadata completionType](self, "completionType");
    if (v8 != -[DRSConfigMetadata completionType](v6, "completionType"))
      goto LABEL_21;
    v9 = -[DRSConfigMetadata logTelemetry](self, "logTelemetry");
    if (v9 != -[DRSConfigMetadata logTelemetry](v6, "logTelemetry"))
      goto LABEL_21;
    v10 = -[DRSConfigMetadata reportToDecisionServer](self, "reportToDecisionServer");
    if (v10 != -[DRSConfigMetadata reportToDecisionServer](v6, "reportToDecisionServer"))
      goto LABEL_21;
    -[DRSConfigMetadata teamID](self, "teamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSConfigMetadata teamID](v6, "teamID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_21;
    -[DRSConfigMetadata configUUID](self, "configUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSConfigMetadata configUUID](v6, "configUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_21;
    -[DRSConfigMetadata receivedDate](self, "receivedDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSConfigMetadata receivedDate](v6, "receivedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToDate:", v18);

    if (!v19)
      goto LABEL_21;
    -[DRSConfigMetadata appliedDate](self, "appliedDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSConfigMetadata appliedDate](v6, "appliedDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    IsNil = _oneIsNil((uint64_t)v20, (uint64_t)v21);

    if ((IsNil & 1) != 0)
      goto LABEL_21;
    -[DRSConfigMetadata appliedDate](self, "appliedDate");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      -[DRSConfigMetadata appliedDate](self, "appliedDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSConfigMetadata appliedDate](v6, "appliedDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqualToDate:", v26);

      if (!v27)
        goto LABEL_21;
    }
    -[DRSConfigMetadata completedDate](self, "completedDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSConfigMetadata completedDate](v6, "completedDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = _oneIsNil((uint64_t)v28, (uint64_t)v29);

    if ((v30 & 1) != 0)
      goto LABEL_21;
    -[DRSConfigMetadata completedDate](self, "completedDate");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      -[DRSConfigMetadata completedDate](self, "completedDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSConfigMetadata completedDate](v6, "completedDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqualToDate:", v34);

      if (!v35)
        goto LABEL_21;
    }
    -[DRSConfigMetadata completionDescription](self, "completionDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSConfigMetadata completionDescription](v6, "completionDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = _oneIsNil((uint64_t)v36, (uint64_t)v37);

    if ((v38 & 1) != 0)
      goto LABEL_21;
    -[DRSConfigMetadata completionDescription](self, "completionDescription");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = (void *)v39;
      -[DRSConfigMetadata completionDescription](self, "completionDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSConfigMetadata completionDescription](v6, "completionDescription");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqualToString:", v42);

      if (!v43)
        goto LABEL_21;
    }
    -[DRSConfigMetadata config](self, "config");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSConfigMetadata config](v6, "config");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = _oneIsNil((uint64_t)v44, (uint64_t)v45);

    if ((v46 & 1) == 0)
    {
      -[DRSConfigMetadata config](self, "config");
      v49 = objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        v50 = (void *)v49;
        -[DRSConfigMetadata config](self, "config");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSConfigMetadata config](v6, "config");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v51, "isEqual:", v52);

      }
      else
      {
        v47 = 1;
      }
    }
    else
    {
LABEL_21:
      v47 = 0;
    }

  }
  else
  {
LABEL_23:
    v47 = 0;
  }
LABEL_25:

  return v47;
}

- (id)_ON_CONTEXT_QUEUE_initWithConfigMetadataMO:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  DRSConfigMetadata *v17;
  uint64_t v19;
  void *v20;
  DRSConfigMetadata *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "configMO");
  v5 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v5;
  if (v5)
  {
    v6 = v5;
    v7 = objc_alloc(MEMORY[0x1E0D1D258]);
    objc_msgSend(v7, "ON_CONTEXT_QUEUE_initWithConfigMO:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  v21 = self;
  objc_msgSend(v4, "teamID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "state");
  v10 = objc_msgSend(v4, "completionType");
  objc_msgSend(v4, "receivedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appliedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "logTelemetry");
  v16 = objc_msgSend(v4, "reportToDecisionServer");

  BYTE1(v19) = v16;
  LOBYTE(v19) = v15;
  v17 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v21, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v20, v8, v9, v10, v11, v12, v13, v14, v23, v19);

  return v17;
}

- (id)_uuidPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  -[DRSConfigMetadata configUUID](self, "configUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("configUUID == %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:(id)a3 context:(id)a4 errorOut:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = a4;
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("configUUID == %@"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ON_CONTEXT_QUEUE_configMetadataForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v11, v10, 0, 0, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (!*a5 && v12)
  {
    if (objc_msgSend(v12, "count"))
    {
      if (objc_msgSend(v12, "count") == 1)
      {
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      DPLogHandle_ConfigPersistedStoreError();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v8;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataQueryFailed", "Found more than 1 ConfigMetadata with UUID %{public}@", buf, 0xCu);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v19 = CFSTR("Duplicate UUIDs");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = 0;
  }
LABEL_10:

  return v13;
}

+ (id)_ON_CONTEXT_QUEUE_configMetadataForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a3;
  +[DRSConfigMetadataMO fetchRequest](DRSConfigMetadataMO, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v13);

  objc_msgSend(v14, "setSortDescriptors:", v12);
  if (a6)
    objc_msgSend(v14, "setFetchLimit:", a6);
  v22 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v14, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  v17 = v16;
  if (v16)
  {
    v18 = objc_retainAutorelease(v16);
    *a7 = v18;
    DPLogHandle_ConfigPersistedStoreError();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v18;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataQueryFailed", "Failed due to error %{public}@", buf, 0xCu);
    }

    v20 = 0;
  }
  else
  {
    v20 = v15;
  }

  return v20;
}

+ (unint64_t)_ON_CONTEXT_QUEUE_countForFilterPredicate:(id)a3 context:(id)a4 errorOut:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  +[DRSConfigMetadataMO fetchRequest](DRSConfigMetadataMO, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v8);

  v16 = 0;
  v10 = objc_msgSend(v7, "countForFetchRequest:error:", v9, &v16);

  v11 = v16;
  v12 = v11;
  if (v11)
  {
    v13 = objc_retainAutorelease(v11);
    *a5 = v13;
    DPLogHandle_ConfigPersistedStoreError();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataCountQueryFailed", "Failed due to error %{public}@", buf, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

- (id)_ON_CONTEXT_QUEUE_moRepresentationInContext:(id)a3 createIfMissing:(BOOL)a4 errorOut:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  DRSConfigMetadataMO *v11;
  DRSConfigMetadataMO *v12;
  DRSConfigMetadataMO *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v6 = a4;
  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_opt_class();
  -[DRSConfigMetadata configUUID](self, "configUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:context:errorOut:", v10, v8, a5);
  v11 = (DRSConfigMetadataMO *)objc_claimAutoreleasedReturnValue();

  if (*a5)
    goto LABEL_2;
  v13 = v11;
  if (!v11)
  {
    if (v6)
    {
      v13 = -[DRSConfigMetadataMO initWithContext:]([DRSConfigMetadataMO alloc], "initWithContext:", v8);
      if (v13)
        goto LABEL_4;
      v24 = (void *)MEMORY[0x1E0CB3940];
      -[DRSConfigMetadata configUUID](self, "configUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("Could not create DRSConfigMetadataMO instance for %@"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v28);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      DPLogHandle_ConfigPersistedStoreError();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v29))
      {
        -[DRSConfigMetadata configUUID](self, "configUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v30;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataQueryFailed", "Could not initalize DRSConfigMetadataMO instance for %{public}@", buf, 0xCu);

      }
    }
    v11 = 0;
LABEL_2:
    v12 = 0;
    goto LABEL_8;
  }
LABEL_4:
  -[DRSConfigMetadata teamID](self, "teamID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSConfigMetadataMO setTeamID:](v13, "setTeamID:", v14);

  -[DRSConfigMetadata configUUID](self, "configUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSConfigMetadataMO setConfigUUID:](v13, "setConfigUUID:", v15);

  -[DRSConfigMetadataMO setState:](v13, "setState:", -[DRSConfigMetadata state](self, "state"));
  -[DRSConfigMetadataMO setCompletionType:](v13, "setCompletionType:", -[DRSConfigMetadata completionType](self, "completionType"));
  -[DRSConfigMetadata receivedDate](self, "receivedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSConfigMetadataMO setReceivedDate:](v13, "setReceivedDate:", v16);

  -[DRSConfigMetadata appliedDate](self, "appliedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSConfigMetadataMO setAppliedDate:](v13, "setAppliedDate:", v17);

  -[DRSConfigMetadata completedDate](self, "completedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSConfigMetadataMO setCompletedDate:](v13, "setCompletedDate:", v18);

  -[DRSConfigMetadata completionDescription](self, "completionDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSConfigMetadataMO setCompletionDescription:](v13, "setCompletionDescription:", v19);

  -[DRSConfigMetadataMO setLogTelemetry:](v13, "setLogTelemetry:", -[DRSConfigMetadata logTelemetry](self, "logTelemetry"));
  -[DRSConfigMetadataMO setReportToDecisionServer:](v13, "setReportToDecisionServer:", -[DRSConfigMetadata reportToDecisionServer](self, "reportToDecisionServer"));
  if (!v11)
  {
    -[DRSConfigMetadata config](self, "config");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[DRSConfigMetadata config](self, "config");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ON_CONTEXT_QUEUE_configMOInContext:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[DRSConfigMetadataMO setConfigMO:](v13, "setConfigMO:", v22);
    }
  }
  v11 = v13;
  v12 = v11;
LABEL_8:

  return v12;
}

- (BOOL)_updateContextWithMORepresentation:(id)a3 errorOut:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__DRSConfigMetadata__updateContextWithMORepresentation_errorOut___block_invoke;
  v10[3] = &unk_1EA3D13B8;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v12 = &v14;
  v13 = &v20;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v8 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __65__DRSConfigMetadata__updateContextWithMORepresentation_errorOut___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  objc_msgSend(v2, "_ON_CONTEXT_QUEUE_moRepresentationInContext:createIfMissing:errorOut:", v3, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = v7;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
  if (v4)
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;

}

- (id)jsonDictionaryRepresentation
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
  void *v28;
  _QWORD v29[6];
  _QWORD v30[7];

  v30[6] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("teamID");
  -[DRSConfigMetadata teamID](self, "teamID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v28;
  v29[1] = CFSTR("configUUID");
  -[DRSConfigMetadata configUUID](self, "configUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v4;
  v29[2] = CFSTR("receivedDate");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[DRSConfigMetadata receivedDate](self, "receivedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v7;
  v29[3] = CFSTR("state");
  -[DRSConfigMetadata state](self, "state");
  DRConfigStringForState();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v8;
  v29[4] = CFSTR("logTelemetry");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSConfigMetadata logTelemetry](self, "logTelemetry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v9;
  v29[5] = CFSTR("reportToDPDS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRSConfigMetadata reportToDecisionServer](self, "reportToDecisionServer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[DRSConfigMetadata appliedDate](self, "appliedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[DRSConfigMetadata appliedDate](self, "appliedDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("appliedDate"));

  }
  -[DRSConfigMetadata completedDate](self, "completedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[DRSConfigMetadata completedDate](self, "completedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    objc_msgSend(v18, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("completedDate"));

  }
  if (-[DRSConfigMetadata completionType](self, "completionType") != 4097)
  {
    DRConfigCompletionTypeString(-[DRSConfigMetadata completionType](self, "completionType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("completionType"));

    -[DRSConfigMetadata completionDescription](self, "completionDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[DRSConfigMetadata completionDescription](self, "completionDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("completionDescription"));

    }
  }
  -[DRSConfigMetadata config](self, "config");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[DRSConfigMetadata config](self, "config");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "jsonDictRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("config"));

  }
  return v12;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSUUID)configUUID
{
  return self->_configUUID;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (unsigned)state
{
  return self->_state;
}

- (unint64_t)completionType
{
  return self->_completionType;
}

- (NSDate)appliedDate
{
  return self->_appliedDate;
}

- (NSDate)completedDate
{
  return self->_completedDate;
}

- (NSString)completionDescription
{
  return self->_completionDescription;
}

- (BOOL)logTelemetry
{
  return self->_logTelemetry;
}

- (BOOL)reportToDecisionServer
{
  return self->_reportToDecisionServer;
}

- (DRConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_completionDescription, 0);
  objc_storeStrong((id *)&self->_completedDate, 0);
  objc_storeStrong((id *)&self->_appliedDate, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
}

@end
