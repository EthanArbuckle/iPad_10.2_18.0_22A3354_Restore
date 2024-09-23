@implementation GEOPBTransitAccessPoint

- (GEOPBTransitAccessPoint)init
{
  GEOPBTransitAccessPoint *v2;
  GEOPBTransitAccessPoint *v3;
  GEOPBTransitAccessPoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitAccessPoint;
  v2 = -[GEOPBTransitAccessPoint init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitAccessPoint)initWithData:(id)a3
{
  GEOPBTransitAccessPoint *v3;
  GEOPBTransitAccessPoint *v4;
  GEOPBTransitAccessPoint *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitAccessPoint;
  v3 = -[GEOPBTransitAccessPoint initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)accessPointIndex
{
  return self->_accessPointIndex;
}

- (void)setAccessPointIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_accessPointIndex = a3;
}

- (void)setHasAccessPointIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasAccessPointIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLocation
{
  -[GEOPBTransitAccessPoint _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOPBTransitAccessPoint _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)stationIndex
{
  return self->_stationIndex;
}

- (void)setStationIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_stationIndex = a3;
}

- (void)setHasStationIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStationIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readEntranceZoomNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntranceZoomNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)entranceZoomNames
{
  -[GEOPBTransitAccessPoint _readEntranceZoomNames]((uint64_t)self);
  return self->_entranceZoomNames;
}

- (void)setEntranceZoomNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *entranceZoomNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  entranceZoomNames = self->_entranceZoomNames;
  self->_entranceZoomNames = v4;

}

- (void)clearEntranceZoomNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_entranceZoomNames, "removeAllObjects");
}

- (void)addEntranceZoomName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBTransitAccessPoint _readEntranceZoomNames]((uint64_t)self);
  -[GEOPBTransitAccessPoint _addNoFlagsEntranceZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsEntranceZoomName:(uint64_t)a1
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

- (unint64_t)entranceZoomNamesCount
{
  -[GEOPBTransitAccessPoint _readEntranceZoomNames]((uint64_t)self);
  return -[NSMutableArray count](self->_entranceZoomNames, "count");
}

- (id)entranceZoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitAccessPoint _readEntranceZoomNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_entranceZoomNames, "objectAtIndex:", a3);
}

+ (Class)entranceZoomNameType
{
  return (Class)objc_opt_class();
}

- (void)_readExitZoomNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExitZoomNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)exitZoomNames
{
  -[GEOPBTransitAccessPoint _readExitZoomNames]((uint64_t)self);
  return self->_exitZoomNames;
}

- (void)setExitZoomNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *exitZoomNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  exitZoomNames = self->_exitZoomNames;
  self->_exitZoomNames = v4;

}

- (void)clearExitZoomNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_exitZoomNames, "removeAllObjects");
}

- (void)addExitZoomName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBTransitAccessPoint _readExitZoomNames]((uint64_t)self);
  -[GEOPBTransitAccessPoint _addNoFlagsExitZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsExitZoomName:(uint64_t)a1
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

- (unint64_t)exitZoomNamesCount
{
  -[GEOPBTransitAccessPoint _readExitZoomNames]((uint64_t)self);
  return -[NSMutableArray count](self->_exitZoomNames, "count");
}

- (id)exitZoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitAccessPoint _readExitZoomNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_exitZoomNames, "objectAtIndex:", a3);
}

+ (Class)exitZoomNameType
{
  return (Class)objc_opt_class();
}

- (void)_readEntranceNameDisplayString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntranceNameDisplayString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEntranceNameDisplayString
{
  -[GEOPBTransitAccessPoint _readEntranceNameDisplayString]((uint64_t)self);
  return self->_entranceNameDisplayString != 0;
}

- (NSString)entranceNameDisplayString
{
  -[GEOPBTransitAccessPoint _readEntranceNameDisplayString]((uint64_t)self);
  return self->_entranceNameDisplayString;
}

- (void)setEntranceNameDisplayString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_entranceNameDisplayString, a3);
}

