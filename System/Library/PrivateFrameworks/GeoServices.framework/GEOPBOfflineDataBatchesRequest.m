@implementation GEOPBOfflineDataBatchesRequest

- (GEOPBOfflineDataBatchesRequest)init
{
  GEOPBOfflineDataBatchesRequest *v2;
  GEOPBOfflineDataBatchesRequest *v3;
  GEOPBOfflineDataBatchesRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineDataBatchesRequest;
  v2 = -[GEOPBOfflineDataBatchesRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineDataBatchesRequest)initWithData:(id)a3
{
  GEOPBOfflineDataBatchesRequest *v3;
  GEOPBOfflineDataBatchesRequest *v4;
  GEOPBOfflineDataBatchesRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineDataBatchesRequest;
  v3 = -[GEOPBOfflineDataBatchesRequest initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPBOfflineDataBatchesRequest;
  -[GEOPBOfflineDataBatchesRequest dealloc](&v3, sel_dealloc);
}

- (void)_readRegion
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
        GEOPBOfflineDataBatchesRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegion_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasRegion
{
  -[GEOPBOfflineDataBatchesRequest _readRegion]((uint64_t)self);
  return self->_region != 0;
}

- (GEOMapRegion)region
{
  -[GEOPBOfflineDataBatchesRequest _readRegion]((uint64_t)self);
  return self->_region;
}

- (void)setRegion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_region, a3);
}

- (void)_readSupportedLanguages
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
        GEOPBOfflineDataBatchesRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedLanguages_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)supportedLanguages
{
  -[GEOPBOfflineDataBatchesRequest _readSupportedLanguages]((uint64_t)self);
  return self->_supportedLanguages;
}

- (void)setSupportedLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *supportedLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  supportedLanguages = self->_supportedLanguages;
  self->_supportedLanguages = v4;

}

- (void)clearSupportedLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_supportedLanguages, "removeAllObjects");
}

- (void)addSupportedLanguage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBOfflineDataBatchesRequest _readSupportedLanguages]((uint64_t)self);
  -[GEOPBOfflineDataBatchesRequest _addNoFlagsSupportedLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1
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

- (unint64_t)supportedLanguagesCount
{
  -[GEOPBOfflineDataBatchesRequest _readSupportedLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_supportedLanguages, "count");
}

- (id)supportedLanguageAtIndex:(unint64_t)a3
{
  -[GEOPBOfflineDataBatchesRequest _readSupportedLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedLanguages, "objectAtIndex:", a3);
}

+ (Class)supportedLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readLayers
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
        GEOPBOfflineDataBatchesRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLayers_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)layersCount
{
  -[GEOPBOfflineDataBatchesRequest _readLayers]((uint64_t)self);
  return self->_layers.count;
}

- (int)layers
{
  -[GEOPBOfflineDataBatchesRequest _readLayers]((uint64_t)self);
  return self->_layers.list;
}

- (void)clearLayers
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Clear();
}

- (void)addLayers:(int)a3
{
  -[GEOPBOfflineDataBatchesRequest _readLayers]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (int)layersAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_layers;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPBOfflineDataBatchesRequest _readLayers]((uint64_t)self);
  p_layers = &self->_layers;
  count = self->_layers.count;
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
  return p_layers->list[a3];
}

- (void)setLayers:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Set();
}

- (id)layersAsString:(int)a3
{
  if (a3 < 0x15)
    return off_1E1C21D80[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLayers:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_FARPOINT_METADATA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_ROUTING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_POI_SEARCH_AND_PLACES")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_VECTOR_PARSEC_INDEX")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_REVGEO")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_VECTOR_PARSEC_DATA")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_GEO_SEARCH")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_SEARCH_STATIC_CONTENT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_VECTOR_TILE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_BROWSE_AND_CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_VECTOR_ASSET")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_SEARCH_ML_MODELS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_ROUTING_V2")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_ROUTING_V2_TRANSIT")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_ROUTING_V2_TRAFFIC_INCIDENTS")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_GEO_SEARCH_V2")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_ROUTING_V3")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_METADATA")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_TRANSIT")) & 1) != 0)
  {
    v4 = 19;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_TRAFFIC_INCIDENTS")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)clientVersionModifier
{
  return self->_clientVersionModifier;
}

- (void)setClientVersionModifier:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_clientVersionModifier = a3;
}

