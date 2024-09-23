@implementation HDCloudSyncSequenceRecord

+ (id)_recordIDWithOwnerIdentifier:(void *)a3 storeIdentifier:(void *)a4 zoneID:(int)a5 sequenceSlot:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = objc_opt_self();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDCloudSyncSequenceRecord _recordNameForSequenceSlot:](v11, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/%@/%@"), v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v15, v8);
  return v16;
}

+ (id)_recordIDWithIndividualZoneID:(int)a3 sequenceSlot:
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a2;
  v5 = objc_opt_self();
  +[HDCloudSyncSequenceRecord _recordNameForSequenceSlot:](v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v6, v4);

  return v7;
}

- (HDCloudSyncSequenceRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
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

- (id)initForSequenceSlot:(int)a3 syncAnchorMap:(id)a4 changeIndex:(unint64_t)a5 baselineEpoch:(int64_t)a6 includedIdentifiers:(id)a7 includedSyncIdentities:(id)a8 includedChildSyncIdentities:(id)a9 storeRecord:(id)a10
{
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  HDCloudSyncCodableSequence *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  id *v51;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v59;
  void *v60;
  unsigned int v61;
  void *v62;
  uint64_t v64;

  v13 = *(_QWORD *)&a3;
  v14 = a10;
  v59 = a9;
  v15 = a8;
  v16 = a7;
  v17 = a4;
  v18 = v14;
  objc_opt_self();
  objc_msgSend(v18, "recordID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "zoneID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = 0;
  if (objc_msgSend(v20, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v64))
  {
    objc_msgSend(v18, "ownerIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "storeIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v13;
    +[HDCloudSyncSequenceRecord _recordIDWithOwnerIdentifier:storeIdentifier:zoneID:sequenceSlot:]((uint64_t)HDCloudSyncSequenceRecord, v21, v22, v20, v13);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v18, "record");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recordID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "zoneID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v13;
    v27 = v25;
    v23 = v26;
    +[HDCloudSyncSequenceRecord _recordIDWithIndividualZoneID:sequenceSlot:]((uint64_t)HDCloudSyncSequenceRecord, v25, v26);
    v24 = objc_claimAutoreleasedReturnValue();

  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncSequenceRecord"), v24);
  objc_msgSend(v18, "record");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "recordID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v17;
  v32 = v16;
  v33 = v15;
  v34 = v59;
  v35 = v30;
  v36 = v28;
  v62 = (void *)v24;
  if (!self)
  {
    v51 = 0;
    goto LABEL_12;
  }
  v37 = v23;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", sel_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion_, self, CFSTR("HDCloudSyncSequenceRecord.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("includedIdentifiers"));

    v37 = v23;
    if (v35)
      goto LABEL_7;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = v37;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", sel_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion_, self, CFSTR("HDCloudSyncSequenceRecord.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storeRecordID"));

    v37 = v61;
    goto LABEL_7;
  }
  if (!v35)
    goto LABEL_14;
LABEL_7:
  v60 = v29;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = v37;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", sel_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion_, self, CFSTR("HDCloudSyncSequenceRecord.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

    v37 = v55;
  }
  v38 = objc_alloc_init(HDCloudSyncCodableSequence);
  -[HDCloudSyncCodableSequence setSlot:](v38, "setSlot:", v37);
  -[HDCloudSyncCodableSequence setActive:](v38, "setActive:", 0);
  -[HDCloudSyncCodableSequence setChangeIndex:](v38, "setChangeIndex:", a5);
  -[HDCloudSyncCodableSequence setChildRecordCount:](v38, "setChildRecordCount:", 0);
  -[HDCloudSyncCodableSequence setEpoch:](v38, "setEpoch:", a6);
  -[HDCloudSyncCodableSequence setProtocolVersion:](v38, "setProtocolVersion:", 16);
  objc_msgSend(v31, "codableSyncAnchorRangeMap");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSequence setAnchorMap:](v38, "setAnchorMap:", v39);

  objc_msgSend(v32, "allObjects");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "hk_map:", &__block_literal_global_66);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "mutableCopy");
  -[HDCloudSyncCodableSequence setIncludedStoreIdentifiers:](v38, "setIncludedStoreIdentifiers:", v42);

  objc_msgSend(v33, "allObjects");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "hk_map:", &__block_literal_global_231);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "mutableCopy");
  -[HDCloudSyncCodableSequence setIncludedSyncIdentities:](v38, "setIncludedSyncIdentities:", v45);

  objc_msgSend(v34, "allObjects");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "hk_map:", &__block_literal_global_232_0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "mutableCopy");
  -[HDCloudSyncCodableSequence setIncludedChildSyncIdentities:](v38, "setIncludedChildSyncIdentities:", v48);

  v49 = -[HDCloudSyncSequenceRecord initWithCKRecord:schemaVersion:underlyingSequence:](self, v36, 1, v38);
  if (v49)
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v35, 1);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v50, CFSTR("StoreRecord"));

  }
  v51 = v49;

  v29 = v60;
LABEL_12:

  return v51;
}

