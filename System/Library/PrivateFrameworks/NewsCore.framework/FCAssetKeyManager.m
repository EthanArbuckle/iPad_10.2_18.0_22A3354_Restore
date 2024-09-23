@implementation FCAssetKeyManager

- (id)initWithService:(void *)a3 cache:(void *)a4 delegate:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  FCThreadSafeMutableSet *v12;
  id v13;
  FCOperationThrottler *v14;
  id v15;
  FCThreadSafeMutableDictionary *v16;
  id v17;
  objc_super v19;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)FCAssetKeyManager;
    v11 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeWeak(a1 + 3, v10);
      v12 = objc_alloc_init(FCThreadSafeMutableSet);
      v13 = a1[5];
      a1[5] = v12;

      v14 = -[FCOperationThrottler initWithDelegate:]([FCOperationThrottler alloc], "initWithDelegate:", a1);
      v15 = a1[4];
      a1[4] = v14;

      v16 = objc_alloc_init(FCThreadSafeMutableDictionary);
      v17 = a1[6];
      a1[6] = v16;

    }
  }

  return a1;
}

- (id)cachedWrappingKeyWithID:(id)a3
{
  if (self)
    self = (FCAssetKeyManager *)self->_cache;
  return (id)-[FCAssetKeyManager wrappingKeyForWrappingKeyID:](self, "wrappingKeyForWrappingKeyID:", a3);
}

- (void)fetchWrappingKeyWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  FCAssetKeyCacheType *cache;
  void *v9;
  FCThreadSafeMutableDictionary *errorsByKey;
  void *v11;
  FCOperationThrottler *throttler;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (self)
    cache = self->_cache;
  else
    cache = 0;
  -[FCAssetKeyCacheType wrappingKeyForWrappingKeyID:](cache, "wrappingKeyForWrappingKeyID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    if (self)
      errorsByKey = self->_errorsByKey;
    else
      errorsByKey = 0;
    -[FCThreadSafeMutableDictionary objectForKey:](errorsByKey, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (-[FCAssetKeyManager _canRetryAfterNetworkError:]((uint64_t)self, v11) & 1) == 0)
    {
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v11);
    }
    else
    {
      if (self)
      {
        -[FCThreadSafeMutableSet addObject:](self->_pendingWrappingKeyIDs, "addObject:", v6);
        throttler = self->_throttler;
      }
      else
      {
        objc_msgSend(0, "addObject:", v6);
        throttler = 0;
      }
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __62__FCAssetKeyManager_fetchWrappingKeyWithID_completionHandler___block_invoke;
      v13[3] = &unk_1E463CCB8;
      v13[4] = self;
      v14 = v6;
      v15 = v7;
      -[FCOperationThrottler tickleWithCompletion:](throttler, "tickleWithCompletion:", v13);

    }
  }

}

- (uint64_t)_canRetryAfterNetworkError:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("FCErrorDomain"));

    if (v6)
    {
      if (objc_msgSend(v4, "code") == 27)
      {
        a1 = 0;
        goto LABEL_10;
      }
LABEL_9:
      a1 = 1;
      goto LABEL_10;
    }
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("FCEndpointConnectionErrorDomain"));

    if (!v8)
      goto LABEL_9;
    v9 = objc_msgSend(v4, "code");
    a1 = 0;
    if (v9 != 429 && v9 != 500 && v9 != 503)
      goto LABEL_9;
  }
LABEL_10:

  return a1;
}

void __62__FCAssetKeyManager_fetchWrappingKeyWithID_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  objc_msgSend(v3, "wrappingKeyForWrappingKeyID:", a1[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = a1[6];
  v10 = (id)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    v6 = (_QWORD *)a1[4];
    if (v6)
      v6 = (_QWORD *)v6[6];
    v7 = a1[5];
    v8 = v6;
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v9);

  }
}

- (void)clearUnauthorizedAssetKeys
{
  if (self)
    self = (FCAssetKeyManager *)self->_errorsByKey;
  -[FCAssetKeyManager readWriteWithAccessor:](self, "readWriteWithAccessor:", &__block_literal_global_112);
}

