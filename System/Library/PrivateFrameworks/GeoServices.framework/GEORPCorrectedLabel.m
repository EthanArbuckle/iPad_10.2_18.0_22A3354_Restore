@implementation GEORPCorrectedLabel

- (GEORPCorrectedLabel)init
{
  GEORPCorrectedLabel *v2;
  GEORPCorrectedLabel *v3;
  GEORPCorrectedLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedLabel;
  v2 = -[GEORPCorrectedLabel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedLabel)initWithData:(id)a3
{
  GEORPCorrectedLabel *v3;
  GEORPCorrectedLabel *v4;
  GEORPCorrectedLabel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedLabel;
  v3 = -[GEORPCorrectedLabel initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalValue_tags_333);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOriginalValue
{
  -[GEORPCorrectedLabel _readOriginalValue]((uint64_t)self);
  return self->_originalValue != 0;
}

- (NSString)originalValue
{
  -[GEORPCorrectedLabel _readOriginalValue]((uint64_t)self);
  return self->_originalValue;
}

- (void)setOriginalValue:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_originalValue, a3);
}

- (void)_readCorrectedValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedValue_tags_334);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCorrectedValue
{
  -[GEORPCorrectedLabel _readCorrectedValue]((uint64_t)self);
  return self->_correctedValue != 0;
}

- (NSString)correctedValue
{
  -[GEORPCorrectedLabel _readCorrectedValue]((uint64_t)self);
  return self->_correctedValue;
}

- (void)setCorrectedValue:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_correctedValue, a3);
}

- (void)_readFeatureRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureRegion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFeatureRegion
{
  -[GEORPCorrectedLabel _readFeatureRegion]((uint64_t)self);
  return self->_featureRegion != 0;
}

- (GEOMapRegion)featureRegion
{
  -[GEORPCorrectedLabel _readFeatureRegion]((uint64_t)self);
  return self->_featureRegion;
}

- (void)setFeatureRegion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_featureRegion, a3);
}

- (void)_readFeatureHandles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureHandles_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)featureHandles
{
  -[GEORPCorrectedLabel _readFeatureHandles]((uint64_t)self);
  return self->_featureHandles;
}

- (void)setFeatureHandles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *featureHandles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  featureHandles = self->_featureHandles;
  self->_featureHandles = v4;

}

- (void)clearFeatureHandles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_featureHandles, "removeAllObjects");
}

- (void)addFeatureHandle:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPCorrectedLabel _readFeatureHandles]((uint64_t)self);
  -[GEORPCorrectedLabel _addNoFlagsFeatureHandle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsFeatureHandle:(uint64_t)a1
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

- (unint64_t)featureHandlesCount
{
  -[GEORPCorrectedLabel _readFeatureHandles]((uint64_t)self);
  return -[NSMutableArray count](self->_featureHandles, "count");
}

- (id)featureHandleAtIndex:(unint64_t)a3
{
  -[GEORPCorrectedLabel _readFeatureHandles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_featureHandles, "objectAtIndex:", a3);
}

+ (Class)featureHandleType
{
  return (Class)objc_opt_class();
}

- (void)_readCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinate_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCoordinate
{
  -[GEORPCorrectedLabel _readCoordinate]((uint64_t)self);
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEORPCorrectedLabel _readCoordinate]((uint64_t)self);
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (unint64_t)uid
{
  return self->_uid;
}

- (void)setUid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_uid = a3;
}

- (void)setHasUid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasUid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)localizedLabels
{
  return self->_localizedLabels;
}

- (void)setLocalizedLabels:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_localizedLabels = a3;
}

