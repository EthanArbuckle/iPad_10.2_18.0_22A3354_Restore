@implementation HDCloudSyncZone

- (id)initForZoneIdentifier:(id)a3 repository:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  HDCloudSyncZone *v10;
  HDCloudSyncZone *v11;
  uint64_t v12;
  HDCloudSyncZoneIdentifier *zoneIdentifier;
  NSMutableArray *v14;
  NSMutableArray *storeRecords;
  NSMutableArray *v16;
  NSMutableArray *orphanedSequenceRecords;
  NSMutableArray *v18;
  NSMutableArray *participantRecords;
  NSMutableArray *v20;
  NSMutableArray *authorizationRecords;
  NSMutableArray *v22;
  NSMutableArray *transactionRecords;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HDCloudSyncZone;
  v10 = -[HDCloudSyncZone init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_repository, v9);
    v12 = objc_msgSend(v8, "copy");
    zoneIdentifier = v11->_zoneIdentifier;
    v11->_zoneIdentifier = (HDCloudSyncZoneIdentifier *)v12;

    v11->_zoneType = a5;
    v11->_purpose = 2;
    v11->_validatedForSharing = objc_msgSend(v8, "scope") == 2;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    storeRecords = v11->_storeRecords;
    v11->_storeRecords = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orphanedSequenceRecords = v11->_orphanedSequenceRecords;
    v11->_orphanedSequenceRecords = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    participantRecords = v11->_participantRecords;
    v11->_participantRecords = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    authorizationRecords = v11->_authorizationRecords;
    v11->_authorizationRecords = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transactionRecords = v11->_transactionRecords;
    v11->_transactionRecords = v22;

  }
  return v11;
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_records, "count") == 0;
}

- (BOOL)hasOrphanedSequenceRecords
{
  return -[NSMutableArray count](self->_orphanedSequenceRecords, "count") != 0;
}

- (BOOL)addRecord:(id)a3 error:(id *)a4
{
  id v7;
  NSMutableArray *records;
  NSMutableArray *v9;
  NSMutableArray *v10;
  BOOL v11;
  id *p_registryRecord;
  NSMutableArray *participantRecords;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSMutableArray *orphanedSequenceRecords;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  HDCloudSyncZoneIdentifier *zoneIdentifier;
  void *v51;
  NSObject *v52;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  NSMutableArray *obj;
  NSMutableArray *obja;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  records = self->_records;
  if (!records)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_records;
    self->_records = v9;

    records = self->_records;
  }
  -[NSMutableArray addObject:](records, "addObject:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = -[HDCloudSyncZone _addSubscriptionRecord:error:](self, "_addSubscriptionRecord:error:", v7, a4);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_registryRecord = (id *)&self->_registryRecord;
LABEL_7:
    objc_storeStrong(p_registryRecord, a3);
LABEL_15:
    v11 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    participantRecords = self->_participantRecords;
LABEL_14:
    -[NSMutableArray addObject:](participantRecords, "addObject:", v7);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    participantRecords = self->_authorizationRecords;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    participantRecords = self->_transactionRecords;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_registryRecord = (id *)&self->_masterRecord;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v7;
    switch(-[HDCloudSyncZone zoneType](self, "zoneType"))
    {
      case 0:
        v16 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v15, "storeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected store record %@ in master zone."), self, v17);
        goto LABEL_48;
      case 1:
        objc_msgSend(v15, "storeIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncZoneIdentifier zoneIdentifier](self->_zoneIdentifier, "zoneIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hd_storeIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v15;
        v24 = objc_msgSend(v20, "isEqual:", v22);

        if ((v24 & 1) == 0)
        {
          v49 = (void *)MEMORY[0x1E0CB35C8];
          zoneIdentifier = self->_zoneIdentifier;
          objc_msgSend(v23, "storeIdentifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Store record for zone %@ has unexpected store identifier %@"), self, zoneIdentifier, v51);

          v11 = 0;
          goto LABEL_69;
        }
        if (-[NSMutableArray count](self->_storeRecords, "count"))
        {
          v11 = 1;
LABEL_69:
          v15 = v23;
          goto LABEL_49;
        }
        v15 = v23;
        -[NSMutableArray addObject:](self->_storeRecords, "addObject:", v23);
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v53 = self->_orphanedSequenceRecords;
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v69;
          do
          {
            for (i = 0; i != v55; ++i)
            {
              if (*(_QWORD *)v69 != v56)
                objc_enumerationMutation(v53);
              objc_msgSend(v23, "addSequenceHeaderRecord:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
            }
            v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
          }
          while (v55);
        }

        orphanedSequenceRecords = self->_orphanedSequenceRecords;
        self->_orphanedSequenceRecords = 0;
LABEL_41:

LABEL_42:
        v11 = 1;
