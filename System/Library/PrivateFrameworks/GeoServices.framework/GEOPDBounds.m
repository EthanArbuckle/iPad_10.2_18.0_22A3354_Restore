@implementation GEOPDBounds

void __55__GEOPDBounds_PlaceDataExtras__boundsInfoForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue bounds](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
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
  char flags;
  id v14;
  void *v15;
  PBUnknownFields *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDBoundsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBounds readAll:]((uint64_t)self, 0);
  v9 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOMapRegion copyWithZone:](self->_displayMapRegion, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 64) = self->_minZoom;
    *(_BYTE *)(v5 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(float *)(v5 + 60) = self->_maxZoom;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v14 = -[GEOPDViewportFrame copyWithZone:](self->_viewportFrame, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (id)mapRegion
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBounds _readMapRegion]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBoundsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

+ (id)boundsInfoForPlaceData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__36;
  v14 = __Block_byref_object_dispose__36;
  v4 = MEMORY[0x1E0C809B0];
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__GEOPDBounds_PlaceDataExtras__boundsInfoForPlaceData___block_invoke;
  v9[3] = &unk_1E1C09718;
  v9[4] = &v10;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 4, v9);
  v5 = (void *)v11[5];
  if (!v5)
  {
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __55__GEOPDBounds_PlaceDataExtras__boundsInfoForPlaceData___block_invoke_2;
    v8[3] = &unk_1E1C09718;
    v8[4] = &v10;
    objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 34, v8);
    v5 = (void *)v11[5];
  }
  v6 = v5;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  double v13;
  char v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  -[GEOPDBounds readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBounds mapRegion]((id *)a1);
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
  -[GEOPDBounds displayMapRegion]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("displayMapRegion");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("display_map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v14 = *(_BYTE *)(a1 + 68);
  if ((v14 & 2) != 0)
  {
    LODWORD(v13) = *(_DWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("minZoom");
    else
      v16 = CFSTR("min_zoom");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v14 = *(_BYTE *)(a1 + 68);
  }
  if ((v14 & 1) != 0)
  {
    LODWORD(v13) = *(_DWORD *)(a1 + 60);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("maxZoom");
    else
      v18 = CFSTR("max_zoom");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  -[GEOPDBounds viewportFrame]((id *)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("viewportFrame");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("viewport_frame");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __41__GEOPDBounds__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportFrame, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDBounds)init
{
  GEOPDBounds *v2;
  GEOPDBounds *v3;
  GEOPDBounds *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDBounds;
  v2 = -[GEOPDBounds init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDBoundsIsDirty((uint64_t)self) & 1) == 0)
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
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBounds readAll:]((uint64_t)self, 0);
    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    v5 = v9;
    if (self->_displayMapRegion)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteFloatField();
      v5 = v9;
    }
    if (self->_viewportFrame)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)viewportFrame
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBounds _readViewportFrame]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_655;
      else
        v6 = (int *)&readAll__nonRecursiveTag_656;
      GEOPDBoundsReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDBoundsCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)displayMapRegion
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBounds _readDisplayMapRegion]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBounds _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (void)_readViewportFrame
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBoundsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportFrame_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)_readDisplayMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBoundsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __55__GEOPDBounds_PlaceDataExtras__boundsInfoForPlaceData___block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  id *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[GEOPDComponentValue spatialLookupResult](a2);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSpatialLookupResult bounds](v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDBounds)initWithData:(id)a3
{
  GEOPDBounds *v3;
  GEOPDBounds *v4;
  GEOPDBounds *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDBounds;
  v3 = -[GEOPDBounds initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 0x10u;
  *(_BYTE *)(a1 + 68) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 8u;
  *(_BYTE *)(a1 + 68) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setViewportFrame:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  *(_BYTE *)(a1 + 68) |= 0x40u;
  objc_storeStrong((id *)(a1 + 40), a2);

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
  v8.super_class = (Class)GEOPDBounds;
  -[GEOPDBounds description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBounds dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDBounds _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOPDBounds__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  GEOMapRegion *v9;
  GEOMapRegion *v10;
  GEOMapRegion *v11;
  const __CFString *v12;
  void *v13;
  GEOMapRegion *v14;
  GEOMapRegion *v15;
  GEOMapRegion *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  GEOPDViewportFrame *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  GEOPDGeographicCoordinate *v29;
  GEOPDGeographicCoordinate *v30;
  GEOPDGeographicCoordinate *v31;
  void *v32;
  float v33;
  void *v34;
  float v35;
  void *v36;
  float v37;
  const __CFString *v38;
  void *v39;
  GEOPDBoundingCube *v40;
  id v41;
  void *v42;
  GEOPDGeographicCoordinate *v43;
  GEOPDGeographicCoordinate *v44;
  GEOPDGeographicCoordinate *v45;
  void *v46;
  GEOPDGeographicCoordinate *v47;
  GEOPDGeographicCoordinate *v48;
  GEOPDGeographicCoordinate *v49;
  void *v51;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("mapRegion");
    else
      v7 = CFSTR("map_region");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = [GEOMapRegion alloc];
      if ((a3 & 1) != 0)
        v10 = -[GEOMapRegion initWithJSON:](v9, "initWithJSON:", v8);
      else
        v10 = -[GEOMapRegion initWithDictionary:](v9, "initWithDictionary:", v8);
      v11 = v10;
      -[GEOPDBounds setMapRegion:](v6, v10);

    }
    if (a3)
      v12 = CFSTR("displayMapRegion");
    else
      v12 = CFSTR("display_map_region");
    objc_msgSend(v5, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = [GEOMapRegion alloc];
      if ((a3 & 1) != 0)
        v15 = -[GEOMapRegion initWithJSON:](v14, "initWithJSON:", v13);
      else
        v15 = -[GEOMapRegion initWithDictionary:](v14, "initWithDictionary:", v13);
      v16 = v15;
      -[GEOPDBounds setDisplayMapRegion:](v6, v15);

    }
    if (a3)
      v17 = CFSTR("minZoom");
    else
      v17 = CFSTR("min_zoom");
    objc_msgSend(v5, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "floatValue");
      *(_BYTE *)(v6 + 68) |= 0x40u;
      *(_BYTE *)(v6 + 68) |= 2u;
      *(_DWORD *)(v6 + 64) = v19;
    }

    if (a3)
      v20 = CFSTR("maxZoom");
    else
      v20 = CFSTR("max_zoom");
    objc_msgSend(v5, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "floatValue");
      *(_BYTE *)(v6 + 68) |= 0x40u;
      *(_BYTE *)(v6 + 68) |= 1u;
      *(_DWORD *)(v6 + 60) = v22;
    }

    if (a3)
      v23 = CFSTR("viewportFrame");
    else
      v23 = CFSTR("viewport_frame");
    objc_msgSend(v5, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = [GEOPDViewportFrame alloc];
      if (v25)
      {
        v26 = v24;
        v25 = -[GEOPDViewportFrame init](v25, "init");
        if (v25)
        {
          if (a3)
            v27 = CFSTR("targetPoint");
          else
            v27 = CFSTR("target_point");
          objc_msgSend(v26, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = [GEOPDGeographicCoordinate alloc];
            if ((a3 & 1) != 0)
              v30 = -[GEOPDGeographicCoordinate initWithJSON:](v29, "initWithJSON:", v28);
            else
              v30 = -[GEOPDGeographicCoordinate initWithDictionary:](v29, "initWithDictionary:", v28);
            v31 = v30;
            -[GEOPDViewportFrame setTargetPoint:]((uint64_t)v25, v30);

          }
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("heading"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v32, "floatValue");
            *(_BYTE *)&v25->_flags |= 0x40u;
            *(_BYTE *)&v25->_flags |= 2u;
            v25->_heading = v33;
          }

          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("pitch"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v34, "floatValue");
            *(_BYTE *)&v25->_flags |= 0x40u;
            *(_BYTE *)&v25->_flags |= 4u;
            v25->_pitch = v35;
          }

          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("distance"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v36, "floatValue");
            *(_BYTE *)&v25->_flags |= 0x40u;
            *(_BYTE *)&v25->_flags |= 1u;
            v25->_distance = v37;
          }

          if (a3)
            v38 = CFSTR("viewTargetBounds");
          else
            v38 = CFSTR("view_target_bounds");
          objc_msgSend(v26, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v40 = [GEOPDBoundingCube alloc];
            if (v40)
            {
              v41 = v39;
              v40 = -[GEOPDBoundingCube init](v40, "init");
              if (v40)
              {
                v51 = v41;
                objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("min"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v43 = [GEOPDGeographicCoordinate alloc];
                  if ((a3 & 1) != 0)
                    v44 = -[GEOPDGeographicCoordinate initWithJSON:](v43, "initWithJSON:", v42);
                  else
                    v44 = -[GEOPDGeographicCoordinate initWithDictionary:](v43, "initWithDictionary:", v42);
                  v45 = v44;
                  -[GEOPDBoundingCube setMin:]((uint64_t)v40, v44);

                }
                objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("max"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v47 = [GEOPDGeographicCoordinate alloc];
                  if ((a3 & 1) != 0)
                    v48 = -[GEOPDGeographicCoordinate initWithJSON:](v47, "initWithJSON:", v46);
                  else
                    v48 = -[GEOPDGeographicCoordinate initWithDictionary:](v47, "initWithDictionary:", v46);
                  v49 = v48;
                  -[GEOPDBoundingCube setMax:]((uint64_t)v40, v48);

                }
                v41 = v51;
              }

            }
            -[GEOPDViewportFrame setViewTargetBounds:]((uint64_t)v25, v40);

          }
        }

      }
      -[GEOPDBounds setViewportFrame:](v6, v25);

    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBoundsReadAllFrom((uint64_t)self, a3, 0);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDBounds _readDisplayMapRegion](result);
    if ((objc_msgSend(*(id *)(v3 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDBounds _readMapRegion](v3);
      return objc_msgSend(*(id *)(v3 + 32), "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *mapRegion;
  GEOMapRegion *displayMapRegion;
  GEOPDViewportFrame *viewportFrame;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOPDBounds readAll:]((uint64_t)self, 1);
  -[GEOPDBounds readAll:]((uint64_t)v4, 1);
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_18;
  }
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_minZoom != *((float *)v4 + 16))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_maxZoom != *((float *)v4 + 15))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_18;
  }
  viewportFrame = self->_viewportFrame;
  if ((unint64_t)viewportFrame | *((_QWORD *)v4 + 5))
    v8 = -[GEOPDViewportFrame isEqual:](viewportFrame, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  char flags;
  unint64_t v6;
  float minZoom;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  float maxZoom;
  double v13;
  long double v14;
  double v15;

  -[GEOPDBounds readAll:]((uint64_t)self, 1);
  v3 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v4 = -[GEOMapRegion hash](self->_displayMapRegion, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    minZoom = self->_minZoom;
    v8 = minZoom;
    if (minZoom < 0.0)
      v8 = -minZoom;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((flags & 1) != 0)
  {
    maxZoom = self->_maxZoom;
    v13 = maxZoom;
    if (maxZoom < 0.0)
      v13 = -maxZoom;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ -[GEOPDViewportFrame hash](self->_viewportFrame, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 4u;
    *(_BYTE *)(a1 + 68) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDBounds readAll:](a1, 0);
    objc_msgSend(*(id *)(a1 + 32), "clearUnknownFields:", 1);
    objc_msgSend(*(id *)(a1 + 24), "clearUnknownFields:", 1);
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v3 + 64) |= 8u;
      *(_BYTE *)(v3 + 64) |= 0x40u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 48));
      v4 = *(void **)(v3 + 16);
      *(_QWORD *)(v3 + 16) = 0;

      -[GEOPDViewportFrame readAll:](v3, 0);
      v5 = *(_QWORD *)(v3 + 32);
      if (v5)
      {
        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v5 + 52) |= 1u;
        *(_BYTE *)(v5 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 48));
        v6 = *(void **)(v5 + 16);
        *(_QWORD *)(v5 + 16) = 0;

        -[GEOPDBoundingCube readAll:](v5, 0);
      }
    }
  }
}

@end
