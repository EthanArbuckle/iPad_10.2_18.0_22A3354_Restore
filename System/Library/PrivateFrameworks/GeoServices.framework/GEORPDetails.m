@implementation GEORPDetails

- (GEORPDetails)init
{
  GEORPDetails *v2;
  GEORPDetails *v3;
  GEORPDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPDetails;
  v2 = -[GEORPDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDetails)initWithData:(id)a3
{
  GEORPDetails *v3;
  GEORPDetails *v4;
  GEORPDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPDetails;
  v3 = -[GEORPDetails initWithData:](&v7, sel_initWithData_, a3);
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
  if ((flags & 2) != 0)
    return self->_displayStyle;
  else
    return 1;
}

- (void)setDisplayStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_displayStyle = a3;
}

- (void)setHasDisplayStyle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDisplayStyle
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)displayStyleAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 6 && ((0x3Bu >> v3) & 1) != 0)
  {
    v4 = off_1E1C0EB08[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsDisplayStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_REGION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_SINGLE_PIN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_MAP_LABEL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_DIRECTIONS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_DESCRIPTION_ONLY")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readLocalizedTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedTitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLocalizedTitle
{
  -[GEORPDetails _readLocalizedTitle]((uint64_t)self);
  return self->_localizedTitle != 0;
}

- (NSString)localizedTitle
{
  -[GEORPDetails _readLocalizedTitle]((uint64_t)self);
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (void)_readLocalizedDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLocalizedDescription
{
  -[GEORPDetails _readLocalizedDescription]((uint64_t)self);
  return self->_localizedDescription != 0;
}

- (NSString)localizedDescription
{
  -[GEORPDetails _readLocalizedDescription]((uint64_t)self);
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (void)_readDisplayRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDisplayRegion
{
  -[GEORPDetails _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (GEOMapRegion)displayRegion
{
  -[GEORPDetails _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)_readPlaces
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaces_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)places
{
  -[GEORPDetails _readPlaces]((uint64_t)self);
  return self->_places;
}

- (void)setPlaces:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *places;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  places = self->_places;
  self->_places = v4;

}

- (void)clearPlaces
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_places, "removeAllObjects");
}

- (void)addPlace:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDetails _readPlaces]((uint64_t)self);
  -[GEORPDetails _addNoFlagsPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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

- (unint64_t)placesCount
{
  -[GEORPDetails _readPlaces]((uint64_t)self);
  return -[NSMutableArray count](self->_places, "count");
}

- (id)placeAtIndex:(unint64_t)a3
{
  -[GEORPDetails _readPlaces]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_places, "objectAtIndex:", a3);
}

+ (Class)placeType
{
  return (Class)objc_opt_class();
}

- (void)_readLabel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabel_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLabel
{
  -[GEORPDetails _readLabel]((uint64_t)self);
  return self->_label != 0;
}

- (GEORPUpdatedLabel)label
{
  -[GEORPDetails _readLabel]((uint64_t)self);
  return self->_label;
}

- (void)setLabel:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_label, a3);
}

- (int)directionsType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_directionsType;
  else
    return 0;
}

- (void)setDirectionsType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_directionsType = a3;
}

- (void)setHasDirectionsType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasDirectionsType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)directionsTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0EB38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDirectionsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)mapType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_mapType;
  else
    return 0;
}

- (void)setMapType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasMapType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0EB70[a3];
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

- (void)_readButton
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readButton_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasButton
{
  -[GEORPDetails _readButton]((uint64_t)self);
  return self->_button != 0;
}

- (GEORPButton)button
{
  -[GEORPDetails _readButton]((uint64_t)self);
  return self->_button;
}