uint64_t __235__HDCloudSyncSequenceRecord_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_dataForUUIDBytes");
}

uint64_t __235__HDCloudSyncSequenceRecord_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableSyncIdentity");
}

uint64_t __235__HDCloudSyncSequenceRecord_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableSyncIdentity");
}

- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingSequence:
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id *v54;
  id v56;
  id *v57;
  void *v58;
  int v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  objc_super v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  _QWORD v72[7];
  _QWORD v73[9];

  v73[7] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_24;
  }
  v67.receiver = a1;
  v67.super_class = (Class)HDCloudSyncSequenceRecord;
  v9 = (id *)objc_msgSendSuper2(&v67, sel_initWithCKRecord_schemaVersion_, v7, a3);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 3, a4);
    objc_msgSend(v7, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v13 = objc_msgSend(v12, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v66);
    v14 = v66;

    objc_msgSend(v7, "recordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v13)
    {
      objc_msgSend(v15, "recordName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("/"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count") != 3)
      {
        v54 = v10;
        v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v19 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithUUIDString:", v20);
      v22 = v10[4];
      v10[4] = (id)v21;

      v23 = 0;
      v56 = v14;
    }
    else
    {
      objc_msgSend(v15, "zoneID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v14;
      v65 = 0;
      v25 = objc_msgSend(v24, "hd_isIndividualSyncZoneIDForStoreIdentifier:syncCircleIdentifier:", &v65, &v64);
      v23 = v65;
      v56 = v64;

      if (!v25)
      {
LABEL_9:
        v60 = v8;
        v61 = v23;
        v62 = v7;
        objc_msgSend(v10[3], "includedStoreIdentifiers", v56);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v10[3], "setIncludedStoreIdentifiers:", v28);

        }
        v72[0] = CFSTR("Slot");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10[3], "slot"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = v58;
        v72[1] = CFSTR("Active");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10[3], "active"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v73[1] = v29;
        v72[2] = CFSTR("ChangeIndex");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10[3], "changeIndex"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v73[2] = v30;
        v72[3] = CFSTR("ChildRecordCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10[3], "childRecordCount"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v73[3] = v31;
        v72[4] = CFSTR("BaselineEpoch");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10[3], "epoch"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v73[4] = v32;
        v72[5] = CFSTR("ProtocolVersion");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10[3], "protocolVersion"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v73[5] = v33;
        v72[6] = CFSTR("IncludedIdentifiers");
        objc_msgSend(v10[3], "includedStoreIdentifiers");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "copy");
        v73[6] = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 7);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v7, "hd_setValuesIfChanged:", v36);

        objc_msgSend(v7, "encryptedValues");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("EntityAnchorMap"));
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v63 = 0;
          objc_msgSend(MEMORY[0x1E0CB3710], "hk_unarchivedObjectOfClass:forKey:data:error:", objc_opt_class(), CFSTR("EntityAnchorMap"), v18, &v63);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = 0;
        }
        v8 = v60;
        objc_msgSend(v10[3], "anchorMap");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDSyncAnchorMap syncAnchorMapWithCodableSyncAnchorRangeMap:](HDSyncAnchorMap, "syncAnchorMapWithCodableSyncAnchorRangeMap:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v38, "isEqual:", v40);

        v42 = v59;
        if ((v41 & 1) == 0)
        {
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
          objc_msgSend(v10, "syncAnchorMap");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "encodeObject:forKey:", v44, CFSTR("EntityAnchorMap"));

          objc_msgSend(v43, "encodedData");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v7, "hd_setEncryptedValue:ifChangedForKey:", v45, CFSTR("EntityAnchorMap")) | v59;

        }
        v14 = v61;
        if ((objc_msgSend(v10, "unsaved") & 1) == 0 && v42)
        {
          _HKInitializeLogging();
          v46 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v47 = v46;
            objc_msgSend(v10, "recordID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "changedKeys");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "encryptedValueStore");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "changedKeys");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "componentsJoinedByString:", CFSTR(", "));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v69 = v48;
            v70 = 2114;
            v71 = v53;
            _os_log_impl(&dword_1B7802000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Repaired during init (updated keys: %{public}@)", buf, 0x16u);

            v14 = v61;
            v8 = v60;

            v7 = v62;
          }
          objc_msgSend(v10, "setRepaired:", 1);
        }

        v54 = v57;
        goto LABEL_23;
      }
      v26 = objc_msgSend(v23, "copy");
      v18 = v10[4];
      v10[4] = (id)v26;
    }

    goto LABEL_9;
  }
LABEL_24:

  return v10;
}

+ (void)_recordNameForSequenceSlot:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_opt_self();
  if ((a2 - 1) >= 3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__recordNameForSequenceSlot_, v4, CFSTR("HDCloudSyncSequenceRecord.m"), 244, CFSTR("Invalid sequence record slot identifier %ld"), a2);

  }
}

+ (id)recordIDsWithIndividualZoneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HDCloudSyncSequenceRecord _recordIDWithIndividualZoneID:sequenceSlot:]((uint64_t)a1, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  +[HDCloudSyncSequenceRecord _recordIDWithIndividualZoneID:sequenceSlot:]((uint64_t)a1, v4, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  +[HDCloudSyncSequenceRecord _recordIDWithIndividualZoneID:sequenceSlot:]((uint64_t)a1, v4, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)recordIDsForOwnerIdentifier:(id)a3 storeIdentifier:(id)a4 zoneID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[HDCloudSyncSequenceRecord _recordIDWithOwnerIdentifier:storeIdentifier:zoneID:sequenceSlot:]((uint64_t)a1, v10, v9, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  +[HDCloudSyncSequenceRecord _recordIDWithOwnerIdentifier:storeIdentifier:zoneID:sequenceSlot:]((uint64_t)a1, v10, v9, v8, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  +[HDCloudSyncSequenceRecord _recordIDWithOwnerIdentifier:storeIdentifier:zoneID:sequenceSlot:]((uint64_t)a1, v10, v9, v8, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)isSequenceRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncSequenceRecord"));

  return v4;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return CFSTR("CloudSyncSequenceRecord");
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

+ (HDCloudSyncSequenceRecord)recordWithCKRecord:(id)a3 error:(id *)a4
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
  HDCloudSyncCodableSequence *v22;
  HDCloudSyncCodableSequence *v23;
  uint64_t v24;
  HDCloudSyncCodableSequence *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HDCloudSyncCodableSequence *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HDCloudSyncCodableSequence *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id obj;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  HDCloudSyncCodableSequence *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  void *v90;
  uint8_t buf[4];
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CloudSyncSequenceRecord"));

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("Version"), objc_opt_class(), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v16 = 0;
LABEL_100:

      goto LABEL_101;
    }
    objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("StoreRecord"), objc_opt_class(), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "referenceAction") == 1)
      {
        v89 = 0;
        objc_msgSend(v7, "hd_optionalEncryptedValueForKey:type:error:", CFSTR("UnderlyingMessage"), objc_opt_class(), &v89);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v89;
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
          goto LABEL_98;
        }
        if (v13)
        {
          v22 = -[HDCloudSyncCodableSequence initWithData:]([HDCloudSyncCodableSequence alloc], "initWithData:", v13);
          if (v22)
          {
            v16 = -[HDCloudSyncSequenceRecord initWithCKRecord:schemaVersion:underlyingSequence:]([HDCloudSyncSequenceRecord alloc], v7, objc_msgSend(v10, "integerValue"), v22);
LABEL_97:

LABEL_98:
            goto LABEL_99;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Underlying message present but does not decode."));
LABEL_55:
          v16 = 0;
          goto LABEL_97;
        }
        objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("Slot"), objc_opt_class(), a4);
        v23 = (HDCloudSyncCodableSequence *)objc_claimAutoreleasedReturnValue();
        v22 = v23;
        if (!v23)
          goto LABEL_55;
        if (-[HDCloudSyncCodableSequence integerValue](v23, "integerValue") == 1
          || -[HDCloudSyncCodableSequence integerValue](v22, "integerValue") == 2
          || -[HDCloudSyncCodableSequence integerValue](v22, "integerValue") == 3)
        {
          v82 = v15;
          objc_msgSend(v7, "recordID");
          v80 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "recordName");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = v22;
          v26 = (void *)v24;
          v83 = v25;
          +[HDCloudSyncSequenceRecord _recordNameForSequenceSlot:]((uint64_t)a1, -[HDCloudSyncCodableSequence integerValue](v25, "integerValue"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "hasSuffix:", v27);

          if ((v28 & 1) == 0)
          {
            v58 = (void *)MEMORY[0x1E0CB35C8];
            v59 = objc_opt_class();
            v60 = -[HDCloudSyncCodableSequence integerValue](v83, "integerValue");
            objc_msgSend(v7, "recordID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "recordName");
            v81 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v59, a2, CFSTR("sequence slot (%ld) does not match the record name (%@)"), v60, v81);
            v62 = (id)objc_claimAutoreleasedReturnValue();
            v13 = 0;
            v15 = v82;
            if (v62)
            {
              if (a4)
                *a4 = objc_retainAutorelease(v62);
              else
                _HKLogDroppedError();
            }

            v16 = 0;
            v22 = v83;
            goto LABEL_94;
          }
          objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("Active"), objc_opt_class(), a4);
          v15 = v82;
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          if (v79)
          {
            objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("ChangeIndex"), objc_opt_class(), a4);
            v29 = (id)objc_claimAutoreleasedReturnValue();
            v22 = v83;
            if (!v29)
            {
              v16 = 0;
              v61 = v79;
              v13 = 0;
              goto LABEL_95;
            }
            v81 = v29;
            objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("BaselineEpoch"), objc_opt_class(), a4);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v30)
            {
              v16 = 0;
              v61 = v79;
              v13 = 0;
              goto LABEL_93;
            }
            v74 = v30;
            objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("ChildRecordCount"), objc_opt_class(), a4);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              v16 = 0;
              v61 = v79;
              v13 = 0;
              goto LABEL_92;
            }
            v73 = v31;
            objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("ProtocolVersion"), objc_opt_class(), a4);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v32)
            {
              v16 = 0;
              v61 = v79;
              v13 = 0;
              goto LABEL_91;
            }
            v72 = v32;
            objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("IncludedIdentifiers"), objc_opt_class(), a4);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v33)
            {
              v16 = 0;
              v61 = v79;
              v13 = 0;
              goto LABEL_90;
            }
            v34 = v33;
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v33, "count"));
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            v88 = 0u;
            v71 = v34;
            obj = v34;
            v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
            if (!v35)
              goto LABEL_45;
            v36 = v35;
            v76 = *(_QWORD *)v86;
