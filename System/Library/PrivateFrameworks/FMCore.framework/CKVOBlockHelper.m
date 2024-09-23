@implementation CKVOBlockHelper

- (CKVOBlockHelper)initWithObject:(id)a3
{
  id v4;
  CKVOBlockHelper *v5;
  CKVOBlockHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKVOBlockHelper;
  v5 = -[CKVOBlockHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_observedObject, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CKVOBlockHelper observedObject](self, "observedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_tokensByContext, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "context");
        objc_msgSend(v9, "keypath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v11, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)CKVOBlockHelper;
  -[CKVOBlockHelper dealloc](&v12, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[CKVOBlockHelper observedObject](self, "observedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[CKVOBlockHelper description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVOBlockHelper tokensByContext](self, "tokensByContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@, %@, %@)"), v5, v7, v6, objc_msgSend(v7, "observationInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)dump
{
  void *v3;
  id v4;
  id v5;
  id v6;

  -[CKVOBlockHelper observedObject](self, "observedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  puts("*******************************************************");
  -[CKVOBlockHelper description](self, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  puts((const char *)objc_msgSend(v4, "UTF8String"));

  printf("\tObserved Object: %p\n", v3);
  puts("\tKeys:");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_tokensByContext, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);
  v6 = objc_retainAutorelease(v3);
  objc_msgSend((id)objc_msgSend(v6, "observationInfo"), "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  printf("\tObservationInfo: %s\n", (const char *)objc_msgSend(v5, "UTF8String"));

}

void __23__CKVOBlockHelper_dump__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "description");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  printf("\t\t%s\n", (const char *)objc_msgSend(v2, "UTF8String"));

}

- (id)allKVOObservers
{
  id v3;
  NSMutableDictionary *tokensByContext;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  tokensByContext = self->_tokensByContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CKVOBlockHelper_allKVOObservers__block_invoke;
  v7[3] = &unk_1E82AAAB8;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tokensByContext, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

uint64_t __34__CKVOBlockHelper_allKVOObservers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)removeHandlerForKey:(id)a3
{
  NSMutableDictionary *tokensByContext;
  void *v5;
  NSMutableDictionary *v6;

  tokensByContext = self->_tokensByContext;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "index"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](tokensByContext, "removeObjectForKey:", v5);

  if (!-[NSMutableDictionary count](self->_tokensByContext, "count"))
  {
    v6 = self->_tokensByContext;
    self->_tokensByContext = 0;

  }
}

- (id)insertNewTokenForKeyPath:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  CKVOToken *v8;
  int64_t v9;
  CKVOToken *v10;
  NSMutableDictionary *tokensByContext;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = [CKVOToken alloc];
  v9 = -[CKVOBlockHelper nextIdentifier](self, "nextIdentifier") + 1;
  -[CKVOBlockHelper setNextIdentifier:](self, "setNextIdentifier:", v9);
  v10 = -[CKVOToken initWithKeyPath:index:block:](v8, "initWithKeyPath:index:block:", v7, v9, v6);

  tokensByContext = self->_tokensByContext;
  if (!tokensByContext)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = self->_tokensByContext;
    self->_tokensByContext = v12;

    tokensByContext = self->_tokensByContext;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CKVOToken index](v10, "index"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](tokensByContext, "setObject:forKeyedSubscript:", v10, v14);

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tokensByContext, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "block");
    v16 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id, id))(v16 + 16))(v16, v10, v11, v12);
  }
  else
  {
    LogCategory_Unspecified();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      -[CKVOBlockHelper observeValueForKeyPath:ofObject:change:context:].cold.1((uint64_t)v13, v16, v17, v18, v19, v20, v21, v22);
  }

}

- (id)observedObject
{
  return objc_loadWeakRetained(&self->_observedObject);
}

- (NSMutableDictionary)tokensByContext
{
  return self->_tokensByContext;
}

- (int64_t)nextIdentifier
{
  return self->_nextIdentifier;
}

- (void)setNextIdentifier:(int64_t)a3
{
  self->_nextIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensByContext, 0);
  objc_destroyWeak(&self->_observedObject);
}

- (void)observeValueForKeyPath:(uint64_t)a3 ofObject:(uint64_t)a4 change:(uint64_t)a5 context:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1C9967000, a2, a3, "Warning: Could not find block for key: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
