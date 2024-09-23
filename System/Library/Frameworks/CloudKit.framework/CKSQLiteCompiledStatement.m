@implementation CKSQLiteCompiledStatement

+ (id)statementForFetchingAllTableNamesInDatabase:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v7 = (void *)objc_msgSend_initWithDatabase_sql_resultColumns_resultColumnTypes_(v5, v6, (uint64_t)v4, (uint64_t)CFSTR("SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%'"), &unk_1E1FC3F80, &unk_1E1FC3F98);

  return v7;
}

+ (id)statementForCountingRowsInTable:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  objc_msgSend_dbTableName(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("SELECT COUNT (*) FROM '%@'"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc((Class)a1);
  v15 = (void *)objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v13, v14, (uint64_t)v5, (uint64_t)v12, &unk_1E1FC3FB0, &unk_1E1FC3FC8);

  return v15;
}

+ (id)statementForSummingColumn:(id)a3 inTable:(id)a4
{
  void *v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;

  v6 = (void *)MEMORY[0x1E0CB37A0];
  v7 = a4;
  v8 = a3;
  objc_msgSend_dbTableName(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("SELECT SUM (%@) FROM '%@'"), v14, v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc((Class)a1);
  v18 = (void *)objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v16, v17, (uint64_t)v7, (uint64_t)v15, &unk_1E1FC3FE0, &unk_1E1FC3FF8);

  return v18;
}

+ (id)statementForSizingColumn:(id)a3 inTable:(id)a4
{
  void *v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;

  v6 = (void *)MEMORY[0x1E0CB37A0];
  v7 = a4;
  v8 = a3;
  objc_msgSend_dbTableName(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("SELECT LENGTH (%@) FROM '%@'"), v14, v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc((Class)a1);
  v18 = (void *)objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v16, v17, (uint64_t)v7, (uint64_t)v15, &unk_1E1FC4010, &unk_1E1FC4028);

  return v18;
}

+ (id)statementForUpdatingColumns:(id)a3 inTable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  void *v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend_dbTableName(v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v12, (uint64_t)CFSTR("UPDATE '%@' SET "), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v5;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v17)
  {
    v20 = v17;
    v21 = *(_QWORD *)v31;
    v22 = 1;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v15);
        v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23);
        if ((v22 & 1) == 0)
          objc_msgSend_appendString_(v14, v18, (uint64_t)CFSTR(","), v19);
        objc_msgSend_appendFormat_(v14, v18, (uint64_t)CFSTR("%@=:%@"), v19, v24, v24);
        v22 = 0;
        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v30, (uint64_t)v34, 16);
      v22 = 0;
    }
    while (v20);
  }

  v25 = objc_alloc((Class)a1);
  v27 = (void *)objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v25, v26, (uint64_t)v6, (uint64_t)v14, 0, 0);

  return v27;
}

+ (id)statementForInserting:(id)a3 inTable:(id)a4
{
  return (id)objc_msgSend_statementForInserting_orUpdating_inTable_(a1, a2, (uint64_t)a3, 0, a4);
}

+ (id)statementForInserting:(id)a3 orUpdating:(id)a4 inTable:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
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
  char v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  void *v50;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend_dbTableName(v10, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v16, (uint64_t)CFSTR("INSERT INTO '%@' ("), v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_componentsJoinedByString_(v8, v19, (uint64_t)CFSTR(","), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v18, v22, (uint64_t)v21, v23);

  objc_msgSend_appendString_(v18, v24, (uint64_t)CFSTR(") VALUES (:"), v25);
  objc_msgSend_componentsJoinedByString_(v8, v26, (uint64_t)CFSTR(",:"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v18, v29, (uint64_t)v28, v30);

  objc_msgSend_appendString_(v18, v31, (uint64_t)CFSTR(")"), v32);
  if (objc_msgSend_count(v9, v33, v34, v35))
  {
    v52 = a1;
    v54 = v8;
    objc_msgSend_appendString_(v18, v36, (uint64_t)CFSTR(" ON CONFLICT DO UPDATE SET "), v37);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = v9;
    v38 = v9;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v55, (uint64_t)v59, 16);
    if (v40)
    {
      v43 = v40;
      v44 = *(_QWORD *)v56;
      v45 = 1;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v56 != v44)
            objc_enumerationMutation(v38);
          v47 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v46);
          if ((v45 & 1) == 0)
            objc_msgSend_appendString_(v18, v41, (uint64_t)CFSTR(", "), v42);
          objc_msgSend_appendFormat_(v18, v41, (uint64_t)CFSTR("%@=excluded.%@"), v42, v47, v47);
          v45 = 0;
          ++v46;
        }
        while (v43 != v46);
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v55, (uint64_t)v59, 16);
        v45 = 0;
      }
      while (v43);
    }

    v9 = v53;
    v8 = v54;
    a1 = v52;
  }
  v48 = objc_alloc((Class)a1);
  v50 = (void *)objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v48, v49, (uint64_t)v10, (uint64_t)v18, 0, 0);

  return v50;
}

