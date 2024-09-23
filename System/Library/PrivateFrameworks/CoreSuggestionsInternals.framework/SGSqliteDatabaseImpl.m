@implementation SGSqliteDatabaseImpl

- (SGSqliteDatabaseImpl)initWithFilename:(id)a3 flags:(int)a4 error:(id *)a5 sgDb:(id)a6
{
  uint64_t v7;
  id v10;
  SGSqliteDatabaseImpl *v11;
  SGSqliteDatabaseImpl *v12;
  objc_super v14;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)SGSqliteDatabaseImpl;
  v11 = -[SGSqliteDatabaseImpl initWithFilename:flags:error:errorHandler:](&v14, sel_initWithFilename_flags_error_errorHandler_, a3, v7, a5, 0);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_sgDb, v10);

  return v12;
}

- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6
{
  uint64_t v7;
  int64_t v8;
  SGSqliteDatabase **p_sgDb;
  id v10;
  id v11;
  id WeakRetained;
  char v13;

  v7 = *(_QWORD *)&a4;
  if ((unint64_t)a3 >= 6)
    v8 = -1;
  else
    v8 = a3;
  p_sgDb = &self->_sgDb;
  v10 = a6;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_sgDb);
  v13 = objc_msgSend(WeakRetained, "handleError:sqliteError:forQuery:onError:", v8, v7, v11, v10);

  return v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sgDb);
}

@end
