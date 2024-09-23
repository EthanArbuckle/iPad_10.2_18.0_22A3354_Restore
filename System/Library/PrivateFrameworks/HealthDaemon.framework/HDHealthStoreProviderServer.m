@implementation HDHealthStoreProviderServer

- (id)_profileManager
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "profile");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "daemon");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "profileManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_clientMayAccessProfile:(void *)result
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v3 = a2;
    objc_msgSend(v2, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isAuthorizedToAccessProfile:", v3);

    return (void *)v5;
  }
  return result;
}

- (void)remote_fetchForIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend(v11, "isPrimaryStoreIdentifier"))
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    -[HDHealthStoreProviderServer _profileManager](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "profileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profileForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (-[HDHealthStoreProviderServer _clientMayAccessProfile:](self, v9) & 1) != 0)
    {
      v6[2](v6, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_healthStoreUnavailableError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v10);

    }
  }

}

- (void)remote_fetchAvailableIdentifiersWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[HDHealthStoreProviderServer _profileManager](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allProfileIdentifiers");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HDStandardTaskServer client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);

  if (v7)
  {
    v8 = v11;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__HDHealthStoreProviderServer_remote_fetchAvailableIdentifiersWithCompletion___block_invoke;
    v13[3] = &unk_1E6CEB220;
    v13[4] = self;
    objc_msgSend(v11, "hk_filter:", v13);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "hk_map:", &__block_literal_global_22, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10, 0);

}

void *__78__HDHealthStoreProviderServer_remote_fetchAvailableIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  -[HDHealthStoreProviderServer _profileManager](v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[HDHealthStoreProviderServer _clientMayAccessProfile:](*(void **)(a1 + 32), v6);
  else
    v7 = 0;

  return v7;
}

uint64_t __78__HDHealthStoreProviderServer_remote_fetchAvailableIdentifiersWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6790], "identifierFromProfileIdentifier:", a2);
}

- (void)remote_requestAuthorizationToNewIdentifierWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  unimplementedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (void)remote_requestAuthorizationToNewIdentifierToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  unimplementedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6798], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB5140];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
