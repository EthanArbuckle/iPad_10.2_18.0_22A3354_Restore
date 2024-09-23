@implementation HDCloudSyncStoreRecord

+ (id)recordIDForOwnerIdentifier:(id)a3 storeIdentifier:(id)a4 zoneID:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0C95070];
  v10 = a5;
  v11 = [v9 alloc];
  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = v7;
  v14 = v8;
  v15 = [v12 alloc];
  objc_msgSend(v14, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@/%@/Store"), v13, v16);
  v18 = (void *)objc_msgSend(v11, "initWithRecordName:zoneID:", v17, v10);

  return v18;
}

+ (id)recordIDWithIndividualZoneID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordName:zoneID:", CFSTR("CloudSyncRoot"), v4);

  return v5;
}

+ (BOOL)isStoreRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncStoreRecord"));

  return v4;
}

+ (BOOL)isStoreRecordID:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CloudSyncRoot"));

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "recordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count") == 3)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isEqualToString:", CFSTR("Store"));

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (HDCloudSyncStoreRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
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

- (id)initInSyncCircle:(id)a3 ownerIdentifier:(id)a4 storeIdentifier:(id)a5 syncIdentity:(id)a6 isChild:(BOOL)a7 unified:(BOOL)a8
{
  _BOOL8 v9;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v9 = a7;
  v14 = (void *)MEMORY[0x1E0C95098];
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  if (a8)
    objc_msgSend(v14, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v18);
  else
    objc_msgSend(v14, "hd_individualSyncZoneIDWithSyncCircleIdentifier:storeIdentifier:", v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HDCloudSyncStoreRecord initInSyncCircle:ownerIdentifier:storeIdentifier:syncIdentity:isChild:zoneID:](self, "initInSyncCircle:ownerIdentifier:storeIdentifier:syncIdentity:isChild:zoneID:", v18, v17, v16, v15, v9, v19);

  return v20;
}

- (id)initInSyncCircle:(id)a3 ownerIdentifier:(id)a4 storeIdentifier:(id)a5 syncIdentity:(id)a6 isChild:(BOOL)a7 zoneID:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  unint64_t v24;
  id v25;
  HDCloudSyncCodableStore *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;

  v9 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = v14;
  v17 = a8;
  objc_opt_self();
  v34 = 0;
  v18 = objc_msgSend(v17, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v34);
  v19 = (void *)objc_opt_class();
  if (v18)
    objc_msgSend(v19, "recordIDForOwnerIdentifier:storeIdentifier:zoneID:", v15, v16, v17);
  else
    objc_msgSend(v19, "recordIDWithIndividualZoneID:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncStoreRecord"), v20);
  v22 = (unint64_t)v15;
  v23 = v16;
  v24 = (unint64_t)v13;
  v25 = v21;
  if (self)
  {
    if (!(v22 | v24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithOwnerIdentifier_storeIdentifier_syncIdentity_isChild_pendingOwner_pendingSyncIdentity_active_record_schemaVersion_, self, CFSTR("HDCloudSyncStoreRecord.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ownerIdentifier != nil || syncIdentity != nil"));

    }
    v26 = objc_alloc_init(HDCloudSyncCodableStore);
    -[HDCloudSyncCodableStore setActive:](v26, "setActive:", 1);
    v27 = (void *)objc_msgSend((id)v22, "copy");
    -[HDCloudSyncCodableStore setOwnerIdentifier:](v26, "setOwnerIdentifier:", v27);

    v28 = (void *)objc_msgSend(0, "copy");
    -[HDCloudSyncCodableStore setPendingOwnerIdentifier:](v26, "setPendingOwnerIdentifier:", v28);

    objc_msgSend(0, "codableSyncIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableStore setPendingSyncIdentity:](v26, "setPendingSyncIdentity:", v29);

    objc_msgSend(v23, "hk_dataForUUIDBytes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableStore setStoreIdentifier:](v26, "setStoreIdentifier:", v30);

    -[HDCloudSyncCodableStore setDeviceMode:](v26, "setDeviceMode:", 1);
    -[HDCloudSyncCodableStore setSupportedProtocolVersion:](v26, "setSupportedProtocolVersion:", 1);
    -[HDCloudSyncCodableStore setRequiredProtocolVersion:](v26, "setRequiredProtocolVersion:", 0);
    objc_msgSend((id)v24, "codableSyncIdentity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableStore setSyncIdentity:](v26, "setSyncIdentity:", v31);

    -[HDCloudSyncCodableStore setIsChild:](v26, "setIsChild:", v9);
    self = -[HDCloudSyncStoreRecord initWithCKRecord:schemaVersion:underlyingStore:](self, v25, 1, v26);

  }
  return self;
}

- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingStore:
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)HDCloudSyncStoreRecord;
    v9 = (id *)objc_msgSendSuper2(&v18, sel_initWithCKRecord_schemaVersion_, v7, a3);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 3, a4);
      objc_msgSend(v10[3], "ownerIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hd_setValue:ifChangedForKey:", v11, CFSTR("OwnerIdentifier"));

      objc_msgSend(v10[3], "pendingOwnerIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (const __CFString *)v12;
      else
        v14 = &stru_1E6D11BB8;
      objc_msgSend(v7, "hd_setValue:ifChangedForKey:", v14, CFSTR("PendingOwner"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10[3], "active"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hd_setValue:ifChangedForKey:", v15, CFSTR("Active"));

      objc_msgSend(v10[3], "storeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hd_setValue:ifChangedForKey:", v16, CFSTR("StoreIdentifier"));

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HDCloudSyncSequenceRecord)sequenceRecord
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HDCloudSyncStoreRecord activeSequenceHeaderRecord](self, "activeSequenceHeaderRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (HDCloudSyncSequenceRecord *)v6;
}

- (NSArray)orderedSequenceRecords
{
  HDCloudSyncSequenceRecord *v3;
  HDCloudSyncSequenceRecord *v4;
  HDCloudSyncSequenceRecord *slotASequenceHeaderRecord;
  objc_class *v6;
  HDCloudSyncSequenceRecord *v7;
  id v8;

  v3 = self->_tombstoneSequenceRecord;
  -[HDCloudSyncStoreRecord sequenceRecord](self, "sequenceRecord");
  v4 = (HDCloudSyncSequenceRecord *)objc_claimAutoreleasedReturnValue();
  slotASequenceHeaderRecord = self->_slotASequenceHeaderRecord;
  if (slotASequenceHeaderRecord == v4)
    slotASequenceHeaderRecord = self->_slotBSequenceHeaderRecord;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = slotASequenceHeaderRecord;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "hk_addNonNilObject:", v3);
  objc_msgSend(v8, "hk_addNonNilObject:", v4);
  objc_msgSend(v8, "hk_addNonNilObject:", v7);

  return (NSArray *)v8;
}