- (void)setButton:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_button, a3);
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
  v8.super_class = (Class)GEORPDetails;
  -[GEORPDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unsigned int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
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
  if ((*(_WORD *)(a1 + 88) & 2) != 0)
  {
    v5 = *(_DWORD *)(a1 + 80) - 1;
    if (v5 < 6 && ((0x3Bu >> v5) & 1) != 0)
    {
      v6 = off_1E1C0EB08[v5];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 80));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v7 = CFSTR("displayStyle");
    else
      v7 = CFSTR("display_style");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("localizedTitle");
    else
      v9 = CFSTR("localized_title");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  objc_msgSend((id)a1, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("localizedDescription");
    else
      v11 = CFSTR("localized_description");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend((id)a1, "displayRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("displayRegion");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("display_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = *(id *)(a1 + 56);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("place"));
  }
  objc_msgSend((id)a1, "label");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v24, "jsonRepresentation");
    else
      objc_msgSend(v24, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("label"));

  }
  v27 = *(_WORD *)(a1 + 88);
  if ((v27 & 1) != 0)
  {
    v28 = *(int *)(a1 + 76);
    if (v28 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E1C0EB38[v28];
    }
    if (a2)
      v30 = CFSTR("directionsType");
    else
      v30 = CFSTR("directions_type");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

    v27 = *(_WORD *)(a1 + 88);
  }
  if ((v27 & 4) != 0)
  {
    v31 = *(int *)(a1 + 84);
    if (v31 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_1E1C0EB70[v31];
    }
    if (a2)
      v33 = CFSTR("mapType");
    else
      v33 = CFSTR("map_type");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "button");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v34, "jsonRepresentation");
    else
      objc_msgSend(v34, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("button"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPDetails)initWithDictionary:(id)a3
{
  return (GEORPDetails *)-[GEORPDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOMapRegion *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  GEOPDPlace *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  GEORPUpdatedLabel *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  GEORPButton *v44;
  uint64_t v45;
  void *v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_107;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_107;
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
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHOW_REGION")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHOW_SINGLE_PIN")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHOW_MAP_LABEL")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHOW_DIRECTIONS")) & 1) != 0)
    {
      v9 = 5;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("SHOW_DESCRIPTION_ONLY")))
    {
      v9 = 6;
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_22;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setDisplayStyle:", v9);
LABEL_22:

  if (a3)
    v10 = CFSTR("localizedTitle");
  else
    v10 = CFSTR("localized_title");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setLocalizedTitle:", v12);

  }
  if (a3)
    v13 = CFSTR("localizedDescription");
  else
    v13 = CFSTR("localized_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setLocalizedDescription:", v15);

  }
  if (a3)
    v16 = CFSTR("displayRegion");
  else
    v16 = CFSTR("display_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOMapRegion initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOMapRegion initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setDisplayRegion:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = v5;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v50 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = [GEOPDPlace alloc];
            if ((a3 & 1) != 0)
              v29 = -[GEOPDPlace initWithJSON:](v28, "initWithJSON:", v27);
            else
              v29 = -[GEOPDPlace initWithDictionary:](v28, "initWithDictionary:", v27);
            v30 = (void *)v29;
            objc_msgSend(a1, "addPlace:", v29);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v24);
    }

    v5 = v48;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("label"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEORPUpdatedLabel alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEORPUpdatedLabel initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEORPUpdatedLabel initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setLabel:", v33);

  }
  if (a3)
    v35 = CFSTR("directionsType");
  else
    v35 = CFSTR("directions_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = v36;
    if ((objc_msgSend(v37, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v38 = 0;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v38 = 1;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v38 = 2;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v38 = 3;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v38 = 4;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v38 = 5;
    }
    else if (objc_msgSend(v37, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v38 = 6;
    }
    else
    {
      v38 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_82;
    v38 = objc_msgSend(v36, "intValue");
  }
  objc_msgSend(a1, "setDirectionsType:", v38);
LABEL_82:

  if (a3)
    v39 = CFSTR("mapType");
  else
    v39 = CFSTR("map_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = v40;
    if ((objc_msgSend(v41, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
    {
      v42 = 0;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
    {
      v42 = 1;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
    {
      v42 = 2;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
    {
      v42 = 3;
    }
    else if (objc_msgSend(v41, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
    {
      v42 = 4;
    }
    else
    {
      v42 = 0;
    }

    goto LABEL_100;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = objc_msgSend(v40, "intValue");
LABEL_100:
    objc_msgSend(a1, "setMapType:", v42);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("button"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = [GEORPButton alloc];
    if ((a3 & 1) != 0)
      v45 = -[GEORPButton initWithJSON:](v44, "initWithJSON:", v43);
    else
      v45 = -[GEORPButton initWithDictionary:](v44, "initWithDictionary:", v43);
    v46 = (void *)v45;
    objc_msgSend(a1, "setButton:", v45);

  }
LABEL_107:

  return a1;
}

- (GEORPDetails)initWithJSON:(id)a3
{
  return (GEORPDetails *)-[GEORPDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_576;
    else
      v8 = (int *)&readAll__nonRecursiveTag_577;
    GEORPDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
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
  if (self->_reader && (_GEORPDetailsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPDetails readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_localizedTitle)
      PBDataWriterWriteStringField();
    if (self->_localizedDescription)
      PBDataWriterWriteStringField();
    if (self->_displayRegion)
      PBDataWriterWriteSubmessage();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_places;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_label)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_button)
      PBDataWriterWriteSubmessage();
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
  -[GEORPDetails _readDisplayRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_displayRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPDetails _readLabel]((uint64_t)self);
  if (-[GEORPUpdatedLabel hasGreenTeaWithValue:](self->_label, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPDetails _readPlaces]((uint64_t)self);
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
          goto LABEL_14;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_14:

  return v5;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 flags;
  id *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEORPDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v10 + 20) = self->_displayStyle;
    *((_WORD *)v10 + 44) |= 2u;
  }
  if (self->_localizedTitle)
    objc_msgSend(v10, "setLocalizedTitle:");
  if (self->_localizedDescription)
    objc_msgSend(v10, "setLocalizedDescription:");
  if (self->_displayRegion)
    objc_msgSend(v10, "setDisplayRegion:");
  if (-[GEORPDetails placesCount](self, "placesCount"))
  {
    objc_msgSend(v10, "clearPlaces");
    v4 = -[GEORPDetails placesCount](self, "placesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPDetails placeAtIndex:](self, "placeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addPlace:", v7);

      }
    }
  }
  if (self->_label)
    objc_msgSend(v10, "setLabel:");
  flags = (__int16)self->_flags;
  v9 = v10;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v10 + 19) = self->_directionsType;
    *((_WORD *)v10 + 44) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v10 + 21) = self->_mapType;
    *((_WORD *)v10 + 44) |= 4u;
  }
  if (self->_button)
  {
    objc_msgSend(v10, "setButton:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
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
  __int16 flags;
  id v23;
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
      GEORPDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPDetails readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_displayStyle;
    *(_WORD *)(v5 + 88) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOMapRegion copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self->_places;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addPlace:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v20 = -[GEORPUpdatedLabel copyWithZone:](self->_label, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v20;

  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_directionsType;
    *(_WORD *)(v5 + 88) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_mapType;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  v23 = -[GEORPButton copyWithZone:](self->_button, "copyWithZone:", a3, (_QWORD)v25);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v23;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *localizedTitle;
  NSString *localizedDescription;
  GEOMapRegion *displayRegion;
  NSMutableArray *places;
  GEORPUpdatedLabel *label;
  __int16 flags;
  __int16 v12;
  GEORPButton *button;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEORPDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_displayStyle != *((_DWORD *)v4 + 20))
      goto LABEL_29;
  }
  else if ((v5 & 2) != 0)
  {
LABEL_29:
    v14 = 0;
    goto LABEL_30;
  }
  localizedTitle = self->_localizedTitle;
  if ((unint64_t)localizedTitle | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](localizedTitle, "isEqual:"))
  {
    goto LABEL_29;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](localizedDescription, "isEqual:"))
      goto LABEL_29;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOMapRegion isEqual:](displayRegion, "isEqual:"))
      goto LABEL_29;
  }
  places = self->_places;
  if ((unint64_t)places | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](places, "isEqual:"))
      goto LABEL_29;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPUpdatedLabel isEqual:](label, "isEqual:"))
      goto LABEL_29;
  }
  flags = (__int16)self->_flags;
  v12 = *((_WORD *)v4 + 44);
  if ((flags & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_directionsType != *((_DWORD *)v4 + 19))
      goto LABEL_29;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_mapType != *((_DWORD *)v4 + 21))
      goto LABEL_29;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_29;
  }
  button = self->_button;
  if ((unint64_t)button | *((_QWORD *)v4 + 2))
    v14 = -[GEORPButton isEqual:](button, "isEqual:");
  else
    v14 = 1;
