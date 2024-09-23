@implementation DiagnosticCase

- (DiagnosticCase)initWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 manager:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  DiagnosticCase *v20;
  uint64_t v21;
  NSUUID *caseId;
  uint64_t v23;
  NSMutableDictionary *signature;
  NSMutableArray *v25;
  NSMutableArray *caseReports;
  NSMutableArray *v27;
  NSMutableArray *caseOutlets;
  uint64_t v29;
  DiagnosticCaseStorage *caseStorage;
  DiagnosticCaseStorage *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  NSMutableArray *events;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  NSMutableArray *payloads;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  NSDictionary *actions;
  objc_super v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v54.receiver = self;
  v54.super_class = (Class)DiagnosticCase;
  v20 = -[DiagnosticCase init](&v54, sel_init);
  if (v20)
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = objc_claimAutoreleasedReturnValue();
      caseId = v20->_caseId;
      v20->_caseId = (NSUUID *)v21;

      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v15);
      signature = v20->_signature;
      v20->_signature = (NSMutableDictionary *)v23;

      v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      caseReports = v20->_caseReports;
      v20->_caseReports = v25;

      v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      caseOutlets = v20->_caseOutlets;
      v20->_caseOutlets = v27;

      v20->_caseFlags = a4;
      v20->_allowIPSFileOutput = 1;
      -[DiagnosticCase setManager:](v20, "setManager:", v19);
      objc_msgSend(v19, "caseStorageForCaseID:", v20->_caseId);
      v29 = objc_claimAutoreleasedReturnValue();
      caseStorage = v20->_caseStorage;
      v20->_caseStorage = (DiagnosticCaseStorage *)v29;

      v31 = v20->_caseStorage;
      if (v31)
      {
        -[DiagnosticCaseStorage setCaseObjectVersion:](v31, "setCaseObjectVersion:", CFSTR("1"));
        -[DiagnosticCase _parseSignatureIntoCaseStorage:](v20, "_parseSignatureIntoCaseStorage:", v15);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCaseStorage setTimeStamp:](v20->_caseStorage, "setTimeStamp:", v32);

        -[DiagnosticCaseStorage setCaseClosedTime:](v20->_caseStorage, "setCaseClosedTime:", 0);
        -[DiagnosticCaseStorage setCaseState:](v20->_caseStorage, "setCaseState:", 0);
        +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "buildVariant");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCaseStorage setBuildVariant:](v20->_caseStorage, "setBuildVariant:", v34);

        objc_msgSend(v33, "buildVersion");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCaseStorage setBuildVersion:](v20->_caseStorage, "setBuildVersion:", v35);

        objc_msgSend(v33, "basebandChipset");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCaseStorage setBasebandChipset:](v20->_caseStorage, "setBasebandChipset:", v36);

        objc_msgSend(v33, "basebandFirmwareVersion");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCaseStorage setBasebandFirmwareVersion:](v20->_caseStorage, "setBasebandFirmwareVersion:", v37);

        +[WirelessTechnologyProfile sharedInstance](WirelessTechnologyProfile, "sharedInstance");
        v38 = objc_claimAutoreleasedReturnValue();
        -[NSObject regulatoryDomainCountry](v38, "regulatoryDomainCountry");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCaseStorage setRegulatoryDomainCountry:](v20->_caseStorage, "setRegulatoryDomainCountry:", v39);

        -[NSObject homeCarrier](v38, "homeCarrier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCaseStorage setHomeCarrier:](v20->_caseStorage, "setHomeCarrier:", v40);

        if ((a4 & 4) != 0)
          -[DiagnosticCase addGroupIdentifierToSignature](v20, "addGroupIdentifierToSignature");
        -[DiagnosticCaseStorage setRemoteTrigger:](v20->_caseStorage, "setRemoteTrigger:", (a4 >> 1) & 1);
        *(_WORD *)&v20->eventsDirty = 0;
        v20->attachmentsDirty = 0;
        if (objc_msgSend(v16, "count"))
        {
          diagcaseLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            -[NSUUID UUIDString](v20->_caseId, "UUIDString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v56 = v42;
            v57 = 2112;
            v58 = v16;
            _os_log_impl(&dword_1DBAE1000, v41, OS_LOG_TYPE_DEBUG, "Initializing session: %{public}@ with events:%@", buf, 0x16u);

          }
          v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v16);
          events = v20->_events;
          v20->_events = (NSMutableArray *)v43;

          v20->eventsDirty = 1;
        }
        if (objc_msgSend(v17, "count"))
        {
          diagcaseLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            -[NSUUID UUIDString](v20->_caseId, "UUIDString");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v56 = v46;
            v57 = 2112;
            v58 = v17;
            _os_log_impl(&dword_1DBAE1000, v45, OS_LOG_TYPE_DEBUG, "Initializing session: %{public}@ with payload:%@", buf, 0x16u);

          }
          v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v17, 0);
          payloads = v20->_payloads;
          v20->_payloads = (NSMutableArray *)v47;

          v20->payloadsDirty = 1;
        }
        if (objc_msgSend(v18, "count"))
        {
          diagcaseLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            -[NSUUID UUIDString](v20->_caseId, "UUIDString");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v56 = v50;
            v57 = 2112;
            v58 = v17;
            _os_log_impl(&dword_1DBAE1000, v49, OS_LOG_TYPE_DEBUG, "Initializing session: %{public}@ with actions:%@", buf, 0x16u);

          }
          v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v18);
          actions = v20->_actions;
          v20->_actions = (NSDictionary *)v51;

        }
        goto LABEL_22;
      }
      diagcaseLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v38, OS_LOG_TYPE_ERROR, "failed to retrieve caseStorage", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("DiagnosticCase.m"), 167, CFSTR("DiagnosticCase must be initialized with a signature."));
    }
    v33 = v20;
    v20 = 0;
LABEL_22:

  }
  return v20;
}

- (DiagnosticCase)initWithCaseStorage:(id)a3 manager:(id)a4
{
  id v8;
  id v9;
  void *v10;
  DiagnosticCase *v11;
  DiagnosticCase *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSUUID *caseId;
  NSMutableDictionary *v17;
  NSMutableDictionary *signature;
  NSMutableArray *v19;
  NSMutableArray *caseReports;
  NSMutableArray *v21;
  NSMutableArray *caseOutlets;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  SEL v32;
  DiagnosticCase *v33;
  uint64_t v34;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = CFSTR("initWithCaseStorage requires a caseStorage.");
    v32 = a2;
    v33 = self;
    v34 = 178;
LABEL_12:
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v32, v33, CFSTR("DiagnosticCase.m"), v34, v31);

    v12 = 0;
    goto LABEL_13;
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = CFSTR("initWithCaseStorage requires a manager.");
    v32 = a2;
    v33 = self;
    v34 = 181;
    goto LABEL_12;
  }
  v36.receiver = self;
  v36.super_class = (Class)DiagnosticCase;
  v11 = -[DiagnosticCase init](&v36, sel_init);
  v12 = v11;
  if (v11)
  {
    -[DiagnosticCase setManager:](v11, "setManager:", v10);
    objc_storeStrong((id *)&v12->_caseStorage, a3);
    v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v8, "caseID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithUUIDString:", v14);
    caseId = v12->_caseId;
    v12->_caseId = (NSUUID *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    signature = v12->_signature;
    v12->_signature = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    caseReports = v12->_caseReports;
    v12->_caseReports = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    caseOutlets = v12->_caseOutlets;
    v12->_caseOutlets = v21;

    -[DiagnosticCase _parseCaseStorageIntoSignature:](v12, "_parseCaseStorageIntoSignature:", v12->_signature);
    *(_WORD *)&v12->eventsDirty = 0;
    v12->attachmentsDirty = 0;
    -[DiagnosticCase caseStorage](v12, "caseStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "caseEvents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      -[DiagnosticCase deserializeDiagnosticCaseStorageEvents](v12, "deserializeDiagnosticCaseStorageEvents");
    -[DiagnosticCase caseStorage](v12, "caseStorage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "casePayloads");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      -[DiagnosticCase deserializeDiagnosticCaseStoragePayloads](v12, "deserializeDiagnosticCaseStoragePayloads");
    -[DiagnosticCase caseStorage](v12, "caseStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "caseAttachments");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      -[DiagnosticCase deserializeDiagnosticCaseStorageAttachments](v12, "deserializeDiagnosticCaseStorageAttachments");
  }
LABEL_13:

  return v12;
}

- (DiagnosticCase)initWithCaseId:(id)a3 manager:(id)a4
{
  id v8;
  id v9;
  void *v10;
  DiagnosticCase *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *signature;
  NSMutableArray *v14;
  NSMutableArray *caseReports;
  NSMutableArray *v16;
  NSMutableArray *caseOutlets;
  void *v18;
  DiagnosticCaseStorage *v19;
  DiagnosticCaseStorage *caseStorage;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  const __CFString *v29;
  SEL v30;
  DiagnosticCase *v31;
  uint64_t v32;
  void *v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("initWithCaseId requires a case identifier.");
    v30 = a2;
    v31 = self;
    v32 = 219;
LABEL_13:
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v27, "handleFailureInMethod:object:file:lineNumber:description:", v30, v31, CFSTR("DiagnosticCase.m"), v32, v29);
LABEL_14:

    self = 0;
    goto LABEL_15;
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("initWithCaseId requires a manager.");
    v30 = a2;
    v31 = self;
    v32 = 222;
    goto LABEL_13;
  }
  v35.receiver = self;
  v35.super_class = (Class)DiagnosticCase;
  v11 = -[DiagnosticCase init](&v35, sel_init);
  self = v11;
  if (!v11)
    goto LABEL_15;
  -[DiagnosticCase setManager:](v11, "setManager:", v10);
  objc_storeStrong((id *)&self->_caseId, a3);
  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  signature = self->_signature;
  self->_signature = v12;

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  caseReports = self->_caseReports;
  self->_caseReports = v14;

  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  caseOutlets = self->_caseOutlets;
  self->_caseOutlets = v16;

  -[DiagnosticCase manager](self, "manager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lookUpDiagnosticCaseStorageForUUID:", self->_caseId);
  v19 = (DiagnosticCaseStorage *)objc_claimAutoreleasedReturnValue();
  caseStorage = self->_caseStorage;
  self->_caseStorage = v19;

  if (!self->_caseStorage)
  {
    diagcaseLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[NSUUID UUIDString](self->_caseId, "UUIDString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v34;
      _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_ERROR, "Failed to retrieve caseStorage for case %{public}@", buf, 0xCu);

    }
    goto LABEL_14;
  }
  -[DiagnosticCase _parseCaseStorageIntoSignature:](self, "_parseCaseStorageIntoSignature:", self->_signature);
  *(_WORD *)&self->eventsDirty = 0;
  self->attachmentsDirty = 0;
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "caseEvents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    -[DiagnosticCase deserializeDiagnosticCaseStorageEvents](self, "deserializeDiagnosticCaseStorageEvents");
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "casePayloads");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    -[DiagnosticCase deserializeDiagnosticCaseStoragePayloads](self, "deserializeDiagnosticCaseStoragePayloads");
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "caseAttachments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    -[DiagnosticCase deserializeDiagnosticCaseStorageAttachments](self, "deserializeDiagnosticCaseStorageAttachments");
LABEL_15:

  return self;
}