LABEL_49:

        break;
      case 2:
        -[NSMutableArray addObject:](self->_storeRecords, "addObject:", v15);
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        obj = (NSMutableArray *)-[NSMutableArray copy](self->_orphanedSequenceRecords, "copy");
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v65;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v65 != v27)
                objc_enumerationMutation(obj);
              v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
              objc_msgSend(v29, "storeIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "storeIdentifier");
              v31 = v15;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v30, "isEqual:", v32);

              v15 = v31;
              if (v33)
              {
                objc_msgSend(v31, "addSequenceHeaderRecord:", v29);
                -[NSMutableArray removeObject:](self->_orphanedSequenceRecords, "removeObject:", v29);
              }
            }
            v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
          }
          while (v26);
        }
        orphanedSequenceRecords = obj;
        goto LABEL_41;
      case 3:
        v35 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v15, "storeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected store record %@ in shared summary zone."), self, v17);
        goto LABEL_48;
      case 4:
        v36 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v15, "storeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected store record %@ in private metadata zone."), self, v17);
        goto LABEL_48;
      case 5:
        v37 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v15, "storeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected store record %@ attachment zone."), self, v17);
        goto LABEL_48;
      case 6:
        v38 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v15, "storeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected store record %@ in state sync zone."), self, v17);
        goto LABEL_48;
      case 7:
        v39 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v15, "storeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected store record %@ in context sync zone."), self, v17);
LABEL_48:

        v11 = 0;
        goto LABEL_49;
      default:
        goto LABEL_42;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v7;
      switch(-[HDCloudSyncZone zoneType](self, "zoneType"))
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected sequence record %@ in master zone."), self, v18);
          goto LABEL_67;
        case 1:
          if (!-[NSMutableArray count](self->_storeRecords, "count"))
            goto LABEL_61;
          -[NSMutableArray firstObject](self->_storeRecords, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addSequenceHeaderRecord:", v18);

          goto LABEL_71;
        case 2:
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          obja = self->_storeRecords;
          v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
          if (!v41)
            goto LABEL_60;
          v42 = v41;
          v43 = *(_QWORD *)v61;
          break;
        case 3:
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected sequence record %@ in shared summary zone."), self, v18);
          goto LABEL_67;
        case 4:
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected sequence record %@ in Private Metadata zone."), self, v18);
          goto LABEL_67;
        case 5:
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected sequence record %@ in Attachment zone."), self, v18);
          goto LABEL_67;
        case 6:
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected sequence record %@ in state sync zone."), self, v18);
          goto LABEL_67;
        case 7:
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected sequence record %@ in context sync zone."), self, v18);
LABEL_67:
          v11 = 0;
          goto LABEL_72;
        default:
          goto LABEL_71;
      }
      while (2)
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v61 != v43)
            objc_enumerationMutation(obja);
          v45 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          objc_msgSend(v18, "storeIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "storeIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v46, "isEqual:", v47);

          if (v48)
          {
            objc_msgSend(v45, "addSequenceHeaderRecord:", v18);

            goto LABEL_71;
          }
        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
        if (v42)
          continue;
        break;
      }
LABEL_60:

LABEL_61:
      -[NSMutableArray addObject:](self->_orphanedSequenceRecords, "addObject:", v18);
LABEL_71:
      v11 = 1;
LABEL_72:

    }
    else
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v52 = v19;
        *(_DWORD *)buf = 138543618;
        v73 = v7;
        v74 = 2114;
        v75 = objc_opt_class();
        _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "Ignoring cloud sync record '%{public}@' because it is of unexpected type '%{public}@'", buf, 0x16u);

      }
      v11 = 0;
    }
  }
LABEL_16:

  return v11;
}

- (void)removeRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  HDCloudSyncRegistryRecord *registryRecord;
  void *v8;
  int v9;
  HDCloudSyncMasterRecord *masterRecord;
  NSMutableArray *participantRecords;
  uint64_t v12;
  id v13;
  NSMutableArray *authorizationRecords;
  id v15;
  NSMutableArray *transactionRecords;
  id v17;
  NSMutableArray *storeRecords;
  id v19;
  NSMutableArray *orphanedSequenceRecords;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  -[HDCloudSyncRecord recordID](self->_registryRecord, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    registryRecord = self->_registryRecord;
    self->_registryRecord = 0;

  }
  -[HDCloudSyncRecord recordID](self->_masterRecord, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if (v9)
  {
    masterRecord = self->_masterRecord;
    self->_masterRecord = 0;

  }
  participantRecords = self->_participantRecords;
  v12 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __32__HDCloudSyncZone_removeRecord___block_invoke;
  v30[3] = &unk_1E6CF2110;
  v13 = v4;
  v31 = v13;
  -[NSMutableArray hk_removeObjectsPassingTest:](participantRecords, "hk_removeObjectsPassingTest:", v30);
  authorizationRecords = self->_authorizationRecords;
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __32__HDCloudSyncZone_removeRecord___block_invoke_2;
  v28[3] = &unk_1E6CF2138;
  v15 = v13;
  v29 = v15;
  -[NSMutableArray hk_removeObjectsPassingTest:](authorizationRecords, "hk_removeObjectsPassingTest:", v28);
  transactionRecords = self->_transactionRecords;
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __32__HDCloudSyncZone_removeRecord___block_invoke_3;
  v26[3] = &unk_1E6CF2160;
  v17 = v15;
  v27 = v17;
  -[NSMutableArray hk_removeObjectsPassingTest:](transactionRecords, "hk_removeObjectsPassingTest:", v26);
  storeRecords = self->_storeRecords;
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __32__HDCloudSyncZone_removeRecord___block_invoke_4;
  v24[3] = &unk_1E6CF2188;
  v19 = v17;
  v25 = v19;
  -[NSMutableArray hk_removeObjectsPassingTest:](storeRecords, "hk_removeObjectsPassingTest:", v24);
  orphanedSequenceRecords = self->_orphanedSequenceRecords;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __32__HDCloudSyncZone_removeRecord___block_invoke_5;
  v22[3] = &unk_1E6CF21B0;
  v23 = v19;
  v21 = v19;
  -[NSMutableArray hk_removeObjectsPassingTest:](orphanedSequenceRecords, "hk_removeObjectsPassingTest:", v22);

}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __32__HDCloudSyncZone_removeRecord___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSArray)storeRecords
{
  return (NSArray *)self->_storeRecords;
}

