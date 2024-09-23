@implementation CKSQLiteTableGroup

+ (id)groupNameWithDomain:(int)a3 domainIdentifier:(id)a4 groupName:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v7 = a4;
  v10 = a5;
  if (a3)
  {
    v11 = CFSTR("container");
    v12 = CFSTR("account");
    if (a3 != 1)
      v12 = 0;
    if (a3 != 2)
      v11 = v12;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("%@_%@_%@"), v9, v11, v7, v10);
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("%@_%@"), v9, CFSTR("global"), v10);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_purge
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];

  objc_msgSend_groupWillPurge(self, a2, v2, v3);
  objc_msgSend_db(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A6F39BC;
  v13[3] = &unk_1E1F61D50;
  v13[4] = self;
  objc_msgSend_performDatabaseTransaction_(v8, v9, (uint64_t)v13, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)purgeGroup:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_db(v5, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v21, (uint64_t)a2, (uint64_t)a1, CFSTR("CKSQLiteTableGroup.m"), 184, CFSTR("%@ requires a database."), v20);

  }
  objc_msgSend_name(v5, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__purge(v5, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v18 = ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v13;
    v24 = 2114;
    v25 = v17;
    _os_log_impl(&dword_18A5C5000, v18, OS_LOG_TYPE_INFO, "Purge of existing table group: %{public}@, error = %{public}@", buf, 0x16u);
  }

}

+ (void)purgeGroupWithName:(id)a3 inDatabase:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A6F3D34;
  v13[3] = &unk_1E1F60238;
  v14 = v7;
  v15 = v6;
  v16 = a1;
  v8 = v6;
  v12 = v7;
  v11 = (id)objc_msgSend_performDatabaseTransaction_(v12, v9, (uint64_t)v13, v10);

}

+ (id)groupEntryInDatabase:(id)a3 withGroupName:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v7 = a4;
  objc_msgSend_tocTableGroup(a3, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entryWithGroupName_error_(v15, v16, (uint64_t)v7, (uint64_t)a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, a2, (uint64_t)a3, (uint64_t)a4, 0, a5);
}