LABEL_38:
            v37 = 0;
            while (1)
            {
              if (*(_QWORD *)v86 != v76)
                objc_enumerationMutation(obj);
              objc_opt_class();
              HKSafeObject();
              v38 = objc_claimAutoreleasedReturnValue();
              if (!v38)
                goto LABEL_73;
              v39 = (void *)v38;
              objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v38);
              v40 = objc_claimAutoreleasedReturnValue();
              if (!v40)
                break;
              v41 = (void *)v40;
              objc_msgSend(v78, "addObject:", v40);

              if (v36 == ++v37)
              {
                v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
                if (v36)
                  goto LABEL_38;
LABEL_45:

                objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("EntityAnchorMap"), objc_opt_class(), a4);
                obj = (id)objc_claimAutoreleasedReturnValue();
                if (obj)
                {
                  objc_msgSend(MEMORY[0x1E0CB3710], "hk_unarchivedObjectOfClass:forKey:data:error:", objc_opt_class(), CFSTR("EntityAnchorMap"), obj, a4);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v77)
                    goto LABEL_77;
                  objc_msgSend(v7, "encryptedValues");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("FrozenAnchorMap"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v43)
                  {
                    objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", CFSTR("FrozenAnchorMap"), objc_opt_class(), a4);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v44, a4);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v45)
                      goto LABEL_77;
                  }
                  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FirstUnfrozenChange"));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v46
                    || (objc_msgSend(v7, "hd_requiredValueForKey:type:error:", CFSTR("FirstUnfrozenChange"), objc_opt_class(), a4), v47 = (void *)objc_claimAutoreleasedReturnValue(), v47, v47))
                  {
                    v48 = objc_alloc_init(HDCloudSyncCodableSequence);
                    -[HDCloudSyncCodableSequence setSlot:](v48, "setSlot:", -[HDCloudSyncCodableSequence integerValue](v83, "integerValue"));
                    -[HDCloudSyncCodableSequence setActive:](v48, "setActive:", objc_msgSend(v79, "BOOLValue"));
                    -[HDCloudSyncCodableSequence setChangeIndex:](v48, "setChangeIndex:", objc_msgSend(v81, "longLongValue"));
                    -[HDCloudSyncCodableSequence setChildRecordCount:](v48, "setChildRecordCount:", objc_msgSend(v73, "longLongValue"));
                    -[HDCloudSyncCodableSequence setEpoch:](v48, "setEpoch:", objc_msgSend(v74, "longLongValue"));
                    -[HDCloudSyncCodableSequence setProtocolVersion:](v48, "setProtocolVersion:", objc_msgSend(v72, "integerValue"));
                    objc_msgSend(v77, "codableSyncAnchorRangeMap");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HDCloudSyncCodableSequence setAnchorMap:](v48, "setAnchorMap:", v49);

                    objc_msgSend(v78, "allObjects");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "hk_map:", &__block_literal_global_273);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = (void *)objc_msgSend(v51, "mutableCopy");
                    -[HDCloudSyncCodableSequence setIncludedStoreIdentifiers:](v48, "setIncludedStoreIdentifiers:", v52);

                    objc_msgSend(v7, "encryptedValues");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("FrozenAnchorMap"));
                    v54 = (HDCloudSyncCodableSequence *)objc_claimAutoreleasedReturnValue();

                    if (v54)
                    {
                      v84 = 0;
                      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v54, &v84);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      v56 = v84;
                      if (v55)
                      {
                        objc_msgSend(v55, "codableSyncAnchorRangeMap");
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        -[HDCloudSyncCodableSequence setFrozenAnchorMap:](v48, "setFrozenAnchorMap:", v57);

                      }
                      else
                      {
                        _HKInitializeLogging();
                        v63 = *MEMORY[0x1E0CB5370];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543362;
                          v92 = v56;
                          _os_log_error_impl(&dword_1B7802000, v63, OS_LOG_TYPE_ERROR, "Failed to decode frozen anchor map: %{public}@", buf, 0xCu);
                        }
                      }

                    }
                    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FirstUnfrozenChange"));
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v70 = v64;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v64, "recordID");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "recordName");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v90 = v66;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      v68 = (void *)objc_msgSend(v67, "mutableCopy");
                      -[HDCloudSyncCodableSequence setUnfrozenChangeRecordNames:](v48, "setUnfrozenChangeRecordNames:", v68);

                    }
                    v16 = -[HDCloudSyncSequenceRecord initWithCKRecord:schemaVersion:underlyingSequence:]([HDCloudSyncSequenceRecord alloc], v7, objc_msgSend(v10, "integerValue"), v48);

