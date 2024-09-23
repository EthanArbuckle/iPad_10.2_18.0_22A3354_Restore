@implementation AXSSPunctuationEntryCloudKitHelper

- (id)recordType
{
  return CFSTR("AXPunctuationEntry");
}

- (id)apsEnvironment
{
  return (id)*MEMORY[0x1E0CFE130];
}

- (Class)managedObjectClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXSSPunctuationEntryCloudKitHelper;
  -[AXSSCloudKitHelper dealloc](&v4, sel_dealloc);
}

- (id)testRecordForSchemaCreation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0C95048];
  v5 = a3;
  v6 = [v4 alloc];
  -[AXSSCloudKitHelper zoneSubscription](self, "zoneSubscription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithRecordType:recordID:", v8, v5);

  objc_msgSend(v9, "setRule:", CFSTR("Rule"));
  objc_msgSend(v9, "setVersion:", &unk_1E5FA90E8);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGroupUUID:", v10);

  return v9;
}

- (id)createCKRecordFromEntry:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (objc_class *)MEMORY[0x1E0C95070];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSCloudKitHelper recordZone](self, "recordZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", v8, v10);

  v12 = objc_alloc(MEMORY[0x1E0C95048]);
  -[AXSSPunctuationEntryCloudKitHelper recordType](self, "recordType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordType:recordID:", v13, v11);

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ruleToString:", objc_msgSend(v5, "rule"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRule:", v16);

  objc_msgSend(v5, "punctuation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPunctuation:", v17);

  objc_msgSend(v5, "replacement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setReplacement:", v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v5, "version"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVersion:", v19);

  objc_msgSend(v5, "groupUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setGroupUUID:", v20);
  return v14;
}

- (id)createCKRecordFromObject:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (objc_class *)MEMORY[0x1E0C95070];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSCloudKitHelper recordZone](self, "recordZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", v8, v10);

  v12 = objc_alloc(MEMORY[0x1E0C95048]);
  -[AXSSPunctuationEntryCloudKitHelper recordType](self, "recordType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordType:recordID:", v13, v11);

  objc_msgSend(v5, "rule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRule:", v15);

  objc_msgSend(v5, "punctuation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPunctuation:", v16);

  objc_msgSend(v5, "replacement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setReplacement:", v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v5, "version"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVersion:", v18);

  objc_msgSend(v5, "groupUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setGroupUUID:", v19);
  return v14;
}

