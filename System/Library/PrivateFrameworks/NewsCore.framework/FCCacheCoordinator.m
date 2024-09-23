@implementation FCCacheCoordinator

uint64_t __58__FCCacheCoordinator_setupWithInitialKeys_persistedHints___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

id __40__FCCacheCoordinator_addInterestInKeys___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  v4 = a2;
  objc_msgSend(v3, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

void __56__FCCacheCoordinator__modifyCacheHintForKeys_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v9, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (id)objc_msgSend(v10, "copy");

          if (!v11)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0D62678]);
            objc_msgSend(v11, "setKey:", v9);
          }
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __36__FCCacheCoordinator_didAccessKeys___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessTime:", *(_QWORD *)(a1 + 32));
}

void __63__FCCacheCoordinator_didInsertKeysIntoCache_withLifetimeHints___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v7, "integerValue");
  if (v5 == 2)
    v6 = 2;
  else
    v6 = v5 == 1;
  objc_msgSend(v3, "setLifetime:", v6);

}

uint64_t __43__FCCacheCoordinator_removeInterestInKeys___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[4];
  return objc_msgSend(v1, "fc_removeObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

- (id)holdTokenForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCCacheCoordinator holdTokenForKeys:](self, "holdTokenForKeys:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)performCacheRead:(id)a3
{
  if (self)
    -[FCCacheCoordinatorLocking performReadSync:](self->_underlyingLock, "performReadSync:", a3);
}

- (BOOL)cacheContainsKey:(id)a3
{
  if (self)
    self = (FCCacheCoordinator *)self->_storedKeys;
  return -[FCCacheCoordinator containsObject:](self, "containsObject:", a3);
}

- (id)holdTokensForKeys:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  id obj;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  -[FCCacheCoordinator addInterestInKeys:]((id *)&self->super.isa, v4);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v16[0] = v9;
        v16[1] = 3221225472;
        v16[2] = __40__FCCacheCoordinator_holdTokensForKeys___block_invoke;
        v16[3] = &unk_1E463AD10;
        v16[4] = self;
        v16[5] = v11;
        +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", v16, v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v12, v11);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)holdTokenForKeys:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  -[FCCacheCoordinator addInterestInKeys:]((id *)&self->super.isa, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__FCCacheCoordinator_holdTokenForKeys___block_invoke;
  v8[3] = &unk_1E463AD10;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addInterestInKeys:(id *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *);
  void *v14;
  id v15;
  id *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];

  v3 = a2;
  if (a1)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__30;
    v22 = __Block_byref_object_dispose__30;
    v23 = 0;
    v4 = a1[6];
    v5 = MEMORY[0x1E0C809B0];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __40__FCCacheCoordinator_addInterestInKeys___block_invoke;
    v14 = &unk_1E463AD58;
    v17 = &v18;
    v15 = v3;
    v16 = a1;
    objc_msgSend(v4, "performWithLockSync:", &v11);

    v6 = (id)v19[5];
    if (objc_msgSend(v6, "count", v11, v12, v13, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSince1970");
      v9 = (unint64_t)v8;

      v24[0] = v5;
      v24[1] = 3221225472;
      v24[2] = __36__FCCacheCoordinator_didAccessKeys___block_invoke;
      v24[3] = &__block_descriptor_40_e23_v16__0__NTPBCacheHint_8l;
      v24[4] = v9;
      -[FCCacheCoordinator _modifyCacheHintForKeys:withBlock:]((uint64_t)a1, v6, v24);
    }

    a1 = (id *)(id)v19[5];
    _Block_object_dispose(&v18, 8);

  }
  return a1;
}

- (void)_modifyCacheHintForKeys:(void *)a3 withBlock:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a2;
  v5 = a3;
  if (a1 && (FCProcessIsMemoryConstrained() & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__FCCacheCoordinator__modifyCacheHintForKeys_withBlock___block_invoke_2;
    v8[3] = &unk_1E46432D0;
    v9 = v7;
    v10 = v5;
    objc_msgSend(v6, "readWriteWithAccessor:", v8);

  }
}

- (id)persistableHints
{
  id v3;
  FCThreadSafeMutableDictionary *cacheHintsByKey;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D62670]);
  objc_msgSend(v3, "setVersion:", 2);
  if (self)
    cacheHintsByKey = self->_cacheHintsByKey;
  else
    cacheHintsByKey = 0;
  -[FCThreadSafeMutableDictionary allValues](cacheHintsByKey, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v3, "setCacheHints:", v6);

  return v3;
}