- (void)setHasClientVersionModifier:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasClientVersionModifier
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOPBOfflineDataBatchesRequest;
  -[GEOPBOfflineDataBatchesRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineDataBatchesRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataBatchesRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("region"));

    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend((id)a1, "supportedLanguages");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("supportedLanguage");
      else
        v9 = CFSTR("supported_language");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v12 = 0;
        do
        {
          v13 = *(int *)(*v11 + 4 * v12);
          if (v13 >= 0x15)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = off_1E1C21D80[v13];
          }
          objc_msgSend(v10, "addObject:", v14);

          ++v12;
          v11 = (_QWORD *)(a1 + 16);
        }
        while (v12 < *(_QWORD *)(a1 + 24));
      }
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("layers"));

    }
    if ((*(_BYTE *)(a1 + 76) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v16 = CFSTR("clientVersionModifier");
      else
        v16 = CFSTR("client_version_modifier");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineDataBatchesRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPBOfflineDataBatchesRequest)initWithDictionary:(id)a3
{
  return (GEOPBOfflineDataBatchesRequest *)-[GEOPBOfflineDataBatchesRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOMapRegion *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v32;
  id v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("region"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOMapRegion initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOMapRegion initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(v6, "setRegion:", v9);

      }
      if (a3)
        v11 = CFSTR("supportedLanguage");
      else
        v11 = CFSTR("supported_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v34 = a3;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v40 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = (void *)objc_msgSend(v18, "copy");
                objc_msgSend(v6, "addSupportedLanguage:", v19);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          }
          while (v15);
        }

        a3 = v34;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("layers"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v20;
        v33 = v5;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (!v22)
          goto LABEL_78;
        v23 = v22;
        v24 = *(_QWORD *)v36;
        while (1)
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = v26;
              if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_UNKNOWN")) & 1) != 0)
              {
                v28 = 0;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_FARPOINT_METADATA")) & 1) != 0)
              {
                v28 = 1;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_ROUTING")) & 1) != 0)
              {
                v28 = 2;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_POI_SEARCH_AND_PLACES")) & 1) != 0)
              {
                v28 = 3;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_VECTOR_PARSEC_INDEX")) & 1) != 0)
              {
                v28 = 4;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_REVGEO")) & 1) != 0)
              {
                v28 = 5;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_VECTOR_PARSEC_DATA")) & 1) != 0)
              {
                v28 = 6;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_GEO_SEARCH")) & 1) != 0)
              {
                v28 = 7;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_SEARCH_STATIC_CONTENT")) & 1) != 0)
              {
                v28 = 8;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_VECTOR_TILE")) & 1) != 0)
              {
                v28 = 9;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_BROWSE_AND_CATEGORY_SEARCH")) & 1) != 0)
              {
                v28 = 10;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_VECTOR_ASSET")) & 1) != 0)
              {
                v28 = 11;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_SEARCH_ML_MODELS")) & 1) != 0)
              {
                v28 = 12;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_ROUTING_V2")) & 1) != 0)
              {
                v28 = 13;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_ROUTING_V2_TRANSIT")) & 1) != 0)
              {
                v28 = 14;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_ROUTING_V2_TRAFFIC_INCIDENTS")) & 1) != 0)
              {
                v28 = 15;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_GEO_SEARCH_V2")) & 1) != 0)
              {
                v28 = 16;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_ROUTING_V3")) & 1) != 0)
              {
                v28 = 17;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_METADATA")) & 1) != 0)
              {
                v28 = 18;
              }
              else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_TRANSIT")) & 1) != 0)
              {
                v28 = 19;
              }
              else if (objc_msgSend(v27, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_TRAFFIC_INCIDENTS")))
              {
                v28 = 20;
              }
              else
              {
                v28 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v28 = objc_msgSend(v26, "intValue");
            }
            objc_msgSend(v6, "addLayers:", v28);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (!v23)
          {
LABEL_78:

            v20 = v32;
            v5 = v33;
            a3 = v34;
            break;
          }
        }
      }

      if (a3)
        v29 = CFSTR("clientVersionModifier");
      else
        v29 = CFSTR("client_version_modifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setClientVersionModifier:", objc_msgSend(v30, "unsignedLongLongValue"));

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOPBOfflineDataBatchesRequest)initWithJSON:(id)a3
{
  return (GEOPBOfflineDataBatchesRequest *)-[GEOPBOfflineDataBatchesRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_78;
    else
      v8 = (int *)&readAll__nonRecursiveTag_79;
    GEOPBOfflineDataBatchesRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOMapRegion readAll:](self->_region, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  BOOL v34;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          if (v16 != 2 || !PBReaderPlaceMark() || !GEOMapRegionIsValid((char *)a3))
            goto LABEL_56;
          goto LABEL_22;
        case 2u:
          if (v16 == 2)
            goto LABEL_24;
          goto LABEL_56;
        case 3u:
          if (v16 == 2)
          {
            if (!PBReaderPlaceMark())
            {
LABEL_56:
              PBReaderRecallMark();
              return 0;
            }
LABEL_45:
            while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5))
            {
              v29 = *((unsigned __int8 *)a3 + *v6);
              if (*((_BYTE *)a3 + *v6))
                break;
              while (1)
              {
                v30 = *v4;
                v31 = *(_QWORD *)((char *)a3 + v30);
                if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
                  break;
                v32 = v31 + 1;
                v33 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v31);
                *(_QWORD *)((char *)a3 + v30) = v32;
                if (v33 < 0)
                {
                  v14 = v29++ >= 9;
                  if (!v14)
                    continue;
                }
                goto LABEL_45;
              }
              *((_BYTE *)a3 + *v6) = 1;
            }
LABEL_22:
            PBReaderRecallMark();
          }
          else
          {
            if ((v10 & 7) != 0)
              goto LABEL_56;
            while (1)
            {
              v18 = *v4;
              v19 = *(_QWORD *)((char *)a3 + v18);
              if (v19 == -1 || v19 >= *(_QWORD *)((char *)a3 + *v5))
                break;
              v20 = v19 + 1;
              v21 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v19);
              *(_QWORD *)((char *)a3 + v18) = v20;
              if (v21 < 0)
              {
                v22 = v16++;
                if (v22 <= 8)
                  continue;
              }
              goto LABEL_42;
            }
LABEL_41:
            *((_BYTE *)a3 + *v6) = 1;
          }
LABEL_42:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_54;
          break;
        case 4u:
          if ((v10 & 7) != 0)
            goto LABEL_56;
          v23 = 0;
          while (1)
          {
            v24 = *v4;
            v25 = *(_QWORD *)((char *)a3 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_41;
            v26 = v25 + 1;
            v27 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v25);
            *(_QWORD *)((char *)a3 + v24) = v26;
            if (v27 < 0 && v23++ <= 8)
              continue;
            goto LABEL_42;
          }
        default:
LABEL_24:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_56;
          goto LABEL_42;
      }
    }
  }
LABEL_54:
  v34 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v34;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineDataBatchesRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBOfflineDataBatchesRequest readAll:](self, "readAll:", 0);
    if (self->_region)
      PBDataWriterWriteSubmessage();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_supportedLanguages;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_layers.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_layers.count);
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPBOfflineDataBatchesRequest _readRegion]((uint64_t)self);
  return -[GEOMapRegion hasGreenTeaWithValue:](self->_region, "hasGreenTeaWithValue:", v3);
}

- (unsigned)requestTypeCode
{
  return 1028;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
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
  id *v11;

  v11 = (id *)a3;
  -[GEOPBOfflineDataBatchesRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 16) = self->_readerMarkPos;
  *((_DWORD *)v11 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_region)
    objc_msgSend(v11, "setRegion:");
  if (-[GEOPBOfflineDataBatchesRequest supportedLanguagesCount](self, "supportedLanguagesCount"))
  {
    objc_msgSend(v11, "clearSupportedLanguages");
    v4 = -[GEOPBOfflineDataBatchesRequest supportedLanguagesCount](self, "supportedLanguagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPBOfflineDataBatchesRequest supportedLanguageAtIndex:](self, "supportedLanguageAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSupportedLanguage:", v7);

      }
    }
  }
  if (-[GEOPBOfflineDataBatchesRequest layersCount](self, "layersCount"))
  {
    objc_msgSend(v11, "clearLayers");
    v8 = -[GEOPBOfflineDataBatchesRequest layersCount](self, "layersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v11, "addLayers:", -[GEOPBOfflineDataBatchesRequest layersAtIndex:](self, "layersAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v11[5] = (id)self->_clientVersionModifier;
    *((_BYTE *)v11 + 76) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
      GEOPBOfflineDataBatchesRequestReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflineDataBatchesRequest readAll:](self, "readAll:", 0);
  v9 = -[GEOMapRegion copyWithZone:](self->_region, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_supportedLanguages;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addSupportedLanguage:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_clientVersionModifier;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *region;
  NSMutableArray *supportedLanguages;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPBOfflineDataBatchesRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  region = self->_region;
  if ((unint64_t)region | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOMapRegion isEqual:](region, "isEqual:"))
      goto LABEL_11;
  }
  supportedLanguages = self->_supportedLanguages;
  if ((unint64_t)supportedLanguages | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](supportedLanguages, "isEqual:"))
      goto LABEL_11;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_11;
  v7 = (*((_BYTE *)v4 + 76) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) != 0 && self->_clientVersionModifier == *((_QWORD *)v4 + 5))
    {
      v7 = 1;
      goto LABEL_12;
    }
LABEL_11:
    v7 = 0;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[GEOPBOfflineDataBatchesRequest readAll:](self, "readAll:", 1);
  v3 = -[GEOMapRegion hash](self->_region, "hash");
  v4 = -[NSMutableArray hash](self->_supportedLanguages, "hash");
  v5 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761u * self->_clientVersionModifier;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOMapRegion *region;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  region = self->_region;
  v6 = *((_QWORD *)v4 + 6);
  if (region)
  {
    if (v6)
      -[GEOMapRegion mergeFrom:](region, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOPBOfflineDataBatchesRequest setRegion:](self, "setRegion:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *((id *)v4 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[GEOPBOfflineDataBatchesRequest addSupportedLanguage:](self, "addSupportedLanguage:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v12 = objc_msgSend(v4, "layersCount");
  if (v12)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
      -[GEOPBOfflineDataBatchesRequest addLayers:](self, "addLayers:", objc_msgSend(v4, "layersAtIndex:", j, (_QWORD)v15));
  }
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_clientVersionModifier = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
