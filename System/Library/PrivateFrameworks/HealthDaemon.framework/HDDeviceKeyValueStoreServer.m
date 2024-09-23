@implementation HDDeviceKeyValueStoreServer

- (HDDeviceKeyValueStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDDeviceKeyValueStoreServer *v11;
  uint64_t v12;
  HKDeviceKeyValueStoreTaskConfiguration *configuration;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDDeviceKeyValueStoreServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    configuration = v11->_configuration;
    v11->_configuration = (HKDeviceKeyValueStoreTaskConfiguration *)v12;

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HDStandardTaskServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceKeyValueStoreManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HDDeviceKeyValueStoreServer;
  -[HDDeviceKeyValueStoreServer dealloc](&v5, sel_dealloc);
}

- (void)remote_fetchEntriesForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 completion:(id)a6
{
  void (**v10)(id, void *, _QWORD);
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v10 = (void (**)(id, void *, _QWORD))a6;
  v11 = a4;
  v12 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceKeyValueStoreManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v14, "fetchEntriesForDomain:key:protectionCategory:error:", v12, v11, a5, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v18;
  if (v15)
  {
    -[HDDeviceKeyValueStoreServer _storageGroupForGroup:]((uint64_t)self, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v10)[2](v10, 0, v16);
  }

}

- (id)_storageGroupForGroup:(uint64_t)a1
{
  void *v2;
  _QWORD v4[5];

  v2 = 0;
  if (a1 && a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__HDDeviceKeyValueStoreServer__storageGroupForGroup___block_invoke;
    v4[3] = &unk_1E6D0FB88;
    v4[4] = a1;
    objc_msgSend(a2, "hk_map:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)remote_mostRecentEntryForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 completion:(id)a6
{
  void (**v10)(id, void *, _QWORD);
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *, _QWORD))a6;
  v11 = a4;
  v12 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceKeyValueStoreManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v14, "mostRecentEntryForDomain:key:protectionCategory:error:", v12, v11, a5, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v20;
  if (v15)
  {
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDeviceKeyValueStoreServer _storageGroupForGroup:]((uint64_t)self, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v19, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v10)[2](v10, 0, v16);
  }

}

- (void)remote_setNumber:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7
{
  void (**v12)(id, uint64_t, id);
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;

  v12 = (void (**)(id, uint64_t, id))a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceKeyValueStoreManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v18 = objc_msgSend(v17, "setNumber:forKey:domainName:protectionCategory:error:", v15, v14, v13, a6, &v20);

  v19 = v20;
  v12[2](v12, v18, v19);

}

- (void)remote_setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7
{
  void (**v12)(id, uint64_t, id);
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;

  v12 = (void (**)(id, uint64_t, id))a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceKeyValueStoreManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v18 = objc_msgSend(v17, "setData:forKey:domainName:protectionCategory:error:", v15, v14, v13, a6, &v20);

  v19 = v20;
  v12[2](v12, v18, v19);

}

- (void)remote_setDate:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7
{
  void (**v12)(id, uint64_t, id);
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;

  v12 = (void (**)(id, uint64_t, id))a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceKeyValueStoreManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v18 = objc_msgSend(v17, "setDate:forKey:domainName:protectionCategory:error:", v15, v14, v13, a6, &v20);

  v19 = v20;
  v12[2](v12, v18, v19);

}

- (void)remote_setString:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 completion:(id)a7
{
  void (**v12)(id, uint64_t, id);
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;

  v12 = (void (**)(id, uint64_t, id))a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceKeyValueStoreManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v18 = objc_msgSend(v17, "setString:forKey:domainName:protectionCategory:error:", v15, v14, v13, a6, &v20);

  v19 = v20;
  v12[2](v12, v18, v19);

}

- (void)remote_startObservingDeviceKeyValueStoreWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceKeyValueStoreManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  v6[2](v6, 1, 0);
}

id __53__HDDeviceKeyValueStoreServer__storageGroupForGroup___block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncIdentityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSyncIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc(MEMORY[0x1E0CB65C8]);
  objc_msgSend(v3, "deviceContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v26, "type");
  objc_msgSend(v3, "deviceContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "syncIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  v9 = objc_msgSend(v7, "isEqual:", v8);
  objc_msgSend(v3, "deviceContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "productTypeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentOSName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "currentOSVersion");
  else
    memset(v28, 0, sizeof(v28));
  objc_msgSend(v3, "deviceContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "modificationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v24, "initWithType:localDevice:productTypeName:currentOSName:currentOSVersion:modificationDate:", v23, v9, v11, v13, v28, v17);

  objc_msgSend(v3, "storageEntries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_map:", &__block_literal_global_238);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB65E0]), "initWithDeviceContext:storageEntries:", v18, v20);
  return v21;
}

id __53__HDDeviceKeyValueStoreServer__storageGroupForGroup___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0CB65D8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v4, "initWithDomain:key:value:modificationDate:", v5, v6, v7, v8);
  return v9;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB4BF8];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "hasRequiredArrayEntitlement:containing:error:", *MEMORY[0x1E0CB59C0], *MEMORY[0x1E0CB4DA0], a4);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  void *v6;

  objc_msgSend(a3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Missing domain for the Key Value Store"));
  return v6 != 0;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB65E8], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB65E8], "clientInterface");
}

- (void)connectionInvalidated
{
  void *v3;
  id v4;

  -[HDStandardTaskServer profile](self, "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceKeyValueStoreManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  HDDeviceKeyValueStoreServer *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__HDDeviceKeyValueStoreServer_deviceKeyValueStoreDidUpdateForStorageGroup_domain___block_invoke;
  v15[3] = &unk_1E6D0FBB0;
  v15[4] = self;
  v8 = v6;
  v16 = v8;
  v9 = v7;
  v17 = v9;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDeviceKeyValueStoreTaskConfiguration domain](self->_configuration, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v9);

  if (v12)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v19 = self;
      v20 = 2114;
      v21 = v9;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, "%{public}@: Notify client of domain %{public}@ updated device key value pairs for storageGroup %{public}@", buf, 0x20u);
    }
    -[HDDeviceKeyValueStoreServer _storageGroupForGroup:]((uint64_t)self, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientRemote_deviceKeyValueStoreDidUpdateForStorageGroup:", v14);

  }
}

void __82__HDDeviceKeyValueStoreServer_deviceKeyValueStoreDidUpdateForStorageGroup_domain___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client domain %{public}@ for updated device key value pairs for storageGroup %{public}@: %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
