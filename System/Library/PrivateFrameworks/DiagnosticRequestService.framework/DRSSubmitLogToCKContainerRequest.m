@implementation DRSSubmitLogToCKContainerRequest

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  -[DRSRequest debugDescription](&v11, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSSubmitLogToCKContainerRequest containerName](self, "containerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSSubmitLogToCKContainerRequest recordType](self, "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSSubmitLogToCKContainerRequest fileAssetField](self, "fileAssetField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSSubmitLogToCKContainerRequest recordDictionary](self, "recordDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_configureRequestMO:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  -[DRSSubmitLogRequest _configureRequestMO:](&v10, sel__configureRequestMO_, v4);
  v5 = v4;
  -[DRSSubmitLogToCKContainerRequest containerName](self, "containerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContainerName:", v6);

  -[DRSSubmitLogToCKContainerRequest recordType](self, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordType:", v7);

  -[DRSSubmitLogToCKContainerRequest fileAssetField](self, "fileAssetField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileAssetField:", v8);

  -[DRSSubmitLogToCKContainerRequest recordDictionaryData](self, "recordDictionaryData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordDictionaryData:", v9);

}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return CFSTR("DRSSubmitLogToCKContainerRequestMO");
}

- (unint64_t)expectedType
{
  return 4;
}

- (DRSSubmitLogToCKContainerRequest)initWithXPCDict:(id)a3
{
  id v4;
  DRSSubmitLogToCKContainerRequest *v5;
  const char *string;
  uint64_t v7;
  NSString *containerName;
  const char *v9;
  uint64_t v10;
  NSString *recordType;
  const char *v12;
  uint64_t v13;
  NSString *fileAssetField;
  const void *data;
  uint64_t v16;
  NSData *recordDictionaryData;
  void *v18;
  uint64_t v19;
  NSDictionary *recordDictionary;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  DRSSubmitLogToCKContainerRequest *v29;
  const char *v30;
  NSObject *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  size_t length;
  objc_super v38;
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  v5 = -[DRSRequest initWithXPCDict:](&v38, sel_initWithXPCDict_, v4);
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, "containerName");
    if (!string)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v7 = objc_claimAutoreleasedReturnValue();
    containerName = v5->_containerName;
    v5->_containerName = (NSString *)v7;

    v9 = xpc_dictionary_get_string(v4, "RecordType");
    if (!v9)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v10;

    v12 = xpc_dictionary_get_string(v4, "FileAssetField");
    if (!v12)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    fileAssetField = v5->_fileAssetField;
    v5->_fileAssetField = (NSString *)v13;

    length = 0;
    data = xpc_dictionary_get_data(v4, "RecordDictionaryData", &length);
    if (data && length)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
      v16 = objc_claimAutoreleasedReturnValue();
      recordDictionaryData = v5->_recordDictionaryData;
      v5->_recordDictionaryData = (NSData *)v16;

      -[DRSSubmitLogToCKContainerRequest recordDictionaryData](v5, "recordDictionaryData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      DRSDictionaryForData((uint64_t)v18);
      v19 = objc_claimAutoreleasedReturnValue();
      recordDictionary = v5->_recordDictionary;
      v5->_recordDictionary = (NSDictionary *)v19;

      -[DRSSubmitLogToCKContainerRequest recordDictionary](v5, "recordDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        -[DRSSubmitLogToCKContainerRequest recordDictionary](v5, "recordDictionary", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "allKeys");
        v23 = objc_claimAutoreleasedReturnValue();

        v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v34 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                DPLogHandle_SubmitLogToCKContainerError();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_signpost_enabled(v31))
                {
                  *(_DWORD *)buf = 138543362;
                  v40 = v28;
                  _os_signpost_emit_with_name_impl(&dword_1DBB92000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRecordKey", "%{public}@", buf, 0xCu);
                }

                goto LABEL_26;
              }
            }
            v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v25)
              continue;
            break;
          }
        }

        -[DRSRequest setDecisionServerDecision:](v5, "setDecisionServerDecision:", 2);
        goto LABEL_17;
      }
      DPLogHandle_SubmitLogToCKContainerError();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v23))
        goto LABEL_26;
      *(_WORD *)buf = 0;
      v30 = "FailedToDeserializeRecordDictionaryData";
    }
    else
    {
      DPLogHandle_SubmitLogToCKContainerError();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v23))
      {
LABEL_26:

LABEL_27:
        v29 = 0;
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v30 = "SubmitLogToCKContainerMissingRecordData";
    }
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v30, (const char *)&unk_1DBC04191, buf, 2u);
    goto LABEL_26;
  }
