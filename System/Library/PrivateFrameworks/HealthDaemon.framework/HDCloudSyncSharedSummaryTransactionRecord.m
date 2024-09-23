@implementation HDCloudSyncSharedSummaryTransactionRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("SharedSummaryTransactionRecordType");
}

+ (BOOL)hasFutureSchema:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && objc_msgSend(v3, "integerValue") > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3 UUID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("SharedSummaryTransactionRecord"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v8, v6);
  return v9;
}

+ (BOOL)isTransactionRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SharedSummaryTransactionRecordType"));

  return v4;
}

- (id)initInZone:(id)a3 UUID:(id)a4 sourceDeviceIdentifier:(id)a5 summaryIdentifiers:(id)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HDCloudSyncSharedSummaryTransactionRecord *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:UUID:", v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("SharedSummaryTransactionRecordType"), v17);
  v19 = -[HDCloudSyncSharedSummaryTransactionRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v18, 1);
  if (v19)
  {
    objc_msgSend(v12, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setUuid:](v19->_underlyingTransactionRecord, "setUuid:", v21);

    v22 = (void *)objc_msgSend(v13, "copy");
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setSourceDeviceIdentifier:](v19->_underlyingTransactionRecord, "setSourceDeviceIdentifier:", v22);

    objc_msgSend(v14, "hk_map:", &__block_literal_global_123);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setSummaryIdentifiers:](v19->_underlyingTransactionRecord, "setSummaryIdentifiers:", v24);

    v25 = (void *)objc_msgSend(v15, "copy");
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setMetadata:](v19->_underlyingTransactionRecord, "setMetadata:", v25);

  }
  return v19;
}

uint64_t __112__HDCloudSyncSharedSummaryTransactionRecord_initInZone_UUID_sourceDeviceIdentifier_summaryIdentifiers_metadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (HDCloudSyncSharedSummaryTransactionRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncSharedSummaryTransactionRecord *v4;
  HDCloudSyncSharedSummaryTransactionRecord *v5;
  void *v6;
  HDCloudSyncCodableSharedSummaryTransactionRecord *v7;
  HDCloudSyncCodableSharedSummaryTransactionRecord *v8;
  NSObject *v9;
  HDCloudSyncSharedSummaryTransactionRecord *v10;
  HDCloudSyncCodableSharedSummaryTransactionRecord *v11;
  HDCloudSyncCodableSharedSummaryTransactionRecord *underlyingTransactionRecord;
  objc_super v14;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryTransactionRecord *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncSharedSummaryTransactionRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v14, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableSharedSummaryTransactionRecord);
    underlyingTransactionRecord = v5->_underlyingTransactionRecord;
    v5->_underlyingTransactionRecord = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableSharedSummaryTransactionRecord initWithData:]([HDCloudSyncCodableSharedSummaryTransactionRecord alloc], "initWithData:", v6);
  v8 = v5->_underlyingTransactionRecord;
  v5->_underlyingTransactionRecord = v7;

  if (v5->_underlyingTransactionRecord)
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
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@: Failed to decode underlying record.", buf, 0xCu);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (NSUUID)UUID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HDCloudSyncCodableSharedSummaryTransactionRecord uuid](self->_underlyingTransactionRecord, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (NSString)sourceDeviceIdentifier
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableSharedSummaryTransactionRecord sourceDeviceIdentifier](self->_underlyingTransactionRecord, "sourceDeviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSArray)summaryIdentifiers
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableSharedSummaryTransactionRecord summaryIdentifiers](self->_underlyingTransactionRecord, "summaryIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_195_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __63__HDCloudSyncSharedSummaryTransactionRecord_summaryIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (NSData)metadata
{
  return -[HDCloudSyncCodableSharedSummaryTransactionRecord metadata](self->_underlyingTransactionRecord, "metadata");
}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableSharedSummaryTransactionRecord data](self->_underlyingTransactionRecord, "data");
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncSharedSummaryTransactionRecord sourceDeviceIdentifier](self, "sourceDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("+ Source Device Identifier: %@\n+--------------------------------------------------"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingTransactionRecord, 0);
}

@end