LABEL_87:
                  }
                  else
                  {
LABEL_77:
                    v16 = 0;
                  }
                  v61 = v79;
                  v13 = 0;
                  v15 = v82;
                  v22 = v83;

                }
                else
                {
LABEL_73:
                  v16 = 0;
                  v61 = v79;
                  v13 = 0;
                  v15 = v82;
                  v22 = v83;
                }

                v33 = v71;
LABEL_90:

                v32 = v72;
LABEL_91:

                v31 = v73;
LABEL_92:

                v30 = v74;
LABEL_93:

LABEL_94:
                v29 = v81;
                goto LABEL_95;
              }
            }
            v77 = v39;
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("record has invalid owner UUID data '%@'"), v39);
            v54 = (HDCloudSyncCodableSequence *)(id)objc_claimAutoreleasedReturnValue();
            if (v54)
            {
              if (a4)
              {
                v16 = 0;
                *a4 = objc_retainAutorelease(v54);
LABEL_80:
                v48 = v54;
                goto LABEL_87;
              }
              _HKLogDroppedError();
            }
            v16 = 0;
            goto LABEL_80;
          }
          v61 = 0;
          v16 = 0;
          v13 = 0;
          v22 = v83;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("record identity (%ld) is not a valid HDCloudSyncSequenceRecordIdentity value"), -[HDCloudSyncCodableSequence integerValue](v22, "integerValue"));
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            if (a4)
            {
              v29 = objc_retainAutorelease(v29);
              v16 = 0;
              *a4 = v29;
              v61 = v29;
              goto LABEL_95;
            }
            v61 = v29;
            _HKLogDroppedError();
            v29 = v61;
          }
          else
          {
            v61 = 0;
          }
          v16 = 0;
LABEL_95:

        }
        goto LABEL_97;
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
LABEL_99:

    goto LABEL_100;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v18 = objc_opt_class();
  objc_msgSend(v7, "recordType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v18, a2, CFSTR("record has type (%@), but expected (%@)"), v19, CFSTR("CloudSyncSequenceRecord"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v20);
    else
      _HKLogDroppedError();
  }

  v16 = 0;
LABEL_101:

  return (HDCloudSyncSequenceRecord *)v16;
}

uint64_t __54__HDCloudSyncSequenceRecord_recordWithCKRecord_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_dataForUUIDBytes");
}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableSequence data](self->_underlyingSequence, "data");
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[13];

  v40[11] = *MEMORY[0x1E0C80C00];
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS___HDCloudSyncSequenceRecord;
  objc_msgSendSuper2(&v28, sel_fieldsForUnprotectedSerialization);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("StoreRecord"), v27, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v26;
  v38 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("Slot"), v25, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v24;
  v37 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("Active"), v22, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v21;
  v36 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("BaselineEpoch"), v20, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v19;
  v35 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("EntityAnchorMap"), v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v17;
  v34 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("FrozenAnchorMap"), v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v15;
  v33 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("ChangeIndex"), v14, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v13;
  v32 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("ChildRecordCount"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v3;
  v31 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("ProtocolVersion"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v5;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("IncludedIdentifiers"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[9] = v7;
  v29 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("FirstUnfrozenChange"), v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isActive
{
  return -[HDCloudSyncCodableSequence active](self->_underlyingSequence, "active");
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[HDCloudSyncCodableSequence active](self->_underlyingSequence, "active") != a3)
  {
    -[HDCloudSyncCodableSequence setActive:](self->_underlyingSequence, "setActive:", v3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncRecord record](self, "record");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Active"));

  }
}

- (int)protocolVersion
{
  return -[HDCloudSyncCodableSequence protocolVersion](self->_underlyingSequence, "protocolVersion");
}

- (void)setProtocolVersion:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[HDCloudSyncCodableSequence setProtocolVersion:](self->_underlyingSequence, "setProtocolVersion:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ProtocolVersion"));

}

- (int)slot
{
  return -[HDCloudSyncCodableSequence slot](self->_underlyingSequence, "slot");
}

- (int64_t)changeIndex
{
  return -[HDCloudSyncCodableSequence changeIndex](self->_underlyingSequence, "changeIndex");
}

- (void)incrementChangeIndex
{
  void *v3;
  void *v4;

  -[HDCloudSyncCodableSequence setChangeIndex:](self->_underlyingSequence, "setChangeIndex:", -[HDCloudSyncCodableSequence changeIndex](self->_underlyingSequence, "changeIndex") + 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSequence changeIndex](self->_underlyingSequence, "changeIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("ChangeIndex"));

  -[HDCloudSyncSequenceRecord setProtocolVersion:](self, "setProtocolVersion:", 16);
}

- (void)resetChangeIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HDCloudSyncCodableSequence setChangeIndex:](self->_underlyingSequence, "setChangeIndex:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSequence changeIndex](self->_underlyingSequence, "changeIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ChangeIndex"));

  -[HDCloudSyncSequenceRecord setProtocolVersion:](self, "setProtocolVersion:", 16);
}

