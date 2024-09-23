@implementation CKDatabaseOperation

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  objc_super v30;

  objc_msgSend_database(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (a3)
    {
      objc_msgSend_operationID(self, v7, v8, v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v28, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("There is no database set on operation %@."), v26);
      goto LABEL_7;
    }
    return 0;
  }
  objc_msgSend_configuration(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_database(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 != v22)
  {
    if (a3)
    {
      objc_msgSend_operationID(self, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v27, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("The container set on operation %@ does not match the container of the database set on that operation."), v26);
LABEL_7:
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
    return 0;
  }
  v30.receiver = self;
  v30.super_class = (Class)CKDatabaseOperation;
  return -[CKOperation CKOperationShouldRun:](&v30, sel_CKOperationShouldRun_, a3);
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKDatabaseOperation;
  v4 = a3;
  -[CKOperation fillOutOperationInfo:](&v15, sel_fillOutOperationInfo_, v4);
  objc_msgSend_database(self, v5, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_scope(v8, v9, v10, v11);
  objc_msgSend_setDatabaseScope_(v4, v13, v12, v14);

}

- (CKDatabase)database
{
  CKDatabaseOperation *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKDatabase *database;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CKDatabase *v16;
  CKDatabase *v17;

  v2 = self;
  objc_sync_enter(v2);
  database = v2->_database;
  if (!database)
  {
    objc_msgSend_configuration(v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateCloudDatabase(v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v2->_database;
    v2->_database = (CKDatabase *)v15;

    database = v2->_database;
  }
  v17 = database;
  objc_sync_exit(v2);

  return v17;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  const char *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKDatabaseOperation;
  -[CKOperation CKDescriptionPropertiesWithPublic:private:shouldExpand:](&v23, sel_CKDescriptionPropertiesWithPublic_private_shouldExpand_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9);

  objc_msgSend_databaseIfNotNil(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14;
  if (v14)
  {
    v19 = objc_msgSend_databaseScope(v14, v15, v16, v17);
    CKDatabaseScopeString(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v21, (uint64_t)v20, (uint64_t)CFSTR("databaseScope"));

  }
  return v10;
}

- (id)databaseIfNotNil
{
  CKDatabaseOperation *v2;
  CKDatabase *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_database;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)zoneIDHasCorrectDatabaseScope:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  objc_class *v29;
  void *v30;
  const char *v31;

  v6 = a3;
  v10 = v6;
  if (v6
    && objc_msgSend_databaseScope(v6, v7, v8, v9)
    && (v14 = objc_msgSend_databaseScope(v10, v11, v12, v13), v14 != objc_msgSend_databaseScope(self, v15, v16, v17)))
  {
    if (a4)
    {
      v22 = objc_msgSend_databaseScope(v10, v18, v19, v20);
      CKDatabaseScopeString(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_databaseScope(self, v24, v25, v26);
      CKDatabaseScopeString(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v31, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("zoneID had database scope \"%@\", expected \"%@\" in %@: %@"), v23, v28, v30, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (void)setDatabase:(CKDatabase *)database
{
  CKDatabaseOperation *v5;
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
  CKDatabase *v16;

  v16 = database;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_database, database);
  objc_msgSend_container(v16, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configuration(v5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainer_(v13, v14, (uint64_t)v9, v15);

  objc_sync_exit(v5);
}

- (int64_t)databaseScope
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_database(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_databaseScope(v4, v5, v6, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  const char *v20;
  uint64_t v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKDatabaseOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v22, sel_fillFromOperationInfo_, v4);
  v8 = objc_msgSend_databaseScope(v4, v5, v6, v7, v22.receiver, v22.super_class);

  objc_msgSend_configuration(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseWithDatabaseScope_(v16, v17, v8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDatabase_(self, v20, (uint64_t)v19, v21);

}

@end
