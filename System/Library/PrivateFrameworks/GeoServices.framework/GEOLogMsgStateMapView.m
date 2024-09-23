@implementation GEOLogMsgStateMapView

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_zoomLevel = a3;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasZoomLevel
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)mapType
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_mapType;
  else
    return 0;
}

- (void)setMapType:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMapType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C22CC0[a3];
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

- (double)styleZoomLevel
{
  return self->_styleZoomLevel;
}

- (void)setStyleZoomLevel:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_styleZoomLevel = a3;
}

- (void)setHasStyleZoomLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStyleZoomLevel
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_pitch = a3;
}

- (void)setHasPitch:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPitch
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isAdvancedMap
{
  return self->_isAdvancedMap;
}

- (void)setIsAdvancedMap:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_isAdvancedMap = a3;
}

- (void)setHasIsAdvancedMap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsAdvancedMap
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)isGlobeProjection
{
  return self->_isGlobeProjection;
}

- (void)setIsGlobeProjection:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_isGlobeProjection = a3;
}

- (void)setHasIsGlobeProjection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasIsGlobeProjection
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (int)viewMode
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_viewMode;
  else
    return 0;
}

- (void)setViewMode:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_viewMode = a3;
}

- (void)setHasViewMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasViewMode
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)viewModeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C22CE8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsViewMode:(id)a3
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TERRAIN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID_FLYOVER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE_FLYOVER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_DRIVING")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)watchProximityRadiusOn
{
  return self->_watchProximityRadiusOn;
}

- (void)setWatchProximityRadiusOn:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x80u;
  self->_watchProximityRadiusOn = a3;
}

- (void)setHasWatchProximityRadiusOn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = v3 & 0x80 | *(_BYTE *)&self->_flags & 0x7F;
}

