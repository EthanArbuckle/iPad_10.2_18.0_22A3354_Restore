@implementation GEONavigationTransitStopSummary

- (unint64_t)stopID
{
  return self->_stopID;
}

- (void)setStopID:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_stopID = a3;
}

- (void)setHasStopID:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStopID
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
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
  v8.super_class = (Class)GEONavigationTransitStopSummary;
  -[GEONavigationTransitStopSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationTransitStopSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigationTransitStopSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("stopID"));

    }
    objc_msgSend((id)a1, "coordinate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v6, "jsonRepresentation");
      else
        objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("coordinate"));

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
  return -[GEONavigationTransitStopSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavigationTransitStopSummary)initWithDictionary:(id)a3
{
  return (GEONavigationTransitStopSummary *)-[GEONavigationTransitStopSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOLatLng *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stopID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStopID:", objc_msgSend(v6, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setCoordinate:", v9);

      }
    }
  }

  return a1;
}

- (GEONavigationTransitStopSummary)initWithJSON:(id)a3
{
  return (GEONavigationTransitStopSummary *)-[GEONavigationTransitStopSummary _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationTransitStopSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationTransitStopSummaryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_coordinate, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEONavigationTransitStopSummary readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_QWORD *)v5 + 2) = self->_stopID;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  if (self->_coordinate)
  {
    objc_msgSend(v5, "setCoordinate:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_stopID;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[GEOLatLng copyWithZone:](self->_coordinate, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *coordinate;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEONavigationTransitStopSummary readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_stopID != *((_QWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((_QWORD *)v4 + 1))
    v6 = -[GEOLatLng isEqual:](coordinate, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEONavigationTransitStopSummary readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_stopID;
  else
    v3 = 0;
  return -[GEOLatLng hash](self->_coordinate, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  GEOLatLng *coordinate;
  unint64_t v6;
  unint64_t *v7;

  v7 = (unint64_t *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[3] & 1) != 0)
  {
    self->_stopID = v7[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
  coordinate = self->_coordinate;
  v6 = v7[1];
  if (coordinate)
  {
    if (v6)
    {
      -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEONavigationTransitStopSummary setCoordinate:](self, "setCoordinate:");
    goto LABEL_8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinate, 0);
}

- (GEONavigationTransitStopSummary)initWithTransitStop:(id)a3
{
  id v4;
  GEONavigationTransitStopSummary *v5;
  void *v6;
  GEONavigationTransitStopSummary *v7;

  v4 = a3;
  v5 = -[GEONavigationTransitStopSummary init](self, "init");
  if (v5)
  {
    -[GEONavigationTransitStopSummary setStopID:](v5, "setStopID:", objc_msgSend(v4, "muid"));
    objc_msgSend(v4, "latLng");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONavigationTransitStopSummary setCoordinate:](v5, "setCoordinate:", v6);

    v7 = v5;
  }

  return v5;
}

@end