+ (void)enumerateGroupsInDatabase:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  int v29;
  const char *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  unsigned __int8 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  objc_msgSend_tocTableGroup(v6, v8, v9, v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v32, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v14;
  objc_msgSend_tableGroupsWithClass_(v14, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = v18;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v33, (uint64_t)v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
LABEL_3:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v23)
        objc_enumerationMutation(v19);
      v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v24);
      v26 = (void *)MEMORY[0x18D76DE4C]();
      objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, v27, (uint64_t)v6, v25, 196608, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
        v7[2](v7, v28, &v37);
      v29 = v37;

      objc_autoreleasePoolPop(v26);
      if (v29)
        break;
      if (v22 == ++v24)
      {
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v30, (uint64_t)&v33, (uint64_t)v38, 16);
        if (v22)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (CKSQLiteTableGroup)tableGroupWithEntry:(id)a3 database:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  Class v21;
  objc_class *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;

  v7 = a3;
  v8 = a4;
  objc_msgSend_tocTableGroup(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_creatingClass(v7, v17, v18, v19);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = NSClassFromString(v20);

  if (v21 == (Class)objc_opt_class())
    v22 = 0;
  else
    v22 = v21;
  v23 = [v22 alloc];
  objc_msgSend_name(v7, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend_initWithName_options_database_(v23, v28, (uint64_t)v27, a5, v8);

  if (v29)
  {
    v33 = (void *)objc_opt_class();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_18A6F42A8;
    v39[3] = &unk_1E1F60020;
    v40 = v16;
    v41 = v7;
    v42 = v29;
    objc_msgSend_enumeratePropertyDataWithBlock_(v33, v34, (uint64_t)v39, v35);

    v36 = v40;
  }
  else
  {
    objc_msgSend_name(v7, v30, v31, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_purgeGroupWithName_inDatabase_(CKSQLiteTableGroup, v37, (uint64_t)v36, (uint64_t)v8);
  }

  return (CKSQLiteTableGroup *)v29;
}

+ (id)lookupTableGroupInstanceInCache:(id)a3 withName:(id)a4 options:(unint64_t)a5
{
  int v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_18A6F3E94;
  v22 = sub_18A6F3EA4;
  v23 = 0;
  if ((v5 & 0x40000) == 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_18A6F443C;
    v15[3] = &unk_1E1F61D78;
    v17 = &v18;
    v16 = v8;
    objc_msgSend_usingTableGroupCachePerformBlock_(v7, v11, (uint64_t)v15, v12);

    v10 = (void *)v19[5];
  }
  v13 = v10;
  _Block_object_dispose(&v18, 8);

  return v13;
}

+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  pthread_mutex_t *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v14 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_18A6F3E94;
  v36 = sub_18A6F3EA4;
  v37 = 0;
  if (v10
    || (objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v11, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("table group lookup requires a database")), (v20 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend_length(v14, v11, v12, v13)
      || (objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("table group requires a non empty name")), (v20 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v16 = _CKSQLDBSerializerLock((uint64_t)v10 + 8);
      objc_msgSend_lookupTableGroupInstanceInCache_withName_options_(a1, v17, (uint64_t)v10, (uint64_t)v14, a5);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v33[5];
      v33[5] = v18;

      if (v33[5])
      {
        v20 = 0;
        if (!v16)
        {
LABEL_12:
          if (!v20)
            goto LABEL_15;
          goto LABEL_13;
        }
      }
      else
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = sub_18A6F48E0;
        v26[3] = &unk_1E1F61DA0;
        v27 = v10;
        v29 = &v32;
        v30 = a1;
        v28 = v14;
        v31 = a5;
        objc_msgSend_performDatabaseTransaction_(v27, v21, (uint64_t)v26, v22);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_12;
      }
      v16[1].__sig = 0;
      pthread_mutex_unlock(v16);
      goto LABEL_12;
    }
  }
LABEL_13:
  v23 = (void *)v33[5];
  v33[5] = 0;

  if (a6)
  {
    v20 = objc_retainAutorelease(v20);
    *a6 = v20;
  }
LABEL_15:
  v24 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v24;
}

+ (id)tableGroupInDatabase:(id)a3 withID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  id v33;
  id v34;

  v8 = a3;
  v9 = a4;
  objc_msgSend_tocTableGroup(v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(v17, v18, (uint64_t)v9, 0, off_1E1F61DC0, &v34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v34;
  if (v19
    && (objc_msgSend_name(v19, v20, v21, v22), v24 = (void *)objc_claimAutoreleasedReturnValue(), v24, v24))
  {
    objc_msgSend_name(v19, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v23;
    objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, v29, (uint64_t)v8, (uint64_t)v28, 0x10000, &v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v33;

    v23 = v31;
    if (!a5)
      goto LABEL_8;
  }
  else
  {
    v30 = 0;
    if (!a5)
      goto LABEL_8;
  }
  if (v23)
    *a5 = objc_retainAutorelease(v23);
LABEL_8:

  return v30;
}

- (id)_tablesByNameInitializer
{
  return objc_alloc_init(MEMORY[0x1E0C99D80]);
}

- (CKSQLiteTableGroup)init
{
  CKSQLiteTableGroup *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKSQLiteTableGroup *v6;
  uint64_t v7;
  NSDictionary *tablesByName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKSQLiteTableGroup;
  v2 = -[CKSQLiteTableGroup init](&v10, sel_init);
  v6 = v2;
  if (v2)
  {
    objc_msgSend__tablesByNameInitializer(v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    tablesByName = v6->_tablesByName;
    v6->_tablesByName = (NSDictionary *)v7;

    v6->_valid = 1;
  }
  return v6;
}

- (id)tocTableGroupInitValue
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_tocTableGroup(self->_db, a2, v2, v3);
}

- (CKSQLiteTableGroup)initWithName:(id)a3 options:(unint64_t)a4 database:(id)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSQLiteTableGroup *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CKSQLiteTOCTableGroup *tocTableGroup;

  v9 = a5;
  self->_options = a4;
  v12 = objc_msgSend_initWithName_(self, v10, (uint64_t)a3, v11);
  v13 = (CKSQLiteTableGroup *)v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 104), a5);
    objc_msgSend_tocTableGroupInitValue(v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    tocTableGroup = v13->_tocTableGroup;
    v13->_tocTableGroup = (CKSQLiteTOCTableGroup *)v17;

  }
  return v13;
}

