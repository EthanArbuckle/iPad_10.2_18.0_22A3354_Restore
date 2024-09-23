@implementation FBPlistApplicationDataStoreRepository

- (FBPlistApplicationDataStoreRepository)initWithStorePath:(id)a3
{
  id v6;
  FBPlistApplicationDataStoreRepository *v7;
  FBPlistApplicationDataStoreRepository *v8;
  uint64_t Serial;
  OS_dispatch_queue *stateQueue;
  uint64_t v11;
  OS_dispatch_queue *writeQueue;
  uint64_t v13;
  OS_dispatch_queue *calloutQueue;
  FBPlistApplicationDataStoreRepository *result;
  void *v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FBPlistApplicationDataStoreRepository;
  v7 = -[FBPlistApplicationDataStoreRepository init](&v17, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_4;
  if (v6)
  {
    objc_storeStrong((id *)&v7->_storeURL, a3);
    Serial = BSDispatchQueueCreateSerial();
    stateQueue = v8->_stateQueue;
    v8->_stateQueue = (OS_dispatch_queue *)Serial;

    v11 = BSDispatchQueueCreateSerial();
    writeQueue = v8->_writeQueue;
    v8->_writeQueue = (OS_dispatch_queue *)v11;

    v13 = BSDispatchQueueCreateSerial();
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v13;

    -[FBPlistApplicationDataStoreRepository _load](v8, "_load");
LABEL_4:

    return v8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The application store must have a valid URL path."));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBPlistApplicationDataStoreRepository initWithStorePath:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
  result = (FBPlistApplicationDataStoreRepository *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  NSMutableDictionary *state;
  NSObject *stateQueue;
  objc_super v5;
  _QWORD block[5];
  _QWORD v7[5];
  NSMutableDictionary *v8;

  if (self->_stateQueue)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__3;
    v7[4] = __Block_byref_object_dispose__3;
    v8 = self->_state;
    state = self->_state;
    self->_state = 0;

    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__FBPlistApplicationDataStoreRepository_dealloc__block_invoke;
    block[3] = &unk_1E4A11EE8;
    block[4] = v7;
    dispatch_async(stateQueue, block);
    _Block_object_dispose(v7, 8);

  }
  v5.receiver = self;
  v5.super_class = (Class)FBPlistApplicationDataStoreRepository;
  -[FBPlistApplicationDataStoreRepository dealloc](&v5, sel_dealloc);
}

void __48__FBPlistApplicationDataStoreRepository_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (id)location
{
  return self->_storeURL;
}

- (BOOL)isDirty
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__FBPlistApplicationDataStoreRepository_isDirty__block_invoke;
  v5[3] = &unk_1E4A12C98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__FBPlistApplicationDataStoreRepository_isDirty__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (id)applicationIdentifiersWithState
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__FBPlistApplicationDataStoreRepository_applicationIdentifiersWithState__block_invoke;
  v6[3] = &unk_1E4A12320;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__FBPlistApplicationDataStoreRepository_applicationIdentifiersWithState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v2);
    v2 = v3;
  }

}

