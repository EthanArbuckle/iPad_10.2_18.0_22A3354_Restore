@implementation C2SessionTLSCache

- (id)sessionForOptions:(id)a3
{
  id v4;
  C2SessionTLSCache *v5;
  void *pinnedSession;
  void **p_pinnedSession;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend(v4, "tlsPinning"))
  {
    p_pinnedSession = (void **)&v5->_pinnedSession;
    pinnedSession = v5->_pinnedSession;
    if (!pinnedSession)
    {
      -[C2SessionTLSCache _createSessionWithTLSPinning:](v5, "_createSessionWithTLSPinning:", 1);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = *p_pinnedSession;
      *p_pinnedSession = (void *)v8;

      pinnedSession = *p_pinnedSession;
    }
  }
  else
  {
    p_pinnedSession = (void **)&v5->_unpinnedSession;
    pinnedSession = v5->_unpinnedSession;
    if (!pinnedSession)
    {
      -[C2SessionTLSCache _createSessionWithTLSPinning:](v5, "_createSessionWithTLSPinning:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v10 = pinnedSession;
  objc_sync_exit(v5);

  objc_msgSend(v10, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (C2SessionTLSCache)init
{
  C2SessionTLSCache *v2;
  C2SessionTLSCache *v3;
  C2Session *pinnedSession;
  C2Session *unpinnedSession;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)C2SessionTLSCache;
  v2 = -[C2SessionTLSCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    pinnedSession = v2->_pinnedSession;
    v2->_pinnedSession = 0;

    unpinnedSession = v3->_unpinnedSession;
    v3->_unpinnedSession = 0;

  }
  return v3;
}

- (id)_createSessionWithTLSPinning:(BOOL)a3
{
  _BOOL8 v3;
  C2RequestOptions *v5;
  C2Session *v6;
  void *v7;
  C2Session *v8;

  v3 = a3;
  v5 = objc_alloc_init(C2RequestOptions);
  -[C2RequestOptions setTlsPinning:](v5, "setTlsPinning:", v3);
  v6 = [C2Session alloc];
  -[C2RequestOptions sessionConfigurationNameWithRouteHost:](v5, "sessionConfigurationNameWithRouteHost:", CFSTR("Unknown"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[C2Session initWithSessionConfigurationName:routeHost:options:sessionDelegate:](v6, "initWithSessionConfigurationName:routeHost:options:sessionDelegate:", v7, CFSTR("Unknown"), v5, self);

  return v8;
}

- (id)underlyingDelegateQueue
{
  return 0;
}

- (void)C2Session:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (C2_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_1, &__block_literal_global_6);
  v9 = C2_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1D4DC3000, v9, OS_LOG_TYPE_ERROR, "Expected NSURLSession for TLS Cache to never become invalid but did with error %@", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionTLSCache.m"), 57, CFSTR("Expected NSURLSession for TLS Cache to never become invalid"));

}

void __57__C2SessionTLSCache_C2Session_didBecomeInvalidWithError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_1;
  C2_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)C2Session:(id)a3 originalHost:(id)a4 updatedRoute:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionTLSCache.m"), 61, CFSTR("Unexpected callback for task-less NSURLSession"));

}

- (C2Session)pinnedSession
{
  return self->_pinnedSession;
}

- (void)setPinnedSession:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedSession, a3);
}

- (C2Session)unpinnedSession
{
  return self->_unpinnedSession;
}

- (void)setUnpinnedSession:(id)a3
{
  objc_storeStrong((id *)&self->_unpinnedSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpinnedSession, 0);
  objc_storeStrong((id *)&self->_pinnedSession, 0);
}

@end