- (DiagnosticCase)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DiagnosticCase;
  return -[DiagnosticCase init](&v4, sel_init, a3);
}

- (void)dealloc
{
  DiagnosticCaseStorage *caseStorage;
  objc_super v4;

  -[DiagnosticCase setManager:](self, "setManager:", 0);
  caseStorage = self->_caseStorage;
  self->_caseStorage = 0;

  v4.receiver = self;
  v4.super_class = (Class)DiagnosticCase;
  -[DiagnosticCase dealloc](&v4, sel_dealloc);
}

- (id)description
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
  id v14;
  id v15;
  void *v16;
  void *v17;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DiagnosticCase caseId](self, "caseId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("domain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("additional"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase caseStateString:](self, "caseStateString:", objc_msgSend(v7, "caseState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCase _closureTypeString:](DiagnosticCase, "_closureTypeString:", objc_msgSend(v11, "caseClosureType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("Diagnostic case - ID:%@ Domain:%@ Type:%@, SubType:%@, STContext:%@, state:%@ opened time:%@ (closure:%@)"), v17, v3, v4, v5, v6, v8, v10, v12);

  return v15;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[DiagnosticCase _generateCaseSummaryDictionary](self, "_generateCaseSummaryDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:copyItems:", v4, 1);

  return v5;
}

- (NSUUID)caseId
{
  return self->_caseId;
}

- (signed)caseState
{
  void *v2;
  int v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caseState");

  if ((v3 - 1) >= 6)
    return 0;
  else
    return v3;
}

- (void)setCaseState:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "caseState");

  if (v6 != (_DWORD)v3)
  {
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "caseState");

    if (v8 <= (int)v3)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCaseState:", v3);

      -[DiagnosticCase caseStorage](self, "caseStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v14, "caseState");

      switch((int)v13)
      {
        case 1:
          -[DiagnosticCase prepareCase](self, "prepareCase");
          break;
        case 3:
          -[DiagnosticCase finishCase](self, "finishCase");
          break;
        case 4:
          -[DiagnosticCase collectLogs](self, "collectLogs");
          break;
        case 5:
          -[DiagnosticCase noteCaseClosedTime](self, "noteCaseClosedTime");
          -[DiagnosticCase prepareAttachmentsForReporting](self, "prepareAttachmentsForReporting");
          -[DiagnosticCase validateAttachments](self, "validateAttachments");
          -[DiagnosticCase summarizeCaseReport](self, "summarizeCaseReport");
          -[DiagnosticCase recordDiagnosticCaseSummary](self, "recordDiagnosticCaseSummary");
          -[DiagnosticCase sendReports](self, "sendReports");
          break;
        case 6:
          -[DiagnosticCase noteCaseClosedTime](self, "noteCaseClosedTime");
          -[DiagnosticCase manager](self, "manager");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "closeCase:", self);

          break;
        default:
          return;
      }
    }
    else
    {
      diagcaseLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCase caseStateString:](self, "caseStateString:", objc_msgSend(v10, "caseState"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiagnosticCase caseStateString:](self, "caseStateString:", v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Diagnostic case state should not return to a previous state! (current: %@ new: %@)", buf, 0x16u);

      }
    }
  }
}

- (void)noteCaseClosedTime
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caseClosedTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    diagcaseLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "caseClosedTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Already noted caseClosedTime at: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  else
  {
    -[DiagnosticCase noteCaseClosedTime:](self, "noteCaseClosedTime:", 0.0);
  }
}

- (void)noteCaseClosedTime:(double)a3
{
  void *v4;
  id v5;

  if (a3 <= 0.0)
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaseClosedTime:", v5);

}

- (void)noteCaseOpenedTime
{
  -[DiagnosticCase noteCaseOpenedTime:](self, "noteCaseOpenedTime:", 0.0);
}

- (void)noteCaseOpenedTime:(double)a3
{
  void *v4;
  id v5;

  if (a3 <= 0.0)
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeStamp:", v5);

}

- (double)caseOpenedTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeStamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  return v5;
}

- (double)caseClosedTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "caseClosedTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  return v5;
}

- (signed)closureType
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caseClosureType");

  if (v3 >= 6)
  {
    diagcaseLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "Unknown closure type %d", (uint8_t *)v6, 8u);
    }

    LOWORD(v3) = 0;
  }
  return v3;
}

- (void)setClosureType:(signed __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaseClosureType:", v3);

}

- (signed)dampeningType
{
  void *v4;
  int v5;
  void *v7;
  void *v8;
  signed __int16 v9;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "caseDampeningType");

  if ((v5 + 2) < 0xB)
    return v5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DiagnosticCase.m"), 511, CFSTR("Unhandled DiagnosticCaseDampeningType!"));

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "caseDampeningType");

  return v9;
}

- (void)setDampeningType:(signed __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaseDampeningType:", v3);

}

- (id)caseDampeningTypeString
{
  void *v2;
  void *v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCase _caseDampeningTypeString:](DiagnosticCase, "_caseDampeningTypeString:", objc_msgSend(v2, "caseDampeningType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_caseDampeningTypeString:(signed __int16)a3
{
  uint64_t v3;

  v3 = a3 + 2;
  if (v3 > 0xA)
    return CFSTR("Unknown Case Dampening Type");
  else
    return off_1EA3B6EB8[v3];
}

- (signed)dpSubmissionState
{
  void *v4;
  unsigned int v5;
  void *v7;
  void *v8;
  signed __int16 v9;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dpSubmissionState");

  if (v5 < 5)
    return v5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DiagnosticCase.m"), 586, CFSTR("Unhandled DiagnosticCaseDPSubmissionState!"));

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dpSubmissionState");

  return v9;
}

- (void)setDPSubmissionState:(signed __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDpSubmissionState:", v3);

}

- (BOOL)isSnapshot
{
  return self->_caseFlags & 1;
}

- (BOOL)wantsRemote
{
  return (LOBYTE(self->_caseFlags) >> 2) & 1;
}

- (BOOL)isRemoteTrigger
{
  void *v2;
  char v3;

  if ((self->_caseFlags & 2) != 0)
    return 1;
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "remoteTrigger");

  return v3;
}

- (BOOL)writeIPSFile
{
  return -[DiagnosticCase dampeningType](self, "dampeningType") < 1 || self->_allowIPSFileOutput;
}

- (void)allowIPSFileOutput:(BOOL)a3
{
  self->_allowIPSFileOutput = a3;
}

- (NSString)caseDomain
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("domain"));
}

- (NSString)caseType
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("type"));
}

- (NSString)caseSubType
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("subtype"));
}

- (NSString)caseSubTypeContext
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("additional"));
}

- (id)caseProcess
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("detected"));
}

- (NSString)caseDetectedProcess
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("detected"));
}

- (NSString)caseEffectiveProcess
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("effective"));
}

- (NSString)caseGroupId
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_signature, "objectForKeyedSubscript:", CFSTR("groupID"));
}

- (NSString)buildVariant
{
  void *v2;
  void *v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildVariant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)buildVersion
{
  void *v2;
  void *v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)basebandChipset
{
  void *v2;
  void *v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "basebandChipset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)basebandFirmwareVersion
{
  void *v2;
  void *v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "basebandFirmwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)regulatoryDomainCountry
{
  void *v2;
  void *v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regulatoryDomainCountry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)homeCarrier
{
  void *v2;
  void *v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeCarrier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)caseStateString:(signed __int16)a3
{
  if (a3 > 6)
    return CFSTR("UnsupportedState");
  else
    return off_1EA3B6F10[a3];
}

- (signed)caseStateFromString:(id)a3
{
  id v3;
  signed __int16 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Uninitialized")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Preparing")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Logging")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Finalizing")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Collecting")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reporting")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Closed")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)caseClosureTypeString
{
  void *v2;
  void *v3;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCase _closureTypeString:](DiagnosticCase, "_closureTypeString:", objc_msgSend(v2, "caseClosureType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_closureTypeString:(signed __int16)a3
{
  if (a3 < 6)
    return off_1EA3B6F48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Closure State: %d"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_stringRepresentationOfJSONObject:(id)a3 prettyPrint:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1DF0B6314]();
  sanitizedJSONCollectionObject(v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v7))
  {
    diagcaseLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Not a valid JSON object: %@", buf, 0xCu);
    }
    v10 = 0;
    goto LABEL_7;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, v4, &v15);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      diagcaseLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v10;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, "JSON serialization failed with error: %@ (object = %@)", buf, 0x16u);
      }

    }
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
LABEL_8:

  v12 = v11;
  objc_autoreleasePoolPop(v6);

  return v12;
}

+ (id)_arrayObjectRepresentationOfJSONString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = (void *)MEMORY[0x1DF0B6314]();
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      v9 = v8;
      if (v7)
      {
        objc_msgSend(v4, "addObjectsFromArray:", v7);
      }
      else if (v8)
      {
        diagcaseLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v14 = v3;
          v15 = 2112;
          v16 = v9;
          _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "JSON deserialization for string:%@ failed with error: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      diagcaseLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "Encoding jsonString (%@) into NSData failed", buf, 0xCu);
      }
    }

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)addRequiredAction:(id)a3 option:(id)a4 attachmentType:(id)a5 pattern:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *requiredActions;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!self->_requiredActions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    requiredActions = self->_requiredActions;
    self->_requiredActions = v14;

  }
  if (!objc_msgSend(v10, "length") || !objc_msgSend(v12, "length"))
  {
    diagcaseLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_17;
    }
    v22 = 138543874;
    v23 = v10;
    v24 = 2114;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v18 = "Invalid parameters adding required action %{public}@ with attachment type %{public}@ and pattern %@";
    v19 = v17;
    v20 = 32;
LABEL_11:
    _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v22, v20);
    goto LABEL_12;
  }
  diagcaseLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v22 = 138543618;
    v23 = v10;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_INFO, "This case is requesting action '%{public}@' of type '%{public}@'", (uint8_t *)&v22, 0x16u);
  }

  if (v11)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requiredActions, "setObject:forKeyedSubscript:", v11, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requiredActions, "setObject:forKeyedSubscript:", v21, v10);

  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("diagext")) & 1) == 0)
  {
    if (objc_msgSend(v13, "length"))
    {
      -[DiagnosticCase addRequiredAttachmentType:pattern:](self, "addRequiredAttachmentType:pattern:", v12, v13);
      goto LABEL_17;
    }
    diagcaseLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    LOWORD(v22) = 0;
    v18 = "Any required action that's not DiagnoticExtensions should provide a valid filename pattern to match against";
    v19 = v17;
    v20 = 2;
    goto LABEL_11;
  }