- (id)keysForApplication:(id)a3
{
  id v4;
  void *v5;
  NSObject *stateQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3;
    v16 = __Block_byref_object_dispose__3;
    v17 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__FBPlistApplicationDataStoreRepository_keysForApplication___block_invoke;
    block[3] = &unk_1E4A12CC0;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(stateQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __60__FBPlistApplicationDataStoreRepository_keysForApplication___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "allKeys");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

- (BOOL)containsKey:(id)a3 forApplication:(id)a4
{
  void *v4;
  BOOL v5;

  -[FBPlistApplicationDataStoreRepository objectForKey:forApplication:](self, "objectForKey:forApplication:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)objectForKey:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *stateQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    v21 = 0;
    stateQueue = self->_stateQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__FBPlistApplicationDataStoreRepository_objectForKey_forApplication___block_invoke;
    v12[3] = &unk_1E4A12CE8;
    v15 = &v16;
    v12[4] = self;
    v13 = v6;
    v14 = v8;
    dispatch_sync(stateQueue, v12);
    v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

void __69__FBPlistApplicationDataStoreRepository_objectForKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_objectForKey:forIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allObjectsForKeys:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__3;
    v15 = __Block_byref_object_dispose__3;
    v16 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__FBPlistApplicationDataStoreRepository_allObjectsForKeys___block_invoke;
    block[3] = &unk_1E4A12D10;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(stateQueue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __59__FBPlistApplicationDataStoreRepository_allObjectsForKeys___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_objectsForKeys:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *stateQueue;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (v9 && v10 && -[FBPlistApplicationDataStoreRepository _isEligibleForSaving:](self, "_isEligibleForSaving:", v8))
    {
      v12 = (void *)objc_msgSend(v8, "copy");
      stateQueue = self->_stateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__FBPlistApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke;
      block[3] = &unk_1E4A12D38;
      block[4] = self;
      v16 = v11;
      v17 = v8;
      v18 = v9;
      v19 = v12;
      v14 = v12;
      dispatch_async(stateQueue, block);

    }
  }
  else
  {
    -[FBPlistApplicationDataStoreRepository removeObjectForKey:forApplication:](self, "removeObjectForKey:forApplication:", v9, v10);
  }

}

void __73__FBPlistApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_QWORD *)(a1 + 48))
      return;
    v4 = 0;
  }
  v5 = *(void **)(a1 + 48);
  if (v5 != v4 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_addStoreForIdentifierIfNecessary:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
      v3 = v6;
    }
    else
    {
      objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 56));
    }
    objc_msgSend(*(id *)(a1 + 32), "_stateQueue_markDirty");
    v7 = objc_msgSend(v3, "count");
    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      v10[0] = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_notifyDelegateOfChangeForKeys:application:", v9, *(_QWORD *)(a1 + 40));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_removeStoreForIdentifier:", *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)removeObjectForKey:(id)a3 forApplication:(id)a4
{
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = a4;
      objc_msgSend(v6, "arrayWithObject:", a3);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[FBPlistApplicationDataStoreRepository removeObjectsForKeys:forApplication:](self, "removeObjectsForKeys:forApplication:", v8, v7);

    }
  }
}

- (void)removeObjectsForKeys:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *stateQueue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    if (v7)
    {
      if (v8)
      {
        stateQueue = self->_stateQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __77__FBPlistApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke;
        block[3] = &unk_1E4A120D0;
        block[4] = self;
        v11 = v7;
        v12 = v6;
        dispatch_async(stateQueue, block);

      }
    }
  }

}

void __77__FBPlistApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9[1] = 3221225472;
    v9[2] = __77__FBPlistApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke_2;
    v9[3] = &unk_1E4A12D60;
    v3 = *(void **)(a1 + 48);
    v8 = v2;
    v9[0] = MEMORY[0x1E0C809B0];
    v10 = v3;
    objc_msgSend(v8, "keysOfEntriesPassingTest:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v8, "removeObjectsForKeys:", v5);
      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_markDirty");
      v6 = objc_msgSend(v8, "count");
      v7 = *(void **)(a1 + 32);
      if (v6)
        objc_msgSend(v7, "_notifyDelegateOfChangeForKeys:application:", v5, *(_QWORD *)(a1 + 40));
      else
        objc_msgSend(v7, "_stateQueue_removeStoreForIdentifier:", *(_QWORD *)(a1 + 40));
    }

    v2 = v8;
  }

}

uint64_t __77__FBPlistApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)removeAllObjectsForApplication:(id)a3
{
  id v4;
  void *v5;
  NSObject *stateQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    stateQueue = self->_stateQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__FBPlistApplicationDataStoreRepository_removeAllObjectsForApplication___block_invoke;
    v7[3] = &unk_1E4A11FD0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(stateQueue, v7);

  }
}

uint64_t __72__FBPlistApplicationDataStoreRepository_removeAllObjectsForApplication___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stateQueue_removeStoreForIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)flushSynchronously
{
  NSObject *writeQueue;
  _QWORD block[5];

  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__FBPlistApplicationDataStoreRepository_flushSynchronously__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_sync(writeQueue, block);
}

uint64_t __59__FBPlistApplicationDataStoreRepository_flushSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeQueue_flushSynchronously");
}