- (int64_t)baselineEpoch
{
  return -[HDCloudSyncCodableSequence epoch](self->_underlyingSequence, "epoch");
}

- (int64_t)childRecordCount
{
  return -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount");
}

- (void)incrementChildRecordCount
{
  void *v3;
  id v4;

  -[HDCloudSyncCodableSequence setChildRecordCount:](self->_underlyingSequence, "setChildRecordCount:", -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount") + 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ChildRecordCount"));

}

- (void)decrementChildRecordCount:(unint64_t)a3
{
  int64_t v5;
  void *v6;
  id v7;

  v5 = -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount");
  -[HDCloudSyncCodableSequence setChildRecordCount:](self->_underlyingSequence, "setChildRecordCount:", (v5 - a3) & ~((uint64_t)(v5 - a3) >> 63));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("ChildRecordCount"));

}

- (NSSet)includedIdentifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HDCloudSyncCodableSequence includedStoreIdentifiers](self->_underlyingSequence, "includedStoreIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HDCloudSyncCodableSequence includedStoreIdentifiers](self->_underlyingSequence, "includedStoreIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_280);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

uint64_t __48__HDCloudSyncSequenceRecord_includedIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", a2);
}

- (NSSet)includedSyncIdentities
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HDCloudSyncCodableSequence includedSyncIdentities](self->_underlyingSequence, "includedSyncIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HDCloudSyncCodableSequence includedSyncIdentities](self->_underlyingSequence, "includedSyncIdentities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_282_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

id __51__HDCloudSyncSequenceRecord_includedSyncIdentities__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", a2, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "Failed to decode codableIdentity with error: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (NSSet)includedChildSyncIdentities
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HDCloudSyncCodableSequence includedChildSyncIdentities](self->_underlyingSequence, "includedChildSyncIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HDCloudSyncCodableSequence includedChildSyncIdentities](self->_underlyingSequence, "includedChildSyncIdentities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_284_1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

id __56__HDCloudSyncSequenceRecord_includedChildSyncIdentities__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", a2, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "Failed to decode codable child sync Identity with error: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (void)setIncludedChildSyncIdentities:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_map:", &__block_literal_global_285);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[HDCloudSyncCodableSequence setIncludedChildSyncIdentities:](self->_underlyingSequence, "setIncludedChildSyncIdentities:", v5);

}

uint64_t __60__HDCloudSyncSequenceRecord_setIncludedChildSyncIdentities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableSyncIdentity");
}

- (HDSyncAnchorMap)syncAnchorMap
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableSequence anchorMap](self->_underlyingSequence, "anchorMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncAnchorMap syncAnchorMapWithCodableSyncAnchorRangeMap:](HDSyncAnchorMap, "syncAnchorMapWithCodableSyncAnchorRangeMap:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDSyncAnchorMap *)v3;
}

- (void)updateSyncAnchorMapWithSyncAnchorMap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "anchorCount"))
  {
    -[HDCloudSyncSequenceRecord syncAnchorMap](self, "syncAnchorMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnchorsFromMap:", v10);
    objc_msgSend(v4, "codableSyncAnchorRangeMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableSequence setAnchorMap:](self->_underlyingSequence, "setAnchorMap:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EntityAnchorMap"));
    objc_msgSend(v6, "encodedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncRecord record](self, "record");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("EntityAnchorMap"));

  }
}

- (void)replaceSyncAnchorMapWithSyncAnchorMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "codableSyncAnchorRangeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSequence setAnchorMap:](self->_underlyingSequence, "setAnchorMap:", v5);

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("EntityAnchorMap"));

  objc_msgSend(v9, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("EntityAnchorMap"));

}

- (HDSyncAnchorMap)frozenSyncAnchorMap
{
  void *v3;
  void *v4;

  if (-[HDCloudSyncCodableSequence hasFrozenAnchorMap](self->_underlyingSequence, "hasFrozenAnchorMap"))
  {
    -[HDCloudSyncCodableSequence frozenAnchorMap](self->_underlyingSequence, "frozenAnchorMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSyncAnchorMap syncAnchorMapWithCodableSyncAnchorRangeMap:](HDSyncAnchorMap, "syncAnchorMapWithCodableSyncAnchorRangeMap:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (HDSyncAnchorMap *)v4;
}

- (void)updateFrozenSyncAnchorMapWithSyncAnchorMap:(id)a3
{
  id v4;
  HDSyncAnchorMap *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDCloudSyncSequenceRecord frozenSyncAnchorMap](self, "frozenSyncAnchorMap");
  v5 = (HDSyncAnchorMap *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = objc_alloc_init(HDSyncAnchorMap);
  -[HDSyncAnchorMap setAnchorsFromMap:](v5, "setAnchorsFromMap:", v4);
  -[HDSyncAnchorMap codableSyncAnchorRangeMap](v5, "codableSyncAnchorRangeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSequence setFrozenAnchorMap:](self->_underlyingSequence, "setFrozenAnchorMap:", v6);

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    -[HDCloudSyncRecord record](self, "record");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encryptedValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("FrozenAnchorMap"));

  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Failed to encode updated frozen anchor map: %{public}@", buf, 0xCu);
    }
  }

}

