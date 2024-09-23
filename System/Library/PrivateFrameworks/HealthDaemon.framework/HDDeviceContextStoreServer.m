@implementation HDDeviceContextStoreServer

- (void)remote_fetchEntriesWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceContextManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "fetchAllEntriesWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__HDDeviceContextStoreServer_remote_fetchEntriesWithCompletion___block_invoke;
    v10[3] = &unk_1E6D01248;
    v10[4] = self;
    objc_msgSend(v7, "hk_map:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v8);
  }

}

id __64__HDDeviceContextStoreServer_remote_fetchEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  _QWORD v17[3];

  v3 = a2;
  v16 = objc_alloc(MEMORY[0x1E0CB65C8]);
  v15 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "syncIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncIdentityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSyncIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);
  objc_msgSend(v3, "productTypeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentOSName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "currentOSVersion");
  else
    memset(v17, 0, sizeof(v17));
  objc_msgSend(v3, "modificationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v16, "initWithType:localDevice:productTypeName:currentOSName:currentOSVersion:modificationDate:", v15, v9, v10, v11, v17, v12);

  return v13;
}

- (void)remote_numberOfDeviceContextsPerDeviceType:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v4 = (void (**)(id, void *, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceContextManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "numberOfDeviceContextsPerDeviceType:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v7)
  {
    v9 = v7;
    v10 = 0;
  }
  else
  {
    v9 = 0;
    v10 = v8;
  }
  v4[2](v4, v9, v10);

}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB4BF0];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "hasRequiredArrayEntitlement:containing:error:", *MEMORY[0x1E0CB59C0], *MEMORY[0x1E0CB4DA0], a4);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB65D0], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB65D0], "clientInterface");
}

@end
