@implementation GEOGeoServiceTag

+ (id)defaultTag
{
  GEOGeoServiceTag *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(GEOGeoServiceTag);
  -[GEOGeoServiceTag setServiceType:](v2, "setServiceType:", 18);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOGeoServiceTag setTag:](v2, "setTag:", v4);

  return v2;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (void)setServiceType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_serviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (int)serviceType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_serviceType;
  else
    return 0;
}

- (void)setHasServiceType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasServiceType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)serviceTypeAsString:(int)a3
{
  if (a3 < 0x1D)
    return off_1E1C13948[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsServiceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REV_GEO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FWD_GEO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_SERVICE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELL_WIFI_HARVEST")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACE_HARVEST")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_TILES")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO_COMPLETE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DASHBOARD_TEST")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDR_PTS_HARVEST")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISPATCHER")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSEC")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEO_SERVICES_FRAMEWORK")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MERCHANT_LOOKUP")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEO_SEARCH")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_ETA")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUNITY")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCUS")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTONAVI_FRONTDOOR")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUNITY_NON_PII")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISPATCHER_ENRICHMENT")) & 1) != 0)
  {
    v4 = 27;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_APP_WEB_SERVICE")))
  {
    v4 = 28;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)tag
{
  return self->_tag;
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
  v8.super_class = (Class)GEOGeoServiceTag;
  -[GEOGeoServiceTag description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOGeoServiceTag dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGeoServiceTag _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v5 = *(int *)(a1 + 24);
    if (v5 >= 0x1D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C13948[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("serviceType"));

  }
  objc_msgSend((id)a1, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("tag"));

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
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46__GEOGeoServiceTag__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGeoServiceTag _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOGeoServiceTag__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOGeoServiceTag)initWithDictionary:(id)a3
{
  return (GEOGeoServiceTag *)-[GEOGeoServiceTag _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (!a1)
    goto LABEL_70;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_70;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("serviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SERVICE_UNKNOWN")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("REV_GEO")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FWD_GEO")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ROUTING")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCATION_SERVICE")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("COLLECTION")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CELL_WIFI_HARVEST")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TRACE_HARVEST")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TRAFFIC_TILES")) & 1) != 0)
    {
      v6 = 9;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RASTER")) & 1) != 0)
    {
      v6 = 10;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AUTO_COMPLETE")) & 1) != 0)
    {
      v6 = 11;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DASHBOARD_TEST")) & 1) != 0)
    {
      v6 = 12;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VECTOR")) & 1) != 0)
    {
      v6 = 13;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ADDR_PTS_HARVEST")) & 1) != 0)
    {
      v6 = 14;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DISPATCHER")) & 1) != 0)
    {
      v6 = 15;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PLACE_LOOKUP")) & 1) != 0)
    {
      v6 = 16;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PARSEC")) & 1) != 0)
    {
      v6 = 17;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GEO_SERVICES_FRAMEWORK")) & 1) != 0)
    {
      v6 = 18;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SIRI")) & 1) != 0)
    {
      v6 = 19;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MERCHANT_LOOKUP")) & 1) != 0)
    {
      v6 = 20;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("GEO_SEARCH")) & 1) != 0)
    {
      v6 = 21;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TRAFFIC_ETA")) & 1) != 0)
    {
      v6 = 22;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("COMMUNITY")) & 1) != 0)
    {
      v6 = 23;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCUS")) & 1) != 0)
    {
      v6 = 24;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AUTONAVI_FRONTDOOR")) & 1) != 0)
    {
      v6 = 25;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("COMMUNITY_NON_PII")) & 1) != 0)
    {
      v6 = 26;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DISPATCHER_ENRICHMENT")) & 1) != 0)
    {
      v6 = 27;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("MAPS_APP_WEB_SERVICE")))
    {
      v6 = 28;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_66;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "intValue");
LABEL_66:
    objc_msgSend(a1, "setServiceType:", v6);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setTag:", v8);

  }
LABEL_70:

  return a1;
}

- (GEOGeoServiceTag)initWithJSON:(id)a3
{
  return (GEOGeoServiceTag *)-[GEOGeoServiceTag _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGeoServiceTagIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGeoServiceTagReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  -[GEOGeoServiceTag readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[6] = self->_serviceType;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  objc_msgSend(v4, "setTag:", self->_tag);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_serviceType;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_tag, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tag;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOGeoServiceTag readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_serviceType != *((_DWORD *)v4 + 6))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  tag = self->_tag;
  if ((unint64_t)tag | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](tag, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOGeoServiceTag readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_serviceType;
  else
    v3 = 0;
  return -[NSString hash](self->_tag, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[7] & 1) != 0)
  {
    self->_serviceType = v5[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 2))
  {
    -[GEOGeoServiceTag setTag:](self, "setTag:");
    v4 = v5;
  }

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
    -[GEOGeoServiceTag readAll:](self, "readAll:", 0);
}

@end
