@implementation CKSQLiteKeyValueTableGroup

+ (id)keyValueStoreInDatabase:(id)a3 create:(BOOL)a4
{
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  id v15;

  if (a4)
    v5 = 0;
  else
    v5 = 0x10000;
  v6 = a3;
  objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(a1, v7, 0, 0, CFSTR("KeyValueStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend_tableGroupInDatabase_withName_options_error_(a1, v9, (uint64_t)v6, (uint64_t)v8, v5, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v15;
  v12 = v10;
  if (v12)
    v12 = (_QWORD *)v12[17];
  v13 = v12;

  return v13;
}

- (id)createTables:(id *)a3
{
  CKSQLiteKeyValueStore *v4;
  const char *v5;
  uint64_t v6;
  CKSQLiteKeyValueStore *v7;
  CKSQLiteKeyValueStore *store;
  const char *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = [CKSQLiteKeyValueStore alloc];
  v7 = (CKSQLiteKeyValueStore *)objc_msgSend_initWithLogicalTableName_(v4, v5, (uint64_t)CFSTR("KeyValue"), v6);
  store = self->_store;
  self->_store = v7;

  v11[0] = self->_store;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v11, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
