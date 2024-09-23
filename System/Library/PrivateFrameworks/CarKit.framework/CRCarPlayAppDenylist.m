@implementation CRCarPlayAppDenylist

- (CRCarPlayAppDenylist)init
{
  CRCarPlayAppDenylist *v2;
  CRCarPlayAppDenylist *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSSet *denylistedBundleIDs;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRCarPlayAppDenylist;
  v2 = -[CRCarPlayAppDenylist init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CRCarPlayAppDenylist _setupConnection](v2, "_setupConnection");
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[CRCarPlayAppDenylist _denylistPreference](v3, "_denylistPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    denylistedBundleIDs = v3->_denylistedBundleIDs;
    v3->_denylistedBundleIDs = (NSSet *)v6;

    -[CRCarPlayAppDenylist _requestDenylistUpdate](v3, "_requestDenylistUpdate");
  }
  return v3;
}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC318);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.app.service"), 4096);
  objc_msgSend(v4, "setRemoteObjectInterface:", v3);
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to app denylist service.", v6, 2u);
  }

  objc_msgSend(v4, "resume");
  -[CRCarPlayAppDenylist setConnection:](self, "setConnection:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRCarPlayAppDenylist connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CRCarPlayAppDenylist;
  -[CRCarPlayAppDenylist dealloc](&v4, sel_dealloc);
}

- (id)_denylistPreference
{
  return (id)(id)CFPreferencesCopyAppValue(CRCarPlayAppDenylistPreferenceKey, CRPreferencesNotMigratedDomain);
}

- (BOOL)containsBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CRCarPlayAppDenylist denylistedBundleIDs](self, "denylistedBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    CarGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "app %@ is CarPlay denylisted", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

- (void)_requestDenylistUpdate
{
  void *v2;
  id v3;

  -[CRCarPlayAppDenylist connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "requestDenylistUpdate");
}

void __46__CRCarPlayAppDenylist__requestDenylistUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __46__CRCarPlayAppDenylist__requestDenylistUpdate__block_invoke_cold_1((uint64_t)v2, v3);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSSet)denylistedBundleIDs
{
  return self->_denylistedBundleIDs;
}

- (void)setDenylistedBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_denylistedBundleIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denylistedBundleIDs, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__CRCarPlayAppDenylist__requestDenylistUpdate__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "CarPlay denylist service error: %@", (uint8_t *)&v2, 0xCu);
}

@end
