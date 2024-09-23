@implementation CKSQLiteRefcountTable

+ (id)dbProperties
{
  return &unk_1E1FC4CC0;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKSQLiteRefcountTable)initWithLogicalTableName:(id)a3 referentTable:(id)a4
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKSQLiteRefcountTable *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *referentPrimaryKey;
  void *v22;
  const char *v23;
  objc_super v24;

  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CKSQLiteRefcountTable;
  v12 = -[CKSQLiteTable initWithLogicalTableName:](&v24, sel_initWithLogicalTableName_, a3);
  if (v12)
  {
    if ((objc_msgSend_isIntegerPrimaryKeyTable(v8, v9, v10, v11) & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)v12, CFSTR("CKSQLiteReferencedObjectTable.m"), 70, CFSTR("Refcounted tables must have integer primary key"));

    }
    objc_storeStrong((id *)&v12->_referentDBTable, a4);
    objc_msgSend_primaryKeyProperty(v8, v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    referentPrimaryKey = v12->_referentPrimaryKey;
    v12->_referentPrimaryKey = (NSString *)v19;

  }
  return v12;
}

- (id)createTableSQL
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
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CKSQLiteRefcountTable;
  -[CKSQLiteTable createTableSQL](&v33, sel_createTableSQL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(self->_referentDBTable, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v12, (uint64_t)CFSTR(" CREATE TRIGGER '%@_referent_insert' AFTER INSERT ON '%@' BEGIN "), v13, v7, v11);
  objc_msgSend_appendFormat_(v3, v14, (uint64_t)CFSTR("INSERT INTO '%@' (objectID, refCount) VALUES (NEW.%@, 0); "),
    v15,
    v7,
    self->_referentPrimaryKey);
  objc_msgSend_appendFormat_(v3, v16, (uint64_t)CFSTR("END;"), v17);
  objc_msgSend_appendFormat_(v3, v18, (uint64_t)CFSTR(" CREATE TRIGGER '%@_referent_delete' AFTER DELETE ON '%@' BEGIN "), v19, v7, v11);
  objc_msgSend_appendFormat_(v3, v20, (uint64_t)CFSTR("DELETE FROM '%@' WHERE objectID = OLD.%@; "),
    v21,
    v7,
    self->_referentPrimaryKey);
  objc_msgSend_appendFormat_(v3, v22, (uint64_t)CFSTR("END;"), v23);
  objc_msgSend_appendFormat_(v3, v24, (uint64_t)CFSTR(" CREATE TRIGGER '%@_unreferenced_delete' AFTER UPDATE OF refCount ON '%@' WHEN NEW.refCount=0 BEGIN "), v25, v7, v7);
  objc_msgSend_appendFormat_(v3, v26, (uint64_t)CFSTR("DELETE FROM '%@' WHERE objectID = NEW.objectID; "), v27, v7);
  objc_msgSend_appendFormat_(v3, v28, (uint64_t)CFSTR("DELETE FROM '%@' WHERE %@ = NEW.objectID; "),
    v29,
    v11,
    self->_referentPrimaryKey);
  objc_msgSend_appendFormat_(v3, v30, (uint64_t)CFSTR("END;"), v31);

  return v3;
}

- (id)deleteUnreferenced
{
  id v3;

  v3 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, a2, 0, 0, &v3, &unk_1E1F58598);
  return v3;
}

- (id)finishInitializing
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int isFirstInstance;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKSQLiteReferencedObjectTable *referentDBTable;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKSQLiteRefcountTable;
  -[CKSQLiteTable finishInitializing](&v17, sel_finishInitializing);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend_tableGroup(self, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isFirstInstance = objc_msgSend_isFirstInstance(v7, v8, v9, v10);

    if (isFirstInstance)
    {
      objc_msgSend_deleteUnreferenced(self, v12, v13, v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  referentDBTable = self->_referentDBTable;
  self->_referentDBTable = 0;

  return v6;
}

- (unint64_t)refcountForObjectID:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, 0, off_1E1F62F70, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    objc_msgSend_refCount(v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);

  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referentPrimaryKey, 0);
  objc_storeStrong((id *)&self->_referentDBTable, 0);
}

@end
