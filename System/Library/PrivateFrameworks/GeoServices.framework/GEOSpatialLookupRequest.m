@implementation GEOSpatialLookupRequest

- (GEOSpatialLookupRequest)init
{
  GEOSpatialLookupRequest *v2;
  GEOSpatialLookupRequest *v3;
  GEOSpatialLookupRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSpatialLookupRequest;
  v2 = -[GEOSpatialLookupRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSpatialLookupRequest)initWithData:(id)a3
{
  GEOSpatialLookupRequest *v3;
  GEOSpatialLookupRequest *v4;
  GEOSpatialLookupRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSpatialLookupRequest;
  v3 = -[GEOSpatialLookupRequest initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOSpatialLookupRequest;
  -[GEOSpatialLookupRequest dealloc](&v3, sel_dealloc);
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOLatLng)center
{
  -[GEOSpatialLookupRequest _readCenter]((uint64_t)self);
  return self->_center;
}

- (void)setCenter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (int)radius
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_radius;
  else
    return 200;
}

- (void)setRadius:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)maxResults
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_maxResults;
  else
    return 200;
}

- (void)setMaxResults:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasMaxResults
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorys_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (unint64_t)categorysCount
{
  -[GEOSpatialLookupRequest _readCategorys]((uint64_t)self);
  return self->_categorys.count;
}

- (int)categorys
{
  -[GEOSpatialLookupRequest _readCategorys]((uint64_t)self);
  return self->_categorys.list;
}

- (void)clearCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Clear();
}

- (void)addCategory:(int)a3
{
  -[GEOSpatialLookupRequest _readCategorys]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (int)categoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_categorys;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOSpatialLookupRequest _readCategorys]((uint64_t)self);
  p_categorys = &self->_categorys;
  count = self->_categorys.count;
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
  return p_categorys->list[a3];
}

- (void)setCategorys:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Set();
}

