@implementation FMConcurrentMutableDictionary

- (FMConcurrentMutableDictionary)init
{
  return -[FMConcurrentMutableDictionary initWithDictionary:](self, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
}

- (FMConcurrentMutableDictionary)initWithDictionary:(id)a3
{
  id v4;
  FMConcurrentMutableDictionary *v5;
  uint64_t v6;
  NSMutableDictionary *underlyingDictionary;
  FMReadWriteLock *v8;
  FMReadWriteLock *lock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMConcurrentMutableDictionary;
  v5 = -[FMConcurrentMutableDictionary init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    underlyingDictionary = v5->_underlyingDictionary;
    v5->_underlyingDictionary = (NSMutableDictionary *)v6;

    v8 = -[FMReadWriteLock initWithLockName:]([FMReadWriteLock alloc], "initWithLockName:", CFSTR("FMConcurrentMutableDictionary"));
    lock = v5->_lock;
    v5->_lock = v8;

  }
  return v5;
}

- (unint64_t)count
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[FMConcurrentMutableDictionary lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__FMConcurrentMutableDictionary_count__block_invoke;
  v6[3] = &unk_1E5E0DD78;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithReadLock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __38__FMConcurrentMutableDictionary_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
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
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[FMConcurrentMutableDictionary lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__FMConcurrentMutableDictionary_objectForKey___block_invoke;
  v9[3] = &unk_1E5E0DE40;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performWithReadLock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__FMConcurrentMutableDictionary_objectForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FMConcurrentMutableDictionary lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__FMConcurrentMutableDictionary_setObject_forKey___block_invoke;
  v11[3] = &unk_1E5E0DE68;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performWithWriteLock:", v11);

}

void __50__FMConcurrentMutableDictionary_setObject_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMConcurrentMutableDictionary lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FMConcurrentMutableDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E5E0DDC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithWriteLock:", v7);

}

void __52__FMConcurrentMutableDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)removeAllObjects
{
  void *v3;
  _QWORD v4[5];

  -[FMConcurrentMutableDictionary lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__FMConcurrentMutableDictionary_removeAllObjects__block_invoke;
  v4[3] = &unk_1E5E0DE90;
  v4[4] = self;
  objc_msgSend(v3, "performWithWriteLock:", v4);

}

void __49__FMConcurrentMutableDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)nativeDictionary
{
  void *v3;
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
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[FMConcurrentMutableDictionary lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__FMConcurrentMutableDictionary_nativeDictionary__block_invoke;
  v6[3] = &unk_1E5E0DD78;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithReadLock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__FMConcurrentMutableDictionary_nativeDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)objectForKey:(id)a3 withConstructor:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  -[FMConcurrentMutableDictionary lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__FMConcurrentMutableDictionary_objectForKey_withConstructor___block_invoke;
  v20[3] = &unk_1E5E0DE40;
  v22 = &v23;
  v20[4] = self;
  v10 = v6;
  v21 = v10;
  objc_msgSend(v8, "performWithReadLock:", v20);

  v11 = (void *)v24[5];
  if (!v11)
  {
    v7[2](v7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v24[5];
    v24[5] = v12;

    if (!v24[5])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Invalid State"), CFSTR("objectSource returned a nil value for key %@"), v10);
    -[FMConcurrentMutableDictionary lock](self, "lock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __62__FMConcurrentMutableDictionary_objectForKey_withConstructor___block_invoke_2;
    v17[3] = &unk_1E5E0DEB8;
    v17[4] = self;
    v18 = v10;
    v19 = &v23;
    objc_msgSend(v14, "performWithWriteLock:", v17);

    v11 = (void *)v24[5];
  }
  v15 = v11;

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __62__FMConcurrentMutableDictionary_objectForKey_withConstructor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62__FMConcurrentMutableDictionary_objectForKey_withConstructor___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v7)
  {
    v4 = v7;
    v5 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v4;
  }
  else
  {
    v6 = *(_QWORD *)(v3 + 40);
    objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));
  }

}

- (id)replaceObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  -[FMConcurrentMutableDictionary lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__FMConcurrentMutableDictionary_replaceObject_forKey___block_invoke;
  v13[3] = &unk_1E5E0DEE0;
  v16 = &v17;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v8, "performWithWriteLock:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __54__FMConcurrentMutableDictionary_replaceObject_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

}

- (id)popObjectforKey:(id)a3
{
  id v4;
  void *v5;
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
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[FMConcurrentMutableDictionary lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__FMConcurrentMutableDictionary_popObjectforKey___block_invoke;
  v9[3] = &unk_1E5E0DE40;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performWithWriteLock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__FMConcurrentMutableDictionary_popObjectforKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)setUnderlyingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDictionary, a3);
}

- (FMReadWriteLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

@end