- (id)finishInitializing
{
  uint64_t v2;
  NSDictionary *tablesByName;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_18A6F3E94;
  v11 = sub_18A6F3EA4;
  tablesByName = self->_tablesByName;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18A6F5030;
  v6[3] = &unk_1E1F61DE0;
  v6[4] = &v7;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(tablesByName, a2, (uint64_t)v6, v2);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  objc_msgSend_db(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deleteTablesOnDealloc)
    objc_msgSend_deleteTables_(self, v5, (uint64_t)v8, v7);
  if ((self->_options & 0x20000) == 0)
    objc_msgSend_updateLastUsedDate(self, v5, v6, v7);

  v9.receiver = self;
  v9.super_class = (Class)CKSQLiteTableGroup;
  -[CKSQLiteTableGroup dealloc](&v9, sel_dealloc);
}

- (id)tocTableGroupTable
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_tocTableGroup(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tocTable
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_tocTableGroup(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTable(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateLastUsedDate
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;

  objc_msgSend_groupID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v6, v7, v8);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastUsed(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_class();
    objc_msgSend_expirationTime(v13, v14, v15, v16);
    if (v19 <= 0.0)
      v20 = 86400.0;
    else
      v20 = v19 * 0.05;
    objc_msgSend_timeIntervalSinceDate_(v30, v17, (uint64_t)v12, v18);
    if (v23 > v20)
    {
      objc_msgSend_setLastUsed_(self, v21, (uint64_t)v30, v22);
      objc_msgSend_tocTableGroupTable(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateLastUsedDate_(v27, v28, (uint64_t)self, v29);

    }
  }
}

+ (BOOL)rebootShouldClearData
{
  return 0;
}

+ (void)groupWillExpire:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_objectForKey_(a3, a2, CKSQLiteTableGroupExpiryFileRemovalKey, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v4;
    v12 = v4;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v32, 16);
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v12);
          v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18);
          v23 = 0;
          objc_msgSend_removeItemAtPath_error_(v11, v15, v19, (uint64_t)&v23);
          v20 = v23;
          if (v20)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v21 = ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v29 = v19;
              v30 = 2114;
              v31 = v20;
              _os_log_error_impl(&dword_18A5C5000, v21, OS_LOG_TYPE_ERROR, "failed to remove at path: %{public}@ error=%{public}@", buf, 0x16u);
            }
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, (uint64_t)v32, 16);
      }
      while (v16);
    }

    v4 = v22;
  }

}

+ (void)expireGroup:(id)a3 reason:(id)a4 database:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSString *v24;
  objc_class *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  const char *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v11 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
  {
    v15 = v11;
    objc_msgSend_name(v8, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543618;
    v34 = v19;
    v35 = 2114;
    v36 = v9;
    _os_log_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_INFO, "Table group: %{public}@ expired due to: %{public}@", (uint8_t *)&v33, 0x16u);

  }
  objc_msgSend_groupData(v8, v12, v13, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend_creatingClass(v8, v20, v21, v22);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    v25 = NSClassFromString(v24);
    if (!v25)
      v25 = (objc_class *)objc_opt_class();

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v26 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
    {
      v29 = v26;
      NSStringFromClass(v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v30;
      v35 = 2114;
      v36 = v23;
      _os_log_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_INFO, "Notifying class %{public}@ of group expiry. groupData = %{public}@", (uint8_t *)&v33, 0x16u);

    }
    objc_msgSend_groupWillExpire_(v25, v27, (uint64_t)v23, v28);
  }
  objc_msgSend_name(v8, v20, v21, v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeGroupWithName_inDatabase_(a1, v32, (uint64_t)v31, (uint64_t)v10);

}

