@implementation GEOPBTransitHall

- (GEOPBTransitHall)init
{
  GEOPBTransitHall *v2;
  GEOPBTransitHall *v3;
  GEOPBTransitHall *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitHall;
  v2 = -[GEOPBTransitHall init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitHall)initWithData:(id)a3
{
  GEOPBTransitHall *v3;
  GEOPBTransitHall *v4;
  GEOPBTransitHall *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitHall;
  v3 = -[GEOPBTransitHall initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)hallIndex
{
  return self->_hallIndex;
}

- (void)setHallIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_hallIndex = a3;
}

- (void)setHasHallIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasHallIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)stationIndex
{
  return self->_stationIndex;
}

- (void)setStationIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_stationIndex = a3;
}

- (void)setHasStationIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 260;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStationIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitHallReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_187);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLocation
{
  -[GEOPBTransitHall _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOPBTransitHall _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)_readZoomNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitHallReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZoomNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)zoomNames
{
  -[GEOPBTransitHall _readZoomNames]((uint64_t)self);
  return self->_zoomNames;
}

- (void)setZoomNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *zoomNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  zoomNames = self->_zoomNames;
  self->_zoomNames = v4;

}

- (void)clearZoomNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_zoomNames, "removeAllObjects");
}

- (void)addZoomName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBTransitHall _readZoomNames]((uint64_t)self);
  -[GEOPBTransitHall _addNoFlagsZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsZoomName:(uint64_t)a1
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

- (unint64_t)zoomNamesCount
{
  -[GEOPBTransitHall _readZoomNames]((uint64_t)self);
  return -[NSMutableArray count](self->_zoomNames, "count");
}

- (id)zoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitHall _readZoomNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_zoomNames, "objectAtIndex:", a3);
}

+ (Class)zoomNameType
{
  return (Class)objc_opt_class();
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitHallReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_188);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOPBTransitHall _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitHall _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readNameDisplayString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitHallReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNameDisplayString_tags_189);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasNameDisplayString
{
  -[GEOPBTransitHall _readNameDisplayString]((uint64_t)self);
  return self->_nameDisplayString != 0;
}

- (NSString)nameDisplayString
{
  -[GEOPBTransitHall _readNameDisplayString]((uint64_t)self);
  return self->_nameDisplayString;
}

- (void)setNameDisplayString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_nameDisplayString, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitHall;
  -[GEOPBTransitHall description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitHall dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitHall _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 2) == 0)
  {
    if ((v5 & 1) == 0)
      goto LABEL_4;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("muid"));

    if ((*(_WORD *)(a1 + 84) & 4) != 0)
      goto LABEL_5;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("hallIndex");
  else
    v11 = CFSTR("hall_index");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 1) != 0)
    goto LABEL_16;
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("stationIndex");
    else
      v7 = CFSTR("station_index");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  objc_msgSend((id)a1, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("location"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = *(id *)(a1 + 56);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("zoomName");
    else
      v22 = CFSTR("zoom_name");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  objc_msgSend((id)a1, "styleAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  objc_msgSend((id)a1, "nameDisplayString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    if (a2)
      v28 = CFSTR("nameDisplayString");
    else
      v28 = CFSTR("name_display_string");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);
  }

  v29 = *(void **)(a1 + 16);
  if (v29)
  {
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __46__GEOPBTransitHall__dictionaryRepresentation___block_invoke;
      v36[3] = &unk_1E1C00600;
      v33 = v32;
      v37 = v33;
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v36);
      v34 = v33;

      v31 = v34;
    }
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitHall _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPBTransitHall__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitHall)initWithDictionary:(id)a3
{
  return (GEOPBTransitHall *)-[GEOPBTransitHall _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOLatLng *v12;
  uint64_t v13;
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
  GEOStyleAttributes *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("hallIndex");
      else
        v6 = CFSTR("hall_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHallIndex:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));

      if (a3)
        v9 = CFSTR("stationIndex");
      else
        v9 = CFSTR("station_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStationIndex:", objc_msgSend(v10, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOLatLng initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOLatLng initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setLocation:", v13);

      }
      if (a3)
        v15 = CFSTR("zoomName");
      else
        v15 = CFSTR("zoom_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = v16;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v37 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = [GEOPBTransitZoomRangeString alloc];
                if ((a3 & 1) != 0)
                  v24 = -[GEOPBTransitZoomRangeString initWithJSON:](v23, "initWithJSON:", v22);
                else
                  v24 = -[GEOPBTransitZoomRangeString initWithDictionary:](v23, "initWithDictionary:", v22);
                v25 = (void *)v24;
                objc_msgSend(a1, "addZoomName:", v24);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          }
          while (v19);
        }

        v16 = v35;
      }

      if (a3)
        v26 = CFSTR("styleAttributes");
      else
        v26 = CFSTR("style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEOStyleAttributes initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEOStyleAttributes initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setStyleAttributes:", v29);

      }
      if (a3)
        v31 = CFSTR("nameDisplayString");
      else
        v31 = CFSTR("name_display_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(a1, "setNameDisplayString:", v33);

      }
    }
  }

  return a1;
}

