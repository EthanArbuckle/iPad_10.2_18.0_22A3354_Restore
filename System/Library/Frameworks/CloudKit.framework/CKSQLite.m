@implementation CKSQLite

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_18A719CCC;
  v41 = sub_18A719CDC;
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_18A5D5664;
  v30[3] = &unk_1E1F62C38;
  v20 = v14;
  v31 = v20;
  v21 = v15;
  v32 = v21;
  v22 = v16;
  v33 = v22;
  v23 = v17;
  v34 = v23;
  v24 = v18;
  v35 = v24;
  v36 = &v37;
  v27 = (id)objc_msgSend_performDatabaseOperation_(self, v25, (uint64_t)v30, v26);
  v28 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  return v28;
}

- (id)performDatabaseOperation:(id)a3
{
  return (id)objc_msgSend_performDatabaseOperation_withErrorHandler_(self, a2, (uint64_t)a3, 0);
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9
{
  objc_msgSend_select_from_where_bindings_orderBy_limit_offset_block_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, 0, a9);
}

- (id)performDatabaseOperation:(id)a3 withErrorHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *(*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v7 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_18A719CCC;
  v37 = sub_18A719CDC;
  v38 = 0;
  if (v7)
    v11 = v7;
  else
    v11 = &unk_1E1F58538;
  if ((objc_msgSend_invalid(self, v8, v9, v10) & 1) != 0)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v14, (uint64_t)CFSTR("CKInternalErrorDomain"), 1027, CFSTR("Database operation attempted with invalid %@ instance"), v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v34[5];
    v34[5] = v15;

  }
  else
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_18A719CEC;
    v31 = sub_18A719D14;
    v32 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_18A719D1C;
    v22[3] = &unk_1E1F629C0;
    v22[4] = self;
    v25 = &v33;
    v23 = v6;
    v24 = v11;
    v26 = &v27;
    objc_msgSend__recursiveOperationLock_(self, v17, (uint64_t)v22, v18);
    v19 = v28[5];
    if (v19)
      (*(void (**)(uint64_t, CKSQLite *, NSError *))(v19 + 16))(v19, self, self->_invalidationError);

    _Block_object_dispose(&v27, 8);
  }
  v20 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (void)_recursiveOperationLock:(id)a3
{
  pthread_t v4;
  unint64_t v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  v4 = pthread_self();
  if ((pthread_t)self->_operationThread == v4)
  {
    v6[2](v6, 0);
  }
  else
  {
    v5 = (unint64_t)v4;
    os_unfair_lock_lock(&self->_operationLock);
    self->_operationThread = v5;
    v6[2](v6, 1);
    self->_operationThread = 0;
    os_unfair_lock_unlock(&self->_operationLock);
  }

}

- (id)_performDatabaseOperation_locked:(id)a3 withErrorHandler:(id)a4
{
  void (**v7)(id, CKSQLite *, _QWORD *);
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id errorHandlerBlock;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSError *v22;
  NSError *error;
  NSError *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  sqlite3 *db;
  const char *v29;
  void *v31;
  const char *v32;
  _QWORD v33[5];

  v7 = (void (**)(id, CKSQLite *, _QWORD *))a3;
  v8 = a4;
  objc_msgSend_assertInOperation_(self, v9, (uint64_t)a2, v10);
  if (objc_msgSend_invalid(self, v11, v12, v13))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15, v16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLite.m"), 202, CFSTR("expected a valid instance"));

  }
  v17 = _Block_copy(v8);
  errorHandlerBlock = self->_errorHandlerBlock;
  self->_errorHandlerBlock = v17;

  v19 = (void *)MEMORY[0x18D76DE4C]();
  if (sqlite3_exec(self->_db, "begin exclusive", 0, 0, 0))
  {
    objc_msgSend_sqlErrorWithMessage_(self, v20, (uint64_t)CFSTR("Failed to start transaction"), v21);
    v22 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v22;

    self->_cancelled = 1;
    v24 = self->_error;
  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_18A5F1FFC;
    v33[3] = &unk_1E1F62978;
    v33[4] = self;
    v7[2](v7, self, v33);
    v24 = self->_error;
    if (self->_cancelled || objc_msgSend_invalid(self, v25, v26, v27))
    {
      db = self->_db;
      v29 = "rollback";
    }
    else
    {
      db = self->_db;
      v29 = "end";
    }
    sqlite3_exec(db, v29, 0, 0, 0);
  }
  objc_autoreleasePoolPop(v19);

  return v24;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 offset:(id)a9 block:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  __CFString *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  id v50;
  id v51;
  const char *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;

  v17 = a3;
  v54 = a4;
  v18 = a5;
  v53 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  objc_msgSend_assertInOperation_(self, v23, (uint64_t)a2, v24);
  v25 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend_count(v17, v26, v27, v28))
  {
    objc_msgSend_componentsJoinedByString_(v17, v29, (uint64_t)CFSTR(", "), v30);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = CFSTR("*");
  }
  objc_msgSend_appendFormat_(v25, v29, (uint64_t)CFSTR("select %@ from %@"), v30, v31, v54);
  if (objc_msgSend_length(v18, v32, v33, v34))
    objc_msgSend_appendFormat_(v25, v35, (uint64_t)CFSTR(" where %@"), v37, v18);
  if (v19)
  {
    objc_msgSend_componentsJoinedByString_(v19, v35, (uint64_t)CFSTR(", "), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v25, v39, (uint64_t)CFSTR(" order by %@"), v40, v38);

  }
  if (v20)
  {
    v41 = objc_msgSend_longValue(v20, v35, v36, v37);
    objc_msgSend_appendFormat_(v25, v42, (uint64_t)CFSTR(" limit %ld"), v43, v41);
    if (v21)
    {
      v47 = objc_msgSend_longValue(v21, v44, v45, v46);
      objc_msgSend_appendFormat_(v25, v48, (uint64_t)CFSTR(" offset %ld"), v49, v47);
    }
  }
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = sub_18A5D5FBC;
  v55[3] = &unk_1E1F62BE8;
  v56 = v53;
  v57 = v22;
  v50 = v22;
  v51 = v53;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v52, (uint64_t)v25, (uint64_t)v55);

}

