@implementation _LAKeyStore

- (_LAKeyStore)init
{
  _LAKeyStore *v2;
  uint64_t v3;
  LAKeyStoreBackend *backend;
  LAKeyStoreSecretCoder *v5;
  LAKeyStoreSecretCoder *coder;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LAKeyStore;
  v2 = -[_LAKeyStore init](&v8, sel_init);
  if (v2)
  {
    +[LAKeyStoreBackendBuilder buildBackend](LAKeyStoreBackendBuilder, "buildBackend");
    v3 = objc_claimAutoreleasedReturnValue();
    backend = v2->_backend;
    v2->_backend = (LAKeyStoreBackend *)v3;

    v5 = objc_alloc_init(LAKeyStoreSecretCoder);
    coder = v2->_coder;
    v2->_coder = v5;

  }
  return v2;
}

- (void)storeKeyWithIdentifier:(id)a3 domain:(id)a4 protectedBy:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _LAKeyStore *v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68___LAKeyStore_storeKeyWithIdentifier_domain_protectedBy_completion___block_invoke;
  v18[3] = &unk_1E70798A8;
  objc_copyWeak(&v24, &location);
  v14 = v13;
  v23 = v14;
  v15 = v10;
  v19 = v15;
  v16 = v11;
  v20 = v16;
  v17 = v12;
  v21 = v17;
  v22 = self;
  -[_LAKeyStore fetchKeyWithIdentifier:domain:completion:](self, "fetchKeyWithIdentifier:domain:completion:", v15, v16, v18);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)fetchKeysWithDomain:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  LAKeyStoreBackend *backend;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "fetchQueryForKeysWithDomain:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  backend = self->_backend;
  obj = 0;
  -[LAKeyStoreBackend fetchItemsWithQuery:error:](backend, "fetchItemsWithQuery:error:", v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v24, obj);
  if (v20[5])
  {
    +[LAAuthorizationError resourceNotFoundWithUnderylingError:](LAAuthorizationError, "resourceNotFoundWithUnderylingError:");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46___LAKeyStore_fetchKeysWithDomain_completion___block_invoke;
    v15[3] = &unk_1E70798D0;
    v17 = &v19;
    v12 = v13;
    v16 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
    if (v20[5])
      v14 = 0;
    else
      v14 = v12;
    ((void (*)(void (**)(id, _QWORD, id), id))v7[2])(v7, v14);

  }
  _Block_object_dispose(&v19, 8);

}