- (BOOL)hasWatchProximityRadiusOn
{
  return *(_BYTE *)&self->_flags >> 7;
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
  v8.super_class = (Class)GEOLogMsgStateMapView;
  -[GEOLogMsgStateMapView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapView _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "mapRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(_BYTE *)(a1 + 52);
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("zoomLevel");
    else
      v11 = CFSTR("zoom_level");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_BYTE *)(a1 + 52);
  }
  if ((v9 & 8) != 0)
  {
    v12 = *(int *)(a1 + 40);
    if (v12 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C22CC0[v12];
    }
    if (a2)
      v14 = CFSTR("mapType");
    else
      v14 = CFSTR("map_type");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v9 = *(_BYTE *)(a1 + 52);
  }
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("styleZoomLevel");
    else
      v16 = CFSTR("style_zoom_level");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v9 = *(_BYTE *)(a1 + 52);
    if ((v9 & 1) == 0)
    {
LABEL_22:
      if ((v9 & 0x20) == 0)
        goto LABEL_23;
      goto LABEL_32;
    }
  }
  else if ((v9 & 1) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("pitch"));

  v9 = *(_BYTE *)(a1 + 52);
  if ((v9 & 0x20) == 0)
  {
LABEL_23:
    if ((v9 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_36;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("isAdvancedMap");
  else
    v19 = CFSTR("is_advanced_map");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v9 = *(_BYTE *)(a1 + 52);
  if ((v9 & 0x40) == 0)
  {
LABEL_24:
    if ((v9 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_40;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("isGlobeProjection");
  else
    v21 = CFSTR("is_globe_projection");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v9 = *(_BYTE *)(a1 + 52);
  if ((v9 & 0x10) == 0)
  {
LABEL_25:
    if ((v9 & 0x80) == 0)
      return v4;
    goto LABEL_47;
  }
LABEL_40:
  v22 = *(int *)(a1 + 44);
  if (v22 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_1E1C22CE8[v22];
  }
  if (a2)
    v24 = CFSTR("viewMode");
  else
    v24 = CFSTR("view_mode");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  if ((*(_BYTE *)(a1 + 52) & 0x80) != 0)
  {
LABEL_47:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 50));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("watchProximityRadiusOn");
    else
      v26 = CFSTR("watch_proximity_radius_on");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapView _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapView)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapView *)-[GEOLogMsgStateMapView _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOMapRegion *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;

  v5 = a2;
  if (!a1)
    goto LABEL_85;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_85;
  if (a3)
    v6 = CFSTR("mapRegion");
  else
    v6 = CFSTR("map_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOMapRegion initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOMapRegion initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setMapRegion:", v9);

  }
  if (a3)
    v11 = CFSTR("zoomLevel");
  else
    v11 = CFSTR("zoom_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(a1, "setZoomLevel:");
  }

  if (a3)
    v13 = CFSTR("mapType");
  else
    v13 = CFSTR("map_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
    {
      v16 = 3;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
    {
      v16 = 4;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_35;
    v16 = objc_msgSend(v14, "intValue");
  }
  objc_msgSend(a1, "setMapType:", v16);
LABEL_35:

  if (a3)
    v17 = CFSTR("styleZoomLevel");
  else
    v17 = CFSTR("style_zoom_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(a1, "setStyleZoomLevel:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pitch"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(a1, "setPitch:");
  }

  if (a3)
    v20 = CFSTR("isAdvancedMap");
  else
    v20 = CFSTR("is_advanced_map");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsAdvancedMap:", objc_msgSend(v21, "BOOLValue"));

  if (a3)
    v22 = CFSTR("isGlobeProjection");
  else
    v22 = CFSTR("is_globe_projection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsGlobeProjection:", objc_msgSend(v23, "BOOLValue"));

  if (a3)
    v24 = CFSTR("viewMode");
  else
    v24 = CFSTR("view_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
    {
      v27 = 0;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
    {
      v27 = 1;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
    {
      v27 = 2;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
    {
      v27 = 3;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")) & 1) != 0)
    {
      v27 = 4;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_TERRAIN")) & 1) != 0)
    {
      v27 = 5;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID_FLYOVER")) & 1) != 0)
    {
      v27 = 6;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE_FLYOVER")) & 1) != 0)
    {
      v27 = 7;
    }
    else if (objc_msgSend(v26, "isEqualToString:", CFSTR("MAP_TYPE_DRIVING")))
    {
      v27 = 8;
    }
    else
    {
      v27 = 0;
    }

    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = objc_msgSend(v25, "intValue");
LABEL_78:
    objc_msgSend(a1, "setViewMode:", v27);
  }

  if (a3)
    v28 = CFSTR("watchProximityRadiusOn");
  else
    v28 = CFSTR("watch_proximity_radius_on");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWatchProximityRadiusOn:", objc_msgSend(v29, "BOOLValue"));

LABEL_85:
  return a1;
}

- (GEOLogMsgStateMapView)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapView *)-[GEOLogMsgStateMapView _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapViewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapViewReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_mapRegion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x10) == 0)
      goto LABEL_10;
LABEL_18:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 0x80) == 0)
      goto LABEL_11;
LABEL_19:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_18;
LABEL_10:
  if (flags < 0)
    goto LABEL_19;
LABEL_11:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOMapRegion hasGreenTeaWithValue:](self->_mapRegion, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOLogMsgStateMapView readAll:](self, "readAll:", 0);
  if (self->_mapRegion)
    objc_msgSend(v5, "setMapRegion:");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_zoomLevel;
    *((_BYTE *)v5 + 52) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 10) = self->_mapType;
  *((_BYTE *)v5 + 52) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_styleZoomLevel;
  *((_BYTE *)v5 + 52) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_pitch;
  *((_BYTE *)v5 + 52) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)v5 + 48) = self->_isAdvancedMap;
  *((_BYTE *)v5 + 52) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x10) == 0)
      goto LABEL_10;
LABEL_18:
    *((_DWORD *)v5 + 11) = self->_viewMode;
    *((_BYTE *)v5 + 52) |= 0x10u;
    if ((*(_BYTE *)&self->_flags & 0x80) == 0)
      goto LABEL_11;
LABEL_19:
    *((_BYTE *)v5 + 50) = self->_watchProximityRadiusOn;
    *((_BYTE *)v5 + 52) |= 0x80u;
    goto LABEL_11;
  }
