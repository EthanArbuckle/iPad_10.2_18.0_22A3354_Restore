@implementation GEOPBTransitStop

- (GEOPBTransitStop)init
{
  GEOPBTransitStop *v2;
  GEOPBTransitStop *v3;
  GEOPBTransitStop *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitStop;
  v2 = -[GEOPBTransitStop init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitStop)initWithData:(id)a3
{
  GEOPBTransitStop *v3;
  GEOPBTransitStop *v4;
  GEOPBTransitStop *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitStop;
  v3 = -[GEOPBTransitStop initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)stopIndex
{
  return self->_stopIndex;
}

- (void)setStopIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_stopIndex = a3;
}

- (void)setHasStopIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStopIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
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

- (void)_readLatLng
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
        GEOPBTransitStopReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLatLng_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLatLng
{
  -[GEOPBTransitStop _readLatLng]((uint64_t)self);
  return self->_latLng != 0;
}

- (GEOLatLng)latLng
{
  -[GEOPBTransitStop _readLatLng]((uint64_t)self);
  return self->_latLng;
}

- (void)setLatLng:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (void)_readTimezone
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
        GEOPBTransitStopReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTimezone
{
  -[GEOPBTransitStop _readTimezone]((uint64_t)self);
  return self->_timezone != 0;
}

- (NSString)timezone
{
  -[GEOPBTransitStop _readTimezone]((uint64_t)self);
  return self->_timezone;
}

- (void)setTimezone:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (void)_readStyleAttributes
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
        GEOPBTransitStopReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_853);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOPBTransitStop _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitStop _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (unsigned)hallIndex
{
  return self->_hallIndex;
}

- (void)setHallIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_hallIndex = a3;
}

- (void)setHasHallIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasHallIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readZoomNames
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
        GEOPBTransitStopReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZoomNames_tags_854);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)zoomNames
{
  -[GEOPBTransitStop _readZoomNames]((uint64_t)self);
  return self->_zoomNames;
}

- (void)setZoomNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *zoomNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  zoomNames = self->_zoomNames;
  self->_zoomNames = v4;

}

- (void)clearZoomNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_zoomNames, "removeAllObjects");
}

- (void)addZoomName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBTransitStop _readZoomNames]((uint64_t)self);
  -[GEOPBTransitStop _addNoFlagsZoomName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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

- (unint64_t)zoomNamesCount
{
  -[GEOPBTransitStop _readZoomNames]((uint64_t)self);
  return -[NSMutableArray count](self->_zoomNames, "count");
}

- (id)zoomNameAtIndex:(unint64_t)a3
{
  -[GEOPBTransitStop _readZoomNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_zoomNames, "objectAtIndex:", a3);
}

+ (Class)zoomNameType
{
  return (Class)objc_opt_class();
}

- (void)_readNameDisplayString
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
        GEOPBTransitStopReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNameDisplayString_tags_855);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasNameDisplayString
{
  -[GEOPBTransitStop _readNameDisplayString]((uint64_t)self);
  return self->_nameDisplayString != 0;
}

- (NSString)nameDisplayString
{
  -[GEOPBTransitStop _readNameDisplayString]((uint64_t)self);
  return self->_nameDisplayString;
}

