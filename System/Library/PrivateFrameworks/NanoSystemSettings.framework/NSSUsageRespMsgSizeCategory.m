@implementation NSSUsageRespMsgSizeCategory

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasCategoryIdentifier
{
  return self->_categoryIdentifier != 0;
}

- (BOOL)hasSize
{
  return self->_size != 0;
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
  v8.super_class = (Class)NSSUsageRespMsgSizeCategory;
  -[NSSUsageRespMsgSizeCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSUsageRespMsgSizeCategory dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *categoryIdentifier;
  NSSUsageSize *size;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  categoryIdentifier = self->_categoryIdentifier;
  if (categoryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", categoryIdentifier, CFSTR("categoryIdentifier"));
  size = self->_size;
  if (size)
  {
    -[NSSUsageSize dictionaryRepresentation](size, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("size"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgSizeCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_categoryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_size)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_categoryIdentifier)
  {
    objc_msgSend(v5, "setCategoryIdentifier:");
    v4 = v5;
  }
  if (self->_size)
  {
    objc_msgSend(v5, "setSize:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_categoryIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSSUsageSize copyWithZone:](self->_size, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *categoryIdentifier;
  NSSUsageSize *size;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:"))
    && ((categoryIdentifier = self->_categoryIdentifier, !((unint64_t)categoryIdentifier | v4[1]))
     || -[NSString isEqual:](categoryIdentifier, "isEqual:")))
  {
    size = self->_size;
    if ((unint64_t)size | v4[3])
      v8 = -[NSSUsageSize isEqual:](size, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_categoryIdentifier, "hash") ^ v3;
  return v4 ^ -[NSSUsageSize hash](self->_size, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NSSUsageSize *size;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[NSSUsageRespMsgSizeCategory setName:](self, "setName:");
    v4 = v7;
  }
  if (v4[1])
  {
    -[NSSUsageRespMsgSizeCategory setCategoryIdentifier:](self, "setCategoryIdentifier:");
    v4 = v7;
  }
  size = self->_size;
  v6 = v4[3];
  if (size)
  {
    if (v6)
    {
      -[NSSUsageSize mergeFrom:](size, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[NSSUsageRespMsgSizeCategory setSize:](self, "setSize:");
    goto LABEL_10;
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_categoryIdentifier, a3);
}

- (NSSUsageSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end