- (void)_readExitNameDisplayString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitAccessPointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExitNameDisplayString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasExitNameDisplayString
{
  -[GEOPBTransitAccessPoint _readExitNameDisplayString]((uint64_t)self);
  return self->_exitNameDisplayString != 0;
}

- (NSString)exitNameDisplayString
{
  -[GEOPBTransitAccessPoint _readExitNameDisplayString]((uint64_t)self);
  return self->_exitNameDisplayString;
}

- (void)setExitNameDisplayString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_exitNameDisplayString, a3);
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
  v8.super_class = (Class)GEOPBTransitAccessPoint;
  -[GEOPBTransitAccessPoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitAccessPoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitAccessPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 92);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("accessPointIndex");
    else
      v7 = CFSTR("access_point_index");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 92);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("muid"));

  }
  objc_msgSend((id)a1, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("location"));

  }
  if ((*(_WORD *)(a1 + 92) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("stationIndex");
    else
      v13 = CFSTR("station_index");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("entranceZoomName");
    else
      v22 = CFSTR("entrance_zoom_name");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v24 = *(id *)(a1 + 48);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v46 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("exitZoomName");
    else
      v31 = CFSTR("exit_zoom_name");
    objc_msgSend(v4, "setObject:forKey:", v23, v31);

  }
  objc_msgSend((id)a1, "entranceNameDisplayString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    if (a2)
      v33 = CFSTR("entranceNameDisplayString");
    else
      v33 = CFSTR("entrance_name_display_string");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);
  }

  objc_msgSend((id)a1, "exitNameDisplayString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    if (a2)
      v35 = CFSTR("exitNameDisplayString");
    else
      v35 = CFSTR("exit_name_display_string");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);
  }

  v36 = *(void **)(a1 + 16);
  if (v36)
  {
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __53__GEOPBTransitAccessPoint__dictionaryRepresentation___block_invoke;
      v43[3] = &unk_1E1C00600;
      v40 = v39;
      v44 = v40;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v43);
      v41 = v40;

      v38 = v41;
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitAccessPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPBTransitAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitAccessPoint)initWithDictionary:(id)a3
{
  return (GEOPBTransitAccessPoint *)-[GEOPBTransitAccessPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOLatLng *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  GEOPBTransitZoomRangeString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  GEOPBTransitZoomRangeString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("accessPointIndex");
      else
        v6 = CFSTR("access_point_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAccessPointIndex:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOLatLng initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOLatLng initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setLocation:", v11);

      }
      if (a3)
        v13 = CFSTR("stationIndex");
      else
        v13 = CFSTR("station_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStationIndex:", objc_msgSend(v14, "unsignedIntValue"));

      if (a3)
        v15 = CFSTR("entranceZoomName");
      else
        v15 = CFSTR("entrance_zoom_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v44 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v50 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = [GEOPBTransitZoomRangeString alloc];
                if ((a3 & 1) != 0)
                  v24 = -[GEOPBTransitZoomRangeString initWithJSON:](v23, "initWithJSON:", v22);
                else
                  v24 = -[GEOPBTransitZoomRangeString initWithDictionary:](v23, "initWithDictionary:", v22);
                v25 = (void *)v24;
                objc_msgSend(a1, "addEntranceZoomName:", v24);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          }
          while (v19);
        }

        v5 = v44;
      }

      if (a3)
        v26 = CFSTR("exitZoomName");
      else
        v26 = CFSTR("exit_zoom_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v28 = v27;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v46 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v34 = [GEOPBTransitZoomRangeString alloc];
                if ((a3 & 1) != 0)
                  v35 = -[GEOPBTransitZoomRangeString initWithJSON:](v34, "initWithJSON:", v33);
                else
                  v35 = -[GEOPBTransitZoomRangeString initWithDictionary:](v34, "initWithDictionary:", v33);
                v36 = (void *)v35;
                objc_msgSend(a1, "addExitZoomName:", v35);

              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          }
          while (v30);
        }

        v5 = v44;
      }

      if (a3)
        v37 = CFSTR("entranceNameDisplayString");
      else
        v37 = CFSTR("entrance_name_display_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = (void *)objc_msgSend(v38, "copy");
        objc_msgSend(a1, "setEntranceNameDisplayString:", v39);

      }
      if (a3)
        v40 = CFSTR("exitNameDisplayString");
      else
        v40 = CFSTR("exit_name_display_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = (void *)objc_msgSend(v41, "copy");
        objc_msgSend(a1, "setExitNameDisplayString:", v42);

      }
    }
  }

  return a1;
}

