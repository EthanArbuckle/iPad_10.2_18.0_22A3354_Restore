@implementation AXSSPunctuationGroupCloudKitHelper

- (id)recordType
{
  return CFSTR("AXPunctuationGroup");
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
  v4.super_class = (Class)AXSSPunctuationGroupCloudKitHelper;
  -[AXSSCloudKitHelper dealloc](&v4, sel_dealloc);
}

- (id)apsEnvironment
{
  return (id)*MEMORY[0x1E0CFE130];
}

- (id)testRecordForSchemaCreation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C95048];
  v5 = a3;
  v6 = [v4 alloc];
  -[AXSSCloudKitHelper zoneSubscription](self, "zoneSubscription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithRecordType:recordID:", v8, v5);

  objc_msgSend(v9, "setName:", CFSTR("test"));
  return v9;
}

- (id)createCKRecordFromGroup:(id)a3
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
  uint64_t v19;
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
  -[AXSSPunctuationGroupCloudKitHelper recordType](self, "recordType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordType:recordID:", v13, v11);

  objc_msgSend(v5, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setName:", v15);

  objc_msgSend(v5, "basePunctuationUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBasePunctuationGroup:", v17);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend(v5, "version");

  objc_msgSend(v18, "numberWithUnsignedShort:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVersion:", v20);

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
  uint64_t v19;
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
  -[AXSSPunctuationGroupCloudKitHelper recordType](self, "recordType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordType:recordID:", v13, v11);

  objc_msgSend(v5, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setName:", v15);

  objc_msgSend(v5, "basePunctuationUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBasePunctuationGroup:", v17);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend(v5, "version");

  objc_msgSend(v18, "numberWithShort:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVersion:", v20);

  return v14;
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
          -[AXSSPunctuationGroupCloudKitHelper clearRecordsForPurging:].cold.1(v18, v8, &v19, v9);

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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void (**v52)(id, void *, void *, void *);
  int v53;
  void *v54;
  uint64_t v55;
  id obj;
  id obja;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  _BYTE v69[24];
  __int16 v70;
  double v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v52 = (void (**)(id, void *, void *, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punctuationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v64;
    v55 = *(_QWORD *)v64;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v64 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v9);
        AXLogPunctuationStorage();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v53 = objc_msgSend(v10, "inCloud");
          objc_msgSend(v10, "ckChangeTag");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSinceReferenceDate");
          v27 = v26;
          objc_msgSend(v10, "ckRecordProcessDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "timeIntervalSinceReferenceDate");
          v30 = v27 - v29;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "timeIntervalSinceReferenceDate");
          v33 = v32;
          objc_msgSend(v10, "ckRecordProcessDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "timeIntervalSinceReferenceDate");
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v69 = v53;
          *(_WORD *)&v69[4] = 2112;
          *(_QWORD *)&v69[6] = v24;
          *(_WORD *)&v69[14] = 2112;
          *(_QWORD *)&v69[16] = v10;
          v70 = 2048;
          v71 = v30;
          v72 = 2048;
          v73 = v33;
          v74 = 2048;
          v75 = v35;
          _os_log_debug_impl(&dword_1AF5CC000, v11, OS_LOG_TYPE_DEBUG, "Is group in icloud? %d, tag: %@: %@, last mod date: %f[%f-%f]", buf, 0x3Au);

          v8 = v55;
        }

        v12 = objc_msgSend(v10, "inCloud");
        if (v12)
        {
          objc_msgSend(v10, "ckChangeTag");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v13;
          if (v13)
            goto LABEL_20;
        }
        objc_msgSend(v10, "ckRecordProcessDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

          if (v12)
LABEL_17:
          -[AXSSPunctuationGroupCloudKitHelper createCKRecordFromGroup:](self, "createCKRecordFromGroup:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v13);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCkRecordProcessDate:", v21);

          +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "updatePunctuationGroup:", v10);

          AXLogPunctuationStorage();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v69 = v13;
            _os_log_debug_impl(&dword_1AF5CC000, v23, OS_LOG_TYPE_DEBUG, "Adding record: %@", buf, 0xCu);
          }

LABEL_20:
          goto LABEL_21;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceReferenceDate");
        v17 = v16;
        objc_msgSend(v10, "ckRecordProcessDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceReferenceDate");
        v20 = v17 - v19;

        if ((v12 & 1) != 0)
        v8 = v55;
        if (v20 > 60.0)
          goto LABEL_17;
LABEL_21:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSSPunctuationGroup description](AXSSPunctuationGroup, "description");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "cloudRecordsToPurge:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  obja = v39;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v60 != v42)
          objc_enumerationMutation(obja);
        v44 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        v45 = objc_alloc(MEMORY[0x1E0C95070]);
        objc_msgSend(v44, "UUIDString");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSSCloudKitHelper recordZone](self, "recordZone");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "zoneID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v45, "initWithRecordName:zoneID:", v46, v48);

        objc_msgSend(v36, "addObject:", v49);
        AXLogPunctuationStorage();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v69 = v44;
          _os_log_impl(&dword_1AF5CC000, v50, OS_LOG_TYPE_INFO, "Purging group: %@", buf, 0xCu);
        }

      }
      v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v41);
  }

  AXLogPunctuationStorage();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v69 = v54;
    *(_WORD *)&v69[8] = 2112;
    *(_QWORD *)&v69[10] = v36;
    _os_log_impl(&dword_1AF5CC000, v51, OS_LOG_TYPE_INFO, "Group providing data for local server: %@, del: %@", buf, 0x16u);
  }

  v52[2](v52, v54, v36, &__block_literal_global_7);
}

