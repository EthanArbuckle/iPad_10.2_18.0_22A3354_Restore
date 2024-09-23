@implementation MRUIController

- (MRUIController)init
{
  MRUIController *v2;
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  MRUIController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)MRUIController;
  v2 = -[MRUIController init](&v5, sel_init);
  if (v2)
  {
    _MRLogForCategory(0xBuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = v2;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> Initializing external controller.", buf, 0xCu);
    }

    v2->_lock._os_unfair_lock_opaque = 0;
    *(_DWORD *)&v2->_hasLockScreenControlsAssertion = 0;
    *(_WORD *)&v2->_hasNowPlayingActivityAssertion = 256;
  }
  return v2;
}

- (void)_restoreState
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  MRUIController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[MRUIController hasUIAssertions](self, "hasUIAssertions"))
  {
    -[MRUIController xpcConnection](self, "xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__MRUIController__restoreState__block_invoke;
    v7[3] = &unk_1E30C6918;
    v7[4] = self;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (-[MRUIController hasLockScreenControlsAssertion](self, "hasLockScreenControlsAssertion"))
        objc_msgSend(v4, "acquireLockScreenControlsAssertionWithReply:", &__block_literal_global_92);
      if (-[MRUIController hasQuickControlsAssertion](self, "hasQuickControlsAssertion"))
        objc_msgSend(v4, "acquireQuickControlsAssertionWithReply:", &__block_literal_global_37_0);
      if (-[MRUIController hasScreenMirroringQuickControlsAssertion](self, "hasScreenMirroringQuickControlsAssertion"))
        objc_msgSend(v4, "acquireScreenMirroringQuickControlsAssertionWithReply:", &__block_literal_global_38_0);
    }
    else
    {
      _MRLogForCategory(0xBuLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v9 = self;
        _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> Failed to get server proxy to restore state. Giving up.", buf, 0xCu);
      }

      -[MRUIController setShouldRestoreState:](self, "setShouldRestoreState:", 0);
      -[MRUIController xpcConnection](self, "xpcConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidate");

    }
  }
}

void __31__MRUIController__restoreState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xBuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> Server proxy error %@.", (uint8_t *)&v6, 0x16u);
  }

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

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRUIController][C] <%p> Deallocated while still holding lock screen assertion.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (BOOL)hasUIAssertions
{
  return -[MRUIController hasQuickControlsAssertion](self, "hasQuickControlsAssertion")
      || -[MRUIController hasScreenMirroringQuickControlsAssertion](self, "hasScreenMirroringQuickControlsAssertion")
      || -[MRUIController hasLockScreenControlsAssertion](self, "hasLockScreenControlsAssertion")
      || -[MRUIController hasRouteRecommendationAssertion](self, "hasRouteRecommendationAssertion");
}

- (NSXPCConnection)xpcConnection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  NSXPCConnection *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  NSXPCConnection *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    MRGetSharedService();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UIServerEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v6);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3063A8);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE306408);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4D120], "proxyWithObject:protocol:", self, &unk_1EE3063A8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedObject:](v7, "setExportedObject:", v10);

      -[NSXPCConnection setExportedInterface:](v7, "setExportedInterface:", v8);
      -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v9);
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __31__MRUIController_xpcConnection__block_invoke;
      v17[3] = &unk_1E30C6AA0;
      objc_copyWeak(&v18, &location);
      -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v17);
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __31__MRUIController_xpcConnection__block_invoke_134;
      v15[3] = &unk_1E30C6AA0;
      objc_copyWeak(&v16, &location);
      -[NSXPCConnection setInvalidationHandler:](v7, "setInvalidationHandler:", v15);
      -[NSXPCConnection resume](v7, "resume");
      v12 = self->_xpcConnection;
      self->_xpcConnection = v7;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
    else
    {
      _MRLogForCategory(0xBuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MRUIController xpcConnection].cold.1();
    }

    xpcConnection = self->_xpcConnection;
  }
  v13 = xpcConnection;
  os_unfair_lock_unlock(p_lock);
  return v13;
}

void __31__MRUIController_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _MRLogForCategory(0xBuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = WeakRetained;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> XPC interrupted.", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

  }
}

void __31__MRUIController_xpcConnection__block_invoke_134(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  os_unfair_lock_s *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _MRLogForCategory(0xBuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = WeakRetained;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> XPC invalidated.", (uint8_t *)&v4, 0xCu);
    }

    os_unfair_lock_lock(WeakRetained + 4);
    v3 = *(void **)&WeakRetained[6]._os_unfair_lock_opaque;
    *(_QWORD *)&WeakRetained[6]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(WeakRetained + 4);
    if (-[os_unfair_lock_s shouldRestoreState](WeakRetained, "shouldRestoreState"))
      -[os_unfair_lock_s _restoreState](WeakRetained, "_restoreState");
  }

}

- (MRUIServerXPCProtocol)server
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[MRUIController xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__MRUIController_server__block_invoke;
  v6[3] = &unk_1E30C6918;
  v6[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRUIServerXPCProtocol *)v4;
}

void __24__MRUIController_server__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xBuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> Server proxy error %@.", (uint8_t *)&v6, 0x16u);
  }

}

