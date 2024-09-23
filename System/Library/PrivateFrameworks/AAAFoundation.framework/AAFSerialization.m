@implementation AAFSerialization

+ (id)dictionaryFromObject:(id)a3 ofType:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "ofType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryFromObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)dataFromDictionary:(id)a3 ofType:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "ofType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataFromDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stringFromDictionary:(id)a3 ofType:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "ofType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ofType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "instance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializerOfType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__AAFSerialization_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance__instanceToken != -1)
    dispatch_once(&instance__instanceToken, block);
  return (id)instance__instance;
}

void __28__AAFSerialization_instance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)instance__instance;
  instance__instance = (uint64_t)v1;

}

- (AAFSerialization)init
{
  AAFSerialization *v2;
  AAFSerialization *v3;
  NSDictionary *serializersByType;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAFSerialization;
  v2 = -[AAFSerialization init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    serializersByType = v2->_serializersByType;
    v2->_serializersByType = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v5 = (void *)objc_opt_new();
    -[AAFSerialization addSerializer:](v3, "addSerializer:", v5);

    v6 = (void *)objc_opt_new();
    -[AAFSerialization addSerializer:](v3, "addSerializer:", v6);

  }
  return v3;
}

- (id)serializerOfType:(id)a3
{
  NSDictionary *serializersByType;
  void *v4;
  void *v5;

  serializersByType = self->_serializersByType;
  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary valueForKey:](serializersByType, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addSerializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *serializersByType;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mediaTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "aaf_hasObjects"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "lowercaseString", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setValue:forKey:", v4, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    -[NSDictionary aaf_dictionaryByAddingEntriesFromDictionary:](self->_serializersByType, "aaf_dictionaryByAddingEntriesFromDictionary:", v6);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    serializersByType = self->_serializersByType;
    self->_serializersByType = v13;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializersByType, 0);
}

@end
