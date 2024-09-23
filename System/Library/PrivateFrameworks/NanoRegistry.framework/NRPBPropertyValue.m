@implementation NRPBPropertyValue

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasNumberValue
{
  return self->_numberValue != 0;
}

- (BOOL)hasUUIDValue
{
  return self->_uUIDValue != 0;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasSizeValue
{
  return self->_sizeValue != 0;
}

- (BOOL)hasDictionaryKey
{
  return self->_dictionaryKey != 0;
}

- (void)clearArrayValues
{
  -[NSMutableArray removeAllObjects](self->_arrayValues, "removeAllObjects");
}

- (void)addArrayValues:(id)a3
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

- (id)arrayValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_arrayValues, "objectAtIndex:", a3);
}

+ (Class)arrayValuesType
{
  return (Class)objc_opt_class();
}

- (void)setIsSet:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isSet = a3;
}

- (void)setHasIsSet:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsSet
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsSecurePropertyValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isSecurePropertyValue = a3;
}

- (void)setHasIsSecurePropertyValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsSecurePropertyValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsDate:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isDate = a3;
}

- (void)setHasIsDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsError:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isError = a3;
}

- (void)setHasIsError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsError
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsMiniUUIDSet:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isMiniUUIDSet = a3;
}

- (void)setHasIsMiniUUIDSet:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsMiniUUIDSet
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NRPBPropertyValue;
  -[NRPBPropertyValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBPropertyValue dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NRPBNumber *numberValue;
  void *v7;
  NSData *uUIDValue;
  NSData *dataValue;
  NRPBSize *sizeValue;
  void *v11;
  NRPBPropertyValue *dictionaryKey;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char has;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  numberValue = self->_numberValue;
  if (numberValue)
  {
    -[NRPBNumber dictionaryRepresentation](numberValue, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("numberValue"));

  }
  uUIDValue = self->_uUIDValue;
  if (uUIDValue)
    objc_msgSend(v4, "setObject:forKey:", uUIDValue, CFSTR("UUIDValue"));
  dataValue = self->_dataValue;
  if (dataValue)
    objc_msgSend(v4, "setObject:forKey:", dataValue, CFSTR("dataValue"));
  sizeValue = self->_sizeValue;
  if (sizeValue)
  {
    -[NRPBSize dictionaryRepresentation](sizeValue, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("sizeValue"));

  }
  dictionaryKey = self->_dictionaryKey;
  if (dictionaryKey)
  {
    -[NRPBPropertyValue dictionaryRepresentation](dictionaryKey, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("dictionaryKey"));

  }
  if (-[NSMutableArray count](self->_arrayValues, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_arrayValues, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = self->_arrayValues;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("arrayValues"));
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSet);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("isSet"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_24:
      if ((has & 1) == 0)
        goto LABEL_25;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSecurePropertyValue, (_QWORD)v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("isSecurePropertyValue"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_25:
    if ((has & 2) == 0)
      goto LABEL_26;
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isError, (_QWORD)v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("isError"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_27;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDate, (_QWORD)v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("isDate"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_32;
LABEL_26:
  if ((has & 4) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMiniUUIDSet, (_QWORD)v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("isMiniUUIDSet"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBPropertyValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
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
  if (self->_numberValue)
    PBDataWriterWriteSubmessage();
  if (self->_uUIDValue)
    PBDataWriterWriteDataField();
  if (self->_dataValue)
    PBDataWriterWriteDataField();
  if (self->_sizeValue)
    PBDataWriterWriteSubmessage();
  if (self->_dictionaryKey)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_arrayValues;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_22:
      if ((has & 1) == 0)
        goto LABEL_23;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_23:
    if ((has & 2) == 0)
      goto LABEL_24;
LABEL_30:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_30;
LABEL_24:
  if ((has & 4) != 0)
LABEL_25:
    PBDataWriterWriteBOOLField();
LABEL_26:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  _BYTE *v9;

  v9 = a3;
  if (self->_stringValue)
    objc_msgSend(v9, "setStringValue:");
  if (self->_numberValue)
    objc_msgSend(v9, "setNumberValue:");
  if (self->_uUIDValue)
    objc_msgSend(v9, "setUUIDValue:");
  if (self->_dataValue)
    objc_msgSend(v9, "setDataValue:");
  if (self->_sizeValue)
    objc_msgSend(v9, "setSizeValue:");
  if (self->_dictionaryKey)
    objc_msgSend(v9, "setDictionaryKey:");
  if (-[NRPBPropertyValue arrayValuesCount](self, "arrayValuesCount"))
  {
    objc_msgSend(v9, "clearArrayValues");
    v4 = -[NRPBPropertyValue arrayValuesCount](self, "arrayValuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NRPBPropertyValue arrayValuesAtIndex:](self, "arrayValuesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addArrayValues:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v9[68] = self->_isSet;
    v9[72] |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_19:
      if ((has & 1) == 0)
        goto LABEL_20;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_19;
  }
  v9[67] = self->_isSecurePropertyValue;
  v9[72] |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_20:
    if ((has & 2) == 0)
      goto LABEL_21;
LABEL_27:
    v9[65] = self->_isError;
    v9[72] |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_26:
  v9[64] = self->_isDate;
  v9[72] |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_27;
LABEL_21:
  if ((has & 4) != 0)
  {
LABEL_22:
    v9[66] = self->_isMiniUUIDSet;
    v9[72] |= 4u;
  }
LABEL_23:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  char has;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NRPBNumber copyWithZone:](self->_numberValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSData copyWithZone:](self->_uUIDValue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSData copyWithZone:](self->_dataValue, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NRPBSize copyWithZone:](self->_sizeValue, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NRPBPropertyValue copyWithZone:](self->_dictionaryKey, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = self->_arrayValues;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend((id)v5, "addArrayValues:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v20);
  }

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 68) = self->_isSet;
    *(_BYTE *)(v5 + 72) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 67) = self->_isSecurePropertyValue;
  *(_BYTE *)(v5 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
LABEL_18:
    *(_BYTE *)(v5 + 65) = self->_isError;
    *(_BYTE *)(v5 + 72) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_13;
  }
LABEL_17:
  *(_BYTE *)(v5 + 64) = self->_isDate;
  *(_BYTE *)(v5 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_18;
LABEL_12:
  if ((has & 4) != 0)
  {
LABEL_13:
    *(_BYTE *)(v5 + 66) = self->_isMiniUUIDSet;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stringValue;
  NRPBNumber *numberValue;
  NSData *uUIDValue;
  NSData *dataValue;
  NRPBSize *sizeValue;
  NRPBPropertyValue *dictionaryKey;
  NSMutableArray *arrayValues;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_50;
  }
  numberValue = self->_numberValue;
  if ((unint64_t)numberValue | *((_QWORD *)v4 + 4))
  {
    if (!-[NRPBNumber isEqual:](numberValue, "isEqual:"))
      goto LABEL_50;
  }
  uUIDValue = self->_uUIDValue;
  if ((unint64_t)uUIDValue | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](uUIDValue, "isEqual:"))
      goto LABEL_50;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](dataValue, "isEqual:"))
      goto LABEL_50;
  }
  sizeValue = self->_sizeValue;
  if ((unint64_t)sizeValue | *((_QWORD *)v4 + 5))
  {
    if (!-[NRPBSize isEqual:](sizeValue, "isEqual:"))
      goto LABEL_50;
  }
  dictionaryKey = self->_dictionaryKey;
  if ((unint64_t)dictionaryKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NRPBPropertyValue isEqual:](dictionaryKey, "isEqual:"))
      goto LABEL_50;
  }
  arrayValues = self->_arrayValues;
  if ((unint64_t)arrayValues | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](arrayValues, "isEqual:"))
      goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0)
      goto LABEL_50;
    if (self->_isSet)
    {
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_50;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0)
      goto LABEL_50;
    if (self->_isSecurePropertyValue)
    {
      if (!*((_BYTE *)v4 + 67))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 67))
    {
      goto LABEL_50;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0)
      goto LABEL_50;
    if (self->_isDate)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_50;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0)
      goto LABEL_50;
    if (self->_isError)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_50;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_50;
  }
  v12 = (*((_BYTE *)v4 + 72) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) != 0)
    {
      if (self->_isMiniUUIDSet)
      {
        if (!*((_BYTE *)v4 + 66))
          goto LABEL_50;
      }
      else if (*((_BYTE *)v4 + 66))
      {
        goto LABEL_50;
      }
      v12 = 1;
      goto LABEL_51;
    }
