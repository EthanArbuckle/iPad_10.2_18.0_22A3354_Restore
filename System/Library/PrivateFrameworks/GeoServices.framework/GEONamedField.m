@implementation GEONamedField

- (GEONamedField)init
{
  GEONamedField *v2;
  GEONamedField *v3;
  GEONamedField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONamedField;
  v2 = -[GEONamedField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONamedField)initWithData:(id)a3
{
  GEONamedField *v3;
  GEONamedField *v4;
  GEONamedField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEONamedField;
  v3 = -[GEONamedField initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addValues:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEONamedFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValues_tags_1);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEONamedField _addNoFlagsValues:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsValues:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
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
  v8.super_class = (Class)GEONamedField;
  -[GEONamedField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONamedField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONamedField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEONamedField readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 52) & 2) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEONamedFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_1377);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v7 = *(id *)(a1 + 24);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("values"));
  }
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __43__GEONamedField__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

    }
    else
    {
      v20 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONamedField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = &readAll__recursiveTag_1381;
      else
        v6 = &readAll__nonRecursiveTag_1382;
      GEONamedFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEONamedFieldCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __43__GEONamedField__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (uint64_t)_initWithDictionary:(unsigned int)a3 isJSON:
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  GEONamedFieldValue *v19;
  GEONamedFieldValue *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char v31;
  void *v32;
  GEONamedField *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v38;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v45 = objc_msgSend(a1, "init");
  if (v45)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(v5, "copy");
      v7 = v6;
      *(_BYTE *)(v45 + 52) |= 2u;
      *(_BYTE *)(v45 + 52) |= 8u;
      objc_storeStrong((id *)(v45 + 24), v6);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("values"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = v4;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v8;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v48;
        if (a3)
          v12 = CFSTR("doubleValue");
        else
          v12 = CFSTR("double_value");
        v13 = CFSTR("string_value");
        if (a3)
          v13 = CFSTR("stringValue");
        v43 = v13;
        v44 = v12;
        if (a3)
          v14 = CFSTR("intValue");
        else
          v14 = CFSTR("int_value");
        v15 = CFSTR("BOOL_value");
        if (a3)
          v15 = CFSTR("BOOLValue");
        v41 = v15;
        v42 = v14;
        v16 = CFSTR("mapValue");
        if (!a3)
          v16 = CFSTR("map_value");
        v40 = v16;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v48 != v11)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = [GEONamedFieldValue alloc];
              if (v19)
              {
                v20 = v19;
                v21 = v18;
                v22 = -[GEONamedFieldValue init](v20, "init");
                if (v22)
                {
                  objc_msgSend(v21, "objectForKeyedSubscript:", v44);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v23, "doubleValue");
                    *(_BYTE *)(v22 + 72) |= 0x40u;
                    *(_BYTE *)(v22 + 72) |= 1u;
                    *(_QWORD *)(v22 + 24) = v24;
                  }

                  objc_msgSend(v21, "objectForKeyedSubscript:", v43);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v26 = (void *)objc_msgSend(v25, "copy");
                    v27 = v26;
                    *(_BYTE *)(v22 + 72) |= 0x20u;
                    *(_BYTE *)(v22 + 72) |= 0x40u;
                    objc_storeStrong((id *)(v22 + 48), v26);

                  }
                  objc_msgSend(v21, "objectForKeyedSubscript:", v42);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v29 = objc_msgSend(v28, "longLongValue");
                    *(_BYTE *)(v22 + 72) |= 0x40u;
                    *(_BYTE *)(v22 + 72) |= 2u;
                    *(_QWORD *)(v22 + 32) = v29;
                  }

                  objc_msgSend(v21, "objectForKeyedSubscript:", v41);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v31 = objc_msgSend(v30, "BOOLValue");
                    *(_BYTE *)(v22 + 72) |= 0x40u;
                    *(_BYTE *)(v22 + 72) |= 4u;
                    *(_BYTE *)(v22 + 68) = v31;
                  }

                  objc_msgSend(v21, "objectForKeyedSubscript:", v40);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v33 = [GEONamedField alloc];
                    if (v33)
                      v34 = (void *)-[GEONamedField _initWithDictionary:isJSON:](v33, v32, a3);
                    else
                      v34 = 0;
                    v35 = v34;
                    *(_BYTE *)(v22 + 72) |= 0x10u;
                    *(_BYTE *)(v22 + 72) |= 0x40u;
                    objc_storeStrong((id *)(v22 + 40), v34);

                  }
                }

              }
              else
              {
                v22 = 0;
              }
              -[GEONamedField addValues:](v45, (void *)v22);

            }
            ++v17;
          }
          while (v10 != v17);
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          v10 = v36;
        }
        while (v36);
      }

      v4 = v38;
    }

  }
  return v45;
}

- (BOOL)readFrom:(id)a3
{
  return GEONamedFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEONamedFieldIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEONamedField readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_values;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEONamedFieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONamedField readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_values;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        -[GEONamedField addValues:](v5, v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSMutableArray *values;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEONamedField readAll:]((uint64_t)self, 1),
         -[GEONamedField readAll:]((uint64_t)v4, 1),
         name = self->_name,
         !((unint64_t)name | v4[3]))
     || -[NSString isEqual:](name, "isEqual:")))
  {
    values = self->_values;
    if ((unint64_t)values | v4[4])
      v7 = -[NSMutableArray isEqual:](values, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  -[GEONamedField readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_name, "hash");
  return -[NSMutableArray hash](self->_values, "hash") ^ v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
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
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 52) |= 1u;
    *(_BYTE *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEONamedField readAll:](a1, 0);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(a1 + 32);
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
          if (v8)
          {
            os_unfair_lock_lock_with_options();
            *(_BYTE *)(v8 + 72) |= 8u;
            *(_BYTE *)(v8 + 72) |= 0x40u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 64));
            v9 = *(void **)(v8 + 16);
            *(_QWORD *)(v8 + 16) = 0;

            -[GEONamedFieldValue readAll:](v8, 0);
            -[GEONamedField clearUnknownFields:](*(_QWORD *)(v8 + 40));
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