LABEL_17:
  *((_BYTE *)v5 + 49) = self->_isGlobeProjection;
  *((_BYTE *)v5 + 52) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_18;
LABEL_10:
  if (flags < 0)
    goto LABEL_19;
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(double *)(v5 + 32) = self->_zoomLevel;
    *(_BYTE *)(v5 + 52) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_mapType;
  *(_BYTE *)(v5 + 52) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(double *)(v5 + 24) = self->_styleZoomLevel;
  *(_BYTE *)(v5 + 52) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(double *)(v5 + 16) = self->_pitch;
  *(_BYTE *)(v5 + 52) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *(_BYTE *)(v5 + 48) = self->_isAdvancedMap;
  *(_BYTE *)(v5 + 52) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_8;
LABEL_16:
    *(_DWORD *)(v5 + 44) = self->_viewMode;
    *(_BYTE *)(v5 + 52) |= 0x10u;
    if ((*(_BYTE *)&self->_flags & 0x80) == 0)
      return (id)v5;
LABEL_17:
    *(_BYTE *)(v5 + 50) = self->_watchProximityRadiusOn;
    *(_BYTE *)(v5 + 52) |= 0x80u;
    return (id)v5;
  }
LABEL_15:
  *(_BYTE *)(v5 + 49) = self->_isGlobeProjection;
  *(_BYTE *)(v5 + 52) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_16;
LABEL_8:
  if (flags < 0)
    goto LABEL_17;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  GEOMapRegion *mapRegion;
  BOOL v6;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEOLogMsgStateMapView readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 1))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[52] & 4) == 0 || self->_zoomLevel != *((double *)v4 + 4))
      goto LABEL_47;
  }
  else if ((v4[52] & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v4[52] & 8) == 0 || self->_mapType != *((_DWORD *)v4 + 10))
      goto LABEL_47;
  }
  else if ((v4[52] & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[52] & 2) == 0 || self->_styleZoomLevel != *((double *)v4 + 3))
      goto LABEL_47;
  }
  else if ((v4[52] & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[52] & 1) == 0 || self->_pitch != *((double *)v4 + 2))
      goto LABEL_47;
  }
  else if ((v4[52] & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((v4[52] & 0x20) == 0)
      goto LABEL_47;
    if (self->_isAdvancedMap)
    {
      if (!v4[48])
        goto LABEL_47;
    }
    else if (v4[48])
    {
      goto LABEL_47;
    }
  }
  else if ((v4[52] & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((v4[52] & 0x40) == 0)
      goto LABEL_47;
    if (self->_isGlobeProjection)
    {
      if (!v4[49])
        goto LABEL_47;
    }
    else if (v4[49])
    {
      goto LABEL_47;
    }
  }
  else if ((v4[52] & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((v4[52] & 0x10) == 0 || self->_viewMode != *((_DWORD *)v4 + 11))
      goto LABEL_47;
  }
  else if ((v4[52] & 0x10) != 0)
  {
    goto LABEL_47;
  }
  v6 = v4[52] >= 0;
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    if (v4[52] < 0)
    {
      if (self->_watchProximityRadiusOn)
      {
        if (!v4[50])
          goto LABEL_47;
      }
      else if (v4[50])
      {
        goto LABEL_47;
      }
      v6 = 1;
      goto LABEL_48;
    }
LABEL_47:
    v6 = 0;
  }
LABEL_48:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char flags;
  unint64_t v5;
  double zoomLevel;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  double styleZoomLevel;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double pitch;
  double v18;
  long double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  -[GEOLogMsgStateMapView readAll:](self, "readAll:", 1);
  v3 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    zoomLevel = self->_zoomLevel;
    v7 = -zoomLevel;
    if (zoomLevel >= 0.0)
      v7 = self->_zoomLevel;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 8) != 0)
  {
    v10 = 2654435761 * self->_mapType;
    if ((flags & 2) != 0)
      goto LABEL_11;
LABEL_16:
    v15 = 0;
    goto LABEL_19;
  }
  v10 = 0;
  if ((flags & 2) == 0)
    goto LABEL_16;
