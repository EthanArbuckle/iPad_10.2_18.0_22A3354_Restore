@implementation GEOPDSpatialPlaceLookupResponse

- (GEOPDSpatialPlaceLookupResponse)init
{
  GEOPDSpatialPlaceLookupResponse *v2;
  GEOPDSpatialPlaceLookupResponse *v3;
  GEOPDSpatialPlaceLookupResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialPlaceLookupResponse;
  v2 = -[GEOPDSpatialPlaceLookupResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialPlaceLookupResponse)initWithData:(id)a3
{
  GEOPDSpatialPlaceLookupResponse *v3;
  GEOPDSpatialPlaceLookupResponse *v4;
  GEOPDSpatialPlaceLookupResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialPlaceLookupResponse;
  v3 = -[GEOPDSpatialPlaceLookupResponse initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDSpatialPlaceLookupResponse;
  -[GEOPDSpatialPlaceLookupResponse dealloc](&v3, sel_dealloc);
}

- (void)_readPlaceId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceId_tags_6540);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlaceId
{
  -[GEOPDSpatialPlaceLookupResponse _readPlaceId]((uint64_t)self);
  return self->_placeId != 0;
}

- (GEOPDMapsIdentifier)placeId
{
  -[GEOPDSpatialPlaceLookupResponse _readPlaceId]((uint64_t)self);
  return self->_placeId;
}

- (void)setPlaceId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_placeId, a3);
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_6541);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCenter
{
  -[GEOPDSpatialPlaceLookupResponse _readCenter]((uint64_t)self);
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPDSpatialPlaceLookupResponse _readCenter]((uint64_t)self);
  return self->_center;
}

- (void)setCenter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void)_readCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorys_tags_6542);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)categorysCount
{
  -[GEOPDSpatialPlaceLookupResponse _readCategorys]((uint64_t)self);
  return self->_categorys.count;
}

- (int)categorys
{
  -[GEOPDSpatialPlaceLookupResponse _readCategorys]((uint64_t)self);
  return self->_categorys.list;
}

- (void)clearCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Clear();
}

- (void)addCategory:(int)a3
{
  -[GEOPDSpatialPlaceLookupResponse _readCategorys]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (int)categoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_categorys;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDSpatialPlaceLookupResponse _readCategorys]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Set();
}

- (id)categorysAsString:(int)a3
{
  if (a3 < 0x18)
    return off_1E1C0C2C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCategorys:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PARK")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL")) & 1) != 0)
  {
    v4 = 22;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE")))
  {
    v4 = 23;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readBounds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBounds_tags_6543);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasBounds
{
  -[GEOPDSpatialPlaceLookupResponse _readBounds]((uint64_t)self);
  return self->_bounds != 0;
}

- (GEOPDBounds)bounds
{
  -[GEOPDSpatialPlaceLookupResponse _readBounds]((uint64_t)self);
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_bounds, a3);
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
  v8.super_class = (Class)GEOPDSpatialPlaceLookupResponse;
  -[GEOPDSpatialPlaceLookupResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSpatialPlaceLookupResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialPlaceLookupResponse _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "placeId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("placeId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("place_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "center");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("center"));

  }
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1 + 3;
    if (a1[4])
    {
      v14 = 0;
      do
      {
        v15 = *(int *)(*v13 + 4 * v14);
        if (v15 >= 0x18)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E1C0C2C0[v15];
        }
        objc_msgSend(v12, "addObject:", v16);

        ++v14;
        v13 = a1 + 3;
      }
      while (v14 < a1[4]);
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("category"));

  }
  objc_msgSend(a1, "bounds");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v17, "jsonRepresentation");
    else
      objc_msgSend(v17, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("bounds"));

  }
  v20 = (void *)a1[2];
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __61__GEOPDSpatialPlaceLookupResponse__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSpatialPlaceLookupResponse _dictionaryRepresentation:](self, 1);
}

void __61__GEOPDSpatialPlaceLookupResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDSpatialPlaceLookupResponse)initWithDictionary:(id)a3
{
  return (GEOPDSpatialPlaceLookupResponse *)-[GEOPDSpatialPlaceLookupResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  GEOPDMapsIdentifier *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOLatLng *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  GEOPDBounds *v26;
  void *v27;
  void *v29;
  int v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("placeId");
      else
        v7 = CFSTR("place_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEOPDMapsIdentifier initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEOPDMapsIdentifier initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(v6, "setPlaceId:", v10);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOLatLng initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOLatLng initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(v6, "setCenter:", v14);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = a3;
        v31 = v5;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v29 = v16;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (!v18)
          goto LABEL_78;
        v19 = v18;
        v20 = *(_QWORD *)v33;
        while (1)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = v22;
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN")) & 1) != 0)
              {
                v24 = 0;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT")) & 1) != 0)
              {
                v24 = 1;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK")) & 1) != 0)
              {
                v24 = 2;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM")) & 1) != 0)
              {
                v24 = 3;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO")) & 1) != 0)
              {
                v24 = 4;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM")) & 1) != 0)
              {
                v24 = 5;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK")) & 1) != 0)
              {
                v24 = 6;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE")) & 1) != 0)
              {
                v24 = 7;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK")) & 1) != 0)
              {
                v24 = 8;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM")) & 1) != 0)
              {
                v24 = 9;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT")) & 1) != 0)
              {
                v24 = 10;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) != 0)
              {
                v24 = 11;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PARK")) & 1) != 0)
              {
                v24 = 12;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT")) & 1) != 0)
              {
                v24 = 13;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING")) & 1) != 0)
              {
                v24 = 14;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH")) & 1) != 0)
              {
                v24 = 15;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN")) & 1) != 0)
              {
                v24 = 16;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS")) & 1) != 0)
              {
                v24 = 17;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY")) & 1) != 0)
              {
                v24 = 18;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING")) & 1) != 0)
              {
                v24 = 19;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING")) & 1) != 0)
              {
                v24 = 20;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE")) & 1) != 0)
              {
                v24 = 21;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL")) & 1) != 0)
              {
                v24 = 22;
              }
              else if (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE")))
              {
                v24 = 23;
              }
              else
              {
                v24 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v24 = objc_msgSend(v22, "intValue");
            }
            objc_msgSend(v6, "addCategory:", v24);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (!v19)
          {
LABEL_78:

            v5 = v31;
            a3 = v30;
            v16 = v29;
            break;
          }
        }
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bounds"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = [GEOPDBounds alloc];
        if (v26)
          v27 = (void *)-[GEOPDBounds _initWithDictionary:isJSON:](v26, v25, a3);
        else
          v27 = 0;
        objc_msgSend(v6, "setBounds:", v27);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOPDSpatialPlaceLookupResponse)initWithJSON:(id)a3
{
  return (GEOPDSpatialPlaceLookupResponse *)-[GEOPDSpatialPlaceLookupResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6544;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6545;
    GEOPDSpatialPlaceLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDSpatialPlaceLookupResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDSpatialPlaceLookupResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSpatialPlaceLookupResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3A) != 0)
    || (*(_BYTE *)&self->_flags & 4) != 0
    && (GEOPDBoundsIsDirty((os_unfair_lock_s *)self->_bounds) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSpatialPlaceLookupResponse readAll:](self, "readAll:", 0);
    if (self->_placeId)
      PBDataWriterWriteSubmessage();
    v5 = v9;
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_categorys.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_categorys.count);
    }
    if (self->_bounds)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }
  else
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDSpatialPlaceLookupResponse _readBounds]((uint64_t)self);
  if ((-[GEOPDBounds hasGreenTeaWithValue:]((uint64_t)self->_bounds, v3) & 1) != 0)
    return 1;
  -[GEOPDSpatialPlaceLookupResponse _readCenter]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_center, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDSpatialPlaceLookupResponse _readPlaceId]((uint64_t)self);
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_placeId, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;

  v7 = (id *)a3;
  -[GEOPDSpatialPlaceLookupResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 18) = self->_readerMarkPos;
  *((_DWORD *)v7 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeId)
    objc_msgSend(v7, "setPlaceId:");
  if (self->_center)
    objc_msgSend(v7, "setCenter:");
  if (-[GEOPDSpatialPlaceLookupResponse categorysCount](self, "categorysCount"))
  {
    objc_msgSend(v7, "clearCategorys");
    v4 = -[GEOPDSpatialPlaceLookupResponse categorysCount](self, "categorysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addCategory:", -[GEOPDSpatialPlaceLookupResponse categoryAtIndex:](self, "categoryAtIndex:", i));
    }
  }
  if (self->_bounds)
    objc_msgSend(v7, "setBounds:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSpatialPlaceLookupResponse readAll:](self, "readAll:", 0);
    v8 = -[GEOPDMapsIdentifier copyWithZone:](self->_placeId, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v8;

    v10 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v10;

    PBRepeatedInt32Copy();
    v12 = -[GEOPDBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSpatialPlaceLookupResponseReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDMapsIdentifier *placeId;
  GEOLatLng *center;
  GEOPDBounds *bounds;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSpatialPlaceLookupResponse readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         placeId = self->_placeId,
         !((unint64_t)placeId | v4[8]))
     || -[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:"))
    && ((center = self->_center, !((unint64_t)center | v4[7])) || -[GEOLatLng isEqual:](center, "isEqual:"))
    && PBRepeatedInt32IsEqual())
  {
    bounds = self->_bounds;
    if ((unint64_t)bounds | v4[6])
      v8 = -[GEOPDBounds isEqual:](bounds, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOPDSpatialPlaceLookupResponse readAll:](self, "readAll:", 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_placeId, "hash");
  v4 = -[GEOLatLng hash](self->_center, "hash") ^ v3;
  v5 = PBRepeatedInt32Hash();
  return v4 ^ v5 ^ -[GEOPDBounds hash](self->_bounds, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOPDMapsIdentifier *placeId;
  uint64_t v6;
  GEOLatLng *center;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEOPDBounds *bounds;
  void *v13;
  void *v14;
  id v15;
  GEOMapRegion *mapRegion;
  uint64_t v17;
  GEOMapRegion *displayMapRegion;
  uint64_t v19;
  char v20;
  uint64_t viewportFrame;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  void *v28;
  void **v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD *v34;

  v34 = a3;
  objc_msgSend(v34, "readAll:", 0);
  v4 = v34;
  placeId = self->_placeId;
  v6 = v34[8];
  if (placeId)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPDMapsIdentifier mergeFrom:](placeId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPDSpatialPlaceLookupResponse setPlaceId:](self, "setPlaceId:");
  }
  v4 = v34;
LABEL_7:
  center = self->_center;
  v8 = v4[7];
  if (center)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOPDSpatialPlaceLookupResponse setCenter:](self, "setCenter:");
  }
  v4 = v34;
LABEL_13:
  v9 = objc_msgSend(v4, "categorysCount");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
      -[GEOPDSpatialPlaceLookupResponse addCategory:](self, "addCategory:", objc_msgSend(v34, "categoryAtIndex:", i));
  }
  bounds = self->_bounds;
  v13 = v34;
  v14 = (void *)v34[6];
  if (bounds)
  {
    if (v14)
    {
      v15 = v14;
      -[GEOPDBounds readAll:]((uint64_t)v15, 0);
      mapRegion = bounds->_mapRegion;
      v17 = *((_QWORD *)v15 + 4);
      if (mapRegion)
      {
        if (v17)
          -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
      }
      else if (v17)
      {
        -[GEOPDBounds setMapRegion:]((uint64_t)bounds, *((void **)v15 + 4));
      }
      displayMapRegion = bounds->_displayMapRegion;
      v19 = *((_QWORD *)v15 + 3);
      if (displayMapRegion)
      {
        if (v19)
          -[GEOMapRegion mergeFrom:](displayMapRegion, "mergeFrom:");
      }
      else if (v19)
      {
        -[GEOPDBounds setDisplayMapRegion:]((uint64_t)bounds, *((void **)v15 + 3));
      }
      v20 = *((_BYTE *)v15 + 68);
      if ((v20 & 2) != 0)
      {
        bounds->_minZoom = *((float *)v15 + 16);
        *(_BYTE *)&bounds->_flags |= 2u;
        v20 = *((_BYTE *)v15 + 68);
      }
      if ((v20 & 1) != 0)
      {
        bounds->_maxZoom = *((float *)v15 + 15);
        *(_BYTE *)&bounds->_flags |= 1u;
      }
      viewportFrame = (uint64_t)bounds->_viewportFrame;
      v22 = (void *)*((_QWORD *)v15 + 5);
      if (!viewportFrame)
      {
        if (v22)
          -[GEOPDBounds setViewportFrame:]((uint64_t)bounds, v22);
        goto LABEL_66;
      }
      if (!v22)
      {
LABEL_66:

        goto LABEL_67;
      }
      v23 = v22;
      -[GEOPDViewportFrame readAll:]((uint64_t)v23, 0);
      v24 = *(void **)(viewportFrame + 24);
      v25 = *((_QWORD *)v23 + 3);
      if (v24)
      {
        if (v25)
          objc_msgSend(v24, "mergeFrom:");
      }
      else if (v25)
      {
        -[GEOPDViewportFrame setTargetPoint:](viewportFrame, *((void **)v23 + 3));
      }
      v26 = *((_BYTE *)v23 + 64);
      if ((v26 & 2) != 0)
      {
        *(_DWORD *)(viewportFrame + 56) = *((_DWORD *)v23 + 14);
        *(_BYTE *)(viewportFrame + 64) |= 2u;
        v26 = *((_BYTE *)v23 + 64);
        if ((v26 & 4) == 0)
        {
LABEL_45:
          if ((v26 & 1) == 0)
          {
LABEL_47:
            v27 = *(_QWORD *)(viewportFrame + 32);
            v28 = (void *)*((_QWORD *)v23 + 4);
            if (v27)
            {
              if (v28)
              {
                v29 = v28;
                -[GEOPDBoundingCube readAll:]((uint64_t)v29, 0);
                v30 = *(void **)(v27 + 32);
                v31 = v29[4];
                if (v30)
                {
                  if (v31)
                    objc_msgSend(v30, "mergeFrom:");
                }
                else if (v31)
                {
                  -[GEOPDBoundingCube setMin:](v27, v29[4]);
                }
                v32 = *(void **)(v27 + 24);
                v33 = v29[3];
                if (v32)
                {
                  if (v33)
                    objc_msgSend(v32, "mergeFrom:");
                }
                else if (v33)
                {
                  -[GEOPDBoundingCube setMax:](v27, v29[3]);
                }

              }
            }
            else if (v28)
            {
              -[GEOPDViewportFrame setViewTargetBounds:](viewportFrame, v28);
            }

            goto LABEL_66;
          }
LABEL_46:
          *(_DWORD *)(viewportFrame + 52) = *((_DWORD *)v23 + 13);
          *(_BYTE *)(viewportFrame + 64) |= 1u;
          goto LABEL_47;
        }
      }
      else if ((*((_BYTE *)v23 + 64) & 4) == 0)
      {
        goto LABEL_45;
      }
      *(_DWORD *)(viewportFrame + 60) = *((_DWORD *)v23 + 15);
      *(_BYTE *)(viewportFrame + 64) |= 4u;
      if ((*((_BYTE *)v23 + 64) & 1) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if (v14)
  {
    -[GEOPDSpatialPlaceLookupResponse setBounds:](self, "setBounds:");
LABEL_67:
    v13 = v34;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDSpatialPlaceLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6548);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDSpatialPlaceLookupResponse readAll:](self, "readAll:", 0);
    -[GEOPDMapsIdentifier clearUnknownFields:](self->_placeId, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_center, "clearUnknownFields:", 1);
    -[GEOPDBounds clearUnknownFields:]((uint64_t)self->_bounds);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