+ (id)statementForFetchingColumns:(id)a3 inTable:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  id v45;
  const char *v46;
  void *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB37A0], v8, (uint64_t)CFSTR("SELECT "), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v11, v12, v13))
  {
    objc_msgSend_componentsJoinedByString_(v6, v14, (uint64_t)CFSTR(","), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v10, v17, (uint64_t)v16, v18);

  }
  else
  {
    objc_msgSend_appendString_(v10, v14, (uint64_t)CFSTR("(1)"), v15);
  }
  objc_msgSend_dbTableName(v7, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v10, v23, (uint64_t)CFSTR(" FROM '%@'"), v24, v22);

  v28 = objc_msgSend_count(v6, v25, v26, v27);
  v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v32 = (void *)objc_msgSend_initWithCapacity_(v29, v30, v28, v31);
  v33 = (void *)objc_opt_class();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v34 = v6;
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v49, (uint64_t)v53, 16);
  if (v36)
  {
    v39 = v36;
    v40 = *(_QWORD *)v50;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v50 != v40)
          objc_enumerationMutation(v34);
        objc_msgSend_propertyInfo_(v33, v37, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v41), v38);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v32, v43, (uint64_t)v42, v44);

        ++v41;
      }
      while (v39 != v41);
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v49, (uint64_t)v53, 16);
    }
    while (v39);
  }

  v45 = objc_alloc((Class)a1);
  v47 = (void *)objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v45, v46, (uint64_t)v7, (uint64_t)v10, v34, v32);

  return v47;
}

+ (id)_statementForFetchingMinMax:(id)a3 forColumn:(id)a4 inTable:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  const char *v28;
  void *v29;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB37A0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend_dbTableName(v9, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v8, v16, (uint64_t)CFSTR("SELECT %@(%@) FROM '%@'"), v17, v11, v10, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_class();
  objc_msgSend_propertyInfo_(v21, v22, (uint64_t)v10, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)&v31, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc((Class)a1);
  v29 = (void *)objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v27, v28, (uint64_t)v9, (uint64_t)v18, v20, v26);

  return v29;
}

+ (id)statementForFetchingMinimumValueForColumn:(id)a3 inTable:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__statementForFetchingMinMax_forColumn_inTable_, CFSTR("MIN"), a3);
}

+ (id)statementForFetchingMaximumValueForColumn:(id)a3 inTable:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__statementForFetchingMinMax_forColumn_inTable_, CFSTR("MAX"), a3);
}

+ (id)statementForDeletingInTable:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  objc_msgSend_dbTableName(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("DELETE FROM '%@'"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc((Class)a1);
  v15 = (void *)objc_msgSend_initWithTable_sql_resultColumns_resultColumnTypes_(v13, v14, (uint64_t)v5, (uint64_t)v12, 0, 0);

  return v15;
}

- (CKSQLiteCompiledStatement)initWithDatabase:(id)a3 sql:(id)a4 resultColumns:(id)a5 resultColumnTypes:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKSQLiteCompiledStatement *v15;
  CKSQLiteCompiledStatement *v16;
  CKSQLiteCompiledStatementSetup *v17;
  CKSQLiteCompiledStatementSetup *setup;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CKSQLiteCompiledStatementSetup *v23;
  NSString *sql;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *resultColumns;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *resultColumnTypes;
  objc_super v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)CKSQLiteCompiledStatement;
  v15 = -[CKSQLiteCompiledStatement init](&v36, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_db, a3);
    v17 = objc_alloc_init(CKSQLiteCompiledStatementSetup);
    setup = v16->_setup;
    v16->_setup = v17;

    v22 = objc_msgSend_copy(v12, v19, v20, v21);
    v23 = v16->_setup;
    sql = v23->_sql;
    v23->_sql = (NSString *)v22;

    v28 = objc_msgSend_copy(v13, v25, v26, v27);
    resultColumns = v16->_resultColumns;
    v16->_resultColumns = (NSArray *)v28;

    v33 = objc_msgSend_copy(v14, v30, v31, v32);
    resultColumnTypes = v16->_resultColumnTypes;
    v16->_resultColumnTypes = (NSArray *)v33;

  }
  return v16;
}