- (id)currentSequenceHeaderRecord
{
  HDCloudSyncSequenceRecord **p_slotASequenceHeaderRecord;
  HDCloudSyncSequenceRecord *slotASequenceHeaderRecord;
  HDCloudSyncSequenceRecord **p_slotBSequenceHeaderRecord;
  HDCloudSyncSequenceRecord *slotBSequenceHeaderRecord;
  uint64_t v7;
  HDCloudSyncSequenceRecord **v8;
  HDCloudSyncSequenceRecord *v9;

  p_slotASequenceHeaderRecord = &self->_slotASequenceHeaderRecord;
  slotASequenceHeaderRecord = self->_slotASequenceHeaderRecord;
  p_slotBSequenceHeaderRecord = &self->_slotBSequenceHeaderRecord;
  slotBSequenceHeaderRecord = self->_slotBSequenceHeaderRecord;
  if (slotASequenceHeaderRecord)
  {
    if (slotBSequenceHeaderRecord)
    {
      v7 = -[HDCloudSyncSequenceRecord baselineEpoch](slotASequenceHeaderRecord, "baselineEpoch");
      if (v7 <= -[HDCloudSyncSequenceRecord baselineEpoch](*p_slotBSequenceHeaderRecord, "baselineEpoch"))
        v8 = p_slotBSequenceHeaderRecord;
      else
        v8 = p_slotASequenceHeaderRecord;
      slotBSequenceHeaderRecord = *v8;
    }
    else
    {
      slotBSequenceHeaderRecord = slotASequenceHeaderRecord;
    }
    goto LABEL_10;
  }
  if (slotBSequenceHeaderRecord)
  {
LABEL_10:
    v9 = slotBSequenceHeaderRecord;
    return v9;
  }
  v9 = 0;
  return v9;
}

