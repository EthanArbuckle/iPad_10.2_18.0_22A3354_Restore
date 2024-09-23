@implementation CalAccountUtils

+ (id)_accountStore
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (_accountStore_onceToken != -1)
    dispatch_once(&_accountStore_onceToken, &__block_literal_global_34);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CalAccountUtils__accountStore__block_invoke_2;
  block[3] = &unk_1E2A83FD8;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)_accountStore_queue, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __32__CalAccountUtils__accountStore__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("CalAccountUtils", 0);
  v1 = (void *)_accountStore_queue;
  _accountStore_queue = (uint64_t)v0;

}

void __32__CalAccountUtils__accountStore__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CalIdleTimer *v4;
  uint64_t v5;
  void *v6;

  if (!_accountStore_store)
  {
    v2 = objc_opt_new();
    v3 = (void *)_accountStore_store;
    _accountStore_store = v2;

    v4 = [CalIdleTimer alloc];
    v5 = -[CalIdleTimer initWithQueue:timeoutInSeconds:leewayInSeconds:timeoutBlock:](v4, "initWithQueue:timeoutInSeconds:leewayInSeconds:timeoutBlock:", _accountStore_queue, 300, 30, &__block_literal_global_4_1);
    v6 = (void *)_accountStore_idleTimer;
    _accountStore_idleTimer = v5;

    objc_msgSend((id)_accountStore_idleTimer, "start");
  }
  objc_msgSend((id)_accountStore_idleTimer, "poke");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)_accountStore_store);
}

void __32__CalAccountUtils__accountStore__block_invoke_2()
{
  void *v0;
  void *v1;

  v0 = (void *)_accountStore_store;
  _accountStore_store = 0;

  v1 = (void *)_accountStore_idleTimer;
  _accountStore_idleTimer = 0;

}

+ (id)personaIdentifierForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "_accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "cal_personaIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (BOOL)isAccountDataSeparated:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  objc_msgSend(a1, "personaIdentifierForAccountIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__CalAccountUtils_isAccountDataSeparated___block_invoke;
    v8[3] = &unk_1E2A85A20;
    v8[4] = &v9;
    +[CalPersonaUtils performBlockAsPersonaWithIdentifier:block:](CalPersonaUtils, "performBlockAsPersonaWithIdentifier:block:", v5, v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __42__CalAccountUtils_isAccountDataSeparated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDataSeparatedPersona");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)isiCloudAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(a1, "_accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0C8F030];
    objc_msgSend(v6, "accountType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v9) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v6, "parentAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accountType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isEqualToString:", v13);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
