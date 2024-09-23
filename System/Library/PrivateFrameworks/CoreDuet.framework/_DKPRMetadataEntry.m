@implementation _DKPRMetadataEntry

- (uint64_t)value
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void)setValue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setKey:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (uint64_t)setIndex:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 1u;
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_key)
    -[_DKPRMetadataEntry writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_value)
    -[_DKPRMetadataEntry writeTo:].cold.2();
  PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (uint64_t)hasIndex
{
  if (result)
    return *(_BYTE *)(result + 32) & 1;
  return result;
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
  v8.super_class = (Class)_DKPRMetadataEntry;
  -[_DKPRMetadataEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRMetadataEntry dictionaryRepresentation](self, "dictionaryRepresentation");
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
  _DKPRValue *value;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  value = self->_value;
  if (value)
  {
    -[_DKPRValue dictionaryRepresentation](value, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("value"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_index);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("index"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRMetadataEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[_DKPRValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_index;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  _DKPRValue *value;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_10;
  }
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 3))
  {
    if (!-[_DKPRValue isEqual:](value, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_index == *((_DWORD *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[_DKPRValue hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_index;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (uint64_t)key
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)index
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPRMetadataEntry writeTo:]", "_DKPRMetadataEntry.m", 121, "nil != self->_key");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_DKPRMetadataEntry writeTo:]", "_DKPRMetadataEntry.m", 126, "self->_value != nil");
}

@end
