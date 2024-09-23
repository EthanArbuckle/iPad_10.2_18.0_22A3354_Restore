@implementation CKSQLiteEnumerator

- (CKSQLiteEnumerator)initWithDatabase:(id)a3 columns:(id)a4 from:(id)a5 where:(id)a6 bindings:(id)a7 orderBy:(id)a8
{
  id v15;
  id v16;
  id v17;
  CKSQLiteEnumerator *v18;
  CKSQLiteEnumerator *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *objects;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v16 = a7;
  v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CKSQLiteEnumerator;
  v18 = -[CKSQLiteEnumerator init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_database, a3);
    objc_storeStrong((id *)&v19->_columns, a4);
    objc_storeStrong((id *)&v19->_tableName, a5);
    objc_storeStrong((id *)&v19->_whereSQL, a6);
    objc_storeStrong((id *)&v19->_bindings, a7);
    objc_storeStrong((id *)&v19->_orderBy, a8);
    v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v23 = objc_msgSend_initWithCapacity_(v20, v21, 64, v22);
    objects = v19->_objects;
    v19->_objects = (NSMutableArray *)v23;

  }
  return v19;
}

- (id)nextObject
{
  uint64_t v2;
  uint64_t v3;
  unint64_t index;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKSQLite *database;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  void *objectTranslator;
  void (**v20)(id, void *);
  uint64_t v21;
  _QWORD v23[5];

  index = self->_index;
  if (index == objc_msgSend_count(self->_objects, a2, v2, v3))
  {
    objc_msgSend_removeAllObjects(self->_objects, v6, v7, v8);
    database = self->_database;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_18A779AB8;
    v23[3] = &unk_1E1F629E8;
    v23[4] = self;
    v12 = (id)objc_msgSend_performDatabaseOperation_(database, v10, (uint64_t)v23, v11);
    self->_index = 0;
    self->_fetchOffset += objc_msgSend_count(self->_objects, v13, v14, v15);
  }
  v16 = self->_index;
  if (v16 >= objc_msgSend_count(self->_objects, v6, v7, v8))
  {
    v21 = 0;
    objectTranslator = self->_objectTranslator;
    self->_objectTranslator = 0;
    goto LABEL_7;
  }
  objc_msgSend_objectAtIndex_(self->_objects, v17, self->_index, v18);
  objectTranslator = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_index;
  v20 = (void (**)(id, void *))self->_objectTranslator;
  if (v20)
  {
    v20[2](v20, objectTranslator);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_7:

    objectTranslator = (void *)v21;
  }
  return objectTranslator;
}

- (id)objectTranslator
{
  return self->_objectTranslator;
}

- (void)setObjectTranslator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectTranslator, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_orderBy, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_whereSQL, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