- (CKSQLiteCompiledStatement)initWithTable:(id)a3 sql:(id)a4 resultColumns:(id)a5 resultColumnTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  CKSQLiteCompiledStatement *v19;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend_db(v10, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (CKSQLiteCompiledStatement *)objc_msgSend_initWithDatabase_sql_resultColumns_resultColumnTypes_(self, v18, (uint64_t)v17, (uint64_t)v13, v12, v11);

  if (v19)
    objc_storeWeak((id *)&v19->_table, v10);

  return v19;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKSQLiteCompiledStatement;
  -[CKSQLiteCompiledStatement dealloc](&v5, sel_dealloc);
}

- (void)setLimit:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSNumber *v8;
  CKSQLiteCompiledStatementSetup *setup;
  NSNumber *limit;
  void *v11;
  const char *v12;

  v8 = (NSNumber *)a3;
  setup = self->_setup;
  if (!setup)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCompiledStatement.m"), 300, CFSTR("Expected to have setup info"));

    setup = self->_setup;
  }
  limit = setup->_limit;
  setup->_limit = v8;

}

- (NSNumber)limit
{
  uint64_t v2;
  uint64_t v3;
  CKSQLiteCompiledStatementSetup *setup;
  void *v8;
  const char *v9;

  setup = self->_setup;
  if (!setup)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCompiledStatement.m"), 305, CFSTR("Expected to have setup info"));

    setup = self->_setup;
  }
  return setup->_limit;
}

- (void)setOffset:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSNumber *v8;
  CKSQLiteCompiledStatementSetup *setup;
  NSNumber *offset;
  void *v11;
  const char *v12;

  v8 = (NSNumber *)a3;
  setup = self->_setup;
  if (!setup)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCompiledStatement.m"), 310, CFSTR("Expected to have setup info"));

    setup = self->_setup;
  }
  offset = setup->_offset;
  setup->_offset = v8;

}

- (NSNumber)offset
{
  uint64_t v2;
  uint64_t v3;
  CKSQLiteCompiledStatementSetup *setup;
  void *v8;
  const char *v9;

  setup = self->_setup;
  if (!setup)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCompiledStatement.m"), 315, CFSTR("Expected to have setup info"));

    setup = self->_setup;
  }
  return setup->_offset;
}

- (void)invalidate
{
  sqlite3_stmt *handle;
  NSMutableArray *boundObjects;
  const char *v5;
  uint64_t v6;
  CKSQLiteDatabase *db;

  handle = self->_handle;
  if (handle)
  {
    self->_handle = 0;
    boundObjects = self->_boundObjects;
    self->_boundObjects = 0;

    objc_msgSend_finalizeHandle_(self->_db, v5, (uint64_t)handle, v6);
  }
  db = self->_db;
  self->_db = 0;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  CKSQLiteCompiledStatementSetup *setup;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@<%p> label=%@"), v7, v5, self, self->_label);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  setup = self->_setup;
  if (setup)
    objc_msgSend_appendFormat_(v8, v9, (uint64_t)CFSTR(" sql=\"%@\"), v10, setup->_sql);
  return v8;
}

- (id)fetchedColumns
{
  return self->_resultColumns;
}

- (id)propertyDecoder:(id *)a3
{
  uint64_t v3;
  CKSQLiteCompiledStatementDecoder *decoder;
  CKSQLiteCompiledStatementDecoder *v7;
  const char *v8;
  uint64_t v9;
  CKSQLiteCompiledStatementDecoder *v10;
  CKSQLiteCompiledStatementDecoder *v11;
  void *v12;
  void *v13;
  CKSQLiteCompiledStatementDecoder *v14;
  CKSQLiteCompiledStatementDecoder *v15;

  decoder = self->_decoder;
  if (!decoder)
  {
    v7 = [CKSQLiteCompiledStatementDecoder alloc];
    v10 = (CKSQLiteCompiledStatementDecoder *)objc_msgSend_initWithStatement_(v7, v8, (uint64_t)self, v9);
    v11 = self->_decoder;
    self->_decoder = v10;

    decoder = self->_decoder;
  }
  objc_msgSend_fillProperties(decoder, a2, (uint64_t)a3, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a3 && v12)
  {
    *a3 = objc_retainAutorelease(v12);
    v14 = self->_decoder;
    self->_decoder = 0;

  }
  v15 = self->_decoder;

  return v15;
}

- (void)resetAndClearBindings
{
  NSMutableArray *boundObjects;
  NSDictionary *searchValues;
  CKSQLiteCompiledStatementDecoder *decoder;
  NSPointerArray *fetchedValues;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id WeakRetained;

  sqlite3_reset(self->_handle);
  sqlite3_clear_bindings(self->_handle);
  boundObjects = self->_boundObjects;
  self->_boundObjects = 0;

  searchValues = self->_searchValues;
  self->_searchValues = 0;

  decoder = self->_decoder;
  self->_decoder = 0;

  fetchedValues = self->_fetchedValues;
  self->_fetchedValues = 0;

  if (self->_label)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_table);
    objc_msgSend_cacheStatement_(WeakRetained, v10, (uint64_t)self, v11);

  }
  else
  {
    objc_msgSend_invalidate(self, v7, v8, v9);
  }
}

