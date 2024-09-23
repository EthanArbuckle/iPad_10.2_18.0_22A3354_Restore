@implementation GEOPDGeographicCoordinate

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 32);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("latitude"));

    v3 = *(_BYTE *)(a1 + 32);
    if ((v3 & 4) == 0)
    {
LABEL_4:
      if ((v3 & 1) == 0)
        return v2;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)(a1 + 32) & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("longitude"));

  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("altitude"));

  }
  return v2;
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

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAltitude
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
  v8.super_class = (Class)GEOPDGeographicCoordinate;
  -[GEOPDGeographicCoordinate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGeographicCoordinate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOPDGeographicCoordinate)initWithDictionary:(id)a3
{
  return (GEOPDGeographicCoordinate *)-[GEOPDGeographicCoordinate _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("latitude"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "doubleValue");
        objc_msgSend(a1, "setLatitude:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("longitude"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "doubleValue");
        objc_msgSend(a1, "setLongitude:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("altitude"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setAltitude:");
      }

    }
  }

  return a1;
}

- (GEOPDGeographicCoordinate)initWithJSON:(id)a3
{
  return (GEOPDGeographicCoordinate *)-[GEOPDGeographicCoordinate _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDGeographicCoordinateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGeographicCoordinateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOPDGeographicCoordinate readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v5[3] = *(_QWORD *)&self->_longitude;
    *((_BYTE *)v5 + 32) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[2] = *(_QWORD *)&self->_latitude;
  *((_BYTE *)v5 + 32) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    v5[1] = *(_QWORD *)&self->_altitude;
    *((_BYTE *)v5 + 32) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_latitude;
    *((_BYTE *)result + 32) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_longitude;
  *((_BYTE *)result + 32) |= 4u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_altitude;
  *((_BYTE *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDGeographicCoordinate readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_latitude != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_longitude != *((double *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_altitude != *((double *)v4 + 1))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double latitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double longitude;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double altitude;
  double v16;
  long double v17;
  double v18;

  -[GEOPDGeographicCoordinate readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    latitude = self->_latitude;
    v6 = -latitude;
    if (latitude >= 0.0)
      v6 = self->_latitude;
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
  if ((flags & 4) != 0)
  {
    longitude = self->_longitude;
    v11 = -longitude;
    if (longitude >= 0.0)
      v11 = self->_longitude;
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
  if ((flags & 1) != 0)
  {
    altitude = self->_altitude;
    v16 = -altitude;
    if (altitude >= 0.0)
      v16 = self->_altitude;
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
  return v9 ^ v4 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  double *v5;

  v5 = (double *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 2) == 0)
  {
    if (((_BYTE)v5[4] & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_longitude = v5[3];
    *(_BYTE *)&self->_flags |= 4u;
    if (((_BYTE)v5[4] & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_latitude = v5[2];
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 1) != 0)
  {
LABEL_4:
    self->_altitude = v5[1];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:

}

@end
