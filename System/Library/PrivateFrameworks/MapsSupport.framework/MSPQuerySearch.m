@implementation MSPQuerySearch

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (BOOL)hasLocationDisplayString
{
  return self->_locationDisplayString != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
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
  v8.super_class = (Class)MSPQuerySearch;
  -[MSPQuerySearch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPQuerySearch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *query;
  NSString *locationDisplayString;
  NSString *language;
  GEOMapRegion *mapRegion;
  void *v9;
  PBUnknownFields *unknownFields;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  query = self->_query;
  if (query)
    objc_msgSend(v3, "setObject:forKey:", query, CFSTR("query"));
  locationDisplayString = self->_locationDisplayString;
  if (locationDisplayString)
    objc_msgSend(v4, "setObject:forKey:", locationDisplayString, CFSTR("locationDisplayString"));
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  mapRegion = self->_mapRegion;
  if (mapRegion)
  {
    -[GEOMapRegion dictionaryRepresentation](mapRegion, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("mapRegion"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPQuerySearchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_query)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_locationDisplayString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_mapRegion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_query)
  {
    objc_msgSend(v4, "setQuery:");
    v4 = v5;
  }
  if (self->_locationDisplayString)
  {
    objc_msgSend(v5, "setLocationDisplayString:");
    v4 = v5;
  }
  if (self->_language)
  {
    objc_msgSend(v5, "setLanguage:");
    v4 = v5;
  }
  if (self->_mapRegion)
  {
    objc_msgSend(v5, "setMapRegion:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_locationDisplayString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *query;
  NSString *locationDisplayString;
  NSString *language;
  GEOMapRegion *mapRegion;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((query = self->_query, !((unint64_t)query | v4[5]))
     || -[NSString isEqual:](query, "isEqual:"))
    && ((locationDisplayString = self->_locationDisplayString, !((unint64_t)locationDisplayString | v4[3]))
     || -[NSString isEqual:](locationDisplayString, "isEqual:"))
    && ((language = self->_language, !((unint64_t)language | v4[2]))
     || -[NSString isEqual:](language, "isEqual:")))
  {
    mapRegion = self->_mapRegion;
    if ((unint64_t)mapRegion | v4[4])
      v9 = -[GEOMapRegion isEqual:](mapRegion, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_query, "hash");
  v4 = -[NSString hash](self->_locationDisplayString, "hash") ^ v3;
  v5 = -[NSString hash](self->_language, "hash");
  return v4 ^ v5 ^ -[GEOMapRegion hash](self->_mapRegion, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOMapRegion *mapRegion;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[5])
  {
    -[MSPQuerySearch setQuery:](self, "setQuery:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[MSPQuerySearch setLocationDisplayString:](self, "setLocationDisplayString:");
    v4 = v7;
  }
  if (v4[2])
  {
    -[MSPQuerySearch setLanguage:](self, "setLanguage:");
    v4 = v7;
  }
  mapRegion = self->_mapRegion;
  v6 = v4[4];
  if (mapRegion)
  {
    if (v6)
    {
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
LABEL_12:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[MSPQuerySearch setMapRegion:](self, "setMapRegion:");
    goto LABEL_12;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSString)locationDisplayString
{
  return self->_locationDisplayString;
}

- (void)setLocationDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_locationDisplayString, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_locationDisplayString, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
