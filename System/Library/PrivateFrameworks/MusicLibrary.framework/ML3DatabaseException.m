@implementation ML3DatabaseException

- (ML3DatabaseException)initWithReason:(id)a3 sqliteError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ML3DatabaseException *v11;
  ML3DatabaseException *v12;
  objc_super v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v15 = CFSTR("ML3DatabaseExceptionErrorUserInfoKey");
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = *MEMORY[0x1E0C99768];
  v14.receiver = self;
  v14.super_class = (Class)ML3DatabaseException;
  v11 = -[ML3DatabaseException initWithName:reason:userInfo:](&v14, sel_initWithName_reason_userInfo_, v10, v6, v9);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_sqliteError, a4);

  return v12;
}

- (ML3DatabaseException)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithReason_sqliteError_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is invalid. Use %@."), v5, v6);

  return 0;
}

- (void)raise
{
  NSInteger v3;
  NSInteger v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  NSInteger v13;
  _DWORD v14[2];
  char *v15;
  int v16;
  char *v17;
  int v18;
  char *v19;
  int v20;
  char *v21;
  int v22;
  char *v23;
  int v24;
  char *v25;
  int v26;
  char *v27;
  int v28;
  char *v29;
  int v30;
  char *v31;
  int v32;
  char *v33;
  int v34;
  char *v35;
  int v36;
  char *v37;
  int v38;
  char *v39;
  int v40;
  char *v41;
  int v42;
  char *v43;
  int v44;
  char *v45;
  int v46;
  char *v47;
  int v48;
  char *v49;
  int v50;
  char *v51;
  int v52;
  char *v53;
  int v54;
  char *v55;
  int v56;
  char *v57;
  int v58;
  char *v59;
  int v60;
  char *v61;
  int v62;
  char *v63;
  int v64;
  char *v65;
  int v66;
  char *v67;
  int v68;
  char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v14[0] = 1;
  v15 = sel__SQLITE_ERROR;
  v16 = 2;
  v17 = sel__SQLITE_INTERNAL;
  v18 = 3;
  v19 = sel__SQLITE_PERM;
  v20 = 4;
  v21 = sel__SQLITE_ABORT;
  v22 = 5;
  v23 = sel__SQLITE_BUSY;
  v24 = 6;
  v25 = sel__SQLITE_LOCKED;
  v26 = 7;
  v27 = sel__SQLITE_NOMEM;
  v28 = 8;
  v29 = sel__SQLITE_READONLY;
  v30 = 9;
  v31 = sel__SQLITE_INTERRUPT;
  v32 = 10;
  v33 = sel__SQLITE_IOERR;
  v34 = 11;
  v35 = sel__SQLITE_CORRUPT;
  v36 = 12;
  v37 = sel__SQLITE_NOTFOUND;
  v38 = 13;
  v39 = sel__SQLITE_FULL;
  v40 = 14;
  v41 = sel__SQLITE_CANTOPEN;
  v42 = 15;
  v43 = sel__SQLITE_PROTOCOL;
  v44 = 16;
  v45 = sel__SQLITE_EMPTY;
  v46 = 17;
  v47 = sel__SQLITE_SCHEMA;
  v48 = 18;
  v49 = sel__SQLITE_TOOBIG;
  v50 = 19;
  v51 = sel__SQLITE_CONSTRAINT;
  v52 = 20;
  v53 = sel__SQLITE_MISMATCH;
  v54 = 21;
  v55 = sel__SQLITE_MISUSE;
  v56 = 22;
  v57 = sel__SQLITE_NOLFS;
  v58 = 23;
  v59 = sel__SQLITE_AUTH;
  v60 = 24;
  v61 = sel__SQLITE_FORMAT;
  v62 = 25;
  v63 = sel__SQLITE_RANGE;
  v64 = 26;
  v65 = sel__SQLITE_NOTADB;
  v66 = 100;
  v67 = sel__SQLITE_ROW;
  v68 = 101;
  v69 = sel__SQLITE_DONE;
  v3 = -[NSError code](self->_sqliteError, "code");
  v4 = v3;
  v5 = 0;
  v6 = v14;
  while (1)
  {
    v7 = *v6;
    v6 += 4;
    if (v3 == v7)
      break;
    if (++v5 == 28)
      goto LABEL_7;
  }
  v8 = &v14[4 * v5];
  v9 = *((_QWORD *)v8 + 1);
  if (v9)
  {
    ((void (*)(ML3DatabaseException *, uint64_t))-[ML3DatabaseException methodForSelector:](self, "methodForSelector:", *((_QWORD *)v8 + 1)))(self, v9);
    return;
  }
LABEL_7:
  v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v4;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "No helper method can be found for SQLite error code %ld.", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v11, sel_raise);
}

- (void)_SQLITE_ERROR
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_INTERNAL
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_PERM
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_ABORT
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_BUSY
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_LOCKED
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_NOMEM
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_READONLY
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_INTERRUPT
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_IOERR
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_CORRUPT
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_NOTFOUND
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_FULL
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_CANTOPEN
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_PROTOCOL
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_EMPTY
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_SCHEMA
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_TOOBIG
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_CONSTRAINT
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_MISMATCH
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_MISUSE
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_NOLFS
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_AUTH
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_FORMAT
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_RANGE
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_NOTADB
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_ROW
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (void)_SQLITE_DONE
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  -[MLException raise](&v2, sel_raise);
}

- (NSError)sqliteError
{
  return self->_sqliteError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqliteError, 0);
}

+ (id)databaseExceptionWithReason:(id)a3 sqliteError:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReason:sqliteError:", v6, v5);

  return v7;
}

@end
