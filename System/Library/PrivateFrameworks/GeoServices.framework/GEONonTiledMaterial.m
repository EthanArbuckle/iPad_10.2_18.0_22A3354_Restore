@implementation GEONonTiledMaterial

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEONonTiledInfo *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEONonTiledInfo alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEONonTiledInfo initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEONonTiledInfo initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setInfo:", v8);

      }
    }
  }

  return a1;
}

- (BOOL)hasInfo
{
  return self->_info != 0;
}

- (GEONonTiledInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
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
  v8.super_class = (Class)GEONonTiledMaterial;
  -[GEONonTiledMaterial description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONonTiledMaterial dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONonTiledMaterial _dictionaryRepresentation:](self, 0);
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
    objc_msgSend(a1, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("info"));

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
  return -[GEONonTiledMaterial _dictionaryRepresentation:](self, 1);
}

- (GEONonTiledMaterial)initWithDictionary:(id)a3
{
  return (GEONonTiledMaterial *)-[GEONonTiledMaterial _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEONonTiledMaterial)initWithJSON:(id)a3
{
  return (GEONonTiledMaterial *)-[GEONonTiledMaterial _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONonTiledMaterialIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONonTiledMaterialReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_info)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEONonTiledMaterial readAll:](self, "readAll:", 0);
  if (self->_info)
    objc_msgSend(v4, "setInfo:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEONonTiledInfo copyWithZone:](self->_info, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEONonTiledInfo *info;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEONonTiledMaterial readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    info = self->_info;
    if ((unint64_t)info | v4[1])
      v5 = -[GEONonTiledInfo isEqual:](info, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEONonTiledMaterial readAll:](self, "readAll:", 1);
  return -[GEONonTiledInfo hash](self->_info, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEONonTiledInfo *info;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  info = self->_info;
  v6 = v4[1];

  if (info)
  {
    if (v6)
      -[GEONonTiledInfo mergeFrom:](info, "mergeFrom:", v6);
  }
  else if (v6)
  {
    -[GEONonTiledMaterial setInfo:](self, "setInfo:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
