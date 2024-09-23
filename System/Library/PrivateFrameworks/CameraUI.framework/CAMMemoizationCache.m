@implementation CAMMemoizationCache

- (CAMMemoizationCache)initWithMemoizesNil:(BOOL)a3
{
  CAMMemoizationCache *v4;
  CAMMemoizationCache *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *dictionary;
  CAMMemoizationCache *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMMemoizationCache;
  v4 = -[CAMMemoizationCache init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_memoizesNil = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v5->__dictionary;
    v5->__dictionary = v6;

    v8 = v5;
  }

  return v5;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CAMMemoizationCache _dictionary](self, "_dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CAMMemoizationCache_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1EA32DAB8;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (NSMutableDictionary)_dictionary
{
  return self->__dictionary;
}

- (id)objectForKey:(id)a3 memoizationBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[CAMMemoizationCache _dictionary](self, "_dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CAMMemoizationCache memoizesNil](self, "memoizesNil");
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10 != v11))
  {
    if (!v10)
    {
      if (v7)
      {
        v7[2](v7, v6);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v10 = (void *)v12;
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v6);
          goto LABEL_11;
        }
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v6);

        }
      }
      v10 = 0;
    }
LABEL_11:
    v13 = v10;
    v10 = v13;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)memoizesNil
{
  return self->_memoizesNil;
}

void __57__CAMMemoizationCache_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (CAMMemoizationCache)init
{
  return -[CAMMemoizationCache initWithMemoizesNil:](self, "initWithMemoizesNil:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dictionary, 0);
}

@end