- (void)usingStatementForSQL:(id)a3 performBlock:(id)a4
{
  id v7;
  void (**v8)(id, id *);
  const char *v9;
  uint64_t v10;
  id v11;
  sqlite3 *db;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  id *v23;
  CKSQLiteStatement *v24;
  sqlite3_stmt *ppStmt;

  v7 = a3;
  v8 = (void (**)(id, id *))a4;
  objc_msgSend_assertInOperation_(self, v9, (uint64_t)a2, v10);
  ppStmt = 0;
  v11 = v7;
  db = self->_db;
  v16 = (const char *)objc_msgSend_UTF8String(v11, v13, v14, v15);
  if (sqlite3_prepare_v2(db, v16, -1, &ppStmt, 0))
  {
    objc_msgSend_sqlErrorWithMessage_(self, v17, (uint64_t)CFSTR("Error preparing statement: %@"), v18, v11, ppStmt);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend_handleError_(self, v20, (uint64_t)v19, v21);

    v23 = 0;
  }
  else
  {
    v24 = [CKSQLiteStatement alloc];
    v23 = sub_18A5D6168((id *)&v24->super.isa, self, v11, ppStmt);
  }
  v8[2](v8, v23);

  sub_18A5D620C((uint64_t)v23);
}

- (void)assertInOperation:(SEL)a3
{
  _opaque_pthread_t *operationThread;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  id v13;

  os_unfair_lock_assert_owner(&self->_operationLock);
  operationThread = (_opaque_pthread_t *)self->_operationThread;
  if (!operationThread)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99750];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v6, v9, v7, (uint64_t)CFSTR("%@ called but not in a database operation context"), v8);

  }
  if (operationThread != pthread_self())
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99750];
    NSStringFromSelector(a2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v10, v12, v11, (uint64_t)CFSTR("%@ called but some other thread is running a database operation"), v13);

  }
}

- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  int64_t v63;
  _QWORD v65[4];
  id v66;
  CKSQLite *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;

  v7 = a3;
  v8 = a4;
  objc_msgSend_assertInOperation_(self, v9, (uint64_t)a2, v10);
  objc_msgSend_allKeys(v8, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingSelector_(v14, v15, (uint64_t)sel_compare_, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend_count(v17, v19, v20, v21))
  {
    v24 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v17, v22, v24, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v8, v26, (uint64_t)v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_atIndexedSubscript_(v18, v29, (uint64_t)v28, v24);

      ++v24;
    }
    while (v24 < objc_msgSend_count(v17, v30, v31, v32));
  }
  v33 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v36 = (void *)objc_msgSend_initWithString_(v33, v34, (uint64_t)CFSTR("insert or replace into "), v35);
  objc_msgSend_appendString_(v36, v37, (uint64_t)v7, v38);
  objc_msgSend_appendString_(v36, v39, (uint64_t)CFSTR(" ("), v40);
  v44 = objc_msgSend_count(v17, v41, v42, v43);
  if (v44)
  {
    v47 = v44;
    for (i = 0; i != v47; ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v17, v45, i, v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v36, v50, (uint64_t)v49, v51);

      if (i != objc_msgSend_count(v17, v52, v53, v54) - 1)
        objc_msgSend_appendString_(v36, v45, (uint64_t)CFSTR(","), v46);
    }
    objc_msgSend_appendString_(v36, v45, (uint64_t)CFSTR(") values ("), v46);
    for (j = 0; j != v47; ++j)
    {
      if (j == objc_msgSend_count(v17, v55, v56, v57) - 1)
        objc_msgSend_appendString_(v36, v59, (uint64_t)CFSTR("?"), v60);
      else
        objc_msgSend_appendString_(v36, v59, (uint64_t)CFSTR("?,"), v60);
    }
  }
  else
  {
    objc_msgSend_appendString_(v36, v45, (uint64_t)CFSTR(") values ("), v46);
  }
  objc_msgSend_appendString_(v36, v55, (uint64_t)CFSTR(")"), v57);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = sub_18A5F2F34;
  v65[3] = &unk_1E1F62C60;
  v61 = v18;
  v67 = self;
  v68 = &v69;
  v66 = v61;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v62, (uint64_t)v36, (uint64_t)v65);
  v63 = v70[3];

  _Block_object_dispose(&v69, 8);
  return v63;
}

