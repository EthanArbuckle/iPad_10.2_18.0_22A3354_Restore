@implementation GEOURLCenterSpan

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
  *(_BYTE *)&self->_flags |= 8u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)latitudeDelta
{
  return self->_latitudeDelta;
}

- (void)setLatitudeDelta:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_latitudeDelta = a3;
}

- (void)setHasLatitudeDelta:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLatitudeDelta
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)longitudeDelta
{
  return self->_longitudeDelta;
}

- (void)setLongitudeDelta:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_longitudeDelta = a3;
}

- (void)setHasLongitudeDelta:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLongitudeDelta
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOURLCenterSpan;
  -[GEOURLCenterSpan description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLCenterSpan dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 40);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("latitude"));

    v3 = *(_BYTE *)(a1 + 40);
  }
  if ((v3 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("longitude"));

    v3 = *(_BYTE *)(a1 + 40);
    if ((v3 & 1) == 0)
    {
LABEL_6:
      if ((v3 & 4) == 0)
        return v2;
      goto LABEL_10;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("latitudeDelta"));

  if ((*(_BYTE *)(a1 + 40) & 4) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("longitudeDelta"));

  }
  return v2;
}

- (GEOURLCenterSpan)initWithDictionary:(id)a3
{
  return (GEOURLCenterSpan *)-[GEOURLCenterSpan _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

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

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("latitudeDelta"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setLatitudeDelta:");
      }

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("longitudeDelta"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setLongitudeDelta:");
      }

    }
  }

  return a1;
}

- (GEOURLCenterSpan)initWithJSON:(id)a3
{
  return (GEOURLCenterSpan *)-[GEOURLCenterSpan _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLCenterSpanIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLCenterSpanReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOURLCenterSpan readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[2] = *(_QWORD *)&self->_latitude;
    *((_BYTE *)v5 + 40) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v5[1] = *(_QWORD *)&self->_latitudeDelta;
      *((_BYTE *)v5 + 40) |= 1u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = *(_QWORD *)&self->_longitude;
  *((_BYTE *)v5 + 40) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    v5[3] = *(_QWORD *)&self->_longitudeDelta;
    *((_BYTE *)v5 + 40) |= 4u;
  }
LABEL_6:

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
    *((_BYTE *)result + 40) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_longitude;
  *((_BYTE *)result + 40) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_latitudeDelta;
  *((_BYTE *)result + 40) |= 1u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_5:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_longitudeDelta;
  *((_BYTE *)result + 40) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOURLCenterSpan readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_latitude != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_longitude != *((double *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_latitudeDelta != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_longitudeDelta != *((double *)v4 + 3))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

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
  double latitudeDelta;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double longitudeDelta;
  double v21;
  long double v22;
  double v23;

  -[GEOURLCenterSpan readAll:](self, "readAll:", 1);
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
  if ((flags & 8) != 0)
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
    latitudeDelta = self->_latitudeDelta;
    v16 = -latitudeDelta;
    if (latitudeDelta >= 0.0)
      v16 = self->_latitudeDelta;
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
    longitudeDelta = self->_longitudeDelta;
    v21 = -longitudeDelta;
    if (longitudeDelta >= 0.0)
      v21 = self->_longitudeDelta;
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
  return v9 ^ v4 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  double *v5;

  v5 = (double *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 2) != 0)
  {
    self->_latitude = v5[2];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 40);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      self->_latitudeDelta = v5[1];
      *(_BYTE *)&self->_flags |= 1u;
      if (((_BYTE)v5[5] & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if (((_BYTE)v5[5] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_longitude = v5[4];
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 4) != 0)
  {
LABEL_5:
    self->_longitudeDelta = v5[3];
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_6:

}

@end
