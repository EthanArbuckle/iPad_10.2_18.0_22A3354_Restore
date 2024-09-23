@implementation GEOPDViewportInfo

+ (id)viewportInfoForTraits:(id)a3
{
  id v3;
  GEOPDViewportInfo *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasMapRegion"))
    v4 = -[GEOPDViewportInfo initWithTraits:]([GEOPDViewportInfo alloc], "initWithTraits:", v3);
  else
    v4 = 0;

  return v4;
}

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

- (unsigned)timeSinceMapViewportChanged
{
  return self->_timeSinceMapViewportChanged;
}

- (void)setTimeSinceMapViewportChanged:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_timeSinceMapViewportChanged = a3;
}

- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimeSinceMapViewportChanged
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)mapType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_mapType;
  else
    return 0;
}

- (void)setMapType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMapType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C05200[a3];
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDViewportInfo;
  -[GEOPDViewportInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDViewportInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDViewportInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
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
  v9 = *(_BYTE *)(a1 + 32);
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("timeSinceMapViewportChanged");
    else
      v11 = CFSTR("time_since_map_viewport_changed");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_BYTE *)(a1 + 32);
  }
  if ((v9 & 1) != 0)
  {
    v12 = *(int *)(a1 + 24);
    if (v12 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C05200[v12];
    }
    if (a2)
      v14 = CFSTR("mapType");
    else
      v14 = CFSTR("map_type");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(void **)(a1 + 8);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __47__GEOPDViewportInfo__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDViewportInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDViewportInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDViewportInfo)initWithDictionary:(id)a3
{
  return (GEOPDViewportInfo *)-[GEOPDViewportInfo _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
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
        v11 = CFSTR("timeSinceMapViewportChanged");
      else
        v11 = CFSTR("time_since_map_viewport_changed");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTimeSinceMapViewportChanged:", objc_msgSend(v12, "unsignedIntValue"));

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
        {
LABEL_35:

          goto LABEL_36;
        }
        v16 = objc_msgSend(v14, "intValue");
      }
      objc_msgSend(a1, "setMapType:", v16);
      goto LABEL_35;
    }
  }
LABEL_36:

  return a1;
}

- (GEOPDViewportInfo)initWithJSON:(id)a3
{
  return (GEOPDViewportInfo *)-[GEOPDViewportInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDViewportInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDViewportInfoReadAllFrom((uint64_t)self, a3);
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
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

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
  -[GEOPDViewportInfo readAll:](self, "readAll:", 0);
  if (self->_mapRegion)
    objc_msgSend(v5, "setMapRegion:");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_timeSinceMapViewportChanged;
    *((_BYTE *)v5 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_mapType;
    *((_BYTE *)v5 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_timeSinceMapViewportChanged;
    *(_BYTE *)(v5 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_mapType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *mapRegion;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOPDViewportInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_timeSinceMapViewportChanged != *((_DWORD *)v4 + 7))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_mapType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOPDViewportInfo readAll:](self, "readAll:", 1);
  v3 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_timeSinceMapViewportChanged;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_mapType;
  return v4 ^ v3 ^ v5;
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
  v5 = *((_QWORD *)v7 + 2);
  if (mapRegion)
  {
    if (v5)
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPDViewportInfo setMapRegion:](self, "setMapRegion:");
  }
  v6 = *((_BYTE *)v7 + 32);
  if ((v6 & 2) != 0)
  {
    self->_timeSinceMapViewportChanged = *((_DWORD *)v7 + 7);
    *(_BYTE *)&self->_flags |= 2u;
    v6 = *((_BYTE *)v7 + 32);
  }
  if ((v6 & 1) != 0)
  {
    self->_mapType = *((_DWORD *)v7 + 6);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDViewportInfo readAll:](self, "readAll:", 0);
    -[GEOMapRegion clearUnknownFields:](self->_mapRegion, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOPDViewportInfo)initWithTraits:(id)a3
{
  id v4;
  GEOPDViewportInfo *v5;
  uint64_t v6;
  void *v7;
  GEOPDViewportInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPDViewportInfo;
  v5 = -[GEOPDViewportInfo init](&v10, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hasMode"))
    {
      v6 = objc_msgSend(v4, "mode");
      if (v6 <= 4)
        -[GEOPDViewportInfo setMapType:](v5, "setMapType:", v6);
    }
    if (objc_msgSend(v4, "hasMapRegion"))
    {
      objc_msgSend(v4, "mapRegion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDViewportInfo setMapRegion:](v5, "setMapRegion:", v7);

    }
    if (objc_msgSend(v4, "hasTimeSinceMapViewportChanged"))
      -[GEOPDViewportInfo setTimeSinceMapViewportChanged:](v5, "setTimeSinceMapViewportChanged:", objc_msgSend(v4, "timeSinceMapViewportChanged"));
    v8 = v5;
  }

  return v5;
}

@end