+ (id)equalityClauseAndBindingsForDict:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  CKTuple2 *v26;
  const char *v27;
  void *v28;
  CKTuple2 *v29;
  const char *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v3;
    v9 = v3;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v33, (uint64_t)v37, 16);
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v9);
          v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v9, v12, v17, v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v8, v19, v20, v21))
            objc_msgSend_appendFormat_(v7, v22, (uint64_t)CFSTR(" AND %@ = ?"), v23, v17);
          else
            objc_msgSend_appendFormat_(v7, v22, (uint64_t)CFSTR("%@ = ?"), v23, v17);
          objc_msgSend_addObject_(v8, v24, (uint64_t)v18, v25);

        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v33, (uint64_t)v37, 16);
      }
      while (v14);
    }

    v26 = [CKTuple2 alloc];
    v28 = (void *)objc_msgSend_initWithObject1_object2_(v26, v27, (uint64_t)v7, (uint64_t)v8);

    v3 = v32;
  }
  else
  {
    v29 = [CKTuple2 alloc];
    v28 = (void *)objc_msgSend_initWithObject1_object2_(v29, v30, (uint64_t)&stru_1E1F66ED0, MEMORY[0x1E0C9AA60]);
  }

  return v28;
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_select_from_where_bindings_orderBy_limit_, a3, a4);
}

- (int64_t)lastInsertRowID
{
  int64_t result;

  result = (int64_t)self->_db;
  if (result)
    return sqlite3_last_insert_rowid((sqlite3 *)result);
  return result;
}

- (CKSQLite)initWithPath:(id)a3 schema:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKSQLite *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *path;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  CC_LONG v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString *schemaVersion;
  NSString *objectClassPrefix;
  void *v42;
  const char *v43;
  objc_super v44;
  unsigned __int8 md[16];
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)CKSQLite;
  v12 = -[CKSQLite init](&v44, sel_init);
  if (v12)
  {
    if (!objc_msgSend_length(v7, v9, v10, v11))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, (uint64_t)v12, CFSTR("CKSQLite.m"), 97, CFSTR("Can't init a database with a zero-length path"));

    }
    v12->_operationLock._os_unfair_lock_opaque = 0;
    v16 = objc_msgSend_copy(v7, v13, v14, v15);
    path = v12->_path;
    v12->_path = (NSString *)v16;

    objc_storeStrong((id *)&v12->_schema, a4);
    *(_OWORD *)md = 0u;
    v46 = 0u;
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v18, (uint64_t)md, 32, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_schema(v12, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataUsingEncoding_(v23, v24, 4, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (const void *)objc_msgSend_bytes(v26, v27, v28, v29);
    v34 = objc_msgSend_length(v26, v31, v32, v33);
    CC_SHA256(v30, v34, md);
    objc_msgSend_CKUppercaseHexStringWithoutSpaces(v19, v35, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    schemaVersion = v12->_schemaVersion;
    v12->_schemaVersion = (NSString *)v38;

    objectClassPrefix = v12->_objectClassPrefix;
    v12->_objectClassPrefix = (NSString *)CFSTR("CK");

    v12->_synchronousMode = 1;
    *(_WORD *)&v12->_hasMigrated = 256;

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = (void *)MEMORY[0x18D76DE4C](self, a2);
  objc_msgSend__forceClosed_unlocked(self, v4, v5, v6);
  objc_autoreleasePoolPop(v3);
  v7.receiver = self;
  v7.super_class = (Class)CKSQLite;
  -[CKSQLite dealloc](&v7, sel_dealloc);
}

- (id)sqlErrorWithMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  v8 = objc_msgSend_db(self, v5, v6, v7);
  objc_msgSend_errorForSQLite_message_args_(CKPrettyError, v9, v8, (uint64_t)v4, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int)userVersion
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  objc_msgSend_delegate(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return self->_userVersion;
  objc_msgSend_delegate(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_userVersion(v9, v10, v11, v12);

  return v13;
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (void)vacuum
{
  uint64_t v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A7198C8;
  v3[3] = &unk_1E1F62950;
  v3[4] = self;
  objc_msgSend__recursiveOperationLock_(self, a2, (uint64_t)v3, v2);
}

- (void)markCorrupt
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *path;
  NSObject *v14;
  int *v15;
  char *v16;
  int v17;
  NSString *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInOperation_(self, a2, (uint64_t)a2, v2);
  v4 = self->_path;
  v8 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  if (setxattr(v8, "CKSQLiteDatabaseInvalid", "1", 1uLL, 0, 0))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      path = self->_path;
      v14 = v9;
      v15 = __error();
      v16 = strerror(*v15);
      v17 = 138412546;
      v18 = path;
      v19 = 2080;
      v20 = v16;
      _os_log_fault_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_FAULT, "setxattr failed at path: %@. Removing database instead. error = %s", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend_remove(self, v10, v11, v12);
  }

}

- (BOOL)isCorrupt
{
  NSString *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  ssize_t v8;
  BOOL v9;
  void *v10;
  NSString *path;
  NSObject *v13;
  int *v14;
  char *v15;
  int v16;
  NSString *v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = self->_path;
  v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  v8 = getxattr(v7, "CKSQLiteDatabaseInvalid", 0, 0, 0, 0);
  if (!v8)
    goto LABEL_5;
  if (v8 != -1)
  {
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  if (*__error() != 2 && *__error() != 93)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v10 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      path = self->_path;
      v13 = v10;
      v14 = __error();
      v15 = strerror(*v14);
      v16 = 138412546;
      v17 = path;
      v18 = 2080;
      v19 = v15;
      _os_log_fault_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_FAULT, "getxattr failed at path: %@. error = %s", (uint8_t *)&v16, 0x16u);

    }
    goto LABEL_10;
  }
LABEL_5:
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)handleError:(id)a3
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t (**errorHandlerBlock)(id, id);
  uint64_t v20;
  uint64_t v21;
  NSError *error;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  objc_msgSend_assertInOperation_(self, v7, (uint64_t)a2, v8);
  if (objc_msgSend_invalid(self, v9, v10, v11))
  {
    v14 = v6;
    goto LABEL_18;
  }
  v18 = objc_msgSend_CKIsCorruptDatabaseError_(MEMORY[0x1E0CB35C8], v12, (uint64_t)v6, v13);
  errorHandlerBlock = (uint64_t (**)(id, id))self->_errorHandlerBlock;
  if (!errorHandlerBlock)
  {
    if (v18)
    {
      objc_msgSend__forceClosed_unlocked(self, v15, v16, v17);
      objc_msgSend_remove(self, v25, v26, v27);
    }
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v15, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("%@"), v6);
    goto LABEL_17;
  }
  v20 = errorHandlerBlock[2](errorHandlerBlock, v6);
  if ((v18 & (v20 < 3)) != 0)
    v21 = 3;
  else
    v21 = v20;
  if (v21 < 1)
  {
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  error = self->_error;
  self->_cancelled = 1;
  if (!error)
    objc_storeStrong((id *)&self->_error, a3);
  v14 = v6;
  if ((unint64_t)v21 >= 2)
  {
    objc_msgSend_setInvalid_(self, v23, 1, v24);
    objc_storeStrong((id *)&self->_invalidationError, a3);
    if (v21 != 2)
    {
      self->_needsMarkCorrupt = 1;
      if ((unint64_t)v21 >= 4)
        self->_needsRemove = 1;
    }
  }
LABEL_18:

  return v14;
}

