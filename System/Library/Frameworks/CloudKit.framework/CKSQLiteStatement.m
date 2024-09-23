@implementation CKSQLiteStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryBoundObjects, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_SQL, 0);
  objc_destroyWeak((id *)&self->_SQLite);
}

- (void)bindText:(id)a3 atIndex:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  sqlite3_stmt *handle;
  char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  char *v22;

  v7 = (const char *)a3;
  v10 = (char *)v7;
  v22 = (char *)v7;
  if (!self->_reset)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteStatement.m"), 240, CFSTR("Statement is not reset: \"%@\"), self->_SQL);

    v10 = v22;
    if (v22)
      goto LABEL_3;
LABEL_7:
    sub_18A7BA9A0((uint64_t)self, a4);
    goto LABEL_8;
  }
  if (!v7)
    goto LABEL_7;
LABEL_3:
  v11 = sub_18A5D6504(self, v10);
  handle = self->_handle;
  if (handle)
  {
    v13 = objc_retainAutorelease(v22);
    v17 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16);
    if (sqlite3_bind_text(handle, a4 + 1, v17, -1, 0))
      objc_msgSend_invalidate_(self, v18, (uint64_t)CFSTR("Error binding text at %ld: \"%@\"), v19, a4, self->_SQL);
  }
LABEL_8:

}

- (void)invalidate:(id)a3
{
  CKSQLite **p_SQLite;
  id v5;
  id WeakRetained;
  const char *v7;
  NSError *v8;
  NSError *error;
  uint64_t v10;

  if (!self->_error)
  {
    p_SQLite = &self->_SQLite;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_SQLite);
    objc_msgSend_handleDatabaseError_args_(WeakRetained, v7, (uint64_t)v5, (uint64_t)&v10);
    v8 = (NSError *)objc_claimAutoreleasedReturnValue();

    error = self->_error;
    self->_error = v8;

    if (self->_error)
      sub_18A5D620C((uint64_t)self);
  }
}

@end