LABEL_11:
  styleZoomLevel = self->_styleZoomLevel;
  v12 = -styleZoomLevel;
  if (styleZoomLevel >= 0.0)
    v12 = self->_styleZoomLevel;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_19:
  if ((flags & 1) != 0)
  {
    pitch = self->_pitch;
    v18 = -pitch;
    if (pitch >= 0.0)
      v18 = self->_pitch;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    v21 = 2654435761 * self->_isAdvancedMap;
    if ((flags & 0x40) != 0)
    {
LABEL_29:
      v22 = 2654435761 * self->_isGlobeProjection;
      if ((flags & 0x10) != 0)
        goto LABEL_30;
LABEL_34:
      v23 = 0;
      if (flags < 0)
        goto LABEL_31;
LABEL_35:
      v24 = 0;
      return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v24;
    }
  }
  else
  {
    v21 = 0;
    if ((flags & 0x40) != 0)
      goto LABEL_29;
  }
  v22 = 0;
  if ((flags & 0x10) == 0)
    goto LABEL_34;
LABEL_30:
  v23 = 2654435761 * self->_viewMode;
  if ((flags & 0x80) == 0)
    goto LABEL_35;
LABEL_31:
  v24 = 2654435761 * self->_watchProximityRadiusOn;
  return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  GEOMapRegion *mapRegion;
  uint64_t v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  mapRegion = self->_mapRegion;
  v5 = *((_QWORD *)v7 + 1);
  if (mapRegion)
  {
    if (v5)
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLogMsgStateMapView setMapRegion:](self, "setMapRegion:");
  }
  v6 = *((_BYTE *)v7 + 52);
  if ((v6 & 4) != 0)
  {
    self->_zoomLevel = *((double *)v7 + 4);
    *(_BYTE *)&self->_flags |= 4u;
    v6 = *((_BYTE *)v7 + 52);
    if ((v6 & 8) == 0)
    {
LABEL_8:
      if ((v6 & 2) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v7 + 52) & 8) == 0)
  {
    goto LABEL_8;
  }
  self->_mapType = *((_DWORD *)v7 + 10);
  *(_BYTE *)&self->_flags |= 8u;
  v6 = *((_BYTE *)v7 + 52);
  if ((v6 & 2) == 0)
  {
LABEL_9:
    if ((v6 & 1) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  self->_styleZoomLevel = *((double *)v7 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  v6 = *((_BYTE *)v7 + 52);
  if ((v6 & 1) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  self->_pitch = *((double *)v7 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v6 = *((_BYTE *)v7 + 52);
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  self->_isAdvancedMap = *((_BYTE *)v7 + 48);
  *(_BYTE *)&self->_flags |= 0x20u;
  v6 = *((_BYTE *)v7 + 52);
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x10) == 0)
      goto LABEL_13;
LABEL_21:
    self->_viewMode = *((_DWORD *)v7 + 11);
    *(_BYTE *)&self->_flags |= 0x10u;
    if ((*((_BYTE *)v7 + 52) & 0x80) == 0)
      goto LABEL_14;
LABEL_22:
    self->_watchProximityRadiusOn = *((_BYTE *)v7 + 50);
    *(_BYTE *)&self->_flags |= 0x80u;
    goto LABEL_14;
  }
LABEL_20:
  self->_isGlobeProjection = *((_BYTE *)v7 + 49);
  *(_BYTE *)&self->_flags |= 0x40u;
  v6 = *((_BYTE *)v7 + 52);
  if ((v6 & 0x10) != 0)
    goto LABEL_21;
LABEL_13:
  if (v6 < 0)
    goto LABEL_22;
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);
}

@end
