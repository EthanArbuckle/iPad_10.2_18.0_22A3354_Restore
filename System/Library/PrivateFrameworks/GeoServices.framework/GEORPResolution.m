@implementation GEORPResolution

- (GEORPResolution)init
{
  GEORPResolution *v2;
  GEORPResolution *v3;
  GEORPResolution *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPResolution;
  v2 = -[GEORPResolution init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPResolution)initWithData:(id)a3
{
  GEORPResolution *v3;
  GEORPResolution *v4;
  GEORPResolution *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPResolution;
  v3 = -[GEORPResolution initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)resolutionDate
{
  return self->_resolutionDate;
}

- (void)setResolutionDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_resolutionDate = a3;
}

- (void)setHasResolutionDate:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasResolutionDate
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readDisplayRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags_2577);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDisplayRegion
{
  -[GEORPResolution _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (GEOMapRegion)displayRegion
{
  -[GEORPResolution _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)_readLocalizedChangeLists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedChangeLists_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)localizedChangeLists
{
  -[GEORPResolution _readLocalizedChangeLists]((uint64_t)self);
  return self->_localizedChangeLists;
}

- (void)setLocalizedChangeLists:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizedChangeLists;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  localizedChangeLists = self->_localizedChangeLists;
  self->_localizedChangeLists = v4;

}

- (void)clearLocalizedChangeLists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_localizedChangeLists, "removeAllObjects");
}

- (void)addLocalizedChangeList:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPResolution _readLocalizedChangeLists]((uint64_t)self);
  -[GEORPResolution _addNoFlagsLocalizedChangeList:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsLocalizedChangeList:(uint64_t)a1
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

- (unint64_t)localizedChangeListsCount
{
  -[GEORPResolution _readLocalizedChangeLists]((uint64_t)self);
  return -[NSMutableArray count](self->_localizedChangeLists, "count");
}

- (id)localizedChangeListAtIndex:(unint64_t)a3
{
  -[GEORPResolution _readLocalizedChangeLists]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizedChangeLists, "objectAtIndex:", a3);
}

+ (Class)localizedChangeListType
{
  return (Class)objc_opt_class();
}

- (void)_readUpdatedPlaces
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUpdatedPlaces_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)updatedPlaces
{
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  return self->_updatedPlaces;
}

- (void)setUpdatedPlaces:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *updatedPlaces;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  updatedPlaces = self->_updatedPlaces;
  self->_updatedPlaces = v4;

}

- (void)clearUpdatedPlaces
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_updatedPlaces, "removeAllObjects");
}

- (void)addUpdatedPlace:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  -[GEORPResolution _addNoFlagsUpdatedPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsUpdatedPlace:(uint64_t)a1
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

- (unint64_t)updatedPlacesCount
{
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  return -[NSMutableArray count](self->_updatedPlaces, "count");
}

- (id)updatedPlaceAtIndex:(unint64_t)a3
{
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_updatedPlaces, "objectAtIndex:", a3);
}

+ (Class)updatedPlaceType
{
  return (Class)objc_opt_class();
}

- (unint64_t)transitLineMuid
{
  return self->_transitLineMuid;
}

- (void)setTransitLineMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_transitLineMuid = a3;
}

- (void)setHasTransitLineMuid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasTransitLineMuid
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readLocalizedDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedDescription_tags_2578);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLocalizedDescription
{
  -[GEORPResolution _readLocalizedDescription]((uint64_t)self);
  return self->_localizedDescription != 0;
}

- (NSString)localizedDescription
{
  -[GEORPResolution _readLocalizedDescription]((uint64_t)self);
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (void)_readLocalizedAlertText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPResolutionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedAlertText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLocalizedAlertText
{
  -[GEORPResolution _readLocalizedAlertText]((uint64_t)self);
  return self->_localizedAlertText != 0;
}

- (NSString)localizedAlertText
{
  -[GEORPResolution _readLocalizedAlertText]((uint64_t)self);
  return self->_localizedAlertText;
}

- (void)setLocalizedAlertText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_localizedAlertText, a3);
}

- (int)displayStyle
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_displayStyle;
  else
    return 0;
}

- (void)setDisplayStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_displayStyle = a3;
}

