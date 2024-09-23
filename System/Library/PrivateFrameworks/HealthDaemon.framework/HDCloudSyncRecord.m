@implementation HDCloudSyncRecord

- (HDCloudSyncRecord)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDCloudSyncRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  id v7;
  HDCloudSyncRecord *v8;
  HDCloudSyncRecord *v9;
  void **p_record;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncRecord;
  v8 = -[HDCloudSyncRecord init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    p_record = (void **)&v8->_record;
    objc_storeStrong((id *)&v8->_record, a3);
    v11 = objc_msgSend((id)objc_opt_class(), "requiresEncryptedSchemaVersion");
    -[CKRecord allKeys](v9->_record, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = *p_record;
      if (v11)
      {
        objc_msgSend(v14, "encryptedValues");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Version"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_10;
      }
      else
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Version"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_10;
      }
      if (objc_msgSend(v16, "integerValue") == a4)
      {
LABEL_11:

        goto LABEL_14;
      }
LABEL_10:

      v9 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *p_record;
    if (v11)
    {
      objc_msgSend(v18, "encryptedValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("Version"));

    }
    else
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("Version"));
    }

    v9->_unsaved = 1;
  }
LABEL_14:

  return v9;
}

+ (id)initWithSerializedRecord:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C95048];
  objc_msgSend(v7, "systemData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hd_recordWithSystemData:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "fieldsForUnprotectedSerialization");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v7, "unprotectedDBData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("serializedRecord.unprotectedDBData"), objc_opt_class(), a2, CFSTR("Class requires unprotected serialized data but none is present in the serialized record."));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v15);
          else
            _HKLogDroppedError();
        }

        goto LABEL_21;
      }
      objc_msgSend(v7, "unprotectedDBData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[HDCloudSyncRecord _deserializeData:record:fields:error:]((uint64_t)a1, v13, v10, v11, (uint64_t)a4);

      if (!v14)
      {
        v21 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    objc_msgSend(a1, "fieldsForProtectedSerialization");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "count"))
    {
LABEL_8:
      objc_msgSend(v10, "valueStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resetChangedKeys");

      objc_msgSend(v10, "encryptedValueStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "resetChangedKeys");

      objc_msgSend(a1, "recordWithCKRecord:error:", v10, a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v7, "protectedDBData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "protectedDBData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[HDCloudSyncRecord _deserializeData:record:fields:error:]((uint64_t)a1, v17, v10, v15, (uint64_t)a4);

      if (v18)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("serializedRecord.protectedDBData"), objc_opt_class(), a2, CFSTR("Class requires protected serialized data but none is present in the serialized record."));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v22);
        else
          _HKLogDroppedError();
      }

    }
LABEL_21:
    v21 = 0;
    goto LABEL_22;
  }
  v21 = 0;
LABEL_24:

  return v21;
}

+ (BOOL)_deserializeData:(void *)a3 record:(void *)a4 fields:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_opt_self();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, a5);
  if (v11)
  {
    v24 = v10;
    v25 = v8;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v17, "classes", v24, v25, (_QWORD)v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "key");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "encrypted"))
          {
            objc_msgSend(v9, "encryptedValues");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "key");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

          }
          else
          {
            objc_msgSend(v17, "key");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, v21);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    objc_msgSend(v11, "finishDecoding");
    v10 = v24;
    v8 = v25;
  }

  return v11 != 0;
}

