@implementation _INPBWellnessMetadataPair

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
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
  return _INPBWellnessMetadataPairReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBWellnessMetadataPair key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBWellnessMetadataPair key](self, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBWellnessMetadataPair value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBWellnessMetadataPair value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBWellnessMetadataPair valueMetadata](self, "valueMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBWellnessMetadataPair valueMetadata](self, "valueMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBWellnessMetadataPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBWellnessMetadataPair *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBWellnessMetadataPair *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBWellnessMetadataPair *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBWellnessMetadataPair initWithData:](self, "initWithData:", v6);

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
  -[_INPBWellnessMetadataPair data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBWellnessMetadataPair *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBWellnessMetadataPair init](+[_INPBWellnessMetadataPair allocWithZone:](_INPBWellnessMetadataPair, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_key, "copyWithZone:", a3);
  -[_INPBWellnessMetadataPair setKey:](v5, "setKey:", v6);

  v7 = -[_INPBWellnessMetadataValue copyWithZone:](self->_value, "copyWithZone:", a3);
  -[_INPBWellnessMetadataPair setValue:](v5, "setValue:", v7);

  v8 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBWellnessMetadataPair setValueMetadata:](v5, "setValueMetadata:", v8);

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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBWellnessMetadataPair key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBWellnessMetadataPair key](self, "key");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBWellnessMetadataPair key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBWellnessMetadataPair value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBWellnessMetadataPair value](self, "value");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBWellnessMetadataPair value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBWellnessMetadataPair valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBWellnessMetadataPair valueMetadata](self, "valueMetadata");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBWellnessMetadataPair valueMetadata](self, "valueMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_INPBString hash](self->_key, "hash");
  v4 = -[_INPBWellnessMetadataValue hash](self->_value, "hash") ^ v3;
  return v4 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBWellnessMetadataPair key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("key"));

  -[_INPBWellnessMetadataPair value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

  -[_INPBWellnessMetadataPair valueMetadata](self, "valueMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("valueMetadata"));

  return v3;
}

- (_INPBString)key
{
  return self->_key;
}

- (_INPBWellnessMetadataValue)value
{
  return self->_value;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
