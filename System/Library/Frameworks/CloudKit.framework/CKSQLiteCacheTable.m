@implementation CKSQLiteCacheTable

+ (id)dbProperties
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("expirationDate");
  v4[0] = &unk_1E1FC4A60;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v4, (uint64_t)&v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataSizeProperties
{
  id v2;
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A736F30;
  v8[3] = &unk_1E1F5FD40;
  v4 = v2;
  v9 = v4;
  objc_msgSend_enumeratePropertyDataWithBlock_(v3, v5, (uint64_t)v8, v6);

  return v4;
}

- (CKSQLiteCacheTable)initWithLogicalTableName:(id)a3 entryCountLimit:(unint64_t)a4 dataSizeLimit:(unint64_t)a5 expirationTime:(double)a6 expireDelay:(double)a7
{
  CKSQLiteCacheTable *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKSQLiteCacheTable *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  const char *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKSQLiteCacheTable;
  v12 = -[CKSQLiteTable initWithLogicalTableName:](&v28, sel_initWithLogicalTableName_, a3);
  v16 = v12;
  if (v12)
  {
    v12->_entryCountLimit = a4;
    v12->_dataSizeLimit = a5;
    v12->_cacheExpirationTime = a6;
    v12->_expireDelay = a7;
    objc_msgSend_primaryKeyProperties(v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_count(v17, v18, v19, v20);

    if (v21 != 1)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)v16, CFSTR("CKSQLiteCacheTable.m"), 102, CFSTR("CKSQLiteCacheTable does not support compound primary keys"));

    }
  }
  return v16;
}