- (void)didInsertKeysIntoCache:(id)a3 withLifetimeHints:(id)a4
{
  id v6;
  NSMutableSet *storedKeys;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  if (self)
    storedKeys = self->_storedKeys;
  else
    storedKeys = 0;
  -[NSMutableSet addObjectsFromArray:](storedKeys, "addObjectsFromArray:", a3);
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__FCCacheCoordinator_didInsertKeysIntoCache_withLifetimeHints___block_invoke;
  v10[3] = &unk_1E4643208;
  v11 = v6;
  v9 = v6;
  -[FCCacheCoordinator _modifyCacheHintForKeys:withBlock:]((uint64_t)self, v8, v10);

}

uint64_t __58__FCCacheCoordinator_setupWithInitialKeys_persistedHints___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 24);
  else
    v3 = 0;
  return objc_msgSend(a2, "fc_removeObjectsForKeysNotInSet:", v3);
}

uint64_t __40__FCCacheCoordinator_addInterestInKeys___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__FCCacheCoordinator_addInterestInKeys___block_invoke_2;
  v9[3] = &unk_1E463C9B8;
  v2 = (void *)a1[4];
  v9[4] = a1[5];
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = a1[5];
  if (v6)
    v7 = *(void **)(v6 + 32);
  else
    v7 = 0;
  return objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)setupWithInitialKeys:(id)a3
{
  -[FCCacheCoordinator setupWithInitialKeys:persistedHints:](self, "setupWithInitialKeys:persistedHints:", a3, 0);
}

void __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cacheCoordinatorCurrentSizeWithReadLock:", *(_QWORD *)(a1 + 32));

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "alwaysFlushKeysWithZeroInterest") & 1) != 0
      || objc_msgSend(v4, "highWaterMark") <= v3
      || (v5 = *(void **)(a1 + 40)) != 0
      && (objc_msgSend(*(id *)(a1 + 40), "alwaysFlushKeysWithZeroInterest") & 1) == 0
      && objc_msgSend(v5, "highWaterMark") > v3
      && objc_msgSend(v5, "lowWaterMark") <= v3)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 0;
      v6 = *(_QWORD **)(a1 + 32);
      if (v6)
        v6 = (_QWORD *)v6[6];
      v7 = v6;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_2;
      v12[3] = &unk_1E463AD80;
      v12[4] = *(_QWORD *)(a1 + 32);
      v12[5] = &v13;
      objc_msgSend(v7, "performWithLockSync:", v12);

      v8 = *((_BYTE *)v14 + 24);
      if (v8)
      {
        v9 = *(void **)(a1 + 40);
        if (v9)
          v8 = (objc_msgSend(*(id *)(a1 + 40), "alwaysFlushKeysWithZeroInterest") & 1) != 0
            || objc_msgSend(v9, "highWaterMark") <= v3;
        else
          v8 = 0;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
      v10 = *((_BYTE *)v14 + 24);
      if (v10)
      {
        v11 = *(void **)(a1 + 40);
        v10 = v11
           && (objc_msgSend(*(id *)(a1 + 40), "alwaysFlushKeysWithZeroInterest") & 1) == 0
           && objc_msgSend(v11, "highWaterMark") > v3
           && objc_msgSend(v11, "lowWaterMark") <= v3;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
      _Block_object_dispose(&v13, 8);
    }
  }
}

