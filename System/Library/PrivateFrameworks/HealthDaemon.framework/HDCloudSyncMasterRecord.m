@implementation HDCloudSyncMasterRecord

- (HDCloudSyncMasterRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (id)initInSyncCircle:(id)a3 disabledOwnerIdentifiers:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C95098];
  v7 = a4;
  objc_msgSend(v6, "hd_masterZoneIDForSyncCircleIdentifier:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncMasterRecord initInZone:disabledOwnerIdentifiers:](self, "initInZone:disabledOwnerIdentifiers:", v8, v7);

  return v9;
}

- (id)initInZone:(id)a3 disabledOwnerIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncMasterRecord"), v8);
  v10 = -[HDCloudSyncMasterRecord initWithCKRecord:disabledOwnerIdentifiers:schemaVersion:](self, v9, v6, 1);

  return v10;
}

- (id)initWithCKRecord:(void *)a3 disabledOwnerIdentifiers:(uint64_t)a4 schemaVersion:
{
  id v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)HDCloudSyncMasterRecord;
    v9 = (id *)objc_msgSendSuper2(&v14, sel_initWithCKRecord_schemaVersion_, v7, a4);
    if (v9)
    {
      objc_msgSend(v8, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("DeletedOwnerIdentifiers"));

      v11 = (void *)objc_msgSend(v8, "copy");
      v12 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong(v9 + 3, v12);
      if (!v11)

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setDisabledOwnerIdentifiers:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *disabledOwnerIdentifiers;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (NSSet *)objc_msgSend(v4, "copy");
  disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  self->_disabledOwnerIdentifiers = v5;

  objc_msgSend(v4, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncRecord record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("DeletedOwnerIdentifiers"));

}

- (id)serializeUnderlyingMessage
{
  return 0;
}

+ (id)fieldsForUnprotectedSerialization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCloudSyncMasterRecord;
  objc_msgSendSuper2(&v8, sel_fieldsForUnprotectedSerialization);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("DeletedOwnerIdentifiers"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (HDCloudSyncMasterRecord)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  HDCloudSyncMasterRecord *v18;
  void *v19;
  id *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("CloudSyncMasterRecord"));

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "hd_requiredValueForKey:type:error:", CFSTR("Version"), objc_opt_class(), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "hd_requiredValueForKey:type:error:", CFSTR("DeletedOwnerIdentifiers"), objc_opt_class(), a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v26 = v6;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("master record's disabled owner identifiers has non-string member %@"), v16);
                v17 = (id)objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  if (a4)
                    *a4 = objc_retainAutorelease(v17);
                  else
                    _HKLogDroppedError();
                }

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v13);
        }
        v18 = [HDCloudSyncMasterRecord alloc];
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v26;
        v20 = -[HDCloudSyncMasterRecord initWithCKRecord:disabledOwnerIdentifiers:schemaVersion:](v18, v26, v19, objc_msgSend(v9, "integerValue"));

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = objc_opt_class();
    objc_msgSend(v6, "recordType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v22, a2, CFSTR("record has type (%@), but expected (%@)"), v23, CFSTR("CloudSyncMasterRecord"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v24);
      else
        _HKLogDroppedError();
    }

    v20 = 0;
  }

  return (HDCloudSyncMasterRecord *)v20;
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

+ (id)recordIDWithZoneID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordName:zoneID:", CFSTR("CloudSyncMaster"), v4);

  return v5;
}

+ (BOOL)isMasterRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncMasterRecord"));

  return v4;
}

+ (BOOL)isMasterRecordID:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncMaster"));

  return v4;
}

+ (id)recordType
{
  return CFSTR("CloudSyncMasterRecord");
}

- (id)printDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncMasterRecord disabledOwnerIdentifiers](self, "disabledOwnerIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("+ Disabled Owners: %@\n+--------------------------------------------------"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)disabledOwnerIdentifiers
{
  return self->_disabledOwnerIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledOwnerIdentifiers, 0);
}

@end
