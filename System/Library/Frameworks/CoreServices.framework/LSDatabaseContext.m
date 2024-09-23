@implementation LSDatabaseContext

- (BOOL)canAccess
{
  return _LSCurrentProcessMayMapDatabase() != 0;
}

- (void)observeDatabaseChange4WebKit:(id)a3
{
  FSNode *string;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  LaunchServices::DatabaseContext *v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int value;
  unsigned int v16;
  id *v17;
  LaunchServices::DatabaseContext *v18;
  LaunchServices::DatabaseContext *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 && object_getClass(a3) == (Class)MEMORY[0x1E0C812F8])
  {
    string = (FSNode *)xpc_dictionary_get_string(a3, "path");
    if (string)
      string = -[FSNode initWithFileSystemRepresentation:flags:error:]([FSNode alloc], "initWithFileSystemRepresentation:flags:error:", string, 0, 0);
    xpc_dictionary_get_value(a3, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = (const void *)_CSStoreCreateWithXPCRepresentation();
    else
      v6 = 0;

    xpc_dictionary_get_value(a3, "insecureProcessID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && object_getClass(v7) == (Class)MEMORY[0x1E0C81398])
    {
      value = xpc_uint64_get_value(v8);

      v10 = v6 == 0;
      if (string && v6)
      {
        LaunchServices::DatabaseContext::getLog(v9);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = value;
          v12 = "Replacing local LS database with a copy pushed by process %llu.";
          v13 = v11;
          v14 = 12;
          goto LABEL_18;
        }
LABEL_19:

        v16 = _CFGetEUID();
        v22 = 0;
        v17 = _LSDatabaseCreate(string, (void *)v16, v6, &v22);
        v18 = (LaunchServices::DatabaseContext *)v22;
        v19 = v18;
        if (v17)
        {
          *(_QWORD *)buf = v17;
          _LSContextObserveChange((void **)buf);

        }
        else
        {
          LaunchServices::DatabaseContext::getLog(v18);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v19;
            _os_log_impl(&dword_182882000, v21, OS_LOG_TYPE_INFO, "Could not replace the local LS database with a pushed copy: %@", buf, 0xCu);
          }

        }
LABEL_29:
        CFRelease(v6);
LABEL_30:

        return;
      }
    }
    else
    {

      v10 = v6 == 0;
      if (string && v6)
      {
        LaunchServices::DatabaseContext::getLog(v9);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v12 = "Replacing local LS database with a copy pushed by an unspecified process.";
          v13 = v11;
          v14 = 2;
LABEL_18:
          _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
    }
    LaunchServices::DatabaseContext::getLog(v9);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v20, OS_LOG_TYPE_INFO, "Could not replace the local LS database with a pushed copy because the pushed XPC object was malformed.", buf, 2u);
    }

    if (v10)
      goto LABEL_30;
    goto LABEL_29;
  }
}

void __42__LSDatabaseContext_sharedDatabaseContext__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[LSDatabaseContext _init]([LSDatabaseContext alloc], "_init");
  v1 = (void *)+[LSDatabaseContext sharedDatabaseContext]::result;
  +[LSDatabaseContext sharedDatabaseContext]::result = (uint64_t)v0;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSDatabaseContext;
  return -[LSDatabaseContext init](&v3, sel_init);
}

+ (LSDatabaseContext)sharedDatabaseContext
{
  if (+[LSDatabaseContext sharedDatabaseContext]::once != -1)
    dispatch_once(&+[LSDatabaseContext sharedDatabaseContext]::once, &__block_literal_global_24);
  return (LSDatabaseContext *)(id)+[LSDatabaseContext sharedDatabaseContext]::result;
}

