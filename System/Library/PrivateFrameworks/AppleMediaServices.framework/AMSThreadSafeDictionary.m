@implementation AMSThreadSafeDictionary

id __55__AMSThreadSafeDictionary_setObject_forKeyedSubscript___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return v3;
}

- (NSArray)allKeys
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__67;
  v10 = __Block_byref_object_dispose__67;
  v11 = 0;
  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AMSThreadSafeDictionary_allKeys__block_invoke;
  v5[3] = &unk_1E2546458;
  v5[4] = &v6;
  objc_msgSend(v2, "read:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (AMSThreadSafeObject)backingDictionary
{
  return self->_backingDictionary;
}

void __34__AMSThreadSafeDictionary_allKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allKeys");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __51__AMSThreadSafeDictionary_objectForKeyedSubscript___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
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
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  v17 = 0;
  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__AMSThreadSafeDictionary_objectForKeyedSubscript___block_invoke;
  v9[3] = &unk_1E253D528;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "read:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (AMSThreadSafeDictionary)init
{
  AMSThreadSafeDictionary *v2;
  AMSThreadSafeObject *v3;
  id v4;
  uint64_t v5;
  AMSThreadSafeObject *backingDictionary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSThreadSafeDictionary;
  v2 = -[AMSThreadSafeDictionary init](&v8, sel_init);
  if (v2)
  {
    v3 = [AMSThreadSafeObject alloc];
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = -[AMSThreadSafeObject initWithObject:](v3, "initWithObject:", v4);
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = (AMSThreadSafeObject *)v5;

  }
  return v2;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__AMSThreadSafeDictionary_setObject_forKeyedSubscript___block_invoke;
  v11[3] = &unk_1E25464F0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "readWrite:", v11);

}

- (NSArray)allValues
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__67;
  v10 = __Block_byref_object_dispose__67;
  v11 = 0;
  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AMSThreadSafeDictionary_allValues__block_invoke;
  v5[3] = &unk_1E2546458;
  v5[4] = &v6;
  objc_msgSend(v2, "read:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __36__AMSThreadSafeDictionary_allValues__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allValues");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
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
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  v17 = 0;
  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AMSThreadSafeDictionary_objectForKey___block_invoke;
  v9[3] = &unk_1E253D528;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "read:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __40__AMSThreadSafeDictionary_objectForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)readWrite:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AMSThreadSafeDictionary_readWrite___block_invoke;
  v7[3] = &unk_1E2546480;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWrite:", v7);

}

id __37__AMSThreadSafeDictionary_readWrite___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, id);
  id v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, id))(v2 + 16);
  v4 = a2;
  v3(v2, v4);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  return v5;
}

- (void)removeAllObjects
{
  id v2;

  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readWrite:", &__block_literal_global_127);

}

id __43__AMSThreadSafeDictionary_removeAllObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "removeAllObjects");
  return v2;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AMSThreadSafeDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E25464C8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "readWrite:", v7);

}

id __46__AMSThreadSafeDictionary_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AMSThreadSafeDictionary backingDictionary](self, "backingDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__AMSThreadSafeDictionary_setObject_forKey___block_invoke;
  v11[3] = &unk_1E25464F0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "readWrite:", v11);

}

id __44__AMSThreadSafeDictionary_setObject_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return v3;
}

- (void)setBackingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_backingDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end