- (id)createTableSQL
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t entryCountLimit;
  unint64_t dataSizeLimit;
  double cacheExpirationTime;
  _BOOL4 v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  const char *v59;
  uint64_t v60;
  void *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v71;
  const char *v72;
  void *v73;
  _BOOL4 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  objc_super v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v87.receiver = self;
  v87.super_class = (Class)CKSQLiteCacheTable;
  -[CKSQLiteTable createTableSQL](&v87, sel_createTableSQL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  entryCountLimit = self->_entryCountLimit;
  dataSizeLimit = self->_dataSizeLimit;
  cacheExpirationTime = self->_cacheExpirationTime;
  v12 = cacheExpirationTime != 0.0 || dataSizeLimit != 0;
  if (!entryCountLimit && !v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v4, v5, v6);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v71, v72, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCacheTable.m"), 112, CFSTR("Cache has no expiration policies"));

  }
  objc_msgSend_tableGroup(self, v4, v5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableWithName_(v13, v14, (uint64_t)CFSTR("CKSQLiteCacheTableTrackingTable"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_logicalTableName(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_class();
  objc_msgSend_dataSizeProperties(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v34, (uint64_t)CFSTR("CREATE TRIGGER '%@_insert' AFTER INSERT ON '%@' BEGIN "), v35, v28, v28);
  if (entryCountLimit)
    objc_msgSend_appendFormat_(v7, v36, (uint64_t)CFSTR("UPDATE '%@' SET entryCount = entryCount + 1 WHERE tableName = \"%@\";"),
      v37,
      v20,
      v24);
  v74 = v12;
  if (dataSizeLimit)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v73 = v33;
    v38 = v33;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v83, (uint64_t)v90, 16);
    if (v40)
    {
      v43 = v40;
      v44 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v84 != v44)
            objc_enumerationMutation(v38);
          objc_msgSend_appendFormat_(v7, v41, (uint64_t)CFSTR("UPDATE '%@' SET dataSize = dataSize + LENGTH(NEW.%@) WHERE tableName = \"%@\";"),
            v42,
            v20,
            *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i),
            v24);
        }
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v83, (uint64_t)v90, 16);
      }
      while (v43);
    }

    v33 = v73;
    v12 = v74;
  }
  if (cacheExpirationTime != 0.0)
    objc_msgSend_appendFormat_(v7, v36, (uint64_t)CFSTR("UPDATE '%@' SET oldestExpireDate = CASE WHEN oldestExpireDate IS NULL OR oldestExpireDate > NEW.expirationDate THEN NEW.expirationDate ELSE oldestExpireDate END WHERE tableName = \"%@\";"),
      v37,
      v20,
      v24);
  objc_msgSend_appendString_(v7, v36, (uint64_t)CFSTR("END;"), v37);
  if (entryCountLimit | dataSizeLimit)
  {
    objc_msgSend_appendFormat_(v7, v46, (uint64_t)CFSTR("CREATE TRIGGER '%@_delete' AFTER DELETE ON '%@' BEGIN "), v47, v28, v28);
    if (entryCountLimit)
      objc_msgSend_appendFormat_(v7, v48, (uint64_t)CFSTR("UPDATE '%@' SET entryCount = entryCount - 1 WHERE tableName = \"%@\";"),
        v49,
        v20,
        v24);
    if (dataSizeLimit)
    {
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v50 = v33;
      v51 = v33;
      v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v79, (uint64_t)v89, 16);
      if (v53)
      {
        v56 = v53;
        v57 = *(_QWORD *)v80;
        do
        {
          for (j = 0; j != v56; ++j)
          {
            if (*(_QWORD *)v80 != v57)
              objc_enumerationMutation(v51);
            objc_msgSend_appendFormat_(v7, v54, (uint64_t)CFSTR("UPDATE '%@' SET dataSize = dataSize - LENGTH(OLD.%@) WHERE tableName = \"%@\";"),
              v55,
              v20,
              *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j),
              v24);
          }
          v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v79, (uint64_t)v89, 16);
        }
        while (v56);
      }

      v33 = v50;
      v12 = v74;
    }
    objc_msgSend_appendString_(v7, v48, (uint64_t)CFSTR("END;"), v49);
  }
  if (v12)
  {
    objc_msgSend_appendFormat_(v7, v46, (uint64_t)CFSTR("CREATE TRIGGER '%@_update' AFTER UPDATE ON '%@' BEGIN "), v47, v28, v28);
    if (dataSizeLimit)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v61 = v33;
      v62 = v33;
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v75, (uint64_t)v88, 16);
      if (v64)
      {
        v67 = v64;
        v68 = *(_QWORD *)v76;
        do
        {
          for (k = 0; k != v67; ++k)
          {
            if (*(_QWORD *)v76 != v68)
              objc_enumerationMutation(v62);
            objc_msgSend_appendFormat_(v7, v65, (uint64_t)CFSTR("UPDATE '%@' SET dataSize = dataSize + LENGTH(NEW.%@) - LENGTH(OLD.%@) WHERE tableName = \"%@\";"),
              v66,
              v20,
              *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k),
              *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k),
              v24);
          }
          v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v75, (uint64_t)v88, 16);
        }
        while (v67);
      }

      v33 = v61;
    }
    if (cacheExpirationTime != 0.0)
      objc_msgSend_appendFormat_(v7, v59, (uint64_t)CFSTR("UPDATE '%@' SET oldestExpireDate = CASE WHEN oldestExpireDate IS NULL OR oldestExpireDate > NEW.expirationDate THEN NEW.expirationDate ELSE oldestExpireDate END WHERE tableName = \"%@\";"),
        v60,
        v20,
        v24);
    objc_msgSend_appendString_(v7, v59, (uint64_t)CFSTR("END;"), v60);
  }

  return v7;
}

