@implementation FPSearchableItemValue

- (BOOL)readFrom:(id)a3
{
  return FPSearchableItemValueReadFrom((uint64_t)self, (uint64_t)a3);
}

+ (id)stringFromObject:(id)a3
{
  id v3;
  FPSearchableItemValue *v4;
  FPSearchableItemValue *v5;
  void (**v6)(_QWORD);
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  FPSearchableItemValue *v16;

  v3 = a3;
  v4 = objc_alloc_init(FPSearchableItemValue);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__FPSearchableItemValue_Helpers__stringFromObject___block_invoke;
  v15[3] = &unk_1E444D0F8;
  v5 = v4;
  v16 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1A1B00850](v15);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_retainAutorelease(v3);
    v8 = (const char *)objc_msgSend(v7, "objCType");
    if (!strcmp(v8, "f") || !strcmp(v8, "d"))
    {
      objc_msgSend(v7, "doubleValue");
      -[FPSearchableItemValue setDoubleValue:](v5, "setDoubleValue:");
    }
    else
    {
      -[FPSearchableItemValue setIntegerValue:](v5, "setIntegerValue:", objc_msgSend(v7, "longLongValue"));
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FPSearchableItemValue setStringValue:](v5, "setStringValue:", v3);
LABEL_12:
    v6[2](v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    -[FPSearchableItemValue setTimeIntervalSinceReferenceDateValue:](v5, "setTimeIntervalSinceReferenceDateValue:");
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPSearchableItemValue setNameComponents:](v5, "setNameComponents:", v9);

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (+[FPSearchableItemValue stringArrayFromObject:](FPSearchableItemValue, "stringArrayFromObject:", v3), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v12);
    -[FPSearchableItemValue setArrayOfStringsValues:](v5, "setArrayOfStringsValues:", v14);
    v6[2](v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

id __51__FPSearchableItemValue_Helpers__stringFromObject___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (void)setIntegerValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_integerValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_arrayOfStringsValues, 0);
}

