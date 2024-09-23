@implementation _GEONetworkDefaultsRemoteProxy

- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *global_queue;
  _QWORD v18[10];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v7 = &__block_literal_global_93;
  if (v6)
    v7 = v6;
  v23 = 0x2020000000;
  v24 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v18[5] = MEMORY[0x1E0C809B0];
  v18[6] = 3221225472;
  v18[7] = __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_2;
  v18[8] = &unk_1E1C0C750;
  v20 = &v21;
  v18[9] = self;
  v9 = v7;
  v19 = v9;
  geo_isolate_sync_data();
  v10 = *((unsigned __int8 *)v22 + 24);
  GEOGetNetworkDefaultsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Already updating, not sending request.", buf, 2u);
    }
  }
  else
  {
    if (v12)
    {
      if (a3 > 5)
        v13 = CFSTR("<invalid>");
      else
        v13 = off_1E1C0C7C0[a3];
      *(_DWORD *)buf = 138412290;
      v30 = v13;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Requesting update for reason %@.", buf, 0xCu);
    }

    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 2, CFSTR("NetworkDefaults"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v28[0] = CFSTR("defaults.updateNetworkDefaults");
    v27[0] = CFSTR("message");
    v27[1] = CFSTR("userInfo");
    v25 = CFSTR("reason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    global_queue = (void *)geo_get_global_queue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __84___GEONetworkDefaultsRemoteProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_175;
    v18[3] = &unk_1E1C0C7A0;
    v18[4] = self;
    -[NSObject sendDictionary:withReply:handler:](v11, "sendDictionary:withReply:handler:", v16, global_queue, v18);

  }
  _Block_object_dispose(&v21, 8);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_GEONetworkDefaultsRemoteProxy)init
{
  _GEONetworkDefaultsRemoteProxy *v2;
  uint64_t v3;
  geo_isolater *isolation;
  NSObject *global_queue;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GEONetworkDefaultsRemoteProxy;
  v2 = -[_GEONetworkDefaultsRemoteProxy init](&v10, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    objc_initWeak(&location, v2);
    global_queue = geo_get_global_queue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38___GEONetworkDefaultsRemoteProxy_init__block_invoke;
    v7[3] = &unk_1E1C05280;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("com.apple.GeoServices.internal.networkDefaultsChanged", &v2->_configChangedToken, global_queue, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_configChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)_GEONetworkDefaultsRemoteProxy;
  -[_GEONetworkDefaultsRemoteProxy dealloc](&v3, sel_dealloc);
}

- (unint64_t)_updateReason
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4);

  if (v5)
    return 0;
  else
    return 5;
}

- (void)_networkDefaultsDidChange
{
  NSObject *v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  uint8_t buf[16];

  GEOGetNetworkDefaultsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Received network defaults change notification. Informing delegate.", buf, 2u);
  }

  v6 = 0;
  readNetworkDefaultsFromFile(&v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "serverProxy:networkDefaultsDidChange:", self, v4);

}

- (void)updateNetworkDefaults:(id)a3
{
  -[_GEONetworkDefaultsRemoteProxy updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", 4, a3);
}

- (_GEONetworkDefaultsServerProxyDelegate)delegate
{
  return (_GEONetworkDefaultsServerProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