- (id)categorysAsString:(int)a3
{
  if (a3 < 0x17)
    return off_1E1C0D668[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCategorys:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_ENTERTAINMENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_AMUSEMENTPARK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_AQUARIUM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_ZOO")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_STADIUM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_SKATE_PARK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_CULTURE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_LANDMARK")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_MUSEUM")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_RESTAURANT")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_PARK")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_AIRPORT")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_SHOPPING")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_BEACH")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_MOUNTAIN")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_FITNESS")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_ACTIVITY")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_DIVING")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_HIKING")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_PERFORMANCE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_HOSPITAL")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOSpatialLookupRequest;
  -[GEOSpatialLookupRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSpatialLookupRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpatialLookupRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "center");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("center"));

    }
    v8 = *(_BYTE *)(a1 + 68);
    if ((v8 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("radius"));

      v8 = *(_BYTE *)(a1 + 68);
    }
    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 60));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("maxResults");
      else
        v11 = CFSTR("max_results");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v14 = 0;
        do
        {
          v15 = *(int *)(*v13 + 4 * v14);
          if (v15 >= 0x17)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E1C0D668[v15];
          }
          objc_msgSend(v12, "addObject:", v16);

          ++v14;
          v13 = (_QWORD *)(a1 + 16);
        }
        while (v14 < *(_QWORD *)(a1 + 24));
      }
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("category"));

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
  return -[GEOSpatialLookupRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSpatialLookupRequest)initWithDictionary:(id)a3
{
  return (GEOSpatialLookupRequest *)-[GEOSpatialLookupRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOLatLng *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(v6, "setCenter:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radius"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setRadius:", objc_msgSend(v11, "intValue"));

      if (a3)
        v12 = CFSTR("maxResults");
      else
        v12 = CFSTR("max_results");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setMaxResults:", objc_msgSend(v13, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v14;
        v25 = v5;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (!v16)
          goto LABEL_75;
        v17 = v16;
        v18 = *(_QWORD *)v27;
        while (1)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = v20;
              if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_UNKNOWN")) & 1) != 0)
              {
                v22 = 0;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_ENTERTAINMENT")) & 1) != 0)
              {
                v22 = 1;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_AMUSEMENTPARK")) & 1) != 0)
              {
                v22 = 2;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_AQUARIUM")) & 1) != 0)
              {
                v22 = 3;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_ZOO")) & 1) != 0)
              {
                v22 = 4;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_STADIUM")) & 1) != 0)
              {
                v22 = 5;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_SKATE_PARK")) & 1) != 0)
              {
                v22 = 6;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_CULTURE")) & 1) != 0)
              {
                v22 = 7;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_LANDMARK")) & 1) != 0)
              {
                v22 = 8;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_MUSEUM")) & 1) != 0)
              {
                v22 = 9;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_RESTAURANT")) & 1) != 0)
              {
                v22 = 10;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) != 0)
              {
                v22 = 11;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_PARK")) & 1) != 0)
              {
                v22 = 12;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_AIRPORT")) & 1) != 0)
              {
                v22 = 13;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_SHOPPING")) & 1) != 0)
              {
                v22 = 14;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_BEACH")) & 1) != 0)
              {
                v22 = 15;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_MOUNTAIN")) & 1) != 0)
              {
                v22 = 16;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_FITNESS")) & 1) != 0)
              {
                v22 = 17;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_ACTIVITY")) & 1) != 0)
              {
                v22 = 18;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_DIVING")) & 1) != 0)
              {
                v22 = 19;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_HIKING")) & 1) != 0)
              {
                v22 = 20;
              }
              else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_PERFORMANCE")) & 1) != 0)
              {
                v22 = 21;
              }
              else if (objc_msgSend(v21, "isEqualToString:", CFSTR("SPATIAL_LOOKUP_CATEGORY_HOSPITAL")))
              {
                v22 = 22;
              }
              else
              {
                v22 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v22 = objc_msgSend(v20, "intValue");
            }
            objc_msgSend(v6, "addCategory:", v22, v24, v25, (_QWORD)v26);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (!v17)
          {
LABEL_75:

            v14 = v24;
            v5 = v25;
            break;
          }
        }
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOSpatialLookupRequest)initWithJSON:(id)a3
{
  return (GEOSpatialLookupRequest *)-[GEOSpatialLookupRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_144_1;
    else
      v8 = (int *)&readAll__nonRecursiveTag_145_1;
    GEOSpatialLookupRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLatLng readAll:](self->_center, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSpatialLookupRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSpatialLookupRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_categorys;
  void *v7;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    v7 = v11;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSpatialLookupRequest readAll:](self, "readAll:", 0);
    PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    p_categorys = &self->_categorys;
    v7 = v11;
    if (p_categorys->count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v7 = v11;
        ++v8;
      }
      while (v8 < p_categorys->count);
    }
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOSpatialLookupRequest _readCenter]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_center, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  id *v8;

  v8 = (id *)a3;
  -[GEOSpatialLookupRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v8, "setCenter:", self->_center);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v8 + 16) = self->_radius;
    *((_BYTE *)v8 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v8 + 15) = self->_maxResults;
    *((_BYTE *)v8 + 68) |= 1u;
  }
  if (-[GEOSpatialLookupRequest categorysCount](self, "categorysCount"))
  {
    objc_msgSend(v8, "clearCategorys");
    v5 = -[GEOSpatialLookupRequest categorysCount](self, "categorysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addCategory:", -[GEOSpatialLookupRequest categoryAtIndex:](self, "categoryAtIndex:", i));
    }
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
  char flags;

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
      GEOSpatialLookupRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSpatialLookupRequest readAll:](self, "readAll:", 0);
  v9 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_radius;
    *(_BYTE *)(v5 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_maxResults;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *center;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOSpatialLookupRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_radius != *((_DWORD *)v4 + 16))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_15:
    IsEqual = 0;
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 15))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_15;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_16:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOSpatialLookupRequest readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_center, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_radius;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_maxResults;
  return v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *center;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int *v10;

  v10 = (int *)a3;
  objc_msgSend(v10, "readAll:", 0);
  center = self->_center;
  v5 = *((_QWORD *)v10 + 5);
  if (center)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOSpatialLookupRequest setCenter:](self, "setCenter:");
  }
  v6 = *((_BYTE *)v10 + 68);
  if ((v6 & 2) != 0)
  {
    self->_radius = v10[16];
    *(_BYTE *)&self->_flags |= 2u;
    v6 = *((_BYTE *)v10 + 68);
  }
  if ((v6 & 1) != 0)
  {
    self->_maxResults = v10[15];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v7 = objc_msgSend(v10, "categorysCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[GEOSpatialLookupRequest addCategory:](self, "addCategory:", objc_msgSend(v10, "categoryAtIndex:", i));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