LABEL_17:

}

- (void)addRequiredAttachmentType:(id)a3 pattern:(id)a4
{
  NSObject *v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *requiredAttachments;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  NSObject *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_requiredAttachments)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    requiredAttachments = self->_requiredAttachments;
    self->_requiredAttachments = v8;

  }
  if (-[NSObject length](v6, "length") && objc_msgSend(v7, "length"))
  {
    diagcaseLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "This case requires attachment type '%{public}@' - matching with filename pattern '%@'", buf, 0x16u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_requiredAttachments, "objectForKeyedSubscript:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v11, v7, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requiredAttachments, "setObject:forKeyedSubscript:", v12, v6);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSObject addObject:](v11, "addObject:", v7);
      }
      else if (v11)
      {
        diagcaseLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v17 = v11;
          v18 = 2112;
          v19 = v15;
          v20 = 2114;
          v21 = v6;
          _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) when adding required attachments for type '%{public}@'", buf, 0x20u);

        }
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requiredAttachments, "setObject:forKeyedSubscript:", v7, v6);
      }
    }
  }
  else
  {
    diagcaseLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "Invalid parameters for adding required attachment type %{public}@ and pattern %@.", buf, 0x16u);
    }
  }

}

- (void)removeRequiredAttachmentType:(id)a3 pattern:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[NSMutableDictionary count](self->_requiredAttachments, "count")
    && -[NSObject length](v6, "length")
    && -[NSObject length](v7, "length"))
  {
    diagcaseLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v16 = 138543618;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "Removing case requirement for attachment type '%{public}@' - matching with filename pattern '%@'", (uint8_t *)&v16, 0x16u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_requiredAttachments, "objectForKeyedSubscript:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      if (-[NSObject isEqualToString:](v10, "isEqualToString:", v7))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requiredAttachments, "setObject:forKeyedSubscript:", 0, v6);
        goto LABEL_19;
      }
      diagcaseLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_18:

        goto LABEL_19;
      }
      v16 = 138412802;
      v17 = v10;
      v18 = 2114;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      v13 = "Did not remove existing pattern %@ for type %{public}@ because the requested removal pattern did not match: %@";
      v14 = v12;
      v15 = OS_LOG_TYPE_INFO;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = v9;
        -[NSObject count](v10, "count");
        -[NSObject removeObject:](v10, "removeObject:", v7);
        goto LABEL_19;
      }
      if (!v9)
      {
LABEL_20:

        goto LABEL_21;
      }
      diagcaseLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v9;
      v18 = 2112;
      v19 = v12;
      v20 = 2114;
      v21 = v6;
      v13 = "Found unexpected object %@ (class %@) when adding required attachments for type '%{public}@'";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1DBAE1000, v14, v15, v13, (uint8_t *)&v16, 0x20u);
    goto LABEL_18;
  }
LABEL_21:

}

- (void)addEvent:(id)a3
{
  -[DiagnosticCase addEvent:forced:](self, "addEvent:forced:", a3, 0);
}

- (void)addEvent:(id)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *events;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_events)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    events = self->_events;
    self->_events = v7;

  }
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "caseState") != 2)
  {

    if (!v4)
      goto LABEL_10;
LABEL_7:
    if (objc_msgSend(v6, "count"))
    {
      -[NSMutableArray addObject:](self->_events, "addObject:", v6);
      self->eventsDirty = 1;
    }
    goto LABEL_16;
  }
  -[DiagnosticCase caseId](self, "caseId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_7;
  }

  if (v4)
    goto LABEL_7;
LABEL_10:
  -[DiagnosticCase caseId](self, "caseId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  diagcaseLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DiagnosticCase caseStateString:](self, "caseStateString:", objc_msgSend(v14, "caseState"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "caseState is %@, expecting DiagnosticCaseStateLogging", (uint8_t *)&v16, 0xCu);

    }
  }
  else if (v13)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "No case ID", (uint8_t *)&v16, 2u);
  }

LABEL_16:
}

- (void)addEvents:(id)a3
{
  -[DiagnosticCase addEvents:forced:](self, "addEvents:forced:", a3, 0);
}

- (void)addEvents:(id)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *events;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_events)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    events = self->_events;
    self->_events = v7;

  }
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "caseState") != 2)
  {

    if (!v4)
      goto LABEL_10;
LABEL_7:
    if (objc_msgSend(v6, "count"))
    {
      -[NSMutableArray addObjectsFromArray:](self->_events, "addObjectsFromArray:", v6);
      self->eventsDirty = 1;
    }
    goto LABEL_16;
  }
  -[DiagnosticCase caseId](self, "caseId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_7;
  }

  if (v4)
    goto LABEL_7;
LABEL_10:
  -[DiagnosticCase caseId](self, "caseId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  diagcaseLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DiagnosticCase caseStateString:](self, "caseStateString:", objc_msgSend(v14, "caseState"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "caseState is %@, expecting DiagnosticCaseStateLogging", (uint8_t *)&v16, 0xCu);

    }
  }
  else if (v13)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "No case ID", (uint8_t *)&v16, 2u);
  }

LABEL_16:
}

- (id)stringRepresentationOfEvents
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (-[NSMutableArray count](self->_events, "count"))
  {
    +[DiagnosticCase _stringRepresentationOfJSONObject:prettyPrint:](DiagnosticCase, "_stringRepresentationOfJSONObject:prettyPrint:", self->_events, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    diagcaseLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "No events to represent", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

- (id)eventsFromStringRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "caseEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    +[DiagnosticCase _arrayObjectRepresentationOfJSONString:](DiagnosticCase, "_arrayObjectRepresentationOfJSONString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    diagcaseLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "No events (empty events string)", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (void)serializeEventsToDiagnosticCaseStorage
{
  void *v3;
  void *v4;

  if (self->eventsDirty)
  {
    -[DiagnosticCase stringRepresentationOfEvents](self, "stringRepresentationOfEvents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCaseEvents:", v3);

    self->eventsDirty = 0;
  }
}

- (void)deserializeDiagnosticCaseStorageEvents
{
  NSMutableArray *v3;
  NSMutableArray *events;

  -[DiagnosticCase eventsFromStringRepresentation](self, "eventsFromStringRepresentation");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  events = self->_events;
  self->_events = v3;

  self->eventsDirty = 0;
}

- (void)addPayload:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *payloads;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_payloads)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    payloads = self->_payloads;
    self->_payloads = v5;

  }
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "caseState") == 2)
  {
    -[DiagnosticCase caseId](self, "caseId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (objc_msgSend(v4, "count"))
      {
        -[NSMutableArray addObject:](self->_payloads, "addObject:", v4);
        self->payloadsDirty = 1;
      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  diagcaseLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase caseStateString:](self, "caseStateString:", objc_msgSend(v10, "caseState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase caseId](self, "caseId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "Not in logging state (%@) or no caseId (%{public}@)", (uint8_t *)&v13, 0x16u);

  }
LABEL_11:

}

- (id)stringRepresentationOfPayloads
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSMutableArray *payloads;
  void *v7;
  int v9;
  NSMutableArray *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_payloads, "count");
  diagcaseLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      payloads = self->_payloads;
      v9 = 138412290;
      v10 = payloads;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "_payloads is %@", (uint8_t *)&v9, 0xCu);
    }

    +[DiagnosticCase _stringRepresentationOfJSONObject:prettyPrint:](DiagnosticCase, "_stringRepresentationOfJSONObject:prettyPrint:", self->_payloads, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "No payloads to represent", (uint8_t *)&v9, 2u);
    }

    v7 = 0;
  }
  return v7;
}

- (id)payloadsFromStringRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "casePayloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    +[DiagnosticCase _arrayObjectRepresentationOfJSONString:](DiagnosticCase, "_arrayObjectRepresentationOfJSONString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    diagcaseLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "No events (empty payloads string)", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (void)serializePayloadsToDiagnosticCaseStorage
{
  void *v3;
  void *v4;

  if (self->payloadsDirty)
  {
    -[DiagnosticCase stringRepresentationOfPayloads](self, "stringRepresentationOfPayloads");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCasePayloads:", v3);

    self->payloadsDirty = 0;
  }
}

- (void)deserializeDiagnosticCaseStoragePayloads
{
  NSMutableArray *v3;
  NSMutableArray *payloads;

  -[DiagnosticCase payloadsFromStringRepresentation](self, "payloadsFromStringRepresentation");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  payloads = self->_payloads;
  self->_payloads = v3;

  self->payloadsDirty = 0;
}

+ (id)stringRepresentationOfAttachments:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  diagcaseLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "attachments is %@", (uint8_t *)&v9, 0xCu);
    }

    +[DiagnosticCase _stringRepresentationOfJSONObject:prettyPrint:](DiagnosticCase, "_stringRepresentationOfJSONObject:prettyPrint:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "No attachment to represent", (uint8_t *)&v9, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)attachmentsFromStringRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "length"))
  {
    v6 = (void *)MEMORY[0x1DF0B6314]();
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      v10 = v9;
      if (v8)
      {
        objc_msgSend(v5, "addObjectsFromArray:", v8);
      }
      else if (v9)
      {
        diagcaseLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v16 = a1;
          v17 = 2112;
          v18 = v10;
          _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "attachment deserialization for case:%@ failed with error: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      diagcaseLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "attachmentsString encoding failed", buf, 2u);
      }
    }

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    diagcaseLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "No attachments to represent", buf, 2u);
    }

  }
  return v5;
}

- (void)_addToAttachments:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *attachments;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (!self->_attachments)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    attachments = self->_attachments;
    self->_attachments = v5;

    v4 = v12;
  }
  v7 = objc_msgSend(v4, "length");
  v8 = v12;
  if (v7)
  {
    if (objc_msgSend(v12, "hasPrefix:", CFSTR("file://")))
    {
      v9 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[NSMutableArray addObject:](self->_attachments, "addObject:", v9);
    v11 = -[DiagnosticCase addSizeInfoForAttachment:](self, "addSizeInfoForAttachment:", v9);

    v8 = v12;
  }
  self->attachmentsDirty = 1;

}

- (void)serializeAttachmentsToDiagnosticCaseStorage
{
  void *v3;
  void *v4;
  void *v5;

  if (self->attachmentsDirty)
  {
    -[DiagnosticCase attachments](self, "attachments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCase stringRepresentationOfAttachments:](DiagnosticCase, "stringRepresentationOfAttachments:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCaseAttachments:", v4);

    -[DiagnosticCase markAttachmentsAsPurgeable:urgency:](self, "markAttachmentsAsPurgeable:urgency:", 1, 1024);
    self->attachmentsDirty = 0;
  }
}

- (void)deserializeDiagnosticCaseStorageAttachments
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *attachments;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caseAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCase attachmentsFromStringRepresentation:](DiagnosticCase, "attachmentsFromStringRepresentation:", v4);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  attachments = self->_attachments;
  self->_attachments = v5;

  self->attachmentsDirty = 0;
}

