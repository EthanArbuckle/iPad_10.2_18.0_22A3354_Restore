@implementation NPKAssertionManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__NPKAssertionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

void __36__NPKAssertionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

- (NPKAssertionManager)init
{
  NPKAssertionManager *v2;
  uint64_t v3;
  NSHashTable *acquiredAssertions;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NPKAssertionManager;
  v2 = -[NPKAssertionManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    acquiredAssertions = v2->_acquiredAssertions;
    v2->_acquiredAssertions = (NSHashTable *)v3;

    v5 = dispatch_queue_create("com.apple.NanoPassKit.NPKAssertion", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)addAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  NPKAssertionManager *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %@: Adding assertion:%@", (uint8_t *)&v9, 0x16u);
    }

  }
  if (objc_msgSend(v4, "state") != 2)
  {
    -[NPKAssertionManager acquiredAssertions](self, "acquiredAssertions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
}

- (void)removeAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  NPKAssertionManager *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %@: Removing assertion: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  -[NPKAssertionManager acquiredAssertions](self, "acquiredAssertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v4);

}

- (BOOL)containsAssertionWithType:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  -[NPKAssertionManager acquiredAssertionWithType:](self, "acquiredAssertionWithType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)acquiredAssertionWithType:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NPKAssertionManager acquiredAssertions](self, "acquiredAssertions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)acquireAssertionWithType:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20[2];
  uint8_t buf[4];
  NPKAssertionManager *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)MEMORY[0x2199B6780](v9);
      *(_DWORD *)buf = 138413058;
      v22 = self;
      v23 = 2048;
      v24 = a3;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: %@: Attempting to acquire assertion of type %lu for reason:%@ with completion:%@", buf, 0x2Au);

    }
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __66__NPKAssertionManager_acquireAssertionWithType_reason_completion___block_invoke;
  v17[3] = &unk_24CFE86F0;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = (id)a3;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  dispatch_async(queue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
}

void __66__NPKAssertionManager_acquireAssertionWithType_reason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_acquireAssertionWithType:reason:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)invalidateAssertionWithType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *queue;
  id v12;
  _QWORD block[4];
  id v14;
  id v15[2];
  uint8_t buf[4];
  NPKAssertionManager *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x2199B6780](v6);
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2048;
      v19 = a3;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: %@: Attempting to invalidate assertion of type %lu with completion:%@", buf, 0x20u);

    }
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NPKAssertionManager_invalidateAssertionWithType_completion___block_invoke;
  block[3] = &unk_24CFEA238;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = (id)a3;
  v14 = v6;
  v12 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

void __62__NPKAssertionManager_invalidateAssertionWithType_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_invalidateAssertionWithType:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_queue_acquireAssertionWithType:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NPKAssertion *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  NPKAssertion *v22;
  NSObject *v23;
  _BOOL4 v24;
  _QWORD v25[4];
  NPKAssertion *v26;
  NPKAssertionManager *v27;
  void (**v28)(id, id, void *);
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  NPKAssertionManager *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[NPKAssertionManager acquiredAssertions](self, "acquiredAssertions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
      if (objc_msgSend(v15, "type") == a3)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v16 = v15;

    if (!v16)
      goto LABEL_17;
    -[NPKAssertionManager _errorWithUnderlyingError:](self, "_errorWithUnderlyingError:", CFSTR("Assertion already taken"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v9[2](v9, v16, v17);
    if (v17)
    {
      pk_General_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (!v19)
        goto LABEL_24;
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v17, "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = self;
        v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: %@: Unable to acquire assertion due to error: %@", buf, 0x16u);

      }
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:

LABEL_17:
    v22 = -[NPKAssertion initWithType:reason:]([NPKAssertion alloc], "initWithType:reason:", a3, v8);
    -[NPKAssertionManager addAssertion:](self, "addAssertion:", v22);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __73__NPKAssertionManager__queue_acquireAssertionWithType_reason_completion___block_invoke;
    v25[3] = &unk_24CFEA260;
    v28 = v9;
    v16 = v22;
    v26 = v16;
    v27 = self;
    -[NPKAssertion acquireWithCompletion:](v16, "acquireWithCompletion:", v25);

  }
  pk_General_log();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (!v24)
  {
    v17 = 0;
    goto LABEL_24;
  }
  pk_General_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = self;
    _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: %@: Successfully acquired assertion", buf, 0xCu);
  }
  v17 = 0;
LABEL_22:

LABEL_24:
}

void __73__NPKAssertionManager__queue_acquireAssertionWithType_reason_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_8:
      v10 = v6;
      v8();
      v6 = v10;
    }
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "_errorWithUnderlyingError:", CFSTR("Assertion could not be created"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_8;
    }
  }

}

- (void)_queue_invalidateAssertionWithType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NPKAssertionManager acquiredAssertions](self, "acquiredAssertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      if (objc_msgSend(v12, "type") == a3)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v12;

    if (!v13)
      goto LABEL_13;
    if (objc_msgSend(v13, "isAcquired"))
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __69__NPKAssertionManager__queue_invalidateAssertionWithType_completion___block_invoke;
      v15[3] = &unk_24CFE92E0;
      v15[4] = self;
      v16 = v6;
      objc_msgSend(v13, "invalidateWithCompletion:", v15);

    }
    else if (v6)
    {
      -[NPKAssertionManager _errorWithUnderlyingError:](self, "_errorWithUnderlyingError:", CFSTR("Cannot invalidate an invalid assertion."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v14);

    }
  }
  else
  {
LABEL_9:

LABEL_13:
    if (v6)
      (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
    v13 = 0;
  }

}

void __69__NPKAssertionManager__queue_invalidateAssertionWithType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v5, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: %@: Unable to invalidate assertion due to error: %@", (uint8_t *)&v13, 0x16u);

      }
LABEL_10:

    }
  }
  else if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: %@: Successfully invalidated assertion", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_10;
  }

}

- (id)_errorWithUnderlyingError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKAssertionManagerErrorDomain"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSHashTable)acquiredAssertions
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAcquiredAssertions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acquiredAssertions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
