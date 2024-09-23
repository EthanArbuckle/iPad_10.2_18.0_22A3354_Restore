@implementation HDCloudSyncDeviceKeyValueRecord

+ (BOOL)isDeviceKeyValueRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncDeviceKeyValueRecordType"));

  return v4;
}

+ (BOOL)isDeviceKeyValueRecordID:(id)a3
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
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CloudSyncDeviceKeyValueRecord"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)deviceContextRecordID
{
  void *v2;
  void *v3;
  void *v4;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HDCloudSyncDeviceContextRecordReference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fieldsForUnprotectedSerialization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCloudSyncDeviceKeyValueRecord;
  objc_msgSendSuper2(&v8, sel_fieldsForUnprotectedSerialization);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("HDCloudSyncDeviceContextRecordReference"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)initInZone:(id)a3 deviceKeyValueEntry:(id)a4 deviceContextRecord:(id)a5 UUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  HDCloudSyncDeviceKeyValueRecord *v22;
  HDCloudSyncDeviceKeyValueRecord *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_opt_self();
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("CloudSyncDeviceKeyValueRecord"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v16, v13);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncDeviceKeyValueRecordType"), v17);
  v31 = 0;
  objc_msgSend(v11, "deviceContextWithError:", &v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v31;
  if (v20)
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v20;
      _os_log_fault_impl(&dword_1B7802000, v21, OS_LOG_TYPE_FAULT, "Error %@ fetching device context from record", buf, 0xCu);
    }
    v22 = 0;
  }
  else
  {
    v23 = -[HDCloudSyncDeviceKeyValueRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v18, 1);
    if (v23)
    {
      v24 = objc_alloc(MEMORY[0x1E0C950C0]);
      objc_msgSend(v11, "record");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "recordID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v24, "initWithRecordID:action:", v26, 1);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, CFSTR("HDCloudSyncDeviceContextRecordReference"));

      objc_msgSend(v19, "syncIdentity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "codableSyncIdentity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncCodableDeviceKeyValue setSyncIdentity:](v23->_underlyingDeviceKeyValue, "setSyncIdentity:", v29);

      setUnderlyingDeviceKeyValue(v23->_underlyingDeviceKeyValue, v10);
    }
    self = v23;
    v22 = self;
  }

  return v22;
}

- (HDCloudSyncDeviceKeyValueRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncDeviceKeyValueRecord *v4;
  HDCloudSyncDeviceKeyValueRecord *v5;
  void *v6;
  HDCloudSyncCodableDeviceKeyValue *v7;
  HDCloudSyncCodableDeviceKeyValue *v8;
  NSObject *v9;
  HDCloudSyncDeviceKeyValueRecord *v10;
  HDCloudSyncCodableDeviceKeyValue *v11;
  HDCloudSyncCodableDeviceKeyValue *underlyingDeviceKeyValue;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncDeviceKeyValueRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableDeviceKeyValue);
    underlyingDeviceKeyValue = v5->_underlyingDeviceKeyValue;
    v5->_underlyingDeviceKeyValue = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableDeviceKeyValue initWithData:]([HDCloudSyncCodableDeviceKeyValue alloc], "initWithData:", v6);
  v8 = v5->_underlyingDeviceKeyValue;
  v5->_underlyingDeviceKeyValue = v7;

  if (v5->_underlyingDeviceKeyValue)
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
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying key value entry message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (id)syncIdentity
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncCodableDeviceKeyValue syncIdentity](self->_underlyingDeviceKeyValue, "syncIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v3)
  {
    v5 = v3;
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "Failed to extract sync identity from codable %@", buf, 0xCu);
    }
  }

  return v3;
}

- (void)updateDeviceKeyValueEntry:(id)a3
{
  setUnderlyingDeviceKeyValue(self->_underlyingDeviceKeyValue, a3);
}

- (id)codableDeviceKeyValueEntry
{
  return self->_underlyingDeviceKeyValue;
}