- (id)setSearchPredicate:(id)a3 forProperties:(id)a4
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v15;
  const char *v16;

  v8 = a3;
  v12 = a4;
  if (!self->_setup)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCompiledStatement.m"), 374, CFSTR("Expected to have setup info"));

  }
  if (self->_handle)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v9, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("cannot add a search predicate to a compiled statement"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_storeStrong((id *)&self->_setup->_wherePredicate, a3);
    objc_storeStrong((id *)&self->_searchProperties, a4);
    v13 = 0;
  }

  return v13;
}

- (id)addBindingVariable:(id)a3 withAssociatedProperty:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *bindingTypesByVariable;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  void *v22;
  const char *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  v9 = (void *)objc_opt_class();
  objc_msgSend_propertyInfo_(v9, v10, (uint64_t)v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v18 = objc_msgSend_intValue(v12, v13, v14, v15);
    bindingTypesByVariable = self->_bindingTypesByVariable;
    if (!bindingTypesByVariable)
    {
      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v21 = self->_bindingTypesByVariable;
      self->_bindingTypesByVariable = v20;

      bindingTypesByVariable = self->_bindingTypesByVariable;
    }
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v16, v18, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(bindingTypesByVariable, v23, (uint64_t)v22, (uint64_t)v6);

    v24 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("type not found for property %@ (associated with predicate variable %@)"), v7, v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (void)setSearchValues:(id)a3
{
  objc_storeStrong((id *)&self->_searchValues, a3);
}

- (id)sqlValueForVariable:(id)a3
{
  uint64_t v3;
  __CFString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  if (self->_handle)
  {
    objc_msgSend_objectForKey_(self->_searchValues, a2, (uint64_t)a3, v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v8 = v4;
      objc_msgSend_description(v4, v5, v6, v7);
    }
    else
    {
      v8 = CFSTR("(nil)");
      objc_msgSend_description(CFSTR("(nil)"), v5, v6, v7);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("@%@"), v3, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)doSearchValueBinding
{
  uint64_t v2;
  NSDictionary *searchValues;
  NSDictionary *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_18A6BD25C;
  v13 = sub_18A6BD26C;
  v14 = 0;
  searchValues = self->_searchValues;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6BD274;
  v8[3] = &unk_1E1F5FB68;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(searchValues, a2, (uint64_t)v8, v2);
  v5 = self->_searchValues;
  self->_searchValues = 0;

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)searchBindingsDescription
{
  CKSQLiteCompiledStatementSetup *setup;
  __CFString *v4;
  const char *v5;
  id v6;

  setup = self->_setup;
  if (setup)
  {
    if (setup->_wherePredicate)
    {
      v4 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v6 = (id)objc_msgSend_cksqlcs_appendSQLToString_statement_(self->_setup->_wherePredicate, v5, (uint64_t)v4, (uint64_t)self);
    }
    else
    {
      v4 = CFSTR("()");
    }
  }
  else
  {
    v4 = CFSTR("(<search bindings not available>)");
  }
  return v4;
}

- (void)orderByProperty:(id)a3 ascending:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKSQLiteCompiledStatementSetup *setup;
  NSMutableString *orderBySQL;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKSQLiteCompiledStatementSetup *v19;
  NSMutableString *v20;
  const char *v21;
  uint64_t v22;
  NSMutableString *v23;
  void *v24;
  const char *v25;
  id v26;

  v4 = a4;
  v7 = a3;
  if (!self->_handle)
  {
    v26 = v7;
    setup = self->_setup;
    if (!setup)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCompiledStatement.m"), 469, CFSTR("Expected to have setup info"));

      setup = self->_setup;
    }
    orderBySQL = setup->_orderBySQL;
    if (orderBySQL)
    {
      objc_msgSend_appendString_(orderBySQL, v8, (uint64_t)CFSTR(","), v10);
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0CB37A0]);
      v18 = objc_msgSend_initWithString_(v15, v16, (uint64_t)CFSTR(" ORDER BY "), v17);
      v19 = self->_setup;
      v20 = v19->_orderBySQL;
      v19->_orderBySQL = (NSMutableString *)v18;

    }
    objc_msgSend_appendString_(self->_setup->_orderBySQL, v13, (uint64_t)v26, v14);
    v23 = self->_setup->_orderBySQL;
    if (v4)
      objc_msgSend_appendString_(v23, v21, (uint64_t)CFSTR(" ASC"), v22);
    else
      objc_msgSend_appendString_(v23, v21, (uint64_t)CFSTR(" DESC"), v22);
    v7 = v26;
  }

}

