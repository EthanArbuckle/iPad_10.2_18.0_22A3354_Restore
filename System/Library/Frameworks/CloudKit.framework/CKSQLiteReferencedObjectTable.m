@implementation CKSQLiteReferencedObjectTable

- (id)refcountTableName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_logicalTableName(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v4, v5, (uint64_t)CFSTR("_refcount"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)lookupRefcountTable
{
  uint64_t v2;
  uint64_t v3;
  CKSQLiteRefcountTable *refcountTable;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  CKSQLiteRefcountTable *v13;
  CKSQLiteRefcountTable *v14;

  refcountTable = self->_refcountTable;
  if (!refcountTable)
  {
    objc_msgSend_refcountTableName(self, a2, v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tableGroup(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tableWithName_(v10, v11, (uint64_t)v6, v12);
    v13 = (CKSQLiteRefcountTable *)objc_claimAutoreleasedReturnValue();
    v14 = self->_refcountTable;
    self->_refcountTable = v13;

    refcountTable = self->_refcountTable;
  }
  return refcountTable;
}

- (id)refcountTriggerSQLForProperty:(id)a3 inTable:(id)a4
{
  id v6;
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
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;

  v6 = a3;
  objc_msgSend_dbTableName(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lookupRefcountTable(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbTableName(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("%@_%@"), v21, v10, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryKeyProperty(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v19, v27, (uint64_t)CFSTR(" CREATE TRIGGER '%@_insert_retain' AFTER INSERT ON '%@' WHEN NEW.%@ IS NOT NULL BEGIN "), v28, v22, v10, v6);
  objc_msgSend_appendFormat_(v19, v29, (uint64_t)CFSTR("UPDATE '%@' SET refCount = refCount + 1 WHERE objectID = NEW.%@; "),
    v30,
    v18,
    v26);
  objc_msgSend_appendString_(v19, v31, (uint64_t)CFSTR("END;"), v32);
  objc_msgSend_appendFormat_(v19, v33, (uint64_t)CFSTR(" CREATE TRIGGER '%@_delete_release' AFTER DELETE ON '%@' WHEN NEW.%@ IS NOT NULL BEGIN "), v34, v22, v10, v6);
  objc_msgSend_appendFormat_(v19, v35, (uint64_t)CFSTR("UPDATE '%@' SET refCount = refCount - 1 WHERE objectID = OLD.%@;"),
    v36,
    v18,
    v6);
  objc_msgSend_appendString_(v19, v37, (uint64_t)CFSTR("END;"), v38);
  objc_msgSend_appendFormat_(v19, v39, (uint64_t)CFSTR(" CREATE TRIGGER '%@_update_retain_new' BEFORE UPDATE ON '%@' WHEN NEW.%@ IS NOT NULL BEGIN "), v40, v22, v10, v6);
  objc_msgSend_appendFormat_(v19, v41, (uint64_t)CFSTR("UPDATE '%@' SET refCount = refCount + 1 WHERE objectID = NEW.%@; "),
    v42,
    v18,
    v6);
  objc_msgSend_appendString_(v19, v43, (uint64_t)CFSTR("END;"), v44);
  objc_msgSend_appendFormat_(v19, v45, (uint64_t)CFSTR(" CREATE TRIGGER '%@_update_release_old' AFTER UPDATE ON '%@' WHEN OLD.%@ IS NOT NULL BEGIN "), v46, v22, v10, v6);
  objc_msgSend_appendFormat_(v19, v47, (uint64_t)CFSTR("UPDATE '%@' SET refCount = refCount - 1 WHERE objectID = OLD.%@; "),
    v48,
    v18,
    v6);

  objc_msgSend_appendString_(v19, v49, (uint64_t)CFSTR("END;"), v50);
  return v19;
}

- (id)extraGroupTables:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CKSQLiteRefcountTable *v12;
  const char *v13;
  void *v14;
  const char *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKSQLiteReferencedObjectTable;
  -[CKSQLiteTable extraGroupTables:](&v17, sel_extraGroupTables_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_refcountTableName(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v9, (uint64_t)v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = [CKSQLiteRefcountTable alloc];
    v14 = (void *)objc_msgSend_initWithLogicalTableName_referentTable_(v12, v13, (uint64_t)v8, (uint64_t)self);
    objc_msgSend_setObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)v8);

  }
  return v4;
}

- (id)didCreateDatabaseTable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKSQLiteReferencedObjectTable;
  -[CKSQLiteTable didCreateDatabaseTable](&v9, sel_didCreateDatabaseTable);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v7 = (id)objc_msgSend_lookupRefcountTable(self, v3, v4, v5);
  return v6;
}

- (id)wakeFromDatabase
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKSQLiteReferencedObjectTable;
  -[CKSQLiteTable wakeFromDatabase](&v9, sel_wakeFromDatabase);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v7 = (id)objc_msgSend_lookupRefcountTable(self, v3, v4, v5);
  return v6;
}

- (id)databaseReferenceValueForEntry:(id)a3 error:(id *)a4
{
  id v6;
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
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v22;

  v6 = a3;
  objc_msgSend_primaryKeyProperty(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryKeyPropertyInfo(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForProperty_propertyInfo_inObject_(self, v15, (uint64_t)v10, (uint64_t)v14, v6);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_2;
  objc_msgSend_willStoreReferenceToUnsavedEntry_(self, v17, (uint64_t)v6, v18);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend_valueForProperty_propertyInfo_inObject_(self, v22, (uint64_t)v10, (uint64_t)v14, v6);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_2:
    v19 = (void *)v16;
    v20 = 0;
    goto LABEL_3;
  }
  if (a4)
  {
    v20 = objc_retainAutorelease(v20);
    v19 = 0;
    *a4 = v20;
  }
  else
  {
    v19 = 0;
  }
LABEL_3:

  return v19;
}

- (id)entryForDatabaseReferenceValue:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, a2, (uint64_t)a3, 0, off_1E1F62F88, a4);
}

- (unint64_t)refcountForEntry:(id)a3
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
  void *v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;

  v4 = a3;
  objc_msgSend_primaryKeyProperty(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryKeyPropertyInfo(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForProperty_propertyInfo_inObject_(self, v13, (uint64_t)v8, (uint64_t)v12, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend_refcountForObjectID_(self->_refcountTable, v15, (uint64_t)v14, v16);
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refcountTable, 0);
}

@end
