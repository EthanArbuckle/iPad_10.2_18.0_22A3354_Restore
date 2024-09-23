@implementation GEOBrandInfoMapping

- (GEOBrandInfoMapping)init
{
  GEOBrandInfoMapping *v2;
  GEOBrandInfoMapping *v3;
  GEOBrandInfoMapping *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOBrandInfoMapping;
  v2 = -[GEOBrandInfoMapping init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBrandInfoMapping)initWithData:(id)a3
{
  GEOBrandInfoMapping *v3;
  GEOBrandInfoMapping *v4;
  GEOBrandInfoMapping *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOBrandInfoMapping;
  v3 = -[GEOBrandInfoMapping initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedBOOLClear();
  v3.receiver = self;
  v3.super_class = (Class)GEOBrandInfoMapping;
  -[GEOBrandInfoMapping dealloc](&v3, sel_dealloc);
}

- (unint64_t)globalBrandId
{
  return self->_globalBrandId;
}

- (void)setGlobalBrandId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_globalBrandId = a3;
}

- (void)setHasGlobalBrandId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasGlobalBrandId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readScopedBrandInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBrandInfoMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScopedBrandInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)scopedBrandInfos
{
  -[GEOBrandInfoMapping _readScopedBrandInfos]((uint64_t)self);
  return self->_scopedBrandInfos;
}

- (void)setScopedBrandInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *scopedBrandInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  scopedBrandInfos = self->_scopedBrandInfos;
  self->_scopedBrandInfos = v4;

}

- (void)clearScopedBrandInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_scopedBrandInfos, "removeAllObjects");
}

- (void)addScopedBrandInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBrandInfoMapping _readScopedBrandInfos]((uint64_t)self);
  -[GEOBrandInfoMapping _addNoFlagsScopedBrandInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsScopedBrandInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)scopedBrandInfosCount
{
  -[GEOBrandInfoMapping _readScopedBrandInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_scopedBrandInfos, "count");
}

- (id)scopedBrandInfoAtIndex:(unint64_t)a3
{
  -[GEOBrandInfoMapping _readScopedBrandInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_scopedBrandInfos, "objectAtIndex:", a3);
}

+ (Class)scopedBrandInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readIsoCountryCodes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBrandInfoMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIsoCountryCodes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)isoCountryCodes
{
  -[GEOBrandInfoMapping _readIsoCountryCodes]((uint64_t)self);
  return self->_isoCountryCodes;
}

- (void)setIsoCountryCodes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *isoCountryCodes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  isoCountryCodes = self->_isoCountryCodes;
  self->_isoCountryCodes = v4;

}

- (void)clearIsoCountryCodes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_isoCountryCodes, "removeAllObjects");
}

- (void)addIsoCountryCode:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBrandInfoMapping _readIsoCountryCodes]((uint64_t)self);
  -[GEOBrandInfoMapping _addNoFlagsIsoCountryCode:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsIsoCountryCode:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)isoCountryCodesCount
{
  -[GEOBrandInfoMapping _readIsoCountryCodes]((uint64_t)self);
  return -[NSMutableArray count](self->_isoCountryCodes, "count");
}

- (id)isoCountryCodeAtIndex:(unint64_t)a3
{
  -[GEOBrandInfoMapping _readIsoCountryCodes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_isoCountryCodes, "objectAtIndex:", a3);
}

+ (Class)isoCountryCodeType
{
  return (Class)objc_opt_class();
}

- (void)_readIsSuggesteds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBrandInfoMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIsSuggesteds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)isSuggestedsCount
{
  -[GEOBrandInfoMapping _readIsSuggesteds]((uint64_t)self);
  return self->_isSuggesteds.count;
}

- (BOOL)isSuggesteds
{
  -[GEOBrandInfoMapping _readIsSuggesteds]((uint64_t)self);
  return self->_isSuggesteds.list;
}

- (void)clearIsSuggesteds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedBOOLClear();
}

- (void)addIsSuggested:(BOOL)a3
{
  -[GEOBrandInfoMapping _readIsSuggesteds]((uint64_t)self);
  if (self)
    PBRepeatedBOOLAdd();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (BOOL)isSuggestedAtIndex:(unint64_t)a3
{
  $81BD420485C44FDD3B17AC2C53A57F4D *p_isSuggesteds;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOBrandInfoMapping _readIsSuggesteds]((uint64_t)self);
  p_isSuggesteds = &self->_isSuggesteds;
  count = self->_isSuggesteds.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_isSuggesteds->list[a3];
}