- (id)handleDatabaseError:(id)a3 args:(char *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v10 = objc_msgSend_db(self, v7, v8, v9);
  objc_msgSend_errorForSQLite_message_args_(CKPrettyError, v11, v10, (uint64_t)v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_handleError_(self, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)handleDatabaseError:(id)a3
{
  uint64_t v4;

  objc_msgSend_handleDatabaseError_args_(self, a2, (uint64_t)a3, (uint64_t)&v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_prepareDatabase
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A71A120;
  v3[3] = &unk_1E1F629E8;
  v3[4] = self;
  objc_msgSend__performDatabaseOperation_locked_withErrorHandler_(self, a2, (uint64_t)v3, (uint64_t)&unk_1E1F59958);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)openWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  BOOL v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_18A719CCC;
  v13 = sub_18A719CDC;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A71A8FC;
  v8[3] = &unk_1E1F62A10;
  v8[5] = &v9;
  v8[6] = a2;
  v8[4] = self;
  objc_msgSend__recursiveOperationLock_(self, a2, (uint64_t)v8, v3);
  v5 = (void *)v10[5];
  if (a3 && v5)
  {
    *a3 = objc_retainAutorelease(v5);
    v5 = (void *)v10[5];
  }
  v6 = v5 == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_forceClosed_locked
{
  sqlite3 *db;
  const char *v4;
  uint64_t v5;
  CKSQLite *v6;
  NSObject *v7;
  void *v8;
  NSString *path;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  CKSQLite *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_operationLock);
  db = self->_db;
  if (db)
  {
    if (sqlite3_close(db))
    {
      objc_msgSend_sqlErrorWithMessage_(self, v4, (uint64_t)CFSTR("sqlite3_close() failed"), v5);
      v6 = (CKSQLite *)objc_claimAutoreleasedReturnValue();
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v7 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_error_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_ERROR, "Error closing database: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    self->_db = 0;
    self->_openCount = 0;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v8 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
    {
      path = self->_path;
      v10 = v8;
      objc_msgSend_CKSanitizedPath(path, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218242;
      v16 = self;
      v17 = 2112;
      v18 = v14;
      _os_log_debug_impl(&dword_18A5C5000, v10, OS_LOG_TYPE_DEBUG, "Closed db (%p) at %@", (uint8_t *)&v15, 0x16u);

    }
  }
}

- (void)_forceClosed_unlocked
{
  os_unfair_lock_s *p_operationLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  objc_msgSend__forceClosed_locked(self, v4, v5, v6);
  os_unfair_lock_unlock(p_operationLock);
}

- (void)close
{
  os_unfair_lock_s *p_operationLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t openCount;
  unint64_t v8;

  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  openCount = self->_openCount;
  if (openCount)
  {
    v8 = openCount - 1;
    if (v8)
      self->_openCount = v8;
    else
      objc_msgSend__forceClosed_locked(self, v4, v5, v6);
  }
  os_unfair_lock_unlock(p_operationLock);
}

- (BOOL)remove
{
  uint64_t v2;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A71B2F8;
  v5[3] = &unk_1E1F62A38;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend__recursiveOperationLock_(self, a2, (uint64_t)v5, v2);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTraced:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_operationLock;
  sqlite3 *db;
  int (__cdecl *v7)(unsigned int, void *, void *, void *);
  unsigned int v8;

  v3 = a3;
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  db = self->_db;
  if (db)
  {
    if (v3)
    {
      v7 = (int (__cdecl *)(unsigned int, void *, void *, void *))sub_18A71B568;
      v8 = 9;
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
    sqlite3_trace_v2(db, v8, v7, self);
  }
  self->_traced = v3;
  os_unfair_lock_unlock(p_operationLock);
}

- (int)changes
{
  uint64_t v2;
  sqlite3 *db;

  objc_msgSend_assertInOperation_(self, a2, (uint64_t)a2, v2);
  db = self->_db;
  if (db)
    LODWORD(db) = sqlite3_changes(db);
  return (int)db;
}

- (void)executeSQL:(id)a3
{
  uint64_t v3;

  objc_msgSend_executeSQL_arguments_(self, a2, (uint64_t)a3, (uint64_t)&v3);
}

- (void)executeSQL:(id)a3 arguments:(char *)a4
{
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  sqlite3 *db;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  id v27;

  v27 = a3;
  objc_msgSend_assertInOperation_(self, v7, (uint64_t)a2, v8);
  if ((objc_msgSend_invalid(self, v9, v10, v11) & 1) == 0)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = (void *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v27, (uint64_t)a4);
    db = self->_db;
    v19 = (const char *)objc_msgSend_UTF8String(v14, v16, v17, v18);
    v20 = sqlite3_exec(db, v19, 0, 0, 0);
    if ((_DWORD)v20)
    {
      objc_msgSend_sqlErrorWithMessage_(self, v21, (uint64_t)CFSTR("Error executing SQL: \"%@\" (%d)"), v22, v14, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (id)objc_msgSend_handleError_(self, v24, (uint64_t)v23, v25);

    }
  }

}

- (id)allTableNames
{
  const char *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_18A719CCC;
  v13 = sub_18A719CDC;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[4] = &v9;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A71B91C;
  v8[3] = &unk_1E1F62A88;
  v8[4] = &v9;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A71BA2C;
  v7[3] = &unk_1E1F62AB0;
  v4 = (id)objc_msgSend_performDatabaseOperation_withErrorHandler_(self, v3, (uint64_t)v8, (uint64_t)v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (void)_dropAllTables
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A71BAB4;
  v3[3] = &unk_1E1F629E8;
  v3[4] = self;
  v2 = (id)objc_msgSend_performDatabaseOperation_withErrorHandler_(self, a2, (uint64_t)v3, (uint64_t)&unk_1E1F62AD0);
}

- (id)propertyForKey:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLite.m"), 664, CFSTR("Null key"));

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_18A719CCC;
  v24 = sub_18A719CDC;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A71BD10;
  v17[3] = &unk_1E1F62B20;
  v9 = v8;
  v18 = v9;
  v19 = &v20;
  v12 = (id)objc_msgSend_performDatabaseOperation_(self, v10, (uint64_t)v17, v11);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v12 = v8;
  if (v8)
  {
    if (v7)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_18A71BF04;
      v18[3] = &unk_1E1F62B70;
      v19 = v8;
      v20 = v7;
      v15 = (id)objc_msgSend_performDatabaseOperation_(self, v13, (uint64_t)v18, v14);

    }
    else
    {
      objc_msgSend_removePropertyForKey_(self, v9, (uint64_t)v8, v11);
    }
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLite.m"), 678, CFSTR("Null key"));

  }
}

- (id)datePropertyForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_propertyForKey_(self, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend_setDateFormat_(v8, v9, (uint64_t)CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"), v10);
    objc_msgSend_dateFromString_(v8, v11, (uint64_t)v4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  const char *v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  if (a3)
  {
    v7 = a3;
    v8 = (void *)objc_opt_new();
    objc_msgSend_setDateFormat_(v8, v9, (uint64_t)CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"), v10);
    objc_msgSend_stringFromDate_(v8, v11, (uint64_t)v7, v12);
    a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_setProperty_forKey_(self, v6, (uint64_t)a3, (uint64_t)v13);

}

- (void)removePropertyForKey:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v9 = v5;
  if (v5)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_18A71C1C8;
    v15[3] = &unk_1E1F629E8;
    v16 = v5;
    v12 = (id)objc_msgSend_performDatabaseOperation_(self, v10, (uint64_t)v15, v11);

  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLite.m"), 720, CFSTR("Null key"));

  }
}

- (id)creationDate
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_propertyForKey_(self, a2, (uint64_t)CFSTR("Created"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend_floatValue(v3, v4, v5, v6);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v8, v10, v11, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)columnNamesForTable:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  CKSQLite *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A71C478;
  v14[3] = &unk_1E1F62BC0;
  v6 = v4;
  v15 = v6;
  v16 = self;
  v7 = v5;
  v17 = v7;
  objc_msgSend_performDatabaseOperation_(self, v8, (uint64_t)v14, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v11 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_18A5C5000, v11, OS_LOG_TYPE_ERROR, "Error fetching column names for table %{public}@: %{public}@", buf, 0x16u);
    }

    v7 = 0;
  }
  v12 = v7;

  return v12;
}

- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
  objc_msgSend_select_from_where_bindings_orderBy_limit_offset_block_(self, a2, 0, (uint64_t)a3, a4, a5, a6, a7, 0, a8);
}

- (id)select:(id)a3 from:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_select_from_where_bindings_orderBy_limit_, a3, a4);
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_select_from_where_bindings_orderBy_limit_, a3, a4);
}

- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_select_from_where_bindings_orderBy_limit_, 0, a3);
}

- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_selectFrom_where_bindings_limit_, a3, a4);
}

- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  void *v40;
  const char *v41;
  _QWORD v42[4];
  id v43;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a3;
  objc_msgSend_assertInOperation_(self, v18, (uint64_t)a2, v19);
  v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendFormat_(v20, v21, (uint64_t)CFSTR("update %@"), v22, v17);

  if (!objc_msgSend_length(v13, v23, v24, v25))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27, v28);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLite.m"), 862, CFSTR("null set expression"));

  }
  objc_msgSend_appendFormat_(v20, v26, (uint64_t)CFSTR(" set %@"), v28, v13);
  if (objc_msgSend_length(v14, v29, v30, v31))
    objc_msgSend_appendFormat_(v20, v32, (uint64_t)CFSTR(" where %@"), v34, v14);
  if (v16)
  {
    v35 = objc_msgSend_integerValue(v16, v32, v33, v34);
    objc_msgSend_appendFormat_(v20, v36, (uint64_t)CFSTR(" limit %ld"), v37, v35);
  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_18A71C7EC;
  v42[3] = &unk_1E1F62B98;
  v43 = v15;
  v38 = v15;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v39, (uint64_t)v20, (uint64_t)v42);

}

