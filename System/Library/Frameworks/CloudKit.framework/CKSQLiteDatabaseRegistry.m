@implementation CKSQLiteDatabaseRegistry

+ (id)dbProperties
{
  return &unk_1E1FC4D38;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)registerDatabase:(id)a3
{
  id v4;
  CKSQLiteDatabaseRegistryEntry *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  v4 = a3;
  v5 = objc_alloc_init(CKSQLiteDatabaseRegistryEntry);
  objc_msgSend_databaseDirectory(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDatabaseDirectory_(v5, v10, (uint64_t)v9, v11);

  objc_msgSend_uniquingKey(v4, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUniquingKey_(v5, v16, (uint64_t)v15, v17);
  objc_msgSend_insertObject_(self, v18, (uint64_t)v5, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)databaseWithID:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char isEqual;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  id v35;
  void *v36;
  const char *v37;
  uint64_t v38;

  objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, 0, off_1E1F652D8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (!v4)
  {
    v15 = 0;
    goto LABEL_12;
  }
  objc_msgSend_databaseDirectory(v4, v5, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_db(self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_databaseInDirectory_registryDatabase_options_error_(CKSQLiteDatabase, v14, (uint64_t)v12, (uint64_t)v13, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_9;
LABEL_7:
    objc_msgSend_uniquingKey(v8, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uniquingKey(v15, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

    if ((isEqual & 1) == 0)
    {

      objc_msgSend_tableGroup(self, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_databaseWasRemoved_(v30, v31, (uint64_t)v8, v32);

      v35 = (id)objc_msgSend_deleteObject_(self, v33, (uint64_t)v8, v34);
      v15 = 0;
    }
    goto LABEL_9;
  }
  objc_msgSend_db(self, v9, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    goto LABEL_7;
LABEL_9:
  objc_msgSend_databaseManagerData(v15, v16, v17, v18);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
    objc_msgSend_setDatabaseManagerData_(v15, v37, (uint64_t)v8, v38);

LABEL_12:
  return v15;
}

- (id)entryForDatabase:(id)a3 refresh:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKSQLiteDatabaseRegistryEntry *v19;
  id v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
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
  const char *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v39;
  _QWORD v40[2];

  v6 = a4;
  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_db(self, v9, v10, v11);

  objc_msgSend_databaseManagerData(v8, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v19 = (CKSQLiteDatabaseRegistryEntry *)v15;
    if (v6)
      v20 = (id)objc_msgSend_fetchAllProperties_(self, v16, v15, v18);
  }
  else
  {
    objc_msgSend_uniquingKey(v8, v16, v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = CFSTR("KEY");
    v40[0] = v21;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v40, (uint64_t)&v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entryWithValues_label_error_setupBlock_(self, v24, (uint64_t)v23, (uint64_t)off_1E1F652F0, 0, &unk_1E1F588D8);
    v19 = (CKSQLiteDatabaseRegistryEntry *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v19 = objc_alloc_init(CKSQLiteDatabaseRegistryEntry);
      objc_msgSend_databaseDirectory(v8, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDatabaseDirectory_(v19, v31, (uint64_t)v30, v32);

      objc_msgSend_setUniquingKey_(v19, v33, (uint64_t)v21, v34);
      objc_msgSend_insertObject_(self, v35, (uint64_t)v19, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {

        v19 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v37);
      }

    }
    objc_msgSend_setDatabaseManagerData_(v8, v25, (uint64_t)v19, v26);

  }
  return v19;
}

- (id)databaseIDForDatabase:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  objc_msgSend_db(self, v7, v8, v9);

  objc_msgSend_entryForDatabase_refresh_error_(self, v10, (uint64_t)v6, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_databaseID(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
