@implementation HDCodableTimestampedKeyValuePair

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)setValue:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "hk_hasFloatingPointValue"))
    {
      objc_msgSend(v5, "doubleValue");
      -[HDCodableTimestampedKeyValuePair setNumberDoubleValue:](self, "setNumberDoubleValue:");
    }
    else
    {
      -[HDCodableTimestampedKeyValuePair setNumberIntValue:](self, "setNumberIntValue:", objc_msgSend(v5, "longLongValue"));
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(v5, "copy");
    -[HDCodableTimestampedKeyValuePair setStringValue:](self, "setStringValue:", v4);
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(v5, "copy");
    -[HDCodableTimestampedKeyValuePair setBytesValue:](self, "setBytesValue:", v4);
    goto LABEL_9;
  }
  if (v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid value %@ of class %@"), v5, objc_opt_class());
LABEL_10:

}

- (void)setNumberDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberDoubleValue = a3;
}

- (void)setTimestampWithDate:(id)a3
{
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  -[HDCodableTimestampedKeyValuePair setTimestamp:](self, "setTimestamp:");
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
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
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bytesValue)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
}

- (void)setNumberIntValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberIntValue = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
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

- (void)setHasNumberIntValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberIntValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumberDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
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
  v8.super_class = (Class)HDCodableTimestampedKeyValuePair;
  -[HDCodableTimestampedKeyValuePair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTimestampedKeyValuePair dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v7;
  NSString *stringValue;
  NSData *bytesValue;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numberIntValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("numberIntValue"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_numberDoubleValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("numberDoubleValue"));

  }
LABEL_7:
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v4, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  bytesValue = self->_bytesValue;
  if (bytesValue)
    objc_msgSend(v4, "setObject:forKey:", bytesValue, CFSTR("bytesValue"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTimestampedKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
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
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 56) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = self->_numberIntValue;
  *((_BYTE *)v4 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_numberDoubleValue;
    *((_BYTE *)v4 + 56) |= 1u;
  }
LABEL_7:
  if (self->_stringValue)
  {
    objc_msgSend(v6, "setStringValue:");
    v4 = v6;
  }
  if (self->_bytesValue)
  {
    objc_msgSend(v6, "setBytesValue:");
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
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 16) = self->_numberIntValue;
    *(_BYTE *)(v5 + 56) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v5 + 24) = self->_timestamp;
  *(_BYTE *)(v5 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_numberDoubleValue;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSData copyWithZone:](self->_bytesValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *stringValue;
  NSData *bytesValue;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_timestamp != *((double *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_numberIntValue != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_numberDoubleValue != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_23;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](stringValue, "isEqual:"))
  {
    goto LABEL_23;
  }
  bytesValue = self->_bytesValue;
  if ((unint64_t)bytesValue | *((_QWORD *)v4 + 4))
    v8 = -[NSData isEqual:](bytesValue, "isEqual:");
  else
    v8 = 1;
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double timestamp;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  double numberDoubleValue;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  NSUInteger v16;

  v3 = -[NSString hash](self->_key, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    timestamp = self->_timestamp;
    v7 = -timestamp;
    if (timestamp >= 0.0)
      v7 = self->_timestamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
  {
    v10 = 2654435761 * self->_numberIntValue;
    if ((has & 1) != 0)
      goto LABEL_11;
LABEL_16:
    v15 = 0;
    goto LABEL_19;
  }
  v10 = 0;
  if ((has & 1) == 0)
    goto LABEL_16;
LABEL_11:
  numberDoubleValue = self->_numberDoubleValue;
  v12 = -numberDoubleValue;
  if (numberDoubleValue >= 0.0)
    v12 = self->_numberDoubleValue;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_19:
  v16 = v5 ^ v3 ^ v10 ^ v15 ^ -[NSString hash](self->_stringValue, "hash");
  return v16 ^ -[NSData hash](self->_bytesValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableTimestampedKeyValuePair setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_numberIntValue = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_6:
    self->_numberDoubleValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableTimestampedKeyValuePair setStringValue:](self, "setStringValue:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableTimestampedKeyValuePair setBytesValue:](self, "setBytesValue:");
    v4 = v6;
  }

}

- (NSString)key
{
  return self->_key;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)numberIntValue
{
  return self->_numberIntValue;
}

- (double)numberDoubleValue
{
  return self->_numberDoubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void)setBytesValue:(id)a3
{
  objc_storeStrong((id *)&self->_bytesValue, a3);
}

- (HDCodableTimestampedKeyValuePair)initWithKey:(id)a3 value:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDCodableTimestampedKeyValuePair *v11;
  HDCodableTimestampedKeyValuePair *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDCodableTimestampedKeyValuePair;
  v11 = -[HDCodableTimestampedKeyValuePair init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[HDCodableTimestampedKeyValuePair setKey:](v11, "setKey:", v8);
    -[HDCodableTimestampedKeyValuePair setValue:](v12, "setValue:", v9);
    -[HDCodableTimestampedKeyValuePair setTimestampWithDate:](v12, "setTimestampWithDate:", v10);
  }

  return v12;
}

- (id)decodedValue
{
  NSData *stringValue;
  void *v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_numberDoubleValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_numberIntValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  stringValue = (NSData *)self->_stringValue;
  if (stringValue)
    return stringValue;
  stringValue = self->_bytesValue;
  if (stringValue)
    return stringValue;
  else
    return 0;
}

- (id)decodedTimestamp
{
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return 0;
  HDDecodeDateForValue();
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