- (void)setIsSuggesteds:(BOOL *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedBOOLSet();
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
  v8.super_class = (Class)GEOBrandInfoMapping;
  -[GEOBrandInfoMapping description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBrandInfoMapping dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBrandInfoMapping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("globalBrandId");
    else
      v6 = CFSTR("global_brand_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = *(id *)(a1 + 56);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation", (_QWORD)v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14, (_QWORD)v21);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("scopedBrandInfo");
    else
      v15 = CFSTR("scoped_brand_info");
    objc_msgSend(v4, "setObject:forKey:", v7, v15, (_QWORD)v21);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend((id)a1, "isoCountryCodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("isoCountryCode");
    else
      v17 = CFSTR("iso_country_code");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedBOOLNSArray();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("isSuggested");
    else
      v19 = CFSTR("is_suggested");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOBrandInfoMapping _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOBrandInfoMapping)initWithDictionary:(id)a3
{
  return (GEOBrandInfoMapping *)-[GEOBrandInfoMapping _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEOScopedBrandInfo *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("globalBrandId");
      else
        v6 = CFSTR("global_brand_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setGlobalBrandId:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("scopedBrandInfo");
      else
        v8 = CFSTR("scoped_brand_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v37 = v9;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v47 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = [GEOScopedBrandInfo alloc];
                if ((a3 & 1) != 0)
                  v17 = -[GEOScopedBrandInfo initWithJSON:](v16, "initWithJSON:", v15);
                else
                  v17 = -[GEOScopedBrandInfo initWithDictionary:](v16, "initWithDictionary:", v15);
                v18 = (void *)v17;
                objc_msgSend(a1, "addScopedBrandInfo:", v17, v37);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          }
          while (v12);
        }

        v9 = v37;
      }

      if (a3)
        v19 = CFSTR("isoCountryCode");
      else
        v19 = CFSTR("iso_country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19, v37);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v43 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = (void *)objc_msgSend(v26, "copy");
                objc_msgSend(a1, "addIsoCountryCode:", v27);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          }
          while (v23);
        }

      }
      if (a3)
        v28 = CFSTR("isSuggested");
      else
        v28 = CFSTR("is_suggested");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v39;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v39 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addIsSuggested:", objc_msgSend(v35, "BOOLValue"));
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          }
          while (v32);
        }

      }
    }
  }

  return a1;
}

- (GEOBrandInfoMapping)initWithJSON:(id)a3
{
  return (GEOBrandInfoMapping *)-[GEOBrandInfoMapping _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_31;
    else
      v8 = (int *)&readAll__nonRecursiveTag_31;
    GEOBrandInfoMappingReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOBrandInfoMappingCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOBrandInfoMappingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOBrandInfoMappingReadAllFrom((uint64_t)self, a3, 0);
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
  $81BD420485C44FDD3B17AC2C53A57F4D *p_isSuggesteds;
  unint64_t v15;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBrandInfoMapping readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_scopedBrandInfos;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_isoCountryCodes;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v11);
    }

    p_isSuggesteds = &self->_isSuggesteds;
    if (p_isSuggesteds->count)
    {
      PBDataWriterPlaceMark();
      if (p_isSuggesteds->count)
      {
        v15 = 0;
        do
        {
          PBDataWriterWriteBOOLField();
          ++v15;
        }
        while (v15 < p_isSuggesteds->count);
      }
      PBDataWriterRecallMark();
    }
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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  id *v15;

  v15 = (id *)a3;
  -[GEOBrandInfoMapping readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 16) = self->_readerMarkPos;
  *((_DWORD *)v15 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v15[5] = (id)self->_globalBrandId;
    *((_BYTE *)v15 + 76) |= 1u;
  }
  if (-[GEOBrandInfoMapping scopedBrandInfosCount](self, "scopedBrandInfosCount"))
  {
    objc_msgSend(v15, "clearScopedBrandInfos");
    v4 = -[GEOBrandInfoMapping scopedBrandInfosCount](self, "scopedBrandInfosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOBrandInfoMapping scopedBrandInfoAtIndex:](self, "scopedBrandInfoAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addScopedBrandInfo:", v7);

      }
    }
  }
  if (-[GEOBrandInfoMapping isoCountryCodesCount](self, "isoCountryCodesCount"))
  {
    objc_msgSend(v15, "clearIsoCountryCodes");
    v8 = -[GEOBrandInfoMapping isoCountryCodesCount](self, "isoCountryCodesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOBrandInfoMapping isoCountryCodeAtIndex:](self, "isoCountryCodeAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addIsoCountryCode:", v11);

      }
    }
  }
  if (-[GEOBrandInfoMapping isSuggestedsCount](self, "isSuggestedsCount"))
  {
    objc_msgSend(v15, "clearIsSuggesteds");
    v12 = -[GEOBrandInfoMapping isSuggestedsCount](self, "isSuggestedsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(v15, "addIsSuggested:", -[GEOBrandInfoMapping isSuggestedAtIndex:](self, "isSuggestedAtIndex:", k));
    }
  }

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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOBrandInfoMappingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOBrandInfoMapping readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_globalBrandId;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = self->_scopedBrandInfos;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addScopedBrandInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_isoCountryCodes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addIsoCountryCode:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  PBRepeatedBOOLCopy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *scopedBrandInfos;
  NSMutableArray *isoCountryCodes;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOBrandInfoMapping readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_globalBrandId != *((_QWORD *)v4 + 5))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  scopedBrandInfos = self->_scopedBrandInfos;
  if ((unint64_t)scopedBrandInfos | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](scopedBrandInfos, "isEqual:"))
  {
    goto LABEL_12;
  }
  isoCountryCodes = self->_isoCountryCodes;
  if ((unint64_t)isoCountryCodes | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](isoCountryCodes, "isEqual:"))
      goto LABEL_12;
  }
  v7 = PBRepeatedBOOLIsEqual();
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOBrandInfoMapping readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_globalBrandId;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_scopedBrandInfos, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_isoCountryCodes, "hash");
  return v4 ^ v5 ^ PBRepeatedBOOLHash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_globalBrandId = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        -[GEOBrandInfoMapping addScopedBrandInfo:](self, "addScopedBrandInfo:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = *((id *)v4 + 6);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        -[GEOBrandInfoMapping addIsoCountryCode:](self, "addIsoCountryCode:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++), (_QWORD)v18);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  v15 = objc_msgSend(v4, "isSuggestedsCount");
  if (v15)
  {
    v16 = v15;
    for (i = 0; i != v16; ++i)
      -[GEOBrandInfoMapping addIsSuggested:](self, "addIsSuggested:", objc_msgSend(v4, "isSuggestedAtIndex:", i, (_QWORD)v18));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedBrandInfos, 0);
  objc_storeStrong((id *)&self->_isoCountryCodes, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
