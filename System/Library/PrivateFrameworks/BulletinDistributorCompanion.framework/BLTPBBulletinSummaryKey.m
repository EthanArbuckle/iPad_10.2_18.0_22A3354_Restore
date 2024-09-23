@implementation BLTPBBulletinSummaryKey

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasValueNulls
{
  return self->_valueNulls != 0;
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
  v8.super_class = (Class)BLTPBBulletinSummaryKey;
  -[BLTPBBulletinSummaryKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletinSummaryKey dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  NSData *value;
  NSData *valueNulls;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  value = self->_value;
  if (value)
    objc_msgSend(v4, "setObject:forKey:", value, CFSTR("value"));
  valueNulls = self->_valueNulls;
  if (valueNulls)
    objc_msgSend(v4, "setObject:forKey:", valueNulls, CFSTR("valueNulls"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBBulletinSummaryKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_key)
    -[BLTPBBulletinSummaryKey writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_value)
    PBDataWriterWriteDataField();
  if (self->_valueNulls)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setKey:", self->_key);
  if (self->_value)
    objc_msgSend(v4, "setValue:");
  if (self->_valueNulls)
    objc_msgSend(v4, "setValueNulls:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_valueNulls, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSData *value;
  NSData *valueNulls;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:"))
    && ((value = self->_value, !((unint64_t)value | v4[2])) || -[NSData isEqual:](value, "isEqual:")))
  {
    valueNulls = self->_valueNulls;
    if ((unint64_t)valueNulls | v4[3])
      v8 = -[NSData isEqual:](valueNulls, "isEqual:");
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
  uint64_t v4;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSData hash](self->_value, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_valueNulls, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[BLTPBBulletinSummaryKey setKey:](self, "setKey:");
  if (v4[2])
    -[BLTPBBulletinSummaryKey setValue:](self, "setValue:");
  if (v4[3])
    -[BLTPBBulletinSummaryKey setValueNulls:](self, "setValueNulls:");

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSData)valueNulls
{
  return self->_valueNulls;
}

- (void)setValueNulls:(id)a3
{
  objc_storeStrong((id *)&self->_valueNulls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueNulls, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBBulletinSummaryKey writeTo:]", "BLTPBBulletinSummaryKey.m", 102, "nil != self->_key");
}

@end
