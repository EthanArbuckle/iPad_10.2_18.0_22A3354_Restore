@implementation _INPBUUIDValue

- (void)setUuidString:(id)a3
{
  NSString *v4;
  NSString *uuidString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  uuidString = self->_uuidString;
  self->_uuidString = v4;

}

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUUIDValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_INPBUUIDValue uuidString](self, "uuidString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBUUIDValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBUUIDValue valueMetadata](self, "valueMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBUUIDValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBUUIDValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBUUIDValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBUUIDValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBUUIDValue initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBUUIDValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBUUIDValue *v5;
  void *v6;
  id v7;

  v5 = -[_INPBUUIDValue init](+[_INPBUUIDValue allocWithZone:](_INPBUUIDValue, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  -[_INPBUUIDValue setUuidString:](v5, "setUuidString:", v6);

  v7 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBUUIDValue setValueMetadata:](v5, "setValueMetadata:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBUUIDValue uuidString](self, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuidString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBUUIDValue uuidString](self, "uuidString");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBUUIDValue uuidString](self, "uuidString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuidString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBUUIDValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBUUIDValue valueMetadata](self, "valueMetadata");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBUUIDValue valueMetadata](self, "valueMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_uuidString, "hash");
  return -[_INPBValueMetadata hash](self->_valueMetadata, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_uuidString)
  {
    -[_INPBUUIDValue uuidString](self, "uuidString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("uuidString"));

  }
  -[_INPBUUIDValue valueMetadata](self, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("valueMetadata"));

  return v3;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