- (id)clearCurrentSequenceHeaderRecord
{
  void *v3;
  void *v4;

  -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStoreRecord _clearSequenceHeaderRecord:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_clearSequenceHeaderRecord:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = a1 + 4;
    if ((id)a1[4] == v3 || (v6 = a1 + 5, (id)a1[5] == v3) || (v6 = a1 + 6, (id)a1[6] == v3))
    {
      *v6 = 0;

      objc_msgSend(v4, "record");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)oldSequenceHeaderRecord
{
  HDCloudSyncSequenceRecord *v3;
  HDCloudSyncSequenceRecord *v4;
  HDCloudSyncSequenceRecord *slotBSequenceHeaderRecord;
  HDCloudSyncSequenceRecord *v6;

  -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
  v3 = (HDCloudSyncSequenceRecord *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  slotBSequenceHeaderRecord = self->_slotBSequenceHeaderRecord;
  if (v3 == self->_slotASequenceHeaderRecord)
  {
LABEL_6:
    v6 = slotBSequenceHeaderRecord;
    goto LABEL_7;
  }
  if (v3 == slotBSequenceHeaderRecord)
  {
    slotBSequenceHeaderRecord = self->_slotASequenceHeaderRecord;
    goto LABEL_6;
  }
LABEL_4:
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)clearOldSequenceHeaderRecord
{
  void *v3;
  void *v4;

  -[HDCloudSyncStoreRecord oldSequenceHeaderRecord](self, "oldSequenceHeaderRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStoreRecord _clearSequenceHeaderRecord:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activeSequenceHeaderRecord
{
  HDCloudSyncSequenceRecord *v3;
  BOOL v4;
  HDCloudSyncSequenceRecord *v5;
  HDCloudSyncSequenceRecord **p_slotASequenceHeaderRecord;
  HDCloudSyncSequenceRecord *v7;

  -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
  v3 = (HDCloudSyncSequenceRecord *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDCloudSyncSequenceRecord isActive](v3, "isActive");
  v5 = v3;
  if (!v4)
  {
    if (v3 != self->_slotASequenceHeaderRecord
      || (p_slotASequenceHeaderRecord = &self->_slotBSequenceHeaderRecord,
          !-[HDCloudSyncSequenceRecord isActive](self->_slotBSequenceHeaderRecord, "isActive")))
    {
      if (v3 != self->_slotBSequenceHeaderRecord
        || (p_slotASequenceHeaderRecord = &self->_slotASequenceHeaderRecord,
            !-[HDCloudSyncSequenceRecord isActive](self->_slotASequenceHeaderRecord, "isActive")))
      {
        v7 = 0;
        goto LABEL_9;
      }
    }
    v5 = *p_slotASequenceHeaderRecord;
  }
  v7 = v5;
LABEL_9:

  return v7;
}

- (id)pendingSequenceHeaderRecord
{
  HDCloudSyncSequenceRecord *v3;
  HDCloudSyncSequenceRecord *v4;
  _BOOL4 v5;
  HDCloudSyncSequenceRecord *v6;
  HDCloudSyncSequenceRecord **p_slotASequenceHeaderRecord;
  HDCloudSyncSequenceRecord *v8;

  -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
  v3 = (HDCloudSyncSequenceRecord *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = -[HDCloudSyncSequenceRecord isActive](v3, "isActive");
    v6 = v4;
    if (v5)
    {
      if (v4 != self->_slotASequenceHeaderRecord
        || (p_slotASequenceHeaderRecord = &self->_slotBSequenceHeaderRecord,
            -[HDCloudSyncSequenceRecord isActive](self->_slotBSequenceHeaderRecord, "isActive")))
      {
        if (v4 != self->_slotBSequenceHeaderRecord)
          goto LABEL_7;
        p_slotASequenceHeaderRecord = &self->_slotASequenceHeaderRecord;
        if (-[HDCloudSyncSequenceRecord isActive](self->_slotASequenceHeaderRecord, "isActive"))
          goto LABEL_7;
      }
      v6 = *p_slotASequenceHeaderRecord;
    }
    v8 = v6;
    goto LABEL_10;
  }
LABEL_7:
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)clearPendingSequenceHeaderRecord
{
  void *v3;
  void *v4;

  -[HDCloudSyncStoreRecord pendingSequenceHeaderRecord](self, "pendingSequenceHeaderRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStoreRecord _clearSequenceHeaderRecord:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)clearTombstoneSequenceHeaderRecord
{
  void *v3;
  void *v4;
  HDCloudSyncSequenceRecord *tombstoneSequenceRecord;

  -[HDCloudSyncRecord record](self->_tombstoneSequenceRecord, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  tombstoneSequenceRecord = self->_tombstoneSequenceRecord;
  self->_tombstoneSequenceRecord = 0;

  return v4;
}

- (id)addNewSequenceHeaderRecordWithSyncAnchorMap:(id)a3 includedIdentifiers:(id)a4 includedSyncIdentities:(id)a5 includedChildSyncIdentities:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  char v22;
  id v23;
  void *v25;
  id v26;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (objc_msgSend(v15, "slot") == 1)
      v17 = 2;
    else
      v17 = 1;
    v18 = -[HDCloudSyncSequenceRecord initForSequenceSlot:syncAnchorMap:changeIndex:baselineEpoch:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:storeRecord:]([HDCloudSyncSequenceRecord alloc], "initForSequenceSlot:syncAnchorMap:changeIndex:baselineEpoch:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:storeRecord:", v17, v14, objc_msgSend(v16, "changeIndex"), objc_msgSend(v16, "baselineEpoch") + 1, v13, v12, v11, self);

    if (objc_msgSend(v18, "slot") != 1)
    {
      v19 = 40;
      goto LABEL_9;
    }
  }
  else
  {
    v18 = -[HDCloudSyncSequenceRecord initForSequenceSlot:syncAnchorMap:changeIndex:baselineEpoch:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:storeRecord:]([HDCloudSyncSequenceRecord alloc], "initForSequenceSlot:syncAnchorMap:changeIndex:baselineEpoch:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:storeRecord:", 1, v14, 0, 0, v13, v12, v11, self);

  }
  v19 = 32;
LABEL_9:
  v20 = (objc_class *)v18;
  v21 = *(Class *)((char *)&self->super.super.isa + v19);
  *(Class *)((char *)&self->super.super.isa + v19) = v20;

  v26 = 0;
  v22 = -[objc_class validateWithError:](v20, "validateWithError:", &v26);
  v23 = v26;
  if ((v22 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 371, CFSTR("Failed to validate sequence record after creation: %@"), v23);

  }
  return v20;
}

- (id)addNewTombstoneSequenceHeaderRecordWithIncludedIdentifiers:(id)a3 includedSyncIdentities:(id)a4 includedChildSyncIdentities:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDCloudSyncSequenceRecord *v12;
  HDSyncAnchorMap *v13;
  HDCloudSyncSequenceRecord *v14;
  HDCloudSyncSequenceRecord *tombstoneSequenceRecord;
  HDCloudSyncSequenceRecord *v16;
  id v17;
  HDCloudSyncSequenceRecord *v18;
  void *v20;
  id v21;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [HDCloudSyncSequenceRecord alloc];
  v13 = objc_alloc_init(HDSyncAnchorMap);
  v14 = -[HDCloudSyncSequenceRecord initForSequenceSlot:syncAnchorMap:changeIndex:baselineEpoch:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:storeRecord:](v12, "initForSequenceSlot:syncAnchorMap:changeIndex:baselineEpoch:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:storeRecord:", 3, v13, 0, -100, v11, v10, v9, self);

  tombstoneSequenceRecord = self->_tombstoneSequenceRecord;
  self->_tombstoneSequenceRecord = v14;

  -[HDCloudSyncSequenceRecord setActive:](self->_tombstoneSequenceRecord, "setActive:", 1);
  v16 = self->_tombstoneSequenceRecord;
  v21 = 0;
  LOBYTE(v11) = -[HDCloudSyncRecord validateWithError:](v16, "validateWithError:", &v21);
  v17 = v21;
  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 390, CFSTR("Failed to validate sequence record after creation: %@"), v17);

  }
  v18 = self->_tombstoneSequenceRecord;

  return v18;
}

- (void)addSequenceHeaderRecord:(id)a3
{
  unsigned int v5;
  id v6;

  v6 = a3;
  v5 = objc_msgSend(v6, "slot") - 1;
  if (v5 <= 2)
    objc_storeStrong((id *)((char *)&self->super.super.isa + *off_1E6CF5090[v5]), a3);

}

- (void)removeSequenceHeaderRecord:(id)a3
{
  int v5;
  HDCloudSyncSequenceRecord **p_tombstoneSequenceRecord;
  HDCloudSyncSequenceRecord *v7;
  void *v8;
  HDCloudSyncSequenceRecord *v9;
  HDCloudSyncSequenceRecord *v10;

  v10 = (HDCloudSyncSequenceRecord *)a3;
  v5 = -[HDCloudSyncSequenceRecord slot](v10, "slot");
  switch(v5)
  {
    case 3:
      p_tombstoneSequenceRecord = &self->_tombstoneSequenceRecord;
      v7 = v10;
      if (self->_tombstoneSequenceRecord != v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 421, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_tombstoneSequenceRecord == record"));
        goto LABEL_13;
      }
LABEL_9:
      v9 = v7;
LABEL_10:
      *p_tombstoneSequenceRecord = 0;

      break;
    case 2:
      p_tombstoneSequenceRecord = &self->_slotBSequenceHeaderRecord;
      v7 = v10;
      if (self->_slotBSequenceHeaderRecord != v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_slotBSequenceHeaderRecord == record"));
        goto LABEL_13;
      }
      goto LABEL_9;
    case 1:
      p_tombstoneSequenceRecord = &self->_slotASequenceHeaderRecord;
      v7 = v10;
      if (self->_slotASequenceHeaderRecord != v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_slotASequenceHeaderRecord == record"));
LABEL_13:

        v9 = *p_tombstoneSequenceRecord;
        goto LABEL_10;
      }
      goto LABEL_9;
  }

}

- (BOOL)hasActiveSequence
{
  return -[HDCloudSyncSequenceRecord isActive](self->_slotASequenceHeaderRecord, "isActive")
      || -[HDCloudSyncSequenceRecord isActive](self->_slotBSequenceHeaderRecord, "isActive");
}

- (BOOL)hasSequenceWithFutureProtocolVersion
{
  return -[HDCloudSyncSequenceRecord protocolVersion](self->_slotASequenceHeaderRecord, "protocolVersion") > 16
      || -[HDCloudSyncSequenceRecord protocolVersion](self->_slotBSequenceHeaderRecord, "protocolVersion") > 16;
}

- (id)sequenceRecordWithRecordID:(id)a3
{
  id v4;
  HDCloudSyncSequenceRecord **p_slotASequenceHeaderRecord;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  HDCloudSyncSequenceRecord *v15;

  v4 = a3;
  p_slotASequenceHeaderRecord = &self->_slotASequenceHeaderRecord;
  -[HDCloudSyncRecord record](self->_slotASequenceHeaderRecord, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if ((v8 & 1) != 0)
    goto LABEL_4;
  p_slotASequenceHeaderRecord = &self->_slotBSequenceHeaderRecord;
  -[HDCloudSyncRecord record](self->_slotBSequenceHeaderRecord, "record");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v4);

  if ((v11 & 1) != 0)
    goto LABEL_4;
  p_slotASequenceHeaderRecord = &self->_tombstoneSequenceRecord;
  -[HDCloudSyncRecord record](self->_tombstoneSequenceRecord, "record");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v4);

  if (v14)
LABEL_4:
    v15 = *p_slotASequenceHeaderRecord;
  else
    v15 = 0;

  return v15;
}

- (NSUUID)storeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3A28];
  -[HDCloudSyncCodableStore storeIdentifier](self->_underlyingStore, "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_UUIDWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (NSString)ownerIdentifier
{
  return -[HDCloudSyncCodableStore ownerIdentifier](self->_underlyingStore, "ownerIdentifier");
}

- (HDSyncIdentity)syncIdentity
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  HDCloudSyncStoreRecord *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[HDCloudSyncCodableStore hasSyncIdentity](self->_underlyingStore, "hasSyncIdentity"))
  {
    -[HDCloudSyncCodableStore syncIdentity](self->_underlyingStore, "syncIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;

    if (!v4)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = self;
        _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "Failed to decode underlying sync identity for record %@.", buf, 0xCu);
      }
    }

  }
  else
  {
    v4 = 0;
  }
  return (HDSyncIdentity *)v4;
}

