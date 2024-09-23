@implementation _FAFamilyCircleRequestConnectionProvider

- (_FAFamilyCircleRequestConnectionProvider)init
{
  _FAFamilyCircleRequestConnectionFactory *v3;
  _FAFamilyCircleRequestConnectionProvider *v4;

  v3 = objc_alloc_init(_FAFamilyCircleRequestConnectionFactory);
  v4 = -[_FAFamilyCircleRequestConnectionProvider initWithConnectionFactory:](self, "initWithConnectionFactory:", v3);

  return v4;
}

- (_FAFamilyCircleRequestConnectionProvider)initWithConnectionFactory:(id)a3
{
  id v5;
  _FAFamilyCircleRequestConnectionProvider *v6;
  _FAFamilyCircleRequestConnectionProvider *v7;
  NSLock *v8;
  NSLock *lock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FAFamilyCircleRequestConnectionProvider;
  v6 = -[_FAFamilyCircleRequestConnectionProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_factory, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v7->_lock;
    v7->_lock = v8;

  }
  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sProvider;
}

- (id)serviceConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_FAFamilyCircleRequestConnectionProvider lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[_FAFamilyCircleRequestConnectionProvider connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_class();
    -[_FAFamilyCircleRequestConnectionProvider factory](self, "factory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createResumedConnectionWithFactory:provider:", v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FAFamilyCircleRequestConnectionProvider setConnection:](self, "setConnection:", v7);

  }
  -[_FAFamilyCircleRequestConnectionProvider connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FAFamilyCircleRequestConnectionProvider lock](self, "lock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return v8;
}

- (NSLock)lock
{
  return self->_lock;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (FAFamilyCircleRequestConnectionFactory)factory
{
  return self->_factory;
}

+ (id)createResumedConnectionWithFactory:(id)a3 provider:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88___FAFamilyCircleRequestConnectionProvider_createResumedConnectionWithFactory_provider___block_invoke;
  v14[3] = &unk_1E8561848;
  objc_copyWeak(&v15, &location);
  v14[4] = &v17;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __88___FAFamilyCircleRequestConnectionProvider_createResumedConnectionWithFactory_provider___block_invoke_2;
  v12[3] = &unk_1E8561848;
  objc_copyWeak(&v13, &location);
  v12[4] = &v17;
  objc_msgSend(v5, "createServiceConnectionWithInterruptionHandler:invalidationHandler:", v14, v12);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v18[5];
  v18[5] = v8;

  objc_msgSend((id)v18[5], "resume");
  v10 = (id)v18[5];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[_FAFamilyCircleRequestConnectionProvider connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FAFamilyCircleRequestConnectionProvider lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  -[_FAFamilyCircleRequestConnectionProvider setConnection:](self, "setConnection:", 0);
  -[_FAFamilyCircleRequestConnectionProvider lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  objc_msgSend(v3, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)_FAFamilyCircleRequestConnectionProvider;
  -[_FAFamilyCircleRequestConnectionProvider dealloc](&v6, sel_dealloc);
}

- (void)connectionWasInterrupted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "FAFamilyCircleRequest: FamilyCircleService XPC Connection interrupted.", v10, 2u);
  }

  -[_FAFamilyCircleRequestConnectionProvider lock](self, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[_FAFamilyCircleRequestConnectionProvider connection](self, "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    -[_FAFamilyCircleRequestConnectionProvider connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FAFamilyCircleRequestConnectionProvider setConnection:](self, "setConnection:", 0);
  }
  else
  {
    v8 = 0;
  }
  -[_FAFamilyCircleRequestConnectionProvider lock](self, "lock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  objc_msgSend(v8, "invalidate");
}

- (void)connectionWasInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "FAFamilyCircleRequest: FamilyCircleService XPC Connection invalidated.", v9, 2u);
  }

  -[_FAFamilyCircleRequestConnectionProvider lock](self, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[_FAFamilyCircleRequestConnectionProvider connection](self, "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
    -[_FAFamilyCircleRequestConnectionProvider setConnection:](self, "setConnection:", 0);
  -[_FAFamilyCircleRequestConnectionProvider lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (void)setFactory:(id)a3
{
  objc_storeStrong((id *)&self->_factory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_factory, 0);
}

@end
