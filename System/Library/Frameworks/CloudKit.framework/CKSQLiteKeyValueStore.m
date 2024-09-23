@implementation CKSQLiteKeyValueStore

+ (id)dbProperties
{
  return &unk_1E1FC4C70;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (void)deleteKeyValuePropertiesWithScope:(unint64_t)a3 identifiers:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A6F8220;
  v9[3] = &unk_1E1F61E30;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v7, 0, 0, 0, v9);

}

- (void)purgeOrphanedKeyValuePropertiesWithScope:(unint64_t)a3 identifiersToKeep:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A6F82E0;
  v9[3] = &unk_1E1F61E30;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v7, 0, 0, 0, v9);

}

- (void)purgeKeyValuePropertiesForGroupName:(id)a3 tableNames:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  const char *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v10 = a4;
  if (v6)
  {
    v14[0] = v6;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteKeyValuePropertiesWithScope_identifiers_(self, v12, 1, (uint64_t)v11);

  }
  if (objc_msgSend_count(v10, v7, v8, v9))
    objc_msgSend_deleteKeyValuePropertiesWithScope_identifiers_(self, v13, 2, (uint64_t)v10);

}

- (void)purgeOrphanedTableGroupKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_tableGroup(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_msgSend_fetchAllEntries_(v9, v10, (uint64_t)&v29, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v29;
  if (v16)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_fault_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_FAULT, "Error purging orphaned table group properties: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v18 = objc_msgSend_count(v12, v13, v14, v15);
    if (v18)
    {
      v21 = v18;
      for (i = 0; i != v21; ++i)
      {
        objc_msgSend_objectAtIndex_(v12, v19, i, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_replaceObjectAtIndex_withObject_(v12, v28, i, (uint64_t)v27);

      }
    }
    objc_msgSend_purgeOrphanedKeyValuePropertiesWithScope_identifiersToKeep_(self, v19, 1, (uint64_t)v12);
  }

}

- (void)purgeOrphanedTableKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;

  objc_msgSend_tableGroup(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTable(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  objc_msgSend_fetchAllEntries_(v9, v10, (uint64_t)&v28, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (!v28)
  {
    v17 = objc_msgSend_count(v12, v13, v14, v15);
    if (v17)
    {
      v20 = v17;
      for (i = 0; i != v20; ++i)
      {
        objc_msgSend_objectAtIndex_(v16, v18, i, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dbTableName(v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_replaceObjectAtIndex_withObject_(v16, v27, i, (uint64_t)v26);

      }
    }
    objc_msgSend_purgeOrphanedKeyValuePropertiesWithScope_identifiersToKeep_(self, v18, 2, (uint64_t)v16);
  }

}

- (void)purgeOrphanedKeys
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  objc_msgSend_purgeOrphanedTableGroupKeys(self, a2, v2, v3);
  objc_msgSend_purgeOrphanedTableKeys(self, v5, v6, v7);
  objc_msgSend_dictionary(MEMORY[0x1E0C99D80], v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v11, (uint64_t)v12, 0, 0, &unk_1E1F58478);

}

- (id)wakeFromDatabase
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKSQLiteKeyValueStore;
  -[CKSQLiteTable wakeFromDatabase](&v16, sel_wakeFromDatabase);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableGroup(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (!v3 && objc_msgSend_isFirstInstance(v7, v8, v9, v10))
    objc_msgSend_purgeOrphanedKeys(self, v12, v13, v14);

  return v3;
}

- (id)numberValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  CKSQLiteKeyValueTableEntry *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1E1FC4058, (uint64_t)v12, &unk_1E1FC4070, off_1E1F61E50);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v26);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v30 = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  objc_msgSend_number(v12, v23, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)setNumberValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  CKSQLiteKeyValueTableEntry *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  CKSQLiteKeyValueTableEntry *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[5];
  CKSQLiteKeyValueTableEntry *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v16, a5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setNumber_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A6F8B28;
  v31[3] = &unk_1E1F605B0;
  v31[4] = self;
  v25 = v13;
  v32 = v25;
  objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)stringValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  CKSQLiteKeyValueTableEntry *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1E1FC4088, (uint64_t)v12, &unk_1E1FC40A0, off_1E1F61E80);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v26);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v30 = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  objc_msgSend_string(v12, v23, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)setStringValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  CKSQLiteKeyValueTableEntry *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  CKSQLiteKeyValueTableEntry *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[5];
  CKSQLiteKeyValueTableEntry *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v16, a5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setString_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A6F8F08;
  v31[3] = &unk_1E1F605B0;
  v31[4] = self;
  v25 = v13;
  v32 = v25;
  objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)dataValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  CKSQLiteKeyValueTableEntry *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1E1FC40B8, (uint64_t)v12, &unk_1E1FC40D0, off_1E1F61EB0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v26);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v30 = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  objc_msgSend_data(v12, v23, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)setDataValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  CKSQLiteKeyValueTableEntry *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  CKSQLiteKeyValueTableEntry *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[5];
  CKSQLiteKeyValueTableEntry *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v16, a5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setData_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A6F92E8;
  v31[3] = &unk_1E1F605B0;
  v31[4] = self;
  v25 = v13;
  v32 = v25;
  objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)dateValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  CKSQLiteKeyValueTableEntry *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1E1FC40E8, (uint64_t)v12, &unk_1E1FC4100, off_1E1F61EE0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v26);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v30 = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  objc_msgSend_date(v12, v23, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)setDateValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  CKSQLiteKeyValueTableEntry *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  CKSQLiteKeyValueTableEntry *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[5];
  CKSQLiteKeyValueTableEntry *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v16, a5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setDate_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A6F96C8;
  v31[3] = &unk_1E1F605B0;
  v31[4] = self;
  v25 = v13;
  v32 = v25;
  objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)UUIDValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  CKSQLiteKeyValueTableEntry *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1E1FC4118, (uint64_t)v12, &unk_1E1FC4130, off_1E1F61F10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v26);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v30 = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  objc_msgSend_UUID(v12, v23, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)setUUIDValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  CKSQLiteKeyValueTableEntry *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  CKSQLiteKeyValueTableEntry *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[5];
  CKSQLiteKeyValueTableEntry *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v16, a5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setUUID_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A6F9AA8;
  v31[3] = &unk_1E1F605B0;
  v31[4] = self;
  v25 = v13;
  v32 = v25;
  objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

