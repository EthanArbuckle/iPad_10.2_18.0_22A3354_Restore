@implementation HDEntitlementStoreServer

- (void)remote_fetchContainerAppExtensionEntitlementsWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id, _QWORD))a3;
  if (v4)
  {
    -[HDStandardTaskServer client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "process");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "isExtension");
      v8 = (id)MEMORY[0x1E0C9AA70];
      if (v7)
      {
        v9 = (void *)MEMORY[0x1E0CA5890];
        -[HDStandardTaskServer client](self, "client");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "connection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hk_appExtensionContainerBundleForConnection:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB6F90], "_allowedEntitlementsSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "entitlementValuesForKeys:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "rawValues");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v15)
            v17 = (void *)v15;
          else
            v17 = v8;
          v8 = v17;

        }
        else
        {
          _HKInitializeLogging();
          v19 = (void *)*MEMORY[0x1E0CB52C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            -[HDStandardTaskServer client](self, "client");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 138543362;
            v23 = v21;
            _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "No container app bundle found for client %{public}@", (uint8_t *)&v22, 0xCu);

          }
          v8 = 0;
        }

      }
      v4[2](v4, v8, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("No client connection"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, void *))v4)[2](v4, 0, v18);

    }
  }

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6688], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
