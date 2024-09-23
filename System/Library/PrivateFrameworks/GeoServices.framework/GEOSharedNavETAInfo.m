@implementation GEOSharedNavETAInfo

- (double)remainingDistance
{
  return self->_remainingDistance;
}

- (void)setRemainingDistance:(double)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_remainingDistance = a3;
}

- (void)setHasRemainingDistance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasRemainingDistance
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_remainingTime = a3;
}

- (void)setHasRemainingTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasRemainingTime
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLatitude
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)etaTimestamp
{
  return self->_etaTimestamp;
}

- (void)setEtaTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_etaTimestamp = a3;
}

- (void)setHasEtaTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEtaTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)waypointIndex
{
  return self->_waypointIndex;
}

- (void)setWaypointIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_waypointIndex = a3;
}

- (void)setHasWaypointIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasWaypointIndex
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
  v8.super_class = (Class)GEOSharedNavETAInfo;
  -[GEOSharedNavETAInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSharedNavETAInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavETAInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("remainingDistance");
    else
      v16 = CFSTR("remaining_distance");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 60);
    if ((v5 & 0x10) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("remainingTime");
  else
    v18 = CFSTR("remaining_time");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("latitude"));

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("etaTimestamp");
    else
      v22 = CFSTR("eta_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    if ((*(_BYTE *)(a1 + 60) & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_8;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("longitude"));

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 1) != 0)
    goto LABEL_28;
LABEL_7:
  if ((v5 & 0x20) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("waypointIndex");
    else
      v7 = CFSTR("waypoint_index");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_12:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __49__GEOSharedNavETAInfo__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v12 = v11;
      v24 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v23);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavETAInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOSharedNavETAInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavETAInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavETAInfo *)-[GEOSharedNavETAInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("remainingDistance");
      else
        v6 = CFSTR("remaining_distance");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setRemainingDistance:");
      }

      if (a3)
        v8 = CFSTR("remainingTime");
      else
        v8 = CFSTR("remaining_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setRemainingTime:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latitude"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(a1, "setLatitude:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("longitude"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setLongitude:");
      }

      if (a3)
        v12 = CFSTR("etaTimestamp");
      else
        v12 = CFSTR("eta_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setEtaTimestamp:");
      }

      if (a3)
        v14 = CFSTR("waypointIndex");
      else
        v14 = CFSTR("waypoint_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setWaypointIndex:", objc_msgSend(v15, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOSharedNavETAInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavETAInfo *)-[GEOSharedNavETAInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavETAInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavETAInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOSharedNavETAInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[5] = *(_QWORD *)&self->_remainingDistance;
    *((_BYTE *)v5 + 60) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[6] = *(_QWORD *)&self->_remainingTime;
  *((_BYTE *)v5 + 60) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5[3] = *(_QWORD *)&self->_latitude;
  *((_BYTE *)v5 + 60) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
LABEL_13:
    v5[2] = *(_QWORD *)&self->_etaTimestamp;
    *((_BYTE *)v5 + 60) |= 1u;
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  v5[4] = *(_QWORD *)&self->_longitude;
  *((_BYTE *)v5 + 60) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 14) = self->_waypointIndex;
    *((_BYTE *)v5 + 60) |= 0x20u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(double *)(v4 + 40) = self->_remainingDistance;
    *(_BYTE *)(v4 + 60) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 48) = self->_remainingTime;
  *(_BYTE *)(v4 + 60) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(double *)(v4 + 24) = self->_latitude;
  *(_BYTE *)(v4 + 60) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
LABEL_13:
    *(double *)(v4 + 16) = self->_etaTimestamp;
    *(_BYTE *)(v4 + 60) |= 1u;
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *(double *)(v4 + 32) = self->_longitude;
  *(_BYTE *)(v4 + 60) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 0x20) != 0)
  {
LABEL_7:
    *(_DWORD *)(v4 + 56) = self->_waypointIndex;
    *(_BYTE *)(v4 + 60) |= 0x20u;
  }
LABEL_8:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[GEOSharedNavETAInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_remainingDistance != *((double *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_remainingTime != *((double *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_latitude != *((double *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_longitude != *((double *)v4 + 4))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_etaTimestamp != *((double *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 60) & 0x20) == 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) == 0 || self->_waypointIndex != *((_DWORD *)v4 + 14))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double remainingDistance;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double remainingTime;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double latitude;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double longitude;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double etaTimestamp;
  double v26;
  long double v27;
  double v28;
  uint64_t v29;

  -[GEOSharedNavETAInfo readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    remainingDistance = self->_remainingDistance;
    v6 = -remainingDistance;
    if (remainingDistance >= 0.0)
      v6 = self->_remainingDistance;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    remainingTime = self->_remainingTime;
    v11 = -remainingTime;
    if (remainingTime >= 0.0)
      v11 = self->_remainingTime;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((flags & 2) != 0)
  {
    latitude = self->_latitude;
    v16 = -latitude;
    if (latitude >= 0.0)
      v16 = self->_latitude;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 4) != 0)
  {
    longitude = self->_longitude;
    v21 = -longitude;
    if (longitude >= 0.0)
      v21 = self->_longitude;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((flags & 1) != 0)
  {
    etaTimestamp = self->_etaTimestamp;
    v26 = -etaTimestamp;
    if (etaTimestamp >= 0.0)
      v26 = self->_etaTimestamp;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((flags & 0x20) != 0)
    v29 = 2654435761 * self->_waypointIndex;
  else
    v29 = 0;
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 60);
  if ((v4 & 8) != 0)
  {
    self->_remainingDistance = *((double *)v5 + 5);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 60);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v5 + 60) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_remainingTime = *((double *)v5 + 6);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 60);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_latitude = *((double *)v5 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 60);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0)
      goto LABEL_6;
LABEL_13:
    self->_etaTimestamp = *((double *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v5 + 60) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_longitude = *((double *)v5 + 4);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 60);
  if ((v4 & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 0x20) != 0)
  {
LABEL_7:
    self->_waypointIndex = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_flags |= 0x20u;
  }
LABEL_8:

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
    -[GEOSharedNavETAInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
