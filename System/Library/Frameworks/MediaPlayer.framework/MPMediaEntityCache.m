@implementation MPMediaEntityCache

- (id)itemWithIdentifier:(int64_t)a3 loadEntityBlock:(id)a4
{
  -[MPMediaEntityCache _entityWithIdentifier:mediaEntityType:collectionGroupingType:loadEntityBlock:](self, "_entityWithIdentifier:mediaEntityType:collectionGroupingType:loadEntityBlock:", a3, 0, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_entityWithIdentifier:(int64_t)a3 mediaEntityType:(int64_t)a4 collectionGroupingType:(int64_t)a5 loadEntityBlock:(id)a6
{
  void (**v10)(id, MPConcreteMediaEntityPropertiesCache *);
  uint64_t v11;
  uint64_t v12;
  MPConcreteMediaEntityPropertiesCache *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = (void (**)(id, MPConcreteMediaEntityPropertiesCache *))a6;
  if (self->_mediaLibraryDataProviderRespondsToSupportsEntityChangeTrackingMethod)
  {
    v24 = 0;
    if (-[MPMediaLibraryDataProviderPrivate supportsEntityChangeTrackingForMediaEntityType:collectionGroupingType:dataProviderClass:](self->_mediaLibraryDataProvider, "supportsEntityChangeTrackingForMediaEntityType:collectionGroupingType:dataProviderClass:", a4, a5, &v24))v11 = v24;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__45147;
  v28 = __Block_byref_object_dispose__45148;
  v29 = 0;
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke;
    v23[3] = &unk_1E3161E98;
    v23[4] = &v24;
    v23[5] = a3;
    -[MPMediaEntityCache _performWithSharedAccessForDataProviderEntityClass:block:](self, "_performWithSharedAccessForDataProviderEntityClass:block:", v11, v23);
    if (!v25[5])
    {
      v13 = -[MPConcreteMediaEntityPropertiesCache initWithLibraryDataProvider:dataProviderEntityClass:identifier:]([MPConcreteMediaEntityPropertiesCache alloc], "initWithLibraryDataProvider:dataProviderEntityClass:identifier:", self->_mediaLibraryDataProvider, v11, a3);
      v10[2](v10, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v25[5];
      v25[5] = v14;

      if ((objc_msgSend((id)v25[5], "conformsToProtocol:", &unk_1EE315660) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MPMediaEntityCache _entityWithIdentifier:mediaEntityType:collectionGroupingType:loadEntityBlock:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MPMediaEntityCache.mm"), 126, CFSTR("Invalid entity"));

      }
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_2;
      v22[3] = &unk_1E3161F00;
      v22[5] = &v24;
      v22[6] = a3;
      v22[4] = self;
      -[MPMediaEntityCache _performWithExclusiveAccessForDataProviderEntityClass:block:](self, "_performWithExclusiveAccessForDataProviderEntityClass:block:", v11, v22);
    }
  }
  else
  {
    v10[2](v10, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v25[5];
    v25[5] = v16;

  }
  v18 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v18;
}

- (void)_performWithSharedAccessForDataProviderEntityClass:(Class)a3 block:(id)a4
{
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a4;
  os_unfair_recursive_lock_lock_with_options();
  v6[2](v6, -[MPMediaEntityCache _entityMapForDataProviderEntityClass:](self, "_entityMapForDataProviderEntityClass:", a3));
  os_unfair_recursive_lock_unlock();

}

- (void)_entityMapForDataProviderEntityClass:(Class)a3
{
  _QWORD *Value;

  Value = CFDictionaryGetValue(self->_concreteEntitiesByDataProviderEntityClass, a3);
  if (!Value)
  {
    Value = (_QWORD *)operator new();
    Value[2] = 0;
    Value[1] = 0;
    *Value = Value + 1;
    CFDictionarySetValue(self->_concreteEntitiesByDataProviderEntityClass, a3, Value);
  }
  return Value;
}

void __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD **)(a2 + 8);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    do
    {
      v6 = v5[4];
      if (v4 >= v6)
      {
        if (v6 >= v4)
        {
          v7 = (id *)std::map<long,MPIdentifierSet * {__strong}>::at(v3, v4);
          WeakRetained = objc_loadWeakRetained(v7);
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = WeakRetained;

          return;
        }
        ++v5;
      }
      v5 = (_QWORD *)*v5;
    }
    while (v5);
  }
}

- (id)collectionWithIdentifier:(int64_t)a3 grouping:(int64_t)a4 loadEntityBlock:(id)a5
{
  -[MPMediaEntityCache _entityWithIdentifier:mediaEntityType:collectionGroupingType:loadEntityBlock:](self, "_entityWithIdentifier:mediaEntityType:collectionGroupingType:loadEntityBlock:", a3, 1, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_performWithExclusiveAccessForDataProviderEntityClass:(Class)a3 block:(id)a4
{
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a4;
  os_unfair_recursive_lock_lock_with_options();
  v6[2](v6, -[MPMediaEntityCache _entityMapForDataProviderEntityClass:](self, "_entityMapForDataProviderEntityClass:", a3));
  os_unfair_recursive_lock_unlock();

}

void __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_2(_QWORD *a1, uint64_t **a2)
{
  void *v4;
  char *v5;
  uint64_t **v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  NSObject *v13;
  _QWORD v14[4];
  __int128 v15;

  v4 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v6 = a2 + 1;
  v5 = (char *)a2[1];
  if (v5)
  {
    v7 = a1[6];
    while (1)
    {
      while (1)
      {
        v8 = v5;
        v9 = *((_QWORD *)v5 + 4);
        if (v7 >= v9)
          break;
        v5 = *(char **)v8;
        v6 = (uint64_t **)v8;
        if (!*(_QWORD *)v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = (char *)*((_QWORD *)v8 + 1);
      if (!v5)
      {
        v6 = (uint64_t **)(v8 + 8);
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = (char *)(a2 + 1);
LABEL_10:
    v10 = v8;
    v8 = (char *)operator new(0x30uLL);
    *((_QWORD *)v8 + 4) = a1[6];
    *((_QWORD *)v8 + 5) = 0;
    *(_QWORD *)v8 = 0;
    *((_QWORD *)v8 + 1) = 0;
    *((_QWORD *)v8 + 2) = v10;
    *v6 = (uint64_t *)v8;
    v11 = (uint64_t *)**a2;
    v12 = (uint64_t *)v8;
    if (v11)
    {
      *a2 = v11;
      v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a2[1], v12);
    a2[2] = (uint64_t *)((char *)a2[2] + 1);
  }
  objc_storeWeak((id *)v8 + 5, v4);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_3;
  v14[3] = &unk_1E3163580;
  v13 = *(NSObject **)(a1[4] + 32);
  v15 = *((_OWORD *)a1 + 2);
  dispatch_async(v13, v14);
}

void __73__MPMediaEntityCache_removeEntityWithIdentifier_dataProviderEntityClass___block_invoke(uint64_t a1, void **a2)
{
  void **v2;
  uint64_t v3;
  void **v4;
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD *v8;
  void **v9;
  void **v10;
  void **v11;
  void **v12;
  void **v13;
  void **v14;
  int v15;
  void ***v16;
  void **v17;
  int v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  void **v22;
  uint64_t *v23;
  uint64_t v24;
  void **v25;
  void **v26;
  void **v27;
  _QWORD *v28;
  _BYTE *v29;
  void **v30;
  BOOL v31;
  _QWORD *v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;

  v2 = (void **)a2[1];
  if (!v2)
    return;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2 + 1;
  v5 = a2[1];
  do
  {
    v6 = v5[4];
    v7 = v6 < v3;
    if (v6 >= v3)
      v8 = v5;
    else
      v8 = v5 + 1;
    if (!v7)
      v4 = (void **)v5;
    v5 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v4 == a2 + 1 || v3 < (uint64_t)v4[4])
    return;
  v9 = (void **)v4[1];
  if (v9)
  {
    do
    {
      v10 = v9;
      v9 = (void **)*v9;
    }
    while (v9);
  }
  else
  {
    v11 = v4;
    do
    {
      v10 = (void **)v11[2];
      v31 = *v10 == v11;
      v11 = v10;
    }
    while (!v31);
  }
  if (*a2 == v4)
    *a2 = v10;
  a2[2] = (char *)a2[2] - 1;
  v12 = (void **)*v4;
  v13 = v4;
  if (*v4)
  {
    v14 = (void **)v4[1];
    if (!v14)
    {
      v13 = v4;
      goto LABEL_26;
    }
    do
    {
      v13 = v14;
      v14 = (void **)*v14;
    }
    while (v14);
  }
  v12 = (void **)v13[1];
  if (v12)
  {
LABEL_26:
    v15 = 0;
    v12[2] = v13[2];
    goto LABEL_27;
  }
  v15 = 1;
LABEL_27:
  v16 = (void ***)v13[2];
  v17 = *v16;
  if (*v16 == v13)
  {
    *v16 = v12;
    if (v13 == v2)
    {
      v17 = 0;
      v2 = v12;
    }
    else
    {
      v17 = v16[1];
    }
  }
  else
  {
    v16[1] = v12;
  }
  v18 = *((unsigned __int8 *)v13 + 24);
  if (v13 != v4)
  {
    v19 = v4[2];
    v13[2] = v19;
    *((_QWORD *)v19 + (*(_QWORD *)v4[2] != (_QWORD)v4)) = v13;
    v21 = *v4;
    v20 = v4[1];
    v21[2] = v13;
    *v13 = v21;
    v13[1] = v20;
    if (v20)
      v20[2] = v13;
    *((_BYTE *)v13 + 24) = *((_BYTE *)v4 + 24);
    if (v2 == v4)
      v2 = v13;
  }
  if (!v18 || !v2)
    goto LABEL_91;
  if (!v15)
  {
    *((_BYTE *)v12 + 24) = 1;
    goto LABEL_91;
  }
  while (1)
  {
    v22 = (void **)v17[2];
    if (*v22 != v17)
      break;
    if (!*((_BYTE *)v17 + 24))
    {
      *((_BYTE *)v17 + 24) = 1;
      *((_BYTE *)v22 + 24) = 0;
      v28 = v17[1];
      *v22 = v28;
      if (v28)
        v28[2] = v22;
      v17[2] = v22[2];
      *((_QWORD *)v22[2] + (*(_QWORD *)v22[2] != (_QWORD)v22)) = v17;
      v17[1] = v22;
      v22[2] = v17;
      if (v2 == v22)
        v2 = v17;
      v17 = (void **)*v22;
    }
    v29 = *v17;
    if (*v17 && !v29[24])
      goto LABEL_86;
    v30 = (void **)v17[1];
    if (v30 && !*((_BYTE *)v30 + 24))
    {
      if (v29 && !v29[24])
      {
LABEL_86:
        v30 = v17;
      }
      else
      {
        *((_BYTE *)v30 + 24) = 1;
        *((_BYTE *)v17 + 24) = 0;
        v36 = *v30;
        v17[1] = *v30;
        if (v36)
          v36[2] = v17;
        v30[2] = v17[2];
        *((_QWORD *)v17[2] + (*(_QWORD *)v17[2] != (_QWORD)v17)) = v30;
        *v30 = v17;
        v17[2] = v30;
        v29 = v17;
      }
      v33 = v30[2];
      *((_BYTE *)v30 + 24) = *((_BYTE *)v33 + 24);
      *((_BYTE *)v33 + 24) = 1;
      v29[24] = 1;
      v34 = *(uint64_t **)v33;
      v37 = *(_QWORD *)(*(_QWORD *)v33 + 8);
      *(_QWORD *)v33 = v37;
      if (v37)
        *(_QWORD *)(v37 + 16) = v33;
      v34[2] = *((_QWORD *)v33 + 2);
      *(_QWORD *)(*((_QWORD *)v33 + 2) + 8 * (**((_QWORD **)v33 + 2) != (_QWORD)v33)) = v34;
      v34[1] = (uint64_t)v33;
      goto LABEL_90;
    }
    *((_BYTE *)v17 + 24) = 0;
    v27 = (void **)v17[2];
    if (*((_BYTE *)v27 + 24))
      v31 = v27 == v2;
    else
      v31 = 1;
    if (v31)
      goto LABEL_71;
LABEL_68:
    v17 = (void **)*((_QWORD *)v27[2] + (*(_QWORD *)v27[2] == (_QWORD)v27));
  }
  if (!*((_BYTE *)v17 + 24))
  {
    *((_BYTE *)v17 + 24) = 1;
    *((_BYTE *)v22 + 24) = 0;
    v23 = (uint64_t *)v22[1];
    v24 = *v23;
    v22[1] = (void *)*v23;
    if (v24)
      *(_QWORD *)(v24 + 16) = v22;
    v23[2] = (uint64_t)v22[2];
    *((_QWORD *)v22[2] + (*(_QWORD *)v22[2] != (_QWORD)v22)) = v23;
    *v23 = (uint64_t)v22;
    v22[2] = v23;
    if (v2 == *v17)
      v2 = v17;
    v17 = (void **)*((_QWORD *)*v17 + 1);
  }
  v25 = (void **)*v17;
  if (!*v17 || *((_BYTE *)v25 + 24))
  {
    v26 = (void **)v17[1];
    if (v26 && !*((_BYTE *)v26 + 24))
      goto LABEL_77;
    *((_BYTE *)v17 + 24) = 0;
    v27 = (void **)v17[2];
    if (v27 == v2)
    {
      v27 = v2;
LABEL_71:
      *((_BYTE *)v27 + 24) = 1;
      goto LABEL_91;
    }
    if (!*((_BYTE *)v27 + 24))
      goto LABEL_71;
    goto LABEL_68;
  }
  v26 = (void **)v17[1];
  if (v26 && !*((_BYTE *)v26 + 24))
  {
LABEL_77:
    v25 = v17;
  }
  else
  {
    *((_BYTE *)v25 + 24) = 1;
    *((_BYTE *)v17 + 24) = 0;
    v32 = v25[1];
    *v17 = v32;
    if (v32)
      v32[2] = v17;
    v25[2] = v17[2];
    *((_QWORD *)v17[2] + (*(_QWORD *)v17[2] != (_QWORD)v17)) = v25;
    v25[1] = v17;
    v17[2] = v25;
    v26 = v17;
  }
  v33 = v25[2];
  *((_BYTE *)v25 + 24) = *((_BYTE *)v33 + 24);
  *((_BYTE *)v33 + 24) = 1;
  *((_BYTE *)v26 + 24) = 1;
  v34 = (uint64_t *)*((_QWORD *)v33 + 1);
  v35 = *v34;
  *((_QWORD *)v33 + 1) = *v34;
  if (v35)
    *(_QWORD *)(v35 + 16) = v33;
  v34[2] = *((_QWORD *)v33 + 2);
  *(_QWORD *)(*((_QWORD *)v33 + 2) + 8 * (**((_QWORD **)v33 + 2) != (_QWORD)v33)) = v34;
  *v34 = (uint64_t)v33;
LABEL_90:
  *((_QWORD *)v33 + 2) = v34;
LABEL_91:
  objc_destroyWeak(v4 + 5);
  operator delete(v4);
}

- (MPMediaEntityCache)initWithMediaLibraryDataProvider:(id)a3
{
  id v5;
  MPMediaEntityCache *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *deallocLaterQueue;
  uint64_t v9;
  NSMutableArray *entityTemporaryReferences;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPMediaEntityCache;
  v6 = -[MPMediaEntityCache init](&v12, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPMediaEntityCache/deallocLaterQueue", 0);
    deallocLaterQueue = v6->_deallocLaterQueue;
    v6->_deallocLaterQueue = (OS_dispatch_queue *)v7;

    v6->_rwlock.ourl_lock._os_unfair_lock_opaque = 0;
    v6->_rwlock.ourl_count = 0;
    objc_storeStrong((id *)&v6->_mediaLibraryDataProvider, a3);
    v6->_mediaLibraryDataProviderRespondsToSupportsEntityChangeTrackingMethod = objc_opt_respondsToSelector() & 1;
    v6->_concreteEntitiesByDataProviderEntityClass = CFDictionaryCreateMutable(0, 0, 0, 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    entityTemporaryReferences = v6->_entityTemporaryReferences;
    v6->_entityTemporaryReferences = (NSMutableArray *)v9;

  }
  return v6;
}

void __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") == 1)
  {
    v2 = dispatch_time(0, 100000000);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_4;
    block[3] = &unk_1E3163508;
    block[4] = v3;
    dispatch_after(v2, v4, block);
  }
}

uint64_t __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSomeGlobalEntityTemporaryReferences");
}

- (void)removeEntityWithIdentifier:(int64_t)a3 dataProviderEntityClass:(Class)a4
{
  _QWORD v4[5];

  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __73__MPMediaEntityCache_removeEntityWithIdentifier_dataProviderEntityClass___block_invoke;
    v4[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v4[4] = a3;
    -[MPMediaEntityCache _performWithExclusiveAccessForDataProviderEntityClass:block:](self, "_performWithExclusiveAccessForDataProviderEntityClass:block:", a4, v4);
  }
}

- (void)_clearSomeGlobalEntityTemporaryReferences
{
  unint64_t v3;
  const void *v4;
  NSMutableArray *v5;
  NSMutableArray *entityTemporaryReferences;
  uint64_t v7;
  dispatch_time_t v8;
  NSObject *deallocLaterQueue;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_deallocLaterQueue);
  if ((unint64_t)-[NSMutableArray count](self->_entityTemporaryReferences, "count") <= 0xFA)
    v3 = (unint64_t)(float)(unint64_t)-[NSMutableArray count](self->_entityTemporaryReferences, "count");
  else
    v3 = 250;
  -[NSMutableArray subarrayWithRange:](self->_entityTemporaryReferences, "subarrayWithRange:", 0, v3);
  v4 = (const void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_entityTemporaryReferences, "removeObjectsInRange:", 0, v3);
  if (!-[NSMutableArray count](self->_entityTemporaryReferences, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    entityTemporaryReferences = self->_entityTemporaryReferences;
    self->_entityTemporaryReferences = v5;

  }
  v7 = -[NSMutableArray count](self->_entityTemporaryReferences, "count");
  if (v4)
    CFRelease(v4);
  if (v7)
  {
    v8 = dispatch_time(0, 100000000);
    deallocLaterQueue = self->_deallocLaterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__MPMediaEntityCache__clearSomeGlobalEntityTemporaryReferences__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_after(v8, deallocLaterQueue, block);
  }
}

- (id)itemWithIdentifier:(int64_t)a3
{
  char v4;
  char v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__45147;
  v13 = __Block_byref_object_dispose__45148;
  v14 = 0;
  if (self->_mediaLibraryDataProviderRespondsToSupportsEntityChangeTrackingMethod)
  {
    v8 = 0;
    v4 = -[MPMediaLibraryDataProviderPrivate supportsEntityChangeTrackingForMediaEntityType:collectionGroupingType:dataProviderClass:](self->_mediaLibraryDataProvider, "supportsEntityChangeTrackingForMediaEntityType:collectionGroupingType:dataProviderClass:", 0, 0, &v8);
    if (v8)
      v5 = v4;
    else
      v5 = 0;
    if ((v5 & 1) != 0)
      -[MPMediaEntityCache _performWithSharedAccessForDataProviderEntityClass:block:](self, "_performWithSharedAccessForDataProviderEntityClass:block:");
  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)updatePropertyValuesInEntityWithIdentifier:(int64_t)a3 dataProviderEntityClass:(Class)a4 deleted:(BOOL)a5
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__MPMediaEntityCache_updatePropertyValuesInEntityWithIdentifier_dataProviderEntityClass_deleted___block_invoke;
  v5[3] = &__block_descriptor_41_e9_v16__0_v8l;
  v5[4] = a3;
  v6 = a5;
  -[MPMediaEntityCache _performWithExclusiveAccessForDataProviderEntityClass:block:](self, "_performWithExclusiveAccessForDataProviderEntityClass:block:", a4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityTemporaryReferences, 0);
  objc_storeStrong((id *)&self->_deallocLaterQueue, 0);
  objc_storeStrong((id *)&self->_mediaLibraryDataProvider, 0);
}

uint64_t __63__MPMediaEntityCache__clearSomeGlobalEntityTemporaryReferences__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSomeGlobalEntityTemporaryReferences");
}

void __97__MPMediaEntityCache_updatePropertyValuesInEntityWithIdentifier_dataProviderEntityClass_deleted___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  BOOL v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v4 = *(_QWORD **)(a2 + 8);
  v2 = (id *)(a2 + 8);
  v3 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v2;
    do
    {
      v8 = v3[4];
      v9 = v8 < v6;
      if (v8 >= v6)
        v10 = v3;
      else
        v10 = v3 + 1;
      if (!v9)
        v7 = (id *)v3;
      v3 = (_QWORD *)*v10;
    }
    while (*v10);
    if (v7 != v2 && v6 >= (uint64_t)v7[4])
    {
      WeakRetained = objc_loadWeakRetained(v7 + 5);
      objc_msgSend(WeakRetained, "cachedPropertyValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (*(_BYTE *)(a1 + 40))
        objc_msgSend(v11, "delete");
      else
        objc_msgSend(v11, "invalidate");

    }
  }
}

void __41__MPMediaEntityCache_itemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD **)(a2 + 8);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    do
    {
      v6 = v5[4];
      if (v4 >= v6)
      {
        if (v6 >= v4)
        {
          v7 = (id *)std::map<long,MPIdentifierSet * {__strong}>::at(v3, v4);
          WeakRetained = objc_loadWeakRetained(v7);
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = WeakRetained;

          return;
        }
        ++v5;
      }
      v5 = (_QWORD *)*v5;
    }
    while (v5);
  }
}

@end
