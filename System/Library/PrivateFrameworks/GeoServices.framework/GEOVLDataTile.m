@implementation GEOVLDataTile

- (GEOVLDataTile)init
{
  GEOVLDataTile *v2;
  GEOVLDataTile *v3;
  GEOVLDataTile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLDataTile;
  v2 = -[GEOVLDataTile init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLDataTile)initWithData:(id)a3
{
  GEOVLDataTile *v3;
  GEOVLDataTile *v4;
  GEOVLDataTile *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLDataTile;
  v3 = -[GEOVLDataTile initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLDataTile;
  -[GEOVLDataTile dealloc](&v3, sel_dealloc);
}

- (void)_readCoord
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLDataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoord_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasCoord
{
  -[GEOVLDataTile _readCoord]((uint64_t)self);
  return self->_coord != 0;
}

- (GEOTileCoordinate)coord
{
  -[GEOVLDataTile _readCoord]((uint64_t)self);
  return self->_coord;
}

- (void)setCoord:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_coord, a3);
}

- (void)_readBuildIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLDataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBuildIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)buildIndexsCount
{
  -[GEOVLDataTile _readBuildIndexs]((uint64_t)self);
  return self->_buildIndexs.count;
}

- (unsigned)buildIndexs
{
  -[GEOVLDataTile _readBuildIndexs]((uint64_t)self);
  return self->_buildIndexs.list;
}

- (void)clearBuildIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Clear();
}

- (void)addBuildIndex:(unsigned int)a3
{
  -[GEOVLDataTile _readBuildIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unsigned)buildIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_buildIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLDataTile _readBuildIndexs]((uint64_t)self);
  p_buildIndexs = &self->_buildIndexs;
  count = self->_buildIndexs.count;
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
  return p_buildIndexs->list[a3];
}

- (void)setBuildIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Set();
}

- (void)_readPrecisionIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLDataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrecisionIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)precisionIndexsCount
{
  -[GEOVLDataTile _readPrecisionIndexs]((uint64_t)self);
  return self->_precisionIndexs.count;
}

- (unsigned)precisionIndexs
{
  -[GEOVLDataTile _readPrecisionIndexs]((uint64_t)self);
  return self->_precisionIndexs.list;
}

- (void)clearPrecisionIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Clear();
}

- (void)addPrecisionIndex:(unsigned int)a3
{
  -[GEOVLDataTile _readPrecisionIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unsigned)precisionIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_precisionIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLDataTile _readPrecisionIndexs]((uint64_t)self);
  p_precisionIndexs = &self->_precisionIndexs;
  count = self->_precisionIndexs.count;
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
  return p_precisionIndexs->list[a3];
}

- (void)setPrecisionIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Set();
}

- (void)_readPurposeDenylists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLDataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPurposeDenylists_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)purposeDenylistsCount
{
  -[GEOVLDataTile _readPurposeDenylists]((uint64_t)self);
  return self->_purposeDenylists.count;
}

- (int)purposeDenylists
{
  -[GEOVLDataTile _readPurposeDenylists]((uint64_t)self);
  return self->_purposeDenylists.list;
}

- (void)clearPurposeDenylists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Clear();
}

- (void)addPurposeDenylist:(int)a3
{
  -[GEOVLDataTile _readPurposeDenylists]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (int)purposeDenylistAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_purposeDenylists;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLDataTile _readPurposeDenylists]((uint64_t)self);
  p_purposeDenylists = &self->_purposeDenylists;
  count = self->_purposeDenylists.count;
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
  return p_purposeDenylists->list[a3];
}

- (void)setPurposeDenylists:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Set();
}

