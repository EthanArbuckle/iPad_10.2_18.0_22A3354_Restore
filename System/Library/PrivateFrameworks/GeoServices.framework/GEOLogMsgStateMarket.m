@implementation GEOLogMsgStateMarket

- (BOOL)hasMarket
{
  return self->_market != 0;
}

- (NSString)market
{
  return self->_market;
}

- (void)setMarket:(id)a3
{
  objc_storeStrong((id *)&self->_market, a3);
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
  v8.super_class = (Class)GEOLogMsgStateMarket;
  -[GEOLogMsgStateMarket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMarket dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "market");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("market"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOLogMsgStateMarket)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMarket *)-[GEOLogMsgStateMarket _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("market"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setMarket:", v5);

      }
    }
  }

  return a1;
}

- (GEOLogMsgStateMarket)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMarket *)-[GEOLogMsgStateMarket _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMarketIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMarketReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_market)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStateMarket readAll:](self, "readAll:", 0);
  if (self->_market)
    objc_msgSend(v4, "setMarket:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_market, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSString *market;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLogMsgStateMarket readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    market = self->_market;
    if ((unint64_t)market | v4[1])
      v5 = -[NSString isEqual:](market, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgStateMarket readAll:](self, "readAll:", 1);
  return -[NSString hash](self->_market, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = v4[1];

  if (v5)
    -[GEOLogMsgStateMarket setMarket:](self, "setMarket:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_market, 0);
}

@end
