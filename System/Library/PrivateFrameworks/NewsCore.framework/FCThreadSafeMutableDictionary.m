@implementation FCThreadSafeMutableDictionary

uint64_t __55__FCThreadSafeMutableDictionary_readWriteWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
}

uint64_t __50__FCThreadSafeMutableDictionary_setObject_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
}

void __46__FCThreadSafeMutableDictionary_objectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __58__FCThreadSafeMutableDictionary_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

- (void)readWriteWithAccessor:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FCThreadSafeMutableDictionary_readWriteWithAccessor___block_invoke;
  v7[3] = &unk_1E463B2D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

- (NSArray)allValues
{
  NFUnfairLock *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__FCThreadSafeMutableDictionary_allValues__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  id v7;
  _QWORD v9[5];
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
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__FCThreadSafeMutableDictionary_objectForKey___block_invoke;
  v9[3] = &unk_1E463AD58;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NFUnfairLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__FCThreadSafeMutableDictionary_setObject_forKey___block_invoke;
  v11[3] = &unk_1E463B228;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v11);

}

void __42__FCThreadSafeMutableDictionary_allValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__FCThreadSafeMutableDictionary_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

- (unint64_t)count
{
  NFUnfairLock *lock;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__FCThreadSafeMutableDictionary_count__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)allKeys
{
  NFUnfairLock *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__FCThreadSafeMutableDictionary_allKeys__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (FCThreadSafeMutableDictionary)init
{
  FCThreadSafeMutableDictionary *v2;
  uint64_t v3;
  NFUnfairLock *lock;
  NSMutableDictionary *v5;
  NSMutableDictionary *dictionary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCThreadSafeMutableDictionary;
  v2 = -[FCThreadSafeMutableDictionary init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    lock = v2->_lock;
    v2->_lock = (NFUnfairLock *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v5;

  }
  return v2;
}

void __51__FCThreadSafeMutableDictionary_readOnlyDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __38__FCThreadSafeMutableDictionary_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __40__FCThreadSafeMutableDictionary_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)readOnlyDictionary
{
  NFUnfairLock *lock;
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
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__FCThreadSafeMutableDictionary_readOnlyDictionary__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (FCThreadSafeMutableDictionary)initWithDictionary:(id)a3
{
  id v4;
  FCThreadSafeMutableDictionary *v5;
  FCThreadSafeMutableDictionary *v6;

  v4 = a3;
  v5 = -[FCThreadSafeMutableDictionary init](self, "init");
  v6 = v5;
  if (v5)
    -[NSMutableDictionary addEntriesFromDictionary:](v5->_dictionary, "addEntriesFromDictionary:", v4);

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FCThreadSafeMutableDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __52__FCThreadSafeMutableDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllObjects
{
  NFUnfairLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__FCThreadSafeMutableDictionary_removeAllObjects__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v3);
}

uint64_t __49__FCThreadSafeMutableDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__FCThreadSafeMutableDictionary_removeObjectsForKeys___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __54__FCThreadSafeMutableDictionary_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isEmpty
{
  return -[FCThreadSafeMutableDictionary count](self, "count") == 0;
}

- (id)subdictionaryForKeys:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  id v7;
  _QWORD v9[5];
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
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__FCThreadSafeMutableDictionary_subdictionaryForKeys___block_invoke;
  v9[3] = &unk_1E463AD58;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__FCThreadSafeMutableDictionary_subdictionaryForKeys___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "fc_subdictionaryForKeys:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)subdictionaryForKeys:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NFUnfairLock *lock;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  FCThreadSafeMutableDictionary *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  lock = self->_lock;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__FCThreadSafeMutableDictionary_subdictionaryForKeys_passingTest___block_invoke;
  v16[3] = &unk_1E46464B0;
  v17 = v6;
  v18 = self;
  v20 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

void __66__FCThreadSafeMutableDictionary_subdictionaryForKeys_passingTest___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__FCThreadSafeMutableDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E463B790;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __67__FCThreadSafeMutableDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enumerateKeysAndObjectsUsingBlock:", *(_QWORD *)(a1 + 40));
}

- (void)readWithAccessor:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__FCThreadSafeMutableDictionary_readWithAccessor___block_invoke;
  v7[3] = &unk_1E463B2D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __50__FCThreadSafeMutableDictionary_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
}

@end