- (void)fetchKeyWithIdentifier:(id)a3 domain:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  LAKeyStoreBackend *backend;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "fetchQueryForKeyWithIdentifier:domain:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  backend = self->_backend;
  v19 = 0;
  -[LAKeyStoreBackend fetchItemWithQuery:error:](backend, "fetchItemWithQuery:error:", v12, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (v15)
  {
    v16 = v15;
    +[LAAuthorizationError resourceNotFoundWithUnderylingError:](LAAuthorizationError, "resourceNotFoundWithUnderylingError:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v17);
  }
  else
  {
    v18 = 0;
    +[_LAKeyStoreKey buildWithDictionary:error:](_LAKeyStoreKey, "buildWithDictionary:error:", v14, &v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    ((void (**)(id, void *, void *))v8)[2](v8, v17, v16);
  }

}

- (void)fetchKeyWithPublicKeyHash:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id v7;
  void *v8;
  void *v9;
  LAKeyStoreBackend *backend;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "fetchQueryForKeyWithPublicKeyHash:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  backend = self->_backend;
  v16 = 0;
  -[LAKeyStoreBackend fetchItemWithQuery:error:](backend, "fetchItemWithQuery:error:", v9, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v12)
  {
    v13 = v12;
    +[LAAuthorizationError resourceNotFoundWithUnderylingError:](LAAuthorizationError, "resourceNotFoundWithUnderylingError:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v14);
  }
  else
  {
    v15 = 0;
    +[_LAKeyStoreKey buildWithDictionary:error:](_LAKeyStoreKey, "buildWithDictionary:error:", v11, &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    ((void (**)(id, void *, void *))v6)[2](v6, v14, v13);
  }

}

- (void)removeKeysWithDomain:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  void *v9;
  LAKeyStoreBackend *backend;
  id v11;
  id v12;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "removeQueryForKeysWithDomain:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  backend = self->_backend;
  v12 = 0;
  -[LAKeyStoreBackend removeItemsWithQuery:error:](backend, "removeItemsWithQuery:error:", v9, &v12);
  v11 = v12;
  v6[2](v6, v11);

}

- (void)storeGenericPassword:(id)a3 identifier:(id)a4 domain:(id)a5 protectedBy:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77___LAKeyStore_storeGenericPassword_identifier_domain_protectedBy_completion___block_invoke;
  v21[3] = &unk_1E70798F8;
  objc_copyWeak(&v26, &location);
  v17 = v16;
  v25 = v17;
  v18 = v13;
  v22 = v18;
  v19 = v14;
  v23 = v19;
  v20 = v15;
  v24 = v20;
  -[_LAKeyStore encryptData:publicKeyHash:completion:](self, "encryptData:publicKeyHash:completion:", v12, v20, v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)fetchGenericPasswordsWithDomain:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  LAKeyStoreBackend *backend;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "fetchQueryForGenericPasswordsWithDomain:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  backend = self->_backend;
  obj = 0;
  -[LAKeyStoreBackend fetchItemsWithQuery:error:](backend, "fetchItemsWithQuery:error:", v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v24, obj);
  if (v20[5])
  {
    +[LAAuthorizationError resourceNotFoundWithUnderylingError:](LAAuthorizationError, "resourceNotFoundWithUnderylingError:");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58___LAKeyStore_fetchGenericPasswordsWithDomain_completion___block_invoke;
    v15[3] = &unk_1E7079920;
    v17 = &v19;
    v15[4] = self;
    v12 = v13;
    v16 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
    if (v20[5])
      v14 = 0;
    else
      v14 = v12;
    ((void (*)(void (**)(id, _QWORD, id), id))v7[2])(v7, v14);

  }
  _Block_object_dispose(&v19, 8);

}

- (void)fetchGenericPasswordWithIdentifier:(id)a3 domain:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  LAKeyStoreBackend *backend;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "fetchQueryForGenericPasswordWithIdentifier:domain:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  backend = self->_backend;
  v19 = 0;
  -[LAKeyStoreBackend fetchItemWithQuery:error:](backend, "fetchItemWithQuery:error:", v12, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (v15)
  {
    v16 = v15;
    +[LAAuthorizationError resourceNotFoundWithUnderylingError:](LAAuthorizationError, "resourceNotFoundWithUnderylingError:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v17);
  }
  else
  {
    v18 = 0;
    +[_LAKeyStoreGenericPassword buildWithDictionary:error:](_LAKeyStoreGenericPassword, "buildWithDictionary:error:", v14, &v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    objc_msgSend(v17, "setCryptor:", self);
    ((void (**)(id, void *, void *))v8)[2](v8, v17, v16);
  }

}

- (void)removeGenericPasswordsWithDomain:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  void *v9;
  LAKeyStoreBackend *backend;
  id v11;
  id v12;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "removeQueryForGenericPasswordsWithDomain:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  backend = self->_backend;
  v12 = 0;
  -[LAKeyStoreBackend removeItemsWithQuery:error:](backend, "removeItemsWithQuery:error:", v9, &v12);
  v11 = v12;
  v6[2](v6, v11);

}

- (void)fetchItemsWithDomain:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47___LAKeyStore_fetchItemsWithDomain_completion___block_invoke;
  v12[3] = &unk_1E7079970;
  v9 = v7;
  v15 = v9;
  v10 = v8;
  v13 = v10;
  objc_copyWeak(&v16, &location);
  v11 = v6;
  v14 = v11;
  -[_LAKeyStore fetchGenericPasswordsWithDomain:completion:](self, "fetchGenericPasswordsWithDomain:completion:", v11, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)removeItemsWithDomain:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48___LAKeyStore_removeItemsWithDomain_completion___block_invoke;
  v12[3] = &unk_1E70799C0;
  v9 = v8;
  v13 = v9;
  objc_copyWeak(&v16, &location);
  v10 = v6;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  -[_LAKeyStore removeGenericPasswordsWithDomain:completion:](self, "removeGenericPasswordsWithDomain:completion:", v10, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)removeItemsWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  LAKeyStoreBackendQueryBuilder *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  LAKeyStoreBackend *backend;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v6 = objc_alloc_init(LAKeyStoreBackendQueryBuilder);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[LAKeyStoreBackendQueryBuilder removeQueryForKeys](v6, "removeQueryForKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  -[LAKeyStoreBackendQueryBuilder removeQueryForGenericPasswords](v6, "removeQueryForGenericPasswords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        backend = self->_backend;
        v18 = 0;
        -[LAKeyStoreBackend removeItemsWithQuery:error:](backend, "removeItemsWithQuery:error:", v14, &v18);
        v16 = v18;
        if (v16)
          objc_msgSend(v5, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CC1310], "errorWithCode:withUnderlyingErrors:", -1008, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v17);

  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)encryptData:(id)a3 publicKeyHash:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke;
  v13[3] = &unk_1E7079A38;
  objc_copyWeak(&v16, &location);
  v11 = v10;
  v15 = v11;
  v12 = v8;
  v14 = v12;
  -[_LAKeyStore fetchKeyWithPublicKeyHash:completion:](self, "fetchKeyWithPublicKeyHash:completion:", v9, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)decryptData:(id)a3 publicKeyHash:(id)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60___LAKeyStore_decryptData_publicKeyHash_context_completion___block_invoke;
  v17[3] = &unk_1E7079A88;
  objc_copyWeak(&v21, &location);
  v14 = v13;
  v20 = v14;
  v15 = v10;
  v18 = v15;
  v16 = v12;
  v19 = v16;
  -[_LAKeyStore fetchKeyWithPublicKeyHash:completion:](self, "fetchKeyWithPublicKeyHash:completion:", v11, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coder, 0);
  objc_storeStrong((id *)&self->_backend, 0);
}

@end