- (FCCacheCoordinatorDelegate)delegate
{
  return (FCCacheCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSSet)keysWithZeroInterest
{
  NFUnfairLock *interestLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__30;
  v12 = __Block_byref_object_dispose__30;
  v13 = 0;
  if (self)
    interestLock = self->_interestLock;
  else
    interestLock = 0;
  v4 = interestLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__FCCacheCoordinator_keysWithZeroInterest__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (NSSet)keysWithNonZeroInterest
{
  NFUnfairLock *interestLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__30;
  v12 = __Block_byref_object_dispose__30;
  v13 = 0;
  if (self)
    interestLock = self->_interestLock;
  else
    interestLock = 0;
  v4 = interestLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__FCCacheCoordinator_keysWithNonZeroInterest__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (void)setupWithInitialKeys:(id)a3 persistedHints:(id)a4
{
  id v6;
  NSMutableSet *storedKeys;
  NSMutableSet *v8;
  id v9;
  NSCountedSet *interestedKeys;
  uint64_t v11;
  NSMutableSet *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FCThreadSafeMutableDictionary *cacheHintsByKey;
  FCOperationThrottler *flushThrottler;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self)
    storedKeys = self->_storedKeys;
  else
    storedKeys = 0;
  v8 = storedKeys;
  v9 = a4;
  if (-[NSMutableSet count](v8, "count"))
  {

  }
  else
  {
    if (self)
      interestedKeys = self->_interestedKeys;
    else
      interestedKeys = 0;
    v11 = -[NSCountedSet count](interestedKeys, "count");

    if (!v11)
      goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("initial keys should be added before anything else"));
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCCacheCoordinator setupWithInitialKeys:persistedHints:]";
    v26 = 2080;
    v27 = "FCCacheCoordinator.m";
    v28 = 1024;
    v29 = 130;
    v30 = 2114;
    v31 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_9:
  if (self)
  {
LABEL_10:
    v12 = self->_storedKeys;
    goto LABEL_11;
  }
LABEL_25:
  v12 = 0;
LABEL_11:
  -[NSMutableSet addObjectsFromArray:](v12, "addObjectsFromArray:", v6);
  objc_opt_class();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v9;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v14 && objc_msgSend(v14, "version") == 2)
  {
    objc_msgSend(v14, "cacheHints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", &__block_literal_global_66);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v14, "cacheHints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:", v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
    {
      -[FCThreadSafeMutableDictionary addEntriesFromDictionary:](self->_cacheHintsByKey, "addEntriesFromDictionary:", v19);
      cacheHintsByKey = self->_cacheHintsByKey;
    }
    else
    {
      objc_msgSend(0, "addEntriesFromDictionary:", v19);
      cacheHintsByKey = 0;
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__FCCacheCoordinator_setupWithInitialKeys_persistedHints___block_invoke_2;
    v23[3] = &unk_1E463AA78;
    v23[4] = self;
    -[FCThreadSafeMutableDictionary readWriteWithAccessor:](cacheHintsByKey, "readWriteWithAccessor:", v23);

  }
  if (self)
    flushThrottler = self->_flushThrottler;
  else
    flushThrottler = 0;
  -[FCOperationThrottler setSuspended:](flushThrottler, "setSuspended:", 0);

}

- (void)operationThrottlerPerformOperation:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  uint64_t v8;
  id v9;
  FCThreadSafeHashTable *observers;
  FCThreadSafeHashTable *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 72, 1);
  else
    Property = 0;
  v7 = Property;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v34 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke;
  v27[3] = &unk_1E4643258;
  v27[4] = self;
  v9 = v7;
  v28 = v9;
  v29 = &v35;
  v30 = &v31;
  if (self
    && (-[FCCacheCoordinatorLocking performReadSync:](self->_underlyingLock, "performReadSync:", v27),
        *((_BYTE *)v36 + 24))
    || *((_BYTE *)v32 + 24))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__30;
    v25 = __Block_byref_object_dispose__30;
    v26 = 0;
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_4;
    v20[3] = &unk_1E4643280;
    v20[4] = self;
    v20[5] = &v21;
    v20[6] = &v31;
    if (self)
    {
      -[FCCacheCoordinatorLocking performWriteSync:](self->_underlyingLock, "performWriteSync:", v20);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      observers = self->_observers;
    }
    else
    {
      observers = 0;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
    }
    v11 = observers;
    -[FCThreadSafeHashTable allObjects](v11, "allObjects", (_QWORD)v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v39, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "cacheCoordinator:didFlushKeys:", self, v22[5]);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v39, 16);
      }
      while (v13);
    }

    _Block_object_dispose(&v21, 8);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __40__FCCacheCoordinator_holdTokensForKeys___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCacheCoordinator removeInterestInKeys:](v1, v2);

}

- (void)removeInterestInKeys:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 48);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __43__FCCacheCoordinator_removeInterestInKeys___block_invoke;
    v9 = &unk_1E463AD10;
    v10 = a1;
    v11 = v3;
    objc_msgSend(v5, "performWithLockSync:", &v6);
    if ((*(_BYTE *)(a1 + 8) & 1) != 0)
      objc_msgSend(*(id *)(a1 + 64), "tickle", v6, v7, v8, v9, v10);

  }
}