- (id)stringRepresentationOfSignature
{
  return +[DiagnosticCase _stringRepresentationOfJSONObject:prettyPrint:](DiagnosticCase, "_stringRepresentationOfJSONObject:prettyPrint:", self->_signature, 0);
}

- (BOOL)matchSignature:(id)a3
{
  return -[NSMutableDictionary isEqualToDictionary:](self->_signature, "isEqualToDictionary:", a3);
}

- (void)addGroupIdentifierToSignature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSUUID UUIDString](self->_caseId, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  diagcaseLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "Adding group identifier to case: %{public}@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "length"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_signature, "setObject:forKeyedSubscript:", v6, CFSTR("groupID"));
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCaseGroupID:", v6);

  }
}

- (void)prepareCase
{
  -[DiagnosticCase setCaseState:](self, "setCaseState:", 2);
}

- (void)finishCase
{
  if (-[DiagnosticCase closureType](self, "closureType") != 4)
    -[DiagnosticCase setCaseState:](self, "setCaseState:", 4);
}

- (void)collectLogs
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  unint64_t expectedDiagnosticActions;
  unint64_t completedDiagnosticActions;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  NSObject *v26;
  int v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseState");

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "caseDampeningType");

  if (*(_OWORD *)&self->completedDiagnosticActions != 0)
  {
    diagcaseLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      completedDiagnosticActions = self->completedDiagnosticActions;
      expectedDiagnosticActions = self->expectedDiagnosticActions;
      v27 = 134218240;
      v28 = expectedDiagnosticActions;
      v29 = 2048;
      v30 = completedDiagnosticActions;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Did collectLogs get called more than once? Observing non-zero values for expected actions (%lu) and completed actions (%lu).", (uint8_t *)&v27, 0x16u);
    }

  }
  self->completedDiagnosticActions = 0;
  self->expectedDiagnosticActions = 0;
  -[DiagnosticCase manager](self, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "autoBugCaptureRegularPayloads");

  if (v12 && v4 == 4 && v6 <= 0)
  {
    diagcaseLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[DiagnosticCase caseId](self, "caseId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = (unint64_t)v14;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "Starting collectLogs for case ID: %{public}@", (uint8_t *)&v27, 0xCu);

    }
    -[DiagnosticCase _updatePayloadDictionaryArray:](self, "_updatePayloadDictionaryArray:", 1);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requiredActions, "objectForKeyedSubscript:", CFSTR("diagext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_requiredActions, "objectForKeyedSubscript:", CFSTR("diagext"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_requiredActions, "objectForKeyedSubscript:", CFSTR("diagext"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        diagcaseLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v27 = 138412290;
          v28 = (unint64_t)v18;
          _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEBUG, "Found diagnostic extension options: %@", (uint8_t *)&v27, 0xCu);
        }

      }
      else
      {
        v18 = 0;
      }
      -[DiagnosticCase startCollectingDiagnosticExtensions:](self, "startCollectingDiagnosticExtensions:", v18);

    }
    else
    {
      diagcaseLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEFAULT, "DiagnosticExtensions action was requested to be disabled", (uint8_t *)&v27, 2u);
      }

      -[DiagnosticCase startCollectingAllReports](self, "startCollectingAllReports");
    }
  }
  else
  {
    -[DiagnosticCase _updatePayloadDictionaryArray:](self, "_updatePayloadDictionaryArray:", 0);
    +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    diagcaseLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      if (objc_msgSend(v20, "internalBuild"))
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      if (objc_msgSend(v20, "carrierSeedBuild"))
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v27 = 138413058;
      v28 = (unint64_t)v22;
      if (v4 == 4)
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      v29 = 2112;
      if (v6 >= 1)
        v25 = CFSTR("NO");
      else
        v25 = CFSTR("YES");
      v30 = (unint64_t)v23;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_INFO, "Not collecting logs : internalBuild %@, carrierSeedBuild %@, State collecting %@, accepted case %@", (uint8_t *)&v27, 0x2Au);
    }

    -[DiagnosticCase setCaseState:](self, "setCaseState:", 5);
  }
}

- (void)startCollectingDiagnosticExtensions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase deParametersFromPayloads](self, "deParametersFromPayloads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[DiagnosticCase manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__DiagnosticCase_startCollectingDiagnosticExtensions___block_invoke;
  v11[3] = &unk_1EA3B6E20;
  v11[4] = self;
  objc_copyWeak(&v13, &location);
  v8 = v5;
  v12 = v8;
  v9 = objc_msgSend(v7, "collectDiagnosticExtensionLogsWithParameters:options:diagCase:reply:", v6, v4, self, v11);

  ++self->expectedDiagnosticActions;
  diagcaseLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v9;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "Started collection from %ld diagnostic extensions", buf, 0xCu);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __54__DiagnosticCase_startCollectingDiagnosticExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  diagcaseLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEFAULT, "Ready to attach %ld results from DiagnosticExtensions", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__DiagnosticCase_startCollectingDiagnosticExtensions___block_invoke_112;
  v10[3] = &unk_1EA3B6DF8;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v10);
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  diagcaseLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v6 + 16);
    v7 = *(_QWORD *)(v6 + 24);
    *(_DWORD *)buf = 134218240;
    v14 = v8;
    v15 = 2048;
    v16 = v7;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Finished running diagnostic extensions. (%lu of %lu completed)", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "startCollectingAllReports");

  objc_destroyWeak(&v12);
}

void __54__DiagnosticCase_startCollectingDiagnosticExtensions___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id WeakRetained;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[6];
  _QWORD v49[6];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "removeRequiredAttachmentType:pattern:", CFSTR("diagext"), v7);
      }
      else
      {
        diagcaseLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v51 = (uint64_t)v6;
          v52 = 2112;
          v53 = (uint64_t)v14;
          _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ as diag extension attachments", buf, 0x16u);

        }
      }
      v8 = 0;
    }
    v42 = v6;
    diagcaseLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218242;
      v51 = v16;
      v52 = 2112;
      v53 = (uint64_t)v7;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "Processing %ld attachments from %@", buf, 0x16u);
    }
    v41 = v7;
    v43 = v5;

    v40 = a1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (!v19)
    {
      v21 = 0;
      goto LABEL_31;
    }
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v45;
    while (1)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v24, "absoluteString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_addToAttachments:", v25);

LABEL_23:
          ++v21;
          continue;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(WeakRetained, "_addToAttachments:", v24);
          goto LABEL_23;
        }
        diagcaseLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v51 = (uint64_t)v28;
          v52 = 2112;
          v53 = (uint64_t)v24;
          _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_ERROR, "Found attachment of unexpected class (%@) {%@}", buf, 0x16u);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      if (!v20)
      {
LABEL_31:

        diagcaseLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v40;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          if (v18)
            v31 = "success";
          else
            v31 = "failed";
          v32 = objc_msgSend(v18, "count", v40);
          v33 = *(_QWORD *)(v30 + 40);
          *(_DWORD *)buf = 136315906;
          v51 = (uint64_t)v31;
          v52 = 2048;
          v53 = v32;
          v54 = 2048;
          v55 = v21;
          v56 = 2112;
          v57 = v33;
          _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_INFO, "Processing diagnostic extension result into events (result:%s, total count:%ld, attached count:%ld, timestamp:%@)", buf, 0x2Au);
        }

        v48[0] = CFSTR("type");
        v48[1] = CFSTR("name");
        v9 = v41;
        v49[0] = CFSTR("DiagnosticExtension");
        v49[1] = v41;
        v34 = MEMORY[0x1E0C9AAB0];
        if (!v18)
          v34 = MEMORY[0x1E0C9AAA0];
        v49[2] = v34;
        v48[2] = CFSTR("result");
        v48[3] = CFSTR("value");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21, v40);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v49[3] = v35;
        v48[4] = CFSTR("count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v49[4] = v36;
        v48[5] = CFSTR("timestamp");
        v37 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v30 + 40), "timeIntervalSince1970");
        objc_msgSend(v37, "numberWithDouble:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v49[5] = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 6);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "addEvent:forced:", v39, 1);
        v6 = v42;
        v5 = v43;
        goto LABEL_39;
      }
    }
  }
  diagcaseLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v51 = (uint64_t)v5;
    v52 = 2112;
    v53 = (uint64_t)v11;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ as diag extension identifier. (Expecting NSString)", buf, 0x16u);

  }
LABEL_39:

}

- (id)deParametersFromPayloads
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[DiagnosticCase payloads](self, "payloads");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (!v3)
  {
    v20 = 0;
    goto LABEL_27;
  }
  v4 = v3;
  v20 = 0;
  v5 = *(_QWORD *)v22;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v22 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("deparams"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        diagcaseLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = (uint64_t)v9;
          _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Potential DE parameter dictionary: %@", buf, 0xCu);
        }

        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v20)
            {
              objc_msgSend(v20, "addEntriesFromDictionary:", v9);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v9);
              v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_20;
          }
          diagcaseLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v26 = (uint64_t)v9;
            v27 = 2112;
            v28 = v15;
            _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Found object %@ of class %@ as diag extension parameters. (Expecting NSDictionary)", buf, 0x16u);

          }
        }
        else
        {
          diagcaseLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "No diag extension parameters in this payload dictionary.", buf, 2u);
          }
        }

LABEL_20:
        goto LABEL_21;
      }
      diagcaseLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = (uint64_t)v7;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "Found object %@ of class %@ in payloads array. (Expecting NSDictionary)", buf, 0x16u);

      }
LABEL_21:

      ++v6;
    }
    while (v4 != v6);
    v16 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    v4 = v16;
  }
  while (v16);
LABEL_27:

  if (objc_msgSend(v20, "count"))
  {
    diagcaseLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134218242;
      v26 = v18;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_INFO, "Found %lu DE parameters: %@", buf, 0x16u);
    }

  }
  return v20;
}

- (void)startCollectingAllReports
{
  NSMutableDictionary *requiredActions;
  uint64_t *v4;
  NSObject *v5;
  DiagnosticCase *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  DiagnosticCase *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  DiagnosticCase *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  requiredActions = self->_requiredActions;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__DiagnosticCase_startCollectingAllReports__block_invoke;
  v10[3] = &unk_1EA3B6E48;
  v10[4] = self;
  v10[5] = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requiredActions, "enumerateKeysAndObjectsUsingBlock:", v10);
  v4 = v12;
  self->expectedDiagnosticActions += v12[3];
  if (v4[3])
  {
    diagcaseLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (DiagnosticCase *)v12[3];
      v7 = "s";
      if (!v6)
        v7 = "";
      *(_DWORD *)buf = 134218498;
      v16 = v6;
      v17 = 2080;
      v18 = v7;
      v19 = 2112;
      v20 = self;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Collecting %lu report%s for case: %@", buf, 0x20u);
    }

    -[DiagnosticCase manager](self, "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startCollectingNextReportForDiagnosticCase:", self);

  }
  else
  {
    diagcaseLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "There are no reports to collect for %@", buf, 0xCu);
    }

    -[DiagnosticCase finishedCollectingLogs](self, "finishedCollectingLogs");
  }
  _Block_object_dispose(&v11, 8);
}

