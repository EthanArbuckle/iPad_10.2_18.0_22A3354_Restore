@implementation ML3VirtualTable

- (ML3VirtualTable)initWithDatabaseTable:(id)a3
{
  id v6;
  ML3VirtualTable *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *virtualTableName;
  void *v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ML3VirtualTable;
  v7 = -[ML3VirtualTable init](&v14, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("ML3VirtualTable.mm"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseTable != nil"));

    }
    objc_storeStrong((id *)&v7->_databaseTable, a3);
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[ML3DatabaseTable name](v7->_databaseTable, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("virtual_%@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    virtualTableName = v7->_virtualTableName;
    v7->_virtualTableName = (NSString *)v10;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[ML3VirtualTable unregister](self, "unregister");
  v3.receiver = self;
  v3.super_class = (Class)ML3VirtualTable;
  -[ML3VirtualTable dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->_virtualTableName;
}

- (BOOL)registerWithConnection:(id)a3
{
  id v5;
  ML3DatabaseConnection **p_connection;
  void *v7;
  ML3DatabaseModule *v8;
  ML3DatabaseModule *module;
  void *v10;
  ML3DatabaseConnection *v11;
  BOOL v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  ML3DatabaseModule *v16;
  NSObject *v17;
  ML3DatabaseConnection *v18;
  id v20;
  uint8_t buf[4];
  ML3DatabaseModule *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_connection = &self->_connection;
  if (self->_connection)
    -[ML3VirtualTable unregister](self, "unregister");
  objc_storeStrong((id *)&self->_connection, a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_module_%u"), self->_virtualTableName, arc4random());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ML3DatabaseModule initWithName:moduleMethods:]([ML3DatabaseModule alloc], "initWithName:moduleMethods:", v7, &__virtualTableSQLiteModule);
  module = self->_module;
  self->_module = v8;

  -[ML3DatabaseModule setContext:](self->_module, "setContext:", self);
  if (-[ML3DatabaseConnection registerModule:](self->_connection, "registerModule:", self->_module))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE VIRTUAL TABLE TEMP.%@ USING %@"), self->_virtualTableName, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *p_connection;
    v20 = 0;
    v12 = -[ML3DatabaseConnection executeUpdate:withParameters:error:](v11, "executeUpdate:withParameters:error:", v10, 0, &v20);
    v13 = v20;
    if (v12)
    {
      v14 = 1;
    }
    else
    {
      v17 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *p_connection;
        *(_DWORD *)buf = 134218242;
        v22 = (ML3DatabaseModule *)v18;
        v23 = 2114;
        v24 = v13;
        _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Failed to create virtual table on connection %p. %{public}@", buf, 0x16u);
      }

      v14 = 0;
    }
  }
  else
  {
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_module;
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Failed to register virtual table on connection. Could not register module %{public}@.", buf, 0xCu);
    }

    v13 = 0;
    v14 = 0;
    v10 = self->_module;
    self->_module = 0;
  }

  return v14;
}

- (BOOL)unregister
{
  ML3DatabaseConnection *connection;
  void *v4;
  id v5;
  NSObject *v6;
  ML3DatabaseConnection *v7;
  void *v8;
  ML3DatabaseModule *module;
  ML3DatabaseConnection *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), self->_virtualTableName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    LOBYTE(connection) = -[ML3DatabaseConnection executeUpdate:withParameters:error:](connection, "executeUpdate:withParameters:error:", v4, 0, &v12);
    v5 = v12;

    if ((connection & 1) == 0)
    {
      v6 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v5;
        _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Could not unregister virtual table. %{public}@", buf, 0xCu);
      }

    }
    v7 = self->_connection;
    -[ML3DatabaseModule name](self->_module, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3DatabaseConnection removeModuleNamed:](v7, "removeModuleNamed:", v8);

    module = self->_module;
    self->_module = 0;

    v10 = self->_connection;
    self->_connection = 0;

  }
  return (char)connection;
}

- (shared_ptr<ML3VirtualTableDataSource>)dataSource
{
  ML3VirtualTableDataSource **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<ML3VirtualTableDataSource> result;

  cntrl = self->_dataSource.__cntrl_;
  *v2 = self->_dataSource.__ptr_;
  v2[1] = (ML3VirtualTableDataSource *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ML3VirtualTableDataSource *)self;
  return result;
}

- (void)setDataSource:(shared_ptr<ML3VirtualTableDataSource>)a3
{
  __shared_weak_count *v3;
  ML3VirtualTableDataSource *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(ML3VirtualTableDataSource **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_dataSource.__cntrl_;
  self->_dataSource.__ptr_ = v4;
  self->_dataSource.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (ML3VirtualTableDelegate)delegate
{
  return (ML3VirtualTableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ML3DatabaseTable)databaseTable
{
  return self->_databaseTable;
}

- (ML3DatabaseConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  std::shared_ptr<ML3CPP::Element>::~shared_ptr[abi:ne180100]((uint64_t)&self->_dataSource);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_databaseTable, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_virtualTableName, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