- (NSArray)records
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_records, "copy");
}

- (NSArray)recordNames
{
  void *v2;
  void *v3;

  -[NSMutableArray hk_map:](self->_records, "hk_map:", &__block_literal_global_60);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __30__HDCloudSyncZone_recordNames__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)recordCount
{
  return -[NSMutableArray count](self->_records, "count");
}

- (BOOL)_addSubscriptionRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;

  v6 = a3;
  objc_msgSend(v6, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[HDCloudSyncDataUploadRequestRecord isDataUploadRequestRecord:](HDCloudSyncDataUploadRequestRecord, "isDataUploadRequestRecord:", v7);

  if (v8)
    objc_storeStrong((id *)&self->_dataUploadRequestRecord, a3);

  return v8;
}

- (CKRecordID)zoneShareRecordID
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  v4 = *MEMORY[0x1E0C949F0];
  -[HDCloudSyncZoneIdentifier zoneIdentifier](self->_zoneIdentifier, "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, v5);

  return (CKRecordID *)v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  HDCloudSyncZoneIdentifier *zoneIdentifier;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  zoneIdentifier = self->_zoneIdentifier;
  HDCloudSyncZoneTypeToString(self->_zoneType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncZonePurposeToString(self->_purpose);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ (%@, %@)>"), v4, self, zoneIdentifier, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)storeIdentifier
{
  void *v2;
  void *v3;

  -[HDCloudSyncZone storeRecord](self, "storeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (HDCloudSyncStoreRecord)storeRecord
{
  return (HDCloudSyncStoreRecord *)-[NSMutableArray firstObject](self->_storeRecords, "firstObject");
}

- (HDCloudSyncRepository)repository
{
  return (HDCloudSyncRepository *)objc_loadWeakRetained((id *)&self->_repository);
}

- (HDCloudSyncZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (int64_t)zoneType
{
  return self->_zoneType;
}

- (BOOL)hasLostIdentity
{
  return self->_hasLostIdentity;
}

- (void)setHasLostIdentity:(BOOL)a3
{
  self->_hasLostIdentity = a3;
}

- (HDCloudSyncRegistryRecord)registryRecord
{
  return self->_registryRecord;
}

- (BOOL)hasFutureSchemaRecord
{
  return self->_hasFutureSchemaRecord;
}

- (void)setHasFutureSchemaRecord:(BOOL)a3
{
  self->_hasFutureSchemaRecord = a3;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (CKShare)zoneShare
{
  return self->_zoneShare;
}

- (void)setZoneShare:(id)a3
{
  objc_storeStrong((id *)&self->_zoneShare, a3);
}

- (BOOL)validatedForSharing
{
  return self->_validatedForSharing;
}

- (void)setValidatedForSharing:(BOOL)a3
{
  self->_validatedForSharing = a3;
}

- (HDCloudSyncMasterRecord)masterRecord
{
  return self->_masterRecord;
}

- (HDCloudSyncStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (HDCloudSyncDataUploadRequestRecord)dataUploadRequestRecord
{
  return self->_dataUploadRequestRecord;
}

- (NSArray)participantRecords
{
  return &self->_participantRecords->super;
}

- (NSArray)authorizationRecords
{
  return &self->_authorizationRecords->super;
}

- (NSArray)transactionRecords
{
  return &self->_transactionRecords->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataUploadRequestRecord, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_masterRecord, 0);
  objc_storeStrong((id *)&self->_zoneShare, 0);
  objc_storeStrong((id *)&self->_registryRecord, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_destroyWeak((id *)&self->_repository);
  objc_storeStrong((id *)&self->_transactionRecords, 0);
  objc_storeStrong((id *)&self->_authorizationRecords, 0);
  objc_storeStrong((id *)&self->_participantRecords, 0);
  objc_storeStrong((id *)&self->_orphanedSequenceRecords, 0);
  objc_storeStrong((id *)&self->_storeRecords, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

@end
