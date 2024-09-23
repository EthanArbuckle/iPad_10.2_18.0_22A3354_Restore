@implementation GEOPDSearchQueryTokenImportanceMetadata

- (void)addTokenImportance:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryTokenImportanceMetadata;
  -[GEOPDSearchQueryTokenImportanceMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryTokenImportanceMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryTokenImportanceMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = *(id *)(a1 + 8);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("tokenImportance");
    else
      v13 = CFSTR("token_importance");
    objc_msgSend(v4, "setObject:forKey:", v5, v13, (_QWORD)v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryTokenImportanceMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __objc2_class_ro **p_info;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __objc2_class_ro **v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("tokenImportance");
    else
      v7 = CFSTR("token_importance");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v8;
      v33 = v5;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v10)
      {
        v11 = v10;
        p_info = GEOPDSearchCapabilitiesParameters.info;
        v13 = *(_QWORD *)v36;
        v34 = v6;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v36 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = objc_alloc((Class)(p_info + 456));
              if (v16)
              {
                v17 = v16;
                v18 = v15;
                v19 = objc_msgSend(v17, "init");
                if (v19)
                {
                  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("token"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v21 = v13;
                    v22 = v11;
                    v23 = p_info;
                    v24 = v9;
                    v25 = (void *)objc_msgSend(v20, "copy");
                    v26 = v25;
                    v27 = v25;
                    v9 = v24;
                    p_info = v23;
                    v11 = v22;
                    v13 = v21;
                    objc_storeStrong((id *)(v19 + 8), v27);

                    v6 = v34;
                  }

                  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("score"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v28, "floatValue");
                    *(_BYTE *)(v19 + 20) |= 1u;
                    *(_DWORD *)(v19 + 16) = v29;
                  }

                }
              }
              else
              {
                v19 = 0;
              }
              -[GEOPDSearchQueryTokenImportanceMetadata addTokenImportance:](v6, (void *)v19);

            }
            ++v14;
          }
          while (v11 != v14);
          v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          v11 = v30;
        }
        while (v30);
      }

      v8 = v32;
      v5 = v33;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryTokenImportanceMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_tokenImportances;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_tokenImportances;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        -[GEOPDSearchQueryTokenImportanceMetadata addTokenImportance:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *tokenImportances;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    tokenImportances = self->_tokenImportances;
    if ((unint64_t)tokenImportances | v4[1])
      v6 = -[NSMutableArray isEqual:](tokenImportances, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_tokenImportances, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenImportances, 0);
}

@end