- (id)compile
{
  uint64_t v2;
  uint64_t v3;
  CKSQLiteCompiledStatementSetup *setup;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t orderBySQL;
  id v12;
  int v13;
  NSNumber *offset;
  uint64_t v15;
  CKSQLiteCompiledStatementSetup *v16;
  NSString *sql;
  CKSQLiteDatabase *db;
  NSString *v19;
  sqlite3_stmt *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  const char *v26;
  id v27;

  if (!self->_db)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, a2, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("statement invalidated."));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (self->_handle)
    return 0;
  setup = self->_setup;
  if (!setup)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCompiledStatement.m"), 491, CFSTR("Expected to have setup info"));

    setup = self->_setup;
  }
  if (setup->_wherePredicate || setup->_orderBySQL || setup->_limit || setup->_offset)
  {
    v7 = (void *)objc_msgSend_mutableCopy(setup->_sql, a2, v2, v3);
    v8 = v7;
    setup = self->_setup;
    if (setup->_wherePredicate)
    {
      objc_msgSend_appendString_(v7, a2, (uint64_t)CFSTR(" WHERE "), v3);
      objc_msgSend_cksqlcs_appendSQLToString_statement_(self->_setup->_wherePredicate, v9, (uint64_t)v8, (uint64_t)self);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v12 = (id)v10;
        v13 = 0;
        if (!v8)
          goto LABEL_24;
        goto LABEL_23;
      }
      setup = self->_setup;
    }
  }
  else
  {
    v8 = 0;
  }
  orderBySQL = (uint64_t)setup->_orderBySQL;
  if (orderBySQL)
  {
    objc_msgSend_appendString_(v8, a2, orderBySQL, v3);
    setup = self->_setup;
  }
  if (setup->_limit)
  {
    objc_msgSend_appendFormat_(v8, a2, (uint64_t)CFSTR(" LIMIT %@"), v3, setup->_limit);
    setup = self->_setup;
  }
  offset = setup->_offset;
  if (offset)
    objc_msgSend_appendFormat_(v8, a2, (uint64_t)CFSTR(" OFFSET %@"), v3, offset);
  v12 = 0;
  v13 = 1;
  if (!v8)
    goto LABEL_24;
LABEL_23:
  v15 = objc_msgSend_copy(v8, a2, orderBySQL, v3);
  v16 = self->_setup;
  sql = v16->_sql;
  v16->_sql = (NSString *)v15;

LABEL_24:
  if (v13)
  {
    db = self->_db;
    v19 = self->_setup->_sql;
    v27 = 0;
    v20 = (sqlite3_stmt *)objc_msgSend_compiledStatementWithSQL_error_(db, a2, (uint64_t)v19, (uint64_t)&v27);
    v12 = v27;
    self->_handle = v20;
  }

  if (v12)
    objc_msgSend_invalidate(self, v21, v22, v23);
  return v12;
}

