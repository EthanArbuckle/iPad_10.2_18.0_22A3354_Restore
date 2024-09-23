@implementation GEOPolyLocationShiftRequest

- (GEOLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
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
  v8.super_class = (Class)GEOPolyLocationShiftRequest;
  -[GEOPolyLocationShiftRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPolyLocationShiftRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPolyLocationShiftRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "location");
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
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPolyLocationShiftRequest _dictionaryRepresentation:](self, 1);
}

- (GEOPolyLocationShiftRequest)initWithDictionary:(id)a3
{
  return (GEOPolyLocationShiftRequest *)-[GEOPolyLocationShiftRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;

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
    }
  }

  return a1;
}

- (GEOPolyLocationShiftRequest)initWithJSON:(id)a3
{
  return (GEOPolyLocationShiftRequest *)-[GEOPolyLocationShiftRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPolyLocationShiftRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPolyLocationShiftRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteSubmessage();
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", a3);
}

- (unsigned)requestTypeCode
{
  return 50;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPolyLocationShiftRequest readAll:](self, "readAll:", 0);
  objc_msgSend(v4, "setLocation:", self->_location);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOLatLng *location;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOPolyLocationShiftRequest readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    location = self->_location;
    if ((unint64_t)location | v4[1])
      v5 = -[GEOLatLng isEqual:](location, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOPolyLocationShiftRequest readAll:](self, "readAll:", 1);
  return -[GEOLatLng hash](self->_location, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLatLng *location;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  location = self->_location;
  v6 = v4[1];

  if (location)
  {
    if (v6)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:", v6);
  }
  else if (v6)
  {
    -[GEOPolyLocationShiftRequest setLocation:](self, "setLocation:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
