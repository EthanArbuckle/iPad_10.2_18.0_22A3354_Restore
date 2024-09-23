@implementation HDCloudSyncSharedSummaryRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("SharedSummaryRecordType");
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
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("SharedSummaryRecord"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v8, v6);
  return v9;
}

+ (BOOL)isSummaryRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SharedSummaryRecordType"));

  return v4;
}

- (id)initInZone:(id)a3 UUID:(id)a4 package:(id)a5 name:(id)a6 version:(id)a7 compatibilityVersion:(id)a8 objectTypes:(id)a9 authorizationIdentifiers:(id)a10 summaryData:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  HDCloudSyncSharedSummaryRecord *v24;
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
  id v36;
  id v37;
  id v38;
  id v39;

  v17 = a4;
  v39 = a5;
  v38 = a6;
  v37 = a7;
  v36 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:UUID:", v21, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("SharedSummaryRecordType"), v22);
  v24 = -[HDCloudSyncSharedSummaryRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v23, 1);
  if (v24)
  {
    objc_msgSend(v17, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    -[HDCloudSyncCodableSharedSummaryRecord setUuid:](v24->_underlyingSummaryRecord, "setUuid:", v26);

    v27 = (void *)objc_msgSend(v39, "copy");
    -[HDCloudSyncCodableSharedSummaryRecord setPackage:](v24->_underlyingSummaryRecord, "setPackage:", v27);

    v28 = (void *)objc_msgSend(v38, "copy");
    -[HDCloudSyncCodableSharedSummaryRecord setName:](v24->_underlyingSummaryRecord, "setName:", v28);

    v29 = (void *)objc_msgSend(v37, "copy");
    -[HDCloudSyncCodableSharedSummaryRecord setVersion:](v24->_underlyingSummaryRecord, "setVersion:", v29);

    v30 = (void *)objc_msgSend(v36, "copy");
    -[HDCloudSyncCodableSharedSummaryRecord setCompatibilityVersion:](v24->_underlyingSummaryRecord, "setCompatibilityVersion:", v30);

    objc_msgSend(v18, "hk_map:", &__block_literal_global_205);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "mutableCopy");
    -[HDCloudSyncCodableSharedSummaryRecord setObjectTypeIdentifiers:](v24->_underlyingSummaryRecord, "setObjectTypeIdentifiers:", v32);

    v33 = (void *)objc_msgSend(v19, "copy");
    -[HDCloudSyncCodableSharedSummaryRecord setAuthorizationCategories:](v24->_underlyingSummaryRecord, "setAuthorizationCategories:", v33);

    v34 = (void *)objc_msgSend(v20, "copy");
    -[HDCloudSyncCodableSharedSummaryRecord setSummaryData:](v24->_underlyingSummaryRecord, "setSummaryData:", v34);

  }
  return v24;
}

uint64_t __141__HDCloudSyncSharedSummaryRecord_initInZone_UUID_package_name_version_compatibilityVersion_objectTypes_authorizationIdentifiers_summaryData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (HDCloudSyncSharedSummaryRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncSharedSummaryRecord *v4;
  HDCloudSyncSharedSummaryRecord *v5;
  void *v6;
  HDCloudSyncCodableSharedSummaryRecord *v7;
  HDCloudSyncCodableSharedSummaryRecord *v8;
  NSObject *v9;
  HDCloudSyncSharedSummaryRecord *v10;
  HDCloudSyncCodableSharedSummaryRecord *v11;
  HDCloudSyncCodableSharedSummaryRecord *underlyingSummaryRecord;
  objc_super v14;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryRecord *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncSharedSummaryRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v14, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableSharedSummaryRecord);
    underlyingSummaryRecord = v5->_underlyingSummaryRecord;
    v5->_underlyingSummaryRecord = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableSharedSummaryRecord initWithData:]([HDCloudSyncCodableSharedSummaryRecord alloc], "initWithData:", v6);
  v8 = v5->_underlyingSummaryRecord;
  v5->_underlyingSummaryRecord = v7;

  if (v5->_underlyingSummaryRecord)
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
  -[HDCloudSyncCodableSharedSummaryRecord uuid](self->_underlyingSummaryRecord, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (NSString)package
{
  return -[HDCloudSyncCodableSharedSummaryRecord package](self->_underlyingSummaryRecord, "package");
}

- (NSString)name
{
  return -[HDCloudSyncCodableSharedSummaryRecord name](self->_underlyingSummaryRecord, "name");
}

- (NSString)version
{
  return -[HDCloudSyncCodableSharedSummaryRecord version](self->_underlyingSummaryRecord, "version");
}

- (NSString)compatibilityVersion
{
  return -[HDCloudSyncCodableSharedSummaryRecord compatibilityVersion](self->_underlyingSummaryRecord, "compatibilityVersion");
}

- (NSArray)objectTypes
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableSharedSummaryRecord objectTypeIdentifiers](self->_underlyingSummaryRecord, "objectTypeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_195_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __45__HDCloudSyncSharedSummaryRecord_objectTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6978], "_typeWithIdentifier:", a2);
}

- (NSArray)authorizationIdentifiers
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableSharedSummaryRecord authorizationCategories](self->_underlyingSummaryRecord, "authorizationCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSData)summaryData
{
  return -[HDCloudSyncCodableSharedSummaryRecord summaryData](self->_underlyingSummaryRecord, "summaryData");
}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableSharedSummaryRecord data](self->_underlyingSummaryRecord, "data");
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncSharedSummaryRecord name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryRecord package](self, "package");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryRecord version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryRecord compatibilityVersion](self, "compatibilityVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSharedSummaryRecord authorizationIdentifiers](self, "authorizationIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("+ Name: %@\n| Package: %@\n| Version: %@\n| Compatibility Version: %@\n| Authorization Identifiers: %@\n+--------------------------------------------------"), v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSummaryRecord, 0);
}

@end
