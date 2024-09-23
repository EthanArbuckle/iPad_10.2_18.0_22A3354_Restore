@implementation GEOBusinessOptions

- (GEOBusinessOptions)init
{
  GEOBusinessOptions *v2;
  GEOBusinessOptions *v3;
  GEOBusinessOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOBusinessOptions;
  v2 = -[GEOBusinessOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBusinessOptions)initWithData:(id)a3
{
  GEOBusinessOptions *v3;
  GEOBusinessOptions *v4;
  GEOBusinessOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOBusinessOptions;
  v3 = -[GEOBusinessOptions initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhotoOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)photoOptions
{
  -[GEOBusinessOptions _readPhotoOptions]((uint64_t)self);
  return self->_photoOptions;
}

- (void)setPhotoOptions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *photoOptions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  photoOptions = self->_photoOptions;
  self->_photoOptions = v4;

}

- (void)clearPhotoOptions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_photoOptions, "removeAllObjects");
}

- (void)addPhotoOptions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusinessOptions _readPhotoOptions]((uint64_t)self);
  -[GEOBusinessOptions _addNoFlagsPhotoOptions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsPhotoOptions:(uint64_t)a1
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

- (unint64_t)photoOptionsCount
{
  -[GEOBusinessOptions _readPhotoOptions]((uint64_t)self);
  return -[NSMutableArray count](self->_photoOptions, "count");
}

- (id)photoOptionsAtIndex:(unint64_t)a3
{
  -[GEOBusinessOptions _readPhotoOptions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_photoOptions, "objectAtIndex:", a3);
}

+ (Class)photoOptionsType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributeKeys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributeKeys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)attributeKeys
{
  -[GEOBusinessOptions _readAttributeKeys]((uint64_t)self);
  return self->_attributeKeys;
}

- (void)setAttributeKeys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *attributeKeys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  attributeKeys = self->_attributeKeys;
  self->_attributeKeys = v4;

}

- (void)clearAttributeKeys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_attributeKeys, "removeAllObjects");
}

- (void)addAttributeKey:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBusinessOptions _readAttributeKeys]((uint64_t)self);
  -[GEOBusinessOptions _addNoFlagsAttributeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsAttributeKey:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)attributeKeysCount
{
  -[GEOBusinessOptions _readAttributeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_attributeKeys, "count");
}

- (id)attributeKeyAtIndex:(unint64_t)a3
{
  -[GEOBusinessOptions _readAttributeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_attributeKeys, "objectAtIndex:", a3);
}

+ (Class)attributeKeyType
{
  return (Class)objc_opt_class();
}

- (BOOL)includeBusinessHours
{
  return self->_includeBusinessHours;
}

- (void)setIncludeBusinessHours:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_includeBusinessHours = a3;
}

- (void)setHasIncludeBusinessHours:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIncludeBusinessHours
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)maxBusinessResults
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_maxBusinessResults;
  else
    return 1;
}

- (void)setMaxBusinessResults:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_maxBusinessResults = a3;
}

- (void)setHasMaxBusinessResults:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasMaxBusinessResults
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)includeCenter
{
  return self->_includeCenter;
}

- (void)setIncludeCenter:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_includeCenter = a3;
}

- (void)setHasIncludeCenter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIncludeCenter
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOBusinessOptions;
  -[GEOBusinessOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBusinessOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBusinessOptions _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("photoOptions"));
  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend((id)a1, "attributeKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("attributeKey"));

  }
  v14 = *(_BYTE *)(a1 + 60);
  if ((v14 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
      goto LABEL_18;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 52));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("maxBusinessResults"));

    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("includeBusinessHours"));

  v14 = *(_BYTE *)(a1 + 60);
  if ((v14 & 1) != 0)
    goto LABEL_26;
LABEL_18:
  if ((v14 & 4) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("includeCenter"));

  }
