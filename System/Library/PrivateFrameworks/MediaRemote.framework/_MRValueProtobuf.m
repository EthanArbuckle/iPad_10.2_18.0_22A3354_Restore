@implementation _MRValueProtobuf

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setInt64Value:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_int64Value = a3;
}

- (void)setHasInt64Value:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInt64Value
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFloatValue:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_floatValue = a3;
}

- (void)setHasFloatValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFloatValue
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

- (void)setBoolValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBoolValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (void)clearArrayValues
{
  -[NSMutableArray removeAllObjects](self->_arrayValues, "removeAllObjects");
}

- (void)addArrayValue:(id)a3
{
  id v4;
  NSMutableArray *arrayValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  arrayValues = self->_arrayValues;
  v8 = v4;
  if (!arrayValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_arrayValues;
    self->_arrayValues = v6;

    v4 = v8;
    arrayValues = self->_arrayValues;
  }
  -[NSMutableArray addObject:](arrayValues, "addObject:", v4);

}

- (unint64_t)arrayValuesCount
{
  return -[NSMutableArray count](self->_arrayValues, "count");
}

- (id)arrayValueAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_arrayValues, "objectAtIndex:", a3);
}

+ (Class)arrayValueType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)_MRValueProtobuf;
  -[_MRValueProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRValueProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *stringValue;
  char has;
  void *v8;
  NSData *dataValue;
  void *v10;
  NSString *dateValue;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  _MRDictionaryProtobuf *dictionaryValue;
  void *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_int64Value);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("int64Value"));

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
  *(float *)&v4 = self->_floatValue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("floatValue"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("doubleValue"));

  }
LABEL_7:
  dataValue = self->_dataValue;
  if (dataValue)
    objc_msgSend(v5, "setObject:forKey:", dataValue, CFSTR("dataValue"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_BOOLValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("BOOLValue"));

  }
  dateValue = self->_dateValue;
  if (dateValue)
    objc_msgSend(v5, "setObject:forKey:", dateValue, CFSTR("dateValue"));
  if (-[NSMutableArray count](self->_arrayValues, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_arrayValues, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = self->_arrayValues;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("arrayValue"));
  }
  dictionaryValue = self->_dictionaryValue;
  if (dictionaryValue)
  {
    -[_MRDictionaryProtobuf dictionaryRepresentation](dictionaryValue, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("dictionaryValue"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return _MRValueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
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
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_6:
    PBDataWriterWriteDoubleField();
LABEL_7:
  if (self->_dataValue)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_dateValue)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_arrayValues;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_dictionaryValue)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_int64Value;
    *((_BYTE *)v4 + 76) |= 2u;
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
  *((_DWORD *)v4 + 14) = LODWORD(self->_floatValue);
  *((_BYTE *)v4 + 76) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v4 + 76) |= 1u;
  }
LABEL_7:
  if (self->_dataValue)
  {
    objc_msgSend(v10, "setDataValue:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_BOOLValue;
    *((_BYTE *)v4 + 76) |= 8u;
  }
  if (self->_dateValue)
    objc_msgSend(v10, "setDateValue:");
  if (-[_MRValueProtobuf arrayValuesCount](self, "arrayValuesCount"))
  {
    objc_msgSend(v10, "clearArrayValues");
    v6 = -[_MRValueProtobuf arrayValuesCount](self, "arrayValuesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[_MRValueProtobuf arrayValueAtIndex:](self, "arrayValueAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addArrayValue:", v9);

      }
    }
  }
  if (self->_dictionaryValue)
    objc_msgSend(v10, "setDictionaryValue:");

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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_int64Value;
    *(_BYTE *)(v5 + 76) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 56) = self->_floatValue;
  *(_BYTE *)(v5 + 76) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_doubleValue;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
