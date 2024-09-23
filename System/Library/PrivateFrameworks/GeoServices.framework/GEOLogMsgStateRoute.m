@implementation GEOLogMsgStateRoute

- (BOOL)hasRouteDetails
{
  return self->_routeDetails != 0;
}

- (GEORouteDetails)routeDetails
{
  return self->_routeDetails;
}

- (void)setRouteDetails:(id)a3
{
  objc_storeStrong((id *)&self->_routeDetails, a3);
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
  v8.super_class = (Class)GEOLogMsgStateRoute;
  -[GEOLogMsgStateRoute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateRoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateRoute _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "routeDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("routeDetails");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("route_details");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

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
  return -[GEOLogMsgStateRoute _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateRoute)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateRoute *)-[GEOLogMsgStateRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORouteDetails *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("routeDetails");
      else
        v6 = CFSTR("route_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORouteDetails alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORouteDetails initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORouteDetails initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setRouteDetails:", v9);

      }
    }
  }

  return a1;
}

- (GEOLogMsgStateRoute)initWithJSON:(id)a3
{
  return (GEOLogMsgStateRoute *)-[GEOLogMsgStateRoute _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateRouteReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_routeDetails)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStateRoute readAll:](self, "readAll:", 0);
  if (self->_routeDetails)
    objc_msgSend(v4, "setRouteDetails:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEORouteDetails copyWithZone:](self->_routeDetails, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEORouteDetails *routeDetails;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLogMsgStateRoute readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    routeDetails = self->_routeDetails;
    if ((unint64_t)routeDetails | v4[1])
      v5 = -[GEORouteDetails isEqual:](routeDetails, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgStateRoute readAll:](self, "readAll:", 1);
  return -[GEORouteDetails hash](self->_routeDetails, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORouteDetails *routeDetails;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  routeDetails = self->_routeDetails;
  v6 = v4[1];

  if (routeDetails)
  {
    if (v6)
      -[GEORouteDetails mergeFrom:](routeDetails, "mergeFrom:", v6);
  }
  else if (v6)
  {
    -[GEOLogMsgStateRoute setRouteDetails:](self, "setRouteDetails:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeDetails, 0);
}

@end