- (void)setNameDisplayString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
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
  v8.super_class = (Class)GEOPBTransitStop;
  -[GEOPBTransitStop description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitStop dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitStop _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 92);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("stopIndex");
    else
      v7 = CFSTR("stop_index");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 92);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("muid"));

  }
  objc_msgSend((id)a1, "latLng");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("latLng");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("lat_lng");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "timezone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timezone"));

  objc_msgSend((id)a1, "styleAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if ((*(_WORD *)(a1 + 92) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("hallIndex");
    else
      v19 = CFSTR("hall_index");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v21 = *(id *)(a1 + 64);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("zoomName");
    else
      v28 = CFSTR("zoom_name");
    objc_msgSend(v4, "setObject:forKey:", v20, v28);

  }
  objc_msgSend((id)a1, "nameDisplayString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (a2)
      v30 = CFSTR("nameDisplayString");
    else
      v30 = CFSTR("name_display_string");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);
  }

  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __46__GEOPBTransitStop__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

      v33 = v36;
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitStop _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPBTransitStop__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitStop)initWithDictionary:(id)a3
{
  return (GEOPBTransitStop *)-[GEOPBTransitStop _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  GEOLatLng *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOStyleAttributes *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  GEOPBTransitZoomRangeString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("stopIndex");
      else
        v6 = CFSTR("stop_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStopIndex:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));

      if (a3)
        v9 = CFSTR("latLng");
      else
        v9 = CFSTR("lat_lng");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOLatLng initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOLatLng initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setLatLng:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timezone"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setTimezone:", v15);

      }
      if (a3)
        v16 = CFSTR("styleAttributes");
      else
        v16 = CFSTR("style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOStyleAttributes initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOStyleAttributes initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setStyleAttributes:", v19);

      }
      if (a3)
        v21 = CFSTR("hallIndex");
      else
        v21 = CFSTR("hall_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHallIndex:", objc_msgSend(v22, "unsignedIntValue"));

      if (a3)
        v23 = CFSTR("zoomName");
      else
        v23 = CFSTR("zoom_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v38 = v24;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v40 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = [GEOPBTransitZoomRangeString alloc];
                if ((a3 & 1) != 0)
                  v32 = -[GEOPBTransitZoomRangeString initWithJSON:](v31, "initWithJSON:", v30);
                else
                  v32 = -[GEOPBTransitZoomRangeString initWithDictionary:](v31, "initWithDictionary:", v30);
                v33 = (void *)v32;
                objc_msgSend(a1, "addZoomName:", v32);

              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v27);
        }

        v24 = v38;
      }

      if (a3)
        v34 = CFSTR("nameDisplayString");
      else
        v34 = CFSTR("name_display_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = (void *)objc_msgSend(v35, "copy");
        objc_msgSend(a1, "setNameDisplayString:", v36);

      }
    }
  }

  return a1;
}