- (int64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;

  objc_msgSend_select_from_where_bindings_(self, a2, (uint64_t)&unk_1E1FC41D8, (uint64_t)a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v6, 0, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("n"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);

  }
  else
  {
    v16 = -1;
  }

  return v16;
}

- (int64_t)upsertInto:(id)a3 values:(id)a4 onConflict:(id)a5 doUpdate:(id)a6 where:(id)a7
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  unint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  const char *v100;
  int64_t v101;
  id v103;
  void *v104;
  id v105;
  _QWORD v106[4];
  id v107;
  CKSQLite *v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;

  v13 = a3;
  v14 = a4;
  v105 = a5;
  v15 = a6;
  v103 = a7;
  objc_msgSend_assertInOperation_(self, v16, (uint64_t)a2, v17);
  objc_msgSend_allKeys(v14, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingSelector_(v21, v22, (uint64_t)sel_compare_, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend_count(v24, v26, v27, v28))
  {
    v31 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v24, v29, v31, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v14, v33, (uint64_t)v32, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_atIndexedSubscript_(v25, v36, (uint64_t)v35, v31);

      ++v31;
    }
    while (v31 < objc_msgSend_count(v24, v37, v38, v39));
  }
  v40 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v43 = (void *)objc_msgSend_initWithString_(v40, v41, (uint64_t)CFSTR("insert into "), v42);
  objc_msgSend_appendString_(v43, v44, (uint64_t)v13, v45);
  objc_msgSend_appendString_(v43, v46, (uint64_t)CFSTR(" ("), v47);
  if (objc_msgSend_count(v24, v48, v49, v50))
  {
    v53 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v24, v51, v53, v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v43, v55, (uint64_t)v54, v56);

      if (v53 != objc_msgSend_count(v24, v57, v58, v59) - 1)
        objc_msgSend_appendString_(v43, v60, (uint64_t)CFSTR(","), v62);
      ++v53;
    }
    while (v53 < objc_msgSend_count(v24, v60, v61, v62));
  }
  v104 = v13;
  objc_msgSend_appendString_(v43, v51, (uint64_t)CFSTR(") values ("), v52);
  if (objc_msgSend_count(v24, v63, v64, v65))
  {
    v69 = 0;
    do
    {
      if (v69 == objc_msgSend_count(v24, v66, v67, v68) - 1)
        objc_msgSend_appendString_(v43, v70, (uint64_t)CFSTR("?"), v71);
      else
        objc_msgSend_appendString_(v43, v70, (uint64_t)CFSTR("?,"), v71);
      ++v69;
    }
    while (v69 < objc_msgSend_count(v24, v72, v73, v74));
  }
  objc_msgSend_appendString_(v43, v66, (uint64_t)CFSTR(")"), v68);
  objc_msgSend_componentsJoinedByString_(v105, v75, (uint64_t)CFSTR(","), v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v43, v78, (uint64_t)CFSTR(" on conflict (%@) "), v79, v77);

  objc_msgSend_appendString_(v43, v80, (uint64_t)CFSTR("do update set "), v81);
  if (objc_msgSend_count(v15, v82, v83, v84))
  {
    v87 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v15, v85, v87, v86);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v43, v89, (uint64_t)CFSTR("%@ = excluded.%@"), v90, v88, v88);
      if (v87 != objc_msgSend_count(v15, v91, v92, v93) - 1)
        objc_msgSend_appendString_(v43, v94, (uint64_t)CFSTR(", "), v95);

      ++v87;
    }
    while (v87 < objc_msgSend_count(v15, v96, v97, v98));
  }
  if (v103)
    objc_msgSend_appendFormat_(v43, v85, (uint64_t)CFSTR(" where %@"), v86, v103);
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v113 = 0;
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = sub_18A71CCB8;
  v106[3] = &unk_1E1F62C60;
  v99 = v25;
  v108 = self;
  v109 = &v110;
  v107 = v99;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v100, (uint64_t)v43, (uint64_t)v106);
  v101 = v111[3];

  _Block_object_dispose(&v110, 8);
  return v101;
}

- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend_assertInOperation_(self, v12, (uint64_t)a2, v13);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("delete from %@ where %@"), v15, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18A71CE14;
  v19[3] = &unk_1E1F62B98;
  v20 = v9;
  v17 = v9;
  objc_msgSend_usingStatementForSQL_performBlock_(self, v18, (uint64_t)v16, (uint64_t)v19);

}

- (void)deleteFrom:(id)a3 matchingValues:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  char isEqual;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  CKSQLite *v48;
  id v49;

  v48 = self;
  v49 = a3;
  v5 = a4;
  objc_msgSend_allKeys(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_compare_, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend_count(v12, v15, v16, v17))
  {
    v20 = 0;
    v21 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v18, v21, v19, v48);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v5, v23, (uint64_t)v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectAtIndexedSubscript_(v12, v26, v21, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v14, v29, (uint64_t)v28, v30);

      if (v25
        && (objc_msgSend_null(MEMORY[0x1E0C99E38], v31, v32, v33),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            isEqual = objc_msgSend_isEqual_(v34, v35, (uint64_t)v25, v36),
            v34,
            (isEqual & 1) == 0))
      {
        objc_msgSend_setObject_atIndexedSubscript_(v13, v31, (uint64_t)v25, v20++);
        objc_msgSend_appendString_(v14, v41, (uint64_t)CFSTR("=?"), v42);
      }
      else
      {
        objc_msgSend_appendString_(v14, v31, (uint64_t)CFSTR(" is NULL"), v33);
      }
      if (v21 != objc_msgSend_count(v12, v38, v39, v40) - 1)
        objc_msgSend_appendString_(v14, v43, (uint64_t)CFSTR(" AND "), v44);

      ++v21;
    }
    while (v21 < objc_msgSend_count(v12, v45, v46, v47));
  }
  objc_msgSend_deleteFrom_where_bindings_(v48, v18, (uint64_t)v49, (uint64_t)v14, v13, v48);

}

- (id)_tableNameForClass:(Class)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  objc_msgSend_CKSQLiteClassName(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasPrefix_(v5, v6, (uint64_t)self->_objectClassPrefix, v7) & 1) == 0)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Object class \"%@\" does not have prefix \"%@\"), v5, self->_objectClassPrefix);
  v11 = objc_msgSend_length(self->_objectClassPrefix, v8, v9, v10);
  objc_msgSend_substringFromIndex_(v5, v12, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)insertOrReplaceObject:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int64_t v14;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend__tableNameForClass_(self, v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryPropertyEncoding(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend_insertOrReplaceInto_values_(self, v13, (uint64_t)v8, (uint64_t)v12);
  return v14;
}

- (BOOL)deleteExactObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v6 = objc_opt_class();
  objc_msgSend__tableNameForClass_(self, v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryPropertyEncoding(v4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_matchingValues_(self, v14, (uint64_t)v9, (uint64_t)v13);
  LODWORD(self) = objc_msgSend_changes(self, v15, v16, v17);

  objc_autoreleasePoolPop(v5);
  return (_DWORD)self == 1;
}

- (int)deleteAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  Class v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a4;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A71D2CC;
  v16[3] = &unk_1E1F62CB0;
  v16[4] = self;
  v20 = a3;
  v10 = v8;
  v17 = v10;
  v11 = v9;
  v18 = v11;
  v19 = &v21;
  v14 = (id)objc_msgSend_performDatabaseOperation_(self, v12, (uint64_t)v16, v13);
  LODWORD(self) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)self;
}

- (id)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  CKSQLite *v40;
  id v41;
  id v42;
  Class v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend_classForHandle_(CKObjCClass, v13, (uint64_t)a3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__tableNameForClass_(self, v16, (uint64_t)a3, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_18A71D684;
  v35[3] = &unk_1E1F62D00;
  v23 = v18;
  v36 = v23;
  v24 = v10;
  v37 = v24;
  v25 = v11;
  v38 = v25;
  v26 = v12;
  v39 = v26;
  v40 = self;
  v27 = v15;
  v41 = v27;
  v43 = a3;
  v28 = v22;
  v42 = v28;
  objc_msgSend_performDatabaseOperation_(self, v29, (uint64_t)v35, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v45 = v31;
      _os_log_error_impl(&dword_18A5C5000, v32, OS_LOG_TYPE_ERROR, "Database select failed with error: %{public}@", buf, 0xCu);
    }

    v28 = 0;
  }
  v33 = v28;

  return v33;
}

- (id)selectAllObjectsOfClass:(Class)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_selectAllObjectsOfClass_where_bindings_limit_, a3, 0);
}

- (id)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_selectAllObjectsOfClass_where_bindings_limit_, a3, a4);
}

