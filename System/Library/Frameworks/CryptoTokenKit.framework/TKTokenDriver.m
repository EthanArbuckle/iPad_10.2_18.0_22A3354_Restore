@implementation TKTokenDriver

+ (id)createDriver
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  objc_class *v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  objc_class *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!objc_opt_class())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Token plugins are not supported without PlugInKit"));
  objc_msgSend(MEMORY[0x1E0D7D440], "defaultService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "solePersonality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "plugInDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("NSExtensionAttributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("com.apple.ctk.driver-class"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TK_LOG_token();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[TKTokenDriver createDriver].cold.2(v5, (uint64_t)v8, v9);

  v10 = objc_retainAutorelease(v8);
  v11 = -[objc_class init](-[objc_class alloc](objc_getClass((const char *)objc_msgSend(v10, "UTF8String")), "alloc"), "init");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    TK_LOG_token();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v5, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v15;
      v20 = 2114;
      v21 = v10;
      v22 = 2048;
      v23 = v11;
      _os_log_fault_impl(&dword_1B9768000, v12, OS_LOG_TYPE_FAULT, "extension %{public}@: cannot instantiate TKTokenDriver-based class '%{public}@' (%p)", buf, 0x20u);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TKToken.m"), 99, CFSTR("extension %@: cannot instantiate TKTokenDriver-based class '%@' (%p)"), v17, v10, v11);

  }
  -[objc_class setExtensionAttributes:](v11, "setExtensionAttributes:", v7);
  TK_LOG_token();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[TKTokenDriver createDriver].cold.1();

  return v11;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "Destroying driver %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (TKTokenDriver)init
{
  TKTokenDriver *v2;
  TKTokenDriver *v3;
  uint64_t v4;
  NSMutableDictionary *tokenConnections;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TKTokenDriver;
  v2 = -[TKTokenDriver init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[TKTokenDriver conformsToProtocol:](v2, "conformsToProtocol:", &unk_1EF237B18))
      objc_storeWeak((id *)&v3->_delegate, v3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    tokenConnections = v3->_tokenConnections;
    v3->_tokenConnections = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (NSString)classID
{
  void *v2;
  void *v3;

  -[TKTokenDriver extensionAttributes](self, "extensionAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.ctk.class-id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)keepAlive
{
  id keepAlive;

  keepAlive = self->_keepAlive;
  if (keepAlive)
    return keepAlive;
  -[TKSharedResourceSlot resourceWithError:](self->_keepAliveResourceSlot, "resourceWithError:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setKeepAlive:(id)a3
{
  objc_storeStrong(&self->_keepAlive, a3);
}

- (id)endpointForToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  TKTokenConnection *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "tokenID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    TK_LOG_token();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[TKTokenDriver endpointForToken:].cold.1();

    objc_msgSend(v9, "invalidate");
  }
  v11 = -[TKTokenConnection initWithToken:]([TKTokenConnection alloc], "initWithToken:", v4);

  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v6);

  -[TKTokenConnection listener](v11, "listener");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endpoint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  return v14;
}

- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  TKTokenID *v8;
  void *v9;
  TKTokenID *v10;
  void *v11;
  char v12;
  TKTokenConfiguration *v13;
  void *v14;
  void *v15;
  TKTokenConfiguration *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  void (**v26)(id, void *, _QWORD);
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = [TKTokenID alloc];
  -[TKTokenDriver classID](self, "classID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TKTokenID initWithClassID:instanceID:](v8, "initWithClassID:instanceID:", v9, v6);

  -[TKTokenDriver delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = [TKTokenConfiguration alloc];
    -[TKTokenDriver context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TKTokenConfiguration initWithTokenID:configurationConnection:](v13, "initWithTokenID:configurationConnection:", v10, v15);

    -[TKTokenConfiguration beginTransaction](v16, "beginTransaction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenDriver delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v18, "tokenDriver:tokenForConfiguration:error:", self, v16, &v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;

    if (v19)
    {
      objc_msgSend(v17, "commit");
      -[TKTokenDriver endpointForToken:](self, "endpointForToken:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v21, 0);

    }
    else
    {
      TK_LOG_token();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[TKTokenDriver acquireTokenWithInstanceID:reply:].cold.1();

      objc_msgSend(v17, "commit");
      ((void (**)(id, void *, id))v7)[2](v7, 0, v20);
    }

  }
  else
  {
    v28 = *MEMORY[0x1E0CD6B98];
    -[TKTokenID stringRepresentation](v10, "stringRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __50__TKTokenDriver_acquireTokenWithInstanceID_reply___block_invoke;
    v25[3] = &unk_1E7089098;
    v25[4] = self;
    v26 = v7;
    -[TKTokenDriver getTokenWithAttributes:reply:](self, "getTokenWithAttributes:reply:", v23, v25);

    v20 = v26;
  }

}

void __50__TKTokenDriver_acquireTokenWithInstanceID_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "endpointForToken:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40));
  }
}

- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5
{
  void (**v8)(id, uint64_t, void *, _QWORD);
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;

  v15 = 0;
  v8 = (void (**)(id, uint64_t, void *, _QWORD))a5;
  -[TKTokenDriver createTokenWithSlot:AID:error:](self, "createTokenWithSlot:AID:error:", a3, a4, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    -[TKTokenDriver endpointForToken:](self, "endpointForToken:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tokenID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "instanceID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v11, v13, 0);

    v8 = (void (**)(id, uint64_t, void *, _QWORD))v11;
  }
  else
  {
    TK_LOG_token();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[TKTokenDriver acquireTokenWithSlot:AID:reply:].cold.1();

    ((void (**)(id, uint64_t, void *, id))v8)[2](v8, 0, 0, v10);
  }

}

- (void)releaseTokenWithInstanceID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  TK_LOG_token();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[TKTokenDriver releaseTokenWithInstanceID:].cold.1();

  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v4);

  objc_sync_exit(v5);
}

- (void)configureWithReply:(id)a3
{
  void *v4;
  char v5;
  TKTokenDriverConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  TKTokenDriverConfiguration *v10;
  void *v11;
  void (**v12)(id, uint64_t, _QWORD);

  v12 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TKTokenDriver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = [TKTokenDriverConfiguration alloc];
    -[TKTokenDriver classID](self, "classID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenDriver context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TKTokenDriverConfiguration initWithClassID:configurationConnection:](v6, "initWithClassID:configurationConnection:", v7, v9);

    -[TKTokenDriver delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tokenDriver:configure:", self, v10);

  }
  v12[2](v12, 1, 0);

}

- (id)createTokenWithSlot:(id)a3 AID:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("token driver does not implement any way to create new slot-based token instances");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, v7);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)getTokenWithAttributes:(id)a3 reply:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = CFSTR("token driver does not implement any way to create new token instances");
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v7, 0, v9);

}