- (void)repairOwnerIdentifier:(id)a3
{
  HDCloudSyncCodableStore *underlyingStore;
  id v6;
  void *v7;
  void *v8;
  id v9;

  underlyingStore = self->_underlyingStore;
  v6 = a3;
  -[HDCloudSyncCodableStore ownerIdentifier](underlyingStore, "ownerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_underlyingStore.ownerIdentifier == nil"));

  }
  -[HDCloudSyncCodableStore setOwnerIdentifier:](self->_underlyingStore, "setOwnerIdentifier:", v6);
  -[HDCloudSyncRecord record](self, "record");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("OwnerIdentifier"));

}

- (NSString)pendingOwner
{
  void *v3;
  char v4;
  void *v5;

  -[HDCloudSyncCodableStore pendingOwnerIdentifier](self->_underlyingStore, "pendingOwnerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", &stru_1E6D11BB8);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[HDCloudSyncCodableStore pendingOwnerIdentifier](self->_underlyingStore, "pendingOwnerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (void)setPendingOwner:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[HDCloudSyncCodableStore pendingOwnerIdentifier](self->_underlyingStore, "pendingOwnerIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v12 = v6;
  if (v5 != v6 && (!v6 || (objc_msgSend(v5, "isEqual:", v6) & 1) == 0))
    -[HDCloudSyncCodableStore setPendingOwnerIdentifier:](self->_underlyingStore, "setPendingOwnerIdentifier:", v12);

  -[HDCloudSyncRecord record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PendingOwner"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v9 = objc_msgSend(v12, "copy");
    v10 = v8;
    if (v8 == (__CFString *)v9)
      goto LABEL_12;
    v10 = (__CFString *)v9;
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    v10 = &stru_1E6D11BB8;
    if (v8 == &stru_1E6D11BB8)
      goto LABEL_12;
  }
  if ((-[__CFString isEqual:](v8, "isEqual:", v10) & 1) == 0)
  {
LABEL_11:
    -[HDCloudSyncRecord record](self, "record");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("PendingOwner"));

  }
LABEL_12:

}

- (HDSyncIdentity)pendingSyncIdentity
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  HDCloudSyncStoreRecord *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[HDCloudSyncCodableStore hasPendingSyncIdentity](self->_underlyingStore, "hasPendingSyncIdentity"))
  {
    -[HDCloudSyncCodableStore pendingSyncIdentity](self->_underlyingStore, "pendingSyncIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;

    if (!v4)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = self;
        _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "Failed to decode underlying pending sync identity for record %@.", buf, 0xCu);
      }
    }

  }
  else
  {
    v4 = 0;
  }
  return (HDSyncIdentity *)v4;
}

- (void)setPendingSyncIdentity:(id)a3
{
  HDCloudSyncCodableStore *underlyingStore;
  id v5;
  id v6;
  id v7;

  underlyingStore = self->_underlyingStore;
  v5 = a3;
  -[HDCloudSyncCodableStore pendingSyncIdentity](underlyingStore, "pendingSyncIdentity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "codableSyncIdentity");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6 && (!v6 || (objc_msgSend(v7, "isEqual:", v6) & 1) == 0))
    -[HDCloudSyncCodableStore setPendingSyncIdentity:](self->_underlyingStore, "setPendingSyncIdentity:", v6);

}

- (int64_t)order
{
  return -[HDCloudSyncCodableStore order](self->_underlyingStore, "order");
}

- (void)setOrder:(int64_t)a3
{
  -[HDCloudSyncCodableStore setOrder:](self->_underlyingStore, "setOrder:", a3);
}

- (BOOL)isActive
{
  return -[HDCloudSyncCodableStore active](self->_underlyingStore, "active");
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[HDCloudSyncCodableStore active](self->_underlyingStore, "active") != a3)
  {
    -[HDCloudSyncCodableStore setActive:](self->_underlyingStore, "setActive:", v3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncRecord record](self, "record");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Active"));

  }
}

- (BOOL)isChild
{
  _BOOL4 v3;

  v3 = -[HDCloudSyncCodableStore hasIsChild](self->_underlyingStore, "hasIsChild");
  if (v3)
    LOBYTE(v3) = -[HDCloudSyncCodableStore isChild](self->_underlyingStore, "isChild");
  return v3;
}

- (NSString)productType
{
  return -[HDCloudSyncCodableStore productType](self->_underlyingStore, "productType");
}

- (void)setProductType:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 571, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("productType != nil"));

  }
  -[HDCloudSyncCodableStore productType](self->_underlyingStore, "productType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v5 && v6 != v7)
  {
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v6 != v7)
LABEL_8:
    -[HDCloudSyncCodableStore setProductType:](self->_underlyingStore, "setProductType:", v8);
LABEL_9:

  -[HDCloudSyncRecord record](self, "record");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ProductType"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  v14 = v11;
  if (v5 && v10 != v11)
  {
    if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v10 != v11)
  {
LABEL_14:
    -[HDCloudSyncRecord record](self, "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("ProductType"));

  }
LABEL_15:

}

- (NSString)systemBuildVersion
{
  return -[HDCloudSyncCodableStore systemBuildVersion](self->_underlyingStore, "systemBuildVersion");
}

- (void)setSystemBuildVersion:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 584, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemBuildVersion != nil"));

  }
  -[HDCloudSyncCodableStore systemBuildVersion](self->_underlyingStore, "systemBuildVersion");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v5 && v6 != v7)
  {
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v6 != v7)
LABEL_8:
    -[HDCloudSyncCodableStore setSystemBuildVersion:](self->_underlyingStore, "setSystemBuildVersion:", v8);
LABEL_9:

  -[HDCloudSyncRecord record](self, "record");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SystemBuildVersion"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  v14 = v11;
  if (v5 && v10 != v11)
  {
    if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v10 != v11)
  {
LABEL_14:
    -[HDCloudSyncRecord record](self, "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("SystemBuildVersion"));

  }
LABEL_15:

}

- (NSString)deviceName
{
  return -[HDCloudSyncCodableStore deviceName](self->_underlyingStore, "deviceName");
}

