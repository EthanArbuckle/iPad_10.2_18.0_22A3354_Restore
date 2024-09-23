@implementation GEONonTiledMaterialMap

- (GEONonTiledInfo)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

- (GEONonTiledMaterialMap)initWithJSON:(id)a3
{
  return (GEONonTiledMaterialMap *)-[GEONonTiledMaterial _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (BOOL)hasInfo
{
  return self->_info != 0;
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
  v8.super_class = (Class)GEONonTiledMaterialMap;
  -[GEONonTiledMaterialMap description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONonTiledMaterialMap dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONonTiledMaterial _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEONonTiledMaterial _dictionaryRepresentation:](self, 1);
}

- (GEONonTiledMaterialMap)initWithDictionary:(id)a3
{
  return (GEONonTiledMaterialMap *)-[GEONonTiledMaterial _initWithDictionary:isJSON:](self, a3, 0);
}

+ (BOOL)isValid:(id)a3
{
  return GEONonTiledMaterialMapIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONonTiledMaterialMapReadAllFrom((uint64_t)self, a3);
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
  -[GEONonTiledMaterialMap readAll:](self, "readAll:", 0);
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
    -[GEONonTiledMaterialMap readAll:](self, "readAll:", 1);
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
  -[GEONonTiledMaterialMap readAll:](self, "readAll:", 1);
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
    -[GEONonTiledMaterialMap setInfo:](self, "setInfo:", v6);
  }
}

@end