void __67__AXSSPunctuationGroupCloudKitHelper_retrieveLocalChangesForCloud___block_invoke(uint64_t a1, void *a2)
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
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithUUIDString:", v5);

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "punctuationGroupForUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogPunctuationStorage();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 138412802;
    v14 = v2;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1AF5CC000, v9, OS_LOG_TYPE_INFO, "Processing group cloud retreival: %@ %@ %@", (uint8_t *)&v13, 0x20u);
  }

  objc_msgSend(v8, "setInCloud:", 1);
  objc_msgSend(v2, "recordChangeTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCkChangeTag:", v10);

  objc_msgSend(v8, "setCkRecordProcessDate:", 0);
  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updatePunctuationGroup:fromCloudKit:", v8, 1);

  AXLogPunctuationStorage();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_1AF5CC000, v12, OS_LOG_TYPE_INFO, "Marked in icloud: %@", (uint8_t *)&v13, 0xCu);
  }

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
  v8.super_class = (Class)AXSSPunctuationGroupCloudKitHelper;
  -[AXSSCloudKitHelper beginWatchingForChanges](&v8, sel_beginWatchingForChanges);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_punctuationGroupsChanged_, CFSTR("AXSSVoiceOverPunctuationGroupsChangedNotification"), 0);

  v4 = objc_alloc(MEMORY[0x1E0CF3978]);
  -[AXSSCloudKitHelper cloudkitQueue](self, "cloudkitQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (AXDispatchTimer *)objc_msgSend(v4, "initWithTargetSerialQueue:", v5);
  changeCoalescer = self->_changeCoalescer;
  self->_changeCoalescer = v6;

  -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](self->_changeCoalescer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
}

- (void)punctuationGroupsChanged:(id)a3
{
  id v4;
  AXDispatchTimer *changeCoalescer;
  id v6;
  _QWORD v7[4];
  id v8;
  AXSSPunctuationGroupCloudKitHelper *v9;

  v4 = a3;
  changeCoalescer = self->_changeCoalescer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AXSSPunctuationGroupCloudKitHelper_punctuationGroupsChanged___block_invoke;
  v7[3] = &unk_1E5F98988;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[AXDispatchTimer afterDelay:processBlock:](changeCoalescer, "afterDelay:processBlock:", v7, 0.5);

}

uint64_t __63__AXSSPunctuationGroupCloudKitHelper_punctuationGroupsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performBlockAndWait:", &__block_literal_global_19);

  AXLogPunctuationStorage();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AF5CC000, v4, OS_LOG_TYPE_INFO, "Punctuation groups changed locally, consolidating for cloud push: %@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "processLocalChangesAndPush");
}

void __63__AXSSPunctuationGroupCloudKitHelper_punctuationGroupsChanged___block_invoke_2()
{
  void *v0;
  id v1;

  +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedObjectContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "refreshAllObjects");

}

- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 138412290;
    v27 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v11, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "recordName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v12, "initWithUUIDString:", v14);

        +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "punctuationGroupForUUID:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v17, "ckChangeTag");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            AXLogPunctuationStorage();
            v19 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              goto LABEL_14;
            *(_DWORD *)buf = v27;
            v33 = v17;
            v20 = v19;
            v21 = "Local group is newer than cloud group, ditching cloud group: %@";
            goto LABEL_13;
          }
        }
        else
        {
          v17 = (void *)objc_opt_new();
          objc_msgSend(v17, "setUuid:", v15);
        }
        objc_msgSend(v11, "name", v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setName:", v22);

        v23 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v11, "basePunctuationGroup");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithUUIDString:", v24);
        objc_msgSend(v17, "setBasePunctuationUUID:", v25);

        +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "updatePunctuationGroup:fromCloudKit:", v17, 1);

        AXLogPunctuationStorage();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          goto LABEL_14;
        *(_DWORD *)buf = v27;
        v33 = v17;
        v20 = v19;
        v21 = "Handling punctuation group: %@";
LABEL_13:
        _os_log_impl(&dword_1AF5CC000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
LABEL_14:

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v8);
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
        objc_msgSend(v12, "punctuationGroupForUUID:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[AXSSPunctuationManager sharedDatabase](AXSSPunctuationManager, "sharedDatabase");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removePunctuationGroup:", v13);

        AXLogPunctuationStorage();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v8;
          v22 = 2112;
          v23 = v13;
          _os_log_impl(&dword_1AF5CC000, v15, OS_LOG_TYPE_DEFAULT, "Removing group from server push: %@ %@", buf, 0x16u);
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
  _os_log_debug_impl(&dword_1AF5CC000, a4, OS_LOG_TYPE_DEBUG, "Committing record purge group: %@", a1, 0xCu);

}

@end