- (CKRecordID)firstUnfrozenChangeRecord
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[HDCloudSyncCodableSequence unfrozenChangeRecordNames](self->_underlyingSequence, "unfrozenChangeRecordNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C95070]);
    -[HDCloudSyncRecord recordID](self, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v7);

  }
  else
  {
    v8 = 0;
  }

  return (CKRecordID *)v8;
}

- (void)setFirstUnfrozenChangeRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    -[HDCloudSyncCodableSequence setUnfrozenChangeRecordNames:](self->_underlyingSequence, "setUnfrozenChangeRecordNames:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v5, 0);
    -[HDCloudSyncRecord record](self, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("FirstUnfrozenChange"));

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HDCloudSyncCodableSequence setUnfrozenChangeRecordNames:](self->_underlyingSequence, "setUnfrozenChangeRecordNames:", v11);

    -[HDCloudSyncRecord record](self, "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", 0, CFSTR("FirstUnfrozenChange"));

  }
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HDCloudSyncSequenceRecord *v7;
  int v8;
  NSUUID *v9;
  NSUUID *storeIdentifier;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v7 = (HDCloudSyncSequenceRecord *)a3;
  if (v7 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[HDCloudSyncSequenceRecord slot](v7, "slot");
      if (v8 == -[HDCloudSyncCodableSequence slot](self->_underlyingSequence, "slot"))
      {
        -[HDCloudSyncSequenceRecord storeIdentifier](v7, "storeIdentifier");
        v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        storeIdentifier = self->_storeIdentifier;
        if (v9 != storeIdentifier)
        {
          if (!storeIdentifier)
          {
            v11 = 0;
            goto LABEL_33;
          }
          -[HDCloudSyncSequenceRecord storeIdentifier](v7, "storeIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", self->_storeIdentifier))
          {
            v11 = 0;
LABEL_32:

            goto LABEL_33;
          }
        }
        -[HDCloudSyncSequenceRecord syncAnchorMap](v7, "syncAnchorMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncSequenceRecord syncAnchorMap](self, "syncAnchorMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v13)
        {
          -[HDCloudSyncSequenceRecord syncAnchorMap](self, "syncAnchorMap");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
LABEL_29:

LABEL_30:
            v11 = 0;
            goto LABEL_31;
          }
          v4 = (void *)v14;
          -[HDCloudSyncSequenceRecord syncAnchorMap](v7, "syncAnchorMap");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncSequenceRecord syncAnchorMap](self, "syncAnchorMap");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isEqual:", v5) & 1) == 0)
          {

LABEL_28:
            goto LABEL_29;
          }
          v56 = v15;
        }
        v16 = -[HDCloudSyncSequenceRecord isActive](v7, "isActive");
        if (v16 != -[HDCloudSyncSequenceRecord isActive](self, "isActive")
          || (v17 = -[HDCloudSyncSequenceRecord changeIndex](v7, "changeIndex"),
              v17 != -[HDCloudSyncSequenceRecord changeIndex](self, "changeIndex"))
          || (v18 = -[HDCloudSyncSequenceRecord baselineEpoch](v7, "baselineEpoch"),
              v18 != -[HDCloudSyncSequenceRecord baselineEpoch](self, "baselineEpoch"))
          || (v19 = -[HDCloudSyncSequenceRecord childRecordCount](v7, "childRecordCount"),
              v19 != -[HDCloudSyncSequenceRecord childRecordCount](self, "childRecordCount")))
        {
          v26 = 0;
          v11 = 0;
LABEL_24:
          if (v12 != v13)
          {

            v11 = v26;
          }

LABEL_31:
          if (v9 != storeIdentifier)
            goto LABEL_32;
LABEL_33:

          goto LABEL_34;
        }
        -[HDCloudSyncSequenceRecord includedIdentifiers](v7, "includedIdentifiers");
        v20 = objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncSequenceRecord includedIdentifiers](self, "includedIdentifiers");
        v54 = (void *)v20;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if ((void *)v20 == v55)
          goto LABEL_35;
        -[HDCloudSyncSequenceRecord includedIdentifiers](self, "includedIdentifiers");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v26 = 0;
          v32 = v54;
          goto LABEL_57;
        }
        v51 = (void *)v21;
        -[HDCloudSyncSequenceRecord includedIdentifiers](v7, "includedIdentifiers");
        v22 = objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncSequenceRecord includedIdentifiers](self, "includedIdentifiers");
        v23 = objc_claimAutoreleasedReturnValue();
        v50 = (void *)v22;
        v24 = (void *)v22;
        v25 = (void *)v23;
        if ((objc_msgSend(v24, "isEqual:", v23) & 1) != 0)
        {
          v47 = v25;
LABEL_35:
          -[HDCloudSyncSequenceRecord includedSyncIdentities](v7, "includedSyncIdentities");
          v28 = objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncSequenceRecord includedSyncIdentities](self, "includedSyncIdentities");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)v28;
          if ((void *)v28 != v52)
          {
            -[HDCloudSyncSequenceRecord includedSyncIdentities](self, "includedSyncIdentities");
            v29 = objc_claimAutoreleasedReturnValue();
            if (!v29)
            {
              v26 = 0;
LABEL_52:
              v39 = v54;

              v40 = v55;
LABEL_62:
              if (v39 != v40)
              {

              }
              v11 = v26;
              goto LABEL_24;
            }
            v46 = (void *)v29;
            -[HDCloudSyncSequenceRecord includedSyncIdentities](v7, "includedSyncIdentities");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncSequenceRecord includedSyncIdentities](self, "includedSyncIdentities");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v30;
            if (!objc_msgSend(v30, "isEqual:", v44))
            {
              v26 = 0;
              v31 = v52;
LABEL_55:

              v32 = v54;
              if (v54 == v55)
              {

                goto LABEL_58;
              }

LABEL_57:
LABEL_58:

              if (v12 != v13)
              {

              }
              v11 = v26;
              goto LABEL_31;
            }
          }
          -[HDCloudSyncSequenceRecord includedChildSyncIdentities](v7, "includedChildSyncIdentities");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncSequenceRecord includedChildSyncIdentities](self, "includedChildSyncIdentities");
          v48 = v33;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33 == v49)
            goto LABEL_47;
          -[HDCloudSyncSequenceRecord includedChildSyncIdentities](self, "includedChildSyncIdentities");
          v34 = objc_claimAutoreleasedReturnValue();
          if (!v34)
          {

            v38 = v53;
            v26 = 0;
LABEL_50:
            v31 = v52;
            if (v38 != v52)
            {

              goto LABEL_52;
            }
LABEL_61:

            v40 = v55;
            v39 = v54;
            goto LABEL_62;
          }
          v43 = (void *)v34;
          -[HDCloudSyncSequenceRecord includedChildSyncIdentities](v7, "includedChildSyncIdentities");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncSequenceRecord includedChildSyncIdentities](self, "includedChildSyncIdentities");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v35;
          if (objc_msgSend(v35, "isEqual:", v41))
          {
LABEL_47:
            v37 = -[HDCloudSyncSequenceRecord protocolVersion](v7, "protocolVersion");
            v26 = v37 == -[HDCloudSyncSequenceRecord protocolVersion](self, "protocolVersion");
            v36 = v48;
            if (v48 == v49)
            {

              v31 = v52;
              if (v53 != v52)
                goto LABEL_55;
              goto LABEL_61;
            }
          }
          else
          {
            v26 = 0;
            v36 = v48;
          }

          v38 = v53;
          goto LABEL_50;
        }

        if (v12 == v13)
        {

          goto LABEL_30;
        }

        goto LABEL_28;
      }
    }
    v11 = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  return -[HDCloudSyncCodableSequence hash](self->_underlyingSequence, "hash");
}

