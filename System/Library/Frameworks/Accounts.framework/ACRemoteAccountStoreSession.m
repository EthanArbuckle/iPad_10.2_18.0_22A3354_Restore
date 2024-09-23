@implementation ACRemoteAccountStoreSession

- (void)dealloc
{
  ACAccountStoreClientSideListener *clientSideListener;
  objc_super v4;

  clientSideListener = self->_clientSideListener;
  self->_clientSideListener = 0;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)ACRemoteAccountStoreSession;
  -[ACRemoteAccountStoreSession dealloc](&v4, sel_dealloc);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ACRemoteAccountStoreSession _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ACRemoteAccountStoreSession _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_connection
{
  os_unfair_lock_s *p_connectionLock;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  id (*v7)(uint64_t);
  void *v8;
  ACRemoteAccountStoreSession *v9;

  p_connectionLock = &self->_connectionLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __42__ACRemoteAccountStoreSession__connection__block_invoke;
  v8 = &unk_1E4894300;
  v9 = self;
  v3 = v6;
  os_unfair_lock_lock(p_connectionLock);
  v7((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_connectionLock);

  return v4;
}

id __42__ACRemoteAccountStoreSession__connection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void (**v5)(void);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (!v3)
  {
    v4 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__ACRemoteAccountStoreSession__connection__block_invoke_2;
    v20[3] = &unk_1E48942D8;
    v20[4] = v2;
    v5 = (void (**)(void))MEMORY[0x1A858A038](v20);
    v5[2]();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    +[ACRemoteAccountStoreInterface XPCInterface](ACRemoteAccountStoreInterface, "XPCInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRemoteObjectInterface:", v9);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B9C50);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedInterface:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __42__ACRemoteAccountStoreSession__connection__block_invoke_3;
    v17[3] = &unk_1E4892B00;
    objc_copyWeak(&v18, &location);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInterruptionHandler:", v17);
    v12 = v4;
    v13 = 3221225472;
    v14 = __42__ACRemoteAccountStoreSession__connection__block_invoke_52;
    v15 = &unk_1E4892B00;
    objc_copyWeak(&v16, &location);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInvalidationHandler:", &v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume", v12, v13, v14, v15);
    objc_msgSend(*(id *)(a1 + 32), "_locked_configureRemoteAccountStoreWithConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return v3;
}

ACTrackedXPCConnection *__42__ACRemoteAccountStoreSession__connection__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  ACTrackedXPCConnection *v3;
  ACTrackedXPCConnection *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = [ACTrackedXPCConnection alloc];
  if (v2)
    v4 = -[ACTrackedXPCConnection initWithListenerEndpoint:](v3, "initWithListenerEndpoint:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  else
    v4 = -[ACTrackedXPCConnection initWithMachServiceName:options:](v3, "initWithMachServiceName:options:", CFSTR("com.apple.accountsd.accountmanager"), 0);
  return v4;
}

- (void)_locked_configureRemoteAccountStoreWithConnection:(id)a3
{
  NSString *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACRemoteAccountStoreSession.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  os_unfair_lock_assert_owner(&self->_connectionLock);
  v5 = self->_effectiveBundleID;
  if (v5)
    -[ACRemoteAccountStoreSession _locked_connection:setEffectiveBundleID:](self, "_locked_connection:setEffectiveBundleID:", v7, v5);
  if (!self->_notificationsEnabled)
    -[ACRemoteAccountStoreSession _locked_connection:setNotificationsEnabled:](self, "_locked_connection:setNotificationsEnabled:", v7, 0);

}

- (void)setEffectiveBundleID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *effectiveBundleID;
  os_unfair_lock_s *p_connectionLock;
  _QWORD *v8;
  _QWORD v9[2];
  _QWORD *(*v10)(uint64_t);
  void *v11;
  ACRemoteAccountStoreSession *v12;
  id v13;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_effectiveBundleID, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    effectiveBundleID = self->_effectiveBundleID;
    self->_effectiveBundleID = v5;

    p_connectionLock = &self->_connectionLock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v10 = __52__ACRemoteAccountStoreSession_setEffectiveBundleID___block_invoke;
    v11 = &unk_1E48925B8;
    v12 = self;
    v13 = v4;
    v8 = v9;
    os_unfair_lock_lock(p_connectionLock);
    v10((uint64_t)v8);
    os_unfair_lock_unlock(p_connectionLock);

  }
}