- (void)selectAllObjectsOfClass:(Class)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  const char *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  Class v32;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_classForHandle_(CKObjCClass, v20, (uint64_t)a3, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__tableNameForClass_(self, v23, (uint64_t)a3, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_18A71D964;
  v29[3] = &unk_1E1F62D28;
  v29[4] = self;
  v30 = v22;
  v32 = a3;
  v26 = v18;
  v31 = v26;
  v27 = v22;
  objc_msgSend_selectFrom_where_bindings_orderBy_limit_block_(self, v28, (uint64_t)v25, (uint64_t)v14, v15, v16, v17, v29);

  objc_autoreleasePoolPop(v19);
}

- (id)selectObjectOfClass:(Class)a3 where:(id)a4 bindings:(id)a5
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;

  objc_msgSend_selectAllObjectsOfClass_where_bindings_(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v7, v8, v9, v10))
  {
    if (objc_msgSend_count(v7, v11, v12, v13) != 1)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_count(v7, v20, v21, v22);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v24, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLite.m"), 1106, CFSTR("%lu results matching query"), v23);

    }
    objc_msgSend_objectAtIndexedSubscript_(v7, v14, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)updateAllObjectsOfClass:(Class)a3 set:(id)a4 where:(id)a5 bindings:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend__tableNameForClass_(self, v13, (uint64_t)a3, v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_update_set_where_bindings_limit_(self, v15, (uint64_t)v16, (uint64_t)v12, v11, v10, 0);

}

- (id)_boxedPropertyDictionary:(id)a3 forObjCClass:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A71DBF8;
  v12[3] = &unk_1E1F62D50;
  v12[4] = self;
  v13 = v6;
  v7 = v6;
  objc_msgSend_CKMapValues_(a3, v8, (uint64_t)v12, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_boxedValue:(id)a3 forObjcCProperty:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  char isKindOfClass;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  char v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  char v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  char v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;

  v5 = a3;
  v6 = a4;
  objc_msgSend_type(v6, v7, v8, v9);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v56 = 0;
    goto LABEL_21;
  }
  v11 = v10[1];

  if (v11 != 15)
    goto LABEL_22;
  objc_msgSend_type(v6, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_className(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v19, v20, (uint64_t)CFSTR("NSDate"), v21))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v26 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend_doubleValue(v5, v23, v24, v25);
      objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v26, v27, v28, v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
      v74 = v30;
      goto LABEL_24;
    }
  }
  else
  {

  }
  objc_msgSend_type(v6, v23, v24, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_className(v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("NSError"), v37))
  {
    objc_opt_class();
    v38 = objc_opt_isKindOfClass();

    if ((v38 & 1) != 0)
    {
      v42 = (void *)MEMORY[0x1E0CB3710];
      v43 = objc_opt_class();
      objc_msgSend_unarchivedObjectOfClass_fromData_error_(v42, v44, v43, (uint64_t)v5, 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  else
  {

  }
  objc_msgSend_type(v6, v39, v40, v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_className(v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v49, v50, (uint64_t)CFSTR("NSURL"), v51))
  {
    objc_opt_class();
    v52 = objc_opt_isKindOfClass();

    if ((v52 & 1) != 0)
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v53, (uint64_t)v5, v55);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  else
  {

  }
  objc_msgSend_type(v6, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_className(v56, v57, v58, v59);
  v60 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqualToString_(v60, v61, (uint64_t)CFSTR("NSUUID"), v62))
    goto LABEL_20;
  objc_opt_class();
  v63 = objc_opt_isKindOfClass();

  if ((v63 & 1) == 0)
  {
LABEL_22:
    v30 = v5;
    v5 = v30;
    goto LABEL_23;
  }
  v60 = v5;
  if (objc_msgSend_length(v60, v64, v65, v66) != 16)
  {
    v5 = 0;
    v56 = v60;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v67 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v5 = objc_retainAutorelease(v60);
  v71 = objc_msgSend_bytes(v5, v68, v69, v70);
  v74 = (void *)objc_msgSend_initWithUUIDBytes_(v67, v72, v71, v73);

LABEL_24:
  return v74;
}

- (int)dbUserVersion
{
  uint64_t v2;
  id v3;
  int v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18A71DFAC;
  v6[3] = &unk_1E1F62A88;
  v6[4] = &v7;
  v3 = (id)objc_msgSend_performDatabaseOperation_(self, a2, (uint64_t)v6, v2);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)schema
{
  return self->_schema;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)objectClassPrefix
{
  return self->_objectClassPrefix;
}

- (void)setObjectClassPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_objectClassPrefix, a3);
}

- (void)setUserVersion:(int)a3
{
  self->_userVersion = a3;
}

- (int64_t)synchronousMode
{
  return self->_synchronousMode;
}

- (void)setSynchronousMode:(int64_t)a3
{
  self->_synchronousMode = a3;
}

- (BOOL)hasMigrated
{
  return self->_hasMigrated;
}

- (BOOL)shouldVacuum
{
  return self->_shouldVacuum;
}

- (void)setShouldVacuum:(BOOL)a3
{
  self->_shouldVacuum = a3;
}

- (BOOL)traced
{
  return self->_traced;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CKSQLiteDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (unint64_t)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(unint64_t)a3
{
  self->_openCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_objectClassPrefix, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_errorHandlerBlock, 0);
}

@end