- (id)printDescription
{
  uint64_t v3;
  _BOOL4 v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;

  v24 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[HDCloudSyncSequenceRecord slot](self, "slot");
  if ((v3 - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = off_1E6CF3238[(int)v3 - 1];
  }
  v4 = -[HDCloudSyncSequenceRecord isActive](self, "isActive");
  v5 = CFSTR("inactive");
  if (v4)
    v5 = CFSTR("ACTIVE");
  v22 = v5;
  -[HDCloudSyncRecord record](self, "record");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "modificationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDCloudSyncSequenceRecord baselineEpoch](self, "baselineEpoch");
  v17 = -[HDCloudSyncSequenceRecord changeIndex](self, "changeIndex");
  v16 = -[HDCloudSyncSequenceRecord childRecordCount](self, "childRecordCount");
  -[HDCloudSyncSequenceRecord protocolVersion](self, "protocolVersion");
  HKSyncProtocolVersionToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSequenceRecord includedIdentifiers](self, "includedIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSequenceRecord includedSyncIdentities](self, "includedSyncIdentities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSequenceRecord includedChildSyncIdentities](self, "includedChildSyncIdentities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSequenceRecord syncAnchorMap](self, "syncAnchorMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncSequenceRecord frozenSyncAnchorMap](self, "frozenSyncAnchorMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("+ %@ (%@, %@) Epoch: %lld | Change: %lld | Children: %lld | Version: %@\n| Included Identifiers: %@\n| Included Sync Identities: %@\n| Included Child Sync Identities: %@\n| EntityAnchorMap: %@\n| FrozenAnchorMap: %@\n+--------------------------------------------------"), v27, v22, v20, v19, v17, v16, v15, v6, v8, v11, v12, v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)_unitTest_setChildRecordCount:(unint64_t)a3
{
  void *v4;
  id v5;

  -[HDCloudSyncCodableSequence setChildRecordCount:](self->_underlyingSequence, "setChildRecordCount:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("ChildRecordCount"));

}

- (NSUUID)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_underlyingSequence, 0);
}

@end