void __43__DiagnosticCase_startCollectingAllReports__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  casemanagementLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "Ready to collect report name: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v5;
    v11 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v5;
    v11 = 0;
LABEL_7:
    v12 = objc_msgSend(v8, "requestReportGenerator:options:", v10, v11);

    if (v12)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    goto LABEL_12;
  }
  casemanagementLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ in report dictionary", (uint8_t *)&v16, 0x16u);

  }
LABEL_12:

}

- (void)reportGeneratorEnded:(id)a3 reportInfo:(id)a4 error:(id)a5 isFinalReportGenerator:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  unint64_t completedDiagnosticActions;
  unint64_t expectedDiagnosticActions;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v6 = a6;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  ++self->completedDiagnosticActions;
  diagcaseLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    completedDiagnosticActions = self->completedDiagnosticActions;
    expectedDiagnosticActions = self->expectedDiagnosticActions;
    v19 = 134218240;
    v20 = completedDiagnosticActions;
    v21 = 2048;
    v22 = expectedDiagnosticActions;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "Finished collecting a diagnostic report. (%lu of %lu completed)", (uint8_t *)&v19, 0x16u);
  }

  if (v11)
  {
    diagcaseLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = (unint64_t)v11;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_INFO, "Adding case report:%@", (uint8_t *)&v19, 0xCu);
    }

    -[DiagnosticCase caseReports](self, "caseReports");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v11);

  }
  if (v12)
  {
    diagcaseLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412546;
      v20 = (unint64_t)v12;
      v21 = 2112;
      v22 = (unint64_t)v10;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_ERROR, "Error %@ from %@", (uint8_t *)&v19, 0x16u);
    }

  }
  if (v6)
    -[DiagnosticCase finishedCollectingLogs](self, "finishedCollectingLogs");

}

- (id)_updatedPayloadPathForOriginalPath:(id)a3 sandboxExtensionToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  char *v23;
  NSObject *v24;
  void *v25;
  int *v26;
  char *v27;
  const char *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  NSObject *v34;
  void *v35;
  int *v36;
  char *v37;
  const char *v38;
  void *v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    if (sandbox_extension_consume() == -1)
    {
      diagcaseLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[DiagnosticCase caseId](self, "caseId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = __error();
        v27 = strerror(*v26);
        v28 = "Unknown";
        *(_DWORD *)buf = 138543874;
        v44 = v25;
        if (v27)
          v28 = v27;
        v45 = 2112;
        v46 = v6;
        v47 = 2080;
        v48 = v28;
        _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_ERROR, "Case: %{public}@: Failed to consume extension token for '%@' due to error: %s", buf, 0x20u);

      }
      v23 = 0;
    }
    else
    {
      v9 = v6;
      objc_msgSend(v9, "lastPathComponent");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[DiagnosticCase caseId](self, "caseId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)v10;
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Case%@_%@"), v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configurationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logArchivePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathComponent:", v13);
      v17 = (char *)objc_claimAutoreleasedReturnValue();

      diagcaseLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        -[DiagnosticCase caseId](self, "caseId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v19;
        v45 = 2112;
        v46 = v9;
        v47 = 2112;
        v48 = v17;
        _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_INFO, "Case: %{public}@: Attempting to copy %@ to %@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v21 = objc_msgSend(v20, "copyItemAtPath:toPath:error:", v9, v17, &v42);
      v22 = v42;

      if ((v21 & 1) != 0)
      {
        v23 = v17;
      }
      else
      {
        diagcaseLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          -[DiagnosticCase caseId](self, "caseId");
          v40 = v13;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedDescription");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          *(_DWORD *)buf = 138544130;
          v33 = CFSTR("Unknown");
          v44 = v30;
          if (v31)
            v33 = (const __CFString *)v31;
          v45 = 2112;
          v46 = v9;
          v47 = 2112;
          v48 = v17;
          v49 = 2112;
          v50 = v33;
          _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_ERROR, "Case: %{public}@: Failed to copy %@ to %@ due to error: %@", buf, 0x2Au);

          v13 = v40;
        }

        v23 = 0;
      }

      if (sandbox_extension_release() == -1)
      {
        diagcaseLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          -[DiagnosticCase caseId](self, "caseId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = __error();
          v37 = strerror(*v36);
          v38 = "Unknown";
          *(_DWORD *)buf = 138543874;
          v44 = v35;
          if (v37)
            v38 = v37;
          v45 = 2112;
          v46 = v9;
          v47 = 2080;
          v48 = v38;
          _os_log_impl(&dword_1DBAE1000, v34, OS_LOG_TYPE_ERROR, "Case: %{public}@: Failed to release sandbox extension handle for %@ due to error: %s", buf, 0x20u);

        }
      }
    }
  }
  else
  {
    v23 = (char *)v6;
  }

  return v23;
}

- (void)_updatePayloadDictionaryArray:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  DiagnosticCase *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *payloads;
  NSObject *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  void *v44;
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
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v3 = a3;
  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[DiagnosticCase payloads](self, "payloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v52;
    v9 = CFSTR("path");
    v39 = v3;
    v41 = v5;
    v38 = *(_QWORD *)v52;
    v37 = CFSTR("path");
    do
    {
      v10 = 0;
      v40 = v7;
      do
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v10);
        if (v3)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v10), "objectForKeyedSubscript:", v9);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            v43 = v10;
            diagcaseLogHandle();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              -[DiagnosticCase caseId](self, "caseId");
              v13 = v5;
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v57 = v14;
              v58 = 2112;
              v59 = v44;
              _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_INFO, "Case: %{public}@: Moving files from payload path array into working dir: %@", buf, 0x16u);

              v5 = v13;
            }

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sandbox_ext_token_dict"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = objc_msgSend(v11, "mutableCopy");
              -[NSObject removeObjectForKey:](v16, "removeObjectForKey:", CFSTR("sandbox_ext_token_dict"));
              v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v47 = 0u;
              v48 = 0u;
              v49 = 0u;
              v50 = 0u;
              v18 = v44;
              v46 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              if (v46)
              {
                v19 = *(_QWORD *)v48;
                v45 = *(_QWORD *)v48;
                do
                {
                  for (i = 0; i != v46; ++i)
                  {
                    if (*(_QWORD *)v48 != v19)
                      objc_enumerationMutation(v18);
                    v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                    objc_msgSend(v15, "objectForKeyedSubscript:", v21, v37);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DiagnosticCase _updatedPayloadPathForOriginalPath:sandboxExtensionToken:](self, "_updatedPayloadPathForOriginalPath:sandboxExtensionToken:", v21, v22);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v23, "length"))
                    {
                      objc_msgSend(v17, "addObject:", v23);
                    }
                    else
                    {
                      diagcaseLogHandle();
                      v24 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                      {
                        -[DiagnosticCase caseId](self, "caseId");
                        v25 = v18;
                        v26 = v15;
                        v27 = v17;
                        v28 = v16;
                        v29 = self;
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        v57 = v30;
                        v58 = 2112;
                        v59 = v21;
                        _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_DEFAULT, "Case: %{public}@: Failed to copy %@ due to sandbox or file error. Dropping payload.", buf, 0x16u);

                        self = v29;
                        v16 = v28;
                        v17 = v27;
                        v15 = v26;
                        v18 = v25;
                        v19 = v45;
                      }

                    }
                  }
                  v46 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
                }
                while (v46);
              }

              v9 = v37;
              -[NSObject setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, v37);
              -[NSMutableArray addObject:](v42, "addObject:", v16);

              v3 = v39;
              v7 = v40;
              v5 = v41;
              v8 = v38;
            }
            else
            {
              diagcaseLogHandle();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                -[DiagnosticCase caseId](self, "caseId");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v57 = v32;
                v58 = 2112;
                v59 = v11;
                _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_ERROR, "Case: %{public}@: No sandbox extension token dictionary found. Dropping payload %@", buf, 0x16u);

                v5 = v41;
              }
            }
            v31 = v44;

            v10 = v43;
          }
          else
          {
            -[NSMutableArray addObject:](v42, "addObject:", v11);
            v31 = 0;
          }
        }
        else
        {
          v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v10), "mutableCopy");
          objc_msgSend(v31, "removeObjectForKey:", CFSTR("sandbox_ext_token_dict"));
          objc_msgSend(v31, "removeObjectForKey:", v9);
        }

        ++v10;
      }
      while (v10 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v7);
  }

  payloads = self->_payloads;
  self->_payloads = v42;

  diagcaseLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    -[DiagnosticCase caseId](self, "caseId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase payloads](self, "payloads");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v35;
    v58 = 2112;
    v59 = v36;
    _os_log_impl(&dword_1DBAE1000, v34, OS_LOG_TYPE_DEBUG, "Case: %{public}@: Updated payloads array: %@", buf, 0x16u);

  }
}

- (void)finishedCollectingLogs
{
  NSObject *v3;
  void *v4;
  unint64_t completedDiagnosticActions;
  unint64_t expectedDiagnosticActions;
  NSObject *v7;
  _BOOL4 v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  diagcaseLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[DiagnosticCase caseId](self, "caseId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = (unint64_t)v4;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEBUG, "Finished collecting all diagnostic reports for case %@.", (uint8_t *)&v11, 0xCu);

  }
  completedDiagnosticActions = self->completedDiagnosticActions;
  expectedDiagnosticActions = self->expectedDiagnosticActions;
  diagcaseLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (completedDiagnosticActions >= expectedDiagnosticActions)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "Finished collecting all diagnostic reports.", (uint8_t *)&v11, 2u);
    }

    -[DiagnosticCase setCaseState:](self, "setCaseState:", 5);
  }
  else
  {
    if (v8)
    {
      v9 = self->completedDiagnosticActions;
      v10 = self->expectedDiagnosticActions;
      v11 = 134218240;
      v12 = v9;
      v13 = 2048;
      v14 = v10;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "Waiting for collection of diagnostic reports (finished %lu of %lu)", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (void)prepareAttachmentsForReporting
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  NSObject *v43;
  _BOOL4 v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  id obja;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  _QWORD v79[4];
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  uint64_t v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseState");

  if (v4 == 5)
  {
    -[DiagnosticCase payloads](self, "payloads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      diagcaseLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[DiagnosticCase payloads](self, "payloads");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v81 = (uint64_t)v8;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "Extracting payloads %@ to attachments.", buf, 0xCu);

      }
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      -[DiagnosticCase payloads](self, "payloads");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
      if (v9)
      {
        v10 = v9;
        v60 = *(_QWORD *)v75;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v75 != v60)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("path"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = v12;
              v70 = 0u;
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v92, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v71;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v71 != v16)
                      objc_enumerationMutation(v13);
                    v18 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                    if (objc_msgSend(v18, "length"))
                      -[DiagnosticCase _addToAttachments:](self, "_addToAttachments:", v18);
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v92, 16);
                }
                while (v15);
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_25;
              v19 = v12;
              if (objc_msgSend(v19, "length"))
                -[DiagnosticCase _addToAttachments:](self, "_addToAttachments:", v19);
            }