void __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke_2(uint64_t a1, const __CSStore *a2, FSNode *a3, uint64_t a4)
{
  uint64_t v5;
  id v6;

  if (a4)
  {
    v5 = 0;
  }
  else
  {
    getXPCObjectForNodeAndStore(a3, a2);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getSystemContentDatabaseObject4WebKit:(id)a3
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  void (*v7[5])(_QWORD, _QWORD);

  v4 = MEMORY[0x1E0C809B0];
  v7[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v7[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v7[2] = (void (*)(_QWORD, _QWORD))__81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke;
  v7[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FE08;
  v7[4] = (void (*)(_QWORD, _QWORD))a3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke_2;
  v6[3] = &unk_1E1042CE0;
  v6[4] = a3;
  objc_msgSend(v5, "getSystemContentStoreWithCompletionHandler:", v6);

}

+ (id)new
{
  abort();
}

- (LSDatabaseContext)init
{
  abort();
}

- (BOOL)startAccessingReturningError:(id *)a3
{
  return _LSDatabaseContextStartAccessing(0, 0, a3);
}

- (BOOL)startAccessingWithOptions:(unint64_t)a3 error:(id *)a4
{
  return _LSDatabaseContextStartAccessing(0, a3, a4);
}

- (BOOL)startAccessingWithUserID:(unsigned int)a3 error:(id *)a4
{
  unsigned int v5;

  v5 = a3;
  return _LSDatabaseContextStartAccessing(&v5, 0, a4);
}

- (BOOL)startAccessingWithUserID:(unsigned int)a3 options:(unint64_t)a4 error:(id *)a5
{
  unsigned int v6;

  v6 = a3;
  return _LSDatabaseContextStartAccessing(&v6, a4, a5);
}

- (BOOL)isAccessing
{
  return LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self)[4] > 0;
}

- (NSData)currentPersistentIdentifier
{
  uint64_t *v2;
  int CatalogTable;
  uint64_t SequenceNumber;
  void *v5;
  _BYTE v7[40];
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)*LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self);
  if (!v2)
    goto LABEL_3;
  memset(v8, 0, 28);
  CatalogTable = _CSStoreGetCatalogTable();
  _LSPersistentIdentifierDataMake(v2, CatalogTable, 0, (uint64_t)v8);
  SequenceNumber = _LSDatabaseGetSequenceNumber();
  *(_OWORD *)v7 = v8[0];
  *(_OWORD *)&v7[12] = *(_OWORD *)((char *)v8 + 12);
  *(_QWORD *)&v7[28] = SequenceNumber;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, 36);
  if (!v5)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99D50], "data", *(_OWORD *)v7, *(_QWORD *)&v7[16], *(_OWORD *)&v7[24]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (id)addDatabaseChangeObserver4WebKit:(id)a3
{
  _LSDServiceDomain *v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  void **v14;
  id v15;
  char v16;
  id v17;

  v14 = (void **)*LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v4 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v5 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v14, v4, 0);

  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__LSDatabaseContext_WebKitChangeTracking__addDatabaseChangeObserver4WebKit___block_invoke;
    v13[3] = &unk_1E1042CB8;
    v13[4] = a3;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x186DAE9BC](v13);
    +[_LSDServiceDomain defaultServiceDomain]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSContextAddChangeObserver(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v6[2](v6, v5);

  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  if (v14 && v16)
    _LSContextDestroy(v14);
  v10 = v15;
  v14 = 0;
  v15 = 0;

  v16 = 0;
  v11 = v17;
  v17 = 0;

  return v9;
}

void __76__LSDatabaseContext_WebKitChangeTracking__addDatabaseChangeObserver4WebKit___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  FSNode *v6;

  _LSDatabaseGetNode(*a2);
  v6 = (FSNode *)objc_claimAutoreleasedReturnValue();
  getXPCObjectForNodeAndStore(v6, *(const __CSStore **)(*a2 + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x186DAE7A0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v5);

}

- (void)removeDatabaseChangeObserver4WebKit:(id)a3
{
  _LSContextRemoveChangeObserver(a3);
}

uint64_t __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)releaseObservedDatabase4WebKit
{
  _LSDServiceDomain *v2;
  LSSessionKey **v3;
  id v4;
  id v5;
  void **v6;
  id v7;
  char v8;
  id v9;

  v9 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = (LSSessionKey **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v6, v2, 0);

  if (v3)
    _LSContextReleaseObservedChange(v3);
  if (v6 && v8)
    _LSContextDestroy(v6);
  v4 = v7;
  v6 = 0;
  v7 = 0;

  v8 = 0;
  v5 = v9;
  v9 = 0;

}

- (void)accessUsingBlock:(id)a3
{
  _LSDatabaseContextAccessUsingBlock(0, 0, (uint64_t)a3);
}

- (void)accessWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  _LSDatabaseContextAccessUsingBlock(0, a3, (uint64_t)a4);
}

- (void)accessWithUserID:(unsigned int)a3 usingBlock:(id)a4
{
  unsigned int v4;

  v4 = a3;
  _LSDatabaseContextAccessUsingBlock(&v4, 0, (uint64_t)a4);
}

- (void)accessWithUserID:(unsigned int)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  unsigned int v5;

  v5 = a3;
  _LSDatabaseContextAccessUsingBlock(&v5, a4, (uint64_t)a5);
}

- (BOOL)startAccessingSystemScopeReturningError:(id *)a3
{
  LaunchServices::DatabaseContext *v4;

  systemIfExistsElseDefaultServiceDomain();
  v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _LSDatabaseContextStartAccessingWithDomain(v4, 0, a3);

  return (char)a3;
}

- (void)accessSystemScopeUsingBlock:(id)a3
{
  LaunchServices::DatabaseContext *v4;

  systemIfExistsElseDefaultServiceDomain();
  v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseContextAccessWithDomainUsingBlock(v4, 0, (uint64_t)a3);

}

- (BOOL)startAccessingCurrentUserSessionReturningError:(id *)a3
{
  LaunchServices::DatabaseContext *v4;

  +[_LSDServiceDomain currentUserSessionDomain]();
  v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _LSDatabaseContextStartAccessingWithDomain(v4, 0, a3);

  return (char)a3;
}

- (void)accessCurrentUserSessionUsingBlock:(id)a3
{
  LaunchServices::DatabaseContext *v4;

  +[_LSDServiceDomain currentUserSessionDomain]();
  v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseContextAccessWithDomainUsingBlock(v4, 0, (uint64_t)a3);

}

@end