- (void)terminate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TKTokenDriver tokenConnections](self, "tokenConnections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "invalidate");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  objc_sync_exit(v3);
}

- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  __int128 v10;
  _OWORD v11[2];

  v5 = a5;
  v8 = a3;
  -[TKTokenDriver context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&a4->var0[4];
  v11[0] = *(_OWORD *)a4->var0;
  v11[1] = v10;
  objc_msgSend(v9, "auditAuthOperation:auditToken:success:", v8, v11, v5);

}

- (NSArray)tokenSessions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v19 = v5;
    v20 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v19);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "sessions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v22;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v22 != v11)
                objc_enumerationMutation(v9);
              v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
              objc_msgSend(v8, "sessions");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKey:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v6);
      v5 = v19;
      v6 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  objc_sync_exit(obj);

  return (NSArray *)v16;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (TKTokenDriverContext)context
{
  return (TKTokenDriverContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (NSMutableDictionary)tokenConnections
{
  return self->_tokenConnections;
}

- (TKSharedResourceSlot)keepAliveResourceSlot
{
  return self->_keepAliveResourceSlot;
}

- (void)setKeepAliveResourceSlot:(id)a3
{
  objc_storeStrong((id *)&self->_keepAliveResourceSlot, a3);
}

- (NSDictionary)extensionAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong((id *)&self->_keepAliveResourceSlot, 0);
  objc_storeStrong((id *)&self->_tokenConnections, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_keepAlive, 0);
}

+ (void)createDriver
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, a3, v5, "extension %{public}@ instantiating driver class %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)endpointForToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "replacing old token with newly acquired: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)acquireTokenWithInstanceID:reply:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, v1, (uint64_t)v1, "failed to instantiate token with instanceID %@, error: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)acquireTokenWithSlot:AID:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "failed to instantiate token with slot, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)releaseTokenWithInstanceID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1B9768000, v0, v1, "An attempt to release nonexistent token with instanceID=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
