@implementation GEORouteHypothesisRequest

- (double)arrivalDate
{
  return self->_arrivalDate;
}

- (void)setArrivalDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_arrivalDate = a3;
}

- (void)setHasArrivalDate:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArrivalDate
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasDestinationLocation
{
  return self->_destinationLocation != 0;
}

- (GEOMapItemStorage)destinationLocation
{
  return self->_destinationLocation;
}

- (void)setDestinationLocation:(id)a3
{
  objc_storeStrong((id *)&self->_destinationLocation, a3);
}

- (int)transportType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_transportType;
  else
    return 4;
}

- (void)setTransportType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransportType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C07B30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
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

- (double)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasExpirationDate
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
  v8.super_class = (Class)GEORouteHypothesisRequest;
  -[GEORouteHypothesisRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteHypothesisRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteHypothesisRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 36) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("arrivalDate"));

    }
    objc_msgSend((id)a1, "destinationLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v6, "jsonRepresentation");
      else
        objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("destinationLocation"));

    }
    v9 = *(_BYTE *)(a1 + 36);
    if ((v9 & 4) != 0)
    {
      v10 = *(int *)(a1 + 32);
      if (v10 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E1C07B30[v10];
      }
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("transportType"));

      v9 = *(_BYTE *)(a1 + 36);
    }
    if ((v9 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("expirationDate"));

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
  return -[GEORouteHypothesisRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORouteHypothesisRequest)initWithDictionary:(id)a3
{
  return (GEORouteHypothesisRequest *)-[GEORouteHypothesisRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOMapItemStorage *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_33;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_33;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(a1, "setArrivalDate:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destinationLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOMapItemStorage alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOMapItemStorage initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOMapItemStorage initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setDestinationLocation:", v9);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v13 = 5;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v13 = 6;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_29:
    objc_msgSend(a1, "setTransportType:", v13);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expirationDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(a1, "setExpirationDate:");
  }

LABEL_33:
  return a1;
}

- (GEORouteHypothesisRequest)initWithJSON:(id)a3
{
  return (GEORouteHypothesisRequest *)-[GEORouteHypothesisRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteHypothesisRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteHypothesisRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_destinationLocation)
    PBDataWriterWriteSubmessage();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORouteHypothesisRequestClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOMapItemStorage hasGreenTeaWithValue:](self->_destinationLocation, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char flags;
  _QWORD *v6;

  v6 = a3;
  -[GEORouteHypothesisRequest readAll:](self, "readAll:", 0);
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v6[1] = *(_QWORD *)&self->_arrivalDate;
    *((_BYTE *)v6 + 36) |= 1u;
  }
  if (self->_destinationLocation)
  {
    objc_msgSend(v6, "setDestinationLocation:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v4[8] = self->_transportType;
    *((_BYTE *)v4 + 36) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_expirationDate;
    *((_BYTE *)v4 + 36) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_arrivalDate;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[GEOMapItemStorage copyWithZone:](self->_destinationLocation, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_transportType;
    *(_BYTE *)(v6 + 36) |= 4u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(double *)(v6 + 24) = self->_expirationDate;
    *(_BYTE *)(v6 + 36) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOMapItemStorage *destinationLocation;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEORouteHypothesisRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 36);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_arrivalDate != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_19;
  }
  destinationLocation = self->_destinationLocation;
  if ((unint64_t)destinationLocation | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOMapItemStorage isEqual:](destinationLocation, "isEqual:"))
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_transportType != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_19;
  }
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_expirationDate != *((double *)v4 + 3))
      goto LABEL_19;
    v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  double arrivalDate;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  double expirationDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;

  -[GEORouteHypothesisRequest readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    arrivalDate = self->_arrivalDate;
    v5 = -arrivalDate;
    if (arrivalDate >= 0.0)
      v5 = self->_arrivalDate;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[GEOMapItemStorage hash](self->_destinationLocation, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v9 = 2654435761 * self->_transportType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_11;
LABEL_16:
    v14 = 0;
    return v8 ^ v3 ^ v9 ^ v14;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_16;
LABEL_11:
  expirationDate = self->_expirationDate;
  v11 = -expirationDate;
  if (expirationDate >= 0.0)
    v11 = self->_expirationDate;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
  return v8 ^ v3 ^ v9 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  GEOMapItemStorage *destinationLocation;
  uint64_t v6;
  char v7;
  double *v8;

  v8 = (double *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if ((*((_BYTE *)v8 + 36) & 1) != 0)
  {
    self->_arrivalDate = v8[1];
    *(_BYTE *)&self->_flags |= 1u;
  }
  destinationLocation = self->_destinationLocation;
  v6 = *((_QWORD *)v8 + 2);
  if (destinationLocation)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOMapItemStorage mergeFrom:](destinationLocation, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORouteHypothesisRequest setDestinationLocation:](self, "setDestinationLocation:");
  }
  v4 = v8;
LABEL_9:
  v7 = *((_BYTE *)v4 + 36);
  if ((v7 & 4) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_flags |= 4u;
    v7 = *((_BYTE *)v4 + 36);
  }
  if ((v7 & 2) != 0)
  {
    self->_expirationDate = v4[3];
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationLocation, 0);
}

@end