- (FCCacheCoordinator)init
{
  FCCacheCoordinator *v2;
  NSMutableSet *v3;
  NSMutableSet *storedKeys;
  NSCountedSet *v5;
  NSCountedSet *interestedKeys;
  FCThreadSafeMutableDictionary *v7;
  FCThreadSafeMutableDictionary *cacheHintsByKey;
  uint64_t v9;
  NFUnfairLock *interestLock;
  uint64_t v11;
  FCThreadSafeHashTable *observers;
  FCTimedOperationThrottler *v13;
  FCOperationThrottler *flushThrottler;
  FCTimedOperationThrottler *v15;
  uint64_t v16;
  FCCacheCoordinatorLocking *underlyingLock;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FCCacheCoordinator;
  v2 = -[FCCacheCoordinator init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    storedKeys = v2->_storedKeys;
    v2->_storedKeys = v3;

    v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    interestedKeys = v2->_interestedKeys;
    v2->_interestedKeys = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableDictionary);
    cacheHintsByKey = v2->_cacheHintsByKey;
    v2->_cacheHintsByKey = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    interestLock = v2->_interestLock;
    v2->_interestLock = (NFUnfairLock *)v9;

    +[FCThreadSafeHashTable hashTableWithOptions:](FCThreadSafeHashTable, "hashTableWithOptions:", 517);
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (FCThreadSafeHashTable *)v11;

    v13 = -[FCTimedOperationThrottler initWithDelegate:]([FCTimedOperationThrottler alloc], "initWithDelegate:", v2);
    -[FCTimedOperationThrottler setCooldownTime:](v13, "setCooldownTime:", 5.0);
    -[FCTimedOperationThrottler setSuspended:](v13, "setSuspended:", 1);
    flushThrottler = v2->_flushThrottler;
    v2->_flushThrottler = (FCOperationThrottler *)v13;
    v15 = v13;

    v2->_flushingEnabled = 0;
    v16 = objc_opt_new();
    underlyingLock = v2->_underlyingLock;
    v2->_underlyingLock = (FCCacheCoordinatorLocking *)v16;

  }
  return v2;
}

void __39__FCCacheCoordinator_holdTokenForKeys___block_invoke(uint64_t a1)
{
  -[FCCacheCoordinator removeInterestInKeys:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)enableFlushingWithPolicy:(id)a3
{
  char *v4;
  char *v5;
  FCOperationThrottler *flushThrottler;
  char *v7;

  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    if (self)
    {
      objc_setProperty_atomic(self, v4, v4, 72);
      self->_flushingEnabled = 1;
      flushThrottler = self->_flushThrottler;
    }
    else
    {
      flushThrottler = 0;
    }
    -[FCOperationThrottler tickle](flushThrottler, "tickle");
    v5 = v7;
  }

}

- (void)performCacheWrite:(id)a3
{
  if (self)
    -[FCCacheCoordinatorLocking performWriteSync:](self->_underlyingLock, "performWriteSync:", a3);
}

void __45__FCCacheCoordinator_keysWithNonZeroInterest__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)v2[3];
    v2 = (_QWORD *)v2[4];
  }
  else
  {
    v3 = 0;
  }
  v4 = v2;
  v9 = v3;
  objc_msgSend(v9, "fc_setByIntersectingSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __42__FCCacheCoordinator_keysWithZeroInterest__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)v2[3];
    v2 = (_QWORD *)v2[4];
  }
  else
  {
    v3 = 0;
  }
  v4 = v2;
  v9 = v3;
  objc_msgSend(v9, "fc_setByMinusingSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)dealloc
{
  FCCacheCoordinator *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (FCCacheCoordinator *)self->_flushThrottler;
  -[FCCacheCoordinator setSuspended:](self, "setSuspended:", 0);
  v3.receiver = v2;
  v3.super_class = (Class)FCCacheCoordinator;
  -[FCCacheCoordinator dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  if (self)
    self = (FCCacheCoordinator *)self->_observers;
  -[FCCacheCoordinator addObject:](self, "addObject:", a3);
}

- (NSSet)allKeys
{
  if (self)
    self = (FCCacheCoordinator *)self->_storedKeys;
  return (NSSet *)(id)-[FCCacheCoordinator copy](self, "copy");
}

- (void)didInsertKeyIntoCache:(id)a3
{
  -[FCCacheCoordinator didInsertKeyIntoCache:withLifetimeHint:](self, "didInsertKeyIntoCache:withLifetimeHint:", a3, 0);
}

- (void)didInsertKeyIntoCache:(id)a3 withLifetimeHint:(int64_t)a4
{
  NSMutableSet *storedKeys;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self)
    storedKeys = self->_storedKeys;
  else
    storedKeys = 0;
  v7 = a3;
  -[NSMutableSet addObject:](storedKeys, "addObject:", v7);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__FCCacheCoordinator_didInsertKeyIntoCache_withLifetimeHint___block_invoke;
  v9[3] = &__block_descriptor_40_e23_v16__0__NTPBCacheHint_8l;
  v9[4] = a4;
  -[FCCacheCoordinator _modifyCacheHintForKeys:withBlock:]((uint64_t)self, v8, v9);

}

uint64_t __61__FCCacheCoordinator_didInsertKeyIntoCache_withLifetimeHint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 == 2)
    v3 = 2;
  else
    v3 = v2 == 1;
  return objc_msgSend(a2, "setLifetime:", v3);
}