- (void)setDeviceName:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStoreRecord.m"), 597, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceName != nil"));

  }
  -[HDCloudSyncCodableStore deviceName](self->_underlyingStore, "deviceName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v5 && v6 != v7)
  {
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v6 != v7)
LABEL_8:
    -[HDCloudSyncCodableStore setDeviceName:](self->_underlyingStore, "setDeviceName:", v8);
LABEL_9:

  -[HDCloudSyncRecord record](self, "record");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DeviceName"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  v14 = v11;
  if (v5 && v10 != v11)
  {
    if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v10 != v11)
  {
LABEL_14:
    -[HDCloudSyncRecord record](self, "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("DeviceName"));

  }
LABEL_15:

}

- (int)deviceMode
{
  return -[HDCloudSyncCodableStore deviceMode](self->_underlyingStore, "deviceMode");
}

- (void)setDeviceMode:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  if (-[HDCloudSyncCodableStore deviceMode](self->_underlyingStore, "deviceMode") != a3)
    -[HDCloudSyncCodableStore setDeviceMode:](self->_underlyingStore, "setDeviceMode:", v3);
  -[HDCloudSyncRecord record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DeviceMode"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6 && (!v6 || (objc_msgSend(v8, "isEqual:", v6) & 1) == 0))
  {
    -[HDCloudSyncRecord record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("DeviceMode"));

  }
}

- (int)supportedProtocolVersion
{
  return -[HDCloudSyncCodableStore supportedProtocolVersion](self->_underlyingStore, "supportedProtocolVersion");
}

- (void)setSupportedProtocolVersion:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  if (-[HDCloudSyncCodableStore supportedProtocolVersion](self->_underlyingStore, "supportedProtocolVersion") != a3)
    -[HDCloudSyncCodableStore setSupportedProtocolVersion:](self->_underlyingStore, "setSupportedProtocolVersion:", v3);
  -[HDCloudSyncRecord record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SupportedProtocolVersion"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6 && (!v6 || (objc_msgSend(v8, "isEqual:", v6) & 1) == 0))
  {
    -[HDCloudSyncRecord record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("SupportedProtocolVersion"));

  }
}

- (int)requiredProtocolVersion
{
  return -[HDCloudSyncCodableStore requiredProtocolVersion](self->_underlyingStore, "requiredProtocolVersion");
}

- (void)setRequiredProtocolVersion:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  if (-[HDCloudSyncCodableStore requiredProtocolVersion](self->_underlyingStore, "requiredProtocolVersion") != a3)
    -[HDCloudSyncCodableStore setRequiredProtocolVersion:](self->_underlyingStore, "setRequiredProtocolVersion:", v3);
  -[HDCloudSyncRecord record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RequiredProtocolVersion"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6 && (!v6 || (objc_msgSend(v8, "isEqual:", v6) & 1) == 0))
  {
    -[HDCloudSyncRecord record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("RequiredProtocolVersion"));

  }
}

- (HDCloudSyncShardPredicate)shardPredicate
{
  HDCloudSyncShardPredicate *v3;
  void *v4;
  HDCloudSyncShardPredicate *v5;

  if (-[HDCloudSyncCodableStore hasShardPredicate](self->_underlyingStore, "hasShardPredicate"))
  {
    v3 = [HDCloudSyncShardPredicate alloc];
    -[HDCloudSyncCodableStore shardPredicate](self->_underlyingStore, "shardPredicate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HDCloudSyncShardPredicate initWithCodableShardPredicate:](v3, "initWithCodableShardPredicate:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setShardPredicate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "codablePredicate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableStore shardPredicate](self->_underlyingStore, "shardPredicate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v4)
  {

  }
  else
  {
    -[HDCloudSyncCodableStore shardPredicate](self->_underlyingStore, "shardPredicate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[HDCloudSyncCodableStore shardPredicate](self->_underlyingStore, "shardPredicate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqual:", v7);

      v9 = v10;
      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[HDCloudSyncCodableStore setShardPredicate:](self->_underlyingStore, "setShardPredicate:", v10);
  }
  v9 = v10;
LABEL_9:

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

+ (HDCloudSyncStoreRecord)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  HDCloudSyncCodableStore *v14;
  id *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  HDCloudSyncCodableStore *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HDCloudSyncCodableStore *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HDCloudSyncCodableStore *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;

  v6 = a3;
  objc_msgSend(v6, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("CloudSyncStoreRecord"));

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "hd_requiredValueForKey:type:error:", CFSTR("Version"), objc_opt_class(), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v15 = 0;
LABEL_79:

      goto LABEL_80;
    }
    v67 = 0;
    objc_msgSend(v6, "hd_optionalEncryptedValueForKey:type:error:", CFSTR("UnderlyingMessage"), objc_opt_class(), &v67);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v67;
    v12 = v11;
    if (v10)
      v13 = 1;
    else
      v13 = v11 == 0;
    if (!v13)
    {
      if (a4)
      {
        v15 = 0;
        *a4 = objc_retainAutorelease(v11);
      }
      else
      {
        _HKLogDroppedError();
        v15 = 0;
      }
      goto LABEL_78;
    }
    if (v10)
    {
      v14 = -[HDCloudSyncCodableStore initWithData:]([HDCloudSyncCodableStore alloc], "initWithData:", v10);
      if (v14)
      {
        v15 = -[HDCloudSyncStoreRecord initWithCKRecord:schemaVersion:underlyingStore:]([HDCloudSyncStoreRecord alloc], v6, objc_msgSend(v9, "integerValue"), v14);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Underlying message present but does not decode."));
        v15 = 0;
      }

      goto LABEL_78;
    }
    v20 = objc_alloc_init(HDCloudSyncCodableStore);
    objc_msgSend(v6, "hd_requiredValueForKey:type:error:", CFSTR("OwnerIdentifier"), objc_opt_class(), a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableStore setOwnerIdentifier:](v20, "setOwnerIdentifier:", v21);

    v60 = v20;
    -[HDCloudSyncCodableStore ownerIdentifier](v20, "ownerIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v15 = 0;
      v25 = v20;
LABEL_77:

LABEL_78:
      goto LABEL_79;
    }
    objc_msgSend(v6, "hd_requiredValueForKey:type:error:", CFSTR("StoreIdentifier"), objc_opt_class(), a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v15 = 0;
      v25 = v20;
LABEL_76:

      goto LABEL_77;
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("record has invalid owner UUID data '%@'"), v23);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v33;
      if (v33)
      {
        if (a4)
        {
          v32 = objc_retainAutorelease(v33);
          v15 = 0;
          *a4 = v32;
        }
        else
        {
          _HKLogDroppedError();
          v15 = 0;
        }
        v29 = v32;
      }
      else
      {
        v29 = 0;
        v15 = 0;
      }
      goto LABEL_73;
    }
    v25 = v60;
    -[HDCloudSyncCodableStore setStoreIdentifier:](v60, "setStoreIdentifier:", v23);
    objc_msgSend(v6, "hd_requiredValueForKey:type:error:", CFSTR("PendingOwner"), objc_opt_class(), a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableStore setPendingOwnerIdentifier:](v60, "setPendingOwnerIdentifier:", v26);

    -[HDCloudSyncCodableStore pendingOwnerIdentifier](v60, "pendingOwnerIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v15 = 0;
LABEL_75:

      goto LABEL_76;
    }
    objc_msgSend(v6, "hd_requiredValueForKey:type:error:", CFSTR("Active"), objc_opt_class(), a4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (!v28)
    {
      v15 = 0;
LABEL_74:

      goto LABEL_75;
    }
    -[HDCloudSyncCodableStore setActive:](v60, "setActive:", objc_msgSend(v28, "BOOLValue"));
    v66 = 0;
    objc_msgSend(v6, "hd_optionalValueForKey:type:error:", CFSTR("SupportedProtocolVersion"), objc_opt_class(), &v66);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v66;
    v32 = v31;
    v59 = v30;
    if (!v30 && v31)
    {
      if (a4)
      {
        v32 = objc_retainAutorelease(v31);
        v15 = 0;
        *a4 = v32;
      }
      else
      {
        _HKLogDroppedError();
        v15 = 0;
      }
      goto LABEL_72;
    }
    if (v30)
      v34 = objc_msgSend(v30, "integerValue");
    else
      v34 = 0;
    -[HDCloudSyncCodableStore setSupportedProtocolVersion:](v60, "setSupportedProtocolVersion:", v34);
    v65 = v32;
    objc_msgSend(v6, "hd_optionalValueForKey:type:error:", CFSTR("RequiredProtocolVersion"), objc_opt_class(), &v65);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v65;

    v36 = v58;
    if (!v58 && v35)
    {
      if (a4)
      {
        v37 = objc_retainAutorelease(v35);
        v15 = 0;
        *a4 = v37;
        v38 = v37;
      }
      else
      {
        _HKLogDroppedError();
        v38 = v35;
        v15 = 0;
      }
      goto LABEL_71;
    }
    v56 = v29;
    v57 = v24;
    if (v58)
      v39 = objc_msgSend(v58, "integerValue");
    else
      v39 = 0;
    -[HDCloudSyncCodableStore setRequiredProtocolVersion:](v60, "setRequiredProtocolVersion:", v39);
    v64 = v35;
    objc_msgSend(v6, "hd_optionalValueForKey:type:error:", CFSTR("SystemBuildVersion"), objc_opt_class(), &v64);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v64;

    -[HDCloudSyncCodableStore setSystemBuildVersion:](v60, "setSystemBuildVersion:", v40);
    -[HDCloudSyncCodableStore systemBuildVersion](v60, "systemBuildVersion");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42 || !v41)
    {
      v63 = v41;
      objc_msgSend(v6, "hd_optionalValueForKey:type:error:", CFSTR("ProductType"), objc_opt_class(), &v63);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v63;

      -[HDCloudSyncCodableStore setProductType:](v60, "setProductType:", v44);
      -[HDCloudSyncCodableStore productType](v60, "productType");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v46 && v45)
      {
        if (!a4)
        {
          _HKLogDroppedError();
          v38 = v45;
          v15 = 0;
          goto LABEL_70;
        }
        v43 = v45;
        goto LABEL_61;
      }
      v62 = v45;
      objc_msgSend(v6, "hd_optionalValueForKey:type:error:", CFSTR("DeviceName"), objc_opt_class(), &v62);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v62;

      -[HDCloudSyncCodableStore setDeviceName:](v60, "setDeviceName:", v48);
      -[HDCloudSyncCodableStore deviceName](v60, "deviceName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49 || !v41)
      {
        v61 = v41;
        objc_msgSend(v6, "hd_optionalValueForKey:type:error:", CFSTR("DeviceMode"), objc_opt_class(), &v61);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v61;

        v54 = v50;
        v55 = v51;
        if (v50 || !v51)
        {
          if (v50)
            v53 = objc_msgSend(v50, "integerValue");
          else
            v53 = 1;
          -[HDCloudSyncCodableStore setDeviceMode:](v60, "setDeviceMode:", v53);
          v15 = -[HDCloudSyncStoreRecord initWithCKRecord:schemaVersion:underlyingStore:]([HDCloudSyncStoreRecord alloc], v6, objc_msgSend(v9, "integerValue"), v60);
        }
        else if (a4)
        {
          v15 = 0;
          *a4 = objc_retainAutorelease(v51);
        }
        else
        {
          _HKLogDroppedError();
          v15 = 0;
        }
        v29 = v56;
        v36 = v58;

        v24 = v57;
        v38 = v55;
        goto LABEL_71;
      }
    }
    if (!a4)
    {
      _HKLogDroppedError();
      v15 = 0;
      v38 = v41;
      goto LABEL_70;
    }
    v43 = v41;
LABEL_61:
    v47 = objc_retainAutorelease(v43);
    v15 = 0;
    *a4 = v47;
    v38 = v47;
LABEL_70:
    v29 = v56;
    v36 = v58;
LABEL_71:

    v32 = v38;
LABEL_72:

LABEL_73:
    v25 = v60;
    goto LABEL_74;
  }
  v16 = (void *)MEMORY[0x1E0CB35C8];
  v17 = objc_opt_class();
  objc_msgSend(v6, "recordType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v17, a2, CFSTR("record has type (%@), but expected (%@)"), v18, CFSTR("CloudSyncStoreRecord"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();
  }

  v15 = 0;
LABEL_80:

  return (HDCloudSyncStoreRecord *)v15;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return CFSTR("CloudSyncStoreRecord");
}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableStore data](self->_underlyingStore, "data");
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
  void *v12;
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
  objc_super v26;
  uint64_t v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[12];

  v37[10] = *MEMORY[0x1E0C80C00];
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___HDCloudSyncStoreRecord;
  objc_msgSendSuper2(&v26, sel_fieldsForUnprotectedSerialization);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("OwnerIdentifier"), v25, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v24;
  v35 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("StoreIdentifier"), v23, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v22;
  v34 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("PendingOwner"), v20, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v19;
  v33 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("Active"), v18, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v17;
  v32 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("SupportedProtocolVersion"), v16, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v15;
  v31 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("RequiredProtocolVersion"), v14, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v13;
  v30 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("SystemBuildVersion"), v12, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v2;
  v29 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("ProductType"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v4;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("DeviceName"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v6;
  v27 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", CFSTR("DeviceMode"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = -[HDCloudSyncStoreRecord order](self, "order");
  if (v5 >= objc_msgSend(v4, "order"))
  {
    v7 = -[HDCloudSyncStoreRecord order](self, "order");
    if (v7 > objc_msgSend(v4, "order"))
    {
      v6 = 1;
      goto LABEL_14;
    }
    -[HDCloudSyncStoreRecord shardPredicate](self, "shardPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shardPredicate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
        goto LABEL_11;
      v6 = objc_msgSend(v8, "compare:", v9);
      if (v6)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    -[HDCloudSyncRecord record](self, "record");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modificationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "record");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "modificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "hk_isBeforeDate:", v14);

    if ((v15 & 1) != 0)
    {
      v6 = 1;
      goto LABEL_13;
    }
    -[HDCloudSyncRecord record](self, "record");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "modificationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "record");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "modificationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "hk_isAfterDate:", v19);

    if ((v20 & 1) == 0)
    {
      -[HDCloudSyncStoreRecord storeIdentifier](self, "storeIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncStoreRecord storeIdentifier](self, "storeIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v22, "compare:", v24);

      goto LABEL_13;
    }
LABEL_11:
    v6 = -1;
    goto LABEL_13;
  }
  v6 = -1;
LABEL_14:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HDCloudSyncStoreRecord *v4;
  BOOL v5;

  v4 = (HDCloudSyncStoreRecord *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HDCloudSyncCodableStore isEqual:](self->_underlyingStore, "isEqual:", v4->_underlyingStore);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[HDCloudSyncCodableStore hash](self->_underlyingStore, "hash");
}