- (id)createTables:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[4];
  void *v28;
  uint8_t buf[16];

  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = ck_log_initialization_block;
  v6 = ck_log_initialization_predicate;
  if (v3 != v4)
    goto LABEL_6;
  if (ck_log_initialization_predicate != -1)
    goto LABEL_11;
  while (1)
  {
    v7 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_ERROR, "-createTables called on an instance of CKSQLiteTableGroup", buf, 2u);
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("-createTables called on an instance of CKSQLiteTableGroup"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v10, v11, v12, v13);
    _os_crash();
    __break(1u);
LABEL_6:
    if (v6 != -1)
      dispatch_once(&ck_log_initialization_predicate, v5);
    v14 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138412290;
      v28 = v17;
      _os_log_error_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_ERROR, "-[CKSQLiteTableGroup createTables] was not overridden by %@", v27, 0xCu);

    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v18, v21, (uint64_t)CFSTR("-[CKSQLiteTableGroup createTables] was not overridden by %@"), v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_UTF8String(v23, v24, v25, v26);
    _os_crash();
    __break(1u);
LABEL_11:
    dispatch_once(&ck_log_initialization_predicate, v5);
  }
}

- (id)dbTableNameForLogicalTableName:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend_name(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v14, (uint64_t)CFSTR("%@_%@_%@"), v15, v9, v13, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)prepareNewTables
{
  uint64_t v2;
  NSMutableDictionary *pendingTables;
  _QWORD v5[5];

  self->_isFirstInstance = 1;
  pendingTables = self->_pendingTables;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A6F596C;
  v5[3] = &unk_1E1F61E08;
  v5[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(pendingTables, a2, (uint64_t)v5, v2);
  return 0;
}

- (id)prepareExistingTables
{
  uint64_t v2;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL4 isFirstInstance;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  id v72;
  void *v73;
  os_log_t log;
  NSObject *loga;
  id obj;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  uint8_t buf[4];
  os_log_t v88;
  __int16 v89;
  uint64_t v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  self->_isFirstInstance = objc_msgSend_tableGroupWasPreviouslyValidated_(self->_db, a2, (uint64_t)self, v2) ^ 1;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend_tocTable(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isFirstInstance = self->_isFirstInstance;
  objc_msgSend_groupID(self, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v8;
  if (isFirstInstance)
  {
    v86 = 0;
    v15 = (id *)&v86;
    objc_msgSend_validationTocEntriesWithGroupID_error_(v8, v13, (uint64_t)v14, (uint64_t)&v86);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v85 = 0;
    v15 = (id *)&v85;
    objc_msgSend_tocEntriesWithGroupID_error_(v8, v13, (uint64_t)v14, (uint64_t)&v85);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
  v72 = *v15;

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v18 = v17;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v81, (uint64_t)v92, 16);
  if (v20)
  {
    v24 = v20;
    v25 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v82 != v25)
          objc_enumerationMutation(v18);
        v27 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        objc_msgSend_logicalTableName(v27, v21, v22, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(self->_pendingTables, v29, (uint64_t)v28, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTocTableEntry_(v31, v32, (uint64_t)v27, v33);
        objc_msgSend_dbTableName(v27, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDbTableName_(v31, v38, (uint64_t)v37, v39);
        objc_msgSend_addObject_(v4, v40, (uint64_t)v28, v41);

      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v81, (uint64_t)v92, 16);
    }
    while (v24);
  }

  if (self->_isFirstInstance && !self->_isNew)
  {
    objc_msgSend_allKeys(self->_pendingTables, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v4, v46, (uint64_t)v45, v47);

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v4;
    v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v77, (uint64_t)v91, 16);
    if (v49)
    {
      v52 = v49;
      v53 = *(_QWORD *)v78;
      do
      {
        v54 = 0;
        do
        {
          if (*(_QWORD *)v78 != v53)
            objc_enumerationMutation(obj);
          v55 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v54);
          objc_msgSend_objectForKey_(self->_pendingTables, v50, v55, v51);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v59)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v60 = (void *)ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
            {
              v63 = v60;
              objc_msgSend_name(self, v64, v65, v66);
              log = (os_log_t)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v88 = log;
              v89 = 2114;
              v90 = v55;
              _os_log_error_impl(&dword_18A5C5000, v63, OS_LOG_TYPE_ERROR, "Table group %@ failed validation - no table instance named %{public}@", buf, 0x16u);

            }
            self->_valid = 0;
          }
          objc_msgSend_tocTableEntry(v59, v56, v57, v58);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v61)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v62 = (void *)ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
            {
              loga = v62;
              objc_msgSend_name(self, v67, v68, v69);
              v70 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v88 = v70;
              v89 = 2114;
              v90 = v55;
              _os_log_error_impl(&dword_18A5C5000, loga, OS_LOG_TYPE_ERROR, "Table group %@ failed validation - no TOC entry for %{public}@", buf, 0x16u);

            }
            self->_valid = 0;
          }

          ++v54;
        }
        while (v52 != v54);
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v77, (uint64_t)v91, 16);
      }
      while (v52);
    }

  }
  return v72;
}