- (id)_fillFetchedValues
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  CKSQLiteTable **p_table;
  const __CFString *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  const char *v20;
  void *v21;
  sqlite3_int64 v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  void *v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  int v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const unsigned __int8 *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  sqlite3_int64 v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  id WeakRetained;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const __CFString *v60;
  CKSQLiteTable **v61;
  void *v62;
  const char *v63;
  const void *v64;
  uint64_t v65;
  int v66;
  id v67;
  const char *v68;
  uint64_t v69;
  int v70;
  NSObject *v71;
  id v73;
  uint8_t buf[4];
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_count(self->_resultColumns, a2, v2, v3);
  if (v5 >= 1)
  {
    v6 = 0;
    p_table = &self->_table;
    v8 = CFSTR("CKErrorDomain");
    v9 = v5;
    v10 = 0x1E0CB3000uLL;
    while (1)
    {
      if (sqlite3_column_type(self->_handle, v6) == 5)
      {
        v13 = 0;
        v14 = 0;
        objc_msgSend_replacePointerAtIndex_withPointer_(self->_fetchedValues, v11, v6, 0);
        goto LABEL_25;
      }
      objc_msgSend_objectAtIndex_(self->_resultColumnTypes, v11, v6, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend_intValue(v15, v16, v17, v18);
      if (v19 > 0x53u)
      {
        if (v19 > 0x85u)
        {
          if (v19 == 134)
          {
            v64 = sqlite3_column_blob(self->_handle, v6);
            if (v64)
            {
              v65 = (uint64_t)v64;
              v66 = sqlite3_column_bytes(self->_handle, v6);
              if (v66 == 16)
              {
                v67 = objc_alloc(MEMORY[0x1E0CB3A28]);
                v13 = (void *)objc_msgSend_initWithUUIDBytes_(v67, v68, v65, v69);
LABEL_45:
                v14 = 0;
                goto LABEL_24;
              }
              v70 = v66;
              if (ck_log_initialization_predicate != -1)
                dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
              v71 = ck_log_facility_sql;
              if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                v75 = v70;
                _os_log_fault_impl(&dword_18A5C5000, v71, OS_LOG_TYPE_FAULT, "Invalid UUID length in database: %d", buf, 8u);
              }
            }
            v13 = 0;
            goto LABEL_45;
          }
          if (v19 == 135)
          {
            v33 = (void *)MEMORY[0x18D76DE4C]();
            v34 = sqlite3_column_blob(self->_handle, v6);
            if (v34)
            {
              v35 = (uint64_t)v34;
              v36 = sqlite3_column_bytes(self->_handle, v6);
              objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v37, v35, v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_unarchivedObjectFromDatabaseArchive_(CKSQLiteDatabase, v39, (uint64_t)v38, v40);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v13 = 0;
            }
            objc_autoreleasePoolPop(v33);
            goto LABEL_45;
          }
LABEL_33:
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v20, (uint64_t)v8, 1, CFSTR("Fetched unknown type %u"), v19);
          v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
          v13 = 0;
          goto LABEL_24;
        }
        if (v19 - 84 < 2)
        {
LABEL_14:
          v28 = *(void **)(v10 + 2024);
          v29 = sqlite3_column_double(self->_handle, v6);
          objc_msgSend_numberWithDouble_(v28, v30, v31, v32, v29);
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v19 != 132)
            goto LABEL_33;
          v14 = (id)sqlite3_column_blob(self->_handle, v6);
          if (!v14)
            goto LABEL_34;
          v26 = sqlite3_column_bytes(self->_handle, v6);
          objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v27, (uint64_t)v14, v26);
          v25 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (v19 - 73 >= 0xB)
        {
          switch(v19)
          {
            case 1u:
              goto LABEL_7;
            case 2u:
              goto LABEL_14;
            case 3u:
              v41 = sqlite3_column_text(self->_handle, v6);
              if (v41)
              {
                objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v42, (uint64_t)v41, v43);
                v25 = objc_claimAutoreleasedReturnValue();
                goto LABEL_22;
              }
              v13 = 0;
              break;
            case 5u:
              v44 = sqlite3_column_double(self->_handle, v6);
              objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v45, v46, v47, v44);
              v25 = objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            case 8u:
              v49 = *(void **)(v10 + 2024);
              v50 = sqlite3_column_int64(self->_handle, v6);
              objc_msgSend_numberWithLongLong_(v49, v51, v50, v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if (v53)
              {
                WeakRetained = objc_loadWeakRetained((id *)p_table);
                objc_msgSend_objectAtIndex_(self->_resultColumns, v55, v6, v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_tableForReferenceProperty_(WeakRetained, v58, (uint64_t)v57, v59);
                v60 = v8;
                v61 = p_table;
                v62 = (void *)objc_claimAutoreleasedReturnValue();

                v73 = 0;
                objc_msgSend_entryForDatabaseReferenceValue_error_(v62, v63, (uint64_t)v53, (uint64_t)&v73);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = v73;

                p_table = v61;
                v8 = v60;
                v10 = 0x1E0CB3000;
              }
              else
              {
                v13 = 0;
                v14 = 0;
              }

              goto LABEL_24;
            default:
              goto LABEL_33;
          }
          goto LABEL_23;
        }
LABEL_7:
        v21 = *(void **)(v10 + 2024);
        v22 = sqlite3_column_int64(self->_handle, v6);
        objc_msgSend_numberWithLongLong_(v21, v23, v22, v24);
        v25 = objc_claimAutoreleasedReturnValue();
      }