- (BOOL)validateWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[HDCloudSyncRecord record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend((id)objc_opt_class(), "recordWithCKRecord:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  if (!-[HDCloudSyncRecord isEqual:](self, "isEqual:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 709, CFSTR("Validation failed for %@; does not compare equal after inflation to %@"),
      self,
      v7);
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

- (CKRecord)record
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CKRecord *v7;

  -[HDCloudSyncRecord serializeUnderlyingMessage](self, "serializeUnderlyingMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord underlyingMessage](self, "underlyingMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != v3 && (!v3 || (objc_msgSend(v4, "isEqual:", v3) & 1) == 0))
  {
    -[CKRecord encryptedValues](self->_record, "encryptedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("UnderlyingMessage"));

  }
  v7 = self->_record;

  return v7;
}

- (CKRecordID)recordID
{
  return -[CKRecord recordID](self->_record, "recordID");
}

- (int64_t)schemaVersion
{
  int v3;
  CKRecord *record;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  int64_t v12;
  NSObject *v13;
  CKRecord *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  CKRecord *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "requiresEncryptedSchemaVersion");
  record = self->_record;
  v5 = objc_opt_class();
  if (v3)
  {
    v18 = 0;
    v6 = (id *)&v18;
    -[CKRecord hd_requiredEncryptedValueForKey:type:error:](record, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("Version"), v5, &v18);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
    v6 = (id *)&v17;
    -[CKRecord hd_requiredValueForKey:type:error:](record, "hd_requiredValueForKey:type:error:", CFSTR("Version"), v5, &v17);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  v9 = *v6;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    v12 = objc_msgSend(v8, "integerValue");
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      v16 = self->_record;
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v10;
      _os_log_fault_impl(&dword_1B7802000, v13, OS_LOG_TYPE_FAULT, "Failed to find schema version in record %{public}@: %{public}@", buf, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

- (NSData)underlyingMessage
{
  void *v3;
  void *v4;
  CKRecord *record;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  CKRecord *v12;
  id v13;
  uint8_t buf[4];
  CKRecord *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CKRecord encryptedValues](self->_record, "encryptedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UnderlyingMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    record = self->_record;
    v13 = 0;
    -[CKRecord hd_requiredEncryptedValueForKey:type:error:](record, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("UnderlyingMessage"), objc_opt_class(), &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v8 = v7;
    if (v6)
      v9 = 1;
    else
      v9 = v7 == 0;
    if (!v9)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v12 = self->_record;
        *(_DWORD *)buf = 138543618;
        v15 = v12;
        v16 = 2114;
        v17 = v8;
        _os_log_fault_impl(&dword_1B7802000, v10, OS_LOG_TYPE_FAULT, "Failed to find underlying message in record %{public}@: %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    v6 = 0;
  }
  return (NSData *)v6;
}

- (id)serializeUnderlyingMessage
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCloudSyncRecord record](self, "record");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "record");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hd_equivalentRecord:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v7 = a3;
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = objc_opt_class();
    objc_msgSend(v7, "recordType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("record"), v14, a2, CFSTR("record has type (%@), but expected (%@)"), v15, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v17);
      else
        _HKLogDroppedError();
    }

    goto LABEL_14;
  }
  v11 = objc_msgSend((id)objc_opt_class(), "requiresEncryptedSchemaVersion");
  v12 = objc_opt_class();
  if (v11)
    objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("Version"), v12, a4);
  else
    objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("Version"), v12, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  if (!objc_msgSend(a1, "requiresUnderlyingMessage")
    || (objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("UnderlyingMessage"), objc_opt_class(), a4), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v7, objc_msgSend(v15, "integerValue"));
  }
LABEL_15:

  return v18;
}

+ (BOOL)requiresUnderlyingMessage
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)recordType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)hasFutureSchema:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)requiresEncryptedSchemaVersion
{
  return 0;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HDCloudSyncSerializedRecord *v11;

  -[HDCloudSyncRecord record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hd_systemData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fieldsForUnprotectedSerialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[HDCloudSyncRecord record](self, "record");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCloudSyncRecord _serializeRecord:fields:]((uint64_t)HDCloudSyncRecord, v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "fieldsForProtectedSerialization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[HDCloudSyncRecord record](self, "record");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCloudSyncRecord _serializeRecord:fields:]((uint64_t)HDCloudSyncRecord, v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = -[HDCloudSyncSerializedRecord initWithEncodedSystemData:unprotectedDBData:protectedDBData:]([HDCloudSyncSerializedRecord alloc], "initWithEncodedSystemData:unprotectedDBData:protectedDBData:", v4, v7, v10);

  return v11;
}

+ (id)_serializeRecord:(void *)a3 fields:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v12, "encrypted", (_QWORD)v19) & 1) != 0)
        {
          objc_msgSend(v4, "encryptedValues");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v12, "key");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v12, "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encodeObject:forKey:", v15, v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "finishEncoding");
  objc_msgSend(v6, "encodedData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)fieldsForUnprotectedSerialization
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "shouldSerializeUnderlyingMessageAsProtected");
  v3 = objc_opt_class();
  if (v2)
  {
    v13 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("Version"), v4, objc_msgSend((id)objc_opt_class(), "requiresEncryptedSchemaVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("Version"), v4, objc_msgSend((id)objc_opt_class(), "requiresEncryptedSchemaVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v10 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("UnderlyingMessage"), v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)fieldsForProtectedSerialization
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "shouldSerializeUnderlyingMessageAsProtected"))
    return MEMORY[0x1E0C9AA60];
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("UnderlyingMessage"), v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 0;
}

- (id)printDescription
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return &stru_1E6D11BB8;
}

- (BOOL)repaired
{
  return self->_repaired;
}

- (void)setRepaired:(BOOL)a3
{
  self->_repaired = a3;
}

- (BOOL)unsaved
{
  return self->_unsaved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
}

@end