- (void)_processPunctuationEntryFromCKRecord:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUIDString:", v6);

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "punctuationEntryForUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setUuid:", v7);
    goto LABEL_10;
  }
  objc_msgSend(v9, "ckChangeTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordChangeTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    if (objc_msgSend(v9, "inCloud"))
    {
      AXLogPunctuationStorage();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v28 = 138412290;
        v29 = v9;
        v14 = "Entry is same as CK - skipping: %@";
LABEL_12:
        _os_log_impl(&dword_1AF5CC000, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v28, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
LABEL_10:
    +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rule");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRule:", objc_msgSend(v21, "stringToRule:", v22));

    objc_msgSend(v3, "punctuation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPunctuation:", v23);

    objc_msgSend(v3, "replacement");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReplacement:", v24);

    objc_msgSend(v3, "groupUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGroupUUID:", v25);

    objc_msgSend(v9, "setInCloud:", 1);
    objc_msgSend(v3, "recordChangeTag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCkChangeTag:", v26);

    +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateEntry:fromCloudKit:", v9, 1);

    AXLogPunctuationStorage();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v28 = 138412290;
      v29 = v9;
      v14 = "Updating punctuation entry: %@";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v9, "lastModifiedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;
  objc_msgSend(v3, "modificationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v20 = v19;

  if (v17 <= v20)
    goto LABEL_10;
  AXLogPunctuationStorage();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v28 = 138412290;
    v29 = v9;
    v14 = "Local entry is newer, we need to update: %@";
    goto LABEL_12;
  }
LABEL_13:

}

- (void)beginWatchingForChanges
{
  void *v3;
  id v4;
  void *v5;
  AXDispatchTimer *v6;
  AXDispatchTimer *changeCoalescer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXSSPunctuationEntryCloudKitHelper;
  -[AXSSCloudKitHelper beginWatchingForChanges](&v8, sel_beginWatchingForChanges);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_punctuationGroupChanged_, CFSTR("AXSSVoiceOverPunctuationGroupsChangedNotification"), 0);

  v4 = objc_alloc(MEMORY[0x1E0CF3978]);
  -[AXSSCloudKitHelper cloudkitQueue](self, "cloudkitQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (AXDispatchTimer *)objc_msgSend(v4, "initWithTargetSerialQueue:", v5);
  changeCoalescer = self->_changeCoalescer;
  self->_changeCoalescer = v6;

  -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](self->_changeCoalescer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
}

- (void)punctuationGroupChanged:(id)a3
{
  id v4;
  AXDispatchTimer *changeCoalescer;
  id v6;
  _QWORD v7[4];
  id v8;
  AXSSPunctuationEntryCloudKitHelper *v9;

  v4 = a3;
  changeCoalescer = self->_changeCoalescer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AXSSPunctuationEntryCloudKitHelper_punctuationGroupChanged___block_invoke;
  v7[3] = &unk_1E5F98988;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[AXDispatchTimer afterDelay:processBlock:](changeCoalescer, "afterDelay:processBlock:", v7, 0.5);

}

uint64_t __62__AXSSPunctuationEntryCloudKitHelper_punctuationGroupChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  AXLogPunctuationStorage();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1AF5CC000, v2, OS_LOG_TYPE_INFO, "Punctuation group changed locally, consolidating for cloud push: %@", (uint8_t *)&v7, 0xCu);
  }

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlockAndWait:", &__block_literal_global_14);

  return objc_msgSend(*(id *)(a1 + 40), "processLocalChangesAndPush");
}

void __62__AXSSPunctuationEntryCloudKitHelper_punctuationGroupChanged___block_invoke_16()
{
  void *v0;
  id v1;

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedObjectContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "refreshAllObjects");

}

- (void)clearRecordsForPurging:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        AXLogPunctuationStorage();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[AXSSPunctuationEntryCloudKitHelper clearRecordsForPurging:].cold.1(v18, v8, &v19, v9);

        +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v8, "recordName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
        objc_msgSend(v10, "removeCloudRecordForPurge:", v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

- (void)retrieveLocalChangesForCloud:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void (**v48)(id, void *, void *, void *);
  id obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  _BYTE v71[14];
  __int16 v72;
  void *v73;
  __int16 v74;
  double v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v48 = (void (**)(id, void *, void *, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "punctuationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v53 = v4;
  v51 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v51)
  {
    v50 = *(_QWORD *)v66;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v66 != v50)
          objc_enumerationMutation(obj);
        v52 = v7;
        v8 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v7);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(v8, "entries");
        v55 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v62;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v62 != v11)
                objc_enumerationMutation(v55);
              v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v12);
              AXLogPunctuationStorage();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                v26 = objc_msgSend(v13, "inCloud");
                objc_msgSend(v13, "ckChangeTag");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "timeIntervalSinceReferenceDate");
                v30 = v29;
                objc_msgSend(v13, "ckRecordProcessDate");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "timeIntervalSinceReferenceDate");
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v71 = v26;
                *(_WORD *)&v71[4] = 2112;
                *(_QWORD *)&v71[6] = v27;
                v72 = 2112;
                v73 = v13;
                v74 = 2048;
                v75 = v30 - v32;
                _os_log_debug_impl(&dword_1AF5CC000, v14, OS_LOG_TYPE_DEBUG, "Is entry in icloud? %d, tag: %@: %@, last mod date: %f", buf, 0x26u);

                v4 = v53;
              }

              v15 = objc_msgSend(v13, "inCloud");
              if (v15)
              {
                objc_msgSend(v13, "ckChangeTag");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v3 = v16;
                if (v16)
                  goto LABEL_23;
              }
              objc_msgSend(v13, "ckRecordProcessDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v17)
              {

                if (v15)
LABEL_22:
                -[AXSSPunctuationEntryCloudKitHelper createCKRecordFromEntry:](self, "createCKRecordFromEntry:", v13);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v24);

                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setCkRecordProcessDate:", v25);

                +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "updateEntry:", v13);