void __47__FCAssetKeyManager_clearUnauthorizedAssetKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v2, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("FCErrorDomain")))
        {
          v11 = objc_msgSend(v9, "code");

          if (v11 == 27)
            objc_msgSend(v2, "removeObjectForKey:", v8);
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)eraseAllKeys
{
  FCThreadSafeMutableDictionary *errorsByKey;

  if (self)
  {
    -[FCAssetKeyCacheType removeAllWrappingKeys](self->_cache, "removeAllWrappingKeys");
    errorsByKey = self->_errorsByKey;
  }
  else
  {
    objc_msgSend(0, "removeAllWrappingKeys");
    errorsByKey = 0;
  }
  -[FCThreadSafeMutableDictionary removeAllObjects](errorsByKey, "removeAllObjects");
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  FCThreadSafeMutableSet *pendingWrappingKeyIDs;
  uint64_t v8;
  id v9;
  FCAssetKeyServiceType *service;
  _QWORD v11[5];
  id v12;
  void (**v13)(_QWORD);
  _QWORD v14[5];
  id v15;

  v5 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    pendingWrappingKeyIDs = self->_pendingWrappingKeyIDs;
  else
    pendingWrappingKeyIDs = 0;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v14[3] = &unk_1E463B8A8;
  v14[4] = self;
  v9 = v6;
  v15 = v9;
  -[FCThreadSafeMutableSet readWriteWithAccessor:](pendingWrappingKeyIDs, "readWriteWithAccessor:", v14);
  if (objc_msgSend(v9, "count"))
  {
    if (self)
      service = self->_service;
    else
      service = 0;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_3;
    v11[3] = &unk_1E463B4B8;
    v11[4] = self;
    v12 = v9;
    v13 = v5;
    -[FCAssetKeyServiceType fetchWrappingKeysWithIDs:completionHandler:](service, "fetchWrappingKeysWithIDs:completionHandler:", v12, v11);

  }
  else
  {
    v5[2](v5);
  }

}

void __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = *(_QWORD *)(a1 + 32);
        if (v10)
          v11 = *(void **)(v10 + 16);
        else
          v11 = 0;
        objc_msgSend(v11, "wrappingKeyForWrappingKeyID:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8));
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = v3;
          v15 = v13;
LABEL_10:
          objc_msgSend(v14, "removeObject:", v15);
          goto LABEL_16;
        }
        v16 = *(_QWORD *)(a1 + 32);
        if (v16)
          v17 = *(void **)(v16 + 48);
        else
          v17 = 0;
        objc_msgSend(v17, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && (-[FCAssetKeyManager _canRetryAfterNetworkError:](*(_QWORD *)(a1 + 32), v13) & 1) == 0)
        {
          v14 = v3;
          v15 = 0;
          goto LABEL_10;
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 0xB)
        {

          goto LABEL_24;
        }
LABEL_16:

        ++v8;
      }
      while (v6 != v8);
      v18 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v6 = v18;
    }
    while (v18);
  }
LABEL_24:

}

void __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];

  v23 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 24));
    v8 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v8 = 0;
    WeakRetained = 0;
  }
  v9 = objc_msgSend(WeakRetained, "shouldAssetKeyManagerSimulateUnauthorizedAssetKeys:", v8, v23);

  if (v9)
  {

    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fc_unauthorizedAssetKeyErrorWithWrappingKeyID:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v5 = (id)v12;
  }
  else
  {
    v13 = v24;
  }
  v14 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_4;
  v29[3] = &unk_1E4645E58;
  v29[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v29, v13);
  if (v5)
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      v16 = *(void **)(v15 + 48);
    else
      v16 = 0;
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_5;
    v26[3] = &unk_1E463B8D0;
    v27 = *(id *)(a1 + 40);
    v28 = v5;
    objc_msgSend(v16, "readWriteWithAccessor:", v26);

  }
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    v18 = *(void **)(v17 + 40);
  else
    v18 = 0;
  objc_msgSend(v18, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    v20 = *(void **)(v19 + 40);
  else
    v20 = 0;
  if ((objc_msgSend(v20, "isEmpty") & 1) == 0)
  {
    v21 = *(_QWORD *)(a1 + 32);
    if (v21)
      v22 = *(void **)(v21 + 32);
    else
      v22 = 0;
    objc_msgSend(v22, "tickle");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 16);
  else
    v4 = 0;
  return objc_msgSend(v4, "setWrappingKey:forWrappingKeyID:", a3, a2);
}

void __76__FCAssetKeyManager_operationThrottler_performAsyncOperationWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByKey, 0);
  objc_storeStrong((id *)&self->_pendingWrappingKeyIDs, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
