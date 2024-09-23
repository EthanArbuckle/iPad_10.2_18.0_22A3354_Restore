@implementation _ML3MultiUserAccountChangeOperation

- (_ML3MultiUserAccountChangeOperation)initWithDatabasePath:(id)a3 accountChangeObserver:(id)a4
{
  id v6;
  id v7;
  _ML3MultiUserAccountChangeOperation *v8;
  uint64_t v9;
  NSString *databasePath;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ML3MultiUserAccountChangeOperation;
  v8 = -[MSVAsyncOperation init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    databasePath = v8->_databasePath;
    v8->_databasePath = (NSString *)v9;

    objc_storeWeak((id *)&v8->_accountChangeObserver, v7);
  }

  return v8;
}

- (void)execute
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  _ML3MultiUserAccountChangeOperation *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "_ML3MultiUserAccountChangeOperation %p - Starting operation", buf, 0xCu);
  }

  -[_ML3MultiUserAccountChangeOperation accountChangeObserver](self, "accountChangeObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ML3MultiUserAccountChangeOperation databasePath](self, "databasePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46___ML3MultiUserAccountChangeOperation_execute__block_invoke;
  v6[3] = &unk_1E5B65E90;
  v6[4] = self;
  objc_msgSend(v4, "performDatabasePathChange:completion:", v5, v6);

}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  return (MLMediaLibraryAccountChangeObserver *)objc_loadWeakRetained((id *)&self->_accountChangeObserver);
}

- (void)setAccountChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_accountChangeObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accountChangeObserver);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end