LABEL_23:

                goto LABEL_24;
              }
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "timeIntervalSinceReferenceDate");
              v20 = v19;
              objc_msgSend(v13, "ckRecordProcessDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "timeIntervalSinceReferenceDate");
              v23 = v20 - v22;

              if ((v15 & 1) != 0)
              if (v23 > 60.0)
                goto LABEL_22;
LABEL_24:
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
          }
          while (v10);
        }

        v7 = v52 + 1;
      }
      while (v52 + 1 != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v51);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSSPunctuationEntry description](AXSSPunctuationEntry, "description");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "cloudRecordsToPurge:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v56 = v36;
  v37 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v58 != v39)
          objc_enumerationMutation(v56);
        v41 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v42 = objc_alloc(MEMORY[0x1E0C95070]);
        objc_msgSend(v41, "UUIDString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSSCloudKitHelper recordZone](self, "recordZone");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "zoneID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v42, "initWithRecordName:zoneID:", v43, v45);

        objc_msgSend(v33, "addObject:", v46);
        AXLogPunctuationStorage();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v71 = v41;
          _os_log_impl(&dword_1AF5CC000, v47, OS_LOG_TYPE_INFO, "Purging entry: %@", buf, 0xCu);
        }

        v4 = v53;
      }
      v38 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v38);
  }

  v48[2](v48, v4, v33, &__block_literal_global_21_0);
}

void __67__AXSSPunctuationEntryCloudKitHelper_retrieveLocalChangesForCloud___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithUUIDString:", v5);

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "punctuationEntryForUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogPunctuationStorage();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15 = 138412802;
    v16 = v2;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1AF5CC000, v9, OS_LOG_TYPE_INFO, "Processing entry cloud retreival: %@ %@ %@", (uint8_t *)&v15, 0x20u);
  }

  if (v8)
  {
    objc_msgSend(v8, "setInCloud:", 1);
    objc_msgSend(v2, "groupUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupUUID:", v10);

    objc_msgSend(v2, "recordChangeTag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCkChangeTag:", v11);

    objc_msgSend(v8, "setCkRecordProcessDate:", 0);
    +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateEntry:fromCloudKit:", v8, 1);

    AXLogPunctuationStorage();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "ckChangeTag");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v14;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1AF5CC000, v13, OS_LOG_TYPE_INFO, "Marked in icloud with new tag: %@: %@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  AXLogPunctuationStorage();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1AF5CC000, v9, OS_LOG_TYPE_DEFAULT, "Received server updates: %@, %@", buf, 0x16u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[AXSSPunctuationEntryCloudKitHelper _processPunctuationEntryFromCKRecord:](self, "_processPunctuationEntryFromCKRecord:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)processRecordDeletionsFromServer:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v8, "recordName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

        +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "punctuationEntryForUUID:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeEntry:", v13);

        AXLogPunctuationStorage();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v8;
          v22 = 2112;
          v23 = v13;
          _os_log_impl(&dword_1AF5CC000, v15, OS_LOG_TYPE_DEFAULT, "Removing entry from server push: %@ %@", buf, 0x16u);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeCoalescer, 0);
}

- (void)clearRecordsForPurging:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1AF5CC000, a4, OS_LOG_TYPE_DEBUG, "Committing record purge entry: %@", a1, 0xCu);

}

@end
