@implementation HDCloudSyncChangeRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return CFSTR("CloudSyncChangeRecord");
}

- (HDCloudSyncChangeRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
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

- (HDCloudSyncChangeRecord)initWithSyncAnchorRangeMap:(id)a3 finalForSequence:(BOOL)a4 changesetArchiveFileHandle:(id)a5 sequenceRecord:(id)a6 protocolVersion:(int)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  HDCloudSyncChangeRecord *v35;
  void *v37;
  void *v38;
  const char *v39;
  _BOOL4 v41;
  id v43;
  uint64_t v44;

  v41 = a4;
  v43 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc(MEMORY[0x1E0C95048]);
  v13 = v11;
  objc_opt_self();
  objc_msgSend(v13, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "zoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v16 = objc_msgSend(v15, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v44);

  v17 = objc_alloc(MEMORY[0x1E0C95070]);
  if (v16)
  {
    v39 = a2;
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "recordID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "recordName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@/Change/%@"), v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordID");
    v23 = v10;
    v24 = v12;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "zoneID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v17, "initWithRecordName:zoneID:", v22, v26);

    v28 = v38;
    v12 = v24;
    v10 = v23;

    a2 = v39;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "zoneID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v17, "initWithRecordName:zoneID:", v19, v21);
  }

  v29 = (void *)objc_msgSend(v12, "initWithRecordType:recordID:", CFSTR("CloudSyncChangeRecord"), v27);
  objc_msgSend(v13, "incrementChildRecordCount");
  objc_msgSend(v10, "seekToEndOfFile");
  v30 = objc_msgSend(v10, "offsetInFile");
  if ((unint64_t)(v30 - 5242880) < 0xFFFFFFFFFFB00001)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncChangeRecord.m"), 85, CFSTR("changeSize (%lld) is invalid for anchors %@"), v30, v43);

  }
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileDescriptor:", objc_msgSend(v10, "fileDescriptor"));
  objc_msgSend(v31, "setItemTypeHint:", CFSTR("fxd"));
  v32 = objc_msgSend(v13, "changeIndex");
  objc_msgSend(v13, "record");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "recordID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[HDCloudSyncChangeRecord initWithSyncAnchorRangeMap:changeIndex:changesetAsset:changeSize:protocolVersion:finalForSequence:sequenceRecordID:record:schemaVersion:](self, "initWithSyncAnchorRangeMap:changeIndex:changesetAsset:changeSize:protocolVersion:finalForSequence:sequenceRecordID:record:schemaVersion:", v43, v32, v31, v30, a7, v41, v34, v29, 1);

  return v35;
}

- (HDCloudSyncChangeRecord)initWithSyncAnchorRangeMap:(id)a3 changeIndex:(int64_t)a4 changesetAsset:(id)a5 changeSize:(int64_t)a6 protocolVersion:(int)a7 finalForSequence:(BOOL)a8 sequenceRecordID:(id)a9 record:(id)a10 schemaVersion:(int64_t)a11
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  HDCloudSyncCodableChange *v20;
  void *v21;
  void *v22;
  void *v23;
  HDCloudSyncChangeRecord *v24;

  v11 = a8;
  v16 = a10;
  v17 = a9;
  v18 = a5;
  v19 = a3;
  v20 = objc_alloc_init(HDCloudSyncCodableChange);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v17, 1);

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("SequenceRecord"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("ChangeSet"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("Version"));

  -[HDCloudSyncCodableChange setChangeIndex:](v20, "setChangeIndex:", a4);
  -[HDCloudSyncCodableChange setFinalForSequence:](v20, "setFinalForSequence:", v11);
  -[HDCloudSyncCodableChange setProtocolVersion:](v20, "setProtocolVersion:", a7);
  objc_msgSend(v19, "codableSyncAnchorRangeMap");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCodableChange setAnchorRangeMap:](v20, "setAnchorRangeMap:", v23);
  -[HDCloudSyncCodableChange setChangeSize:](v20, "setChangeSize:", a6);
  v24 = (HDCloudSyncChangeRecord *)-[HDCloudSyncChangeRecord initWithCKRecord:schemaVersion:underlyingChange:](self, (uint64_t)v16, a11, v20);

  return v24;
}

- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingChange:
{
  id v8;
  id *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a4;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)HDCloudSyncChangeRecord;
    v9 = (id *)objc_msgSendSuper2(&v20, sel_initWithCKRecord_schemaVersion_, a2, a3);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 3, a4);
      objc_msgSend(v10, "record");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10[3], "anchorRangeMap");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "encryptedValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("EntityAnchorRangeMap"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10[3], "changeIndex"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("CurrentChangeIndex"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10[3], "changeSize"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("ChangeSize"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10[3], "protocolVersion"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("ProtocolVersion"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10[3], "finalForSequence"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("Options"));

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableChange data](self->_underlyingChange, "data");
}

