@implementation _INPBGetSettingResponseData

- (void)setBinaryValue:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_binaryValue = a3;
  }
}

- (BOOL)hasBinaryValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBinaryValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)binaryValueAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E2294700 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBinaryValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOGGLE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setBoundedValue:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_boundedValue = a3;
  }
}

- (BOOL)hasBoundedValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasBoundedValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)boundedValueAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E2294718 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBoundedValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIAN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAX")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setLabeledValue:(id)a3
{
  NSString *v4;
  NSString *labeledValue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  labeledValue = self->_labeledValue;
  self->_labeledValue = v4;

}

- (BOOL)hasLabeledValue
{
  return self->_labeledValue != 0;
}

- (void)setNumericValue:(id)a3
{
  objc_storeStrong((id *)&self->_numericValue, a3);
}

- (BOOL)hasNumericValue
{
  return self->_numericValue != 0;
}

- (void)setSettingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_settingMetadata, a3);
}

- (BOOL)hasSettingMetadata
{
  return self->_settingMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetSettingResponseDataReadFrom(self, (uint64_t)a3);
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
  if (-[_INPBGetSettingResponseData hasBinaryValue](self, "hasBinaryValue"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBGetSettingResponseData hasBoundedValue](self, "hasBoundedValue"))
    PBDataWriterWriteInt32Field();
  -[_INPBGetSettingResponseData labeledValue](self, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBGetSettingResponseData numericValue](self, "numericValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBGetSettingResponseData numericValue](self, "numericValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetSettingResponseData settingMetadata](self, "settingMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[_INPBGetSettingResponseData settingMetadata](self, "settingMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (_INPBGetSettingResponseData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGetSettingResponseData *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGetSettingResponseData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGetSettingResponseData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGetSettingResponseData initWithData:](self, "initWithData:", v6);

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
  -[_INPBGetSettingResponseData data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGetSettingResponseData *v5;
  void *v6;
  id v7;
  id v8;

  v5 = -[_INPBGetSettingResponseData init](+[_INPBGetSettingResponseData allocWithZone:](_INPBGetSettingResponseData, "allocWithZone:"), "init");
  if (-[_INPBGetSettingResponseData hasBinaryValue](self, "hasBinaryValue"))
    -[_INPBGetSettingResponseData setBinaryValue:](v5, "setBinaryValue:", -[_INPBGetSettingResponseData binaryValue](self, "binaryValue"));
  if (-[_INPBGetSettingResponseData hasBoundedValue](self, "hasBoundedValue"))
    -[_INPBGetSettingResponseData setBoundedValue:](v5, "setBoundedValue:", -[_INPBGetSettingResponseData boundedValue](self, "boundedValue"));
  v6 = (void *)-[NSString copyWithZone:](self->_labeledValue, "copyWithZone:", a3);
  -[_INPBGetSettingResponseData setLabeledValue:](v5, "setLabeledValue:", v6);

  v7 = -[_INPBNumericSettingValue copyWithZone:](self->_numericValue, "copyWithZone:", a3);
  -[_INPBGetSettingResponseData setNumericValue:](v5, "setNumericValue:", v7);

  v8 = -[_INPBSettingMetadata copyWithZone:](self->_settingMetadata, "copyWithZone:", a3);
  -[_INPBGetSettingResponseData setSettingMetadata:](v5, "setSettingMetadata:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int binaryValue;
  int v7;
  int boundedValue;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  v5 = -[_INPBGetSettingResponseData hasBinaryValue](self, "hasBinaryValue");
  if (v5 != objc_msgSend(v4, "hasBinaryValue"))
    goto LABEL_25;
  if (-[_INPBGetSettingResponseData hasBinaryValue](self, "hasBinaryValue"))
  {
    if (objc_msgSend(v4, "hasBinaryValue"))
    {
      binaryValue = self->_binaryValue;
      if (binaryValue != objc_msgSend(v4, "binaryValue"))
        goto LABEL_25;
    }
  }
  v7 = -[_INPBGetSettingResponseData hasBoundedValue](self, "hasBoundedValue");
  if (v7 != objc_msgSend(v4, "hasBoundedValue"))
    goto LABEL_25;
  if (-[_INPBGetSettingResponseData hasBoundedValue](self, "hasBoundedValue"))
  {
    if (objc_msgSend(v4, "hasBoundedValue"))
    {
      boundedValue = self->_boundedValue;
      if (boundedValue != objc_msgSend(v4, "boundedValue"))
        goto LABEL_25;
    }
  }
  -[_INPBGetSettingResponseData labeledValue](self, "labeledValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labeledValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_24;
  -[_INPBGetSettingResponseData labeledValue](self, "labeledValue");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_INPBGetSettingResponseData labeledValue](self, "labeledValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labeledValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (!v15)
      goto LABEL_25;
  }
  else
  {

  }
  -[_INPBGetSettingResponseData numericValue](self, "numericValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numericValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_24;
  -[_INPBGetSettingResponseData numericValue](self, "numericValue");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_INPBGetSettingResponseData numericValue](self, "numericValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numericValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_25;
  }
  else
  {

  }
  -[_INPBGetSettingResponseData settingMetadata](self, "settingMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) != (v10 != 0))
  {
    -[_INPBGetSettingResponseData settingMetadata](self, "settingMetadata");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {

LABEL_28:
      v26 = 1;
      goto LABEL_26;
    }
    v22 = (void *)v21;
    -[_INPBGetSettingResponseData settingMetadata](self, "settingMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_24:

  }
LABEL_25:
  v26 = 0;
LABEL_26:

  return v26;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  if (-[_INPBGetSettingResponseData hasBinaryValue](self, "hasBinaryValue"))
    v3 = 2654435761 * self->_binaryValue;
  else
    v3 = 0;
  if (-[_INPBGetSettingResponseData hasBoundedValue](self, "hasBoundedValue"))
    v4 = 2654435761 * self->_boundedValue;
  else
    v4 = 0;
  v5 = v4 ^ v3 ^ -[NSString hash](self->_labeledValue, "hash");
  v6 = -[_INPBNumericSettingValue hash](self->_numericValue, "hash");
  return v5 ^ v6 ^ -[_INPBSettingMetadata hash](self->_settingMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBGetSettingResponseData hasBinaryValue](self, "hasBinaryValue"))
  {
    v4 = -[_INPBGetSettingResponseData binaryValue](self, "binaryValue");
    if ((v4 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E2294700 + (v4 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("binaryValue"));

  }
  if (-[_INPBGetSettingResponseData hasBoundedValue](self, "hasBoundedValue"))
  {
    v6 = -[_INPBGetSettingResponseData boundedValue](self, "boundedValue");
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E2294718 + (v6 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("boundedValue"));

  }
  if (self->_labeledValue)
  {
    -[_INPBGetSettingResponseData labeledValue](self, "labeledValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("labeledValue"));

  }
  -[_INPBGetSettingResponseData numericValue](self, "numericValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numericValue"));

  -[_INPBGetSettingResponseData settingMetadata](self, "settingMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("settingMetadata"));

  return v3;
}

- (int)binaryValue
{
  return self->_binaryValue;
}

- (int)boundedValue
{
  return self->_boundedValue;
}

- (NSString)labeledValue
{
  return self->_labeledValue;
}

- (_INPBNumericSettingValue)numericValue
{
  return self->_numericValue;
}

- (_INPBSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_numericValue, 0);
  objc_storeStrong((id *)&self->_labeledValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