- (GEOPBTransitAccessPoint)initWithJSON:(id)a3
{
  return (GEOPBTransitAccessPoint *)-[GEOPBTransitAccessPoint _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_45;
    else
      v8 = (int *)&readAll__nonRecursiveTag_45;
    GEOPBTransitAccessPointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPBTransitAccessPointCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitAccessPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitAccessPointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  if (self->_reader && (_GEOPBTransitAccessPointIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPBTransitAccessPoint readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_location)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_entranceZoomNames;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_exitZoomNames;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

    if (self->_entranceNameDisplayString)
      PBDataWriterWriteStringField();
    if (self->_exitNameDisplayString)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPBTransitAccessPoint _readLocation]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id *v14;
  id *v15;

  v15 = (id *)a3;
  -[GEOPBTransitAccessPoint readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 18) = self->_readerMarkPos;
  *((_DWORD *)v15 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v15;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v15 + 21) = self->_accessPointIndex;
    *((_WORD *)v15 + 46) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v15[8] = (id)self->_muid;
    *((_WORD *)v15 + 46) |= 1u;
  }
  if (self->_location)
  {
    objc_msgSend(v15, "setLocation:");
    v4 = v15;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_stationIndex;
    *((_WORD *)v4 + 46) |= 4u;
  }
  if (-[GEOPBTransitAccessPoint entranceZoomNamesCount](self, "entranceZoomNamesCount"))
  {
    objc_msgSend(v15, "clearEntranceZoomNames");
    v6 = -[GEOPBTransitAccessPoint entranceZoomNamesCount](self, "entranceZoomNamesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOPBTransitAccessPoint entranceZoomNameAtIndex:](self, "entranceZoomNameAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntranceZoomName:", v9);

      }
    }
  }
  if (-[GEOPBTransitAccessPoint exitZoomNamesCount](self, "exitZoomNamesCount"))
  {
    objc_msgSend(v15, "clearExitZoomNames");
    v10 = -[GEOPBTransitAccessPoint exitZoomNamesCount](self, "exitZoomNamesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[GEOPBTransitAccessPoint exitZoomNameAtIndex:](self, "exitZoomNameAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addExitZoomName:", v13);

      }
    }
  }
  if (self->_entranceNameDisplayString)
    objc_msgSend(v15, "setEntranceNameDisplayString:");
  v14 = v15;
  if (self->_exitNameDisplayString)
  {
    objc_msgSend(v15, "setExitNameDisplayString:");
    v14 = v15;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  PBUnknownFields *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBTransitAccessPointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitAccessPoint readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_accessPointIndex;
    *(_WORD *)(v5 + 92) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_muid;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v10 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_stationIndex;
    *(_WORD *)(v5 + 92) |= 4u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = self->_entranceZoomNames;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEntranceZoomName:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v13);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = self->_exitZoomNames;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v5, "addExitZoomName:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v18);
  }

  v22 = -[NSString copyWithZone:](self->_entranceNameDisplayString, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  v24 = -[NSString copyWithZone:](self->_exitNameDisplayString, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v24;

  v26 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v26;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOLatLng *location;
  NSMutableArray *entranceZoomNames;
  NSMutableArray *exitZoomNames;
  NSString *entranceNameDisplayString;
  NSString *exitNameDisplayString;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOPBTransitAccessPoint readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 46);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accessPointIndex != *((_DWORD *)v4 + 21))
      goto LABEL_28;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 8))
      goto LABEL_28;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_28;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
    {
LABEL_28:
      v12 = 0;
      goto LABEL_29;
    }
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 46);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_stationIndex != *((_DWORD *)v4 + 22))
      goto LABEL_28;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_28;
  }
  entranceZoomNames = self->_entranceZoomNames;
  if ((unint64_t)entranceZoomNames | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](entranceZoomNames, "isEqual:"))
  {
    goto LABEL_28;
  }
  exitZoomNames = self->_exitZoomNames;
  if ((unint64_t)exitZoomNames | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](exitZoomNames, "isEqual:"))
      goto LABEL_28;
  }
  entranceNameDisplayString = self->_entranceNameDisplayString;
  if ((unint64_t)entranceNameDisplayString | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](entranceNameDisplayString, "isEqual:"))
      goto LABEL_28;
  }
  exitNameDisplayString = self->_exitNameDisplayString;
  if ((unint64_t)exitNameDisplayString | *((_QWORD *)v4 + 5))
    v12 = -[NSString isEqual:](exitNameDisplayString, "isEqual:");
  else
    v12 = 1;