+ (id)fieldsForUnprotectedSerialization
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[8];

  v25[6] = *MEMORY[0x1E0C80C00];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___HDCloudSyncChangeRecord;
  objc_msgSendSuper2(&v18, sel_fieldsForUnprotectedSerialization);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("SequenceRecord"), v17, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("EntityAnchorRangeMap"), v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("CurrentChangeIndex"), v13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v3;
  v21 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("ProtocolVersion"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v5;
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("Options"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v7;
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("ChangeSize"), v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  HDCloudSyncCodableChange *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  HDCloudSyncCodableChange *v35;
  void *v36;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;

  v7 = a3;
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CloudSyncChangeRecord"));

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("Version"), objc_opt_class(), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v16 = 0;
LABEL_59:

      goto LABEL_60;
    }
    objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("SequenceRecord"), objc_opt_class(), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "referenceAction") == 1)
      {
        v48 = 0;
        objc_msgSend(v7, "hd_optionalEncryptedValueForKey:type:error:", CFSTR("UnderlyingMessage"), objc_opt_class(), &v48);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v48;
        v15 = v14;
        if (!v13 && v14)
        {
          if (a4)
          {
            v16 = 0;
            *a4 = objc_retainAutorelease(v14);
          }
          else
          {
            _HKLogDroppedError();
            v16 = 0;
          }
          goto LABEL_57;
        }
        if (v13)
        {
          v22 = -[HDCloudSyncCodableChange initWithData:]([HDCloudSyncCodableChange alloc], "initWithData:", v13);
          if (v22)
          {
            v16 = -[HDCloudSyncChangeRecord initWithCKRecord:schemaVersion:underlyingChange:]([HDCloudSyncChangeRecord alloc], (uint64_t)v7, objc_msgSend(v10, "integerValue"), v22);
LABEL_56:

LABEL_57:
            goto LABEL_58;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Underlying message present but does not decode."));
        }
        else
        {
          objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("CurrentChangeIndex"), objc_opt_class(), a4);
          v22 = (HDCloudSyncCodableChange *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("EntityAnchorRangeMap"), objc_opt_class(), a4);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              +[HDCloudSyncChangeRecord _decodedSyncAnchorRangeMapForAnchorRangeData:]((uint64_t)a1, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("ProtocolVersion"), objc_opt_class(), a4);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  v42 = v24;
                  v44 = v25;
                  v47 = 0;
                  objc_msgSend(v7, "hd_optionalValueForKey:type:error:", CFSTR("Options"), objc_opt_class(), &v47);
                  v26 = objc_claimAutoreleasedReturnValue();
                  v27 = v47;
                  v43 = (void *)v26;
                  if (v26 || !v27)
                  {
                    v41 = v27;
                    v46 = 0;
                    objc_msgSend(v7, "hd_optionalValueForKey:type:error:", CFSTR("ChangeSize"), objc_opt_class(), &v46);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = v46;
                    v40 = v29;
                    if (v29 || !v30)
                    {
                      v39 = v30;
                      v45 = 0;
                      objc_msgSend(v7, "hd_optionalValueForKey:type:error:", CFSTR("ChangeSet"), objc_opt_class(), &v45);
                      v32 = objc_claimAutoreleasedReturnValue();
                      v33 = v45;
                      v38 = (void *)v32;
                      if (v32 || !v33)
                      {
                        v34 = v33;
                        v35 = objc_alloc_init(HDCloudSyncCodableChange);
                        -[HDCloudSyncCodableChange setChangeSize:](v35, "setChangeSize:", objc_msgSend(v29, "longLongValue"));
                        -[HDCloudSyncCodableChange setChangeIndex:](v35, "setChangeIndex:", -[HDCloudSyncCodableChange longLongValue](v22, "longLongValue"));
                        -[HDCloudSyncCodableChange setProtocolVersion:](v35, "setProtocolVersion:", (int)objc_msgSend(v44, "integerValue"));
                        -[HDCloudSyncCodableChange setFinalForSequence:](v35, "setFinalForSequence:", objc_msgSend(v43, "longLongValue") != 0);
                        objc_msgSend(v42, "codableSyncAnchorRangeMap");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        -[HDCloudSyncCodableChange setAnchorRangeMap:](v35, "setAnchorRangeMap:", v36);

                        v16 = -[HDCloudSyncChangeRecord initWithCKRecord:schemaVersion:underlyingChange:]([HDCloudSyncChangeRecord alloc], (uint64_t)v7, objc_msgSend(v10, "integerValue"), v35);
                      }
                      else
                      {
                        v34 = v33;
                        if (a4)
                        {
                          v16 = 0;
                          *a4 = objc_retainAutorelease(v33);
                        }
                        else
                        {
                          _HKLogDroppedError();
                          v16 = 0;
                        }
                      }

                      v31 = v39;
                    }
                    else
                    {
                      v31 = v30;
                      if (a4)
                      {
                        v16 = 0;
                        *a4 = objc_retainAutorelease(v30);
                      }
                      else
                      {
                        _HKLogDroppedError();
                        v16 = 0;
                      }
                    }

                    v28 = v41;
                  }
                  else
                  {
                    v28 = v27;
                    if (a4)
                    {
                      v16 = 0;
                      *a4 = objc_retainAutorelease(v27);
                    }
                    else
                    {
                      _HKLogDroppedError();
                      v16 = 0;
                    }
                  }

                  v25 = v44;
                  v24 = v42;
                }
                else
                {
                  v16 = 0;
                }

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Unable to decode anchor range map."));
                v16 = 0;
              }

            }
            else
            {
              v16 = 0;
            }

            goto LABEL_56;
          }
        }
        v16 = 0;
        goto LABEL_56;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("record reference to parent does not have correct reference action"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v21);
        else
          _HKLogDroppedError();
      }

    }
    v16 = 0;