LABEL_50:
    v12 = 0;
  }
LABEL_51:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = -[NSString hash](self->_stringValue, "hash");
  v4 = -[NRPBNumber hash](self->_numberValue, "hash");
  v5 = -[NSData hash](self->_uUIDValue, "hash");
  v6 = -[NSData hash](self->_dataValue, "hash");
  v7 = -[NRPBSize hash](self->_sizeValue, "hash");
  v8 = -[NRPBPropertyValue hash](self->_dictionaryKey, "hash");
  v9 = -[NSMutableArray hash](self->_arrayValues, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v10 = 2654435761 * self->_isSet;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v11 = 2654435761 * self->_isSecurePropertyValue;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v12 = 2654435761 * self->_isDate;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_9:
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v13 = 2654435761 * self->_isError;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_6:
  v14 = 2654435761 * self->_isMiniUUIDSet;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NRPBNumber *numberValue;
  uint64_t v6;
  NRPBSize *sizeValue;
  uint64_t v8;
  NRPBPropertyValue *dictionaryKey;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[NRPBPropertyValue setStringValue:](self, "setStringValue:");
  numberValue = self->_numberValue;
  v6 = *((_QWORD *)v4 + 4);
  if (numberValue)
  {
    if (v6)
      -[NRPBNumber mergeFrom:](numberValue, "mergeFrom:");
  }
  else if (v6)
  {
    -[NRPBPropertyValue setNumberValue:](self, "setNumberValue:");
  }
  if (*((_QWORD *)v4 + 7))
    -[NRPBPropertyValue setUUIDValue:](self, "setUUIDValue:");
  if (*((_QWORD *)v4 + 2))
    -[NRPBPropertyValue setDataValue:](self, "setDataValue:");
  sizeValue = self->_sizeValue;
  v8 = *((_QWORD *)v4 + 5);
  if (sizeValue)
  {
    if (v8)
      -[NRPBSize mergeFrom:](sizeValue, "mergeFrom:");
  }
  else if (v8)
  {
    -[NRPBPropertyValue setSizeValue:](self, "setSizeValue:");
  }
  dictionaryKey = self->_dictionaryKey;
  v10 = *((_QWORD *)v4 + 3);
  if (dictionaryKey)
  {
    if (v10)
      -[NRPBPropertyValue mergeFrom:](dictionaryKey, "mergeFrom:");
  }
  else if (v10)
  {
    -[NRPBPropertyValue setDictionaryKey:](self, "setDictionaryKey:");
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *((id *)v4 + 1);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[NRPBPropertyValue addArrayValues:](self, "addArrayValues:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  v16 = *((_BYTE *)v4 + 72);
  if ((v16 & 0x10) != 0)
  {
    self->_isSet = *((_BYTE *)v4 + 68);
    *(_BYTE *)&self->_has |= 0x10u;
    v16 = *((_BYTE *)v4 + 72);
    if ((v16 & 8) == 0)
    {
LABEL_31:
      if ((v16 & 1) == 0)
        goto LABEL_32;
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 8) == 0)
  {
    goto LABEL_31;
  }
  self->_isSecurePropertyValue = *((_BYTE *)v4 + 67);
  *(_BYTE *)&self->_has |= 8u;
  v16 = *((_BYTE *)v4 + 72);
  if ((v16 & 1) == 0)
  {
LABEL_32:
    if ((v16 & 2) == 0)
      goto LABEL_33;
LABEL_39:
    self->_isError = *((_BYTE *)v4 + 65);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 72) & 4) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_38:
  self->_isDate = *((_BYTE *)v4 + 64);
  *(_BYTE *)&self->_has |= 1u;
  v16 = *((_BYTE *)v4 + 72);
  if ((v16 & 2) != 0)
    goto LABEL_39;
LABEL_33:
  if ((v16 & 4) != 0)
  {
LABEL_34:
    self->_isMiniUUIDSet = *((_BYTE *)v4 + 66);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_35:

}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (NRPBNumber)numberValue
{
  return self->_numberValue;
}

- (void)setNumberValue:(id)a3
{
  objc_storeStrong((id *)&self->_numberValue, a3);
}

- (NSData)uUIDValue
{
  return self->_uUIDValue;
}

- (void)setUUIDValue:(id)a3
{
  objc_storeStrong((id *)&self->_uUIDValue, a3);
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

- (NRPBSize)sizeValue
{
  return self->_sizeValue;
}

- (void)setSizeValue:(id)a3
{
  objc_storeStrong((id *)&self->_sizeValue, a3);
}

- (NRPBPropertyValue)dictionaryKey
{
  return self->_dictionaryKey;
}

- (void)setDictionaryKey:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryKey, a3);
}

- (NSMutableArray)arrayValues
{
  return self->_arrayValues;
}

- (void)setArrayValues:(id)a3
{
  objc_storeStrong((id *)&self->_arrayValues, a3);
}

- (BOOL)isSet
{
  return self->_isSet;
}

- (BOOL)isSecurePropertyValue
{
  return self->_isSecurePropertyValue;
}

- (BOOL)isDate
{
  return self->_isDate;
}

- (BOOL)isError
{
  return self->_isError;
}

- (BOOL)isMiniUUIDSet
{
  return self->_isMiniUUIDSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uUIDValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_sizeValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_dictionaryKey, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_arrayValues, 0);
}

@end
