@implementation GEOVLMetadataTile

- (GEOVLMetadataTile)init
{
  GEOVLMetadataTile *v2;
  GEOVLMetadataTile *v3;
  GEOVLMetadataTile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLMetadataTile;
  v2 = -[GEOVLMetadataTile init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLMetadataTile)initWithData:(id)a3
{
  GEOVLMetadataTile *v3;
  GEOVLMetadataTile *v4;
  GEOVLMetadataTile *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLMetadataTile;
  v3 = -[GEOVLMetadataTile initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOVLMetadataTile;
  -[GEOVLMetadataTile dealloc](&v3, sel_dealloc);
}

- (void)_readCoord
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
        GEOVLMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoord_tags_169);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCoord
{
  -[GEOVLMetadataTile _readCoord]((uint64_t)self);
  return self->_coord != 0;
}

- (GEOTileCoordinate)coord
{
  -[GEOVLMetadataTile _readCoord]((uint64_t)self);
  return self->_coord;
}

- (void)setCoord:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_coord, a3);
}

- (void)_readBuilds
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
        GEOVLMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBuilds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)builds
{
  -[GEOVLMetadataTile _readBuilds]((uint64_t)self);
  return self->_builds;
}

- (void)setBuilds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *builds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  builds = self->_builds;
  self->_builds = v4;

}

- (void)clearBuilds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_builds, "removeAllObjects");
}

- (void)addBuild:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVLMetadataTile _readBuilds]((uint64_t)self);
  -[GEOVLMetadataTile _addNoFlagsBuild:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsBuild:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)buildsCount
{
  -[GEOVLMetadataTile _readBuilds]((uint64_t)self);
  return -[NSMutableArray count](self->_builds, "count");
}

- (id)buildAtIndex:(unint64_t)a3
{
  -[GEOVLMetadataTile _readBuilds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_builds, "objectAtIndex:", a3);
}

+ (Class)buildType
{
  return (Class)objc_opt_class();
}

- (void)_readPrecisions
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
        GEOVLMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrecisions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)precisions
{
  -[GEOVLMetadataTile _readPrecisions]((uint64_t)self);
  return self->_precisions;
}

- (void)setPrecisions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *precisions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  precisions = self->_precisions;
  self->_precisions = v4;

}

- (void)clearPrecisions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_precisions, "removeAllObjects");
}

- (void)addPrecision:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVLMetadataTile _readPrecisions]((uint64_t)self);
  -[GEOVLMetadataTile _addNoFlagsPrecision:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsPrecision:(uint64_t)a1
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

- (unint64_t)precisionsCount
{
  -[GEOVLMetadataTile _readPrecisions]((uint64_t)self);
  return -[NSMutableArray count](self->_precisions, "count");
}

- (id)precisionAtIndex:(unint64_t)a3
{
  -[GEOVLMetadataTile _readPrecisions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_precisions, "objectAtIndex:", a3);
}

+ (Class)precisionType
{
  return (Class)objc_opt_class();
}

- (void)_readTiles
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
        GEOVLMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTiles_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)tiles
{
  -[GEOVLMetadataTile _readTiles]((uint64_t)self);
  return self->_tiles;
}

- (void)setTiles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tiles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  tiles = self->_tiles;
  self->_tiles = v4;

}

- (void)clearTiles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_tiles, "removeAllObjects");
}

- (void)addTile:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVLMetadataTile _readTiles]((uint64_t)self);
  -[GEOVLMetadataTile _addNoFlagsTile:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsTile:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)tilesCount
{
  -[GEOVLMetadataTile _readTiles]((uint64_t)self);
  return -[NSMutableArray count](self->_tiles, "count");
}

- (id)tileAtIndex:(unint64_t)a3
{
  -[GEOVLMetadataTile _readTiles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_tiles, "objectAtIndex:", a3);
}

+ (Class)tileType
{
  return (Class)objc_opt_class();
}

- (void)_readPurposeDenylists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPurposeDenylists_tags_173);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)purposeDenylistsCount
{
  -[GEOVLMetadataTile _readPurposeDenylists]((uint64_t)self);
  return self->_purposeDenylists.count;
}

- (int)purposeDenylists
{
  -[GEOVLMetadataTile _readPurposeDenylists]((uint64_t)self);
  return self->_purposeDenylists.list;
}

- (void)clearPurposeDenylists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Clear();
}

