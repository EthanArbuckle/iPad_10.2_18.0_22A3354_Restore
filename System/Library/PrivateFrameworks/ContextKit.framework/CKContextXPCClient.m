@implementation CKContextXPCClient

+ (id)xpcConnection
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)_connection;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "invalidationHandler"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = (id)_connection;
    v7 = (void *)objc_msgSend(v2, "newXpcConnection");
    v8 = (void *)_connection;
    _connection = (uint64_t)v7;

    v9 = v7;
    v4 = v9;
  }
  objc_sync_exit(v2);

  objc_msgSend(v6, "invalidate");
  return v4;
}

+ (void)initialize
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not register configuration update handler; status=%u",
    (uint8_t *)v1,
    8u);
}

void __32__CKContextXPCClient_initialize__block_invoke()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = CFSTR("com.apple.contextkit.configurationChanged");
    _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Received %@", buf, 0xCu);
  }
  +[CKContextXPCClient invalidateXpcConnection](CKContextXPCClient, "invalidateXpcConnection");
  dispatch_get_global_queue(17, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (id)kUpdateNotificationListeners;
  objc_sync_enter(v1);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)kUpdateNotificationListeners;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_initWeak((id *)buf, *(id *)(*((_QWORD *)&v9 + 1) + 8 * v6));
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __32__CKContextXPCClient_initialize__block_invoke_4;
        block[3] = &unk_1E462F5E0;
        objc_copyWeak(&v8, (id *)buf);
        dispatch_async(v0, block);
        objc_destroyWeak(&v8);
        objc_destroyWeak((id *)buf);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  objc_sync_exit(v1);
}

void __32__CKContextXPCClient_initialize__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didReceiveCKContextServiceUpdateNotification");

}

+ (void)registerForServiceUpdateNotifications:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)kUpdateNotificationListeners;
  objc_sync_enter(v3);
  objc_msgSend((id)kUpdateNotificationListeners, "addObject:", v4);
  objc_sync_exit(v3);

}

+ (id)invalidateAndGetNewXpcConnection
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)_connection;
  v4 = (void *)objc_msgSend(v2, "newXpcConnection");
  v5 = (void *)_connection;
  _connection = (uint64_t)v4;

  v6 = v4;
  if (v3 == v6)
  {
    v7 = v3;
    objc_sync_exit(v2);

  }
  else
  {
    objc_sync_exit(v2);

    objc_msgSend(v3, "invalidate");
    v7 = v6;
  }

  return v7;
}

+ (void)invalidateXpcConnection
{
  id v2;
  void *v3;
  id v4;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)_connection;
  _connection = 0;
  v4 = v3;

  objc_sync_exit(v2);
  objc_msgSend(v4, "invalidate");

}

+ (id)newXpcConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20[2];
  id location;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.siri.context.service"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE652EB8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_ancestorsForTopics_withReply_, 0, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_findCategorizationsForRequest_withReply_, 0, 0);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_findCategorizationsForRequest_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_findCategorizationsForRequest_withReply_, 1, 1);

  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  objc_initWeak(&location, v3);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38__CKContextXPCClient_newXpcConnection__block_invoke;
  v19[3] = &unk_1E462F608;
  objc_copyWeak(v20, &location);
  v20[1] = a1;
  objc_msgSend(v3, "setInvalidationHandler:", v19);
  objc_msgSend(v3, "resume");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "New XPC Connection: %@", buf, 0xCu);
  }
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  return v3;
}

void __38__CKContextXPCClient_newXpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = *(id *)(a1 + 40);
    objc_sync_enter(v3);
    if ((id)_connection == v4)
    {
      _connection = 0;

    }
    objc_sync_exit(v3);

    WeakRetained = v4;
  }

}

+ (id)isXPCConnectionError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  v5 = objc_msgSend(v3, "code");
  if (v5 == 4099)
  {
    v6 = 1;
  }
  else
  {
    if (v5 != 4097)
    {
LABEL_11:
      v18 = 0;
      goto LABEL_16;
    }
    v6 = 0;
  }
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (!v8)
    goto LABEL_11;
  v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v9)
      +[CKContextXPCClient isXPCConnectionError:].cold.1((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);
    +[CKContextXPCClient invalidateAndGetNewXpcConnection](CKContextXPCClient, "invalidateAndGetNewXpcConnection");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
      +[CKContextXPCClient isXPCConnectionError:].cold.2((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);
    +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
LABEL_16:

  return v18;
}

+ (void)isXPCConnectionError:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "XPC connection invalid, establishing new connection: %@", a5, a6, a7, a8, 2u);
}

+ (void)isXPCConnectionError:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "XPC connection interrupted, trying again: %@", a5, a6, a7, a8, 2u);
}

@end
