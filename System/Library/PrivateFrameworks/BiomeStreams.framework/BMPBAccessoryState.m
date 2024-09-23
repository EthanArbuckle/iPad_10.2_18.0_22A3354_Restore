@implementation BMPBAccessoryState

- (BOOL)hasMediaPropertyType
{
  return self->_mediaPropertyType != 0;
}

- (int)valueType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_valueType;
  else
    return 0;
}

- (void)setValueType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_valueType = a3;
}

- (void)setHasValueType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValueType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)valueTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2648D58[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsValueType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Data")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("String")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Num")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setNumValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numValue = a3;
}

- (void)setHasNumValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumValue
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)BMPBAccessoryState;
  -[BMPBAccessoryState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBAccessoryState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mediaPropertyType;
  uint64_t valueType;
  __CFString *v7;
  NSData *dataValue;
  NSString *stringValue;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mediaPropertyType = self->_mediaPropertyType;
  if (mediaPropertyType)
    objc_msgSend(v3, "setObject:forKey:", mediaPropertyType, CFSTR("mediaPropertyType"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    valueType = self->_valueType;
    if (valueType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_valueType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2648D58[valueType];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("valueType"));

  }
  dataValue = self->_dataValue;
  if (dataValue)
    objc_msgSend(v4, "setObject:forKey:", dataValue, CFSTR("dataValue"));
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v4, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_numValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("numValue"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAccessoryStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_mediaPropertyType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_mediaPropertyType)
  {
    objc_msgSend(v4, "setMediaPropertyType:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_valueType;
    *((_BYTE *)v4 + 44) |= 2u;
  }
  if (self->_dataValue)
  {
    objc_msgSend(v5, "setDataValue:");
    v4 = v5;
  }
  if (self->_stringValue)
  {
    objc_msgSend(v5, "setStringValue:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_numValue;
    *((_BYTE *)v4 + 44) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_mediaPropertyType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_valueType;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_dataValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_numValue;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mediaPropertyType;
  NSData *dataValue;
  NSString *stringValue;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  mediaPropertyType = self->_mediaPropertyType;
  if ((unint64_t)mediaPropertyType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](mediaPropertyType, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_valueType != *((_DWORD *)v4 + 10))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](dataValue, "isEqual:"))
    goto LABEL_17;
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_17;
  }
  v8 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_numValue != *((double *)v4 + 1))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  double numValue;
  double v9;
  long double v10;
  double v11;

  v3 = -[NSString hash](self->_mediaPropertyType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_valueType;
  else
    v4 = 0;
  v5 = -[NSData hash](self->_dataValue, "hash");
  v6 = -[NSString hash](self->_stringValue, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    numValue = self->_numValue;
    v9 = -numValue;
    if (numValue >= 0.0)
      v9 = self->_numValue;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBAccessoryState setMediaPropertyType:](self, "setMediaPropertyType:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    self->_valueType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBAccessoryState setDataValue:](self, "setDataValue:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBAccessoryState setStringValue:](self, "setStringValue:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_numValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)mediaPropertyType
{
  return self->_mediaPropertyType;
}

- (void)setMediaPropertyType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPropertyType, a3);
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (double)numValue
{
  return self->_numValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_mediaPropertyType, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end