_QWORD *__52__ACRemoteAccountStoreSession_setEffectiveBundleID___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  v3 = result[1];
  if (v3)
    return (_QWORD *)objc_msgSend(result, "_locked_connection:setEffectiveBundleID:", v3, *(_QWORD *)(a1 + 40));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveBundleID, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_clientSideListener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_locked_connection:(id)a3 setEffectiveBundleID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACRemoteAccountStoreSession.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  os_unfair_lock_assert_owner(&self->_connectionLock);
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_62;
  v12[3] = &unk_1E4894350;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "setClientBundleID:withHandler:", v10, v12);

}

- (ACRemoteAccountStoreSession)init
{
  return -[ACRemoteAccountStoreSession initWithListenerEndpoint:](self, "initWithListenerEndpoint:", 0);
}

- (ACRemoteAccountStoreSession)initWithListenerEndpoint:(id)a3
{
  id v5;
  ACRemoteAccountStoreSession *v6;
  ACRemoteAccountStoreSession *v7;
  ACAccountStoreClientSideListener *v8;
  ACAccountStoreClientSideListener *clientSideListener;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACRemoteAccountStoreSession;
  v6 = -[ACRemoteAccountStoreSession init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_connectionLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v7->_notificationsEnabled = 1;
    v8 = objc_alloc_init(ACAccountStoreClientSideListener);
    clientSideListener = v7->_clientSideListener;
    v7->_clientSideListener = v8;

  }
  return v7;
}

void __42__ACRemoteAccountStoreSession__connection__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _ACLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2BCD000, v2, OS_LOG_TYPE_DEFAULT, "\"The connection to ACDAccountStore was interrupted.\", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setConnectionInterrupted");

}

void __42__ACRemoteAccountStoreSession__connection__block_invoke_52(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _ACLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2BCD000, v2, OS_LOG_TYPE_DEFAULT, "\"The connection to ACDAccountStore was invalidated.\", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setConnectionInvalidated");

}

- (void)setNotificationsEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_connectionLock;
  _QWORD *v4;
  _QWORD v5[2];
  _QWORD *(*v6)(uint64_t);
  void *v7;
  ACRemoteAccountStoreSession *v8;
  BOOL v9;

  if (self->_notificationsEnabled != a3)
  {
    self->_notificationsEnabled = a3;
    p_connectionLock = &self->_connectionLock;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v6 = __55__ACRemoteAccountStoreSession_setNotificationsEnabled___block_invoke;
    v7 = &unk_1E4894328;
    v8 = self;
    v9 = a3;
    v4 = v5;
    os_unfair_lock_lock(p_connectionLock);
    v6((uint64_t)v4);
    os_unfair_lock_unlock(p_connectionLock);

  }
}

_QWORD *__55__ACRemoteAccountStoreSession_setNotificationsEnabled___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  v3 = result[1];
  if (v3)
    return (_QWORD *)objc_msgSend(result, "_locked_connection:setNotificationsEnabled:", v3, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_setConnectionInterrupted
{
  os_unfair_lock_s *p_connectionLock;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  ACRemoteAccountStoreSession *v7;

  p_connectionLock = &self->_connectionLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __56__ACRemoteAccountStoreSession__setConnectionInterrupted__block_invoke;
  v6 = &unk_1E4892AD8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_connectionLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);

}

void __56__ACRemoteAccountStoreSession__setConnectionInterrupted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)_setConnectionInvalidated
{
  os_unfair_lock_s *p_connectionLock;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  ACRemoteAccountStoreSession *v7;

  p_connectionLock = &self->_connectionLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __56__ACRemoteAccountStoreSession__setConnectionInvalidated__block_invoke;
  v6 = &unk_1E4892AD8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_connectionLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);

}

void __56__ACRemoteAccountStoreSession__setConnectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

void __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_62(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_62_cold_1(a1, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void)_locked_connection:(id)a3 setNotificationsEnabled:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACRemoteAccountStoreSession.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  os_unfair_lock_assert_owner(&self->_connectionLock);
  objc_msgSend(v8, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNotificationsEnabled:", 0);

}

- (id)remoteObjectProxy
{
  void *v2;
  void *v3;

  -[ACRemoteAccountStoreSession _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (NSString)effectiveBundleID
{
  return self->_effectiveBundleID;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

void __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, a2, a3, "\"Error setting the client's bundle ID: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __71__ACRemoteAccountStoreSession__locked_connection_setEffectiveBundleID___block_invoke_62_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1A2BCD000, a2, OS_LOG_TYPE_DEBUG, "\"Spoofed the client's bundle ID to: %@\", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
