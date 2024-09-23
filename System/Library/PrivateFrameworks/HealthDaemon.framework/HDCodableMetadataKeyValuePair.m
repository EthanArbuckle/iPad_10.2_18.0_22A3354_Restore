@implementation HDCodableMetadataKeyValuePair

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)setNumberIntValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberIntValue = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_8:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_9:
  if (self->_quantityValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_quantityValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
}

- (void)setNumberDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberDoubleValue = a3;
}

- (void)setQuantityValue:(id)a3
{
  objc_storeStrong((id *)&self->_quantityValue, a3);
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasNumberDoubleValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasNumberIntValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int64_t)numberIntValue
{
  return self->_numberIntValue;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setDateValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateValue = a3;
}

- (void)setHasDateValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumberIntValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setHasNumberDoubleValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasQuantityValue
{
  return self->_quantityValue != 0;
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
  v8.super_class = (Class)HDCodableMetadataKeyValuePair;
  -[HDCodableMetadataKeyValuePair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMetadataKeyValuePair dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *stringValue;
  char has;
  void *v8;
  HDCodableQuantity *quantityValue;
  void *v10;
  NSData *dataValue;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v4, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateValue);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("dateValue"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numberIntValue);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("numberIntValue"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_numberDoubleValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("numberDoubleValue"));

  }
LABEL_9:
  quantityValue = self->_quantityValue;
  if (quantityValue)
  {
    -[HDCodableQuantity dictionaryRepresentation](quantityValue, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("quantityValue"));

  }
  dataValue = self->_dataValue;
  if (dataValue)
    objc_msgSend(v4, "setObject:forKey:", dataValue, CFSTR("dataValue"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMetadataKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  if (self->_stringValue)
  {
    objc_msgSend(v6, "setStringValue:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_dateValue;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 3) = self->_numberIntValue;
  *((_BYTE *)v4 + 64) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_numberDoubleValue;
    *((_BYTE *)v4 + 64) |= 2u;
  }
LABEL_9:
  if (self->_quantityValue)
  {
    objc_msgSend(v6, "setQuantityValue:");
    v4 = v6;
  }
  if (self->_dataValue)
  {
    objc_msgSend(v6, "setDataValue:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 24) = self->_numberIntValue;
    *(_BYTE *)(v5 + 64) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_dateValue;
  *(_BYTE *)(v5 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_numberDoubleValue;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
LABEL_5:
  v11 = -[HDCodableQuantity copyWithZone:](self->_quantityValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[NSData copyWithZone:](self->_dataValue, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *stringValue;
  HDCodableQuantity *quantityValue;
  NSData *dataValue;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_25;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_dateValue != *((double *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_numberIntValue != *((_QWORD *)v4 + 3))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_numberDoubleValue != *((double *)v4 + 2))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_25;
  }
  quantityValue = self->_quantityValue;
  if ((unint64_t)quantityValue | *((_QWORD *)v4 + 6)
    && !-[HDCodableQuantity isEqual:](quantityValue, "isEqual:"))
  {
    goto LABEL_25;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((_QWORD *)v4 + 4))
    v9 = -[NSData isEqual:](dataValue, "isEqual:");
  else
    v9 = 1;
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double dateValue;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;
  double numberDoubleValue;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_stringValue, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    dateValue = self->_dateValue;
    v8 = -dateValue;
    if (dateValue >= 0.0)
      v8 = self->_dateValue;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 4) != 0)
  {
    v11 = 2654435761 * self->_numberIntValue;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_16:
    v16 = 0;
    goto LABEL_19;
  }
  v11 = 0;
  if ((has & 2) == 0)
    goto LABEL_16;
LABEL_11:
  numberDoubleValue = self->_numberDoubleValue;
  v13 = -numberDoubleValue;
  if (numberDoubleValue >= 0.0)
    v13 = self->_numberDoubleValue;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0)
      v16 += (unint64_t)v15;
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_19:
  v17 = v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ -[HDCodableQuantity hash](self->_quantityValue, "hash");
  return v17 ^ -[NSData hash](self->_dataValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  HDCodableQuantity *quantityValue;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableMetadataKeyValuePair setKey:](self, "setKey:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCodableMetadataKeyValuePair setStringValue:](self, "setStringValue:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 1) != 0)
  {
    self->_dateValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 64);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_numberIntValue = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
LABEL_8:
    self->_numberDoubleValue = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_9:
  quantityValue = self->_quantityValue;
  v7 = *((_QWORD *)v4 + 6);
  if (quantityValue)
  {
    if (!v7)
      goto LABEL_18;
    -[HDCodableQuantity mergeFrom:](quantityValue, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_18;
    -[HDCodableMetadataKeyValuePair setQuantityValue:](self, "setQuantityValue:");
  }
  v4 = v8;
LABEL_18:
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableMetadataKeyValuePair setDataValue:](self, "setDataValue:");
    v4 = v8;
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

- (double)dateValue
{
  return self->_dateValue;
}

- (double)numberDoubleValue
{
  return self->_numberDoubleValue;
}

- (HDCodableQuantity)quantityValue
{
  return self->_quantityValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

@end
