@implementation ACProtobufVariableValue

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setIntegerValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_integerValue = a3;
}

- (void)setHasIntegerValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUnsignedIntegerValue:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_unsignedIntegerValue = a3;
}

- (void)setHasUnsignedIntegerValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnsignedIntegerValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasUuidValue
{
  return self->_uuidValue != 0;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasUrlValue
{
  return self->_urlValue != 0;
}

- (BOOL)hasArrayValue
{
  return self->_arrayValue != 0;
}

- (BOOL)hasSetValue
{
  return self->_setValue != 0;
}

- (BOOL)hasDictionaryValue
{
  return self->_dictionaryValue != 0;
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
  v8.super_class = (Class)ACProtobufVariableValue;
  -[ACProtobufVariableValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACProtobufVariableValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *stringValue;
  char has;
  void *v7;
  NSData *dataValue;
  ACProtobufUUID *uuidValue;
  void *v10;
  ACProtobufDate *dateValue;
  void *v12;
  ACProtobufURL *urlValue;
  void *v14;
  ACProtobufVariableValueList *arrayValue;
  void *v16;
  ACProtobufVariableValueList *setValue;
  void *v18;
  ACProtobufVariableValueDictionary *dictionaryValue;
  void *v20;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_integerValue);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("integerValue"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_unsignedIntegerValue);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("unsignedIntegerValue"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("doubleValue"));

  }
LABEL_7:
  dataValue = self->_dataValue;
  if (dataValue)
    objc_msgSend(v4, "setObject:forKey:", dataValue, CFSTR("dataValue"));
  uuidValue = self->_uuidValue;
  if (uuidValue)
  {
    -[ACProtobufUUID dictionaryRepresentation](uuidValue, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("uuidValue"));

  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    -[ACProtobufDate dictionaryRepresentation](dateValue, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("dateValue"));

  }
  urlValue = self->_urlValue;
  if (urlValue)
  {
    -[ACProtobufURL dictionaryRepresentation](urlValue, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("urlValue"));

  }
  arrayValue = self->_arrayValue;
  if (arrayValue)
  {
    -[ACProtobufVariableValueList dictionaryRepresentation](arrayValue, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("arrayValue"));

  }
  setValue = self->_setValue;
  if (setValue)
  {
    -[ACProtobufVariableValueList dictionaryRepresentation](setValue, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("setValue"));

  }
  dictionaryValue = self->_dictionaryValue;
  if (dictionaryValue)
  {
    -[ACProtobufVariableValueDictionary dictionaryRepresentation](dictionaryValue, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("dictionaryValue"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufVariableValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_uuidValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_dateValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_urlValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_arrayValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_dictionaryValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_integerValue;
    *((_BYTE *)v4 + 96) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 3) = self->_unsignedIntegerValue;
  *((_BYTE *)v4 + 96) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v4 + 96) |= 1u;
  }
LABEL_7:
  if (self->_dataValue)
  {
    objc_msgSend(v6, "setDataValue:");
    v4 = v6;
  }
  if (self->_uuidValue)
  {
    objc_msgSend(v6, "setUuidValue:");
    v4 = v6;
  }
  if (self->_dateValue)
  {
    objc_msgSend(v6, "setDateValue:");
    v4 = v6;
  }
  if (self->_urlValue)
  {
    objc_msgSend(v6, "setUrlValue:");
    v4 = v6;
  }
  if (self->_arrayValue)
  {
    objc_msgSend(v6, "setArrayValue:");
    v4 = v6;
  }
  if (self->_setValue)
  {
    objc_msgSend(v6, "setSetValue:");
    v4 = v6;
  }
  if (self->_dictionaryValue)
  {
    objc_msgSend(v6, "setDictionaryValue:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 24) = self->_unsignedIntegerValue;
    *(_BYTE *)(v5 + 96) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 16) = self->_integerValue;
  *(_BYTE *)(v5 + 96) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_doubleValue;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
LABEL_5:
  v9 = -[NSData copyWithZone:](self->_dataValue, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[ACProtobufUUID copyWithZone:](self->_uuidValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v11;

  v13 = -[ACProtobufDate copyWithZone:](self->_dateValue, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[ACProtobufURL copyWithZone:](self->_urlValue, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v15;

  v17 = -[ACProtobufVariableValueList copyWithZone:](self->_arrayValue, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  v19 = -[ACProtobufVariableValueList copyWithZone:](self->_setValue, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v19;

  v21 = -[ACProtobufVariableValueDictionary copyWithZone:](self->_dictionaryValue, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stringValue;
  NSData *dataValue;
  ACProtobufUUID *uuidValue;
  ACProtobufDate *dateValue;
  ACProtobufURL *urlValue;
  ACProtobufVariableValueList *arrayValue;
  ACProtobufVariableValueList *setValue;
  ACProtobufVariableValueDictionary *dictionaryValue;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_integerValue != *((_QWORD *)v4 + 2))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_33:
    v13 = 0;
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_unsignedIntegerValue != *((_QWORD *)v4 + 3))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_33;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((_QWORD *)v4 + 5) && !-[NSData isEqual:](dataValue, "isEqual:"))
    goto LABEL_33;
  uuidValue = self->_uuidValue;
  if ((unint64_t)uuidValue | *((_QWORD *)v4 + 11))
  {
    if (!-[ACProtobufUUID isEqual:](uuidValue, "isEqual:"))
      goto LABEL_33;
  }
  dateValue = self->_dateValue;
  if ((unint64_t)dateValue | *((_QWORD *)v4 + 6))
  {
    if (!-[ACProtobufDate isEqual:](dateValue, "isEqual:"))
      goto LABEL_33;
  }
  urlValue = self->_urlValue;
  if ((unint64_t)urlValue | *((_QWORD *)v4 + 10))
  {
    if (!-[ACProtobufURL isEqual:](urlValue, "isEqual:"))
      goto LABEL_33;
  }
  arrayValue = self->_arrayValue;
  if ((unint64_t)arrayValue | *((_QWORD *)v4 + 4))
  {
    if (!-[ACProtobufVariableValueList isEqual:](arrayValue, "isEqual:"))
      goto LABEL_33;
  }
  setValue = self->_setValue;
  if ((unint64_t)setValue | *((_QWORD *)v4 + 8))
  {
    if (!-[ACProtobufVariableValueList isEqual:](setValue, "isEqual:"))
      goto LABEL_33;
  }
  dictionaryValue = self->_dictionaryValue;
  if ((unint64_t)dictionaryValue | *((_QWORD *)v4 + 7))
    v13 = -[ACProtobufVariableValueDictionary isEqual:](dictionaryValue, "isEqual:");
  else
    v13 = 1;
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  double doubleValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v3 = -[NSString hash](self->_stringValue, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_integerValue;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761u * self->_unsignedIntegerValue;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  doubleValue = self->_doubleValue;
  v7 = -doubleValue;
  if (doubleValue >= 0.0)
    v7 = self->_doubleValue;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  v11 = v4 ^ v3 ^ v5 ^ v10 ^ -[NSData hash](self->_dataValue, "hash");
  v12 = -[ACProtobufUUID hash](self->_uuidValue, "hash");
  v13 = v12 ^ -[ACProtobufDate hash](self->_dateValue, "hash");
  v14 = v11 ^ v13 ^ -[ACProtobufURL hash](self->_urlValue, "hash");
  v15 = -[ACProtobufVariableValueList hash](self->_arrayValue, "hash");
  v16 = v15 ^ -[ACProtobufVariableValueList hash](self->_setValue, "hash");
  return v14 ^ v16 ^ -[ACProtobufVariableValueDictionary hash](self->_dictionaryValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  ACProtobufUUID *uuidValue;
  uint64_t v7;
  ACProtobufDate *dateValue;
  uint64_t v9;
  ACProtobufURL *urlValue;
  uint64_t v11;
  ACProtobufVariableValueList *arrayValue;
  uint64_t v13;
  ACProtobufVariableValueList *setValue;
  uint64_t v15;
  ACProtobufVariableValueDictionary *dictionaryValue;
  uint64_t v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[ACProtobufVariableValue setStringValue:](self, "setStringValue:");
    v4 = v18;
  }
  v5 = *((_BYTE *)v4 + 96);
  if ((v5 & 2) != 0)
  {
    self->_integerValue = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 96);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 96) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_unsignedIntegerValue = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
LABEL_6:
    self->_doubleValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 5))
  {
    -[ACProtobufVariableValue setDataValue:](self, "setDataValue:");
    v4 = v18;
  }
  uuidValue = self->_uuidValue;
  v7 = *((_QWORD *)v4 + 11);
  if (uuidValue)
  {
    if (!v7)
      goto LABEL_18;
    -[ACProtobufUUID mergeFrom:](uuidValue, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_18;
    -[ACProtobufVariableValue setUuidValue:](self, "setUuidValue:");
  }
  v4 = v18;
LABEL_18:
  dateValue = self->_dateValue;
  v9 = *((_QWORD *)v4 + 6);
  if (dateValue)
  {
    if (!v9)
      goto LABEL_24;
    -[ACProtobufDate mergeFrom:](dateValue, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_24;
    -[ACProtobufVariableValue setDateValue:](self, "setDateValue:");
  }
  v4 = v18;
LABEL_24:
  urlValue = self->_urlValue;
  v11 = *((_QWORD *)v4 + 10);
  if (urlValue)
  {
    if (!v11)
      goto LABEL_30;
    -[ACProtobufURL mergeFrom:](urlValue, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_30;
    -[ACProtobufVariableValue setUrlValue:](self, "setUrlValue:");
  }
  v4 = v18;
LABEL_30:
  arrayValue = self->_arrayValue;
  v13 = *((_QWORD *)v4 + 4);
  if (arrayValue)
  {
    if (!v13)
      goto LABEL_36;
    -[ACProtobufVariableValueList mergeFrom:](arrayValue, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_36;
    -[ACProtobufVariableValue setArrayValue:](self, "setArrayValue:");
  }
  v4 = v18;
LABEL_36:
  setValue = self->_setValue;
  v15 = *((_QWORD *)v4 + 8);
  if (setValue)
  {
    if (!v15)
      goto LABEL_42;
    -[ACProtobufVariableValueList mergeFrom:](setValue, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_42;
    -[ACProtobufVariableValue setSetValue:](self, "setSetValue:");
  }
  v4 = v18;
LABEL_42:
  dictionaryValue = self->_dictionaryValue;
  v17 = *((_QWORD *)v4 + 7);
  if (dictionaryValue)
  {
    if (v17)
    {
      -[ACProtobufVariableValueDictionary mergeFrom:](dictionaryValue, "mergeFrom:");
LABEL_47:
      v4 = v18;
    }
  }
  else if (v17)
  {
    -[ACProtobufVariableValue setDictionaryValue:](self, "setDictionaryValue:");
    goto LABEL_47;
  }

}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (unint64_t)unsignedIntegerValue
{
  return self->_unsignedIntegerValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

- (ACProtobufUUID)uuidValue
{
  return self->_uuidValue;
}

- (void)setUuidValue:(id)a3
{
  objc_storeStrong((id *)&self->_uuidValue, a3);
}

- (ACProtobufDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
}

- (ACProtobufURL)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
  objc_storeStrong((id *)&self->_urlValue, a3);
}

- (ACProtobufVariableValueList)arrayValue
{
  return self->_arrayValue;
}

- (void)setArrayValue:(id)a3
{
  objc_storeStrong((id *)&self->_arrayValue, a3);
}

- (ACProtobufVariableValueList)setValue
{
  return self->_setValue;
}

- (void)setSetValue:(id)a3
{
  objc_storeStrong((id *)&self->_setValue, a3);
}

- (ACProtobufVariableValueDictionary)dictionaryValue
{
  return self->_dictionaryValue;
}

- (void)setDictionaryValue:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidValue, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_setValue, 0);
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_arrayValue, 0);
}

- (ACProtobufVariableValue)initWithObjectValue:(id)a3
{
  id v4;
  ACProtobufVariableValue *v5;
  ACProtobufVariableValue *v6;
  ACProtobufVariableValue *v7;

  v4 = a3;
  v5 = -[ACProtobufVariableValue init](self, "init");
  v6 = v5;
  if (v5 && -[ACProtobufVariableValue _setObject:](v5, "_setObject:", v4))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (BOOL)_setObject:(id)a3
{
  const __CFNumber *v4;
  CFNumberType Type;
  ACProtobufDate *v6;
  ACProtobufVariableValueList *v7;
  ACProtobufVariableValueList *v8;
  ACProtobufVariableValueDictionary *v9;
  BOOL v10;

  v4 = (const __CFNumber *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      Type = CFNumberGetType(v4);
      if ((unint64_t)Type <= kCFNumberCGFloatType)
      {
        if (((1 << Type) & 0x13060) != 0)
        {
          -[__CFNumber doubleValue](v4, "doubleValue");
          -[ACProtobufVariableValue setDoubleValue:](self, "setDoubleValue:");
          goto LABEL_28;
        }
        if (Type == kCFNumberCFIndexType)
        {
          -[ACProtobufVariableValue setUnsignedIntegerValue:](self, "setUnsignedIntegerValue:", -[__CFNumber unsignedLongLongValue](v4, "unsignedLongLongValue"));
          goto LABEL_28;
        }
      }
      -[ACProtobufVariableValue setIntegerValue:](self, "setIntegerValue:", -[__CFNumber longLongValue](v4, "longLongValue"));
      goto LABEL_28;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ACProtobufVariableValue setDataValue:](self, "setDataValue:", v4);
      goto LABEL_28;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[ACProtobufDate initWithDate:]([ACProtobufDate alloc], "initWithDate:", v4);
      -[ACProtobufVariableValue setDateValue:](self, "setDateValue:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = -[ACProtobufUUID initWithUUID:]([ACProtobufUUID alloc], "initWithUUID:", v4);
        -[ACProtobufVariableValue setUuidValue:](self, "setUuidValue:", v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = -[ACProtobufVariableValueList initWithSet:]([ACProtobufVariableValueList alloc], "initWithSet:", v4);
            if (v7)
            {
              v6 = (ACProtobufDate *)v7;
              -[ACProtobufVariableValue setSetValue:](self, "setSetValue:", v7);
              goto LABEL_27;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v8 = -[ACProtobufVariableValueList initWithArray:]([ACProtobufVariableValueList alloc], "initWithArray:", v4);
              if (v8)
              {
                v6 = (ACProtobufDate *)v8;
                -[ACProtobufVariableValue setArrayValue:](self, "setArrayValue:", v8);
                goto LABEL_27;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v9 = -[ACProtobufVariableValueDictionary initWithDictionary:]([ACProtobufVariableValueDictionary alloc], "initWithDictionary:", v4);
                if (v9)
                {
                  v6 = (ACProtobufDate *)v9;
                  -[ACProtobufVariableValue setDictionaryValue:](self, "setDictionaryValue:", v9);
                  goto LABEL_27;
                }
              }
            }
          }
          v10 = 0;
          goto LABEL_29;
        }
        v6 = -[ACProtobufURL initWithURL:]([ACProtobufURL alloc], "initWithURL:", v4);
        -[ACProtobufVariableValue setUrlValue:](self, "setUrlValue:", v6);
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  -[ACProtobufVariableValue setStringValue:](self, "setStringValue:", v4);
LABEL_28:
  v10 = 1;
LABEL_29:

  return v10;
}

- (id)object
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;

  if (-[ACProtobufVariableValue hasStringValue](self, "hasStringValue"))
  {
    -[ACProtobufVariableValue stringValue](self, "stringValue");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v5 = (void *)v3;
    return v5;
  }
  if (-[ACProtobufVariableValue hasIntegerValue](self, "hasIntegerValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ACProtobufVariableValue integerValue](self, "integerValue"));
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (-[ACProtobufVariableValue hasUnsignedIntegerValue](self, "hasUnsignedIntegerValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ACProtobufVariableValue unsignedIntegerValue](self, "unsignedIntegerValue"));
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (-[ACProtobufVariableValue hasDoubleValue](self, "hasDoubleValue"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[ACProtobufVariableValue doubleValue](self, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (-[ACProtobufVariableValue hasDataValue](self, "hasDataValue"))
  {
    -[ACProtobufVariableValue dataValue](self, "dataValue");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (-[ACProtobufVariableValue hasUuidValue](self, "hasUuidValue"))
  {
    -[ACProtobufVariableValue uuidValue](self, "uuidValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[ACProtobufVariableValue hasUrlValue](self, "hasUrlValue"))
  {
    -[ACProtobufVariableValue urlValue](self, "urlValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[ACProtobufVariableValue hasDateValue](self, "hasDateValue"))
  {
    -[ACProtobufVariableValue dateValue](self, "dateValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[ACProtobufVariableValue hasArrayValue](self, "hasArrayValue"))
  {
    -[ACProtobufVariableValue arrayValue](self, "arrayValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[ACProtobufVariableValue hasSetValue](self, "hasSetValue"))
  {
    -[ACProtobufVariableValue setValue](self, "setValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "set");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[ACProtobufVariableValue hasDictionaryValue](self, "hasDictionaryValue"))
    {
      v5 = 0;
      return v5;
    }
    -[ACProtobufVariableValue dictionaryValue](self, "dictionaryValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v8;

  return v5;
}

@end
