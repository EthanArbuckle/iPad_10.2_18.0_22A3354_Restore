@implementation HDCloudSyncStateRecord

- (id)initInZone:(id)a3 recordIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HDCloudSyncStateRecord *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:recordIdentifier:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncStateRecord"), v8);
  v10 = -[HDCloudSyncStateRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v9, 1);

  return v10;
}

- (HDCloudSyncStateRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncStateRecord *v4;
  HDCloudSyncStateRecord *v5;
  void *v6;
  HDCloudSyncCodableState *v7;
  HDCloudSyncCodableState *v8;
  NSObject *v9;
  HDCloudSyncStateRecord *v10;
  HDCloudSyncCodableState *v11;
  HDCloudSyncCodableState *underlyingStateData;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncStateRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableState);
    underlyingStateData = v5->_underlyingStateData;
    v5->_underlyingStateData = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableState initWithData:]([HDCloudSyncCodableState alloc], "initWithData:", v6);
  v8 = v5->_underlyingStateData;
  v5->_underlyingStateData = v7;

  if (v5->_underlyingStateData)
  {
LABEL_8:

LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
  {
    v14[0] = 0;
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying state message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordWithStateData:(id)a3 zoneID:(id)a4 recordIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[HDCloudSyncStateRecord _initWithStateData:zoneID:recordIdentifier:error:]([HDCloudSyncStateRecord alloc], "_initWithStateData:zoneID:recordIdentifier:error:", v11, v10, v9, a6);

  return v12;
}

- (id)_initWithStateData:(id)a3 zoneID:(id)a4 recordIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HDCloudSyncStateRecord *v15;
  void *v16;
  NSObject *v17;
  uint8_t v19[16];

  v10 = a3;
  v11 = a5;
  v12 = a4;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:recordIdentifier:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncStateRecord"), v13);
  v15 = -[HDCloudSyncStateRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v14, 1);
  if (v15)
  {
    if ((unint64_t)objc_msgSend(v10, "length") >> 20)
    {
      -[HDCloudSyncStateRecord _createAssetWithStateData:error:](v15, "_createAssetWithStateData:error:", v10, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("CloudSyncStateAsset"));
      }
      else
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_fault_impl(&dword_1B7802000, v17, OS_LOG_TYPE_FAULT, "Unable to create CKAsset for State Sync record", v19, 2u);
        }
      }

    }
    else
    {
      -[HDCloudSyncCodableState setStateData:](v15->_underlyingStateData, "setStateData:", v10);
    }
  }

  return v15;
}

- (id)_createAssetWithStateData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v6, "temporaryDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HDAssetFileHandleForFileURL(v10, v6, (uint64_t)a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "writeData:error:", v5, a4))
  {
    v13 = _HDIsUnitTesting;
    v14 = objc_alloc(MEMORY[0x1E0C94BB8]);
    if (v13)
      v15 = objc_msgSend(v14, "initWithFileURL:", v10);
    else
      v15 = objc_msgSend(v14, "initWithFileDescriptor:", objc_msgSend(v12, "fileDescriptor"));
    v16 = (void *)v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)isStateRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncStateRecord"));

  return v4;
}

+ (id)recordIDWithZoneID:(id)a3 recordIdentifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("CloudSyncState"), CFSTR("/"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v7, v6);

  return v8;
}

- (NSString)key
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  HDCloudSyncStateRecord *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncRecord record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 2)
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      v10 = 138412290;
      v11 = self;
      _os_log_fault_impl(&dword_1B7802000, v8, OS_LOG_TYPE_FAULT, "Error fetching key from State Sync record %@", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return (NSString *)v7;
}

- (void)setStateData:(id)a3
{
  -[HDCloudSyncCodableState setStateData:](self->_underlyingStateData, "setStateData:", a3);
}

- (NSData)stateData
{
  return -[HDCloudSyncCodableState stateData](self->_underlyingStateData, "stateData");
}

- (BOOL)hasStateData
{
  return -[HDCloudSyncCodableState hasStateData](self->_underlyingStateData, "hasStateData");
}

- (NSURL)stateDataAssetURL
{
  void *v2;
  void *v3;
  void *v4;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CloudSyncStateAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (void)updateStateData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  HDCloudSyncStateRecord *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") <= 0x100000)
  {
    -[HDCloudSyncCodableState setStateData:](self->_underlyingStateData, "setStateData:", v4);

    -[HDCloudSyncRecord record](self, "record");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("CloudSyncStateAsset"));

  }
  else
  {
    v11 = 0;
    -[HDCloudSyncStateRecord _createAssetWithStateData:error:](self, "_createAssetWithStateData:error:", v4, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    v7 = v6;
    if (v5 || !v6)
    {
      -[HDCloudSyncRecord record](self, "record");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("CloudSyncStateAsset"));

      -[HDCloudSyncCodableState setStateData:](self->_underlyingStateData, "setStateData:", 0);
    }
    else
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v13 = self;
        v14 = 2114;
        v15 = v7;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update asset on HDCloudSyncStateRecord, %{public}@", buf, 0x16u);
      }
    }

  }
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (BOOL)requiresEncryptedSchemaVersion
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("CloudSyncStateRecord");
}

+ (BOOL)hasFutureSchema:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "encryptedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 && objc_msgSend(v4, "integerValue") > 1;
  return v5;
}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableState data](self->_underlyingStateData, "data");
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingStateData, 0);
}

@end