LABEL_30:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int16 flags;
  uint64_t v10;
  uint64_t v11;

  -[GEORPDetails readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_displayStyle;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_localizedTitle, "hash");
  v5 = -[NSString hash](self->_localizedDescription, "hash");
  v6 = -[GEOMapRegion hash](self->_displayRegion, "hash");
  v7 = -[NSMutableArray hash](self->_places, "hash");
  v8 = -[GEORPUpdatedLabel hash](self->_label, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v10 = 2654435761 * self->_directionsType;
    if ((flags & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ -[GEORPButton hash](self->_button, "hash");
  }
  v10 = 0;
  if ((flags & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v11 = 2654435761 * self->_mapType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ -[GEORPButton hash](self->_button, "hash");
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
  GEORPUpdatedLabel *label;
  uint64_t v13;
  __int16 v14;
  GEORPButton *button;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 44) & 2) != 0)
  {
    self->_displayStyle = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
    -[GEORPDetails setLocalizedTitle:](self, "setLocalizedTitle:");
  if (*((_QWORD *)v4 + 5))
    -[GEORPDetails setLocalizedDescription:](self, "setLocalizedDescription:");
  displayRegion = self->_displayRegion;
  v6 = *((_QWORD *)v4 + 3);
  if (displayRegion)
  {
    if (v6)
      -[GEOMapRegion mergeFrom:](displayRegion, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPDetails setDisplayRegion:](self, "setDisplayRegion:");
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *((id *)v4 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        -[GEORPDetails addPlace:](self, "addPlace:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  label = self->_label;
  v13 = *((_QWORD *)v4 + 4);
  if (label)
  {
    if (v13)
      -[GEORPUpdatedLabel mergeFrom:](label, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPDetails setLabel:](self, "setLabel:");
  }
  v14 = *((_WORD *)v4 + 44);
  if ((v14 & 1) != 0)
  {
    self->_directionsType = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 1u;
    v14 = *((_WORD *)v4 + 44);
  }
  if ((v14 & 4) != 0)
  {
    self->_mapType = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }
  button = self->_button;
  v16 = *((_QWORD *)v4 + 2);
  if (button)
  {
    if (v16)
      -[GEORPButton mergeFrom:](button, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEORPDetails setButton:](self, "setButton:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