- (id)printDescription
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  HDCloudSyncSequenceRecord *slotASequenceHeaderRecord;
  void *v27;
  HDCloudSyncSequenceRecord *slotBSequenceHeaderRecord;
  void *v29;
  __CFString *v30;
  HDCloudSyncSequenceRecord *tombstoneSequenceRecord;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[HDCloudSyncCodableStore active](self->_underlyingStore, "active"))
    v4 = CFSTR("ACTIVE");
  else
    v4 = CFSTR("Inactive");
  -[HDCloudSyncStoreRecord systemBuildVersion](self, "systemBuildVersion");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStoreRecord productType](self, "productType");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncStoreRecord deviceMode](self, "deviceMode");
  v55 = v4;
  v56 = v3;
  if ((_DWORD)v5 == 1)
  {
    v6 = CFSTR("Basic");
    goto LABEL_8;
  }
  if ((_DWORD)v5 == 2)
  {
    v6 = CFSTR("Satellite");
LABEL_8:
    v64 = (void *)v6;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  -[HDCloudSyncRecord record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modificationDate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStoreRecord storeIdentifier](self, "storeIdentifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableStore ownerIdentifier](self->_underlyingStore, "ownerIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStoreRecord syncIdentity](self, "syncIdentity");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDCloudSyncStoreRecord isChild](self, "isChild");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v51 = v9;
  -[HDCloudSyncCodableStore pendingOwnerIdentifier](self->_underlyingStore, "pendingOwnerIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("---");
  v50 = v12;
  -[HDCloudSyncCodableStore pendingSyncIdentity](self->_underlyingStore, "pendingSyncIdentity");
  v13 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v13;
  if (v13)
    v14 = (const __CFString *)v13;
  else
    v14 = CFSTR("---");
  v15 = -[HDCloudSyncStoreRecord supportedProtocolVersion](self, "supportedProtocolVersion");
  if (!(_DWORD)v15)
  {
    v16 = CFSTR("Tigris");
    goto LABEL_22;
  }
  if ((_DWORD)v15 == 1)
  {
    v16 = CFSTR("Yukon");
LABEL_22:
    v63 = (void *)v16;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
  v17 = -[HDCloudSyncStoreRecord requiredProtocolVersion](self, "requiredProtocolVersion");
  v49 = v14;
  if (!(_DWORD)v17)
  {
    v18 = CFSTR("Tigris");
    goto LABEL_28;
  }
  if ((_DWORD)v17 == 1)
  {
    v18 = CFSTR("Yukon");
LABEL_28:
    v62 = (void *)v18;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
  -[HDCloudSyncStoreRecord shardPredicate](self, "shardPredicate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "description");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("--");
  v53 = (void *)v19;
  if (v19)
    v20 = (const __CFString *)v19;
  v47 = v20;
  -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v46, "slot");
    if ((v22 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = off_1E6CF50A8[(int)v22 - 1];
    }
  }
  else
  {
    v61 = &stru_1E6D11BB8;
  }
  -[HDCloudSyncStoreRecord oldSequenceHeaderRecord](self, "oldSequenceHeaderRecord");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    -[HDCloudSyncStoreRecord oldSequenceHeaderRecord](self, "oldSequenceHeaderRecord");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v45, "slot");
    if ((v23 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = off_1E6CF50A8[(int)v23 - 1];
    }
  }
  else
  {
    v60 = &stru_1E6D11BB8;
  }
  -[HDCloudSyncStoreRecord activeSequenceHeaderRecord](self, "activeSequenceHeaderRecord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[HDCloudSyncStoreRecord activeSequenceHeaderRecord](self, "activeSequenceHeaderRecord");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v44, "slot");
    if ((v25 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v25);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E6CF50A8[(int)v25 - 1];
    }
  }
  else
  {
    v59 = &stru_1E6D11BB8;
  }
  v52 = (void *)v21;
  slotASequenceHeaderRecord = self->_slotASequenceHeaderRecord;
  if (slotASequenceHeaderRecord)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[HDCloudSyncSequenceRecord description](self->_slotASequenceHeaderRecord, "description");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "hk_stringIndentedBy:prefix:", 2, &stru_1E6D11BB8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("\n%@"), v42);
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = CFSTR("  --");
  }
  slotBSequenceHeaderRecord = self->_slotBSequenceHeaderRecord;
  if (slotBSequenceHeaderRecord)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    -[HDCloudSyncSequenceRecord description](self->_slotBSequenceHeaderRecord, "description");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "hk_stringIndentedBy:prefix:", 2, &stru_1E6D11BB8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("\n%@"), v40);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = CFSTR("  --");
  }
  tombstoneSequenceRecord = self->_tombstoneSequenceRecord;
  if (tombstoneSequenceRecord)
  {
    v32 = (void *)MEMORY[0x1E0CB3940];
    -[HDCloudSyncSequenceRecord description](tombstoneSequenceRecord, "description");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hk_stringIndentedBy:prefix:", 2, &stru_1E6D11BB8);
    v34 = v11;
    v35 = v7;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("\n%@"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "stringWithFormat:", CFSTR("+ %@, %@ on %@, Mode: %@, Modified: %@\n| Store: %@ | Owner: %@ | Sync Identity: %@ | isChild: %@\n| Pending Owner: %@ | Pending Identity: %@\n| Cloud Sync Version: %@ - %@\n| Shard: %@\n| Sequence Headers: Current(%@) Old(%@) Active(%@)\n| Slot A:%@\n| Slot B:%@\n| Tombstones:%@\n+--------------------------------------------------"), v55, v70, v69, v64, v68, v67, v66, v65, v51, v50, v49, v63, v62, v47, v61, v60,
      v59,
      v58,
      v30,
      v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v35;
    v11 = v34;

  }
  else
  {
    objc_msgSend(v56, "stringWithFormat:", CFSTR("+ %@, %@ on %@, Mode: %@, Modified: %@\n| Store: %@ | Owner: %@ | Sync Identity: %@ | isChild: %@\n| Pending Owner: %@ | Pending Identity: %@\n| Cloud Sync Version: %@ - %@\n| Shard: %@\n| Sequence Headers: Current(%@) Old(%@) Active(%@)\n| Slot A:%@\n| Slot B:%@\n| Tombstones:%@\n+--------------------------------------------------"), v55, v70, v69, v64, v68, v67, v66, v65, v51, v50, v49, v63, v62, v47, v61, v60,
      v59,
      v58,
      v30,
      CFSTR("  --"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (slotBSequenceHeaderRecord)
  {

  }
  if (slotASequenceHeaderRecord)
  {

  }
  if (v24)
  {

  }
  if (v48)
  {

  }
  if (v52)
  {

  }
  return v38;
}

- (id)shortDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  _BOOL4 v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
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
  void *v57;
  void *v58;
  id v59;
  id v60[2];

  -[HDCloudSyncCodableStore syncIdentity](self->_underlyingStore, "syncIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = 0;
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v3, v60);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v60[0];

  -[HDCloudSyncCodableStore pendingSyncIdentity](self->_underlyingStore, "pendingSyncIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v4;
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v5, &v59);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v59;

  v8 = (void *)MEMORY[0x1E0CB3940];
  if (-[HDCloudSyncCodableStore active](self->_underlyingStore, "active"))
    v9 = CFSTR("ACTIVE");
  else
    v9 = CFSTR("Inactive");
  -[HDCloudSyncRecord record](self, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modificationDate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStoreRecord systemBuildVersion](self, "systemBuildVersion");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStoreRecord productType](self, "productType");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDCloudSyncStoreRecord deviceMode](self, "deviceMode");
  if ((_DWORD)v11 == 1)
  {
    v12 = CFSTR("Basic");
    goto LABEL_8;
  }
  if ((_DWORD)v11 == 2)
  {
    v12 = CFSTR("Satellite");
LABEL_8:
    v52 = (void *)v12;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v13 = -[HDCloudSyncStoreRecord supportedProtocolVersion](self, "supportedProtocolVersion");
  if (!(_DWORD)v13)
  {
    v14 = CFSTR("Tigris");
    goto LABEL_14;
  }
  if ((_DWORD)v13 == 1)
  {
    v14 = CFSTR("Yukon");
LABEL_14:
    v51 = (void *)v14;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v15 = -[HDCloudSyncStoreRecord requiredProtocolVersion](self, "requiredProtocolVersion");
  v49 = v7;
  v47 = v10;
  v45 = v9;
  v46 = v8;
  if (!(_DWORD)v15)
  {
    v16 = CFSTR("Tigris");
    goto LABEL_20;
  }
  if ((_DWORD)v15 == 1)
  {
    v16 = CFSTR("Yukon");
LABEL_20:
    v50 = (void *)v16;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  -[HDCloudSyncStoreRecord storeIdentifier](self, "storeIdentifier");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableStore ownerIdentifier](self->_underlyingStore, "ownerIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableStore pendingOwnerIdentifier](self->_underlyingStore, "pendingOwnerIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("---");
  v43 = v19;
  v20 = -[HDCloudSyncCodableStore isChild](self->_underlyingStore, "isChild");
  v21 = CFSTR("NO");
  if (v20)
    v21 = CFSTR("YES");
  v42 = v21;
  v48 = (void *)v6;
  if (v6)
    v22 = (const __CFString *)v6;
  else
    v22 = CFSTR("---");
  v41 = v22;
  -[HDCloudSyncStoreRecord shardPredicate](self, "shardPredicate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "description");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = CFSTR("--");
  if (v23)
    v25 = (const __CFString *)v23;
  v40 = v25;
  -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[HDCloudSyncStoreRecord currentSequenceHeaderRecord](self, "currentSequenceHeaderRecord");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v39, "slot");
    if ((v27 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E6CF50A8[(int)v27 - 1];
    }
  }
  else
  {
    v28 = &stru_1E6D11BB8;
  }
  -[HDCloudSyncStoreRecord oldSequenceHeaderRecord](self, "oldSequenceHeaderRecord");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[HDCloudSyncStoreRecord oldSequenceHeaderRecord](self, "oldSequenceHeaderRecord");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v38, "slot");
    if ((v30 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E6CF50A8[(int)v30 - 1];
    }
  }
  else
  {
    v31 = &stru_1E6D11BB8;
  }
  -[HDCloudSyncStoreRecord activeSequenceHeaderRecord](self, "activeSequenceHeaderRecord");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[HDCloudSyncStoreRecord activeSequenceHeaderRecord](self, "activeSequenceHeaderRecord");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "slot");
    if ((v34 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v34);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E6CF50A8[(int)v34 - 1];
    }
    objc_msgSend(v46, "stringWithFormat:", CFSTR("+ (%@, %@) %@ on %@, Mode: %@, Version: %@ - %@\n| Store: %@ | Owner: %@ | Pending: %@\n| isChild: %@ | SyncIdentity: %@ | PendingSyncIdentity: %@\n| Shard: %@\n| Sequence Headers: Current(%@) Old(%@) Active(%@)\n+--------------------------------------------------"), v45, v57, v56, v55, v52, v51, v50, v54, v53, v43, v42, v58, v41, v40, v28, v31,
      v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v46, "stringWithFormat:", CFSTR("+ (%@, %@) %@ on %@, Mode: %@, Version: %@ - %@\n| Store: %@ | Owner: %@ | Pending: %@\n| isChild: %@ | SyncIdentity: %@ | PendingSyncIdentity: %@\n| Shard: %@\n| Sequence Headers: Current(%@) Old(%@) Active(%@)\n+--------------------------------------------------"), v45, v57, v56, v55, v52, v51, v50, v54, v53, v43, v42, v58, v41, v40, v28, v31,
      &stru_1E6D11BB8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v29)
  {

  }
  if (v26)
  {

  }
  return v36;
}

- (HDCloudSyncSequenceRecord)tombstoneSequenceRecord
{
  return self->_tombstoneSequenceRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tombstoneSequenceRecord, 0);
  objc_storeStrong((id *)&self->_slotBSequenceHeaderRecord, 0);
  objc_storeStrong((id *)&self->_slotASequenceHeaderRecord, 0);
  objc_storeStrong((id *)&self->_underlyingStore, 0);
}

@end