- (void)_addExtraTablesForTable:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  objc_msgSend_extraGroupTables_(a3, a2, (uint64_t)self->_pendingTables, v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A6F5F34;
  v12[3] = &unk_1E1F61E08;
  v12[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v6, (uint64_t)v12, v7);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = sub_18A6F5F4C;
  v11[3] = &unk_1E1F61E08;
  v11[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v8, (uint64_t)v11, v9);

}

- (id)prepareTables
{
  uint64_t v2;
  void *v4;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *pendingTables;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSError *addTableError;
  NSMutableDictionary *v41;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v52 = 0;
  objc_msgSend_createTables_(self, a2, (uint64_t)&v52, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v52;
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pendingTables = self->_pendingTables;
  self->_pendingTables = v6;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v48, (uint64_t)v54, 16);
  if (v10)
  {
    v14 = v10;
    v15 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v49 != v15)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend_logicalTableName(v17, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(self->_pendingTables, v19, (uint64_t)v17, (uint64_t)v18);
        objc_msgSend__addExtraTablesForTable_(self, v20, (uint64_t)v17, v21);

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v48, (uint64_t)v54, 16);
    }
    while (v14);
  }

  if (self->_isNew)
    objc_msgSend_prepareNewTables(self, v22, v23, v24);
  else
    objc_msgSend_prepareExistingTables(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_valid)
  {
    v43 = v25;
    objc_msgSend_allKeys(self->_pendingTables, v26, v27, v28);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v44, (uint64_t)v53, 16);
    if (v31)
    {
      v34 = v31;
      v35 = *(_QWORD *)v45;
LABEL_14:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(v29);
        objc_msgSend_tableWithName_(self, v32, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v36), v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTocTableEntry_(v37, v38, 0, v39);
        addTableError = self->_addTableError;

        if (addTableError)
          break;
        if (v34 == ++v36)
        {
          v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v44, (uint64_t)v53, 16);
          if (v34)
            goto LABEL_14;
          break;
        }
      }
    }

    v25 = v43;
  }
  v41 = self->_pendingTables;
  self->_pendingTables = 0;

  return v25;
}

