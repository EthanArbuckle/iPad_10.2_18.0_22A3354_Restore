@implementation GEOVLFLocation

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (GEOECEFCoordinate)ecefLocation
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_has;
  *(_OWORD *)&retstr->_x = *(_OWORD *)&self->_y;
  *(_OWORD *)&retstr->_z = v3;
  return self;
}

- (void)setEcefLocation:(GEOECEFCoordinate *)a3
{
  __int128 v3;

  *(_BYTE *)&self->_flags |= 1u;
  v3 = *(_OWORD *)&a3->_z;
  *(_OWORD *)&self->_ecefLocation._x = *(_OWORD *)&a3->_x;
  *(_OWORD *)&self->_ecefLocation._z = v3;
}

- (void)setHasEcefLocation:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEcefLocation
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_heading = a3;
}

- (void)setHasHeading:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeading
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E1C23A98[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GPS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IP_ADDRESS")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)isFused
{
  return self->_isFused;
}

- (void)setIsFused:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_isFused = a3;
}

- (void)setHasIsFused:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsFused
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
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
  v8.super_class = (Class)GEOVLFLocation;
  -[GEOVLFLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("location"));

  }
  v8 = *(_BYTE *)(a1 + 80);
  if ((v8 & 1) != 0)
  {
    _GEOECEFCoordinateDictionaryRepresentation(a1 + 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("ecefLocation"));

    v8 = *(_BYTE *)(a1 + 80);
  }
  if ((v8 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("horizontalAccuracy"));

    v8 = *(_BYTE *)(a1 + 80);
    if ((v8 & 8) == 0)
    {
LABEL_11:
      if ((v8 & 2) == 0)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  else if ((v8 & 8) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("verticalAccuracy"));

  v8 = *(_BYTE *)(a1 + 80);
  if ((v8 & 2) == 0)
  {
LABEL_12:
    if ((v8 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("heading"));

  v8 = *(_BYTE *)(a1 + 80);
  if ((v8 & 0x10) == 0)
  {
LABEL_13:
    if ((v8 & 0x20) == 0)
      return v4;
    goto LABEL_22;
  }
LABEL_18:
  v13 = *(_DWORD *)(a1 + 72) - 1;
  if (v13 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 72));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E1C23A98[v13];
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("type"));

  if ((*(_BYTE *)(a1 + 80) & 0x20) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("isFused");
    else
      v16 = CFSTR("is_fused");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFLocation)initWithDictionary:(id)a3
{
  return (GEOVLFLocation *)-[GEOVLFLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;

  v5 = a2;
  if (!a1)
    goto LABEL_36;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_36;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEOLatLng initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEOLatLng initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setLocation:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ecefLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    _GEOECEFCoordinateFromDictionaryRepresentation(v10, (uint64_t)&v21);
    v20[0] = v21;
    v20[1] = v22;
    objc_msgSend(a1, "setEcefLocation:", v20);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(a1, "setHorizontalAccuracy:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("verticalAccuracy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(a1, "setVerticalAccuracy:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("heading"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(a1, "setHeading:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("GPS")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WIFI")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CELL")) & 1) != 0)
    {
      v16 = 3;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("IP_ADDRESS")))
    {
      v16 = 4;
    }
    else
    {
      v16 = 1;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_29:
    objc_msgSend(a1, "setType:", v16);
  }

  if (a3)
    v17 = CFSTR("isFused");
  else
    v17 = CFSTR("is_fused");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsFused:", objc_msgSend(v18, "BOOLValue"));

LABEL_36:
  return a1;
}

- (GEOVLFLocation)initWithJSON:(id)a3
{
  return (GEOVLFLocation *)-[GEOVLFLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFLocationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;

  v4 = a3;
  if (self->_location)
    PBDataWriterWriteSubmessage();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterPlaceMark();
    GEOECEFCoordinateWriteTo((uint64_t)&self->_ecefLocation);
    PBDataWriterRecallMark();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_8;
LABEL_15:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_15;
LABEL_8:
  if ((flags & 0x20) != 0)
LABEL_9:
    PBDataWriterWriteBOOLField();
LABEL_10:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  char flags;
  __int128 v5;
  char *v6;

  v6 = (char *)a3;
  -[GEOVLFLocation readAll:](self, "readAll:", 0);
  if (self->_location)
    objc_msgSend(v6, "setLocation:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5 = *(_OWORD *)&self->_ecefLocation._z;
    *(_OWORD *)(v6 + 8) = *(_OWORD *)&self->_ecefLocation._x;
    *(_OWORD *)(v6 + 24) = v5;
    v6[80] |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v6 + 6) = *(_QWORD *)&self->_horizontalAccuracy;
  v6[80] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)v6 + 8) = *(_QWORD *)&self->_verticalAccuracy;
  v6[80] |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_8;
LABEL_15:
    *((_DWORD *)v6 + 18) = self->_type;
    v6[80] |= 0x10u;
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  *((_QWORD *)v6 + 5) = *(_QWORD *)&self->_heading;
  v6[80] |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_15;