LABEL_22:
      v13 = (void *)v25;
LABEL_23:
      v14 = 0;
LABEL_24:

      objc_msgSend_replacePointerAtIndex_withPointer_(self->_fetchedValues, v48, v6, (uint64_t)v13);
LABEL_25:

      if (++v6 >= v9 || v14)
        return v14;
    }
  }
  v14 = 0;
  return v14;
}

- (BOOL)step:(id *)a3
{
  uint64_t v3;
  NSPointerArray *v6;
  NSPointerArray *fetchedValues;
  NSPointerArray *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  sqlite3_stmt *handle;
  char v17;
  BOOL v18;
  id WeakRetained;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  CKSQLiteCompiledStatementSetup *setup;

  if (!self->_fetchedValues)
  {
    objc_msgSend_strongObjectsPointerArray(MEMORY[0x1E0CB3868], a2, (uint64_t)a3, v3);
    v6 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    fetchedValues = self->_fetchedValues;
    self->_fetchedValues = v6;

    v8 = self->_fetchedValues;
    v12 = objc_msgSend_count(self->_resultColumns, v9, v10, v11);
    objc_msgSend_setCount_(v8, v13, v12, v14);
  }
  if (self->_handle
    || (objc_msgSend_compile(self, a2, (uint64_t)a3, v3), (v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!self->_searchValues
      || (objc_msgSend_doSearchValueBinding(self, a2, (uint64_t)a3, v3),
          (v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      handle = self->_handle;
      if (!handle)
      {
        v18 = 0;
        goto LABEL_13;
      }
      v17 = sqlite3_step(handle);
      v18 = v17 == 100;
      if ((v17 & 0xFE) == 0x64
        || (objc_msgSend_sqlErrorWithMessage_(self->_db, a2, (uint64_t)CFSTR("sqlite3_step() failed"), v3),
            (v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_13:
        objc_msgSend__fillFetchedValues(self, a2, (uint64_t)a3, v3);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_17;
      }
    }
  }
  if (a3)
  {
    v15 = objc_retainAutorelease(v15);
    v18 = 0;
    *a3 = v15;
  }
  else
  {
    v18 = 0;
  }
LABEL_17:
  WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  v23 = objc_msgSend_logOperations(WeakRetained, v20, v21, v22);

  if ((v23 & 1) == 0)
  {
    setup = self->_setup;
    self->_setup = 0;

  }
  return v18;
}

- (id)boundObjects
{
  NSMutableArray *boundObjects;
  NSMutableArray *v4;
  NSMutableArray *v5;

  boundObjects = self->_boundObjects;
  if (!boundObjects)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_boundObjects;
    self->_boundObjects = v4;

    boundObjects = self->_boundObjects;
  }
  return boundObjects;
}

- (id)bindValue:(id)a3 ofType:(unsigned int)a4 atIndex:(int)a5
{
  uint64_t v5;
  unsigned __int8 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v11 = a3;
  if (!self->_handle)
  {
    objc_msgSend_compile(self, v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_24;
  }
  if (v11)
  {
    if (v6 <= 0x53u)
    {
      if (v6 - 73 >= 0xB)
      {
        switch(v6)
        {
          case 1u:
          case 8u:
            goto LABEL_5;
          case 2u:
          case 5u:
            goto LABEL_15;
          case 3u:
            objc_msgSend_boundObjects(self, v8, v9, v10);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v24, v25, (uint64_t)v11, v26);

            objc_msgSend_cksqlcs_bindText_index_db_(v11, v27, (uint64_t)self->_handle, v5, self->_db);
            v12 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            goto LABEL_23;
        }
      }
      else
      {
LABEL_5:
        objc_msgSend_cksqlcs_bindInt64_index_db_(v11, v8, (uint64_t)self->_handle, v5, self->_db);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_24;
    }
    if (v6 > 0x85u)
    {
      if (v6 != 134)
      {
        if (v6 != 135)
        {
LABEL_23:
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v8, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Attempted to bind using unknown type %u"), v6);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
        v16 = (void *)MEMORY[0x18D76DE4C]();
        objc_msgSend_databaseArchiveWithObject_(CKSQLiteDatabase, v17, (uint64_t)v11, v18);
        v19 = objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v16);
        v11 = (id)v19;
      }
    }
    else
    {
      if (v6 - 84 < 2)
      {
LABEL_15:
        objc_msgSend_cksqlcs_bindDouble_index_db_(v11, v8, (uint64_t)self->_handle, v5, self->_db);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_24:
        v15 = (void *)v12;
        goto LABEL_25;
      }
      if (v6 != 132)
        goto LABEL_23;
    }
    objc_msgSend_boundObjects(self, v8, v9, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v20, v21, (uint64_t)v11, v22);

    objc_msgSend_cksqlcs_bindBlob_index_db_(v11, v23, (uint64_t)self->_handle, v5, self->_db);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (sqlite3_bind_null(self->_handle, v5))
  {
    objc_msgSend_sqlErrorWithMessage_(self->_db, v13, (uint64_t)CFSTR("Failed to bind NULL value"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v11 = 0;
LABEL_25:

  return v15;
}

- (id)bindValueColumn:(id)a3 type:(unsigned int)a4 value:(id)a5
{
  uint64_t v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id WeakRetained;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v29[2];

  v6 = *(_QWORD *)&a4;
  v29[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v12 = a5;
  if (!self->_handle)
  {
    objc_msgSend_compile(self, v9, v10, v11);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v25 = (id)v27;
      goto LABEL_11;
    }
  }
  v13 = objc_msgSend_length(v8, v9, v10, v11);
  v14 = (char *)v29 - ((v13 + 17) & 0xFFFFFFFFFFFFFFF0);
  *v14 = 58;
  objc_msgSend_getCString_maxLength_encoding_(v8, v15, (uint64_t)(v14 + 1), v13 + 1, 1);
  v16 = sqlite3_bind_parameter_index(self->_handle, v14);
  if (!(_DWORD)v16)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v17, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("No binding index for %@"), v8);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v18 = v16;
  if (v6 != 8)
    goto LABEL_6;
  if (!v12)
    goto LABEL_6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  objc_msgSend_tableForReferenceProperty_(WeakRetained, v20, (uint64_t)v8, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = 0;
  objc_msgSend_databaseReferenceValueForEntry_error_(v22, v23, (uint64_t)v12, (uint64_t)v29);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v29[0];

  v12 = (id)v24;
  if (!v25)
  {
LABEL_6:
    objc_msgSend_bindValue_ofType_atIndex_(self, v17, (uint64_t)v12, v6, v18);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v25 = (id)v26;
  }
LABEL_11:

  return v25;
}

- (void)enumerateResultColumnsWithBlock:(id)a3
{
  id v4;
  NSArray *resultColumns;
  const char *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  resultColumns = self->_resultColumns;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A6BE248;
  v9[3] = &unk_1E1F5FB90;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(resultColumns, v6, (uint64_t)v9, v7);

}

- (id)cksqlcs_appendSQLConstantValueToString:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v13;
  const char *v14;

  v8 = a3;
  if (self->_searchValues)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteCompiledStatement.m"), 760, CFSTR("Cannot generate constant SQL for a statement with value bindings"));

  }
  v9 = (id)objc_msgSend_compile(self, v5, v6, v7);
  objc_msgSend_appendFormat_(v8, v10, (uint64_t)CFSTR("(%@)"), v11, self->_setup->_sql);

  return 0;
}

- (CKSQLiteTable)table
{
  return (CKSQLiteTable *)objc_loadWeakRetained((id *)&self->_table);
}

- (id)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong(&self->_label, a3);
}

- (NSArray)searchProperties
{
  return self->_searchProperties;
}

- (void)setSearchProperties:(id)a3
{
  objc_storeStrong((id *)&self->_searchProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProperties, 0);
  objc_storeStrong(&self->_label, 0);
  objc_destroyWeak((id *)&self->_table);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_boundObjects, 0);
  objc_storeStrong((id *)&self->_searchValues, 0);
  objc_storeStrong((id *)&self->_bindingTypesByVariable, 0);
  objc_storeStrong((id *)&self->_fetchedValues, 0);
  objc_storeStrong((id *)&self->_resultColumnTypes, 0);
  objc_storeStrong((id *)&self->_resultColumns, 0);
  objc_storeStrong((id *)&self->_setup, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
