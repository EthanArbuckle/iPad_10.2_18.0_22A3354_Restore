@implementation _INPBPaymentMethodValue

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setIdentificationHint:(id)a3
{
  NSString *v4;
  NSString *identificationHint;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identificationHint = self->_identificationHint;
  self->_identificationHint = v4;

}

- (BOOL)hasIdentificationHint
{
  return self->_identificationHint != 0;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setType:(int)a3
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
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 8)
    return off_1E228C810[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHECKING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAVINGS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROKERAGE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEBIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREDIT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREPAID")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STORE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_PAY")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  return _INPBPaymentMethodValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_INPBPaymentMethodValue icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBPaymentMethodValue icon](self, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPaymentMethodValue identificationHint](self, "identificationHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBPaymentMethodValue name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if (-[_INPBPaymentMethodValue hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();
  -[_INPBPaymentMethodValue valueMetadata](self, "valueMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[_INPBPaymentMethodValue valueMetadata](self, "valueMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (_INPBPaymentMethodValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPaymentMethodValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPaymentMethodValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPaymentMethodValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPaymentMethodValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBPaymentMethodValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPaymentMethodValue *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = -[_INPBPaymentMethodValue init](+[_INPBPaymentMethodValue allocWithZone:](_INPBPaymentMethodValue, "allocWithZone:"), "init");
  v6 = -[_INPBImageValue copyWithZone:](self->_icon, "copyWithZone:", a3);
  -[_INPBPaymentMethodValue setIcon:](v5, "setIcon:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_identificationHint, "copyWithZone:", a3);
  -[_INPBPaymentMethodValue setIdentificationHint:](v5, "setIdentificationHint:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  -[_INPBPaymentMethodValue setName:](v5, "setName:", v8);

  if (-[_INPBPaymentMethodValue hasType](self, "hasType"))
    -[_INPBPaymentMethodValue setType:](v5, "setType:", -[_INPBPaymentMethodValue type](self, "type"));
  v9 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBPaymentMethodValue setValueMetadata:](v5, "setValueMetadata:", v9);

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
  int v21;
  int v22;
  int type;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[_INPBPaymentMethodValue icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBPaymentMethodValue icon](self, "icon");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPaymentMethodValue icon](self, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBPaymentMethodValue identificationHint](self, "identificationHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identificationHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBPaymentMethodValue identificationHint](self, "identificationHint");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPaymentMethodValue identificationHint](self, "identificationHint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identificationHint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBPaymentMethodValue name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBPaymentMethodValue name](self, "name");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBPaymentMethodValue name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_26;
  }
  else
  {

  }
  v22 = -[_INPBPaymentMethodValue hasType](self, "hasType");
  if (v22 != objc_msgSend(v4, "hasType"))
    goto LABEL_26;
  if (-[_INPBPaymentMethodValue hasType](self, "hasType"))
  {
    if (objc_msgSend(v4, "hasType"))
    {
      type = self->_type;
      if (type != objc_msgSend(v4, "type"))
        goto LABEL_26;
    }
  }
  -[_INPBPaymentMethodValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPaymentMethodValue valueMetadata](self, "valueMetadata");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBPaymentMethodValue valueMetadata](self, "valueMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[_INPBImageValue hash](self->_icon, "hash");
  v4 = -[NSString hash](self->_identificationHint, "hash");
  v5 = -[NSString hash](self->_name, "hash");
  if (-[_INPBPaymentMethodValue hasType](self, "hasType"))
    v6 = 2654435761 * self->_type;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
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
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBPaymentMethodValue icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("icon"));

  if (self->_identificationHint)
  {
    -[_INPBPaymentMethodValue identificationHint](self, "identificationHint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("identificationHint"));

  }
  if (self->_name)
  {
    -[_INPBPaymentMethodValue name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("name"));

  }
  if (-[_INPBPaymentMethodValue hasType](self, "hasType"))
  {
    v10 = -[_INPBPaymentMethodValue type](self, "type");
    if ((v10 - 1) >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E228C810[(v10 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("type"));

  }
  -[_INPBPaymentMethodValue valueMetadata](self, "valueMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("valueMetadata"));

  return v3;
}

- (_INPBImageValue)icon
{
  return self->_icon;
}

- (NSString)identificationHint
{
  return self->_identificationHint;
}

- (NSString)name
{
  return self->_name;
}

- (int)type
{
  return self->_type;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identificationHint, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