+ (id)objectFromString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  FPSearchableItemValue *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  v6 = -[FPSearchableItemValue initWithData:]([FPSearchableItemValue alloc], "initWithData:", v5);
  if (-[FPSearchableItemValue hasDoubleValue](v6, "hasDoubleValue"))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[FPSearchableItemValue doubleValue](v6, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v13 = (void *)v8;
    goto LABEL_14;
  }
  if (-[FPSearchableItemValue hasStringValue](v6, "hasStringValue"))
  {
    -[FPSearchableItemValue stringValue](v6, "stringValue");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (-[FPSearchableItemValue hasIntegerValue](v6, "hasIntegerValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[FPSearchableItemValue integerValue](v6, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (-[FPSearchableItemValue hasTimeIntervalSinceReferenceDateValue](v6, "hasTimeIntervalSinceReferenceDateValue"))
  {
    v9 = (void *)MEMORY[0x1E0C99D68];
    -[FPSearchableItemValue timeIntervalSinceReferenceDateValue](v6, "timeIntervalSinceReferenceDateValue");
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!-[FPSearchableItemValue hasNameComponents](v6, "hasNameComponents"))
  {
    if (!-[FPSearchableItemValue arrayOfStringsValuesCount](v6, "arrayOfStringsValuesCount"))
    {
      v13 = 0;
      goto LABEL_14;
    }
    -[FPSearchableItemValue arrayOfStringsValues](v6, "arrayOfStringsValues");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x1E0CB3710];
  v11 = objc_opt_class();
  -[FPSearchableItemValue nameComponents](v6, "nameComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v13;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (BOOL)hasIntegerValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteDoubleField();
LABEL_7:
  if (self->_nameComponents)
    PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_arrayOfStringsValues;
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
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (id)stringArrayFromObject:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          fp_current_or_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            +[FPSearchableItemValue(Helpers) stringArrayFromObject:].cold.1(v8, v10);

          v9 = 0;
          goto LABEL_13;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  v9 = v3;
LABEL_13:

  return v9;
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

- (void)setHasIntegerValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setTimeIntervalSinceReferenceDateValue:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timeIntervalSinceReferenceDateValue = a3;
}

- (void)setHasTimeIntervalSinceReferenceDateValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeIntervalSinceReferenceDateValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasNameComponents
{
  return self->_nameComponents != 0;
}

- (void)clearArrayOfStringsValues
{
  -[NSMutableArray removeAllObjects](self->_arrayOfStringsValues, "removeAllObjects");
}

- (void)addArrayOfStringsValue:(id)a3
{
  id v4;
  NSMutableArray *arrayOfStringsValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  arrayOfStringsValues = self->_arrayOfStringsValues;
  v8 = v4;
  if (!arrayOfStringsValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_arrayOfStringsValues;
    self->_arrayOfStringsValues = v6;

    v4 = v8;
    arrayOfStringsValues = self->_arrayOfStringsValues;
  }
  -[NSMutableArray addObject:](arrayOfStringsValues, "addObject:", v4);

}

- (unint64_t)arrayOfStringsValuesCount
{
  return -[NSMutableArray count](self->_arrayOfStringsValues, "count");
}

- (id)arrayOfStringsValueAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_arrayOfStringsValues, "objectAtIndex:", a3);
}

+ (Class)arrayOfStringsValueType
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
  v8.super_class = (Class)FPSearchableItemValue;
  -[FPSearchableItemValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSearchableItemValue dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *nameComponents;
  NSMutableArray *arrayOfStringsValues;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("doubleValue"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_integerValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("integerValue"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeIntervalSinceReferenceDateValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("timeIntervalSinceReferenceDateValue"));

  }
LABEL_7:
  nameComponents = self->_nameComponents;
  if (nameComponents)
    objc_msgSend(v4, "setObject:forKey:", nameComponents, CFSTR("nameComponents"));
  arrayOfStringsValues = self->_arrayOfStringsValues;
  if (arrayOfStringsValues)
    objc_msgSend(v4, "setObject:forKey:", arrayOfStringsValues, CFSTR("arrayOfStringsValue"));
  return v4;
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
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = self->_integerValue;
  *((_BYTE *)v4 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_timeIntervalSinceReferenceDateValue;
    *((_BYTE *)v4 + 56) |= 4u;
  }
LABEL_7:
  if (self->_nameComponents)
    objc_msgSend(v10, "setNameComponents:");
  if (-[FPSearchableItemValue arrayOfStringsValuesCount](self, "arrayOfStringsValuesCount"))
  {
    objc_msgSend(v10, "clearArrayOfStringsValues");
    v6 = -[FPSearchableItemValue arrayOfStringsValuesCount](self, "arrayOfStringsValuesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[FPSearchableItemValue arrayOfStringsValueAtIndex:](self, "arrayOfStringsValueAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addArrayOfStringsValue:", v9);

      }
    }
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_doubleValue;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_integerValue;
  *(_BYTE *)(v5 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(double *)(v5 + 24) = self->_timeIntervalSinceReferenceDateValue;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
LABEL_5:
  v9 = -[NSData copyWithZone:](self->_nameComponents, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_arrayOfStringsValues;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addArrayOfStringsValue:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stringValue;
  NSData *nameComponents;
  NSMutableArray *arrayOfStringsValues;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_integerValue != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_timeIntervalSinceReferenceDateValue != *((double *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  nameComponents = self->_nameComponents;
  if ((unint64_t)nameComponents | *((_QWORD *)v4 + 5)
    && !-[NSData isEqual:](nameComponents, "isEqual:"))
  {
    goto LABEL_23;
  }
  arrayOfStringsValues = self->_arrayOfStringsValues;
  if ((unint64_t)arrayOfStringsValues | *((_QWORD *)v4 + 4))
    v8 = -[NSMutableArray isEqual:](arrayOfStringsValues, "isEqual:");
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
  double doubleValue;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  double timeIntervalSinceReferenceDateValue;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;

  v3 = -[NSString hash](self->_stringValue, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    doubleValue = self->_doubleValue;
    v7 = -doubleValue;
    if (doubleValue >= 0.0)
      v7 = self->_doubleValue;
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
    v10 = 2654435761 * self->_integerValue;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_16:
    v15 = 0;
    goto LABEL_19;
  }
  v10 = 0;
  if ((has & 4) == 0)
    goto LABEL_16;
LABEL_11:
  timeIntervalSinceReferenceDateValue = self->_timeIntervalSinceReferenceDateValue;
  v12 = -timeIntervalSinceReferenceDateValue;
  if (timeIntervalSinceReferenceDateValue >= 0.0)
    v12 = self->_timeIntervalSinceReferenceDateValue;
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
  v16 = v5 ^ v3 ^ v10 ^ v15 ^ -[NSData hash](self->_nameComponents, "hash");
  return v16 ^ -[NSMutableArray hash](self->_arrayOfStringsValues, "hash");
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[FPSearchableItemValue setStringValue:](self, "setStringValue:");
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_doubleValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_integerValue = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_6:
    self->_timeIntervalSinceReferenceDateValue = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 5))
    -[FPSearchableItemValue setNameComponents:](self, "setNameComponents:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[FPSearchableItemValue addArrayOfStringsValue:](self, "addArrayOfStringsValue:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (double)timeIntervalSinceReferenceDateValue
{
  return self->_timeIntervalSinceReferenceDateValue;
}

- (NSData)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_nameComponents, a3);
}

- (NSMutableArray)arrayOfStringsValues
{
  return self->_arrayOfStringsValues;
}

- (void)setArrayOfStringsValues:(id)a3
{
  objc_storeStrong((id *)&self->_arrayOfStringsValues, a3);
}

@end
