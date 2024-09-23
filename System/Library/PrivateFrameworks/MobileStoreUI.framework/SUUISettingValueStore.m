@implementation SUUISettingValueStore

- (SUUISettingValueStore)init
{
  SUUISettingValueStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *mutexQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUISettingValueStore;
  v2 = -[SUUISettingValueStore init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUISettingValueStore", 0);
    mutexQueue = v2->_mutexQueue;
    v2->_mutexQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)clearValueForKey:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUUISettingValueStore_clearValueForKey___block_invoke;
  block[3] = &unk_2511F46D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);

}

void *__42__SUUISettingValueStore_clearValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (v3)
  {
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(void **)(v2 + 24);
  if (result)
    return (void *)objc_msgSend(result, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)commitChanges
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUUISettingValueStore_commitChanges__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

void __38__SUUISettingValueStore_commitChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    if (!*(_QWORD *)(v2 + 16))
    {
      v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v4;

      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 24);
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__SUUISettingValueStore_commitChanges__block_invoke_2;
    v9[3] = &unk_2511FCAD0;
    v9[4] = v2;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

  }
}

uint64_t __38__SUUISettingValueStore_commitChanges__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", a3, a2);
}

- (void)discardChanges
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUUISettingValueStore_discardChanges__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

void __39__SUUISettingValueStore_discardChanges__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (BOOL)hasChanges
{
  NSObject *mutexQueue;
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
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__SUUISettingValueStore_hasChanges__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__SUUISettingValueStore_hasChanges__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24) != 0;
  return result;
}

- (id)modifiedKeys
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__86;
  v10 = __Block_byref_object_dispose__86;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SUUISettingValueStore_modifiedKeys__block_invoke;
  v5[3] = &unk_2511FCAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__SUUISettingValueStore_modifiedKeys__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(v2, "allKeys");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)originalValueForKey:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__86;
  v16 = __Block_byref_object_dispose__86;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUUISettingValueStore_originalValueForKey___block_invoke;
  block[3] = &unk_2511FCB20;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__SUUISettingValueStore_originalValueForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1[4] + 16);
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)resolvedValueForKey:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__86;
  v16 = __Block_byref_object_dispose__86;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUUISettingValueStore_resolvedValueForKey___block_invoke;
  block[3] = &unk_2511FCB20;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__SUUISettingValueStore_resolvedValueForKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(a1[4] + 24);
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v6 = *(void **)(a1[4] + 16);
    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", a1[5]);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }
}

- (void)setModifiedValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUUISettingValueStore_setModifiedValue_forKey___block_invoke;
  block[3] = &unk_2511F4798;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(mutexQueue, block);

}

uint64_t __49__SUUISettingValueStore_setModifiedValue_forKey___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(a1[4] + 24))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

  }
  v5 = a1[5];
  v6 = *(void **)(a1[4] + 24);
  if (v5)
    return objc_msgSend(v6, "setObject:forKey:", v5, a1[6]);
  else
    return objc_msgSend(v6, "removeObjectForKey:", a1[6]);
}

- (void)setOriginalValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUUISettingValueStore_setOriginalValue_forKey___block_invoke;
  block[3] = &unk_2511F4798;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(mutexQueue, block);

}

uint64_t __49__SUUISettingValueStore_setOriginalValue_forKey___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(a1[4] + 16))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

  }
  v5 = a1[5];
  v6 = *(void **)(a1[4] + 16);
  if (v5)
    return objc_msgSend(v6, "setObject:forKey:", v5, a1[6]);
  else
    return objc_msgSend(v6, "removeObjectForKey:", a1[6]);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingValueStore.m"), 146, CFSTR("setValue:forKey: is unimplemented. Use setOriginalValue:forKey: or setModifiedValue:forKey: instead."));

}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingValueStore.m"), 150, CFSTR("setValue:forKeyPath: is unimplemented. Use setOriginalValue:forKey: or setModifiedValue:forKey: instead."));

}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingValueStore.m"), 154, CFSTR("setValue:forUndefinedKey: is unimplemented. Use setOriginalValue:forKey: or setModifiedValue:forKey: instead."));

}

- (id)valueForKey:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingValueStore.m"), 158, CFSTR("valueForKey: is unimplemented. Use resolvedValueForKey: instead."));

  return 0;
}

- (id)valueForKeyPath:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingValueStore.m"), 163, CFSTR("valueForKeyPath: is unimplemented. Use resolvedValueForKey: instead."));

  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingValueStore.m"), 168, CFSTR("valueForUndefinedKey: is unimplemented. Use resolvedValueForKey: instead."));

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedValues, 0);
  objc_storeStrong((id *)&self->_originalValues, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
