@implementation HDCloudSyncSharedSummaryAuthorizationRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("SharedSummaryAuthorizationRecordType");
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
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("SharedSummaryAuthorizationRecord"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v8, v6);
  return v9;
}

+ (BOOL)isAuthorizationRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SharedSummaryAuthorizationRecordType"));

  return v4;
}

- (id)initInZone:(id)a3 UUID:(id)a4 authorizationIdentifiers:(id)a5 participantRecord:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HDCloudSyncSharedSummaryAuthorizationRecord *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:UUID:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("SharedSummaryAuthorizationRecordType"), v14);
  v16 = -[HDCloudSyncSharedSummaryAuthorizationRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v15, 1);
  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0C950C0]);
    objc_msgSend(v12, "record");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithRecordID:action:", v19, 1);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("ParticipantRecord"));

    objc_msgSend(v10, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    -[HDCloudSyncCodableSharedSummaryAuthorizationRecord setUuid:](v16->_underlyingAuthorizationRecord, "setUuid:", v22);

    v23 = (void *)objc_msgSend(v11, "copy");
    -[HDCloudSyncCodableSharedSummaryAuthorizationRecord setAuthorizationCategories:](v16->_underlyingAuthorizationRecord, "setAuthorizationCategories:", v23);

  }
  return v16;
}

- (HDCloudSyncSharedSummaryAuthorizationRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncSharedSummaryAuthorizationRecord *v4;
  HDCloudSyncSharedSummaryAuthorizationRecord *v5;
  void *v6;
  HDCloudSyncCodableSharedSummaryAuthorizationRecord *v7;
  HDCloudSyncCodableSharedSummaryAuthorizationRecord *v8;
  NSObject *v9;
  HDCloudSyncSharedSummaryAuthorizationRecord *v10;
  HDCloudSyncCodableSharedSummaryAuthorizationRecord *v11;
  HDCloudSyncCodableSharedSummaryAuthorizationRecord *underlyingAuthorizationRecord;
  objc_super v14;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryAuthorizationRecord *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncSharedSummaryAuthorizationRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v14, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableSharedSummaryAuthorizationRecord);
    underlyingAuthorizationRecord = v5->_underlyingAuthorizationRecord;
    v5->_underlyingAuthorizationRecord = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableSharedSummaryAuthorizationRecord initWithData:]([HDCloudSyncCodableSharedSummaryAuthorizationRecord alloc], "initWithData:", v6);
  v8 = v5->_underlyingAuthorizationRecord;
  v5->_underlyingAuthorizationRecord = v7;

  if (v5->_underlyingAuthorizationRecord)
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
  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord uuid](self->_underlyingAuthorizationRecord, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (NSArray)authorizationIdentifiers
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord authorizationCategories](self->_underlyingAuthorizationRecord, "authorizationCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (CKRecordID)participantRecordID
{
  void *v2;
  void *v3;
  void *v4;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ParticipantRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordID *)v4;
}

- (void)updateAuthorizationWithIdentifiersToAdd:(id)a3 identifiersToDelete:(id)a4
{
  HDCloudSyncCodableSharedSummaryAuthorizationRecord *underlyingAuthorizationRecord;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  underlyingAuthorizationRecord = self->_underlyingAuthorizationRecord;
  v7 = a4;
  v8 = a3;
  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord authorizationCategories](underlyingAuthorizationRecord, "authorizationCategories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSharedSummaryMergeAuthorizationIdentifiers((uint64_t)v9, v8, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v11, "mutableCopy");
  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord setAuthorizationCategories:](self->_underlyingAuthorizationRecord, "setAuthorizationCategories:", v10);

}

- (void)replaceAuthorizationIdentifiers:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord setAuthorizationCategories:](self->_underlyingAuthorizationRecord, "setAuthorizationCategories:", v4);

}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableSharedSummaryAuthorizationRecord data](self->_underlyingAuthorizationRecord, "data");
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;

  v7 = a3;
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = objc_opt_class();
    objc_msgSend(v7, "recordType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("record has type (%@), but expected (%@)");
    v24 = v11;
    v25 = v14;
    v19 = v16;
    v20 = v17;
    goto LABEL_9;
  }
  objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("Version"), objc_opt_class(), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!objc_msgSend(a1, "requiresUnderlyingMessage")
      || (objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("UnderlyingMessage"), objc_opt_class(), a4), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("ParticipantRecord"), objc_opt_class(), a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
      {
LABEL_15:
        v15 = 0;
        goto LABEL_16;
      }
      if (objc_msgSend(v13, "referenceAction") == 1)
      {
        v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v7, objc_msgSend(v11, "integerValue"));
LABEL_16:

        goto LABEL_17;
      }
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v20 = objc_opt_class();
      v18 = CFSTR("record reference to parent does not have correct reference action");
      v19 = v23;
LABEL_9:
      objc_msgSend(v19, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v20, a2, v18, v24, v25);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v21);
        else
          _HKLogDroppedError();
      }

      goto LABEL_15;
    }
  }
  v15 = 0;
LABEL_17:

  return v15;
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
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
  v8.super_class = (Class)&OBJC_METACLASS___HDCloudSyncSharedSummaryAuthorizationRecord;
  objc_msgSendSuper2(&v8, sel_fieldsForUnprotectedSerialization);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("ParticipantRecord"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)printDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncSharedSummaryAuthorizationRecord authorizationIdentifiers](self, "authorizationIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("+ Authorization Categories: %@\n+--------------------------------------------------"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)codableRecordFromRecord:(id)a3
{
  id v3;
  HDCloudSyncCodableSharedSummaryAuthorizationRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(HDCloudSyncCodableSharedSummaryAuthorizationRecord);
  objc_msgSend(v3, "authorizationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord setAuthorizationCategories:](v4, "setAuthorizationCategories:", v6);

  objc_msgSend(v3, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord setUuid:](v4, "setUuid:", v8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAuthorizationRecord, 0);
}

@end
