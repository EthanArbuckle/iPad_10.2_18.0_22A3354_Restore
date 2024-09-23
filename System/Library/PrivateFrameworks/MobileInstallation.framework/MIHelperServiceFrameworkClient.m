@implementation MIHelperServiceFrameworkClient

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MIHelperServiceFrameworkClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __48__MIHelperServiceFrameworkClient_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)_invalidateObject
{
  void *v2;
  MIHelperServiceFrameworkClient *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MIHelperServiceFrameworkClient xpcConnection](obj, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  -[MIHelperServiceFrameworkClient setXpcConnection:](obj, "setXpcConnection:", 0);
  objc_sync_exit(obj);

}

- (void)dealloc
{
  objc_super v3;

  -[MIHelperServiceFrameworkClient _invalidateObject](self, "_invalidateObject");
  v3.receiver = self;
  v3.super_class = (Class)MIHelperServiceFrameworkClient;
  -[MIHelperServiceFrameworkClient dealloc](&v3, sel_dealloc);
}

- (id)_sharedConnection
{
  MIHelperServiceFrameworkClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_4;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.MobileInstallationHelperService"));
  -[MIHelperServiceFrameworkClient setXpcConnection:](v2, "setXpcConnection:", v4);

  -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    MobileInstallationHelperServiceProtocolInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, v2);
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke;
    v15[3] = &unk_1E6163628;
    objc_copyWeak(&v16, &location);
    -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInterruptionHandler:", v15);

    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke_2;
    v13[3] = &unk_1E6163628;
    objc_copyWeak(&v14, &location);
    -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInvalidationHandler:", v13);

    -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
LABEL_4:
    -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  return v5;
}

void __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateObject");

}

void __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateObject");

}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = (void (**)(id, void *))a3;
  -[MIHelperServiceFrameworkClient _sharedConnection](self, "_sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient _remoteObjectProxyWithErrorHandler:]", 82, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("Failed to get XPC connection"), v6, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);

    v8 = 0;
  }

  return v8;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = (void (**)(id, void *))a3;
  -[MIHelperServiceFrameworkClient _sharedConnection](self, "_sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient _synchronousRemoteObjectProxyWithErrorHandler:]", 93, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("Failed to get XPC connection"), v6, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);

    v8 = 0;
  }

  return v8;
}

- (BOOL)purgeInstallCoordinationPromiseStagingDirectoryForUUID:(id)a3 keepStagingDirectory:(BOOL)a4 error:(id *)a5
{
  uint64_t v5;
  void *v7;
  void *v8;

  _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient purgeInstallCoordinationPromiseStagingDirectoryForUUID:keepStagingDirectory:error:]", 121, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("%s is not available on this platform!"), v5, (uint64_t)"-[MIHelperServiceFrameworkClient purgeInstallCoordinationPromiseStagingDirectoryForUUID:keepStagingDirectory:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a5)
    *a5 = objc_retainAutorelease(v7);

  return 0;
}

- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  _OWORD v21[2];

  v12 = (void *)MEMORY[0x1E0D3AD18];
  v13 = *MEMORY[0x1E0D3AD88];
  v14 = a4;
  v15 = a3;
  objc_msgSend(a5, "objectForKey:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "infoDictionaryArrayToBundleRecordArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_OWORD *)&a6->var0[4];
  v21[0] = *(_OWORD *)a6->var0;
  v21[1] = v18;
  -[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:inTargetDirectory:installationRecords:onBehalfOf:error:](self, "createWrappedAppForInstalledBundleIdentifier:inTargetDirectory:installationRecords:onBehalfOf:error:", v15, v14, v17, v21, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  uint64_t v7;
  void *v9;
  void *v10;

  _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:inTargetDirectory:installationRecords:onBehalfOf:error:]", 156, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("%s is not available on this platform!"), v7, (uint64_t)"-[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:inTargetDirectory:installationRecords:onBehalfOf:error:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a7)
    *a7 = objc_retainAutorelease(v9);

  return 0;
}

- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  _OWORD v20[2];

  v12 = (void *)MEMORY[0x1E0D3AD18];
  v13 = *MEMORY[0x1E0D3AD88];
  v14 = a4;
  v15 = a3;
  objc_msgSend(a5, "objectForKey:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "infoDictionaryArrayToBundleRecordArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v18;
  LOBYTE(a7) = -[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:atTargetURL:installationRecords:onBehalfOf:error:](self, "createWrappedAppForInstalledBundleIdentifier:atTargetURL:installationRecords:onBehalfOf:error:", v15, v14, v17, v20, a7);

  return (char)a7;
}

- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  uint64_t v7;
  void *v9;
  void *v10;

  _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:atTargetURL:installationRecords:onBehalfOf:error:]", 191, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("%s is not available on this platform!"), v7, (uint64_t)"-[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:atTargetURL:installationRecords:onBehalfOf:error:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a7)
    *a7 = objc_retainAutorelease(v9);

  return 0;
}

- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  _OWORD v21[2];

  v12 = (void *)MEMORY[0x1E0D3AD18];
  v13 = *MEMORY[0x1E0D3AD88];
  v14 = a4;
  v15 = a3;
  objc_msgSend(a5, "objectForKey:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "infoDictionaryArrayToBundleRecordArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_OWORD *)&a6->var0[4];
  v21[0] = *(_OWORD *)a6->var0;
  v21[1] = v18;
  -[MIHelperServiceFrameworkClient updateWrappedAppAt:forInstalledBundleIdentifier:installationRecords:onBehalfOf:error:](self, "updateWrappedAppAt:forInstalledBundleIdentifier:installationRecords:onBehalfOf:error:", v15, v14, v17, v21, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  uint64_t v7;
  void *v9;
  void *v10;

  _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient updateWrappedAppAt:forInstalledBundleIdentifier:installationRecords:onBehalfOf:error:]", 226, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("%s is not available on this platform!"), v7, (uint64_t)"-[MIHelperServiceFrameworkClient updateWrappedAppAt:forInstalledBundleIdentifier:installationRecords:onBehalfOf:error:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a7)
    *a7 = objc_retainAutorelease(v9);

  return 0;
}

- (BOOL)removeWrappedAppWithBundleID:(id)a3 atURL:(id)a4 error:(id *)a5
{
  uint64_t v5;
  void *v7;
  void *v8;

  _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient removeWrappedAppWithBundleID:atURL:error:]", 250, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("%s is not available on this platform!"), v5, (uint64_t)"-[MIHelperServiceFrameworkClient removeWrappedAppWithBundleID:atURL:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a5 && v7)
    *a5 = objc_retainAutorelease(v7);

  return 0;
}

- (id)installMacDeveloperAppAtURL:(id)a3 toURL:(id)a4 targetURLType:(unint64_t)a5 error:(id *)a6
{
  uint64_t v6;
  void *v8;
  void *v9;

  _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient installMacDeveloperAppAtURL:toURL:targetURLType:error:]", 274, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("%s is not available on this platform!"), v6, (uint64_t)"-[MIHelperServiceFrameworkClient installMacDeveloperAppAtURL:toURL:targetURLType:error:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a6)
    *a6 = objc_retainAutorelease(v8);

  return 0;
}

- (BOOL)removeDeveloperAppAtURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient removeDeveloperAppAtURL:error:]", 298, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("%s is not available on this platform!"), v4, (uint64_t)"-[MIHelperServiceFrameworkClient removeDeveloperAppAtURL:error:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return 0;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
