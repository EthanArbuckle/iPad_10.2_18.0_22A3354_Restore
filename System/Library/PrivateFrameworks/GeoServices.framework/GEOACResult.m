@implementation GEOACResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOACResult;
  -[GEOACResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOACResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (GEOACResult)initWithDictionary:(id)a3
{
  return (GEOACResult *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;

  v3 = a2;
  if (a1)
    a1 = (void *)objc_msgSend(a1, "init");

  return a1;
}

- (GEOACResult)initWithJSON:(id)a3
{
  return (GEOACResult *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOACResultIsValid((unsigned __int8 *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOACResultReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  -[GEOACResult readAll:](self, "readAll:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    -[GEOACResult readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOACResult readAll:](self, "readAll:", 1);
  return 0;
}

- (void)mergeFrom:(id)a3
{
  objc_msgSend(a3, "readAll:", 0);
}

@end
