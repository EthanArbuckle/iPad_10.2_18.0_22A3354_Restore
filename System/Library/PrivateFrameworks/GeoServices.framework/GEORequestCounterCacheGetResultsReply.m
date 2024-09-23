@implementation GEORequestCounterCacheGetResultsReply

- (GEORequestCounterCacheGetResultsReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEORequestCounterCacheGetResultsReply *v7;
  void *v8;
  size_t count;
  void *v10;
  size_t i;
  void *v12;
  GEORequestCounterCacheResults *v13;
  uint64_t v14;
  void *v15;
  GEORequestCounterCacheGetResultsReply *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEORequestCounterCacheGetResultsReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v18, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_array(v6, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_array_get_count(v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (count)
    {
      for (i = 0; i != count; ++i)
      {
        xpc_array_get_dictionary(v8, i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = -[GEORequestCounterCacheResults initWithXPCDictionary:error:]([GEORequestCounterCacheResults alloc], "initWithXPCDictionary:error:", v12, a4);
          if (v13)
            objc_msgSend(v10, "addObject:", v13);

        }
      }
    }
    v14 = objc_msgSend(v10, "count");
    if (v14)
      v15 = (void *)objc_msgSend(v10, "copy");
    else
      v15 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v7->_results, v15);
    if (v14)

    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  xpc_object_t empty;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEORequestCounterCacheGetResultsReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v17, sel_encodeToXPCDictionary_, v4);
  if (-[NSArray count](self->_results, "count"))
  {
    v5 = xpc_array_create(0, 0);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_results;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          empty = xpc_dictionary_create_empty();
          objc_msgSend(v11, "encodeToXPCDictionary:", empty, (_QWORD)v13);
          xpc_array_set_value(v5, 0xFFFFFFFFFFFFFFFFLL, empty);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

    if (xpc_array_get_count(v5))
      xpc_dictionary_set_value(v4, "results", v5);

  }
}

- (BOOL)isValid
{
  return 1;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
