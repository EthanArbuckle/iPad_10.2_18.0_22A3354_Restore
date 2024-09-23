@implementation NPKProtoStandalonePaymentSetupField

- (id)fieldTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 129)
  {
    switch(a3)
    {
      case 130:
        return CFSTR("Label");
      case 140:
        return CFSTR("Footer");
      case 150:
        return CFSTR("Picker");
    }
    goto LABEL_16;
  }
  if (a3 == 100)
    return CFSTR("Unknown");
  if (a3 == 110)
    return CFSTR("Text");
  if (a3 != 120)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("Date");
  return v3;
}

- (int)StringAsFieldType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Text")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Date")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Label")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Footer")) & 1) != 0)
  {
    v4 = 140;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Picker")))
  {
    v4 = 150;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (BOOL)hasCurrentValue
{
  return self->_currentValue != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentSetupField;
  -[NPKProtoStandalonePaymentSetupField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  int fieldType;
  __CFString *v7;
  NSString *currentValue;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  fieldType = self->_fieldType;
  if (fieldType > 129)
  {
    switch(fieldType)
    {
      case 130:
        v7 = CFSTR("Label");
        goto LABEL_17;
      case 140:
        v7 = CFSTR("Footer");
        goto LABEL_17;
      case 150:
        v7 = CFSTR("Picker");
        goto LABEL_17;
    }
  }
  else
  {
    switch(fieldType)
    {
      case 'd':
        v7 = CFSTR("Unknown");
        goto LABEL_17;
      case 'n':
        v7 = CFSTR("Text");
        goto LABEL_17;
      case 'x':
        v7 = CFSTR("Date");
        goto LABEL_17;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_fieldType);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("fieldType"));

  currentValue = self->_currentValue;
  if (currentValue)
    objc_msgSend(v4, "setObject:forKey:", currentValue, CFSTR("currentValue"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentSetupFieldReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_identifier)
    -[NPKProtoStandalonePaymentSetupField writeTo:].cold.1();
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_currentValue)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _DWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "setIdentifier:", self->_identifier);
  v4 = v5;
  v5[4] = self->_fieldType;
  if (self->_currentValue)
  {
    objc_msgSend(v5, "setCurrentValue:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 16) = self->_fieldType;
  v8 = -[NSString copyWithZone:](self->_currentValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *currentValue;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[3]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && self->_fieldType == *((_DWORD *)v4 + 4))
  {
    currentValue = self->_currentValue;
    if ((unint64_t)currentValue | v4[1])
      v7 = -[NSString isEqual:](currentValue, "isEqual:");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = 2654435761 * self->_fieldType;
  return v4 ^ v3 ^ -[NSString hash](self->_currentValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoStandalonePaymentSetupField setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  self->_fieldType = v4[4];
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoStandalonePaymentSetupField setCurrentValue:](self, "setCurrentValue:");
    v4 = v5;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(int)a3
{
  self->_fieldType = a3;
}

- (NSString)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(id)a3
{
  objc_storeStrong((id *)&self->_currentValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentSetupField writeTo:]", "NPKProtoStandalonePaymentSetupField.m", 102, "nil != self->_identifier");
}

@end