LABEL_8:
  if ((flags & 0x20) != 0)
  {
LABEL_9:
    v6[76] = self->_isFused;
    v6[80] |= 0x20u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;
  __int128 v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v10 = *(_OWORD *)&self->_ecefLocation._z;
    *(_OWORD *)(v5 + 8) = *(_OWORD *)&self->_ecefLocation._x;
    *(_OWORD *)(v5 + 24) = v10;
    *(_BYTE *)(v5 + 80) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_horizontalAccuracy;
  *(_BYTE *)(v5 + 80) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(double *)(v5 + 64) = self->_verticalAccuracy;
  *(_BYTE *)(v5 + 80) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    *(_DWORD *)(v5 + 72) = self->_type;
    *(_BYTE *)(v5 + 80) |= 0x10u;
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      return (id)v5;
    goto LABEL_7;
  }
LABEL_12:
  *(double *)(v5 + 40) = self->_heading;
  *(_BYTE *)(v5 + 80) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 0x20) != 0)
  {
LABEL_7:
    *(_BYTE *)(v5 + 76) = self->_isFused;
    *(_BYTE *)(v5 + 80) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *location;
  BOOL v6;
  BOOL v7;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[GEOVLFLocation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
      goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0)
      goto LABEL_41;
    v6 = *(_QWORD *)&self->_ecefLocation._x == *((_QWORD *)v4 + 1)
      && *(_QWORD *)&self->_ecefLocation._y == *((_QWORD *)v4 + 2);
    v7 = v6 && *(_QWORD *)&self->_ecefLocation._z == *((_QWORD *)v4 + 3);
    if (!v7 || *(_QWORD *)&self->_ecefLocation._has != *((_QWORD *)v4 + 4))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_horizontalAccuracy != *((double *)v4 + 6))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_verticalAccuracy != *((double *)v4 + 8))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_heading != *((double *)v4 + 5))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 18))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  v9 = (*((_BYTE *)v4 + 80) & 0x20) == 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x20) == 0)
    {
LABEL_41:
      v9 = 0;
      goto LABEL_42;
    }
    if (self->_isFused)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_41;
    }
    v9 = 1;
  }
LABEL_42:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  char flags;
  uint64_t v5;
  unint64_t v6;
  double horizontalAccuracy;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double verticalAccuracy;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double heading;
  double v18;
  long double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;

  -[GEOVLFLocation readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_location, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5 = PBHashBytes();
    flags = (char)self->_flags;
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 4) != 0)
  {
    horizontalAccuracy = self->_horizontalAccuracy;
    v8 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0)
      v8 = self->_horizontalAccuracy;
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
  if ((flags & 8) != 0)
  {
    verticalAccuracy = self->_verticalAccuracy;
    v13 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0)
      v13 = self->_verticalAccuracy;
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
  if ((flags & 2) != 0)
  {
    heading = self->_heading;
    v18 = -heading;
    if (heading >= 0.0)
      v18 = self->_heading;
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
  if ((flags & 0x10) != 0)
  {
    v21 = 2654435761 * self->_type;
    if ((flags & 0x20) != 0)
      goto LABEL_30;
LABEL_32:
    v22 = 0;
    return v5 ^ v3 ^ v6 ^ v11 ^ v16 ^ v21 ^ v22;
  }
  v21 = 0;
  if ((flags & 0x20) == 0)
    goto LABEL_32;
LABEL_30:
  v22 = 2654435761 * self->_isFused;
  return v5 ^ v3 ^ v6 ^ v11 ^ v16 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *location;
  uint64_t v5;
  char v6;
  __int128 v7;
  char *v8;

  v8 = (char *)a3;
  objc_msgSend(v8, "readAll:", 0);
  location = self->_location;
  v5 = *((_QWORD *)v8 + 7);
  if (location)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOVLFLocation setLocation:](self, "setLocation:");
  }
  v6 = v8[80];
  if ((v6 & 1) != 0)
  {
    v7 = *(_OWORD *)(v8 + 24);
    *(_OWORD *)&self->_ecefLocation._x = *(_OWORD *)(v8 + 8);
    *(_OWORD *)&self->_ecefLocation._z = v7;
    *(_BYTE *)&self->_flags |= 1u;
    v6 = v8[80];
    if ((v6 & 4) == 0)
    {
LABEL_8:
      if ((v6 & 8) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else if ((v8[80] & 4) == 0)
  {
    goto LABEL_8;
  }
  self->_horizontalAccuracy = *((double *)v8 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  v6 = v8[80];
  if ((v6 & 8) == 0)
  {
LABEL_9:
    if ((v6 & 2) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  self->_verticalAccuracy = *((double *)v8 + 8);
  *(_BYTE *)&self->_flags |= 8u;
  v6 = v8[80];
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0)
      goto LABEL_11;
LABEL_18:
    self->_type = *((_DWORD *)v8 + 18);
    *(_BYTE *)&self->_flags |= 0x10u;
    if ((v8[80] & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_17:
  self->_heading = *((double *)v8 + 5);
  *(_BYTE *)&self->_flags |= 2u;
  v6 = v8[80];
  if ((v6 & 0x10) != 0)
    goto LABEL_18;
LABEL_11:
  if ((v6 & 0x20) != 0)
  {
LABEL_12:
    self->_isFused = v8[76];
    *(_BYTE *)&self->_flags |= 0x20u;
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
