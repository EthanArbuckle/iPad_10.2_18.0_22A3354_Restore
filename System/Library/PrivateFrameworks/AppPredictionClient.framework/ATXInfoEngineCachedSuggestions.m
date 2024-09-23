@implementation ATXInfoEngineCachedSuggestions

- (ATXInfoEngineCachedSuggestions)initWithProtoData:(id)a3
{
  id v4;
  ATXPBInfoEngineCachedSuggestions *v5;
  ATXInfoEngineCachedSuggestions *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBInfoEngineCachedSuggestions initWithData:]([ATXPBInfoEngineCachedSuggestions alloc], "initWithData:", v4);

    self = -[ATXInfoEngineCachedSuggestions initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXInfoEngineCachedSuggestions proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXInfoEngineCachedSuggestions)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  ATXInfoEngineCachedSuggestions *v11;
  ATXInfoEngineCachedSuggestions *v12;
  ATXInfoEngineCachedSuggestions *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  NSObject *v18;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ATXPBInfoEngineCachedSuggestions length]((uint64_t)v5);
      -[ATXPBInfoEngineCachedSuggestions cachedSuggestionIds]((uint64_t)v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBInfoEngineCachedSuggestions cachedSuggestionSourceIds]((uint64_t)v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") == v6 && objc_msgSend(v8, "count") == v6)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __48__ATXInfoEngineCachedSuggestions_initWithProto___block_invoke;
        v16[3] = &unk_1E4D5A3E0;
        v17 = v8;
        v10 = v9;
        v18 = v10;
        objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);
        v15.receiver = self;
        v15.super_class = (Class)ATXInfoEngineCachedSuggestions;
        v11 = -[ATXInfoEngineCachedSuggestions init](&v15, sel_init);
        v12 = v11;
        if (v11)
          objc_storeStrong((id *)&v11->_entries, v9);
        self = v12;

        v13 = self;
      }
      else
      {
        __atxlog_handle_gi();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          -[ATXInfoEngineCachedSuggestions initWithProto:].cold.1(v10);
        v13 = 0;
      }

    }
    else
    {
      __atxlog_handle_gi();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXInfoEngineCachedSuggestions initWithProto:].cold.2((uint64_t)self, v5);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __48__ATXInfoEngineCachedSuggestions_initWithProto___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setSuggestionId:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceId:", v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

- (id)proto
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_entries, "count"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_entries, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_entries;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "suggestionId", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        objc_msgSend(v10, "sourceId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_opt_new();
  -[ATXPBInfoEngineCachedSuggestions setLength:]((uint64_t)v13, -[NSArray count](self->_entries, "count"));
  -[ATXPBInfoEngineCachedSuggestions setCachedSuggestionIds:]((uint64_t)v13, v3);
  -[ATXPBInfoEngineCachedSuggestions setCachedSuggestionSourceIds:]((uint64_t)v13, v4);

  return v13;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "ATXInfoEngineCachedSuggestions: Unable to init from malformed proto object (mismatched array length).", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "ATXInfoEngineCachedSuggestions: Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);

}

@end