- (void)addPurposeDenylist:(int)a3
{
  -[GEOVLMetadataTile _readPurposeDenylists]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (int)purposeDenylistAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_purposeDenylists;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOVLMetadataTile _readPurposeDenylists]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
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
  v8.super_class = (Class)GEOVLMetadataTile;
  -[GEOVLMetadataTile description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLMetadataTile dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLMetadataTile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
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
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  __CFString *v36;
  const __CFString *v37;
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
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "coord");
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
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v9 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v48 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("build"));
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v17 = *(id *)(a1 + 56);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("precision"));
  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = *(id *)(a1 + 64);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("tile"));
  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v34 = 0;
      do
      {
        v35 = *(int *)(*v33 + 4 * v34);
        if (v35 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E1C0E6B8[v35];
        }
        objc_msgSend(v32, "addObject:", v36);

        ++v34;
        v33 = (_QWORD *)(a1 + 16);
      }
      while (v34 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v37 = CFSTR("purposeDenylist");
    else
      v37 = CFSTR("purpose_denylist");
    objc_msgSend(v4, "setObject:forKey:", v32, v37);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLMetadataTile _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLMetadataTile)initWithDictionary:(id)a3
{
  return (GEOVLMetadataTile *)-[GEOVLMetadataTile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOTileCoordinate *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOVLBuild *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  GEOVLPrecision *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  GEOVLDataTile *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  id v49;
  uint64_t v50;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("build"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v54 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v52 = v11;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v68 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = [GEOVLBuild alloc];
                if ((a3 & 1) != 0)
                  v19 = -[GEOVLBuild initWithJSON:](v18, "initWithJSON:", v17);
                else
                  v19 = -[GEOVLBuild initWithDictionary:](v18, "initWithDictionary:", v17);
                v20 = (void *)v19;
                objc_msgSend(v6, "addBuild:", v19, v52);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
          }
          while (v14);
        }

        v11 = v52;
        v5 = v54;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("precision"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v52 = v21;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v64 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = [GEOVLPrecision alloc];
                if ((a3 & 1) != 0)
                  v29 = -[GEOVLPrecision initWithJSON:](v28, "initWithJSON:", v27);
                else
                  v29 = -[GEOVLPrecision initWithDictionary:](v28, "initWithDictionary:", v27);
                v30 = (void *)v29;
                objc_msgSend(v6, "addPrecision:", v29, v52);

              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          }
          while (v24);
        }

        v21 = v52;
        v5 = v54;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tile"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v52 = v31;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v60;
          do
          {
            for (k = 0; k != v34; ++k)
            {
              if (*(_QWORD *)v60 != v35)
                objc_enumerationMutation(v32);
              v37 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = [GEOVLDataTile alloc];
                if ((a3 & 1) != 0)
                  v39 = -[GEOVLDataTile initWithJSON:](v38, "initWithJSON:", v37);
                else
                  v39 = -[GEOVLDataTile initWithDictionary:](v38, "initWithDictionary:", v37);
                v40 = (void *)v39;
                objc_msgSend(v6, "addTile:", v39, v52);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
          }
          while (v34);
        }

        v31 = v52;
        v5 = v54;
      }

      if (a3)
        v41 = CFSTR("purposeDenylist");
      else
        v41 = CFSTR("purpose_denylist");
      objc_msgSend(v5, "objectForKeyedSubscript:", v41, v52);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = v42;
        v43 = v42;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
        if (!v44)
          goto LABEL_75;
        v45 = v44;
        v46 = *(_QWORD *)v56;
        while (1)
        {
          for (m = 0; m != v45; ++m)
          {
            if (*(_QWORD *)v56 != v46)
              objc_enumerationMutation(v43);
            v48 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v49 = v48;
              if ((objc_msgSend(v49, "isEqualToString:", CFSTR("VL_PURPOSE_UNKNOWN")) & 1) != 0)
              {
                v50 = 0;
              }
              else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("VL_PURPOSE_LOCATION_REFINEMENT")) & 1) != 0)
              {
                v50 = 1;
              }
              else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("VL_PURPOSE_GEOTRACKING")) & 1) != 0)
              {
                v50 = 2;
              }
              else if (objc_msgSend(v49, "isEqualToString:", CFSTR("VL_PURPOSE_PEDESTRIAN_AR")))
              {
                v50 = 3;
              }
              else
              {
                v50 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v50 = objc_msgSend(v48, "intValue");
            }
            objc_msgSend(v6, "addPurposeDenylist:", v50, v53);
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (!v45)
          {
LABEL_75:

            v42 = v53;
            v5 = v54;
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

- (GEOVLMetadataTile)initWithJSON:(id)a3
{
  return (GEOVLMetadataTile *)-[GEOVLMetadataTile _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_180;
    else
      v8 = (int *)&readAll__nonRecursiveTag_181;
    GEOVLMetadataTileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOVLMetadataTileCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLMetadataTileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLMetadataTileReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_purposeDenylists;
  unint64_t v19;
  PBDataReader *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3F) == 0))
  {
    v20 = self->_reader;
    objc_sync_enter(v20);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v21);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLMetadataTile readAll:](self, "readAll:", 0);
    if (self->_coord)
      PBDataWriterWriteSubmessage();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = self->_builds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v7);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = self->_precisions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v11);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = self->_tiles;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v15);
    }

    p_purposeDenylists = &self->_purposeDenylists;
    if (p_purposeDenylists->count)
    {
      v19 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v19;
      }
      while (v19 < p_purposeDenylists->count);
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
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  id *v19;

  v19 = (id *)a3;
  -[GEOVLMetadataTile readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v19 + 1, self->_reader);
  *((_DWORD *)v19 + 18) = self->_readerMarkPos;
  *((_DWORD *)v19 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_coord)
    objc_msgSend(v19, "setCoord:");
  if (-[GEOVLMetadataTile buildsCount](self, "buildsCount"))
  {
    objc_msgSend(v19, "clearBuilds");
    v4 = -[GEOVLMetadataTile buildsCount](self, "buildsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOVLMetadataTile buildAtIndex:](self, "buildAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addBuild:", v7);

      }
    }
  }
  if (-[GEOVLMetadataTile precisionsCount](self, "precisionsCount"))
  {
    objc_msgSend(v19, "clearPrecisions");
    v8 = -[GEOVLMetadataTile precisionsCount](self, "precisionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOVLMetadataTile precisionAtIndex:](self, "precisionAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addPrecision:", v11);

      }
    }
  }
  if (-[GEOVLMetadataTile tilesCount](self, "tilesCount"))
  {
    objc_msgSend(v19, "clearTiles");
    v12 = -[GEOVLMetadataTile tilesCount](self, "tilesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOVLMetadataTile tileAtIndex:](self, "tileAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addTile:", v15);

      }
    }
  }
  if (-[GEOVLMetadataTile purposeDenylistsCount](self, "purposeDenylistsCount"))
  {
    objc_msgSend(v19, "clearPurposeDenylists");
    v16 = -[GEOVLMetadataTile purposeDenylistsCount](self, "purposeDenylistsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(v19, "addPurposeDenylist:", -[GEOVLMetadataTile purposeDenylistAtIndex:](self, "purposeDenylistAtIndex:", m));
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
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOVLMetadataTileReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVLMetadataTile readAll:](self, "readAll:", 0);
  v8 = -[GEOTileCoordinate copyWithZone:](self->_coord, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = self->_builds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addBuild:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v11);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_precisions;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addPrecision:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v16);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = self->_tiles;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend(v5, "addTile:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v21);
  }

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOTileCoordinate *coord;
  NSMutableArray *builds;
  NSMutableArray *precisions;
  NSMutableArray *tiles;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOVLMetadataTile readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         coord = self->_coord,
         !((unint64_t)coord | v4[6]))
     || -[GEOTileCoordinate isEqual:](coord, "isEqual:"))
    && ((builds = self->_builds, !((unint64_t)builds | v4[5]))
     || -[NSMutableArray isEqual:](builds, "isEqual:"))
    && ((precisions = self->_precisions, !((unint64_t)precisions | v4[7]))
     || -[NSMutableArray isEqual:](precisions, "isEqual:"))
    && ((tiles = self->_tiles, !((unint64_t)tiles | v4[8]))
     || -[NSMutableArray isEqual:](tiles, "isEqual:")))
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
  uint64_t v6;

  -[GEOVLMetadataTile readAll:](self, "readAll:", 1);
  v3 = -[GEOTileCoordinate hash](self->_coord, "hash");
  v4 = -[NSMutableArray hash](self->_builds, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_precisions, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_tiles, "hash");
  return v6 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOTileCoordinate *coord;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
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
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  coord = self->_coord;
  v6 = v4[6];
  if (coord)
  {
    if (v6)
      -[GEOTileCoordinate mergeFrom:](coord, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOVLMetadataTile setCoord:](self, "setCoord:");
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v4[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
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
        -[GEOVLMetadataTile addBuild:](self, "addBuild:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v4[7];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        -[GEOVLMetadataTile addPrecision:](self, "addPrecision:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v14);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v4[8];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        -[GEOVLMetadataTile addTile:](self, "addTile:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k), (_QWORD)v25);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v19);
  }

  v22 = objc_msgSend(v4, "purposeDenylistsCount");
  if (v22)
  {
    v23 = v22;
    for (m = 0; m != v23; ++m)
      -[GEOVLMetadataTile addPurposeDenylist:](self, "addPurposeDenylist:", objc_msgSend(v4, "purposeDenylistAtIndex:", m, (_QWORD)v25));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_precisions, 0);
  objc_storeStrong((id *)&self->_coord, 0);
  objc_storeStrong((id *)&self->_builds, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
