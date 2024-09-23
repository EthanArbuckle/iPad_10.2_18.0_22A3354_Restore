@implementation NTPBWrappingKeyMapEntry

- (BOOL)hasWrappingKeyId
{
  return self->_wrappingKeyId != 0;
}

- (BOOL)hasWrappingKey
{
  return self->_wrappingKey != 0;
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
  v8.super_class = (Class)NTPBWrappingKeyMapEntry;
  -[NTPBWrappingKeyMapEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBWrappingKeyMapEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *wrappingKeyId;
  NSData *wrappingKey;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  wrappingKeyId = self->_wrappingKeyId;
  if (wrappingKeyId)
    objc_msgSend(v3, "setObject:forKey:", wrappingKeyId, CFSTR("wrapping_key_id"));
  wrappingKey = self->_wrappingKey;
  if (wrappingKey)
    objc_msgSend(v4, "setObject:forKey:", wrappingKey, CFSTR("wrapping_key"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWrappingKeyMapEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_wrappingKeyId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_wrappingKey)
  {
    PBDataWriterWriteDataField();
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
  v6 = -[NSData copyWithZone:](self->_wrappingKeyId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_wrappingKey, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *wrappingKeyId;
  NSData *wrappingKey;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((wrappingKeyId = self->_wrappingKeyId, !((unint64_t)wrappingKeyId | v4[2]))
     || -[NSData isEqual:](wrappingKeyId, "isEqual:")))
  {
    wrappingKey = self->_wrappingKey;
    if ((unint64_t)wrappingKey | v4[1])
      v7 = -[NSData isEqual:](wrappingKey, "isEqual:");
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
  uint64_t v3;

  v3 = -[NSData hash](self->_wrappingKeyId, "hash");
  return -[NSData hash](self->_wrappingKey, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NTPBWrappingKeyMapEntry setWrappingKeyId:](self, "setWrappingKeyId:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NTPBWrappingKeyMapEntry setWrappingKey:](self, "setWrappingKey:");
    v4 = v5;
  }

}

- (NSData)wrappingKeyId
{
  return self->_wrappingKeyId;
}

- (void)setWrappingKeyId:(id)a3
{
  objc_storeStrong((id *)&self->_wrappingKeyId, a3);
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (void)setWrappingKey:(id)a3
{
  objc_storeStrong((id *)&self->_wrappingKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingKeyId, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);
}

@end
