@implementation GEOLogMsgEventParkedCar

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

- (double)locationUncertainty
{
  return self->_locationUncertainty;
}

- (void)setLocationUncertainty:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_locationUncertainty = a3;
}

- (void)setHasLocationUncertainty:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLocationUncertainty
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOLogMsgEventParkedCar;
  -[GEOLogMsgEventParkedCar description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventParkedCar dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventParkedCar _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  if (a1)
  {
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
    v8 = *(_BYTE *)(a1 + 32);
    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("locationUncertainty");
      else
        v10 = CFSTR("location_uncertainty");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

      v8 = *(_BYTE *)(a1 + 32);
    }
    if ((v8 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timestamp"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventParkedCar _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventParkedCar)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventParkedCar *)-[GEOLogMsgEventParkedCar _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
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
      if (a3)
        v10 = CFSTR("locationUncertainty");
      else
        v10 = CFSTR("location_uncertainty");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setLocationUncertainty:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

    }
  }

  return a1;
}

- (GEOLogMsgEventParkedCar)initWithJSON:(id)a3
{
  return (GEOLogMsgEventParkedCar *)-[GEOLogMsgEventParkedCar _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventParkedCarIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventParkedCarReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOLogMsgEventParkedCar readAll:](self, "readAll:", 0);
  if (self->_location)
    objc_msgSend(v5, "setLocation:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_locationUncertainty;
    *((_BYTE *)v5 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v5 + 32) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_locationUncertainty;
    *(_BYTE *)(v5 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *location;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOLogMsgEventParkedCar readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_locationUncertainty != *((double *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_timestamp != *((double *)v4 + 3))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char flags;
  unint64_t v5;
  double locationUncertainty;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double timestamp;
  double v12;
  long double v13;
  double v14;

  -[GEOLogMsgEventParkedCar readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_location, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    locationUncertainty = self->_locationUncertainty;
    v7 = -locationUncertainty;
    if (locationUncertainty >= 0.0)
      v7 = self->_locationUncertainty;
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
  if ((flags & 2) != 0)
  {
    timestamp = self->_timestamp;
    v12 = -timestamp;
    if (timestamp >= 0.0)
      v12 = self->_timestamp;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *location;
  uint64_t v5;
  char v6;
  double *v7;

  v7 = (double *)a3;
  objc_msgSend(v7, "readAll:", 0);
  location = self->_location;
  v5 = *((_QWORD *)v7 + 2);
  if (location)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLogMsgEventParkedCar setLocation:](self, "setLocation:");
  }
  v6 = *((_BYTE *)v7 + 32);
  if ((v6 & 1) != 0)
  {
    self->_locationUncertainty = v7[1];
    *(_BYTE *)&self->_flags |= 1u;
    v6 = *((_BYTE *)v7 + 32);
  }
  if ((v6 & 2) != 0)
  {
    self->_timestamp = v7[3];
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
