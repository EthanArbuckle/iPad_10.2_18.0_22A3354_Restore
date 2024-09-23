@implementation FCCKPRecordFieldValue

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 1;
}

- (NSMutableArray)listValues
{
  return self->_listValues;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)signedValue
{
  return self->_signedValue;
}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (FCCKPDate)dateValue
{
  return self->_dateValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_referenceValue, 0);
  objc_storeStrong((id *)&self->_listValues, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
}

- (void)addListValue:(id)a3
{
  id v4;
  NSMutableArray *listValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  listValues = self->_listValues;
  v8 = v4;
  if (!listValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_listValues;
    self->_listValues = v6;

    v4 = v8;
    listValues = self->_listValues;
  }
  -[NSMutableArray addObject:](listValues, "addObject:", v4);

}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setSignedValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_signedValue = a3;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
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
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bytesValue)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_dateValue)
    PBDataWriterWriteSubmessage();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  if (self->_referenceValue)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_listValues;
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

}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
}

- (void)setHasSignedValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignedValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasReferenceValue
{
  return self->_referenceValue != 0;
}

- (void)clearListValues
{
  -[NSMutableArray removeAllObjects](self->_listValues, "removeAllObjects");
}

- (unint64_t)listValuesCount
{
  return -[NSMutableArray count](self->_listValues, "count");
}

- (id)listValueAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_listValues, "objectAtIndex:", a3);
}

+ (Class)listValueType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)FCCKPRecordFieldValue;
  -[FCCKPRecordFieldValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecordFieldValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *bytesValue;
  char has;
  void *v7;
  void *v8;
  FCCKPDate *dateValue;
  void *v10;
  NSString *stringValue;
  FCCKPRecordReference *referenceValue;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  bytesValue = self->_bytesValue;
  if (bytesValue)
    objc_msgSend(v3, "setObject:forKey:", bytesValue, CFSTR("bytesValue"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_signedValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("signedValue"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("doubleValue"));

  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    -[FCCKPDate dictionaryRepresentation](dateValue, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("dateValue"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  referenceValue = self->_referenceValue;
  if (referenceValue)
  {
    -[FCCKPRecordReference dictionaryRepresentation](referenceValue, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("referenceValue"));

  }
  if (-[NSMutableArray count](self->_listValues, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_listValues, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_listValues;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("listValue"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordFieldValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_type;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v7 = -[NSData copyWithZone:](self->_bytesValue, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_signedValue;
    *(_BYTE *)(v6 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_doubleValue;
    *(_BYTE *)(v6 + 68) |= 1u;
  }
  v10 = -[FCCKPDate copyWithZone:](self->_dateValue, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v12;

  v14 = -[FCCKPRecordReference copyWithZone:](self->_referenceValue, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_listValues;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v6, "addListValue:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSData *bytesValue;
  FCCKPDate *dateValue;
  NSString *stringValue;
  FCCKPRecordReference *referenceValue;
  NSMutableArray *listValues;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 68);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_type != *((_DWORD *)v4 + 16))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_28;
  }
  bytesValue = self->_bytesValue;
  if ((unint64_t)bytesValue | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](bytesValue, "isEqual:"))
    {
LABEL_28:
      v12 = 0;
      goto LABEL_29;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_signedValue != *((_QWORD *)v4 + 2))
      goto LABEL_28;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_28;
  }
  dateValue = self->_dateValue;
  if ((unint64_t)dateValue | *((_QWORD *)v4 + 4) && !-[FCCKPDate isEqual:](dateValue, "isEqual:"))
    goto LABEL_28;
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_28;
  }
  referenceValue = self->_referenceValue;
  if ((unint64_t)referenceValue | *((_QWORD *)v4 + 6))
  {
    if (!-[FCCKPRecordReference isEqual:](referenceValue, "isEqual:"))
      goto LABEL_28;
  }
  listValues = self->_listValues;
  if ((unint64_t)listValues | *((_QWORD *)v4 + 5))
    v12 = -[NSMutableArray isEqual:](listValues, "isEqual:");
  else
    v12 = 1;
LABEL_29:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double doubleValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_bytesValue, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_signedValue;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_11:
    v10 = 0;
    goto LABEL_14;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_6:
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
LABEL_14:
  v11 = v4 ^ v3 ^ v5 ^ v10 ^ -[FCCKPDate hash](self->_dateValue, "hash");
  v12 = -[NSString hash](self->_stringValue, "hash");
  v13 = v12 ^ -[FCCKPRecordReference hash](self->_referenceValue, "hash");
  return v11 ^ v13 ^ -[NSMutableArray hash](self->_listValues, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  FCCKPDate *dateValue;
  void *v8;
  FCCKPRecordReference *referenceValue;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[17] & 4) != 0)
  {
    self->_type = v4[16];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 3))
    -[FCCKPRecordFieldValue setBytesValue:](self, "setBytesValue:");
  v6 = *((_BYTE *)v5 + 68);
  if ((v6 & 2) != 0)
  {
    self->_signedValue = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v5 + 68);
  }
  if ((v6 & 1) != 0)
  {
    self->_doubleValue = *((double *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  dateValue = self->_dateValue;
  v8 = (void *)*((_QWORD *)v5 + 4);
  if (dateValue)
  {
    if (v8)
      -[FCCKPDate mergeFrom:]((uint64_t)dateValue, v8);
  }
  else if (v8)
  {
    -[FCCKPRecordFieldValue setDateValue:](self, "setDateValue:", *((_QWORD *)v5 + 4));
  }
  if (*((_QWORD *)v5 + 7))
    -[FCCKPRecordFieldValue setStringValue:](self, "setStringValue:");
  referenceValue = self->_referenceValue;
  v10 = *((_QWORD *)v5 + 6);
  if (referenceValue)
  {
    if (v10)
      -[FCCKPRecordReference mergeFrom:](referenceValue, "mergeFrom:");
  }
  else if (v10)
  {
    -[FCCKPRecordFieldValue setReferenceValue:](self, "setReferenceValue:");
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v5 + 5);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[FCCKPRecordFieldValue addListValue:](self, "addListValue:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)setBytesValue:(id)a3
{
  objc_storeStrong((id *)&self->_bytesValue, a3);
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
}

- (FCCKPRecordReference)referenceValue
{
  return self->_referenceValue;
}

- (void)setReferenceValue:(id)a3
{
  objc_storeStrong((id *)&self->_referenceValue, a3);
}

- (void)setListValues:(id)a3
{
  objc_storeStrong((id *)&self->_listValues, a3);
}

@end