- (id)didCreateDatabaseTable
{
  void *v3;
  CKSQLiteCacheTableTrackingEntry *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  CKSQLiteCacheTableTrackingTable *v21;
  CKSQLiteCacheTableTrackingTable *trackingTable;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKSQLiteCacheTable;
  -[CKSQLiteTable didCreateDatabaseTable](&v28, sel_didCreateDatabaseTable);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc_init(CKSQLiteCacheTableTrackingEntry);
    objc_msgSend_logicalTableName(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTableName_(v4, v9, (uint64_t)v8, v10);

    objc_msgSend_setEntryCount_(v4, v11, (uint64_t)&unk_1E1FC4A78, v12);
    objc_msgSend_setDataSize_(v4, v13, (uint64_t)&unk_1E1FC4A78, v14);
    objc_msgSend_tableGroup(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tableWithName_(v18, v19, (uint64_t)CFSTR("CKSQLiteCacheTableTrackingTable"), v20);
    v21 = (CKSQLiteCacheTableTrackingTable *)objc_claimAutoreleasedReturnValue();
    trackingTable = self->_trackingTable;
    self->_trackingTable = v21;

    objc_msgSend_insertObject_(self->_trackingTable, v23, (uint64_t)v4, v24);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_count_(self, v25, 0, v26);

  }
  return v3;
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
  CKSQLiteCacheTableTrackingTable *v10;
  CKSQLiteCacheTableTrackingTable *trackingTable;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKSQLiteCacheTable;
  -[CKSQLiteTable wakeFromDatabase](&v13, sel_wakeFromDatabase);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableGroup(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableWithName_(v7, v8, (uint64_t)CFSTR("CKSQLiteCacheTableTrackingTable"), v9);
  v10 = (CKSQLiteCacheTableTrackingTable *)objc_claimAutoreleasedReturnValue();
  trackingTable = self->_trackingTable;
  self->_trackingTable = v10;

  return v3;
}

- (id)extraGroupTables:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKSQLiteCacheTableTrackingTable *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKSQLiteCacheTable;
  -[CKSQLiteTable extraGroupTables:](&v13, sel_extraGroupTables_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("CKSQLiteCacheTableTrackingTable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [CKSQLiteCacheTableTrackingTable alloc];
    v10 = (void *)objc_msgSend_initWithLogicalTableName_(v7, v8, (uint64_t)CFSTR("CKSQLiteCacheTableTrackingTable"), v9);
    objc_msgSend_setObject_forKey_(v3, v11, (uint64_t)v10, (uint64_t)CFSTR("CKSQLiteCacheTableTrackingTable"));

  }
  return v3;
}

- (id)oldestFirstEnumerator
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A73778C;
  v3[3] = &unk_1E1F60048;
  v3[4] = self;
  objc_msgSend_entriesWithValues_label_error_setupBlock_(self, a2, 0, (uint64_t)off_1E1F63548, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fetchExpirationDate:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend_primaryKeyProperties(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v8, (uint64_t)&unk_1E1FC4220, (uint64_t)v10, v7, off_1E1F63560);

}

- (unint64_t)expireByCount:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  unint64_t v23;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  CKSQLiteCacheTable *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);

  objc_msgSend_entryCount(v4, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedLongLongValue(v11, v12, v13, v14) - self->_entryCountLimit;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (v15 < 1)
  {
    v23 = 0;
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_18A737A68;
    v28[3] = &unk_1E1F635A8;
    v28[4] = self;
    v28[5] = &v29;
    v28[6] = v15;
    v18 = (id)objc_msgSend_performInTransaction_(self, v16, (uint64_t)v28, v17);
    if (objc_msgSend_logOperations(self, v19, v20, v21))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v22 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v30[3];
        *(_DWORD *)buf = 138543874;
        v34 = v26;
        v35 = 2048;
        v36 = self;
        v37 = 2048;
        v38 = v27;
        _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@(%p) count expiration removed %llu entries", buf, 0x20u);

      }
    }
    v23 = v30[3];
  }
  _Block_object_dispose(&v29, 8);

  return v23;
}