- (void)acquireLockScreenControlsAssertion
{
  id v3;

  -[MRUIController setHasLockScreenControlsAssertion:](self, "setHasLockScreenControlsAssertion:", 1);
  -[MRUIController server](self, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acquireLockScreenControlsAssertionWithReply:", &__block_literal_global_135);

}

- (void)releaseLockScreenControlsAssertion
{
  id v3;

  -[MRUIController setHasLockScreenControlsAssertion:](self, "setHasLockScreenControlsAssertion:", 0);
  -[MRUIController server](self, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseLockScreenControlsAssertionWithReply:", &__block_literal_global_136_1);

}

- (id)acquireQuickControlsAssertion
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__39;
  v11 = __Block_byref_object_dispose__39;
  v12 = 0;
  -[MRUIController setHasQuickControlsAssertion:](self, "setHasQuickControlsAssertion:", 1);
  -[MRUIController server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MRUIController_acquireQuickControlsAssertion__block_invoke;
  v6[3] = &unk_1E30CEBB0;
  v6[4] = &v7;
  objc_msgSend(v3, "acquireQuickControlsAssertionWithReply:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__MRUIController_acquireQuickControlsAssertion__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)releaseQuickControlsAssertion
{
  id v3;

  -[MRUIController setHasQuickControlsAssertion:](self, "setHasQuickControlsAssertion:", 0);
  -[MRUIController server](self, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseQuickControlsAssertionWithReply:", &__block_literal_global_137_0);

}

- (void)acquireScreenMirroringQuickControlsAssertion
{
  id v3;

  -[MRUIController setHasScreenMirroringQuickControlsAssertion:](self, "setHasScreenMirroringQuickControlsAssertion:", 1);
  -[MRUIController server](self, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acquireScreenMirroringQuickControlsAssertionWithReply:", &__block_literal_global_138_1);

}

- (void)releaseScreenMirroringQuickControlsAssertion
{
  id v3;

  -[MRUIController setHasScreenMirroringQuickControlsAssertion:](self, "setHasScreenMirroringQuickControlsAssertion:", 0);
  -[MRUIController server](self, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseScreenMirroringQuickControlsAssertionWithReply:", &__block_literal_global_139);

}

- (id)contextForActivityIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__39;
  v13 = __Block_byref_object_dispose__39;
  v14 = 0;
  -[MRUIController server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__MRUIController_contextForActivityIdentifier___block_invoke;
  v8[3] = &unk_1E30CEBB0;
  v8[4] = &v9;
  objc_msgSend(v5, "contextForActivityIdentifier:reply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __47__MRUIController_contextForActivityIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRUIController setHasRouteRecommendationAssertion:](self, "setHasRouteRecommendationAssertion:", 1);
  -[MRUIController server](self, "server");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireRouteRecommendationAssertionForIdentifiers:withReply:", v4, &__block_literal_global_140_2);

}

- (void)releaseRouteRecommendationAssertion
{
  id v3;

  -[MRUIController setHasRouteRecommendationAssertion:](self, "setHasRouteRecommendationAssertion:", 0);
  -[MRUIController server](self, "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseRouteRecommendationAssertionWithReply:", &__block_literal_global_141_1);

}

- (void)acquireNowPlayingActivityAssertionForRouteIdentifier:(id)a3 withDuration:(int64_t)a4 preferredState:(int64_t)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if (!a4)
    -[MRUIController setHasNowPlayingActivityAssertion:](self, "setHasNowPlayingActivityAssertion:", 1);
  -[MRUIController server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acquireNowPlayingActivityAssertionForRouteIdentifier:withDuration:preferredState:withReply:", v9, a4, a5, &__block_literal_global_142_1);

}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)hasLockScreenControlsAssertion
{
  return self->_hasLockScreenControlsAssertion;
}

- (void)setHasLockScreenControlsAssertion:(BOOL)a3
{
  self->_hasLockScreenControlsAssertion = a3;
}

- (BOOL)hasQuickControlsAssertion
{
  return self->_hasQuickControlsAssertion;
}

- (void)setHasQuickControlsAssertion:(BOOL)a3
{
  self->_hasQuickControlsAssertion = a3;
}

- (BOOL)hasScreenMirroringQuickControlsAssertion
{
  return self->_hasScreenMirroringQuickControlsAssertion;
}

- (void)setHasScreenMirroringQuickControlsAssertion:(BOOL)a3
{
  self->_hasScreenMirroringQuickControlsAssertion = a3;
}

- (BOOL)hasRouteRecommendationAssertion
{
  return self->_hasRouteRecommendationAssertion;
}

- (void)setHasRouteRecommendationAssertion:(BOOL)a3
{
  self->_hasRouteRecommendationAssertion = a3;
}

- (BOOL)hasNowPlayingActivityAssertion
{
  return self->_hasNowPlayingActivityAssertion;
}

- (void)setHasNowPlayingActivityAssertion:(BOOL)a3
{
  self->_hasNowPlayingActivityAssertion = a3;
}

- (BOOL)shouldRestoreState
{
  return self->_shouldRestoreState;
}

- (void)setShouldRestoreState:(BOOL)a3
{
  self->_shouldRestoreState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)xpcConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRUIController][C] <%p> Received nil XPC endpoint. Failing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