- (void)setHasLocalizedLabels:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocalizedLabels
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEORPCorrectedLabel;
  -[GEORPCorrectedLabel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPCorrectedLabel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedLabel _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "originalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("originalValue");
    else
      v6 = CFSTR("original_value");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend((id)a1, "correctedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("correctedValue");
    else
      v8 = CFSTR("corrected_value");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend((id)a1, "featureRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("featureRegion");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("feature_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = *(id *)(a1 + 32);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation", (_QWORD)v30);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20, (_QWORD)v30);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v16);
    }

    if (a2)
      v21 = CFSTR("featureHandle");
    else
      v21 = CFSTR("feature_handle");
    objc_msgSend(v4, "setObject:forKey:", v13, v21, (_QWORD)v30);

  }
  objc_msgSend((id)a1, "coordinate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v22, "jsonRepresentation");
    else
      objc_msgSend(v22, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("coordinate"));

  }
  v25 = *(_BYTE *)(a1 + 80);
  if ((v25 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("uid"));

    v25 = *(_BYTE *)(a1 + 80);
  }
  if ((v25 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("localizedLabels");
    else
      v28 = CFSTR("localized_labels");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPCorrectedLabel _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPCorrectedLabel)initWithDictionary:(id)a3
{
  return (GEORPCorrectedLabel *)-[GEORPCorrectedLabel _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  GEOMapRegion *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  GEORPFeatureHandle *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  GEOLatLng *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("originalValue");
      else
        v6 = CFSTR("original_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setOriginalValue:", v8);

      }
      if (a3)
        v9 = CFSTR("correctedValue");
      else
        v9 = CFSTR("corrected_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setCorrectedValue:", v11);

      }
      if (a3)
        v12 = CFSTR("featureRegion");
      else
        v12 = CFSTR("feature_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEOMapRegion initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEOMapRegion initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setFeatureRegion:", v15);

      }
      if (a3)
        v17 = CFSTR("featureHandle");
      else
        v17 = CFSTR("feature_handle");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v5;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v38 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEORPFeatureHandle alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEORPFeatureHandle initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEORPFeatureHandle initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addFeatureHandle:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v21);
        }

        v5 = v36;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v30 = -[GEOLatLng initWithJSON:](v29, "initWithJSON:", v28);
        else
          v30 = -[GEOLatLng initWithDictionary:](v29, "initWithDictionary:", v28);
        v31 = (void *)v30;
        objc_msgSend(a1, "setCoordinate:", v30);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uid"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setUid:", objc_msgSend(v32, "unsignedLongLongValue"));

      if (a3)
        v33 = CFSTR("localizedLabels");
      else
        v33 = CFSTR("localized_labels");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLocalizedLabels:", objc_msgSend(v34, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPCorrectedLabel)initWithJSON:(id)a3
{
  return (GEORPCorrectedLabel *)-[GEORPCorrectedLabel _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_355;
    else
      v8 = (int *)&readAll__nonRecursiveTag_356;
    GEORPCorrectedLabelReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPCorrectedLabelCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedLabelIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedLabelReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 3u))
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
    -[GEORPCorrectedLabel readAll:](self, "readAll:", 0);
    if (self->_originalValue)
      PBDataWriterWriteStringField();
    if (self->_correctedValue)
      PBDataWriterWriteStringField();
    if (self->_featureRegion)
      PBDataWriterWriteSubmessage();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_featureHandles;
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
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_coordinate)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteBOOLField();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPCorrectedLabel _readCoordinate]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_coordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPCorrectedLabel _readFeatureRegion]((uint64_t)self);
  return -[GEOMapRegion hasGreenTeaWithValue:](self->_featureRegion, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id *v9;

  v9 = (id *)a3;
  -[GEORPCorrectedLabel readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 16) = self->_readerMarkPos;
  *((_DWORD *)v9 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originalValue)
    objc_msgSend(v9, "setOriginalValue:");
  if (self->_correctedValue)
    objc_msgSend(v9, "setCorrectedValue:");
  if (self->_featureRegion)
    objc_msgSend(v9, "setFeatureRegion:");
  if (-[GEORPCorrectedLabel featureHandlesCount](self, "featureHandlesCount"))
  {
    objc_msgSend(v9, "clearFeatureHandles");
    v4 = -[GEORPCorrectedLabel featureHandlesCount](self, "featureHandlesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPCorrectedLabel featureHandleAtIndex:](self, "featureHandleAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addFeatureHandle:", v7);

      }
    }
  }
  if (self->_coordinate)
    objc_msgSend(v9, "setCoordinate:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v9[7] = (id)self->_uid;
    *((_BYTE *)v9 + 80) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v9 + 76) = self->_localizedLabels;
    *((_BYTE *)v9 + 80) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  char flags;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPCorrectedLabelReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPCorrectedLabel readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_originalValue, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_correctedValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOMapRegion copyWithZone:](self->_featureRegion, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = self->_featureHandles;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addFeatureHandle:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  v20 = -[GEOLatLng copyWithZone:](self->_coordinate, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_uid;
    *(_BYTE *)(v5 + 80) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 76) = self->_localizedLabels;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *originalValue;
  NSString *correctedValue;
  GEOMapRegion *featureRegion;
  NSMutableArray *featureHandles;
  GEOLatLng *coordinate;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEORPCorrectedLabel readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  originalValue = self->_originalValue;
  if ((unint64_t)originalValue | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](originalValue, "isEqual:"))
      goto LABEL_19;
  }
  correctedValue = self->_correctedValue;
  if ((unint64_t)correctedValue | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](correctedValue, "isEqual:"))
      goto LABEL_19;
  }
  featureRegion = self->_featureRegion;
  if ((unint64_t)featureRegion | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOMapRegion isEqual:](featureRegion, "isEqual:"))
      goto LABEL_19;
  }
  featureHandles = self->_featureHandles;
  if ((unint64_t)featureHandles | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](featureHandles, "isEqual:"))
      goto LABEL_19;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_uid != *((_QWORD *)v4 + 7))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_19;
  }
  v10 = (*((_BYTE *)v4 + 80) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0)
    {
LABEL_19:
      v10 = 0;
      goto LABEL_20;
    }
    if (self->_localizedLabels)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_19;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_19;
    }
    v10 = 1;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEORPCorrectedLabel readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_originalValue, "hash");
  v4 = -[NSString hash](self->_correctedValue, "hash");
  v5 = -[GEOMapRegion hash](self->_featureRegion, "hash");
  v6 = -[NSMutableArray hash](self->_featureHandles, "hash");
  v7 = -[GEOLatLng hash](self->_coordinate, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v8 = 2654435761u * self->_uid;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_localizedLabels;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOMapRegion *featureRegion;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEOLatLng *coordinate;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 6))
    -[GEORPCorrectedLabel setOriginalValue:](self, "setOriginalValue:");
  if (*((_QWORD *)v4 + 3))
    -[GEORPCorrectedLabel setCorrectedValue:](self, "setCorrectedValue:");
  featureRegion = self->_featureRegion;
  v6 = *((_QWORD *)v4 + 5);
  if (featureRegion)
  {
    if (v6)
      -[GEOMapRegion mergeFrom:](featureRegion, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPCorrectedLabel setFeatureRegion:](self, "setFeatureRegion:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *((id *)v4 + 4);
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
        -[GEORPCorrectedLabel addFeatureHandle:](self, "addFeatureHandle:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  coordinate = self->_coordinate;
  v13 = *((_QWORD *)v4 + 2);
  if (coordinate)
  {
    if (v13)
      -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPCorrectedLabel setCoordinate:](self, "setCoordinate:");
  }
  v14 = *((_BYTE *)v4 + 80);
  if ((v14 & 1) != 0)
  {
    self->_uid = *((_QWORD *)v4 + 7);
    *(_BYTE *)&self->_flags |= 1u;
    v14 = *((_BYTE *)v4 + 80);
  }
  if ((v14 & 2) != 0)
  {
    self->_localizedLabels = *((_BYTE *)v4 + 76);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_featureRegion, 0);
  objc_storeStrong((id *)&self->_featureHandles, 0);
  objc_storeStrong((id *)&self->_correctedValue, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
