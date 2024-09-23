@implementation LAKeyStore

void __68___LAKeyStore_storeKeyWithIdentifier_domain_protectedBy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (a2)
    {
      v5 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key with identifier '%@' is already present"), *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v7);

    }
    else
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "createQueryForKeyWithIdentifier:domain:acl:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)WeakRetained[1];
      v12 = 0;
      objc_msgSend(v10, "createKeyWithQuery:error:", v9, &v12);
      v11 = v12;
      if (v11)
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      else
        objc_msgSend(*(id *)(a1 + 56), "fetchKeyWithIdentifier:domain:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

    }
  }

}

void __46___LAKeyStore_fetchKeysWithDomain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  +[_LAKeyStoreKey buildWithDictionary:error:](_LAKeyStoreKey, "buildWithDictionary:error:", a2, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __77___LAKeyStore_storeGenericPassword_identifier_domain_protectedBy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "createQueryForGenericPasswordWithIdentifier:domain:data:protectedBy:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)WeakRetained[1];
      v12 = 0;
      objc_msgSend(v10, "createGenericPasswordWithQuery:error:", v9, &v12);
      v11 = v12;
      if (v11)
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      else
        objc_msgSend(WeakRetained, "fetchGenericPasswordWithIdentifier:domain:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

    }
  }

}

void __58___LAKeyStore_fetchGenericPasswordsWithDomain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  +[_LAKeyStoreGenericPassword buildWithDictionary:error:](_LAKeyStoreGenericPassword, "buildWithDictionary:error:", a2, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "setCryptor:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

void __47___LAKeyStore_fetchItemsWithDomain_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __47___LAKeyStore_fetchItemsWithDomain_completion___block_invoke_2;
      v6[3] = &unk_1E7079948;
      v5 = *(_QWORD *)(a1 + 40);
      v8 = *(id *)(a1 + 48);
      v7 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "fetchKeysWithDomain:completion:", v5, v6);

    }
  }
}

uint64_t __47___LAKeyStore_fetchItemsWithDomain_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v4)(void);

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v4();
}

void __48___LAKeyStore_removeItemsWithDomain_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48___LAKeyStore_removeItemsWithDomain_completion___block_invoke_2;
    v6[3] = &unk_1E7079998;
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(WeakRetained, "removeKeysWithDomain:completion:", v5, v6);

  }
}

void __48___LAKeyStore_removeItemsWithDomain_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  v3 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0CC1310], "errorWithCode:withUnderlyingErrors:", -1008, *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

void __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v9 = (void *)*((_QWORD *)WeakRetained + 2);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_2;
      v11[3] = &unk_1E7079A10;
      v10 = *(_QWORD *)(a1 + 32);
      v13 = *(id *)(a1 + 40);
      v12 = v5;
      objc_msgSend(v9, "wrapData:completion:", v10, v11);

    }
  }

}

void __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = *MEMORY[0x1E0CD6E18];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_3;
    v9[3] = &unk_1E70799E8;
    v10 = v5;
    v12 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v7, "encryptData:secKeyAlgorithm:completion:", v10, v8, v9);

  }
}

void __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToData:", v6))
    __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_3_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60___LAKeyStore_decryptData_publicKeyHash_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v8 = *MEMORY[0x1E0CD6E18];
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __60___LAKeyStore_decryptData_publicKeyHash_context_completion___block_invoke_2;
      v11[3] = &unk_1E7079A60;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      v13 = *(id *)(a1 + 48);
      v12 = v5;
      objc_msgSend(v12, "decryptData:secKeyAlgorithm:context:completion:", v9, v8, v10, v11);

      objc_destroyWeak(&v14);
    }
  }

}

void __60___LAKeyStore_decryptData_publicKeyHash_context_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    else
      objc_msgSend(WeakRetained[2], "unwrapData:completion:", v8, *(_QWORD *)(a1 + 40));
  }

}

void __52___LAKeyStore_encryptData_publicKeyHash_completion___block_invoke_3_cold_1()
{
  __assert_rtn("-[_LAKeyStore encryptData:publicKeyHash:completion:]_block_invoke_3", "LAKeyStore.m", 318, "![wrappedData isEqualToData:cpher]");
}

@end
