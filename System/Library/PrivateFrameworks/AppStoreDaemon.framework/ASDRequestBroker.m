@implementation ASDRequestBroker

- (void)submitRequest:(id)a3 withReplyHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE37E870) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Request %@ is expected to be a ASDRequestDelegate"), v6);
  if (self)
    self = (ASDRequestBroker *)objc_getProperty(self, v8, 16, 1);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__ASDRequestBroker_submitRequest_withReplyHandler___block_invoke;
  v15[3] = &unk_1E37BDB60;
  v10 = v7;
  v16 = v10;
  -[ASDRequestBroker remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __51__ASDRequestBroker_submitRequest_withReplyHandler___block_invoke_2;
  v13[3] = &unk_1E37BFB48;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "submitRequest:delegate:withReplyHandler:", v6, v6, v13);

}

- (void)markRequestAsActive:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    -[ASDRequestBroker activeRequests](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138543618;
      v10 = (id)objc_opt_class();
      v11 = 2114;
      v12 = v3;
      v8 = v10;
      _os_log_debug_impl(&dword_19A03B000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@]: Marking request active: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v3, "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v7);

    objc_sync_exit(v4);
  }

}

- (void)markRequestAsComplete:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    -[ASDRequestBroker activeRequests](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138543618;
      v10 = (id)objc_opt_class();
      v11 = 2114;
      v12 = v3;
      v8 = v10;
      _os_log_debug_impl(&dword_19A03B000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@]: Marking request completed: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v3, "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v7);

    objc_sync_exit(v4);
  }

}

- (id)activeRequests
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)v1[1];
    if (!v2)
    {
      v3 = objc_opt_new();
      v4 = (void *)v1[1];
      v1[1] = v3;

      v2 = (void *)v1[1];
    }
    v5 = v2;
    objc_sync_exit(v1);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (ASDRequestBroker)init
{
  ASDRequestBroker *v2;
  void *v3;
  void *v4;
  SEL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASDRequestBroker;
  v2 = -[ASDRequestBroker init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.appstored.xpc.request"), 4096);
    objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_25);
    objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_37_0);
    +[ASDRequestBroker interface](ASDRequestBroker, "interface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRemoteObjectInterface:", v4);

    objc_msgSend(v3, "resume");
    objc_setProperty_atomic(v2, v5, v3, 16);

  }
  return v2;
}

+ (id)interface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392730);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392790);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_submitRequest_delegate_withReplyHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE37E870);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_submitRequest_delegate_withReplyHandler_, 1, 0);

  return v2;
}

uint64_t __51__ASDRequestBroker_submitRequest_withReplyHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)ASDRequestBroker;
  -[ASDRequestBroker description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendString:", CFSTR(" {"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ASDRequestBroker activeRequests](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "appendString:", CFSTR("\n}"));
  return v4;
}

- (void)cancelAllRequestsWithErrorHandler:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (self)
    self = (ASDRequestBroker *)objc_getProperty(self, v4, 16, 1);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__ASDRequestBroker_cancelAllRequestsWithErrorHandler___block_invoke;
  v12[3] = &unk_1E37BDB60;
  v7 = v5;
  v13 = v7;
  -[ASDRequestBroker remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __54__ASDRequestBroker_cancelAllRequestsWithErrorHandler___block_invoke_2;
  v10[3] = &unk_1E37BDB60;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "cancelAllRequestsWithErrorHandler:", v10);

}

uint64_t __54__ASDRequestBroker_cancelAllRequestsWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__ASDRequestBroker_cancelAllRequestsWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__ASDRequestBroker_submitRequest_withReplyHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeRequests, 0);
}

@end
