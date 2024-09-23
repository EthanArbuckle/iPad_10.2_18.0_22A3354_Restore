@implementation HDAuthorizationStoreWriteServer

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  char v9;

  v5 = a3;
  v6 = *MEMORY[0x1E0CB4800];
  if (objc_msgSend(v5, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB4800], a4))
  {
    objc_msgSend(v5, "valueForEntitlement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  v9 = v8 | objc_msgSend(v5, "hasRequiredArrayEntitlement:containing:error:", v6, *MEMORY[0x1E0CB4DC8], a4);

  return v9 & 1;
}

- (void)remote_setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "authorizationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", v15, v14, v13, a6, v12);

}

- (void)remote_setRequestedAuthorizationForBundleIdentifier:(id)a3 shareTypes:(id)a4 readTypes:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "authorizationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __119__HDAuthorizationStoreWriteServer_remote_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke;
  v18[3] = &unk_1E6CFEE28;
  v19 = v12;
  v16 = v12;
  v17 = (id)objc_msgSend(v15, "enqueueAuthorizationRequestForBundleIdentifier:writeTypes:readTypes:authorizationNeededHandler:completion:", v13, v10, v11, 0, v18);
  objc_msgSend(v15, "handleAuthorizationRequestsForBundleIdentifier:promptHandler:completion:", v13, 0, 0);

}

uint64_t __119__HDAuthorizationStoreWriteServer_remote_setRequestedAuthorizationForBundleIdentifier_shareTypes_readTypes_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_setObjectAuthorizationStatuses:(id)a3 objectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "authorizationManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObjectAuthorizationStatuses:forObjectType:bundleIdentifier:sessionIdentifier:completion:", v16, v15, v14, v13, v12);

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6330], "writeTaskIdentifier");
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
