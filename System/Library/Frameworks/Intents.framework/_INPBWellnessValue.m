@implementation _INPBWellnessValue

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
  return _INPBWellnessValueReadFrom(self, (uint64_t)a3);
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
  -[_INPBWellnessValue pbDoubleValue](self, "pbDoubleValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBWellnessValue pbDoubleValue](self, "pbDoubleValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBWellnessValue ordinalValue](self, "ordinalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBWellnessValue ordinalValue](self, "ordinalValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBWellnessValue valueMetadata](self, "valueMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBWellnessValue valueMetadata](self, "valueMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBWellnessValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBWellnessValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBWellnessValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBWellnessValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBWellnessValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBWellnessValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBWellnessValue *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBWellnessValue init](+[_INPBWellnessValue allocWithZone:](_INPBWellnessValue, "allocWithZone:"), "init");
  v6 = -[_INPBDouble copyWithZone:](self->_pbDoubleValue, "copyWithZone:", a3);
  -[_INPBWellnessValue setPbDoubleValue:](v5, "setPbDoubleValue:", v6);

  v7 = -[_INPBInteger copyWithZone:](self->_ordinalValue, "copyWithZone:", a3);
  -[_INPBWellnessValue setOrdinalValue:](v5, "setOrdinalValue:", v7);

  v8 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBWellnessValue setValueMetadata:](v5, "setValueMetadata:", v8);

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
  -[_INPBWellnessValue pbDoubleValue](self, "pbDoubleValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pbDoubleValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBWellnessValue pbDoubleValue](self, "pbDoubleValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBWellnessValue pbDoubleValue](self, "pbDoubleValue");
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
  -[_INPBWellnessValue ordinalValue](self, "ordinalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ordinalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBWellnessValue ordinalValue](self, "ordinalValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBWellnessValue ordinalValue](self, "ordinalValue");
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
  -[_INPBWellnessValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBWellnessValue valueMetadata](self, "valueMetadata");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBWellnessValue valueMetadata](self, "valueMetadata");
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

  v3 = -[_INPBDouble hash](self->_pbDoubleValue, "hash");
  v4 = -[_INPBInteger hash](self->_ordinalValue, "hash") ^ v3;
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
  -[_INPBWellnessValue pbDoubleValue](self, "pbDoubleValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("doubleValue"));

  -[_INPBWellnessValue ordinalValue](self, "ordinalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ordinalValue"));

  -[_INPBWellnessValue valueMetadata](self, "valueMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("valueMetadata"));

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

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_ordinalValue, 0);
  objc_storeStrong((id *)&self->_pbDoubleValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