LABEL_25:
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
        }
        while (v10);
      }

    }
    -[DiagnosticCase caseReports](self, "caseReports");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      diagcaseLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        -[DiagnosticCase caseReports](self, "caseReports");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 134217984;
        v81 = v24;
        _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEBUG, "Extracting %ld reports to attachments.", buf, 0xCu);

      }
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      -[DiagnosticCase caseReports](self, "caseReports");
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v66, v91, 16);
      if (v57)
      {
        v56 = *(_QWORD *)v67;
        do
        {
          for (k = 0; k != v57; ++k)
          {
            if (*(_QWORD *)v67 != v56)
              objc_enumerationMutation(v54);
            v26 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
            diagcaseLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v81 = (uint64_t)v26;
              _os_log_impl(&dword_1DBAE1000, v27, OS_LOG_TYPE_INFO, "Report: %@", buf, 0xCu);
            }

            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("attachments"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v90, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v63;
              do
              {
                for (m = 0; m != v30; ++m)
                {
                  if (*(_QWORD *)v63 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * m);
                  if (objc_msgSend(v33, "length"))
                    -[DiagnosticCase _addToAttachments:](self, "_addToAttachments:", v33);
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v90, 16);
              }
              while (v30);
            }
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("reportCreator"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("reportStart"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("reportEnd"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("reportEndStatus"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v61, "isEqualToString:", CFSTR("Error")))
            {
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Error"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = v37;
                goto LABEL_53;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v37, "description");
                v38 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
                obja = v38;
              }
              else
              {
                diagcaseLogHandle();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  v41 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v81 = (uint64_t)v42;
                  v82 = 2112;
                  v83 = v37;
                  _os_log_impl(&dword_1DBAE1000, v40, OS_LOG_TYPE_INFO, "Found unexpected class %@ as error payload: %@", buf, 0x16u);

                }
                obja = 0;
              }
              v39 = v61;

              goto LABEL_58;
            }
            obja = 0;
            v39 = v61;
LABEL_58:
            diagcaseLogHandle();
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);
            if (v34 && v35 && v36 && v39)
            {
              if (v44)
              {
                v45 = objc_msgSend(v28, "count");
                *(_DWORD *)buf = 138413314;
                v81 = (uint64_t)v34;
                v82 = 2112;
                v83 = v35;
                v84 = 2112;
                v85 = v36;
                v86 = 2112;
                v87 = v39;
                v88 = 2048;
                v89 = v45;
                _os_log_impl(&dword_1DBAE1000, v43, OS_LOG_TYPE_DEBUG, "Processing report result from %@ into events (start:%@, end:%@, result:%@, %ld attachments)", buf, 0x34u);
              }

              v78[0] = CFSTR("type");
              v78[1] = CFSTR("name");
              v79[0] = CFSTR("report");
              v79[1] = v34;
              v79[2] = CFSTR("Start");
              v78[2] = CFSTR("status");
              v78[3] = CFSTR("timestamp");
              v46 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v35, "timeIntervalSince1970");
              objc_msgSend(v46, "numberWithDouble:");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v79[3] = v47;
              v55 = v35;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 4);
              v43 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v53, "addObject:", v43);
              v48 = (void *)MEMORY[0x1E0C99D80];
              v49 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v36, "timeIntervalSince1970");
              objc_msgSend(v49, "numberWithDouble:");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = obja;
              objc_msgSend(v48, "dictionaryWithObjectsAndKeys:", CFSTR("report"), CFSTR("type"), v34, CFSTR("name"), CFSTR("End"), CFSTR("status"), v61, CFSTR("result"), v50, CFSTR("timestamp"), obja, CFSTR("context"), 0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v35 = v55;
              v39 = v61;
              objc_msgSend(v53, "addObject:", v52);

            }
            else
            {
              if (v44)
              {
                *(_DWORD *)buf = 138413058;
                v81 = (uint64_t)v34;
                v82 = 2112;
                v83 = v35;
                v84 = 2112;
                v85 = v36;
                v86 = 2112;
                v87 = v39;
                _os_log_impl(&dword_1DBAE1000, v43, OS_LOG_TYPE_DEBUG, "Report result contains missing values - creator:%@ startDate:%@ endDate:%@ result:%@", buf, 0x2Au);
              }
              v51 = obja;
            }

          }
          v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v66, v91, 16);
        }
        while (v57);
      }

      if (objc_msgSend(v53, "count"))
        -[DiagnosticCase addEvents:forced:](self, "addEvents:forced:", v53, 1);

    }
  }
}

- (void)validateAttachments
{
  NSObject *v3;
  NSMutableDictionary *requiredAttachments;
  NSMutableDictionary *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  DiagnosticCase *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  diagcaseLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    requiredAttachments = self->_requiredAttachments;
    *(_DWORD *)buf = 138412290;
    v17 = (DiagnosticCase *)requiredAttachments;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEBUG, "Ready to validate attachments with requirements: %@", buf, 0xCu);
  }

  v5 = self->_requiredAttachments;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__DiagnosticCase_validateAttachments__block_invoke;
  v11[3] = &unk_1EA3B6E48;
  v11[4] = self;
  v11[5] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (*((_BYTE *)v13 + 24))
  {
    if (-[NSMutableDictionary count](self->_requiredAttachments, "count"))
    {
      diagcaseLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "All attachments validated successfully.";
        v8 = v6;
        v9 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
        _os_log_impl(&dword_1DBAE1000, v8, v9, v7, buf, 2u);
      }
    }
    else
    {
      diagcaseLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v7 = "No attachments to validate.";
        v8 = v6;
        v9 = OS_LOG_TYPE_INFO;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
  diagcaseLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "This case has one or more missing required attachments. Marking as ineligible. (%@)", buf, 0xCu);
  }

  -[DiagnosticCase setDampeningType:](self, "setDampeningType:", 4294967294);
LABEL_14:
  _Block_object_dispose(&v12, 8);
}

void __37__DiagnosticCase_validateAttachments__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  _QWORD aBlock[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = (id *)&v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  diagcaseLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v41 = v5;
    v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "Validating we have attachment type '%@' with pattern '%@'", buf, 0x16u);
  }

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__DiagnosticCase_validateAttachments__block_invoke_135;
  aBlock[3] = &unk_1EA3B6E70;
  v28 = &v30;
  v9 = v5;
  v27 = v9;
  v29 = &v36;
  v10 = _Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong(v31 + 5, a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "enumerateObjectsUsingBlock:", v10);
    if (!*((_BYTE *)v37 + 24))
    {
      diagcaseLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v31[5];
        *(_DWORD *)buf = 138543618;
        v41 = v9;
        v42 = 2112;
        v43 = v12;
        _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "Missing attachment for type '%{public}@' (matching pattern '%@')", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v6;
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __37__DiagnosticCase_validateAttachments__block_invoke_137;
      v20[3] = &unk_1EA3B6E98;
      v14 = *(_QWORD *)(a1 + 32);
      v23 = &v30;
      v20[4] = v14;
      v22 = v10;
      v24 = &v36;
      v15 = v9;
      v16 = *(_QWORD *)(a1 + 40);
      v21 = v15;
      v25 = v16;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);

    }
    else
    {
      diagcaseLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v41 = v6;
        v42 = 2112;
        v43 = v19;
        v44 = 2114;
        v45 = v9;
        _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_ERROR, "Found unexpected pattern object %@ (class %@) when validating required attachments for type '%{public}@'", buf, 0x20u);

      }
    }
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

}

void __37__DiagnosticCase_validateAttachments__block_invoke_135(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "containsString:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)))
  {
    diagcaseLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = a1[4];
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Validated attachment for type '%@': %@", (uint8_t *)&v9, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __37__DiagnosticCase_validateAttachments__block_invoke_137(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    objc_msgSend(*(id *)(a1[4] + 112), "enumerateObjectsUsingBlock:", a1[6]);
    if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
    {
      diagcaseLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)a1[5];
        v7 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
        v12 = 138543618;
        v13 = v6;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Missing attachment for type '%{public}@' (matching pattern '%@')", (uint8_t *)&v12, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 0;
    }
  }
  else
  {
    diagcaseLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      v12 = 138412802;
      v13 = v4;
      v14 = 2112;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "Found unexpected pattern object %@ (class %@) when validating required attachments for type '%{public}@'", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (id)addSizeInfoForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v6, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  if (v9)
  {
    diagcaseLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v4;
      v23 = 2112;
      v24 = (uint64_t)v11;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: Error getting fileSize for '%@': %@", buf, 0x16u);

    }
    v12 = &stru_1EA3B8F58;
  }
  else
  {
    v13 = objc_msgSend(v8, "fileSize");
    objc_msgSend(v4, "lastPathComponent");
    v10 = objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase attachmentsWithSize](self, "attachmentsWithSize");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)objc_opt_new();
      -[DiagnosticCase setAttachmentsWithSize:](self, "setAttachmentsWithSize:", v15);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase attachmentsWithSize](self, "attachmentsWithSize");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v10);

    v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), v13);
    summaryLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v4;
      v23 = 2048;
      v24 = v13;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: Adding attachment %@, size: %llu bytes", buf, 0x16u);
    }

    self->_attachmentsFileSize += v13;
  }

  return v12;
}

