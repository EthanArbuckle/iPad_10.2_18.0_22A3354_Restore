@implementation _DKProtobufMetadata

- (id)toPBCodable
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _DKPRMetadataEntry *v13;
  void *v14;
  void *v15;
  int *v17;
  _DKPRMetadata *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[4];
  int v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[_DKProtobufMetadata dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v18 = objc_alloc_init(_DKPRMetadata);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[_DKProtobufMetadata dictionary](self, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      v17 = &v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
          -[_DKProtobufMetadata dictionary](self, "dictionary", v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_alloc_init(_DKPRMetadataEntry);
          -[_DKPRMetadataEntry setKey:]((uint64_t)v13, v10);
          objc_msgSend(v12, "toPBCodable");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKPRMetadataEntry setValue:]((uint64_t)v13, v14);

          -[_DKPRMetadataEntry value]((uint64_t)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[_DKPRMetadata addEntry:]((uint64_t)v18, v13);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            -[_DKEvent(Protobuf) toPBCodableUseStructuredMetadata:].cold.1(v23, (uint64_t)v10, v17);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v7);
    }

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

+ (id)fromPBCodable:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _DKProtobufMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[_DKPRMetadata entrys]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_DKProtobufMetadata *)objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E08];
      -[_DKPRMetadata entrys]((uint64_t)v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v21 = v4;
      -[_DKPRMetadata entrys]((uint64_t)v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            v16 = (void *)MEMORY[0x1E0DE7910];
            -[_DKPRMetadataEntry value](v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "fromPBCodable:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKPRMetadataEntry key](v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v19);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v12);
      }

      v6 = -[_DKProtobufMetadata initWithDictionary:]([_DKProtobufMetadata alloc], "initWithDictionary:", v9);
      v4 = v21;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_DKProtobufMetadata)initWithDictionary:(id)a3
{
  id v5;
  _DKProtobufMetadata *v6;
  _DKProtobufMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKProtobufMetadata;
  v6 = -[_DKProtobufMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

+ (id)createFromData:(id)a3
{
  id v3;
  _DKPRMetadata *v4;
  void *v5;

  v3 = a3;
  v4 = -[_DKPRMetadata initWithData:]([_DKPRMetadata alloc], "initWithData:", v3);

  +[_DKProtobufMetadata fromPBCodable:](_DKProtobufMetadata, "fromPBCodable:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)asData
{
  void *v2;
  void *v3;

  -[_DKProtobufMetadata toPBCodable](self, "toPBCodable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
