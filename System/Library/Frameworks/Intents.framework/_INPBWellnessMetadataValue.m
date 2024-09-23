@implementation _INPBWellnessMetadataValue

- (void)setPbDoubleValue:(id)a3
{
  objc_storeStrong((id *)&self->_pbDoubleValue, a3);
}

- (BOOL)hasPbDoubleValue
{
  return self->_pbDoubleValue != 0;
}

- (void)setOrdinalValue:(id)a3
{
  objc_storeStrong((id *)&self->_ordinalValue, a3);
}

- (BOOL)hasOrdinalValue
{
  return self->_ordinalValue != 0;
}

- (void)setPbStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_pbStringValue, a3);
}

- (BOOL)hasPbStringValue
{
  return self->_pbStringValue != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWellnessMetadataValueReadFrom(self, (uint64_t)a3);
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
  -[_INPBWellnessMetadataValue pbDoubleValue](self, "pbDoubleValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBWellnessMetadataValue pbDoubleValue](self, "pbDoubleValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBWellnessMetadataValue ordinalValue](self, "ordinalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBWellnessMetadataValue ordinalValue](self, "ordinalValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBWellnessMetadataValue pbStringValue](self, "pbStringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBWellnessMetadataValue pbStringValue](self, "pbStringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBWellnessMetadataValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBWellnessMetadataValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBWellnessMetadataValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBWellnessMetadataValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBWellnessMetadataValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBWellnessMetadataValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBWellnessMetadataValue *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBWellnessMetadataValue init](+[_INPBWellnessMetadataValue allocWithZone:](_INPBWellnessMetadataValue, "allocWithZone:"), "init");
  v6 = -[_INPBDouble copyWithZone:](self->_pbDoubleValue, "copyWithZone:", a3);
  -[_INPBWellnessMetadataValue setPbDoubleValue:](v5, "setPbDoubleValue:", v6);

  v7 = -[_INPBInteger copyWithZone:](self->_ordinalValue, "copyWithZone:", a3);
  -[_INPBWellnessMetadataValue setOrdinalValue:](v5, "setOrdinalValue:", v7);

  v8 = -[_INPBString copyWithZone:](self->_pbStringValue, "copyWithZone:", a3);
  -[_INPBWellnessMetadataValue setPbStringValue:](v5, "setPbStringValue:", v8);

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
  -[_INPBWellnessMetadataValue pbDoubleValue](self, "pbDoubleValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pbDoubleValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBWellnessMetadataValue pbDoubleValue](self, "pbDoubleValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBWellnessMetadataValue pbDoubleValue](self, "pbDoubleValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pbDoubleValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBWellnessMetadataValue ordinalValue](self, "ordinalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ordinalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBWellnessMetadataValue ordinalValue](self, "ordinalValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBWellnessMetadataValue ordinalValue](self, "ordinalValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ordinalValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBWellnessMetadataValue pbStringValue](self, "pbStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pbStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBWellnessMetadataValue pbStringValue](self, "pbStringValue");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBWellnessMetadataValue pbStringValue](self, "pbStringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pbStringValue");
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

  v3 = -[_INPBDouble hash](self->_pbDoubleValue, "hash");
  v4 = -[_INPBInteger hash](self->_ordinalValue, "hash") ^ v3;
  return v4 ^ -[_INPBString hash](self->_pbStringValue, "hash");
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
  -[_INPBWellnessMetadataValue pbDoubleValue](self, "pbDoubleValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("doubleValue"));

  -[_INPBWellnessMetadataValue ordinalValue](self, "ordinalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ordinalValue"));

  -[_INPBWellnessMetadataValue pbStringValue](self, "pbStringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("stringValue"));

  return v3;
}

- (_INPBDouble)pbDoubleValue
{
  return self->_pbDoubleValue;
}

- (_INPBInteger)ordinalValue
{
  return self->_ordinalValue;
}

- (_INPBString)pbStringValue
{
  return self->_pbStringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbStringValue, 0);
  objc_storeStrong((id *)&self->_ordinalValue, 0);
  objc_storeStrong((id *)&self->_pbDoubleValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
