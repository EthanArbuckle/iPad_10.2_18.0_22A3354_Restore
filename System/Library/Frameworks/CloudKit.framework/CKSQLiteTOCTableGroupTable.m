@implementation CKSQLiteTOCTableGroupTable

+ (id)dbTableName
{
  return CFSTR("TOCTableGroup");
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

+ (id)dbProperties
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CKSQLiteTOCTableGroupTableGroupIDPropertyName;
  v3[1] = CKSQLiteTOCTableGroupTableGroupNamePropertyName;
  v4[0] = &unk_1E1FC4460;
  v4[1] = &unk_1E1FC4478;
  v3[2] = CKSQLiteTOCTableGroupTableLastUsedPropertyName;
  v3[3] = CKSQLiteTOCTableGroupTableCreatingClassPropertyName;
  v4[2] = &unk_1E1FC4490;
  v4[3] = &unk_1E1FC43E8;
  v3[4] = CKSQLiteTOCTableGroupTableGroupDataPropertyName;
  v4[4] = &unk_1E1FC44A8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v4, (uint64_t)v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)insertObject:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKSQLiteTOCTableGroupTable;
  -[CKSQLiteTable insertObject:](&v8, sel_insertObject_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend_setIsEmpty_(self->_strongDatabase, v4, 0, v5);
  return v6;
}

- (id)deleteObject:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  CKSQLiteTOCTableGroupTable *v12;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6D2B28;
  v10[3] = &unk_1E1F605B0;
  v11 = v4;
  v12 = self;
  v5 = v4;
  objc_msgSend_performInTransaction_(self, v6, (uint64_t)v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setTableGroup:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKSQLiteDatabase *v8;
  CKSQLiteDatabase *strongDatabase;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKSQLiteTOCTableGroupTable;
  v4 = a3;
  -[CKSQLiteTable setTableGroup:](&v10, sel_setTableGroup_, v4);
  objc_msgSend_db(v4, v5, v6, v7, v10.receiver, v10.super_class);
  v8 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();

  strongDatabase = self->_strongDatabase;
  self->_strongDatabase = v8;

}

- (id)db
{
  return self->_strongDatabase;
}

- (id)entryWithGroupName:(id)a3 error:(id *)a4
{
  id v6;
  CKSQLiteTableGroupEntry *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [CKSQLiteTableGroupEntry alloc];
  v10 = (void *)objc_msgSend_initWithName_(v7, v8, (uint64_t)v6, v9);
  objc_msgSend_setName_(v10, v11, (uint64_t)v6, v12);

  v20[0] = CKSQLiteTOCTableGroupTableGroupNamePropertyName;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v15, 0, (uint64_t)v10, v14, off_1E1F606F8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {

    if (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v17, (uint64_t)v16, v18))
    {

      v16 = 0;
LABEL_6:
      v10 = 0;
      goto LABEL_7;
    }
    if (!a4)
      goto LABEL_6;
    v16 = objc_retainAutorelease(v16);
    v10 = 0;
    *a4 = v16;
  }
LABEL_7:

  return v10;
}

- (id)invalidateGroup:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_name(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v9, 0, v10);
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCreatingClass_(v4, v13, (uint64_t)v12, v14);

  objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastUsed_(v4, v19, (uint64_t)v18, v20);

  v31[0] = CKSQLiteTOCTableGroupTableGroupNamePropertyName;
  v31[1] = CKSQLiteTOCTableGroupTableCreatingClassPropertyName;
  v31[2] = CKSQLiteTOCTableGroupTableLastUsedPropertyName;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v31, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateProperties_usingObject_label_(self, v23, (uint64_t)v22, (uint64_t)v4, off_1E1F60710);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v25 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v27 = 138412546;
      v28 = v8;
      v29 = 2114;
      v30 = v24;
      _os_log_error_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_ERROR, "failed to invalidate group %{publid}@: %{public}@", (uint8_t *)&v27, 0x16u);
    }
  }

  return v24;
}

- (void)updateLastUsedDate:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9[0] = CKSQLiteTOCTableGroupTableLastUsedPropertyName;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend_updateProperties_usingObject_label_(self, v7, (uint64_t)v6, (uint64_t)v4, off_1E1F60728);

}

- (id)updateGroupData:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = CKSQLiteTOCTableGroupTableGroupDataPropertyName;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend_arrayWithObjects_count_(v4, v6, (uint64_t)&v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateProperties_usingObject_label_(self, v8, (uint64_t)v7, (uint64_t)v5, off_1E1F60740, v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tableGroupsWithClass:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CKSQLiteTOCTableGroupTable *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_18A6D241C;
  v19 = sub_18A6D242C;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D327C;
  v11[3] = &unk_1E1F60688;
  v5 = v4;
  v12 = v5;
  v13 = self;
  v14 = &v15;
  v8 = (id)objc_msgSend_performInTransaction_(self, v6, (uint64_t)v11, v7);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongDatabase, 0);
}

@end