- (void)setHasDisplayStyle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 260;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasDisplayStyle
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)displayStyleAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0EF30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDisplayStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_ALL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_REGION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_SINGLE_PIN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_PLACE_CARD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_TRANSIT_LINE")))
  {
    v4 = 5;
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
  v8.super_class = (Class)GEORPResolution;
  -[GEORPResolution description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPResolution dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPResolution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
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
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  __CFString *v29;
  const __CFString *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("resolutionDate");
    else
      v6 = CFSTR("resolution_date");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "displayRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("displayRegion");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("display_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend((id)a1, "localizedChangeLists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("localizedChangeList");
    else
      v12 = CFSTR("localized_change_list");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = *(id *)(a1 + 64);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }

    if (a2)
      v21 = CFSTR("updatedPlace");
    else
      v21 = CFSTR("updated_place");
    objc_msgSend(v4, "setObject:forKey:", v13, v21);

  }
  if ((*(_WORD *)(a1 + 88) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("transitLineMuid");
    else
      v23 = CFSTR("transit_line_muid");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "localizedDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (a2)
      v25 = CFSTR("localizedDescription");
    else
      v25 = CFSTR("localized_description");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);
  }

  objc_msgSend((id)a1, "localizedAlertText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (a2)
      v27 = CFSTR("localizedAlertText");
    else
      v27 = CFSTR("localized_alert_text");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  if ((*(_WORD *)(a1 + 88) & 4) != 0)
  {
    v28 = *(int *)(a1 + 84);
    if (v28 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E1C0EF30[v28];
    }
    if (a2)
      v30 = CFSTR("displayStyle");
    else
      v30 = CFSTR("display_style");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPResolution _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPResolution)initWithDictionary:(id)a3
{
  return (GEORPResolution *)-[GEORPResolution _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOMapRegion *v10;
  uint64_t v11;
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
  uint64_t v29;
  GEOPDPlace *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("resolutionDate");
      else
        v6 = CFSTR("resolution_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setResolutionDate:");
      }

      if (a3)
        v8 = CFSTR("displayRegion");
      else
        v8 = CFSTR("display_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOMapRegion initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOMapRegion initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setDisplayRegion:", v11);

      }
      if (a3)
        v13 = CFSTR("localizedChangeList");
      else
        v13 = CFSTR("localized_change_list");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v47 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v53 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = (void *)objc_msgSend(v20, "copy");
                objc_msgSend(a1, "addLocalizedChangeList:", v21);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          }
          while (v17);
        }

        v5 = v47;
      }

      if (a3)
        v22 = CFSTR("updatedPlace");
      else
        v22 = CFSTR("updated_place");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = v23;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v49 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = [GEOPDPlace alloc];
                if ((a3 & 1) != 0)
                  v31 = -[GEOPDPlace initWithJSON:](v30, "initWithJSON:", v29);
                else
                  v31 = -[GEOPDPlace initWithDictionary:](v30, "initWithDictionary:", v29);
                v32 = (void *)v31;
                objc_msgSend(a1, "addUpdatedPlace:", v31, v46);

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          }
          while (v26);
        }

        v23 = v46;
        v5 = v47;
      }

      if (a3)
        v33 = CFSTR("transitLineMuid");
      else
        v33 = CFSTR("transit_line_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33, v46);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransitLineMuid:", objc_msgSend(v34, "unsignedLongLongValue"));

      if (a3)
        v35 = CFSTR("localizedDescription");
      else
        v35 = CFSTR("localized_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = (void *)objc_msgSend(v36, "copy");
        objc_msgSend(a1, "setLocalizedDescription:", v37);

      }
      if (a3)
        v38 = CFSTR("localizedAlertText");
      else
        v38 = CFSTR("localized_alert_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = (void *)objc_msgSend(v39, "copy");
        objc_msgSend(a1, "setLocalizedAlertText:", v40);

      }
      if (a3)
        v41 = CFSTR("displayStyle");
      else
        v41 = CFSTR("display_style");
      objc_msgSend(v5, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = v42;
        if ((objc_msgSend(v43, "isEqualToString:", CFSTR("SHOW_ALL")) & 1) != 0)
        {
          v44 = 0;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v44 = 1;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("SHOW_REGION")) & 1) != 0)
        {
          v44 = 2;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("SHOW_SINGLE_PIN")) & 1) != 0)
        {
          v44 = 3;
        }
        else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("SHOW_PLACE_CARD")) & 1) != 0)
        {
          v44 = 4;
        }
        else if (objc_msgSend(v43, "isEqualToString:", CFSTR("SHOW_TRANSIT_LINE")))
        {
          v44 = 5;
        }
        else
        {
          v44 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_83:

          goto LABEL_84;
        }
        v44 = objc_msgSend(v42, "intValue");
      }
      objc_msgSend(a1, "setDisplayStyle:", v44);
      goto LABEL_83;
    }
  }
LABEL_84:

  return a1;
}

