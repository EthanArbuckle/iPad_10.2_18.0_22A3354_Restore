@implementation BCSUrlPattern

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (BOOL)hasQuery
{
  return self->_query != 0;
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
  v8.super_class = (Class)BCSUrlPattern;
  -[BCSUrlPattern description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSUrlPattern dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *path;
  NSString *query;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  path = self->_path;
  if (path)
    objc_msgSend(v3, "setObject:forKey:", path, CFSTR("path"));
  query = self->_query;
  if (query)
    objc_msgSend(v4, "setObject:forKey:", query, CFSTR("query"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSUrlPatternReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_path)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_query)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_path)
  {
    objc_msgSend(v4, "setPath:");
    v4 = v5;
  }
  if (self->_query)
  {
    objc_msgSend(v5, "setQuery:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_path, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *path;
  NSString *query;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((path = self->_path, !((unint64_t)path | v4[1])) || -[NSString isEqual:](path, "isEqual:")))
  {
    query = self->_query;
    if ((unint64_t)query | v4[2])
      v7 = -[NSString isEqual:](query, "isEqual:");
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

  v3 = -[NSString hash](self->_path, "hash");
  return -[NSString hash](self->_query, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[BCSUrlPattern setPath:](self, "setPath:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[BCSUrlPattern setQuery:](self, "setQuery:");
    v4 = v5;
  }

}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
