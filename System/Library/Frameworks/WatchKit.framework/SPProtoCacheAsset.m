@implementation SPProtoCacheAsset

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SPProtoCacheAsset;
  -[SPProtoCacheAsset description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoCacheAsset dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSString *key;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("state"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_size);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("size"));

  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_accessDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("accessDate"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoCacheAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  NSString *key;
  double *v5;

  *((_DWORD *)a3 + 8) = self->_state;
  *((_QWORD *)a3 + 2) = self->_size;
  key = self->_key;
  v5 = (double *)a3;
  objc_msgSend(v5, "setKey:", key);
  v5[1] = self->_accessDate;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 32) = self->_state;
  *(_QWORD *)(v5 + 16) = self->_size;
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(double *)(v5 + 8) = self->_accessDate;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_state == *((_DWORD *)v4 + 8)
    && self->_size == *((_QWORD *)v4 + 2)
    && ((key = self->_key, !((unint64_t)key | *((_QWORD *)v4 + 3)))
     || -[NSString isEqual:](key, "isEqual:"))
    && self->_accessDate == *((double *)v4 + 1);

  return v6;
}

- (unint64_t)hash
{
  unsigned int state;
  unint64_t size;
  NSUInteger v5;
  double accessDate;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  state = self->_state;
  size = self->_size;
  v5 = -[NSString hash](self->_key, "hash");
  accessDate = self->_accessDate;
  v7 = -accessDate;
  if (accessDate >= 0.0)
    v7 = self->_accessDate;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = fmod(v8, 1.84467441e19);
  v11 = 2654435761u * (unint64_t)v10;
  v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0)
    v12 = 2654435761u * (unint64_t)v10;
  v13 = v11 - (unint64_t)fabs(v9);
  if (v9 >= 0.0)
    v13 = v12;
  return (2654435761u * size) ^ (2654435761 * state) ^ v5 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_state = *((_DWORD *)v4 + 8);
  self->_size = *((_QWORD *)v4 + 2);
  if (*((_QWORD *)v4 + 3))
  {
    v5 = v4;
    -[SPProtoCacheAsset setKey:](self, "setKey:");
    v4 = v5;
  }
  self->_accessDate = *((double *)v4 + 1);

}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (double)accessDate
{
  return self->_accessDate;
}

- (void)setAccessDate:(double)a3
{
  self->_accessDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