- (void)didRemoveKeysFromCache:(id)a3
{
  void *v4;
  NSMutableSet *v5;
  void *v6;
  FCThreadSafeMutableDictionary *cacheHintsByKey;
  void *v8;

  if (self)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = self->_storedKeys;
    objc_msgSend(v4, "setWithArray:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet minusSet:](v5, "minusSet:", v6);

    cacheHintsByKey = self->_cacheHintsByKey;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "minusSet:", v8);

    cacheHintsByKey = 0;
  }
  -[FCThreadSafeMutableDictionary removeObjectsForKeys:](cacheHintsByKey, "removeObjectsForKeys:", a3);

}

void __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_3;
  v5[3] = &unk_1E4643230;
  v5[4] = v2;
  v4 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "fc_containsObjectPassingTest:", v5);

}

uint64_t __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  return objc_msgSend(v3, "containsObject:", a2) ^ 1;
}

uint64_t __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[6];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 48);
  else
    v3 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_5;
  v18[3] = &unk_1E463AD80;
  v5 = *(_QWORD *)(a1 + 40);
  v18[4] = v2;
  v18[5] = v5;
  objc_msgSend(v3, "performWithLockSync:", v18);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 40);
    else
      v7 = 0;
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_7;
    v17[3] = &unk_1E46401F8;
    v8 = *(_QWORD *)(a1 + 40);
    v17[4] = v6;
    v17[5] = v8;
    objc_msgSend(v7, "readWithAccessor:", v17);
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  if (result)
  {
    v10 = *(_QWORD **)(a1 + 32);
    if (v10)
      v10 = (_QWORD *)v10[5];
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v12 = v10;
    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectsForKeys:", v13);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cacheCoordinator:flushKeysWithWriteLock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      v16 = *(void **)(v15 + 24);
    else
      v16 = 0;
    return objc_msgSend(v16, "minusSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_6;
  v8[3] = &unk_1E4643230;
  v8[4] = v2;
  v4 = v3;
  objc_msgSend(v4, "fc_setOfObjectsPassingTest:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  return objc_msgSend(v3, "containsObject:", a2) ^ 1;
}

void __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "lifetime") != 1)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __62__FCCacheCoordinator_filterKeysForPreemptiveFlush_cacheHints___block_invoke;
      v19[3] = &unk_1E46432A8;
      v20 = v6;
      objc_msgSend(v7, "sortUsingComparator:", v19);
      v15 = (unint64_t)objc_msgSend(v7, "count") >> 1;
      objc_msgSend(v7, "removeObjectsInRange:", v15, objc_msgSend(v7, "count") - v15);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v16 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

uint64_t __62__FCCacheCoordinator_filterKeysForPreemptiveFlush_cacheHints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "lifetime");
  if (v9 == objc_msgSend(v8, "lifetime"))
  {
    v10 = objc_msgSend(v7, "accessTime");
    v11 = objc_msgSend(v8, "accessTime");
    v12 = -1;
    if (v10 >= v11)
      v12 = 1;
    if (v10 == v11)
      v13 = 0;
    else
      v13 = v12;
  }
  else if (v9 == 2)
  {
    v13 = -1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_flushPolicy, 0);
  objc_storeStrong((id *)&self->_flushThrottler, 0);
  objc_storeStrong((id *)&self->_underlyingLock, 0);
  objc_storeStrong((id *)&self->_interestLock, 0);
  objc_storeStrong((id *)&self->_cacheHintsByKey, 0);
  objc_storeStrong((id *)&self->_interestedKeys, 0);
  objc_storeStrong((id *)&self->_storedKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