LABEL_29:

  return v12;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;

  -[GEOPBTransitAccessPoint readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v4 = 2654435761 * self->_accessPointIndex;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_muid;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[GEOLatLng hash](self->_location, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v7 = 2654435761 * self->_stationIndex;
  else
    v7 = 0;
  v8 = v5 ^ v4 ^ v7 ^ v6 ^ -[NSMutableArray hash](self->_entranceZoomNames, "hash");
  v9 = -[NSMutableArray hash](self->_exitZoomNames, "hash");
  v10 = v8 ^ v9 ^ -[NSString hash](self->_entranceNameDisplayString, "hash");
  return v10 ^ -[NSString hash](self->_exitNameDisplayString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  GEOLatLng *location;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
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
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 2) != 0)
  {
    self->_accessPointIndex = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v4 + 46);
  }
  if ((v5 & 1) != 0)
  {
    self->_muid = *((_QWORD *)v4 + 8);
    *(_WORD *)&self->_flags |= 1u;
  }
  location = self->_location;
  v7 = *((_QWORD *)v4 + 7);
  if (location)
  {
    if (v7)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOPBTransitAccessPoint setLocation:](self, "setLocation:");
  }
  if ((*((_WORD *)v4 + 46) & 4) != 0)
  {
    self->_stationIndex = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 4u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = *((id *)v4 + 4);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        -[GEOPBTransitAccessPoint addEntranceZoomName:](self, "addEntranceZoomName:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = *((id *)v4 + 6);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[GEOPBTransitAccessPoint addExitZoomName:](self, "addExitZoomName:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

  if (*((_QWORD *)v4 + 3))
    -[GEOPBTransitAccessPoint setEntranceNameDisplayString:](self, "setEntranceNameDisplayString:");
  if (*((_QWORD *)v4 + 5))
    -[GEOPBTransitAccessPoint setExitNameDisplayString:](self, "setExitNameDisplayString:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitAccessPointReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8);
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x208u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBTransitAccessPoint readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_location, "clearUnknownFields:", 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_entranceZoomNames;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_exitZoomNames;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_exitZoomNames, 0);
  objc_storeStrong((id *)&self->_exitNameDisplayString, 0);
  objc_storeStrong((id *)&self->_entranceZoomNames, 0);
  objc_storeStrong((id *)&self->_entranceNameDisplayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestEntranceName
{
  return -[GEOPBTransitAccessPoint bestEntranceNameWithLocale:](self, "bestEntranceNameWithLocale:", 0);
}

- (id)bestExitName
{
  return -[GEOPBTransitAccessPoint bestExitNameWithLocale:](self, "bestExitNameWithLocale:", 0);
}

- (id)identifier
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (-[GEOPBTransitAccessPoint hasLocation](self, "hasLocation"))
  {
    -[GEOPBTransitAccessPoint location](self, "location");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coordinate");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v7 = -180.0;
    v5 = -180.0;
  }
  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", -[GEOPBTransitAccessPoint muid](self, "muid"), 0, v5, v7);
}

@end
