@implementation GEORPDisplayDetails

- (GEORPDisplayDetails)init
{
  GEORPDisplayDetails *v2;
  GEORPDisplayDetails *v3;
  GEORPDisplayDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPDisplayDetails;
  v2 = -[GEORPDisplayDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDisplayDetails)initWithData:(id)a3
{
  GEORPDisplayDetails *v3;
  GEORPDisplayDetails *v4;
  GEORPDisplayDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPDisplayDetails;
  v3 = -[GEORPDisplayDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)displayStyle
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_displayStyle;
  else
    return 0;
}

- (void)setDisplayStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_displayStyle = a3;
}

- (void)setHasDisplayStyle:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasDisplayStyle
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)displayStyleAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C21348[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDisplayStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_DISPLAY_STYLE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_DISPLAY_STYLE_SHOW_REGION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_RESPONSE_DISPLAY_STYLE_SHOW_SINGLE_PIN")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readTitle
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
        GEORPDisplayDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTitle
{
  -[GEORPDisplayDetails _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEOLocalizedString)title
{
  -[GEORPDisplayDetails _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readBody
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDisplayDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBody_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasBody
{
  -[GEORPDisplayDetails _readBody]((uint64_t)self);
  return self->_body != 0;
}

- (GEOLocalizedString)body
{
  -[GEORPDisplayDetails _readBody]((uint64_t)self);
  return self->_body;
}

- (void)setBody:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_body, a3);
}

- (void)_readDisplayRegion
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
        GEORPDisplayDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDisplayRegion
{
  -[GEORPDisplayDetails _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (GEOMapRegion)displayRegion
{
  -[GEORPDisplayDetails _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (int)mapType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_mapType;
  else
    return 0;
}

- (void)setMapType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMapType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C21360[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPlaces
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
        GEORPDisplayDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaces_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)places
{
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  return self->_places;
}

- (void)setPlaces:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *places;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  places = self->_places;
  self->_places = v4;

}

- (void)clearPlaces
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_places, "removeAllObjects");
}

- (void)addPlace:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  -[GEORPDisplayDetails _addNoFlagsPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsPlace:(uint64_t)a1
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

- (unint64_t)placesCount
{
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  return -[NSMutableArray count](self->_places, "count");
}

- (id)placeAtIndex:(unint64_t)a3
{
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_places, "objectAtIndex:", a3);
}

+ (Class)placeType
{
  return (Class)objc_opt_class();
}

- (void)_readOutreachLink
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
        GEORPDisplayDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOutreachLink_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOutreachLink
{
  -[GEORPDisplayDetails _readOutreachLink]((uint64_t)self);
  return self->_outreachLink != 0;
}

- (GEOTextLink)outreachLink
{
  -[GEORPDisplayDetails _readOutreachLink]((uint64_t)self);
  return self->_outreachLink;
}

- (void)setOutreachLink:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_outreachLink, a3);
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
  v8.super_class = (Class)GEORPDisplayDetails;
  -[GEORPDisplayDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPDisplayDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDisplayDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 84) & 1) != 0)
  {
    v5 = *(int *)(a1 + 76);
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C21348[v5];
    }
    if (a2)
      v7 = CFSTR("displayStyle");
    else
      v7 = CFSTR("display_style");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("title"));

  }
  objc_msgSend((id)a1, "body");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("body"));

  }
  objc_msgSend((id)a1, "displayRegion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("displayRegion");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("display_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if ((*(_WORD *)(a1 + 84) & 2) != 0)
  {
    v18 = *(int *)(a1 + 80);
    if (v18 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 80));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E1C21360[v18];
    }
    if (a2)
      v20 = CFSTR("mapType");
    else
      v20 = CFSTR("map_type");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v22 = *(id *)(a1 + 48);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v24);
    }

    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("place"));
  }
  objc_msgSend((id)a1, "outreachLink");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("outreachLink");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("outreach_link");
    }
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  v33 = *(void **)(a1 + 16);
  if (v33)
  {
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __49__GEORPDisplayDetails__dictionaryRepresentation___block_invoke;
      v40[3] = &unk_1E1C00600;
      v37 = v36;
      v41 = v37;
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v40);
      v38 = v37;

      v35 = v38;
    }
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDisplayDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEORPDisplayDetails__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPDisplayDetails)initWithDictionary:(id)a3
{
  return (GEORPDisplayDetails *)-[GEORPDisplayDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  GEOLocalizedString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEOLocalizedString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOMapRegion *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  GEOPDPlace *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  GEOTextLink *v39;
  uint64_t v40;
  void *v41;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_78;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_78;
  if (a3)
    v6 = CFSTR("displayStyle");
  else
    v6 = CFSTR("display_style");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RAP_RESPONSE_DISPLAY_STYLE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RAP_RESPONSE_DISPLAY_STYLE_SHOW_REGION")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("RAP_RESPONSE_DISPLAY_STYLE_SHOW_SINGLE_PIN")))
    {
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setDisplayStyle:", v9);
LABEL_18:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOLocalizedString alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEOLocalizedString initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEOLocalizedString initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setTitle:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("body"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOLocalizedString alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOLocalizedString initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOLocalizedString initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setBody:", v16);

  }
  if (a3)
    v18 = CFSTR("displayRegion");
  else
    v18 = CFSTR("display_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v21 = -[GEOMapRegion initWithJSON:](v20, "initWithJSON:", v19);
    else
      v21 = -[GEOMapRegion initWithDictionary:](v20, "initWithDictionary:", v19);
    v22 = (void *)v21;
    objc_msgSend(a1, "setDisplayRegion:", v21);

  }
  if (a3)
    v23 = CFSTR("mapType");
  else
    v23 = CFSTR("map_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v24;
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
    {
      v26 = 0;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
    {
      v26 = 1;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
    {
      v26 = 2;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
    {
      v26 = 3;
    }
    else if (objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
    {
      v26 = 4;
    }
    else
    {
      v26 = 0;
    }

    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = objc_msgSend(v24, "intValue");
LABEL_54:
    objc_msgSend(a1, "setMapType:", v26);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = v5;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = [GEOPDPlace alloc];
            if ((a3 & 1) != 0)
              v35 = -[GEOPDPlace initWithJSON:](v34, "initWithJSON:", v33);
            else
              v35 = -[GEOPDPlace initWithDictionary:](v34, "initWithDictionary:", v33);
            v36 = (void *)v35;
            objc_msgSend(a1, "addPlace:", v35);

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v30);
    }

    v5 = v43;
  }

  if (a3)
    v37 = CFSTR("outreachLink");
  else
    v37 = CFSTR("outreach_link");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = [GEOTextLink alloc];
    if ((a3 & 1) != 0)
      v40 = -[GEOTextLink initWithJSON:](v39, "initWithJSON:", v38);
    else
      v40 = -[GEOTextLink initWithDictionary:](v39, "initWithDictionary:", v38);
    v41 = (void *)v40;
    objc_msgSend(a1, "setOutreachLink:", v40);

  }
LABEL_78:

  return a1;
}

- (GEORPDisplayDetails)initWithJSON:(id)a3
{
  return (GEORPDisplayDetails *)-[GEORPDisplayDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_85;
    else
      v8 = (int *)&readAll__nonRecursiveTag_85;
    GEORPDisplayDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPDisplayDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDisplayDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDisplayDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDisplayDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPDisplayDetails readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_title)
      PBDataWriterWriteSubmessage();
    if (self->_body)
      PBDataWriterWriteSubmessage();
    if (self->_displayRegion)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_places;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_outreachLink)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
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
  -[GEORPDisplayDetails _readDisplayRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_displayRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPDisplayDetails _readPlaces]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_places;
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
  id *v8;

  v8 = (id *)a3;
  -[GEORPDisplayDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v8 + 19) = self->_displayStyle;
    *((_WORD *)v8 + 42) |= 1u;
  }
  if (self->_title)
    objc_msgSend(v8, "setTitle:");
  if (self->_body)
    objc_msgSend(v8, "setBody:");
  if (self->_displayRegion)
    objc_msgSend(v8, "setDisplayRegion:");
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v8 + 20) = self->_mapType;
    *((_WORD *)v8 + 42) |= 2u;
  }
  if (-[GEORPDisplayDetails placesCount](self, "placesCount"))
  {
    objc_msgSend(v8, "clearPlaces");
    v4 = -[GEORPDisplayDetails placesCount](self, "placesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPDisplayDetails placeAtIndex:](self, "placeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addPlace:", v7);

      }
    }
  }
  if (self->_outreachLink)
    objc_msgSend(v8, "setOutreachLink:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
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
  PBUnknownFields *v22;
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPDisplayDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPDisplayDetails readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_displayStyle;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  v9 = -[GEOLocalizedString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[GEOLocalizedString copyWithZone:](self->_body, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOMapRegion copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_mapType;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = self->_places;
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
        objc_msgSend((id)v5, "addPlace:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  v20 = -[GEOTextLink copyWithZone:](self->_outreachLink, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOLocalizedString *title;
  GEOLocalizedString *body;
  GEOMapRegion *displayRegion;
  __int16 v9;
  NSMutableArray *places;
  GEOTextLink *outreachLink;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEORPDisplayDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_displayStyle != *((_DWORD *)v4 + 19))
      goto LABEL_22;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 7) && !-[GEOLocalizedString isEqual:](title, "isEqual:"))
    goto LABEL_22;
  body = self->_body;
  if ((unint64_t)body | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLocalizedString isEqual:](body, "isEqual:"))
      goto LABEL_22;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOMapRegion isEqual:](displayRegion, "isEqual:"))
      goto LABEL_22;
  }
  v9 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_mapType != *((_DWORD *)v4 + 20))
      goto LABEL_22;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_22;
  }
  places = self->_places;
  if ((unint64_t)places | *((_QWORD *)v4 + 6) && !-[NSMutableArray isEqual:](places, "isEqual:"))
    goto LABEL_22;
  outreachLink = self->_outreachLink;
  if ((unint64_t)outreachLink | *((_QWORD *)v4 + 5))
    v12 = -[GEOTextLink isEqual:](outreachLink, "isEqual:");
  else
    v12 = 1;
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEORPDisplayDetails readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_displayStyle;
  else
    v3 = 0;
  v4 = -[GEOLocalizedString hash](self->_title, "hash");
  v5 = -[GEOLocalizedString hash](self->_body, "hash");
  v6 = -[GEOMapRegion hash](self->_displayRegion, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v7 = 2654435761 * self->_mapType;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSMutableArray hash](self->_places, "hash");
  return v8 ^ v9 ^ -[GEOTextLink hash](self->_outreachLink, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOLocalizedString *title;
  uint64_t v6;
  GEOLocalizedString *body;
  uint64_t v8;
  GEOMapRegion *displayRegion;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  GEOTextLink *outreachLink;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 42) & 1) != 0)
  {
    self->_displayStyle = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 1u;
  }
  title = self->_title;
  v6 = *((_QWORD *)v4 + 7);
  if (title)
  {
    if (v6)
      -[GEOLocalizedString mergeFrom:](title, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPDisplayDetails setTitle:](self, "setTitle:");
  }
  body = self->_body;
  v8 = *((_QWORD *)v4 + 3);
  if (body)
  {
    if (v8)
      -[GEOLocalizedString mergeFrom:](body, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEORPDisplayDetails setBody:](self, "setBody:");
  }
  displayRegion = self->_displayRegion;
  v10 = *((_QWORD *)v4 + 4);
  if (displayRegion)
  {
    if (v10)
      -[GEOMapRegion mergeFrom:](displayRegion, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEORPDisplayDetails setDisplayRegion:](self, "setDisplayRegion:");
  }
  if ((*((_WORD *)v4 + 42) & 2) != 0)
  {
    self->_mapType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 2u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *((id *)v4 + 6);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[GEORPDisplayDetails addPlace:](self, "addPlace:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  outreachLink = self->_outreachLink;
  v17 = *((_QWORD *)v4 + 5);
  if (outreachLink)
  {
    if (v17)
      -[GEOTextLink mergeFrom:](outreachLink, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORPDisplayDetails setOutreachLink:](self, "setOutreachLink:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPDisplayDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_18);
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
  *(_WORD *)&self->_flags |= 0x104u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPDisplayDetails readAll:](self, "readAll:", 0);
    -[GEOLocalizedString clearUnknownFields:](self->_title, "clearUnknownFields:", 1);
    -[GEOLocalizedString clearUnknownFields:](self->_body, "clearUnknownFields:", 1);
    -[GEOMapRegion clearUnknownFields:](self->_displayRegion, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_places;
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

    -[GEOTextLink clearUnknownFields:](self->_outreachLink, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_outreachLink, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
