@implementation CPLEngineScopedTask

- (CPLEngineScopedTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CPLEngineScopedTask *v16;
  CPLEngineScopedTask *v17;
  uint64_t v18;
  CPLEngineStore *store;
  uint64_t v20;
  NSString *clientCacheIdentifier;
  objc_super v23;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CPLEngineScopedTask;
  v16 = -[CPLEngineSyncTask initWithEngineLibrary:session:](&v23, sel_initWithEngineLibrary_session_, v12, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_scope, a6);
    objc_storeStrong((id *)&v17->_transportScope, a7);
    objc_msgSend(v12, "store");
    v18 = objc_claimAutoreleasedReturnValue();
    store = v17->_store;
    v17->_store = (CPLEngineStore *)v18;

    v20 = objc_msgSend(v13, "copy");
    clientCacheIdentifier = v17->_clientCacheIdentifier;
    v17->_clientCacheIdentifier = (NSString *)v20;

  }
  return v17;
}

- (BOOL)isScopeValidInTransaction:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CPLEngineScope *v18;
  NSObject *v19;
  CPLEngineScope *v20;
  void *v21;
  CPLEngineScope *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  CPLEngineScope *scope;
  CPLEngineScope *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  CPLEngineScope *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = self->_clientCacheIdentifier;
  -[CPLEngineStore clientCacheIdentifier](self->_store, "clientCacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {

    if (!(v4 | v6))
    {
LABEL_12:
      -[CPLEngineStore scopes](self->_store, "scopes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "validLocalScopeIndexes");
      v8 = objc_claimAutoreleasedReturnValue();

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[CPLEngineScopedTask scopesForTask](self, "scopesForTask", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v30;
LABEL_14:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(CPLEngineScope **)(*((_QWORD *)&v29 + 1) + 8 * v17);
          if ((-[NSObject containsIndex:](v8, "containsIndex:", -[CPLEngineScope localIndex](v18, "localIndex")) & 1) == 0)
            break;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
            if (v15)
              goto LABEL_14;
            goto LABEL_20;
          }
        }
        if (v18 == self->_scope)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_13504();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              scope = self->_scope;
              v27 = (CPLEngineScope *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v34 = scope;
              v35 = 2112;
              v36 = v27;
              v22 = v27;
              v23 = "Scope %@ is invalid, stopping %@ now";
              v24 = v19;
              v25 = 22;
              goto LABEL_28;
            }
LABEL_29:

          }
        }
        else if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_13504();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = self->_scope;
            v21 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v34 = v18;
            v35 = 2112;
            v36 = v20;
            v37 = 2112;
            v38 = v21;
            v22 = v21;
            v23 = "Scope %@ (associated with %@) is invalid, stopping %@ now";
            v24 = v19;
            v25 = 32;
LABEL_28:
            _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

            goto LABEL_29;
          }
          goto LABEL_29;
        }
        v10 = 0;
        goto LABEL_31;
      }
LABEL_20:
      v10 = 1;
LABEL_31:

      goto LABEL_32;
    }
  }
  else
  {
    v11 = objc_msgSend((id)v4, "isEqual:", v5);

    if ((v11 & 1) != 0)
      goto LABEL_12;
  }
  if (_CPLSilentLogging)
    return 0;
  __CPLTaskOSLogDomain_13504();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = (id)objc_opt_class();
    v9 = v34;
    _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Client cache has been reset. Stopping %@ for now", buf, 0xCu);

  }
  v10 = 0;
LABEL_32:

  return v10;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  -[CPLEngineSyncTask session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldDefer");

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_13504();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 138412290;
        *(_QWORD *)&v15[4] = objc_opt_class();
        v9 = *(id *)&v15[4];
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Session for %@ has been deferred", v15, 0xCu);

      }
    }
    +[CPLErrors sessionHasBeenDeferredError](CPLErrors, "sessionHasBeenDeferredError", *(_OWORD *)v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v10);

    goto LABEL_15;
  }
  if (!-[CPLEngineScopedTask isScopeValidInTransaction:](self, "isScopeValidInTransaction:", v4))
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_13504();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLEngineScopedTask scope](self, "scope");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v15 = 138412290;
        *(_QWORD *)&v15[4] = v13;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "%@ is not valid anymore - stopping here", v15, 0xCu);

      }
    }
    -[CPLEngineSyncTask cancel](self, "cancel");
    goto LABEL_15;
  }
  v11 = 1;
LABEL_16:

  return v11;
}

- (id)scopesForTask
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[CPLEngineScopedTask scope](self, "scope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)clientCacheIdentifier
{
  return self->_clientCacheIdentifier;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (NSData)transportScope
{
  return self->_transportScope;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_transportScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_clientCacheIdentifier, 0);
}

@end