- (unint64_t)expireByDataSize:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  unint64_t v23;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  CKSQLiteCacheTable *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend_dataSize(v4, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedLongLongValue(v11, v12, v13, v14) > self->_dataSizeLimit;

  if (v15)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_18A737E64;
    v28[3] = &unk_1E1F60688;
    v28[4] = self;
    v29 = v4;
    v30 = &v31;
    v18 = (id)objc_msgSend_performInTransaction_(self, v16, (uint64_t)v28, v17);
    if (objc_msgSend_logOperations(self, v19, v20, v21))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v22 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v32[3];
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        v37 = 2048;
        v38 = self;
        v39 = 2048;
        v40 = v27;
        _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@(%p) size expiration removed %llu entries", buf, 0x20u);

      }
    }

  }
  v23 = v32[3];
  _Block_object_dispose(&v31, 8);

  return v23;
}

- (unint64_t)expireByTime:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  CKSQLiteCacheTable *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  CKSQLiteCacheTable *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_db(self, v5, v6, v7);

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_18A738138;
  v21[3] = &unk_1E1F635E8;
  v8 = v4;
  v23 = self;
  v24 = &v25;
  v22 = v8;
  v11 = (id)objc_msgSend_performInTransaction_(self, v9, (uint64_t)v21, v10);
  if (objc_msgSend_logOperations(self, v12, v13, v14))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v15 = (id)ck_log_facility_sql;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v26[3];
      *(_DWORD *)buf = 138543874;
      v30 = v19;
      v31 = 2048;
      v32 = self;
      v33 = 2048;
      v34 = v20;
      _os_log_debug_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@(%p) time expiration removed %llu entries", buf, 0x20u);

    }
  }
  v16 = v26[3];

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (id)trackingEntry
{
  uint64_t v2;
  uint64_t v3;
  CKSQLiteCacheTableTrackingTable *trackingTable;
  void *v5;
  const char *v6;
  void *v7;

  trackingTable = self->_trackingTable;
  objc_msgSend_logicalTableName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(trackingTable, v6, (uint64_t)v5, 0, off_1E1F63608, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)entryCount
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  objc_msgSend_trackingEntry(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entryCount(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_unsignedLongLongValue(v8, v9, v10, v11);

  return v12;
}

- (unint64_t)entryDataSize
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  objc_msgSend_trackingEntry(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataSize(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_unsignedLongLongValue(v8, v9, v10, v11);

  return v12;
}

- (void)expire:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A73838C;
  v8[3] = &unk_1E1F61A48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend_serialize_(self, v5, (uint64_t)v8, v6);

}

- (void)activityTriggered:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A7387D0;
  v8[3] = &unk_1E1F61A48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend_serialize_(self, v5, (uint64_t)v8, v6);

}

- (void)activityTriggerWasRolledBack
{
  uint64_t v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A738858;
  v3[3] = &unk_1E1F5FAA8;
  v3[4] = self;
  objc_msgSend_serialize_(self, a2, (uint64_t)v3, v2);
}

- (void)periodicExpire
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
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id v27;
  id v28;

  if (!self->_dataExpireScheduled)
  {
    objc_msgSend_trackingEntry(self, a2, v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v5;
    if (self->_entryCountLimit)
    {
      objc_msgSend_entryCount(v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend_unsignedLongLongValue(v9, v10, v11, v12) > self->_entryCountLimit;

    }
    else
    {
      v13 = 0;
    }
    if (self->_dataSizeLimit)
    {
      objc_msgSend_dataSize(v28, v6, v7, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_unsignedLongLongValue(v14, v15, v16, v17) > self->_dataSizeLimit;

    }
    else
    {
      v18 = 0;
    }
    v19 = v28;
    if (v13 || v18)
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], v6, v7, v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestCallbackWithDate_coalescingInterval_minimumSeparation_(self, v21, (uint64_t)v20, v22, self->_expireDelay, self->_expireDelay);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        self->_dataExpireScheduled = 1;

      v19 = v28;
    }
    if (self->_cacheExpirationTime != 0.0 && !self->_dataExpireScheduled)
    {
      objc_msgSend_oldestExpireDate(v28, v6, v7, v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (id)objc_msgSend_requestCallbackWithDate_coalescingInterval_minimumSeparation_(self, v25, (uint64_t)v24, v26, self->_expireDelay, self->_expireDelay);

      v19 = v28;
    }

  }
}

- (id)extendExpiration:(id)a3
{
  void *v4;
  double cacheExpirationTime;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99D68];
  cacheExpirationTime = self->_cacheExpirationTime;
  v6 = a3;
  objc_msgSend_dateWithTimeIntervalSinceNow_(v4, v7, v8, v9, cacheExpirationTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEntryExpiration_date_(self, v11, (uint64_t)v6, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)setEntryExpiration:(id)a3 date:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_setExpirationDate_(v6, v7, (uint64_t)a4, v8);
  objc_msgSend_updateProperties_usingObject_label_(self, v9, (uint64_t)&unk_1E1FC4238, (uint64_t)v6, off_1E1F63660);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)transactionExpireCheck
{
  CKSQLiteCacheTable *v3;
  const char *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (!self->_expireCheckPending)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18A738B6C;
    v6[3] = &unk_1E1F5F958;
    v6[4] = self;
    v3 = self;
    objc_msgSend_addTransactionCompletionHandler_(v3, v4, (uint64_t)v6, v5);
    self->_expireCheckPending = 1;

  }
}

- (id)insertObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  CKSQLiteCacheTable *v23;

  v4 = a3;
  v8 = v4;
  if (self->_cacheExpirationTime != 0.0)
  {
    objc_msgSend_expirationDate(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v10, v11, v12, self->_cacheExpirationTime);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExpirationDate_(v8, v14, (uint64_t)v13, v15);

    }
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_18A738C88;
  v21[3] = &unk_1E1F605B0;
  v22 = v8;
  v23 = self;
  v16 = v8;
  objc_msgSend_performInTransaction_(self, v17, (uint64_t)v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)insertObject:(id)a3 orUpdateProperties:(id)a4 label:(id *)a5
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
  uint64_t v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  CKSQLiteCacheTable *v29;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v30;

  v8 = a3;
  v9 = a4;
  objc_msgSend_expirationDate(v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v14, v15, v16, self->_cacheExpirationTime);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExpirationDate_(v8, v18, (uint64_t)v17, v19);

  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_18A738DEC;
  v26[3] = &unk_1E1F60438;
  v27 = v8;
  v28 = v9;
  v29 = self;
  v30 = a5;
  v20 = v9;
  v21 = v8;
  objc_msgSend_performInTransaction_(self, v22, (uint64_t)v26, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (unint64_t)setProperties:(id)a3 valuesToStore:(id)a4 inEntriesMatching:(id)a5 label:(id *)a6 error:(id *)a7 predicate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  CKSQLiteCacheTable *v32;
  id v33;
  uint64_t *v34;
  const $BA24BB89C84EB3F65F0C807C16FE2DC6 *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_18A738FCC;
  v28[3] = &unk_1E1F63680;
  v34 = &v36;
  v18 = v14;
  v29 = v18;
  v19 = v15;
  v30 = v19;
  v20 = v16;
  v31 = v20;
  v35 = a6;
  v21 = v17;
  v32 = self;
  v33 = v21;
  objc_msgSend_performInTransaction_(self, v22, (uint64_t)v28, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a7 && v24)
    *a7 = objc_retainAutorelease(v24);
  v26 = v37[3];

  _Block_object_dispose(&v36, 8);
  return v26;
}

- (unint64_t)entryCountLimit
{
  return self->_entryCountLimit;
}

- (unint64_t)dataSizeLimit
{
  return self->_dataSizeLimit;
}

- (double)cacheExpirationTime
{
  return self->_cacheExpirationTime;
}

- (double)expireDelay
{
  return self->_expireDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingTable, 0);
}

@end
