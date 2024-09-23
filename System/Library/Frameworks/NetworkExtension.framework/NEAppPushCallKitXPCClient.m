@implementation NEAppPushCallKitXPCClient

- (NEAppPushCallKitXPCClient)init
{
  NEAppPushCallKitXPCClient *v2;
  NEAppPushCallKitXPCClient *v3;
  NSXPCConnection *connection;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NEAppPushCallKitXPCClient;
  v2 = -[NEAppPushCallKitXPCClient init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

    v3->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v3);
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__NEAppPushCallKitXPCClient_init__block_invoke;
    v8[3] = &unk_1E3CC3980;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("com.apple.pushkit.launch.voip", &v3->_callKitToken, v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  notify_cancel(self->_callKitToken);
  v3.receiver = self;
  v3.super_class = (Class)NEAppPushCallKitXPCClient;
  -[NEAppPushCallKitXPCClient dealloc](&v3, sel_dealloc);
}

- (void)voipNetworkExtensionPayloadReceived:(id)a3 mustPostCall:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  _BYTE v19[24];
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 138412546;
    *(_QWORD *)&v19[4] = self;
    *(_WORD *)&v19[12] = 2112;
    *(_QWORD *)&v19[14] = v7;
    _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, "%@ callkit delivered payload %@", v19, 0x16u);
  }

  v10 = v7;
  v11 = v8;
  v12 = objc_opt_self();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("ap-push-config-uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      +[NEAppPushManager loadedManagers]();
      v15 = objc_claimAutoreleasedReturnValue();
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if (v15)
      {
        if (v17)
        {
          v18 = -[NSObject count](v15, "count");
          *(_DWORD *)v19 = 134217984;
          *(_QWORD *)&v19[4] = v18;
          _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "loaded manager count %zd", v19, 0xCu);
        }

        *(_QWORD *)v19 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v19[8] = 3221225472;
        *(_QWORD *)&v19[16] = __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke;
        v20 = &unk_1E3CC0808;
        v21 = v14;
        v24 = v12;
        v22 = v13;
        v23 = v11;
        -[NSObject enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v19);

        v16 = v21;
      }
      else if (v17)
      {
        *(_WORD *)v19 = 0;
        _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "no loaded managers found", v19, 2u);
      }

    }
    else
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v19 = 138412546;
        *(_QWORD *)&v19[4] = v12;
        *(_WORD *)&v19[12] = 2112;
        *(_QWORD *)&v19[14] = CFSTR("ap-push-config-uuid");
        _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "%@ received payload without [%@] key", v19, 0x16u);
      }
    }

  }
  else
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 138412290;
      *(_QWORD *)&v19[4] = v12;
      _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "%@ received invalid incoming call payload", v19, 0xCu);
    }
  }

}

- (void)voipNetworkExtensionRegistrationFailed
{
  NSObject *v3;
  int v4;
  NEAppPushCallKitXPCClient *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@ registration with CallKit failed", (uint8_t *)&v4, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __33__NEAppPushCallKitXPCClient_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_unfair_lock_s *WeakRetained;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "com.apple.pushkit.launch.voip";
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "Received notification %s", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    objc_msgSend(*(id *)(v4 + 16), "invalidate");
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
    -[NEAppPushCallKitXPCClient setConnection:](v4);
    -[NEAppPushCallKitXPCClient registerVoIPMessagePayload](v4);
  }

}

- (void)setConnection:(uint64_t)a1
{
  os_unfair_lock_s *v2;
  id *v3;
  uint64_t v4;

  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v4 = *(_QWORD *)(a1 + 16);
  v3 = (id *)(a1 + 16);
  if (v4)
    objc_storeStrong(v3, 0);
  os_unfair_lock_unlock(v2);

}

- (void)registerVoIPMessagePayload
{
  os_unfair_lock_s *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  __int128 buf;
  void (*v19)(uint64_t);
  void *v20;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = *(void **)(a1 + 16);
    if (!v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.callkit.networkextension.voip"), 0);
      v5 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v4;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE426168);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 16), "setExportedInterface:", v6);

      objc_msgSend(*(id *)(a1 + 16), "setExportedObject:", a1);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE42B590);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 16), "setRemoteObjectInterface:", v7);

      objc_initWeak(&location, (id)a1);
      v8 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v19 = __39__NEAppPushCallKitXPCClient_connection__block_invoke;
      v20 = &unk_1E3CC39A8;
      objc_copyWeak(v21, &location);
      objc_msgSend(*(id *)(a1 + 16), "setInterruptionHandler:", &buf);
      v12 = v8;
      v13 = 3221225472;
      v14 = __39__NEAppPushCallKitXPCClient_connection__block_invoke_13;
      v15 = &unk_1E3CC39A8;
      objc_copyWeak(&v16, &location);
      objc_msgSend(*(id *)(a1 + 16), "setInvalidationHandler:", &v12);
      objc_msgSend(*(id *)(a1 + 16), "resume", v12, v13, v14, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
      v3 = *(void **)(a1 + 16);
    }
    v9 = v3;
    os_unfair_lock_unlock(v2);
    objc_msgSend(v9, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerVoIPNetworkExtension");

    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@ registered with CallKit", (uint8_t *)&buf, 0xCu);
    }

  }
}

void __39__NEAppPushCallKitXPCClient_connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_unfair_lock_s *WeakRetained;
  uint64_t v4;
  uint8_t v5[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "CallKit xpc connection interrupted", v5, 2u);
  }

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    objc_msgSend(*(id *)(v4 + 16), "invalidate");
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
    -[NEAppPushCallKitXPCClient setConnection:](v4);
  }

}

void __39__NEAppPushCallKitXPCClient_connection__block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "CallKit xpc connection invalidated", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    -[NEAppPushCallKitXPCClient setConnection:]((uint64_t)WeakRetained);

}

@end
