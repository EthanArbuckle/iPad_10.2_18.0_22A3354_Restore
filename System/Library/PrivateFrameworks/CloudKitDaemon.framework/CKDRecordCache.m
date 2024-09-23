@implementation CKDRecordCache

+ (id)recordCacheInDatabase:(id)a3 withContainer:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;

  v6 = a3;
  objc_msgSend_containerID(a4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_specialContainerType(v9, v13, v14);
  v17 = objc_msgSend_tableGroupOptionsForContainerType_(a1, v16, v15);
  objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(CKDRecordCache, v18, 2, v12, CFSTR("RecordCache"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, v20, (uint64_t)v6, v19, v17, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)recordCacheWithPath:(id)a3 forContainer:(id)a4
{
  void *v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;

  v6 = (void *)MEMORY[0x1E0C950E8];
  v7 = a4;
  v8 = a3;
  objc_msgSend_deviceContext(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceScopedDatabase(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseInDirectory_registryDatabase_options_error_(v6, v15, (uint64_t)v8, v14, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordCacheInDatabase_withContainer_(a1, v17, (uint64_t)v16, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)recordCacheForContainer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  v4 = a3;
  objc_msgSend_directoryContext(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_daemonDatabaseDirectory(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_path(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordCacheWithPath_forContainer_(a1, v14, (uint64_t)v13, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)createTables:(id *)a3
{
  CKDRecordCacheTable *v4;
  CKDRecordCacheTable *rc;
  const char *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(CKDRecordCacheTable);
  rc = self->_rc;
  self->_rc = v4;

  v8[0] = self->_rc;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v8, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_rc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rc, 0);
}

@end