LABEL_58:

    goto LABEL_59;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v18 = objc_opt_class();
  objc_msgSend(v7, "recordType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v18, a2, CFSTR("record has type (%@), but expected (%@)"), v19, CFSTR("CloudSyncChangeRecord"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v20);
    else
      _HKLogDroppedError();
  }

  v16 = 0;
LABEL_60:

  return v16;
}

+ (HDSyncAnchorRangeMap)_decodedSyncAnchorRangeMapForAnchorRangeData:(uint64_t)a1
{
  id v2;
  HDCodableSyncAnchorRangeMap *v3;
  HDSyncAnchorRangeMap *v4;
  HDCodableSyncAnchorRangeMap *v5;
  NSObject *v6;
  NSObject *v7;
  id v9;
  id v10;
  uint8_t buf[4];
  HDCodableSyncAnchorRangeMap *v12;
  __int16 v13;
  HDCodableSyncAnchorRangeMap *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = -[HDCodableSyncAnchorRangeMap initWithData:]([HDCodableSyncAnchorRangeMap alloc], "initWithData:", v2);
  if (v3)
  {
    v10 = 0;
    v4 = -[HDSyncAnchorRangeMap initWithCodableSyncAnchorRangeMap:error:]([HDSyncAnchorRangeMap alloc], "initWithCodableSyncAnchorRangeMap:error:", v3, &v10);
    v5 = (HDCodableSyncAnchorRangeMap *)v10;
    if (v4)
      goto LABEL_10;
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = v3;
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to decode codable sync anchor range map %{public}@: %{public}@", buf, 0x16u);
    }

  }
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "hk_unarchivedObjectOfClass:forKey:data:error:", objc_opt_class(), CFSTR("EntityAnchorRangeMap"), v2, &v9);
  v4 = (HDSyncAnchorRangeMap *)objc_claimAutoreleasedReturnValue();
  v5 = (HDCodableSyncAnchorRangeMap *)v9;
  if (!v4)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Invalid archive attempting to decode sync anchor range map: %{public}@", buf, 0xCu);
    }
    v4 = 0;
  }
LABEL_10:

  return v4;
}

+ (BOOL)isChangeRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncChangeRecord"));

  return v4;
}

+ (BOOL)isChangeRecordID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("/Change/")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
    v8 = v7 != 0;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)isChangeRecord:(id)a3 inSequence:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;

  v5 = a4;
  v6 = a3;
  v13 = 0;
  objc_msgSend(v6, "hd_requiredValueForKey:type:error:", CFSTR("SequenceRecord"), objc_opt_class(), &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "record");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
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

+ (int64_t)bytesPerChangeRecordAssetThreshold
{
  return 3145728;
}

+ (int64_t)bytesPerChangeRecordAssetThresholdHardLimit
{
  return 0x400000;
}

+ (id)nonAssetKeys
{
  if (qword_1ED5521A8 != -1)
    dispatch_once(&qword_1ED5521A8, &__block_literal_global_6);
  return (id)_MergedGlobals_198;
}

