@implementation HDCodableUserDomainConceptProperty

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setValueType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_valueType = a3;
}

- (void)setHasValueType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasValueType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
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

- (void)setBoolValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasBoolValue
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
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
  v8.super_class = (Class)HDCodableUserDomainConceptProperty;
  -[HDCodableUserDomainConceptProperty description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptProperty dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *stringValue;
  char v7;
  void *v8;
  NSData *dataValue;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("version"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("timestamp"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_valueType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("valueType"));

  }
LABEL_6:
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  v7 = (char)self->_has;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("doubleValue"));

    v7 = (char)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_10:
      if ((v7 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_integerValue);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("integerValue"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_BOOLValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("BOOLValue"));

  }
LABEL_12:
  dataValue = self->_dataValue;
  if (dataValue)
    objc_msgSend(v3, "setObject:forKey:", dataValue, CFSTR("dataValue"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptPropertyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v7;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
LABEL_6:
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
LABEL_12:
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_type;
    *((_BYTE *)v4 + 76) |= 8u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_version;
  *((_BYTE *)v4 + 76) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  v4[3] = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)v4 + 76) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v4[5] = self->_valueType;
    *((_BYTE *)v4 + 76) |= 0x10u;
  }
LABEL_6:
  v7 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v4 + 76) |= 1u;
    v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  v4[2] = self->_integerValue;
  *((_BYTE *)v4 + 76) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    *((_BYTE *)v4 + 72) = self->_BOOLValue;
    *((_BYTE *)v4 + 76) |= 0x40u;
  }
LABEL_12:
  if (self->_dataValue)
  {
    objc_msgSend(v7, "setDataValue:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 76) |= 8u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 48) = self->_version;
  *(_BYTE *)(v5 + 76) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *(double *)(v5 + 24) = self->_timestamp;
  *(_BYTE *)(v5 + 76) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 40) = self->_valueType;
    *(_BYTE *)(v5 + 76) |= 0x10u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v8;

  v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_8;
LABEL_16:
    *(_QWORD *)(v6 + 16) = self->_integerValue;
    *(_BYTE *)(v6 + 76) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  *(double *)(v6 + 8) = self->_doubleValue;
  *(_BYTE *)(v6 + 76) |= 1u;
  v10 = (char)self->_has;
  if ((v10 & 2) != 0)
    goto LABEL_16;
LABEL_8:
  if ((v10 & 0x40) != 0)
  {
LABEL_9:
    *(_BYTE *)(v6 + 72) = self->_BOOLValue;
    *(_BYTE *)(v6 + 76) |= 0x40u;
  }
LABEL_10:
  v11 = -[NSData copyWithZone:](self->_dataValue, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *stringValue;
  char v8;
  NSData *dataValue;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 76);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0 || self->_type != *((_QWORD *)v4 + 4))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x20) == 0 || self->_version != *((_QWORD *)v4 + 6))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 76) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_timestamp != *((double *)v4 + 3))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) == 0 || self->_valueType != *((_QWORD *)v4 + 5))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_39;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 76);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_39;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_integerValue != *((_QWORD *)v4 + 2))
      goto LABEL_39;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 0x40) == 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_45;
LABEL_39:
    v8 = 0;
    goto LABEL_40;
  }
  if ((v6 & 0x40) == 0)
    goto LABEL_39;
  if (!self->_BOOLValue)
  {
    if (!*((_BYTE *)v4 + 72))
      goto LABEL_45;
    goto LABEL_39;
  }
  if (!*((_BYTE *)v4 + 72))
    goto LABEL_39;
LABEL_45:
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((_QWORD *)v4 + 7))
    v8 = -[NSData isEqual:](dataValue, "isEqual:");
  else
    v8 = 1;
LABEL_40:

  return v8;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  double timestamp;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  char v13;
  unint64_t v14;
  double doubleValue;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_version;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  timestamp = self->_timestamp;
  v7 = -timestamp;
  if (timestamp >= 0.0)
    v7 = self->_timestamp;
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
  if ((has & 0x10) != 0)
    v11 = 2654435761 * self->_valueType;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_stringValue, "hash");
  v13 = (char)self->_has;
  if ((v13 & 1) != 0)
  {
    doubleValue = self->_doubleValue;
    v16 = -doubleValue;
    if (doubleValue >= 0.0)
      v16 = self->_doubleValue;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((v13 & 2) != 0)
  {
    v19 = 2654435761 * self->_integerValue;
    if ((v13 & 0x40) != 0)
      goto LABEL_26;
LABEL_28:
    v20 = 0;
    return v5 ^ v4 ^ v10 ^ v11 ^ v14 ^ v19 ^ v20 ^ v12 ^ -[NSData hash](self->_dataValue, "hash");
  }
  v19 = 0;
  if ((v13 & 0x40) == 0)
    goto LABEL_28;
LABEL_26:
  v20 = 2654435761 * self->_BOOLValue;
  return v5 ^ v4 ^ v10 ^ v11 ^ v14 ^ v19 ^ v20 ^ v12 ^ -[NSData hash](self->_dataValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 8) != 0)
  {
    self->_type = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 76);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_QWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  self->_timestamp = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
LABEL_5:
    self->_valueType = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_6:
  v7 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCodableUserDomainConceptProperty setStringValue:](self, "setStringValue:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 76);
  if ((v6 & 1) != 0)
  {
    self->_doubleValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 76);
    if ((v6 & 2) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_integerValue = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 76) & 0x40) != 0)
  {
LABEL_11:
    self->_BOOLValue = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCodableUserDomainConceptProperty setDataValue:](self, "setDataValue:");
    v4 = v7;
  }

}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end