- (id)objectValueForKey:(id)a3 scope:(unint64_t)a4 scopeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  CKSQLiteKeyValueTableEntry *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v12, v13, (uint64_t)v10, v14);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v12, v18, (uint64_t)v17, v19);

  objc_msgSend_setScopeIdentifier_(v12, v20, (uint64_t)v11, v21);
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v22, (uint64_t)&unk_1E1FC4148, (uint64_t)v12, &unk_1E1FC4160, off_1E1F61F40);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v23, (uint64_t)v26, v25) & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v26);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v30 = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v26;
      _os_log_error_impl(&dword_18A5C5000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch value for key %{public}@: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  objc_msgSend_object(v12, v23, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)setObjectValue:(id)a3 forKey:(id)a4 scope:(unint64_t)a5 scopeIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  CKSQLiteKeyValueTableEntry *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  CKSQLiteKeyValueTableEntry *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[5];
  CKSQLiteKeyValueTableEntry *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(CKSQLiteKeyValueTableEntry);
  objc_msgSend_setKey_(v13, v14, (uint64_t)v10, v15);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v16, a5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScope_(v13, v19, (uint64_t)v18, v20);

  objc_msgSend_setScopeIdentifier_(v13, v21, (uint64_t)v11, v22);
  objc_msgSend_setObject_(v13, v23, (uint64_t)v12, v24);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A6F9E88;
  v31[3] = &unk_1E1F605B0;
  v31[4] = self;
  v25 = v13;
  v32 = v25;
  objc_msgSend_performTransaction_(self, v26, (uint64_t)v31, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2114;
      v36 = v28;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Failed to set value for key %{public}@: %{public}@", buf, 0x16u);
    }
  }

  return v28;
}

@end
