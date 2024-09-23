@implementation GEOLatLng

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOLatLng lat](self, "lat");
  v4 = v3;
  -[GEOLatLng lng](self, "lng");
  v6 = v5;
  v7 = v4;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (double)lng
{
  return self->_lng;
}

- (double)lat
{
  return self->_lat;
}

- (void)setGtLog:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_gtLog = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  *(double *)(v4 + 24) = self->_lat;
  *(double *)(v4 + 32) = self->_lng;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v4 + 16) = self->_elevationM;
    *(_BYTE *)(v4 + 44) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v4 + 40) = self->_gtLog;
    *(_BYTE *)(v4 + 44) |= 2u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (id)dictionaryRepresentation
{
  return -[GEOLatLng _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("lat"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("lng"));

  v7 = *(_BYTE *)(a1 + 44);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("elevationM");
    else
      v9 = CFSTR("elevation_m");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 44);
  }
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("gtLog"));

  }
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __39__GEOLatLng__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (GEOLatLng)initWithLatitude:(double)a3 longitude:(double)a4
{
  GEOLatLng *v6;
  GEOLatLng *v7;
  GEOLatLng *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOLatLng;
  v6 = -[GEOLatLng init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GEOLatLng setLat:](v6, "setLat:", a3);
    -[GEOLatLng setLng:](v7, "setLng:", a4);
    v8 = v7;
  }

  return v7;
}

- (void)setLat:(double)a3
{
  self->_lat = a3;
}

- (void)setLng:(double)a3
{
  self->_lng = a3;
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (double)elevationM
{
  return self->_elevationM;
}

- (void)setElevationM:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_elevationM = a3;
}

- (void)setHasElevationM:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasElevationM
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOLatLng;
  -[GEOLatLng description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLatLng dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOLatLng _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __39__GEOLatLng__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLatLng)initWithDictionary:(id)a3
{
  return (GEOLatLng *)-[GEOLatLng _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lat"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setLat:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lng"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setLng:");
      }

      if (a3)
        v8 = CFSTR("elevationM");
      else
        v8 = CFSTR("elevation_m");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setElevationM:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gtLog"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setGtLog:", objc_msgSend(v10, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLatLng)initWithJSON:(id)a3
{
  return (GEOLatLng *)-[GEOLatLng _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLatLngIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLatLngReadAllFrom((uint64_t)self, a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return (*(_BYTE *)&self->_flags & 2) != 0 && self->_gtLog == a3;
}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOLatLng readAll:](self, "readAll:", 0);
  v5[3] = *(_QWORD *)&self->_lat;
  v5[4] = *(_QWORD *)&self->_lng;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[2] = *(_QWORD *)&self->_elevationM;
    *((_BYTE *)v5 + 44) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v5 + 40) = self->_gtLog;
    *((_BYTE *)v5 + 44) |= 2u;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOLatLng readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (self->_lat != *((double *)v4 + 3) || self->_lng != *((double *)v4 + 4))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_elevationM != *((double *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_11;
  }
  v5 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
    {
LABEL_11:
      v5 = 0;
      goto LABEL_12;
    }
    if (self->_gtLog)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_11;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_11;
    }
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  double lat;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double lng;
  double v13;
  long double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char flags;
  unint64_t v22;
  double elevationM;
  double v24;
  long double v25;
  double v26;
  uint64_t v27;

  -[GEOLatLng readAll:](self, "readAll:", 1);
  lat = self->_lat;
  v4 = -lat;
  if (lat >= 0.0)
    v4 = self->_lat;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  lng = self->_lng;
  v13 = -lng;
  if (lng >= 0.0)
    v13 = self->_lng;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = fmod(v14, 1.84467441e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    elevationM = self->_elevationM;
    v24 = -elevationM;
    if (elevationM >= 0.0)
      v24 = self->_elevationM;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
      if ((flags & 2) == 0)
        goto LABEL_26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
      if ((flags & 2) == 0)
      {
LABEL_26:
        v27 = 0;
        return v20 ^ v11 ^ v22 ^ v27;
      }
    }
  }
  else
  {
    v22 = 0;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_26;
  }
  v27 = 2654435761 * self->_gtLog;
  return v20 ^ v11 ^ v22 ^ v27;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  self->_lat = *((double *)v5 + 3);
  self->_lng = *((double *)v5 + 4);
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 1) != 0)
  {
    self->_elevationM = *((double *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 44);
  }
  if ((v4 & 2) != 0)
  {
    self->_gtLog = *((_BYTE *)v5 + 40);
    *(_BYTE *)&self->_flags |= 2u;
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
    -[GEOLatLng readAll:](self, "readAll:", 0);
}

- (BOOL)gtLog
{
  return self->_gtLog;
}

- (void)setHasGtLog:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGtLog
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

@end