- (void)beginBatchedUpdate
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__FBPlistApplicationDataStoreRepository_beginBatchedUpdate__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __59__FBPlistApplicationDataStoreRepository_beginBatchedUpdate__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)endBatchedUpdate
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FBPlistApplicationDataStoreRepository_endBatchedUpdate__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __57__FBPlistApplicationDataStoreRepository_endBatchedUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 32);
  if (v2)
  {
    *(_QWORD *)(v1 + 32) = v2 - 1;
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 24))
    {
      if (!*(_QWORD *)(v3 + 32))
      {
        v4 = *(NSObject **)(v3 + 64);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __57__FBPlistApplicationDataStoreRepository_endBatchedUpdate__block_invoke_2;
        block[3] = &unk_1E4A12348;
        block[4] = v3;
        dispatch_async(v4, block);
      }
    }
  }
}

uint64_t __57__FBPlistApplicationDataStoreRepository_endBatchedUpdate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeQueue_flushSynchronously");
}

- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *stateQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  stateQueue = self->_stateQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke;
  v13[3] = &unk_1E4A12DB0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(stateQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(_QWORD *)(a1 + 40));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(_QWORD *)(a1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      v4 = (void *)MEMORY[0x1E0CB35C8];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_3;
      v15[3] = &unk_1E4A12D88;
      v16 = *(id *)(a1 + 48);
      objc_msgSend(v4, "bs_errorWithDomain:code:configuration:", CFSTR("FBApplicationDataStore"), 1, v15);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_addStoreForIdentifierIfNecessary:", *(_QWORD *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addEntriesFromDictionary:", v14);
      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_removeStoreForIdentifier:", *(_QWORD *)(a1 + 40));
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v3, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_notifyDelegateOfChangeForKeys:application:", v13, *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_markDirty");
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_2;
    v17[3] = &unk_1E4A12D88;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v8, "bs_errorWithDomain:code:configuration:", CFSTR("FBApplicationDataStore"), 1, v17);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v3 = v18;
  }

}

uint64_t __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailureReason:", CFSTR("No store exists for identifier \"%@\"), *(_QWORD *)(a1 + 32));
}

uint64_t __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailureReason:", CFSTR("Store already exists with identifier \"%@\"), *(_QWORD *)(a1 + 32));
}

- (BOOL)_isEligibleForSaving:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_isEligibleForSaving__onceToken != -1)
    dispatch_once(&_isEligibleForSaving__onceToken, &__block_literal_global_9);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)_isEligibleForSaving____eligibleClassTypes;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

void __62__FBPlistApplicationDataStoreRepository__isEligibleForSaving___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v7 = (void *)_isEligibleForSaving____eligibleClassTypes;
  _isEligibleForSaving____eligibleClassTypes = v6;

}

- (void)_load
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__FBPlistApplicationDataStoreRepository__load__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

void __46__FBPlistApplicationDataStoreRepository__load__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)MEMORY[0x1A8590A90]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1, 0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 1, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

  }
  objc_autoreleasePoolPop(v2);
}