- (id)stringRepresentationOfAttachmentsWithSize
{
  void *v2;
  void *v3;

  -[DiagnosticCase attachmentsWithSize](self, "attachmentsWithSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCaseSummaryAnalytics stringRepresentationOfAttachmentsWithSize:](DiagnosticCaseSummaryAnalytics, "stringRepresentationOfAttachmentsWithSize:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)generateCaseSummaryDictionaryFromCaseStorage:(id)a3
{
  id v3;
  id v4;
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
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *context;
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[7];
  _QWORD v38[9];

  v38[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  context = (void *)MEMORY[0x1DF0B6314]();
  objc_msgSend(v3, "timeStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v3, "caseClosedTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v33 = v6;
  iso8601date_string_from_NSDate(v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  iso8601date_string_from_NSDate(v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caseID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("case_identifier"));

  +[DiagnosticCase signatureForCaseStorage:](DiagnosticCase, "signatureForCaseStorage:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("signature"));

  objc_msgSend(v3, "caseEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCase _arrayObjectRepresentationOfJSONString:](DiagnosticCase, "_arrayObjectRepresentationOfJSONString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("events"));

  v37[0] = CFSTR("case_opened_timestamp");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v15;
  v38[1] = v32;
  v37[1] = CFSTR("case_opened_time");
  v37[2] = CFSTR("case_closed_timestamp");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v17;
  v38[3] = v31;
  v37[3] = CFSTR("case_closed_time");
  v37[4] = CFSTR("dampening_type");
  +[DiagnosticCase _caseDampeningTypeString:](DiagnosticCase, "_caseDampeningTypeString:", objc_msgSend(v3, "caseDampeningType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v18;
  v37[5] = CFSTR("closure_type");
  +[DiagnosticCase _closureTypeString:](DiagnosticCase, "_closureTypeString:", objc_msgSend(v3, "caseClosureType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v19;
  v37[6] = CFSTR("remote_trigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "remoteTrigger"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("case_status"));

  objc_msgSend(v3, "caseAttachments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCase _arrayObjectRepresentationOfJSONString:](DiagnosticCase, "_arrayObjectRepresentationOfJSONString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("attachments"));

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("product_type");
  objc_msgSend(v24, "productType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v25;
  v35[1] = CFSTR("product_name");
  objc_msgSend(v24, "productName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v26;
  v35[2] = CFSTR("product_version");
  objc_msgSend(v24, "productVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v27;
  v35[3] = CFSTR("build_version");
  objc_msgSend(v24, "buildVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("system_properties"));

  objc_autoreleasePoolPop(context);
  return v4;
}

+ (id)generateCaseSummaryFromCaseStorageDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *context;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[7];
  _QWORD v55[7];
  uint8_t buf[4];
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)MEMORY[0x1DF0B6314]();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeStamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseClosedTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "copy");

  if (v7)
  {
    if (!v9)
    {
      diagcaseLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v3;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Fixing up case dictionary with missing key caseClosedTime: %@", buf, 0xCu);
      }

      v9 = v7;
    }
    context = v5;
    iso8601date_string_from_NSDate(v7);
    v11 = objc_claimAutoreleasedReturnValue();
    iso8601date_string_from_NSDate(v9);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("case_identifier"));

    +[DiagnosticCase signatureForCaseStorageDictionary:](DiagnosticCase, "signatureForCaseStorageDictionary:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("signature"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseEvents"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCase _arrayObjectRepresentationOfJSONString:](DiagnosticCase, "_arrayObjectRepresentationOfJSONString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("events"));

    v54[0] = CFSTR("case_opened_timestamp");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v50 = v7;
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v19;
    v55[1] = v11;
    v48 = (void *)v11;
    v54[1] = CFSTR("case_opened_time");
    v54[2] = CFSTR("case_closed_timestamp");
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v49 = v9;
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v21;
    v55[3] = v12;
    v47 = (void *)v12;
    v54[3] = CFSTR("case_closed_time");
    v54[4] = CFSTR("dampening_type");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseDampeningType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCase _caseDampeningTypeString:](DiagnosticCase, "_caseDampeningTypeString:", (__int16)objc_msgSend(v22, "intValue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v23;
    v54[5] = CFSTR("closure_type");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseClosureType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCase _closureTypeString:](DiagnosticCase, "_closureTypeString:", (__int16)objc_msgSend(v24, "intValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55[5] = v25;
    v54[6] = CFSTR("remote_trigger");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("remoteTrigger"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55[6] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("case_status"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseAttachments"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCase _arrayObjectRepresentationOfJSONString:](DiagnosticCase, "_arrayObjectRepresentationOfJSONString:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("attachments"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dpSubmissionState"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("dp_submission"));

    +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("buildVariant"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      objc_msgSend(v31, "buildVariant");
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    v37 = v34;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("buildVersion"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = v38;
    }
    else
    {
      objc_msgSend(v31, "buildVersion");
      v40 = (id)objc_claimAutoreleasedReturnValue();
    }
    v41 = v40;

    v52[0] = CFSTR("product_type");
    objc_msgSend(v31, "productType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v42;
    v52[1] = CFSTR("product_name");
    objc_msgSend(v31, "productName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v43;
    v52[2] = CFSTR("product_version");
    objc_msgSend(v31, "productVersion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v44;
    v53[3] = v41;
    v52[3] = CFSTR("build_version");
    v52[4] = CFSTR("build_variant");
    v53[4] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, CFSTR("system_properties"));

    objc_autoreleasePoolPop(context);
    v36 = v4;
  }
  else
  {
    diagcaseLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v3;
      _os_log_impl(&dword_1DBAE1000, v35, OS_LOG_TYPE_ERROR, "Missing required key timeStamp (case open time) from case dictionary: %@", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v5);
    v36 = 0;
  }

  return v36;
}

- (id)_generateCaseSummaryDictionary
{
  id v3;
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
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  int v36;
  const char *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *context;
  void *v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  const char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  context = (void *)MEMORY[0x1DF0B6314]();
  v4 = (void *)MEMORY[0x1E0C99D68];
  -[DiagnosticCase caseOpenedTime](self, "caseOpenedTime");
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  iso8601date_string_from_NSDate(v5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99D68];
  -[DiagnosticCase caseClosedTime](self, "caseClosedTime");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  iso8601date_string_from_NSDate(v7);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  -[DiagnosticCase caseId](self, "caseId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("case_identifier"));

  -[DiagnosticCase signature](self, "signature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("signature"));

  -[DiagnosticCase events](self, "events");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("events"));

  v53 = (void *)MEMORY[0x1E0C99D80];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[DiagnosticCase caseOpenedTime](self, "caseOpenedTime");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[DiagnosticCase caseClosedTime](self, "caseClosedTime");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase caseDampeningTypeString](self, "caseDampeningTypeString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCase caseClosureTypeString](self, "caseClosureTypeString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DiagnosticCase isRemoteTrigger](self, "isRemoteTrigger"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "dictionaryWithObjectsAndKeys:", v13, CFSTR("case_opened_timestamp"), v57, CFSTR("case_opened_time"), v15, CFSTR("case_closed_timestamp"), v56, CFSTR("case_closed_time"), v16, CFSTR("dampening_type"), v17, CFSTR("closure_type"), v18, CFSTR("remote_trigger"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("case_status"));

  -[DiagnosticCase attachments](self, "attachments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("attachments"));

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WirelessTechnologyProfile sharedInstance](WirelessTechnologyProfile, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v21, "productType");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "productName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "productVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "buildVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "buildVariant");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "regulatoryDomainCountry");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v22;
  objc_msgSend(v22, "homeCarrier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v50, CFSTR("product_type"), v49, CFSTR("product_name"), v23, CFSTR("product_version"), v24, CFSTR("build_version"), v25, CFSTR("build_variant"), v26, CFSTR("regulatory_domain_country"), v27, CFSTR("home_carrier"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "serialNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v30)
  {
    objc_msgSend(v21, "serialNumber");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("serial_number"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("system_properties"));
  +[PrimaryInterfaceUtils sharedInstance](PrimaryInterfaceUtils, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  diagcaseLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v34 = objc_msgSend(v32, "primaryInterfaceType");
    objc_msgSend(v32, "interfaceBecamePrimaryDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v32, "hasPrimaryInterface");
    v37 = "NO";
    *(_DWORD *)buf = 134218498;
    v59 = v34;
    if (v36)
      v37 = "YES";
    v60 = 2112;
    v61 = v35;
    v62 = 2080;
    v63 = v37;
    _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEBUG, "InterfaceUtils reports type:%ld date:%@ hasPrimary:%s", buf, 0x20u);

  }
  v52 = v28;

  if (objc_msgSend(v32, "hasPrimaryInterface"))
  {
    objc_msgSend(v32, "primaryInterfaceTypeString");
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "interfaceBecamePrimaryDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v39, "timeIntervalSince1970");
    objc_msgSend(v40, "numberWithDouble:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      iso8601date_string_from_NSDate(v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v32, "estimatedInterfaceBecamePrimaryDate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v45, "timeIntervalSince1970");
    objc_msgSend(v46, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      iso8601date_string_from_NSDate(v45);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }

  }
  else
  {
    v41 = 0;
    v43 = 0;
    v42 = 0;
    v44 = 0;
    v38 = CFSTR("None");
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v38, CFSTR("primary_interface_type"), v41, CFSTR("primary_interface_timestamp"), v42, CFSTR("primary_interface_time"), v43, CFSTR("primary_interface_timestamp_estimated"), v44, CFSTR("primary_interface_time_estimated"), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("network_properties"));

  objc_autoreleasePoolPop(context);
  return v3;
}

- (id)_caseSummaryFileName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
  v4 = (void *)MEMORY[0x1E0C99D68];
  -[DiagnosticCase caseOpenedTime](self, "caseOpenedTime");
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    diagcaseLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[DiagnosticCase caseOpenedTime](self, "caseOpenedTime");
      *(_DWORD *)buf = 134217984;
      v19 = v8;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "formattedDate is nil for case opened time %f", buf, 0xCu);
    }

    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[DiagnosticCase caseOpenedTime](self, "caseOpenedTime");
    v11 = objc_msgSend(v9, "initWithFormat:", CFSTR("%.3f"), v10);

    v6 = (void *)v11;
  }
  -[DiagnosticCase manager](self, "manager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logArchivePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("case_summary_%@.json"), v6);
  objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)summarizeCaseReport
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[DiagnosticCase caseStorage](self, "caseStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseDampeningType");

  if (v4 < 1)
  {
    -[DiagnosticCase _generateCaseSummaryDictionary](self, "_generateCaseSummaryDictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      diagcaseLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "Case summary dictionary is nil", buf, 2u);
      }
      goto LABEL_23;
    }
    +[DiagnosticCase _stringRepresentationOfJSONObject:prettyPrint:](DiagnosticCase, "_stringRepresentationOfJSONObject:prettyPrint:", v5, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v6, "length"))
    {
      -[DiagnosticCase _caseSummaryFileName](self, "_caseSummaryFileName");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v16 = 0;
        v12 = -[NSObject writeToFile:atomically:encoding:error:](v6, "writeToFile:atomically:encoding:error:", v7, 0, 4, &v16);
        v13 = v16;
        if (v12)
        {
          -[DiagnosticCase fixupCaseSummaryFile:](self, "fixupCaseSummaryFile:", v7);
          diagcaseLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v7;
            _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Case summary wrote to %@, adding to attachment", buf, 0xCu);
          }

          -[DiagnosticCase _addToAttachments:](self, "_addToAttachments:", v7);
          -[DiagnosticCase setCaseSummaryFilepath:](self, "setCaseSummaryFilepath:", v7);
        }
        else
        {
          diagcaseLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v13;
            _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_ERROR, "Writing of case summary failed with error %@", buf, 0xCu);
          }

        }
      }
      else
      {
        diagcaseLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Case summary file name is nil", buf, 2u);
        }
      }

      goto LABEL_22;
    }
    diagcaseLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    v8 = "Pretty case summary is empty (case summary dict = %@)";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 12;
LABEL_4:
    _os_log_impl(&dword_1DBAE1000, v9, v10, v8, buf, v11);
    goto LABEL_22;
  }
  diagcaseLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[DiagnosticCase caseId](self, "caseId");
    v6 = objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase caseDampeningTypeString](self, "caseDampeningTypeString");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v8 = "Skip creating a case summary for %{public}@ (dampening = %@)";
    v9 = v5;
    v10 = OS_LOG_TYPE_INFO;
    v11 = 22;
    goto LABEL_4;
  }
LABEL_24:

}

- (void)fixupCaseSummaryFile:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uid_t v9;
  gid_t v10;
  int v11;
  ssize_t v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  _BYTE v37[10];
  _DWORD v38[4];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "UTF8String");
  if (v4)
  {
    v5 = (const char *)v4;
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationManager");
    v7 = objc_claimAutoreleasedReturnValue();

    if (chown(v5, -[NSObject logArchiveUID](v7, "logArchiveUID"), -[NSObject logArchiveGID](v7, "logArchiveGID")))
    {
      diagcaseLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = getuid();
        v10 = getgid();
        v11 = *__error();
        *(_DWORD *)buf = 136315906;
        v35 = v5;
        v36 = 1024;
        *(_DWORD *)v37 = v9;
        *(_WORD *)&v37[4] = 1024;
        *(_DWORD *)&v37[6] = v10;
        LOWORD(v38[0]) = 1024;
        *(_DWORD *)((char *)v38 + 2) = v11;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "failed to chown for file: %s, uid: %u, gid: %u  %{errno}d", buf, 0x1Eu);
      }

    }
    v12 = listxattr(v5, 0, 0, 1);
    v13 = (char *)malloc_type_malloc(v12, 0xD3B3FCCuLL);
    if (v13)
    {
      v14 = v13;
      v15 = (void *)listxattr(v5, v13, v12, 1);
      v27 = v7;
      v28 = v3;
      if (v15)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v14, v15, 4);
        objc_msgSend(v16, "componentsSeparatedByString:", &stru_1EA3BD5B8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      free(v14);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if (objc_msgSend(v22, "length", v27, v28))
            {
              v23 = (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
              if (v23)
              {
                v24 = v23;
                if (removexattr(v5, v23, 1))
                {
                  diagcaseLogHandle();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    v26 = *__error();
                    *(_DWORD *)buf = 136315650;
                    v35 = v24;
                    v36 = 2080;
                    *(_QWORD *)v37 = v5;
                    *(_WORD *)&v37[8] = 1024;
                    v38[0] = v26;
                    _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_ERROR, "failed to removexattr %s for file: %s, %{errno}d", buf, 0x1Cu);
                  }

                }
              }
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v19);
      }

      v7 = v27;
      v3 = v28;
    }
  }
  else
  {
    diagcaseLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (const char *)v3;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "failed to get UTF8 string for %@", buf, 0xCu);
    }
  }

}