- (id)purposeDenylistsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0E6B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPurposeDenylists:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_PURPOSE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_PURPOSE_LOCATION_REFINEMENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_PURPOSE_GEOTRACKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VL_PURPOSE_PEDESTRIAN_AR")))
  {
    v4 = 3;
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
  v8.super_class = (Class)GEOVLDataTile;
  -[GEOVLDataTile description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLDataTile dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLDataTile _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "coord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("coord"));

    }
    if (a1[3])
    {
      PBRepeatedUInt32NSArray();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("buildIndex");
      else
        v9 = CFSTR("build_index");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    if (a1[6])
    {
      PBRepeatedUInt32NSArray();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("precisionIndex");
      else
        v11 = CFSTR("precision_index");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
    if (a1[9])
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1 + 8;
      if (a1[9])
      {
        v14 = 0;
        do
        {
          v15 = *(int *)(*v13 + 4 * v14);
          if (v15 >= 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E1C0E6B8[v15];
          }
          objc_msgSend(v12, "addObject:", v16);

          ++v14;
          v13 = a1 + 8;
        }
        while (v14 < a1[9]);
      }
      if (a2)
        v17 = CFSTR("purposeDenylist");
      else
        v17 = CFSTR("purpose_denylist");
      objc_msgSend(v4, "setObject:forKey:", v12, v17);

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
  return -[GEOVLDataTile _dictionaryRepresentation:](self, 1);
}

- (GEOVLDataTile)initWithDictionary:(id)a3
{
  return (GEOVLDataTile *)-[GEOVLDataTile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOTileCoordinate *v8;
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
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id v35;
  uint64_t v36;
  void *v38;
  id v39;
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
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coord"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOTileCoordinate alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOTileCoordinate initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOTileCoordinate initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(v6, "setCoord:", v9);

      }
      if (a3)
        v11 = CFSTR("buildIndex");
      else
        v11 = CFSTR("build_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v49 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v6, "addBuildIndex:", objc_msgSend(v18, "unsignedIntValue"));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          }
          while (v15);
        }

      }
      if (a3)
        v19 = CFSTR("precisionIndex");
      else
        v19 = CFSTR("precision_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v45 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v6, "addPrecisionIndex:", objc_msgSend(v26, "unsignedIntValue"));
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v23);
        }

      }
      if (a3)
        v27 = CFSTR("purposeDenylist");
      else
        v27 = CFSTR("purpose_denylist");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = v28;
        v39 = v5;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (!v30)
          goto LABEL_61;
        v31 = v30;
        v32 = *(_QWORD *)v41;
        while (1)
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v41 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = v34;
              if ((objc_msgSend(v35, "isEqualToString:", CFSTR("VL_PURPOSE_UNKNOWN")) & 1) != 0)
              {
                v36 = 0;
              }
              else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("VL_PURPOSE_LOCATION_REFINEMENT")) & 1) != 0)
              {
                v36 = 1;
              }
              else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("VL_PURPOSE_GEOTRACKING")) & 1) != 0)
              {
                v36 = 2;
              }
              else if (objc_msgSend(v35, "isEqualToString:", CFSTR("VL_PURPOSE_PEDESTRIAN_AR")))
              {
                v36 = 3;
              }
              else
              {
                v36 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v36 = objc_msgSend(v34, "intValue");
            }
            objc_msgSend(v6, "addPurposeDenylist:", v36, v38, v39, (_QWORD)v40);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (!v31)
          {
LABEL_61:

            v28 = v38;
            v5 = v39;
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

- (GEOVLDataTile)initWithJSON:(id)a3
{
  return (GEOVLDataTile *)-[GEOVLDataTile _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_48;
    else
      v8 = (int *)&readAll__nonRecursiveTag_48;
    GEOVLDataTileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOTileCoordinate readAll:](self->_coord, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLDataTileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLDataTileReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_purposeDenylists;
  unint64_t v9;
  PBDataReader *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1F) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    v5 = v12;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLDataTile readAll:](self, "readAll:", 0);
    if (self->_coord)
      PBDataWriterWriteSubmessage();
    v5 = v12;
    if (self->_buildIndexs.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v5 = v12;
        ++v6;
      }
      while (v6 < self->_buildIndexs.count);
    }
    if (self->_precisionIndexs.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v5 = v12;
        ++v7;
      }
      while (v7 < self->_precisionIndexs.count);
    }
    p_purposeDenylists = &self->_purposeDenylists;
    if (p_purposeDenylists->count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v12;
        ++v9;
      }
      while (v9 < p_purposeDenylists->count);
    }
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  id *v13;

  v13 = (id *)a3;
  -[GEOVLDataTile readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 24) = self->_readerMarkPos;
  *((_DWORD *)v13 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_coord)
    objc_msgSend(v13, "setCoord:");
  if (-[GEOVLDataTile buildIndexsCount](self, "buildIndexsCount"))
  {
    objc_msgSend(v13, "clearBuildIndexs");
    v4 = -[GEOVLDataTile buildIndexsCount](self, "buildIndexsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v13, "addBuildIndex:", -[GEOVLDataTile buildIndexAtIndex:](self, "buildIndexAtIndex:", i));
    }
  }
  if (-[GEOVLDataTile precisionIndexsCount](self, "precisionIndexsCount"))
  {
    objc_msgSend(v13, "clearPrecisionIndexs");
    v7 = -[GEOVLDataTile precisionIndexsCount](self, "precisionIndexsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v13, "addPrecisionIndex:", -[GEOVLDataTile precisionIndexAtIndex:](self, "precisionIndexAtIndex:", j));
    }
  }
  if (-[GEOVLDataTile purposeDenylistsCount](self, "purposeDenylistsCount"))
  {
    objc_msgSend(v13, "clearPurposeDenylists");
    v10 = -[GEOVLDataTile purposeDenylistsCount](self, "purposeDenylistsCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v13, "addPurposeDenylist:", -[GEOVLDataTile purposeDenylistAtIndex:](self, "purposeDenylistAtIndex:", k));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLDataTile readAll:](self, "readAll:", 0);
    v8 = -[GEOTileCoordinate copyWithZone:](self->_coord, "copyWithZone:", a3);
    v9 = (void *)v5[11];
    v5[11] = v8;

    PBRepeatedUInt32Copy();
    PBRepeatedUInt32Copy();
    PBRepeatedInt32Copy();
    return v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOVLDataTileReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOTileCoordinate *coord;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOVLDataTile readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         coord = self->_coord,
         !((unint64_t)coord | v4[11]))
     || -[GEOTileCoordinate isEqual:](coord, "isEqual:"))
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOVLDataTile readAll:](self, "readAll:", 1);
  v3 = -[GEOTileCoordinate hash](self->_coord, "hash");
  v4 = PBRepeatedUInt32Hash();
  v5 = v4 ^ PBRepeatedUInt32Hash();
  return v5 ^ PBRepeatedInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  GEOTileCoordinate *coord;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  _QWORD *v16;

  v16 = a3;
  objc_msgSend(v16, "readAll:", 0);
  v4 = v16;
  coord = self->_coord;
  v6 = v16[11];
  if (coord)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOTileCoordinate mergeFrom:](coord, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOVLDataTile setCoord:](self, "setCoord:");
  }
  v4 = v16;
LABEL_7:
  v7 = objc_msgSend(v4, "buildIndexsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[GEOVLDataTile addBuildIndex:](self, "addBuildIndex:", objc_msgSend(v16, "buildIndexAtIndex:", i));
  }
  v10 = objc_msgSend(v16, "precisionIndexsCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[GEOVLDataTile addPrecisionIndex:](self, "addPrecisionIndex:", objc_msgSend(v16, "precisionIndexAtIndex:", j));
  }
  v13 = objc_msgSend(v16, "purposeDenylistsCount");
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[GEOVLDataTile addPurposeDenylist:](self, "addPurposeDenylist:", objc_msgSend(v16, "purposeDenylistAtIndex:", k));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coord, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