- (id)createDBTable:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  CKSQLiteTOCTableEntry *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;

  v4 = a3;
  objc_msgSend_createTableSQL(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_db(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTable(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_executeSQL_(v12, v17, (uint64_t)v8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v20 = objc_alloc_init(CKSQLiteTOCTableEntry);
    objc_msgSend_logicalTableName(v4, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLogicalTableName_(v20, v25, (uint64_t)v24, v26);

    objc_msgSend_dbTableName(v4, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDbTableName_(v20, v31, (uint64_t)v30, v32);

    objc_msgSend_groupID(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGroupID_(v20, v37, (uint64_t)v36, v38);

    objc_msgSend_setSchema_(v20, v39, (uint64_t)v8, v40);
    v41 = (void *)objc_opt_class();
    v42 = (void *)MEMORY[0x1E0CB37E8];
    v46 = objc_msgSend_dbVersion(v41, v43, v44, v45);
    objc_msgSend_numberWithUnsignedInteger_(v42, v47, v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDbVersion_(v20, v50, (uint64_t)v49, v51);

    NSStringFromClass((Class)v41);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreatingClass_(v20, v53, (uint64_t)v52, v54);

    objc_msgSend_flattenedDBProperties(v41, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPropertyData_(v20, v59, (uint64_t)v58, v60);

    objc_msgSend_insertObject_(v16, v61, (uint64_t)v20, v62);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend_didCreateDatabaseTable(v4, v63, v64, v65);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v19;
}

- (int64_t)validateTableMatchesTOCEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  char isEqual;
  int64_t v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  int v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  _BYTE v82[10];
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_tocTableEntry(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbVersion(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);

  v17 = (void *)objc_opt_class();
  v21 = objc_msgSend_dbVersion(v17, v18, v19, v20);
  if (v16 == v21)
  {
    objc_msgSend_schema(v8, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createTableSQL(v4, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v25, v30, (uint64_t)v29, v31) & 1) != 0)
    {
      objc_msgSend_propertyData(v8, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_opt_class();
      objc_msgSend_flattenedDBProperties(v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v35, v41, (uint64_t)v40, v42);

      if ((isEqual & 1) != 0)
      {
        v44 = 1;
      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v48 = (void *)ck_log_facility_sql;
        if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
        {
          v68 = v48;
          objc_msgSend_name(self, v69, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_logicalTableName(v4, v73, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = 138544130;
          v78 = v72;
          v79 = 2114;
          v80 = v76;
          v81 = 2114;
          *(_QWORD *)v82 = v25;
          *(_WORD *)&v82[8] = 2114;
          v83 = v29;
          _os_log_error_impl(&dword_18A5C5000, v68, OS_LOG_TYPE_ERROR, "Table group %{public}@ failed validation - property data changed for table %{public}@ (%{public}@ vs %{public}@)", (uint8_t *)&v77, 0x2Au);

        }
        v44 = 0;
      }

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v47 = (void *)ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        v59 = v47;
        objc_msgSend_name(self, v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logicalTableName(v4, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 138544130;
        v78 = v63;
        v79 = 2114;
        v80 = v67;
        v81 = 2114;
        *(_QWORD *)v82 = v25;
        *(_WORD *)&v82[8] = 2114;
        v83 = v29;
        _os_log_error_impl(&dword_18A5C5000, v59, OS_LOG_TYPE_ERROR, "Table group %{public}@ failed validation - schema changed for table %{public}@ (%{public}@ vs %{public}@)", (uint8_t *)&v77, 0x2Au);

      }
      v44 = 0;
    }

  }
  else
  {
    v45 = v21;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v46 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v50 = v46;
      objc_msgSend_name(self, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logicalTableName(v4, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 138544130;
      v78 = v54;
      v79 = 2114;
      v80 = v58;
      v81 = 1024;
      *(_DWORD *)v82 = v16;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v45;
      _os_log_error_impl(&dword_18A5C5000, v50, OS_LOG_TYPE_ERROR, "Table group %{public}@ failed validation - version changed table %{public}@ (%d vs %d)", (uint8_t *)&v77, 0x22u);

    }
    v44 = 0;
  }

  return v44;
}

- (id)allTables
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_allValues(self->_tablesByName, a2, v2, v3);
}

- (id)tableWithName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSDictionary *v24;
  NSDictionary *tablesByName;

  v4 = a3;
  objc_msgSend_objectForKey_(self->_tablesByName, v5, (uint64_t)v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_15;
  objc_msgSend_objectForKey_(self->_pendingTables, v7, (uint64_t)v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_15;
  objc_msgSend_removeObjectForKey_(self->_pendingTables, v10, (uint64_t)v4, v11);
  objc_msgSend_setTableGroup_(v9, v12, (uint64_t)self, v13);
  if (self->_isNew)
  {
    objc_msgSend_createDBTable_(self, v14, (uint64_t)v9, v16);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v18 = (void *)v17;
    goto LABEL_9;
  }
  if (!self->_isFirstInstance || objc_msgSend_validateTableMatchesTOCEntry_(self, v14, (uint64_t)v9, v16))
  {
    objc_msgSend_wakeFromDatabase(v9, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v18 = 0;
  self->_valid = 0;
LABEL_9:
  v19 = (void *)objc_msgSend_mutableCopy(self->_tablesByName, v14, v15, v16);
  objc_msgSend_setObject_forKey_(v19, v20, (uint64_t)v9, (uint64_t)v4);
  v24 = (NSDictionary *)objc_msgSend_copy(v19, v21, v22, v23);
  tablesByName = self->_tablesByName;
  self->_tablesByName = v24;

  if (v18 && !self->_addTableError)
    objc_storeStrong((id *)&self->_addTableError, v18);
  if (self->_addTableError)
  {

    v9 = 0;
  }

LABEL_15:
  return v9;
}

- (id)performDataMigration:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableGroupWithEntry_database_options_(CKSQLiteTableGroup, v9, (uint64_t)v4, (uint64_t)v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_prepareTables(v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend_migrateDataFromGroup_(self, v14, (uint64_t)v10, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        objc_msgSend_purgeGroup_(CKSQLiteTableGroup, v17, (uint64_t)v10, v18);
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)migrateDataFromGroup:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  objc_class *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  objc_class *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  CKSQLiteTableGroup *v70;
  uint64_t *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  CKSQLiteTableGroup *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = sub_18A6F3E94;
  v84 = sub_18A6F3EA4;
  v85 = 0;
  objc_msgSend_allTables(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allTables(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v78 = 0u;
  v79 = 0u;
  v77 = 0u;
  v76 = 0u;
  v14 = v8;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v76, (uint64_t)v95, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v77 != v20)
          objc_enumerationMutation(v14);
        objc_msgSend_logicalTableName(*(void **)(*((_QWORD *)&v76 + 1) + 8 * i), v16, v17, v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v13, v23, (uint64_t)v22, v24);

      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v76, (uint64_t)v95, 16);
    }
    while (v19);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v25 = v12;
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v72, (uint64_t)v94, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v73 != v31)
          objc_enumerationMutation(v25);
        objc_msgSend_logicalTableName(*(void **)(*((_QWORD *)&v72 + 1) + 8 * j), v27, v28, v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v13, v34, (uint64_t)v33, v35);

      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v72, (uint64_t)v94, 16);
    }
    while (v30);
  }

  v39 = objc_msgSend_count(v25, v36, v37, v38);
  if (v39 == objc_msgSend_count(v14, v40, v41, v42) && v39 == objc_msgSend_count(v13, v43, v44, v45))
  {
    objc_msgSend_db(self, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = sub_18A6F6E90;
    v68[3] = &unk_1E1F60688;
    v69 = v25;
    v70 = self;
    v71 = &v80;
    objc_msgSend_performDatabaseTransaction_(v49, v50, (uint64_t)v68, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81[5])
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v53 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(self, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v87 = v55;
        v88 = 2048;
        v89 = self;
        v90 = 2114;
        v91 = v59;
        v92 = 2114;
        v93 = v52;
        _os_log_error_impl(&dword_18A5C5000, v53, OS_LOG_TYPE_ERROR, "%{public}@(%p): Data migration failed for group: %{public}@: %{public}@", buf, 0x2Au);

      }
    }
    else
    {
      if (!v52)
      {
LABEL_28:

        goto LABEL_29;
      }
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v53 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(self, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v87 = v63;
        v88 = 2048;
        v89 = self;
        v90 = 2114;
        v91 = v67;
        v92 = 2114;
        v93 = v52;
        _os_log_error_impl(&dword_18A5C5000, v53, OS_LOG_TYPE_ERROR, "%{public}@(%p): Data migration dropped data for group: %{public}@: %{public}@", buf, 0x2Au);

      }
    }

    goto LABEL_28;
  }
LABEL_29:
  v60 = (id)v81[5];

  _Block_object_dispose(&v80, 8);
  return v60;
}

- (id)updateGroupData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;

  v4 = a3;
  objc_msgSend_groupData(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v4, v9, v10, v11);

  objc_msgSend_setGroupData_(self, v13, (uint64_t)v12, v14);
  objc_msgSend_tocTableGroupTable(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateGroupData_(v18, v19, (uint64_t)self, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend_setGroupData_(self, v21, (uint64_t)v8, v22);

  return v23;
}

- (void)serialize:(id)a3
{
  pthread_mutex_t *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v4 = _CKSQLDBSerializerLock((uint64_t)&self->_db->_serializer);
  v5[2]();
  if (v4)
  {
    v4[1].__sig = 0;
    pthread_mutex_unlock(v4);
  }

}

- (id)databaseManager:(id *)a3
{
  CKSQLiteTableGroup *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKSQLiteDatabaseManager *databaseManager;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSQLiteDatabaseManager *v13;
  CKSQLiteDatabaseManager *v14;

  v4 = self;
  objc_sync_enter(v4);
  databaseManager = v4->_databaseManager;
  if (!databaseManager)
  {
    objc_msgSend_db(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_databaseManager_(v9, v10, (uint64_t)a3, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v4->_databaseManager;
    v4->_databaseManager = (CKSQLiteDatabaseManager *)v12;

    databaseManager = v4->_databaseManager;
  }
  v14 = databaseManager;
  objc_sync_exit(v4);

  return v14;
}

- (id)requestCallbackForTarget:(id)a3 withDate:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  id v21;

  v10 = a3;
  v11 = a4;
  v21 = 0;
  objc_msgSend_databaseManager_(self, v12, (uint64_t)&v21, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (!v16)
  {
    if (v14)
    {
      objc_msgSend_addActivityTriggerWithTarget_date_coalescingInterval_minimumSeparation_(v14, v15, (uint64_t)v10, (uint64_t)v11, a5, a6);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("%@ has no database manager"), v18);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v16;
}

- (id)requestCallbackWithDate:(id)a3 coalescingInterval:(double)a4 minimumSeparation:(double)a5
{
  return (id)objc_msgSend_requestCallbackForTarget_withDate_coalescingInterval_minimumSeparation_(self, a2, (uint64_t)self, (uint64_t)a3, a4, a5);
}

- (id)performTransaction:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_performDatabaseTransaction_(self->_db, a2, (uint64_t)a3, v3);
}

- (id)performInTransaction:(id)a3
{
  return (id)((uint64_t (*)(CKSQLiteDatabase *, char *, id))MEMORY[0x1E0DE7D20])(self->_db, sel_performInDatabaseTransaction_, a3);
}

- (CKSQLiteDatabase)db
{
  return self->_db;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (BOOL)isFirstInstance
{
  return self->_isFirstInstance;
}

- (unint64_t)options
{
  return self->_options;
}

- (CKSQLiteDatabase)activityPersistenceDatabase
{
  return self->_activityPersistenceDatabase;
}

- (void)setActivityPersistenceDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_activityPersistenceDatabase, a3);
}

- (CKSQLiteTOCTableGroup)tocTableGroup
{
  return self->_tocTableGroup;
}

- (NSObject)databaseManagerData
{
  return self->_databaseManagerData;
}

- (void)setDatabaseManagerData:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManagerData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManagerData, 0);
  objc_storeStrong((id *)&self->_tocTableGroup, 0);
  objc_storeStrong((id *)&self->_activityPersistenceDatabase, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_tablesByName, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_addTableError, 0);
  objc_storeStrong((id *)&self->_pendingTables, 0);
}

- (id)numberValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setNumberValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNumberValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)stringValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setStringValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStringValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)dataValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setDataValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDataValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)dateValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setDateValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDateValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)UUIDValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setUUIDValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUUIDValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)objectValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectValueForKey_scope_scopeIdentifier_error_(v12, v17, (uint64_t)v6, 1, v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)setObjectValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v12, (uint64_t)v11, v7 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObjectValue_forKey_scope_scopeIdentifier_(v13, v18, (uint64_t)v7, (uint64_t)v6, 1, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_setupActivityEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  objc_msgSend_groupID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupID_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_name(self, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroupName_(v4, v14, (uint64_t)v16, v15);

}

@end