void __39__HDCloudSyncChangeRecord_nonAssetKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Version");
  v2[1] = CFSTR("SequenceRecord");
  v2[2] = CFSTR("EntityAnchorRangeMap");
  v2[3] = CFSTR("CurrentChangeIndex");
  v2[4] = CFSTR("ProtocolVersion");
  v2[5] = CFSTR("Options");
  v2[6] = CFSTR("ChangeSize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_198;
  _MergedGlobals_198 = v0;

}

+ (id)assetKeys
{
  if (qword_1ED5521B8 != -1)
    dispatch_once(&qword_1ED5521B8, &__block_literal_global_239);
  return (id)qword_1ED5521B0;
}

void __36__HDCloudSyncChangeRecord_assetKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("ChangeSet");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED5521B0;
  qword_1ED5521B0 = v0;

}

+ (id)changesetArchiveContentDataForCKRecord:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[HDCloudSyncChangeRecord _assetForCKRecord:error:]((uint64_t)a1, a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "assetContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("record has nil assetContent"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError();
    }

    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

+ (id)_assetForCKRecord:(uint64_t)a3 error:
{
  id v4;
  void *v5;

  v4 = a2;
  objc_opt_self();
  objc_msgSend(v4, "hd_requiredValueForKey:type:error:", CFSTR("ChangeSet"), objc_opt_class(), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)changesetArchiveFileHandleForCKRecord:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  +[HDCloudSyncChangeRecord _assetForCKRecord:error:]((uint64_t)a1, a3, (uint64_t)a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fileHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)changesetArchiveURLForCKRecord:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  +[HDCloudSyncChangeRecord _assetForCKRecord:error:]((uint64_t)a1, a3, (uint64_t)a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[HDCloudSyncChangeRecord changeIndex](self, "changeIndex");
  if (v5 >= objc_msgSend(v4, "changeIndex"))
  {
    v7 = -[HDCloudSyncChangeRecord changeIndex](self, "changeIndex");
    v6 = v7 > objc_msgSend(v4, "changeIndex");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return -[HDCloudSyncCodableChange changeSize](self->_underlyingChange, "changeSize") >= 1
      && (unint64_t)-[HDCloudSyncCodableChange changeSize](self->_underlyingChange, "changeSize") <= 0x40000;
}

- (int64_t)changeIndex
{
  return -[HDCloudSyncCodableChange changeIndex](self->_underlyingChange, "changeIndex");
}

- (int)protocolVersion
{
  return -[HDCloudSyncCodableChange protocolVersion](self->_underlyingChange, "protocolVersion");
}

- (NSNumber)changeSize
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableChange changeSize](self->_underlyingChange, "changeSize"));
}

- (BOOL)finalForSequence
{
  return -[HDCloudSyncCodableChange finalForSequence](self->_underlyingChange, "finalForSequence");
}

- (NSURL)changesetArchiveFileURL
{
  void *v2;
  void *v3;
  void *v4;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ChangeSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (HDSyncAnchorRangeMap)decodedSyncAnchorRangeMap
{
  HDSyncAnchorRangeMap *v3;
  void *v4;
  HDSyncAnchorRangeMap *v5;
  id v6;
  void *v7;
  HDCloudSyncCodableChange *underlyingChange;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = [HDSyncAnchorRangeMap alloc];
  -[HDCloudSyncCodableChange anchorRangeMap](self->_underlyingChange, "anchorRangeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = -[HDSyncAnchorRangeMap initWithCodableSyncAnchorRangeMap:error:](v3, "initWithCodableSyncAnchorRangeMap:error:", v4, &v12);
  v6 = v12;

  if (!v5)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      underlyingChange = self->_underlyingChange;
      v9 = v7;
      -[HDCloudSyncCodableChange anchorRangeMap](underlyingChange, "anchorRangeMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "Failed to decode sync anchor range map: %@", buf, 0xCu);

    }
  }

  return v5;
}

- (CKRecordID)sequenceRecordID
{
  void *v2;
  void *v3;
  void *v4;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SequenceRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordID *)v4;
}

- (id)printDescription
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HDCloudSyncChangeRecord changeIndex](self, "changeIndex");
  v5 = -[HDCloudSyncChangeRecord protocolVersion](self, "protocolVersion");
  v6 = -[HDCloudSyncCodableChange finalForSequence](self->_underlyingChange, "finalForSequence");
  v7 = "";
  if (v6)
    v7 = " FINAL";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("+ Change %llu (Version %d) %s\n+--------------------------------------------------"), v4, v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingChange, 0);
}

@end
