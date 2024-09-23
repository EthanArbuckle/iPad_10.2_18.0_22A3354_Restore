@implementation NSSUsageRespMsgBundleUsageCategory

- (BOOL)hasName
{
  return self->_name != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsgBundleUsageCategory;
  -[NSSUsageRespMsgBundleUsageCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSUsageRespMsgBundleUsageCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_usageInBytes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("usageInBytes"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgBundleUsageCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_name)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if (self->_name)
  {
    v5 = v4;
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  v4[1] = self->_usageInBytes;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_usageInBytes;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:"))
    && self->_usageInBytes == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761u * self->_usageInBytes) ^ -[NSString hash](self->_name, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[NSSUsageRespMsgBundleUsageCategory setName:](self, "setName:");
    v4 = v5;
  }
  self->_usageInBytes = v4[1];

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)usageInBytes
{
  return self->_usageInBytes;
}

- (void)setUsageInBytes:(unint64_t)a3
{
  self->_usageInBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