- (id)_stateQueue_objectForKey:(id)a3 forIdentifier:(id)a4
{
  id v6;
  NSObject *stateQueue;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  stateQueue = self->_stateQueue;
  v8 = a4;
  dispatch_assert_queue_V2(stateQueue);
  -[FBPlistApplicationDataStoreRepository _stateQueue_storeForIdentifier:](self, "_stateQueue_storeForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_stateQueue_objectsForKeys:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allKeys](self->_state, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[FBPlistApplicationDataStoreRepository _stateQueue_storeForIdentifier:](self, "_stateQueue_storeForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "dictionaryWithValuesForKeys:", v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allKeysForObject:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "removeObjectsForKeys:", v15);
          objc_msgSend(v17, "setObject:forKey:", v13, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v17;
}

- (id)_stateQueue_storeForIdentifier:(id)a3
{
  NSObject *stateQueue;
  id v5;
  void *v6;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[NSMutableDictionary bs_safeObjectForKey:ofType:](self->_state, "bs_safeObjectForKey:ofType:", v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stateQueue_addStoreForIdentifierIfNecessary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[FBPlistApplicationDataStoreRepository _stateQueue_storeForIdentifier:](self, "_stateQueue_storeForIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_state, "setObject:forKey:", v5, v4);
    -[FBPlistApplicationDataStoreRepository _stateQueue_markDirty](self, "_stateQueue_markDirty");
  }

  return v5;
}

- (void)_stateQueue_removeStoreForIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[NSMutableDictionary objectForKey:](self->_state, "objectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_state, "removeObjectForKey:", v5);
    -[FBPlistApplicationDataStoreRepository _stateQueue_markDirty](self, "_stateQueue_markDirty");
    -[FBPlistApplicationDataStoreRepository _notifyDelegateOfStoreInvalidationForIdentifier:](self, "_notifyDelegateOfStoreInvalidationForIdentifier:", v5);
  }

}

- (void)_stateQueue_markDirty
{
  dispatch_time_t v3;
  NSObject *writeQueue;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (!self->_dirty)
  {
    self->_dirty = 1;
    v3 = dispatch_time(0, 10000000000);
    writeQueue = self->_writeQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__FBPlistApplicationDataStoreRepository__stateQueue_markDirty__block_invoke;
    block[3] = &unk_1E4A12348;
    block[4] = self;
    dispatch_after(v3, writeQueue, block);
  }
}

void __62__FBPlistApplicationDataStoreRepository__stateQueue_markDirty__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A8590A90]();
  objc_msgSend(*(id *)(a1 + 32), "_writeQueue_flushSynchronously");
  objc_autoreleasePoolPop(v2);
}

- (void)_writeQueue_flushSynchronously
{
  NSObject *stateQueue;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writeQueue);
  if (!self->_batchCount)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__3;
    v14 = __Block_byref_object_dispose__3;
    v15 = 0;
    stateQueue = self->_stateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__FBPlistApplicationDataStoreRepository__writeQueue_flushSynchronously__block_invoke;
    v9[3] = &unk_1E4A12DD8;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = a2;
    dispatch_sync(stateQueue, v9);
    if (v11[5])
    {
      -[NSURL path](self->_storeURL, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByDeletingLastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      if ((objc_msgSend(v7, "fileExistsAtPath:", v6) & 1) == 0)
      {
        objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);
        v16 = *MEMORY[0x1E0CB2AD8];
        v17[0] = *MEMORY[0x1E0CB2AE0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v8, v6, 0);

      }
      objc_msgSend((id)v11[5], "writeToFile:options:error:", v5, 268435457, 0);

    }
    _Block_object_dispose(&v10, 8);

  }
}

void __71__FBPlistApplicationDataStoreRepository__writeQueue_flushSynchronously__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v2 = a1 + 32;
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24))
  {
    v4 = *(_QWORD *)(v1 + 16);
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v10);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)v2 + 24) = 0;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to serialize application state: %@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __71__FBPlistApplicationDataStoreRepository__writeQueue_flushSynchronously__block_invoke_cold_1(a1);
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
    }
  }
}

- (void)_notifyDelegateOfChangeForKeys:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  NSObject *calloutQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__FBPlistApplicationDataStoreRepository__notifyDelegateOfChangeForKeys_application___block_invoke;
  block[3] = &unk_1E4A120D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(calloutQueue, block);

}

void __84__FBPlistApplicationDataStoreRepository__notifyDelegateOfChangeForKeys_application___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectChangedForKeys:application:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_notifyDelegateOfStoreInvalidationForIdentifier:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__FBPlistApplicationDataStoreRepository__notifyDelegateOfStoreInvalidationForIdentifier___block_invoke;
  v7[3] = &unk_1E4A11FD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(calloutQueue, v7);

}

void __89__FBPlistApplicationDataStoreRepository__notifyDelegateOfStoreInvalidationForIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "storeInvalidatedForIdentifier:", *(_QWORD *)(a1 + 40));

}

- (FBApplicationDataStoreRepositoryDelegate)delegate
{
  return (FBApplicationDataStoreRepositoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
}

- (void)initWithStorePath:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __71__FBPlistApplicationDataStoreRepository__writeQueue_flushSynchronously__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(*(SEL *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
