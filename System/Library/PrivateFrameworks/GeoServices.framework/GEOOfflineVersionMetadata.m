@implementation GEOOfflineVersionMetadata

- (GEOOfflineVersionMetadata)initWithDataConfiguration:(id)a3
{
  id v4;
  GEOOfflineVersionMetadata *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *activeVersions;
  GEOOfflineVersionMetadata *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOOfflineVersionMetadata;
  v5 = -[GEOOfflineVersionMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "activeVersions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    activeVersions = v5->_activeVersions;
    v5->_activeVersions = (NSDictionary *)v7;

    v9 = v5;
  }

  return v5;
}

- (GEOOfflineVersionMetadata)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5;
  GEOOfflineVersionMetadata *v6;
  void *v7;
  void *v8;
  size_t count;
  NSDictionary *v10;
  size_t i;
  void *v12;
  void *v13;
  uint64_t uint64;
  void *v15;
  void *v16;
  NSDictionary *activeVersions;
  GEOOfflineVersionMetadata *v18;
  id v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOOfflineVersionMetadata;
  v6 = -[GEOOfflineVersionMetadata init](&v21, sel_init);
  if (v6)
  {
    xpc_dictionary_get_array(v5, "active_versions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v20 = v5;
      count = xpc_array_get_count(v7);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", count);
      v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (count)
      {
        for (i = 0; i != count; ++i)
        {
          xpc_array_get_dictionary(v8, i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            uint64 = xpc_dictionary_get_uint64(v12, "layer");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v13, "version"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", uint64);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v15, v16);

          }
        }
      }
      activeVersions = v6->_activeVersions;
      v6->_activeVersions = v10;

      v18 = v6;
      v5 = v20;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSDictionary *activeVersions;
  xpc_object_t value;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = xpc_array_create(0, 0);
  activeVersions = self->_activeVersions;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__GEOOfflineVersionMetadata_encodeToXPCDictionary___block_invoke;
  v8[3] = &unk_1E1C12738;
  v9 = v5;
  value = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](activeVersions, "enumerateKeysAndObjectsUsingBlock:", v8);
  xpc_dictionary_set_value(v4, "active_versions", value);

}

void __51__GEOOfflineVersionMetadata_encodeToXPCDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t xdict;

  v5 = a3;
  v6 = a2;
  xdict = xpc_dictionary_create(0, 0, 0);
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  xpc_dictionary_set_uint64(xdict, "layer", v7);
  v8 = objc_msgSend(v5, "unsignedLongLongValue");

  xpc_dictionary_set_uint64(xdict, "version", v8);
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), xdict);

}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_activeVersions, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4[1], "isEqualToDictionary:", self->_activeVersions);
  else
    v5 = 0;

  return v5;
}

- (void)enumerateLayerVersions:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  -[NSDictionary allKeys](self->_activeVersions, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "unsignedIntValue", (_QWORD)v16);
        -[NSDictionary objectForKeyedSubscript:](self->_activeVersions, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedLongLongValue");

        v4[2](v4, v13, v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeVersions, 0);
}

@end
