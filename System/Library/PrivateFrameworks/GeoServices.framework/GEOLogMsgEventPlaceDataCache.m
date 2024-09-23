@implementation GEOLogMsgEventPlaceDataCache

- (BOOL)hasPlaceDataRequestingAppIdentifier
{
  return self->_placeDataRequestingAppIdentifier != 0;
}

- (NSString)placeDataRequestingAppIdentifier
{
  return self->_placeDataRequestingAppIdentifier;
}

- (void)setPlaceDataRequestingAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_placeDataRequestingAppIdentifier, a3);
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
  v8.super_class = (Class)GEOLogMsgEventPlaceDataCache;
  -[GEOLogMsgEventPlaceDataCache description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventPlaceDataCache dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPlaceDataCache _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "placeDataRequestingAppIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("placeDataRequestingAppIdentifier");
      else
        v6 = CFSTR("place_data_requesting_app_identifier");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
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
  return -[GEOLogMsgEventPlaceDataCache _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventPlaceDataCache)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPlaceDataCache *)-[GEOLogMsgEventPlaceDataCache _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("placeDataRequestingAppIdentifier");
      else
        v6 = CFSTR("place_data_requesting_app_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setPlaceDataRequestingAppIdentifier:", v8);

      }
    }
  }

  return a1;
}

- (GEOLogMsgEventPlaceDataCache)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPlaceDataCache *)-[GEOLogMsgEventPlaceDataCache _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPlaceDataCacheIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPlaceDataCacheReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_placeDataRequestingAppIdentifier)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventPlaceDataCache readAll:](self, "readAll:", 0);
  if (self->_placeDataRequestingAppIdentifier)
    objc_msgSend(v4, "setPlaceDataRequestingAppIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_placeDataRequestingAppIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSString *placeDataRequestingAppIdentifier;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLogMsgEventPlaceDataCache readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    placeDataRequestingAppIdentifier = self->_placeDataRequestingAppIdentifier;
    if ((unint64_t)placeDataRequestingAppIdentifier | v4[1])
      v5 = -[NSString isEqual:](placeDataRequestingAppIdentifier, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgEventPlaceDataCache readAll:](self, "readAll:", 1);
  return -[NSString hash](self->_placeDataRequestingAppIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = v4[1];

  if (v5)
    -[GEOLogMsgEventPlaceDataCache setPlaceDataRequestingAppIdentifier:](self, "setPlaceDataRequestingAppIdentifier:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDataRequestingAppIdentifier, 0);
}

@end