LABEL_5:
  v9 = -[NSData copyWithZone:](self->_dataValue, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_BOOLValue;
    *(_BYTE *)(v5 + 76) |= 8u;
  }
  v11 = -[NSString copyWithZone:](self->_dateValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = self->_arrayValues;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addArrayValue:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  v19 = -[_MRDictionaryProtobuf copyWithZone:](self->_dictionaryValue, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stringValue;
  char has;
  NSData *dataValue;
  NSString *dateValue;
  NSMutableArray *arrayValues;
  _MRDictionaryProtobuf *dictionaryValue;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_36;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_int64Value != *((_QWORD *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_floatValue != *((float *)v4 + 14))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_36;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](dataValue, "isEqual:"))
      goto LABEL_36;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_36;
        goto LABEL_30;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_30;
    }
LABEL_36:
    v11 = 0;
    goto LABEL_37;
  }
  if ((*((_BYTE *)v4 + 76) & 8) != 0)
    goto LABEL_36;
LABEL_30:
  dateValue = self->_dateValue;
  if ((unint64_t)dateValue | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](dateValue, "isEqual:"))
    goto LABEL_36;
  arrayValues = self->_arrayValues;
  if ((unint64_t)arrayValues | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](arrayValues, "isEqual:"))
      goto LABEL_36;
  }
  dictionaryValue = self->_dictionaryValue;
  if ((unint64_t)dictionaryValue | *((_QWORD *)v4 + 6))
    v11 = -[_MRDictionaryProtobuf isEqual:](dictionaryValue, "isEqual:");
  else
    v11 = 1;
LABEL_37:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  float floatValue;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  double doubleValue;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;

  v3 = -[NSString hash](self->_stringValue, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = 2654435761 * self->_int64Value;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_3:
  floatValue = self->_floatValue;
  v7 = -floatValue;
  if (floatValue >= 0.0)
    v7 = self->_floatValue;
  v8 = floorf(v7 + 0.5);
  v9 = (float)(v7 - v8) * 1.8447e19;
  v10 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabsf(v9);
  }
LABEL_11:
  if ((has & 1) != 0)
  {
    doubleValue = self->_doubleValue;
    v13 = -doubleValue;
    if (doubleValue >= 0.0)
      v13 = self->_doubleValue;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = -[NSData hash](self->_dataValue, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v17 = 2654435761 * self->_BOOLValue;
  else
    v17 = 0;
  v18 = v5 ^ v3 ^ v10 ^ v11 ^ v16;
  v19 = v17 ^ -[NSString hash](self->_dateValue, "hash");
  v20 = v18 ^ v19 ^ -[NSMutableArray hash](self->_arrayValues, "hash");
  return v20 ^ -[_MRDictionaryProtobuf hash](self->_dictionaryValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _MRDictionaryProtobuf *dictionaryValue;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[_MRValueProtobuf setStringValue:](self, "setStringValue:");
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_int64Value = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 76);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_floatValue = *((float *)v4 + 14);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_6:
    self->_doubleValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 4))
    -[_MRValueProtobuf setDataValue:](self, "setDataValue:");
  if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    self->_BOOLValue = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 5))
    -[_MRValueProtobuf setDateValue:](self, "setDateValue:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *((id *)v4 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[_MRValueProtobuf addArrayValue:](self, "addArrayValue:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  dictionaryValue = self->_dictionaryValue;
  v12 = *((_QWORD *)v4 + 6);
  if (dictionaryValue)
  {
    if (v12)
      -[_MRDictionaryProtobuf mergeFrom:](dictionaryValue, "mergeFrom:");
  }
  else if (v12)
  {
    -[_MRValueProtobuf setDictionaryValue:](self, "setDictionaryValue:");
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

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (float)floatValue
{
  return self->_floatValue;
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

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
}

- (NSMutableArray)arrayValues
{
  return self->_arrayValues;
}

- (void)setArrayValues:(id)a3
{
  objc_storeStrong((id *)&self->_arrayValues, a3);
}

- (_MRDictionaryProtobuf)dictionaryValue
{
  return self->_dictionaryValue;
}

- (void)setDictionaryValue:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_arrayValues, 0);
}

@end