LABEL_20:
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __48__GEOBusinessOptions__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v20 = v19;
      v26 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v25);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOBusinessOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOBusinessOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOBusinessOptions)initWithDictionary:(id)a3
{
  return (GEOBusinessOptions *)-[GEOBusinessOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOPhotoOptions *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photoOptions"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v5;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v34 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = [GEOPhotoOptions alloc];
                if ((a3 & 1) != 0)
                  v14 = -[GEOPhotoOptions initWithJSON:](v13, "initWithJSON:", v12);
                else
                  v14 = -[GEOPhotoOptions initWithDictionary:](v13, "initWithDictionary:", v12);
                v15 = (void *)v14;
                objc_msgSend(a1, "addPhotoOptions:", v14);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          }
          while (v9);
        }

        v5 = v28;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributeKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v30 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = (void *)objc_msgSend(v22, "copy");
                objc_msgSend(a1, "addAttributeKey:", v23);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v19);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeBusinessHours"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeBusinessHours:", objc_msgSend(v24, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxBusinessResults"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxBusinessResults:", objc_msgSend(v25, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeCenter"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeCenter:", objc_msgSend(v26, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOBusinessOptions)initWithJSON:(id)a3
{
  return (GEOBusinessOptions *)-[GEOBusinessOptions _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_368;
    else
      v8 = (int *)&readAll__nonRecursiveTag_369;
    GEOBusinessOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOBusinessOptionsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOBusinessOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOBusinessOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  char flags;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x70) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBusinessOptions readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_photoOptions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = self->_attributeKeys;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v11);
    }

    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  char flags;
  id *v13;

  v13 = (id *)a3;
  -[GEOBusinessOptions readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 10) = self->_readerMarkPos;
  *((_DWORD *)v13 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOBusinessOptions photoOptionsCount](self, "photoOptionsCount"))
  {
    objc_msgSend(v13, "clearPhotoOptions");
    v4 = -[GEOBusinessOptions photoOptionsCount](self, "photoOptionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOBusinessOptions photoOptionsAtIndex:](self, "photoOptionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addPhotoOptions:", v7);

      }
    }
  }
  if (-[GEOBusinessOptions attributeKeysCount](self, "attributeKeysCount"))
  {
    objc_msgSend(v13, "clearAttributeKeys");
    v8 = -[GEOBusinessOptions attributeKeysCount](self, "attributeKeysCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOBusinessOptions attributeKeyAtIndex:](self, "attributeKeyAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAttributeKey:", v11);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_11;
LABEL_15:
    *((_DWORD *)v13 + 13) = self->_maxBusinessResults;
    *((_BYTE *)v13 + 60) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *((_BYTE *)v13 + 56) = self->_includeBusinessHours;
  *((_BYTE *)v13 + 60) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_15;
LABEL_11:
  if ((flags & 4) != 0)
  {
LABEL_12:
    *((_BYTE *)v13 + 57) = self->_includeCenter;
    *((_BYTE *)v13 + 60) |= 4u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char flags;
  PBUnknownFields *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBusinessOptions readAll:](self, "readAll:", 0);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = self->_photoOptions;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
          objc_msgSend((id)v5, "addPhotoOptions:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = self->_attributeKeys;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v14);
          v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
          objc_msgSend((id)v5, "addAttributeKey:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_BYTE *)(v5 + 56) = self->_includeBusinessHours;
      *(_BYTE *)(v5 + 60) |= 2u;
      flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_21:
        if ((flags & 4) == 0)
        {
LABEL_23:
          v20 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v20;
          goto LABEL_24;
        }
LABEL_22:
        *(_BYTE *)(v5 + 57) = self->_includeCenter;
        *(_BYTE *)(v5 + 60) |= 4u;
        goto LABEL_23;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      goto LABEL_21;
    }
    *(_DWORD *)(v5 + 52) = self->_maxBusinessResults;
    *(_BYTE *)(v5 + 60) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOBusinessOptionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_24:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *photoOptions;
  NSMutableArray *attributeKeys;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOBusinessOptions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  photoOptions = self->_photoOptions;
  if ((unint64_t)photoOptions | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](photoOptions, "isEqual:"))
      goto LABEL_21;
  }
  attributeKeys = self->_attributeKeys;
  if ((unint64_t)attributeKeys | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](attributeKeys, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0)
      goto LABEL_21;
    if (self->_includeBusinessHours)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_maxBusinessResults != *((_DWORD *)v4 + 13))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_21;
  }
  v7 = (*((_BYTE *)v4 + 60) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) != 0)
    {
      if (self->_includeCenter)
      {
        if (!*((_BYTE *)v4 + 57))
          goto LABEL_21;
      }
      else if (*((_BYTE *)v4 + 57))
      {
        goto LABEL_21;
      }
      v7 = 1;
      goto LABEL_22;
    }
LABEL_21:
    v7 = 0;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOBusinessOptions readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_photoOptions, "hash");
  v4 = -[NSMutableArray hash](self->_attributeKeys, "hash");
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_includeBusinessHours;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_maxBusinessResults;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_includeCenter;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[GEOBusinessOptions addPhotoOptions:](self, "addPhotoOptions:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[GEOBusinessOptions addAttributeKey:](self, "addAttributeKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  v15 = *((_BYTE *)v4 + 60);
  if ((v15 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0)
      goto LABEL_17;
LABEL_21:
    self->_maxBusinessResults = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v4 + 60) & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  self->_includeBusinessHours = *((_BYTE *)v4 + 56);
  *(_BYTE *)&self->_flags |= 2u;
  v15 = *((_BYTE *)v4 + 60);
  if ((v15 & 1) != 0)
    goto LABEL_21;
LABEL_17:
  if ((v15 & 4) != 0)
  {
LABEL_18:
    self->_includeCenter = *((_BYTE *)v4 + 57);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_19:

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOBusinessOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_372);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOBusinessOptions readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_photoOptions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoOptions, 0);
  objc_storeStrong((id *)&self->_attributeKeys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
