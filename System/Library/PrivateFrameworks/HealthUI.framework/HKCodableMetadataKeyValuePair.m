@implementation HKCodableMetadataKeyValuePair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_quantityValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setNumberIntValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberIntValue = a3;
}

- (void)setHasNumberIntValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberIntValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasQuantityValue
{
  return self->_quantityValue != 0;
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
  v8.super_class = (Class)HKCodableMetadataKeyValuePair;
  -[HKCodableMetadataKeyValuePair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableMetadataKeyValuePair dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *stringValue;
  HKCodableQuantity *quantityValue;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numberIntValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("numberIntValue"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v4, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  quantityValue = self->_quantityValue;
  if (quantityValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](quantityValue, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("quantityValue"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableMetadataKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_quantityValue)
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
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_numberIntValue;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_stringValue)
  {
    objc_msgSend(v5, "setStringValue:");
    v4 = v5;
  }
  if (self->_quantityValue)
  {
    objc_msgSend(v5, "setQuantityValue:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_numberIntValue;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_quantityValue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *stringValue;
  HKCodableQuantity *quantityValue;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_numberIntValue != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](stringValue, "isEqual:"))
  {
    goto LABEL_13;
  }
  quantityValue = self->_quantityValue;
  if ((unint64_t)quantityValue | *((_QWORD *)v4 + 3))
    v8 = -[HKCodableQuantity isEqual:](quantityValue, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_numberIntValue;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_stringValue, "hash");
  return v5 ^ v6 ^ -[HKCodableQuantity hash](self->_quantityValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableQuantity *quantityValue;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HKCodableMetadataKeyValuePair setKey:](self, "setKey:");
    v4 = v7;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_numberIntValue = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[4])
  {
    -[HKCodableMetadataKeyValuePair setStringValue:](self, "setStringValue:");
    v4 = v7;
  }
  quantityValue = self->_quantityValue;
  v6 = v4[3];
  if (quantityValue)
  {
    if (v6)
    {
      -[HKCodableQuantity mergeFrom:](quantityValue, "mergeFrom:");
LABEL_12:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HKCodableMetadataKeyValuePair setQuantityValue:](self, "setQuantityValue:");
    goto LABEL_12;
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (int64_t)numberIntValue
{
  return self->_numberIntValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (HKCodableQuantity)quantityValue
{
  return self->_quantityValue;
}

- (void)setQuantityValue:(id)a3
{
  objc_storeStrong((id *)&self->_quantityValue, a3);
}

@end