- (GEORPResolution)initWithJSON:(id)a3
{
  return (GEORPResolution *)-[GEORPResolution _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2599;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2600;
    GEORPResolutionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPResolutionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPResolutionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPResolutionReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v14;
  void *v15;
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPResolution readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_displayRegion)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_localizedChangeLists;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_updatedPlaces;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_localizedDescription)
      PBDataWriterWriteStringField();
    if (self->_localizedAlertText)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEORPResolution _readDisplayRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_displayRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPResolution _readUpdatedPlaces]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_updatedPlaces;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_13;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_13:

  return v5;
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
  id *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEORPResolution readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 18) = self->_readerMarkPos;
  *((_DWORD *)v13 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v13[6] = *(id *)&self->_resolutionDate;
    *((_WORD *)v13 + 44) |= 1u;
  }
  if (self->_displayRegion)
    objc_msgSend(v13, "setDisplayRegion:");
  if (-[GEORPResolution localizedChangeListsCount](self, "localizedChangeListsCount"))
  {
    objc_msgSend(v13, "clearLocalizedChangeLists");
    v4 = -[GEORPResolution localizedChangeListsCount](self, "localizedChangeListsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPResolution localizedChangeListAtIndex:](self, "localizedChangeListAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addLocalizedChangeList:", v7);

      }
    }
  }
  if (-[GEORPResolution updatedPlacesCount](self, "updatedPlacesCount"))
  {
    objc_msgSend(v13, "clearUpdatedPlaces");
    v8 = -[GEORPResolution updatedPlacesCount](self, "updatedPlacesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPResolution updatedPlaceAtIndex:](self, "updatedPlaceAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addUpdatedPlace:", v11);

      }
    }
  }
  v12 = v13;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v13[7] = (id)self->_transitLineMuid;
    *((_WORD *)v13 + 44) |= 2u;
  }
  if (self->_localizedDescription)
  {
    objc_msgSend(v13, "setLocalizedDescription:");
    v12 = v13;
  }
  if (self->_localizedAlertText)
  {
    objc_msgSend(v13, "setLocalizedAlertText:");
    v12 = v13;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v12 + 21) = self->_displayStyle;
    *((_WORD *)v12 + 44) |= 4u;
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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
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
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPResolutionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPResolution readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 48) = self->_resolutionDate;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v9 = -[GEOMapRegion copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = self->_localizedChangeLists;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocalizedChangeList:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v12);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = self->_updatedPlaces;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend((id)v5, "addUpdatedPlace:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_transitLineMuid;
    *(_WORD *)(v5 + 88) |= 2u;
  }
  v21 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3, (_QWORD)v26);
  v22 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v21;

  v23 = -[NSString copyWithZone:](self->_localizedAlertText, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v23;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_displayStyle;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOMapRegion *displayRegion;
  NSMutableArray *localizedChangeLists;
  NSMutableArray *updatedPlaces;
  __int16 v9;
  NSString *localizedDescription;
  NSString *localizedAlertText;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEORPResolution readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_resolutionDate != *((double *)v4 + 6))
      goto LABEL_26;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_26:
    v13 = 0;
    goto LABEL_27;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((_QWORD *)v4 + 2) && !-[GEOMapRegion isEqual:](displayRegion, "isEqual:"))
    goto LABEL_26;
  localizedChangeLists = self->_localizedChangeLists;
  if ((unint64_t)localizedChangeLists | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](localizedChangeLists, "isEqual:"))
      goto LABEL_26;
  }
  updatedPlaces = self->_updatedPlaces;
  if ((unint64_t)updatedPlaces | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](updatedPlaces, "isEqual:"))
      goto LABEL_26;
  }
  v9 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_transitLineMuid != *((_QWORD *)v4 + 7))
      goto LABEL_26;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_26;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](localizedDescription, "isEqual:"))
  {
    goto LABEL_26;
  }
  localizedAlertText = self->_localizedAlertText;
  if ((unint64_t)localizedAlertText | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedAlertText, "isEqual:"))
      goto LABEL_26;
  }
  v12 = *((_WORD *)v4 + 44);
  v13 = (v12 & 4) == 0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_displayStyle != *((_DWORD *)v4 + 21))
      goto LABEL_26;
    v13 = 1;
  }
LABEL_27:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  double resolutionDate;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;

  -[GEORPResolution readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    resolutionDate = self->_resolutionDate;
    v5 = -resolutionDate;
    if (resolutionDate >= 0.0)
      v5 = self->_resolutionDate;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[GEOMapRegion hash](self->_displayRegion, "hash");
  v9 = -[NSMutableArray hash](self->_localizedChangeLists, "hash");
  v10 = -[NSMutableArray hash](self->_updatedPlaces, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v11 = 2654435761u * self->_transitLineMuid;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_localizedDescription, "hash");
  v13 = -[NSString hash](self->_localizedAlertText, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v14 = 2654435761 * self->_displayStyle;
  else
    v14 = 0;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOMapRegion *displayRegion;
  uint64_t v6;
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
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 44) & 1) != 0)
  {
    self->_resolutionDate = *((double *)v4 + 6);
    *(_WORD *)&self->_flags |= 1u;
  }
  displayRegion = self->_displayRegion;
  v6 = *((_QWORD *)v4 + 2);
  if (displayRegion)
  {
    if (v6)
      -[GEOMapRegion mergeFrom:](displayRegion, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPResolution setDisplayRegion:](self, "setDisplayRegion:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[GEORPResolution addLocalizedChangeList:](self, "addLocalizedChangeList:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 8);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[GEORPResolution addUpdatedPlace:](self, "addUpdatedPlace:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  if ((*((_WORD *)v4 + 44) & 2) != 0)
  {
    self->_transitLineMuid = *((_QWORD *)v4 + 7);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 5))
    -[GEORPResolution setLocalizedDescription:](self, "setLocalizedDescription:");
  if (*((_QWORD *)v4 + 3))
    -[GEORPResolution setLocalizedAlertText:](self, "setLocalizedAlertText:");
  if ((*((_WORD *)v4 + 44) & 4) != 0)
  {
    self->_displayStyle = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedPlaces, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedChangeLists, 0);
  objc_storeStrong((id *)&self->_localizedAlertText, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
