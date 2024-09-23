@implementation CAXPBContextualActionContent

- (BOOL)hasContentMetadata
{
  return self->_contentMetadata != 0;
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
  v8.super_class = (Class)CAXPBContextualActionContent;
  -[CAXPBContextualActionContent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXPBContextualActionContent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *contentType;
  NSData *contentMetadata;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  contentType = self->_contentType;
  if (contentType)
    objc_msgSend(v3, "setObject:forKey:", contentType, CFSTR("contentType"));
  contentMetadata = self->_contentMetadata;
  if (contentMetadata)
    objc_msgSend(v4, "setObject:forKey:", contentMetadata, CFSTR("contentMetadata"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CAXPBContextualActionContentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_contentType)
    -[CAXPBContextualActionContent writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_contentMetadata)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setContentType:", self->_contentType);
  if (self->_contentMetadata)
    objc_msgSend(v4, "setContentMetadata:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_contentType, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_contentMetadata, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *contentType;
  NSData *contentMetadata;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((contentType = self->_contentType, !((unint64_t)contentType | v4[2]))
     || -[NSString isEqual:](contentType, "isEqual:")))
  {
    contentMetadata = self->_contentMetadata;
    if ((unint64_t)contentMetadata | v4[1])
      v7 = -[NSData isEqual:](contentMetadata, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_contentType, "hash");
  return -[NSData hash](self->_contentMetadata, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[CAXPBContextualActionContent setContentType:](self, "setContentType:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[CAXPBContextualActionContent setContentMetadata:](self, "setContentMetadata:");
    v4 = v5;
  }

}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSData)contentMetadata
{
  return self->_contentMetadata;
}

- (void)setContentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_contentMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentMetadata, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CAXPBContextualActionContent writeTo:]", "CAXPBContextualActionContent.m", 82, "nil != self->_contentType");
}

@end
