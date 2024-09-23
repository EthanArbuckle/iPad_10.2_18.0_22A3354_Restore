@implementation NPKProtoCatalog

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCatalog;
  -[NPKProtoCatalog description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCatalog dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *catalogData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  catalogData = self->_catalogData;
  if (catalogData)
    objc_msgSend(v3, "setObject:forKey:", catalogData, CFSTR("catalogData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCatalogReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_catalogData)
    -[NPKProtoCatalog writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setCatalogData:", self->_catalogData);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_catalogData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *catalogData;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    catalogData = self->_catalogData;
    if ((unint64_t)catalogData | v4[1])
      v6 = -[NSData isEqual:](catalogData, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_catalogData, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NPKProtoCatalog setCatalogData:](self, "setCatalogData:");
}

- (NSData)catalogData
{
  return self->_catalogData;
}

- (void)setCatalogData:(id)a3
{
  objc_storeStrong((id *)&self->_catalogData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogData, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoCatalog writeTo:]", "NPKProtoCatalog.m", 72, "nil != self->_catalogData");
}

@end