LABEL_17:
  v29 = v5;
LABEL_28:

  return v29;
}

+ (BOOL)_requestMOHasRequiredFields_ON_MOC_QUEUE:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___DRSSubmitLogToCKContainerRequest;
  if (objc_msgSendSuper2(&v9, sel__requestMOHasRequiredFields_ON_MOC_QUEUE_, v4))
  {
    v5 = v4;
    objc_msgSend(v5, "containerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "recordType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "fileAssetField");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(v5, "recordDictionaryData");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v6) = v7 != 0;

        }
      }
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (id)_initWithSubmitLogToCKContainerRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  NSObject *v20;
  const char *v21;
  uint8_t v23[16];
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  v5 = -[DRSSubmitLogRequest _initWithSubmitLogRequestMO_ON_MOC_QUEUE:](&v24, sel__initWithSubmitLogRequestMO_ON_MOC_QUEUE_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "containerName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5[18];
  v5[18] = v6;

  objc_msgSend(v4, "recordType");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v5[19];
  v5[19] = v8;

  objc_msgSend(v4, "recordDictionaryData");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v5[21];
  v5[21] = v10;

  objc_msgSend(v5, "recordDictionaryData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    DPLogHandle_SubmitLogToCKContainerError();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      v21 = "MissingRecordDictionaryDataFromMO";
LABEL_9:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v21, (const char *)&unk_1DBC04191, v23, 2u);
    }
