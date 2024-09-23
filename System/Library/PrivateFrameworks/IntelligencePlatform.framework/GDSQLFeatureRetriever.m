@implementation GDSQLFeatureRetriever

- (GDSQLFeatureRetriever)initWithDatabase:(id)a3
{
  id v5;
  GDSQLFeatureRetriever *v6;
  GDSQLFeatureRetriever *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDSQLFeatureRetriever;
  v6 = -[GDSQLFeatureRetriever init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_db, a3);

  return v7;
}

- (id)featureForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _PASSqliteDatabase *db;
  uint64_t v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend_subidentifierName(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v26 = &v25;
  if (v10)
    v11 = CFSTR("SELECT value FROM kv WHERE viewName = :viewName AND featureName = :featureName AND subidentifierName = :subidentifierName");
  else
    v11 = CFSTR("SELECT value FROM kv WHERE viewName = :viewName AND featureName = :featureName");
  v27 = 0x3032000000;
  v28 = sub_1AE90C9AC;
  v29 = sub_1AE90C9BC;
  v30 = 0;
  db = self->_db;
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1AE90CAF0;
  v23[3] = &unk_1E5DD98E8;
  v14 = v6;
  v24 = v14;
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = sub_1AE90CBB0;
  v21[3] = &unk_1E5DD9858;
  v15 = v7;
  v22 = v15;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = sub_1AE90CC68;
  v20[3] = &unk_1E5DD9880;
  v20[4] = &v25;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v16, (uint64_t)v11, v23, v21, v20);
  if (a4 && (v17 = (void *)v26[5]) != 0)
  {
    v18 = 0;
    *a4 = objc_retainAutorelease(v17);
  }
  else
  {
    v18 = v15;
  }

  _Block_object_dispose(&v25, 8);
  return v18;
}

- (id)featureKeysWithError:(id *)a3
{
  void *v5;
  _PASSqliteDatabase *db;
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = (void *)objc_opt_new();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE90C9AC;
  v20 = sub_1AE90C9BC;
  v21 = 0;
  db = self->_db;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE90C9C4;
  v14[3] = &unk_1E5DD9858;
  v8 = v5;
  v15 = v8;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = sub_1AE90CAC0;
  v13[3] = &unk_1E5DD9880;
  v13[4] = &v16;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v9, (uint64_t)CFSTR("SELECT viewName, featureName, subidentifierName FROM kv"), &unk_1E5DD98C0, v14, v13);
  if (a3 && (v10 = (void *)v17[5]) != 0)
  {
    v11 = 0;
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    v11 = v8;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
