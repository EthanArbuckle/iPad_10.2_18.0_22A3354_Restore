@implementation HDCloudSyncDeviceContextRecord

+ (BOOL)isDeviceContextRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncDeviceContextRecordType"));

  return v4;
}

+ (BOOL)isDeviceContextRecordID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CloudSyncDeviceContextRecord"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)recordIDWithZoneID:(id)a3 syncIdentity:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(a4, "identityString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("CloudSyncDeviceContextRecord"), CFSTR("/"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v8, v6);
  return v9;
}

- (id)initInZone:(id)a3 deviceContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HDCloudSyncDeviceContextRecord *v11;
  HDCloudSyncDeviceContextRecord *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "syncIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncDeviceContextRecord recordIDWithZoneID:syncIdentity:](HDCloudSyncDeviceContextRecord, "recordIDWithZoneID:syncIdentity:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncDeviceContextRecordType"), v9);
  v11 = -[HDCloudSyncDeviceContextRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v10, 1);
  v12 = v11;
  if (v11)
    setUnderlyingDeviceContext(v11->_underlyingDeviceContext, v6);

  return v12;
}

- (id)deviceContextWithError:(id *)a3
{
  void *v5;
  void *v6;
  HDDeviceContext *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDDeviceContext *v14;
  NSObject *v15;
  _BYTE v17[24];
  uint8_t buf[16];

  -[HDCloudSyncCodableDeviceContext syncIdentity](self->_underlyingDeviceContext, "syncIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HDDeviceContext alloc];
    v8 = -[HDCloudSyncCodableDeviceContext type](self->_underlyingDeviceContext, "type");
    -[HDCloudSyncCodableDeviceContext productTypeName](self->_underlyingDeviceContext, "productTypeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableDeviceContext currentOSName](self->_underlyingDeviceContext, "currentOSName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableDeviceContext currentOSVersion](self->_underlyingDeviceContext, "currentOSVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKNSOperatingSystemVersionFromString();
    v12 = (void *)MEMORY[0x1E0C99D68];
    -[HDCloudSyncCodableDeviceContext modificationDate](self->_underlyingDeviceContext, "modificationDate");
    objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDDeviceContext initWithType:productTypeName:currentOSName:currentOSVersion:modificationDate:syncIdentity:](v7, "initWithType:productTypeName:currentOSName:currentOSVersion:modificationDate:syncIdentity:", v8, v9, v10, v17, v13, v6);

  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B7802000, v15, OS_LOG_TYPE_FAULT, "Failed to decode sync identity from its codable.", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (HDCloudSyncDeviceContextRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncDeviceContextRecord *v4;
  HDCloudSyncDeviceContextRecord *v5;
  void *v6;
  HDCloudSyncCodableDeviceContext *v7;
  HDCloudSyncCodableDeviceContext *v8;
  NSObject *v9;
  HDCloudSyncDeviceContextRecord *v10;
  HDCloudSyncCodableDeviceContext *v11;
  HDCloudSyncCodableDeviceContext *underlyingDeviceContext;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncDeviceContextRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableDeviceContext);
    underlyingDeviceContext = v5->_underlyingDeviceContext;
    v5->_underlyingDeviceContext = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableDeviceContext initWithData:]([HDCloudSyncCodableDeviceContext alloc], "initWithData:", v6);
  v8 = v5->_underlyingDeviceContext;
  v5->_underlyingDeviceContext = v7;

  if (v5->_underlyingDeviceContext)
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
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying device context message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (void)updateDeviceContextWithContext:(id)a3
{
  setUnderlyingDeviceContext(self->_underlyingDeviceContext, a3);
}

- (id)codableDeviceContext
{
  return self->_underlyingDeviceContext;
}

- (id)deviceContext:(id *)a3
{
  void *v5;
  void *v6;
  HDDeviceContext *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDDeviceContext *v13;
  void *v14;
  const __CFString *v15;
  _BYTE v17[24];

  if (!-[HDCloudSyncCodableDeviceContext hasCurrentOSName](self->_underlyingDeviceContext, "hasCurrentOSName"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Missing OS Name");
LABEL_11:
    objc_msgSend(v14, "hk_assignError:code:format:", a3, 3, v15);
    v13 = 0;
    return v13;
  }
  if (!-[HDCloudSyncCodableDeviceContext hasCurrentOSVersion](self->_underlyingDeviceContext, "hasCurrentOSVersion"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Missing OS Version");
    goto LABEL_11;
  }
  if (!-[HDCloudSyncCodableDeviceContext hasProductTypeName](self->_underlyingDeviceContext, "hasProductTypeName"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Missing Product type name");
    goto LABEL_11;
  }
  if (!-[HDCloudSyncCodableDeviceContext hasModificationDate](self->_underlyingDeviceContext, "hasModificationDate"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Missing modification date");
    goto LABEL_11;
  }
  -[HDCloudSyncCodableDeviceContext syncIdentity](self->_underlyingDeviceContext, "syncIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HDDeviceContext alloc];
    v8 = -[HDCloudSyncCodableDeviceContext type](self->_underlyingDeviceContext, "type");
    -[HDCloudSyncCodableDeviceContext productTypeName](self->_underlyingDeviceContext, "productTypeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableDeviceContext currentOSName](self->_underlyingDeviceContext, "currentOSName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableDeviceContext currentOSVersion](self->_underlyingDeviceContext, "currentOSVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKNSOperatingSystemVersionFromString();
    -[HDCloudSyncCodableDeviceContext modificationDate](self->_underlyingDeviceContext, "modificationDate");
    HDDecodeDateForValue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HDDeviceContext initWithType:productTypeName:currentOSName:currentOSVersion:modificationDate:syncIdentity:](v7, "initWithType:productTypeName:currentOSName:currentOSVersion:modificationDate:syncIdentity:", v8, v9, v10, v17, v12, v6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
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
  return CFSTR("CloudSyncDeviceContextRecordType");
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
  return (id)-[HDCloudSyncCodableDeviceContext data](self->_underlyingDeviceContext, "data");
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  -[HDCloudSyncCodableDeviceContext syncIdentity](self->_underlyingDeviceContext, "syncIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncCodableDeviceContext productTypeName](self->_underlyingDeviceContext, "productTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableDeviceContext currentOSVersion](self->_underlyingDeviceContext, "currentOSVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableDeviceContext currentOSName](self->_underlyingDeviceContext, "currentOSName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableDeviceContext modificationDate](self->_underlyingDeviceContext, "modificationDate");

  HDDecodeDateForValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("+ Product Type Name: %@\n+ Current OS Version: %@\n+ Current OS Name: %@\n+ Sync identity: %@\n+ Modification date: %@\n+--------------------------------------------------"), v7, v8, v9, v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)unitTest_recordWithRandomIDInZone:(id)a3 deviceContext:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("CloudSyncDeviceContextRecord"), CFSTR("/"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v12, v9);
  v14 = objc_alloc((Class)a1);
  v15 = v8;
  if (v14)
  {
    v16 = (objc_class *)MEMORY[0x1E0C95048];
    v17 = v13;
    v18 = (void *)objc_msgSend([v16 alloc], "initWithRecordType:recordID:", CFSTR("CloudSyncDeviceContextRecordType"), v17);

    v19 = objc_msgSend(v14, "initWithCKRecord:schemaVersion:", v18, 1);
    v20 = (void *)v19;
    if (v19)
      setUnderlyingDeviceContext(*(void **)(v19 + 24), v15);
    v14 = v20;

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDeviceContext, 0);
}

@end