- (GEOPBTransitHall)initWithJSON:(id)a3
{
  return (GEOPBTransitHall *)-[GEOPBTransitHall _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_198_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_199_0;
    GEOPBTransitHallReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPBTransitHallCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitHallIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitHallReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1F0) == 0)
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
      goto LABEL_25;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitHall readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0)
      goto LABEL_5;
LABEL_22:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_22;
LABEL_5:
  if ((flags & 4) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_location)
    PBDataWriterWriteSubmessage();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_zoomNames;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (self->_styleAttributes)
    PBDataWriterWriteSubmessage();
  if (self->_nameDisplayString)
    PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_25:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPBTransitHall _readLocation]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOPBTransitHall readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v10 + 19) = self->_hallIndex;
    *((_WORD *)v10 + 42) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v10[4] = (id)self->_muid;
  *((_WORD *)v10 + 42) |= 1u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v10 + 20) = self->_stationIndex;
    *((_WORD *)v10 + 42) |= 4u;
  }
LABEL_5:
  if (self->_location)
    objc_msgSend(v10, "setLocation:");
  if (-[GEOPBTransitHall zoomNamesCount](self, "zoomNamesCount"))
  {
    objc_msgSend(v10, "clearZoomNames");
    v5 = -[GEOPBTransitHall zoomNamesCount](self, "zoomNamesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOPBTransitHall zoomNameAtIndex:](self, "zoomNameAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addZoomName:", v8);

      }
    }
  }
  if (self->_styleAttributes)
    objc_msgSend(v10, "setStyleAttributes:");
  v9 = v10;
  if (self->_nameDisplayString)
  {
    objc_msgSend(v10, "setNameDisplayString:");
    v9 = v10;
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
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  PBUnknownFields *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
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
      GEOPBTransitHallReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitHall readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0)
      goto LABEL_7;
LABEL_19:
    *(_QWORD *)(v5 + 32) = self->_muid;
    *(_WORD *)(v5 + 84) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 76) = self->_hallIndex;
  *(_WORD *)(v5 + 84) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_19;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 80) = self->_stationIndex;
    *(_WORD *)(v5 + 84) |= 4u;
  }
LABEL_9:
  v10 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_zoomNames;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addZoomName:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  v17 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  v19 = -[NSString copyWithZone:](self->_nameDisplayString, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOLatLng *location;
  NSMutableArray *zoomNames;
  GEOStyleAttributes *styleAttributes;
  NSString *nameDisplayString;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOPBTransitHall readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 42);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_hallIndex != *((_DWORD *)v4 + 19))
      goto LABEL_25;
  }
  else if ((v6 & 2) != 0)
  {
LABEL_25:
    v11 = 0;
    goto LABEL_26;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 4))
      goto LABEL_25;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_25;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_stationIndex != *((_DWORD *)v4 + 20))
      goto LABEL_25;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_25;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 3) && !-[GEOLatLng isEqual:](location, "isEqual:"))
    goto LABEL_25;
  zoomNames = self->_zoomNames;
  if ((unint64_t)zoomNames | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](zoomNames, "isEqual:"))
      goto LABEL_25;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_25;
  }
  nameDisplayString = self->_nameDisplayString;
  if ((unint64_t)nameDisplayString | *((_QWORD *)v4 + 5))
    v11 = -[NSString isEqual:](nameDisplayString, "isEqual:");
  else
    v11 = 1;
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  -[GEOPBTransitHall readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    v4 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v4 = 2654435761 * self->_hallIndex;
  if ((flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761u * self->_muid;
  if ((flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_stationIndex;
LABEL_8:
  v7 = v5 ^ v4 ^ v6 ^ -[GEOLatLng hash](self->_location, "hash");
  v8 = -[NSMutableArray hash](self->_zoomNames, "hash");
  v9 = v7 ^ v8 ^ -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  return v9 ^ -[NSString hash](self->_nameDisplayString, "hash");
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
  GEOStyleAttributes *styleAttributes;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 42);
  if ((v5 & 2) != 0)
  {
    self->_hallIndex = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v4 + 42);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_muid = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v4 + 42) & 4) != 0)
  {
LABEL_4:
    self->_stationIndex = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_5:
  location = self->_location;
  v7 = *((_QWORD *)v4 + 3);
  if (location)
  {
    if (v7)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOPBTransitHall setLocation:](self, "setLocation:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = *((id *)v4 + 7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[GEOPBTransitHall addZoomName:](self, "addZoomName:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  styleAttributes = self->_styleAttributes;
  v14 = *((_QWORD *)v4 + 6);
  if (styleAttributes)
  {
    if (v14)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOPBTransitHall setStyleAttributes:](self, "setStyleAttributes:");
  }
  if (*((_QWORD *)v4 + 5))
    -[GEOPBTransitHall setNameDisplayString:](self, "setNameDisplayString:");

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
      GEOPBTransitHallReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_202);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x108u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBTransitHall readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_location, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_zoomNames;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomNames, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestName
{
  return -[GEOPBTransitHall bestNameWithLocale:](self, "bestNameWithLocale:", 0);
}

- (id)identifier
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (-[GEOPBTransitHall hasLocation](self, "hasLocation"))
  {
    -[GEOPBTransitHall location](self, "location");
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
  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", -[GEOPBTransitHall muid](self, "muid"), 0, v5, v7);
}

@end