- (void)recordDiagnosticCaseSummary
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[DiagnosticCase manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "caseSummaryEnabled");

  if (v5)
  {
    -[DiagnosticCase manager](self, "manager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordDiagnosticCaseSummaryForCase:", self);

  }
}

- (BOOL)sendReports
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[DiagnosticCase caseStorage](self, "caseStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseState");

  if (v4 == 5)
  {
    -[DiagnosticCase manager](self, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sendReportsForCase:", self);

  }
  else
  {
    v6 = 1;
  }
  -[DiagnosticCase setCaseState:](self, "setCaseState:", 6);
  return v6;
}

- (void)prepareForSaving
{
  void *v3;
  void *v4;
  int v5;

  -[DiagnosticCase manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "autoBugCaptureRegularPayloads");

  if (v5)
    -[DiagnosticCase serializePayloadsToDiagnosticCaseStorage](self, "serializePayloadsToDiagnosticCaseStorage");
  -[DiagnosticCase serializeAttachmentsToDiagnosticCaseStorage](self, "serializeAttachmentsToDiagnosticCaseStorage");
  -[DiagnosticCase serializeEventsToDiagnosticCaseStorage](self, "serializeEventsToDiagnosticCaseStorage");
}

- (BOOL)_parseSignatureIntoCaseStorage:(id)a3
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
  BOOL v26;

  v4 = a3;
  if (v4
    && (-[DiagnosticCase caseStorage](self, "caseStorage"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCaseDomain:", v6);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCaseType:", v8);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtype"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCaseSubtype:", v10);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("additional"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCaseSubtypeContext:", v12);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detected"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCaseDetectedProcess:", v14);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effective"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setCaseEffectiveProcess:", v16);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("related"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setCaseRelatedProcesses:", v18);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("threshval"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setCaseThresholdValues:", v20);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("context"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCaseContext:", v22);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[DiagnosticCase caseStorage](self, "caseStorage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setCaseGroupID:", v24);

      }
    }

    v26 = 1;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)_parseCaseStorageIntoSignature:(id)a3
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;

  v4 = a3;
  if (v4
    && (-[DiagnosticCase caseStorage](self, "caseStorage"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caseDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "caseDomain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("domain"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "caseType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "caseType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("type"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "caseSubtype");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "caseSubtype");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("subtype"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "caseSubtypeContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "caseSubtypeContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("additional"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "caseDetectedProcess");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "caseDetectedProcess");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("detected"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "caseEffectiveProcess");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "caseEffectiveProcess");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("effective"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "caseRelatedProcesses");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "caseRelatedProcesses");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("related"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "caseThresholdValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "caseThresholdValues");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("threshval"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "caseContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "caseContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("context"));

    }
    -[DiagnosticCase caseStorage](self, "caseStorage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "caseGroupID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[DiagnosticCase caseStorage](self, "caseStorage");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "caseGroupID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, CFSTR("groupID"));

    }
    v46 = 1;
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

+ (id)signatureForCaseStorage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
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

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "caseDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "caseDomain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("domain"));

    }
    objc_msgSend(v3, "caseType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "caseType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("type"));

    }
    objc_msgSend(v3, "caseSubtype");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v3, "caseSubtype");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("subtype"));

    }
    objc_msgSend(v3, "caseSubtypeContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v3, "caseSubtypeContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("additional"));

    }
    objc_msgSend(v3, "caseDetectedProcess");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v3, "caseDetectedProcess");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("detected"));

    }
    objc_msgSend(v3, "caseEffectiveProcess");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v3, "caseEffectiveProcess");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("effective"));

    }
    objc_msgSend(v3, "caseRelatedProcesses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v3, "caseRelatedProcesses");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("related"));

    }
    objc_msgSend(v3, "caseThresholdValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v3, "caseThresholdValues");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("threshval"));

    }
    objc_msgSend(v3, "caseContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v3, "caseContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("context"));

    }
    objc_msgSend(v3, "caseGroupID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v3, "caseGroupID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("groupID"));

    }
    v6 = v5;
  }

  return v6;
}

+ (id)signatureForCaseStorageDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
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

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseDomain"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("domain"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("type"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseSubtype"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseSubtype"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("subtype"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseSubtypeContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseSubtypeContext"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("additional"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseDetectedProcess"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseDetectedProcess"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("detected"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseEffectiveProcess"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseEffectiveProcess"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("effective"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseRelatedProcesses"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseRelatedProcesses"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("related"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseThresholdValues"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseThresholdValues"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("threshval"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseContext"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseContext"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("context"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseGroupID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("caseGroupID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("groupID"));

    }
    v6 = v5;
  }

  return v6;
}

+ (id)descriptionForClosureType:(signed __int16)a3
{
  __CFString *v3;

  if (a3 >= 6)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ClosureTypeUnknown: %d"), a3);
  else
    v3 = off_1EA3B6F48[a3];
  return v3;
}

+ (id)descriptionForDampeningType:(signed __int16)a3
{
  uint64_t v3;
  __CFString *v4;

  v3 = a3 + 2;
  if (v3 >= 0xB)
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DampeningTypeUnknown: %d"), a3);
  else
    v4 = off_1EA3B6F78[v3];
  return v4;
}

- (void)markAttachmentsAsPurgeable:(BOOL)a3 urgency:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  int v16;
  int v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = 0x10000;
  if (!a3)
    v5 = 0;
  v23 = v5 | a4 | 5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[DiagnosticCase attachments](self, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
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
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "fileExistsAtPath:", v13);

        if (v14)
        {
          v15 = objc_retainAutorelease(v12);
          v16 = fsctl((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0xC0084A44uLL, &v23, 0);
          if (v16)
          {
            v17 = v16;
            storageLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v25 = v15;
              v26 = 1024;
              v27 = v17;
              _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_ERROR, "Failed to mark ABC file purgeable: %{public}@, %{errno}d", buf, 0x12u);
            }

          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v9);
  }

}

- (DiagnosticCaseStorage)caseStorage
{
  return self->_caseStorage;
}

- (NSMutableArray)caseReports
{
  return self->_caseReports;
}

- (NSMutableArray)caseOutlets
{
  return self->_caseOutlets;
}

- (NSMutableDictionary)signature
{
  return self->_signature;
}

- (NSDictionary)requiredAttachments
{
  return &self->_requiredAttachments->super;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (NSMutableArray)payloads
{
  return self->_payloads;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (NSDictionary)actions
{
  return self->_actions;
}

- (NSString)caseSummaryFilepath
{
  return self->_caseSummaryFilepath;
}

- (void)setCaseSummaryFilepath:(id)a3
{
  objc_storeStrong((id *)&self->_caseSummaryFilepath, a3);
}

- (unint64_t)attachmentsFileSize
{
  return self->_attachmentsFileSize;
}

- (unint64_t)caseFlags
{
  return self->_caseFlags;
}

- (void)setCaseFlags:(unint64_t)a3
{
  self->_caseFlags = a3;
}

- (double)preferredDuration
{
  return self->_preferredDuration;
}

- (void)setPreferredDuration:(double)a3
{
  self->_preferredDuration = a3;
}

- (BOOL)readyToEndSession
{
  return self->_readyToEndSession;
}

- (void)setReadyToEndSession:(BOOL)a3
{
  self->_readyToEndSession = a3;
}

- (DiagnosticCaseManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (NSMutableDictionary)attachmentsWithSize
{
  return self->_attachmentsWithSize;
}

- (void)setAttachmentsWithSize:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentsWithSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsWithSize, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_caseSummaryFilepath, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_caseOutlets, 0);
  objc_storeStrong((id *)&self->_caseReports, 0);
  objc_storeStrong((id *)&self->_caseStorage, 0);
  objc_storeStrong((id *)&self->_caseId, 0);
  objc_storeStrong((id *)&self->_requiredAttachments, 0);
  objc_storeStrong((id *)&self->_requiredActions, 0);
}

@end