- (id)deviceKeyValueEntry:(id *)a3
{
  void *v5;
  void *v6;
  HDDeviceKeyValueStorageEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDDeviceKeyValueStorageEntry *v13;
  void *v14;
  const __CFString *v15;

  if (-[HDCloudSyncCodableDeviceKeyValue hasKey](self->_underlyingDeviceKeyValue, "hasKey"))
  {
    if (-[HDCloudSyncCodableDeviceKeyValue hasValue](self->_underlyingDeviceKeyValue, "hasValue"))
    {
      if (-[HDCloudSyncCodableDeviceKeyValue hasDomain](self->_underlyingDeviceKeyValue, "hasDomain"))
      {
        if (-[HDCloudSyncCodableDeviceKeyValue hasModificationDate](self->_underlyingDeviceKeyValue, "hasModificationDate"))
        {
          if (-[HDCloudSyncCodableDeviceKeyValue hasSyncIdentity](self->_underlyingDeviceKeyValue, "hasSyncIdentity"))
          {
            -[HDCloudSyncCodableDeviceKeyValue syncIdentity](self->_underlyingDeviceKeyValue, "syncIdentity");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v5, a3);
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            if (v6)
            {
              if (-[HDCloudSyncCodableDeviceKeyValue hasProtectionCategory](self->_underlyingDeviceKeyValue, "hasProtectionCategory"))
              {
                v7 = [HDDeviceKeyValueStorageEntry alloc];
                -[HDCloudSyncCodableDeviceKeyValue domain](self->_underlyingDeviceKeyValue, "domain");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCloudSyncCodableDeviceKeyValue key](self->_underlyingDeviceKeyValue, "key");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDCloudSyncCodableDeviceKeyValue value](self->_underlyingDeviceKeyValue, "value");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = (void *)MEMORY[0x1E0C99D68];
                -[HDCloudSyncCodableDeviceKeyValue modificationDate](self->_underlyingDeviceKeyValue, "modificationDate");
                objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = -[HDDeviceKeyValueStorageEntry initWithDomain:key:value:modificationDate:syncIdentity:category:](v7, "initWithDomain:key:value:modificationDate:syncIdentity:category:", v8, v9, v10, v12, v6, -[HDCloudSyncCodableDeviceKeyValue protectionCategory](self->_underlyingDeviceKeyValue, "protectionCategory"));

LABEL_18:
                return v13;
              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Error extracting device key value storage entry from record due to missing protection category"));
            }
            v13 = 0;
            goto LABEL_18;
          }
          v14 = (void *)MEMORY[0x1E0CB35C8];
          v15 = CFSTR("Error extracting device key value storage entry from record due to missing sync identity");
        }
        else
        {
          v14 = (void *)MEMORY[0x1E0CB35C8];
          v15 = CFSTR("Error extracting device key value storage entry from record due to missing modification date");
        }
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = CFSTR("Error extracting device key value storage entry from record due to missing domain");
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("Error extracting device key value storage entry from record due to missing value");
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Error extracting device key value storage entry from record due to missing key");
  }
  objc_msgSend(v14, "hk_assignError:code:format:", a3, 3, v15);
  v13 = 0;
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
  return CFSTR("CloudSyncDeviceKeyValueRecordType");
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
  return (id)-[HDCloudSyncCodableDeviceKeyValue data](self->_underlyingDeviceKeyValue, "data");
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncCodableDeviceKeyValue key](self->_underlyingDeviceKeyValue, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableDeviceKeyValue value](self->_underlyingDeviceKeyValue, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableDeviceKeyValue modificationDate](self->_underlyingDeviceKeyValue, "modificationDate");
  HDDecodeDateForValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("+ Key: %@\n+ Value: %@\n+ Modification date: %@\n+--------------------------------------------------"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HDCloudSyncDeviceKeyValueRecord *v4;
  HDCloudSyncDeviceKeyValueRecord *v5;
  HDCloudSyncCodableDeviceKeyValue *underlyingDeviceKeyValue;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HDCloudSyncDeviceKeyValueRecord *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      underlyingDeviceKeyValue = self->_underlyingDeviceKeyValue;
      -[HDCloudSyncDeviceKeyValueRecord underlyingDeviceKeyValue](v5, "underlyingDeviceKeyValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HDCloudSyncCodableDeviceKeyValue isEqual:](underlyingDeviceKeyValue, "isEqual:", v7))
      {
        -[HDCloudSyncRecord record](self, "record");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HDCloudSyncDeviceContextRecordReference"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncRecord record](v5, "record");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HDCloudSyncDeviceContextRecordReference"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (HDCloudSyncCodableDeviceKeyValue)underlyingDeviceKeyValue
{
  return self->_underlyingDeviceKeyValue;
}

- (void)setUnderlyingDeviceKeyValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDeviceKeyValue, 0);
}

@end
