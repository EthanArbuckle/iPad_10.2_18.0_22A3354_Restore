@implementation GEOPDSpatialEventLookupParameters

- (GEOPDSpatialEventLookupParameters)init
{
  GEOPDSpatialEventLookupParameters *v2;
  GEOPDSpatialEventLookupParameters *v3;
  GEOPDSpatialEventLookupParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialEventLookupParameters;
  v2 = -[GEOPDSpatialEventLookupParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialEventLookupParameters)initWithData:(id)a3
{
  GEOPDSpatialEventLookupParameters *v3;
  GEOPDSpatialEventLookupParameters *v4;
  GEOPDSpatialEventLookupParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialEventLookupParameters;
  v3 = -[GEOPDSpatialEventLookupParameters initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDSpatialEventLookupParameters;
  -[GEOPDSpatialEventLookupParameters dealloc](&v3, sel_dealloc);
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    if ((*(_BYTE *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_6415);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 88) |= 0x20u;
    *(_BYTE *)(a1 + 88) |= 0x40u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)_readCategoryFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    if ((*(_BYTE *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  }
}

- (void)addCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSpatialEventLookupParameters _readCategoryFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 88) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
    *(_BYTE *)(a1 + 88) |= 0x40u;
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
  v8.super_class = (Class)GEOPDSpatialEventLookupParameters;
  -[GEOPDSpatialEventLookupParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSpatialEventLookupParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialEventLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  -[GEOPDSpatialEventLookupParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSpatialEventLookupParameters _readCenter](a1);
  v5 = *(id *)(a1 + 48);
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
  v8 = *(_BYTE *)(a1 + 88);
  if ((v8 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 84));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("radius"));

    v8 = *(_BYTE *)(a1 + 88);
  }
  if ((v8 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("count"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v13 = 0;
      do
      {
        v14 = *(int *)(*v12 + 4 * v13);
        if (v14 >= 0xE)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = off_1E1C0C180[v14];
        }
        objc_msgSend(v11, "addObject:", v15);

        ++v13;
        v12 = (_QWORD *)(a1 + 24);
      }
      while (v13 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v16 = CFSTR("categoryFilter");
    else
      v16 = CFSTR("category_filter");
    objc_msgSend(v4, "setObject:forKey:", v11, v16);

  }
  if ((*(_BYTE *)(a1 + 88) & 1) != 0)
  {
    if (a2)
      v17 = CFSTR("timeRange");
    else
      v17 = CFSTR("time_range");
    _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(a1 + 56), a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, v17);

  }
  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__GEOPDSpatialEventLookupParameters__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSpatialEventLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6422;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6423;
      GEOPDSpatialEventLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 48), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  }
}

void __63__GEOPDSpatialEventLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  GEOLatLng *v8;
  GEOLatLng *v9;
  GEOLatLng *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v29;
  int v30;
  id v31;
  uint64_t v32;
  int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = objc_msgSend(a1, "init");
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
        v10 = v9;
        -[GEOPDSpatialEventLookupParameters setCenter:](v6, v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radius"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(v11, "intValue");
        *(_BYTE *)(v6 + 88) |= 0x40u;
        *(_BYTE *)(v6 + 88) |= 4u;
        *(_DWORD *)(v6 + 84) = v12;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v13, "intValue");
        *(_BYTE *)(v6 + 88) |= 0x40u;
        *(_BYTE *)(v6 + 88) |= 2u;
        *(_DWORD *)(v6 + 80) = v14;
      }

      if (a3)
        v15 = CFSTR("categoryFilter");
      else
        v15 = CFSTR("category_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = a3;
        v31 = v5;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v29 = v16;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (!v18)
          goto LABEL_43;
        v19 = v18;
        v20 = *(_QWORD *)v35;
        while (1)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = v22;
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_UNKNOWN")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_ARTSANDMUSEUMS")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_BUSINESSANDTECHNOLOGY")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_COMMUNITY")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_DANCE")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_EDUCATIONAL")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_FAMILYEVENTS")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_FESTIVALSANDFAIRS")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_MUSICCONCERTS")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_SPORTS")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_THEATER")) & 1) == 0
                && (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_TOURS")) & 1) == 0)
              {
                objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_APPLEEVENT"));
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v22, "intValue");
            }
            -[GEOPDSpatialEventLookupParameters addCategoryFilter:](v6);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (!v19)
          {
LABEL_43:

            v5 = v31;
            a3 = v30;
            v16 = v29;
            break;
          }
        }
      }

      if (a3)
        v24 = CFSTR("timeRange");
      else
        v24 = CFSTR("time_range");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = 0;
        v32 = 0;
        _GEOPDTimeRangeFromDictionaryRepresentation(v25, (uint64_t)&v32, a3);
        v26 = v32;
        *(_BYTE *)(v6 + 88) |= 0x40u;
        *(_BYTE *)(v6 + 88) |= 1u;
        v27 = v33;
        *(_QWORD *)(v6 + 56) = v26;
        *(_DWORD *)(v6 + 64) = v27;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSpatialEventLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x70) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)self, 0);
    if (self->_center)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_categoryFilters.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_categoryFilters.count);
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterPlaceMark();
      GEOPDTimeRangeWriteTo((uint64_t)&self->_timeRange);
      PBDataWriterRecallMark();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
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
  $B85216D09A238EDB5177F50F3CAD2EB5 has;
  PBUnknownFields *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSpatialEventLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)self, 0);
  v9 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_radius;
    *(_BYTE *)(v5 + 88) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_count;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    has = self->_timeRange._has;
    *(_QWORD *)(v5 + 56) = *(_QWORD *)&self->_timeRange._duration;
    *($B85216D09A238EDB5177F50F3CAD2EB5 *)(v5 + 64) = has;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int *v4;
  GEOLatLng *center;
  BOOL v6;

  v4 = (unsigned int *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)v4, 1);
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[22] & 4) == 0 || self->_radius != v4[21])
      goto LABEL_21;
  }
  else if ((v4[22] & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[22] & 2) == 0 || self->_count != v4[20])
      goto LABEL_21;
  }
  else if ((v4[22] & 2) != 0)
  {
    goto LABEL_21;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_21:
    v6 = 0;
    goto LABEL_22;
  }
  v6 = (v4[22] & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[22] & 1) != 0
      && *(_QWORD *)&self->_timeRange._duration == *((_QWORD *)v4 + 7)
      && *(_DWORD *)&self->_timeRange._has == (unint64_t)v4[16])
    {
      v6 = 1;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)self, 1);
  v3 = -[GEOLatLng hash](self->_center, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v4 = 2654435761 * self->_radius;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_count;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = PBHashBytes();
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 88) |= 8u;
    *(_BYTE *)(a1 + 88) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSpatialEventLookupParameters readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