LABEL_10:

    v19 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "fileAssetField");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v5[20];
  v5[20] = v13;

  objc_msgSend(v5, "recordDictionaryData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  DRSDictionaryForData((uint64_t)v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v5[22];
  v5[22] = v16;

  objc_msgSend(v5, "recordDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    DPLogHandle_SubmitLogToCKContainerError();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      v21 = "FailedToDeserializeRecordDictionaryDataFromMO";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v19 = v5;
LABEL_11:

  return v19;
}

- (id)requestType
{
  return CFSTR("SubmitLogToCKContainer");
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  if (-[DRSSubmitLogRequest isEqualToRequest:](&v16, sel_isEqualToRequest_, v4))
  {
    v5 = v4;
    -[DRSSubmitLogToCKContainerRequest containerName](self, "containerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[DRSSubmitLogToCKContainerRequest recordType](self, "recordType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[DRSSubmitLogToCKContainerRequest fileAssetField](self, "fileAssetField");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fileAssetField");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          -[DRSSubmitLogToCKContainerRequest recordDictionaryData](self, "recordDictionaryData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "recordDictionaryData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v15, "isEqualToData:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1DF0B6DC4](self, a2);
  v16.receiver = self;
  v16.super_class = (Class)DRSSubmitLogToCKContainerRequest;
  -[DRSRequest jsonCompatibleDictionaryRepresentationVerbose:](&v16, sel_jsonCompatibleDictionaryRepresentationVerbose_, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB36D8];
  -[DRSSubmitLogToCKContainerRequest recordDictionary](self, "recordDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isValidJSONObject:", v8);

  if ((_DWORD)v7)
  {
    -[DRSSubmitLogToCKContainerRequest recordDictionary](self, "recordDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("recordDictionary"));

  }
  else
  {
    DPLogHandle_Request();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      -[DRSSubmitLogToCKContainerRequest debugDescription](self, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SkippedRecordDictionaryJSONSerialization", "Record dictionary for %{public}@ cannot be serialized in JSON", buf, 0xCu);

    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("<Could not serialize>"), CFSTR("recordDictionary"));
  }
  -[DRSSubmitLogToCKContainerRequest containerName](self, "containerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("containerName"));

  -[DRSSubmitLogToCKContainerRequest recordType](self, "recordType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("recordType"));

  -[DRSSubmitLogToCKContainerRequest fileAssetField](self, "fileAssetField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("fileAssetField"));

  objc_autoreleasePoolPop(v5);
  return v6;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSString)fileAssetField
{
  return self->_fileAssetField;
}

- (NSData)recordDictionaryData
{
  return self->_recordDictionaryData;
}

- (NSDictionary)recordDictionary
{
  return self->_recordDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDictionary, 0);
  objc_storeStrong((id *)&self->_recordDictionaryData, 0);
  objc_storeStrong((id *)&self->_fileAssetField, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

+ (id)xcRecordZoneID
{
  if (xcRecordZoneID_onceToken != -1)
    dispatch_once(&xcRecordZoneID_onceToken, &__block_literal_global_3);
  return (id)objc_msgSend((id)xcRecordZoneID_xcRecordZone, "zoneID");
}

void __68__DRSSubmitLogToCKContainerRequest_CKRecord_Private__xcRecordZoneID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("3pDevEngagement"));
  v1 = (void *)xcRecordZoneID_xcRecordZone;
  xcRecordZoneID_xcRecordZone = v0;

}

+ (id)safeguardArchiveZoneID
{
  if (safeguardArchiveZoneID_onceToken != -1)
    dispatch_once(&safeguardArchiveZoneID_onceToken, &__block_literal_global_51);
  return (id)objc_msgSend((id)safeguardArchiveZoneID_safeguardArchiveZone, "zoneID");
}

void __76__DRSSubmitLogToCKContainerRequest_CKRecord_Private__safeguardArchiveZoneID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("safeguard_zone"));
  v1 = (void *)safeguardArchiveZoneID_safeguardArchiveZone;
  safeguardArchiveZoneID_safeguardArchiveZone = v0;

}

- (id)zoneID
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;

  -[DRSRequest teamID](self, "teamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kDRSDMPPSTeamID[0]);

  if (!v4)
    goto LABEL_6;
  -[DRSRequest issueCategory](self, "issueCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", kDRSDMPPSXCArchiveIssueCategory[0]);

  if (!v6)
  {
    -[DRSRequest issueCategory](self, "issueCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", kDRSDMPPSSafeguardArchiveIssueCategory[0]);

    if (v9)
    {
      objc_msgSend((id)objc_opt_class(), "safeguardArchiveZoneID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
LABEL_6:
    v7 = 0;
    return v7;
  }
  objc_msgSend((id)objc_opt_class(), "xcRecordZoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)recordRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  void *v30;
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[DRSRequest logs](self, "logs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[DRSSubmitLogToCKContainerRequest recordDictionary](self, "recordDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v6 = DRValidateCKRecordDictionary(v5, &v32);
    v7 = v32;

    if ((v6 & 1) != 0)
    {
      -[DRSSubmitLogToCKContainerRequest zoneID](self, "zoneID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0C95048]);
      -[DRSSubmitLogToCKContainerRequest recordType](self, "recordType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v11 = objc_msgSend(v9, "initWithRecordType:zoneID:", v10, v8);
      else
        v11 = objc_msgSend(v9, "initWithRecordType:", v10);
      v19 = (void *)v11;

      -[DRSSubmitLogToCKContainerRequest recordDictionary](self, "recordDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __74__DRSSubmitLogToCKContainerRequest_CKRecord_Private__recordRepresentation__block_invoke;
      v30 = &unk_1EA3D12C0;
      v14 = v19;
      v31 = v14;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", &v27);

      -[DRSRequest fileAssets](self, "fileAssets", v27, v28, v29, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[DRSSubmitLogToCKContainerRequest fileAssetField](self, "fileAssetField");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v22, v23);

        v13 = v14;
      }
      else
      {
        DPLogHandle_CKRecordError();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v24))
        {
          -[DRSRequest requestID](self, "requestID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v25;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingFileAsset", "No file asset found for %{public}@", buf, 0xCu);

        }
        v13 = 0;
      }

    }
    else
    {
      DPLogHandle_CKRecordError();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        -[DRSSubmitLogToCKContainerRequest debugDescription](self, "debugDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localizedDescription](v7, "localizedDescription");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = CFSTR("Unknown error");
        if (v16)
          v18 = (const __CFString *)v16;
        *(_DWORD *)buf = 138543618;
        v34 = v15;
        v35 = 2114;
        v36 = v18;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedRecordDictionary", "Record dictionary for %{public}@ is malformed: %{public}@", buf, 0x16u);

      }
      v13 = 0;
    }

  }
  else
  {
    DPLogHandle_CKRecordError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      -[DRSRequest requestID](self, "requestID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingFilePaths", "No file paths found for %{public}@", buf, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

uint64_t __74__DRSSubmitLogToCKContainerRequest_CKRecord_Private__recordRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

@end
