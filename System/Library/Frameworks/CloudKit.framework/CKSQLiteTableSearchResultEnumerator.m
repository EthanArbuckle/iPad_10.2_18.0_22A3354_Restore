@implementation CKSQLiteTableSearchResultEnumerator

- (id)cksqlcs_appendSQLConstantValueToString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend_statement(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cksqlcs_appendSQLConstantValueToString_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_invalidate(self, v12, v13, v14);
  return v11;
}

- (CKSQLiteTableSearchResultEnumerator)initWithTable:(id)a3 statement:(id)a4
{
  id v7;
  id v8;
  CKSQLiteTableSearchResultEnumerator *v9;
  CKSQLiteTableSearchResultEnumerator *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *groupName;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *tableName;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CKSQLiteTableSearchResultEnumerator;
  v9 = -[CKSQLiteTableSearchResultEnumerator init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_table, a3);
    objc_msgSend_tableGroup(v7, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    groupName = v10->_groupName;
    v10->_groupName = (NSString *)v18;

    objc_msgSend_logicalTableName(v7, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    tableName = v10->_tableName;
    v10->_tableName = (NSString *)v23;

    objc_storeStrong((id *)&v10->_statement, a4);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKSQLiteTableSearchResultEnumerator;
  -[CKSQLiteTableSearchResultEnumerator dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  CKSQLiteCompiledStatement *statement;
  CKSQLiteCompiledStatement *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  CKSQLiteTable *table;
  int v15;
  void *v16;
  __int16 v17;
  CKSQLiteTableSearchResultEnumerator *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  statement = self->_statement;
  if (statement)
  {
    objc_msgSend_resetAndClearBindings(statement, a2, v2, v3);
    v6 = self->_statement;
    self->_statement = 0;

    if (objc_msgSend_logOperations(self->_table, v7, v8, v9))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v10 = (void *)ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v13;
        v17 = 2048;
        v18 = self;
        _os_log_impl(&dword_18A5C5000, v11, OS_LOG_TYPE_INFO, "%{public}@(%p): End enumeration", (uint8_t *)&v15, 0x16u);

      }
    }
  }
  table = self->_table;
  self->_table = 0;

}

- (id)currentObject
{
  return self->_entry;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  sub_18A6C32B4((uint64_t)self, a2, (uint64_t)a3, (uint64_t)a4);
  if (!a3->var0)
  {
    a3->var0 = 1;
    a3->var1 = &self->_entry;
    a3->var2 = a3->var3;
  }
  return self->_entry != 0;
}

- (id)nextObject
{
  uint64_t v2;
  uint64_t v3;

  sub_18A6C32B4((uint64_t)self, a2, v2, v3);
  return self->_entry;
}

- (NSError)error
{
  return self->_error;
}

- (CKSQLiteCompiledStatement)statement
{
  return self->_statement;
}

- (void)setStatement:(id)a3
{
  objc_storeStrong((id *)&self->_statement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong(&self->_entry, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end