- (GEOPBTransitStop)initWithJSON:(id)a3
{
  return (GEOPBTransitStop *)-[GEOPBTransitStop _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_866_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_867_0;
    GEOPBTransitStopReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPBTransitStopCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitStopIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitStopReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F0) == 0))
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
    -[GEOPBTransitStop readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_latLng)
      PBDataWriterWriteSubmessage();
    if (self->_timezone)
      PBDataWriterWriteStringField();
    if (self->_styleAttributes)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
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

    if (self->_nameDisplayString)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPBTransitStop _readLatLng]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_latLng, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOPBTransitStop readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v10;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v10 + 22) = self->_stopIndex;
    *((_WORD *)v10 + 46) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v10[4] = (id)self->_muid;
    *((_WORD *)v10 + 46) |= 1u;
  }
  if (self->_latLng)
  {
    objc_msgSend(v10, "setLatLng:");
    v4 = v10;
  }
  if (self->_timezone)
  {
    objc_msgSend(v10, "setTimezone:");
    v4 = v10;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v10, "setStyleAttributes:");
    v4 = v10;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_hallIndex;
    *((_WORD *)v4 + 46) |= 2u;
  }
  if (-[GEOPBTransitStop zoomNamesCount](self, "zoomNamesCount"))
  {
    objc_msgSend(v10, "clearZoomNames");
    v6 = -[GEOPBTransitStop zoomNamesCount](self, "zoomNamesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOPBTransitStop zoomNameAtIndex:](self, "zoomNameAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addZoomName:", v9);

      }
    }
  }
  if (self->_nameDisplayString)
    objc_msgSend(v10, "setNameDisplayString:");

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
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  PBUnknownFields *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
      GEOPBTransitStopReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitStop readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_stopIndex;
    *(_WORD *)(v5 + 92) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_muid;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v10 = -[GEOLatLng copyWithZone:](self->_latLng, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_hallIndex;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = self->_zoomNames;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addZoomName:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

  v21 = -[NSString copyWithZone:](self->_nameDisplayString, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v21;

  v23 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v23;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOLatLng *latLng;
  NSString *timezone;
  GEOStyleAttributes *styleAttributes;
  __int16 v10;
  NSMutableArray *zoomNames;
  NSString *nameDisplayString;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOPBTransitStop readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 46);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_stopIndex != *((_DWORD *)v4 + 22))
      goto LABEL_27;
  }
  else if ((v6 & 4) != 0)
  {
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 4))
      goto LABEL_27;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_27;
  }
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((_QWORD *)v4 + 3) && !-[GEOLatLng isEqual:](latLng, "isEqual:"))
    goto LABEL_27;
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](timezone, "isEqual:"))
      goto LABEL_27;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_27;
  }
  v10 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_hallIndex != *((_DWORD *)v4 + 21))
      goto LABEL_27;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_27;
  }
  zoomNames = self->_zoomNames;
  if ((unint64_t)zoomNames | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](zoomNames, "isEqual:"))
  {
    goto LABEL_27;
  }
  nameDisplayString = self->_nameDisplayString;
  if ((unint64_t)nameDisplayString | *((_QWORD *)v4 + 5))
    v13 = -[NSString isEqual:](nameDisplayString, "isEqual:");
  else
    v13 = 1;
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  -[GEOPBTransitStop readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v4 = 2654435761 * self->_stopIndex;
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
  v6 = -[GEOLatLng hash](self->_latLng, "hash");
  v7 = -[NSString hash](self->_timezone, "hash");
  v8 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v9 = 2654435761 * self->_hallIndex;
  else
    v9 = 0;
  v10 = v5 ^ v4 ^ v6 ^ v7 ^ v8;
  v11 = v9 ^ -[NSMutableArray hash](self->_zoomNames, "hash");
  return v10 ^ v11 ^ -[NSString hash](self->_nameDisplayString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  GEOLatLng *latLng;
  uint64_t v7;
  GEOStyleAttributes *styleAttributes;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 4) != 0)
  {
    self->_stopIndex = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 4u;
    v5 = *((_WORD *)v4 + 46);
  }
  if ((v5 & 1) != 0)
  {
    self->_muid = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_flags |= 1u;
  }
  latLng = self->_latLng;
  v7 = *((_QWORD *)v4 + 3);
  if (latLng)
  {
    if (v7)
      -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOPBTransitStop setLatLng:](self, "setLatLng:");
  }
  if (*((_QWORD *)v4 + 7))
    -[GEOPBTransitStop setTimezone:](self, "setTimezone:");
  styleAttributes = self->_styleAttributes;
  v9 = *((_QWORD *)v4 + 6);
  if (styleAttributes)
  {
    if (v9)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOPBTransitStop setStyleAttributes:](self, "setStyleAttributes:");
  }
  if ((*((_WORD *)v4 + 46) & 2) != 0)
  {
    self->_hallIndex = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 8);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[GEOPBTransitStop addZoomName:](self, "addZoomName:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 5))
    -[GEOPBTransitStop setNameDisplayString:](self, "setNameDisplayString:");

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
      GEOPBTransitStopReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_870);
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
  *(_WORD *)&self->_flags |= 0x208u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBTransitStop readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_latLng, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
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

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomNames, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestName
{
  return -[GEOPBTransitStop bestNameWithLocale:](self, "bestNameWithLocale:", 0);
}

- (id)identifier
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (-[GEOPBTransitStop hasLatLng](self, "hasLatLng"))
  {
    -[GEOPBTransitStop latLng](self, "latLng");
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
  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", -[GEOPBTransitStop muid](self, "muid"), 0, v5, v7);
}

@end
