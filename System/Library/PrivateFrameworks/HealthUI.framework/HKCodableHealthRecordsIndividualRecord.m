@implementation HKCodableHealthRecordsIndividualRecord

- (void)clearCodes
{
  -[NSMutableArray removeAllObjects](self->_codes, "removeAllObjects");
}

- (void)addCode:(id)a3
{
  id v4;
  NSMutableArray *codes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  codes = self->_codes;
  v8 = v4;
  if (!codes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_codes;
    self->_codes = v6;

    v4 = v8;
    codes = self->_codes;
  }
  -[NSMutableArray addObject:](codes, "addObject:", v4);

}

- (unint64_t)codesCount
{
  return -[NSMutableArray count](self->_codes, "count");
}

- (id)codeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_codes, "objectAtIndex:", a3);
}

+ (Class)codeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRecordTitle
{
  return self->_recordTitle != 0;
}

- (void)setDateData:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateData = a3;
}

- (void)setHasDateData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateData
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearValueWithRanges
{
  -[NSMutableArray removeAllObjects](self->_valueWithRanges, "removeAllObjects");
}

- (void)addValueWithRange:(id)a3
{
  id v4;
  NSMutableArray *valueWithRanges;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  valueWithRanges = self->_valueWithRanges;
  v8 = v4;
  if (!valueWithRanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_valueWithRanges;
    self->_valueWithRanges = v6;

    v4 = v8;
    valueWithRanges = self->_valueWithRanges;
  }
  -[NSMutableArray addObject:](valueWithRanges, "addObject:", v4);

}

- (unint64_t)valueWithRangesCount
{
  return -[NSMutableArray count](self->_valueWithRanges, "count");
}

- (id)valueWithRangeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_valueWithRanges, "objectAtIndex:", a3);
}

+ (Class)valueWithRangeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTextualValue
{
  return self->_textualValue != 0;
}

- (BOOL)hasUcumUnitString
{
  return self->_ucumUnitString != 0;
}

- (BOOL)hasProviderURI
{
  return self->_providerURI != 0;
}

- (BOOL)hasRecordUUID
{
  return self->_recordUUID != 0;
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
  v8.super_class = (Class)HKCodableHealthRecordsIndividualRecord;
  -[HKCodableHealthRecordsIndividualRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableHealthRecordsIndividualRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSString *recordTitle;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSString *textualValue;
  NSString *ucumUnitString;
  NSString *providerURI;
  NSString *recordUUID;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_codes, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_codes, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = self->_codes;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("code"));
  }
  recordTitle = self->_recordTitle;
  if (recordTitle)
    objc_msgSend(v3, "setObject:forKey:", recordTitle, CFSTR("recordTitle"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateData);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("dateData"));

  }
  if (-[NSMutableArray count](self->_valueWithRanges, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_valueWithRanges, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = self->_valueWithRanges;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("valueWithRange"));
  }
  textualValue = self->_textualValue;
  if (textualValue)
    objc_msgSend(v3, "setObject:forKey:", textualValue, CFSTR("textualValue"));
  ucumUnitString = self->_ucumUnitString;
  if (ucumUnitString)
    objc_msgSend(v3, "setObject:forKey:", ucumUnitString, CFSTR("ucumUnitString"));
  providerURI = self->_providerURI;
  if (providerURI)
    objc_msgSend(v3, "setObject:forKey:", providerURI, CFSTR("providerURI"));
  recordUUID = self->_recordUUID;
  if (recordUUID)
    objc_msgSend(v3, "setObject:forKey:", recordUUID, CFSTR("recordUUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsIndividualRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_codes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (self->_recordTitle)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_valueWithRanges;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_textualValue)
    PBDataWriterWriteStringField();
  if (self->_ucumUnitString)
    PBDataWriterWriteStringField();
  if (self->_providerURI)
    PBDataWriterWriteStringField();
  if (self->_recordUUID)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[HKCodableHealthRecordsIndividualRecord codesCount](self, "codesCount"))
  {
    objc_msgSend(v13, "clearCodes");
    v4 = -[HKCodableHealthRecordsIndividualRecord codesCount](self, "codesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HKCodableHealthRecordsIndividualRecord codeAtIndex:](self, "codeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addCode:", v7);

      }
    }
  }
  if (self->_recordTitle)
    objc_msgSend(v13, "setRecordTitle:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v13 + 1) = *(_QWORD *)&self->_dateData;
    *((_BYTE *)v13 + 72) |= 1u;
  }
  if (-[HKCodableHealthRecordsIndividualRecord valueWithRangesCount](self, "valueWithRangesCount"))
  {
    objc_msgSend(v13, "clearValueWithRanges");
    v8 = -[HKCodableHealthRecordsIndividualRecord valueWithRangesCount](self, "valueWithRangesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HKCodableHealthRecordsIndividualRecord valueWithRangeAtIndex:](self, "valueWithRangeAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addValueWithRange:", v11);

      }
    }
  }
  if (self->_textualValue)
    objc_msgSend(v13, "setTextualValue:");
  v12 = v13;
  if (self->_ucumUnitString)
  {
    objc_msgSend(v13, "setUcumUnitString:");
    v12 = v13;
  }
  if (self->_providerURI)
  {
    objc_msgSend(v13, "setProviderURI:");
    v12 = v13;
  }
  if (self->_recordUUID)
  {
    objc_msgSend(v13, "setRecordUUID:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = self->_codes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCode:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_recordTitle, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_dateData;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_valueWithRanges;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend((id)v5, "addValueWithRange:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_textualValue, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  v22 = -[NSString copyWithZone:](self->_ucumUnitString, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v22;

  v24 = -[NSString copyWithZone:](self->_providerURI, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v24;

  v26 = -[NSString copyWithZone:](self->_recordUUID, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v26;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *codes;
  NSString *recordTitle;
  NSMutableArray *valueWithRanges;
  NSString *textualValue;
  NSString *ucumUnitString;
  NSString *providerURI;
  NSString *recordUUID;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  codes = self->_codes;
  if ((unint64_t)codes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](codes, "isEqual:"))
      goto LABEL_21;
  }
  recordTitle = self->_recordTitle;
  if ((unint64_t)recordTitle | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](recordTitle, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_dateData != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  valueWithRanges = self->_valueWithRanges;
  if ((unint64_t)valueWithRanges | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](valueWithRanges, "isEqual:"))
  {
    goto LABEL_21;
  }
  textualValue = self->_textualValue;
  if ((unint64_t)textualValue | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](textualValue, "isEqual:"))
      goto LABEL_21;
  }
  ucumUnitString = self->_ucumUnitString;
  if ((unint64_t)ucumUnitString | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](ucumUnitString, "isEqual:"))
      goto LABEL_21;
  }
  providerURI = self->_providerURI;
  if ((unint64_t)providerURI | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](providerURI, "isEqual:"))
      goto LABEL_21;
  }
  recordUUID = self->_recordUUID;
  if ((unint64_t)recordUUID | *((_QWORD *)v4 + 5))
    v12 = -[NSString isEqual:](recordUUID, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  double dateData;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;

  v3 = -[NSMutableArray hash](self->_codes, "hash");
  v4 = -[NSString hash](self->_recordTitle, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    dateData = self->_dateData;
    v7 = -dateData;
    if (dateData >= 0.0)
      v7 = self->_dateData;
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
  v10 = v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_valueWithRanges, "hash");
  v11 = -[NSString hash](self->_textualValue, "hash");
  v12 = v11 ^ -[NSString hash](self->_ucumUnitString, "hash");
  v13 = v10 ^ v12 ^ -[NSString hash](self->_providerURI, "hash");
  return v13 ^ -[NSString hash](self->_recordUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[HKCodableHealthRecordsIndividualRecord addCode:](self, "addCode:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 4))
    -[HKCodableHealthRecordsIndividualRecord setRecordTitle:](self, "setRecordTitle:");
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_dateData = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 8);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[HKCodableHealthRecordsIndividualRecord addValueWithRange:](self, "addValueWithRange:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 6))
    -[HKCodableHealthRecordsIndividualRecord setTextualValue:](self, "setTextualValue:");
  if (*((_QWORD *)v4 + 7))
    -[HKCodableHealthRecordsIndividualRecord setUcumUnitString:](self, "setUcumUnitString:");
  if (*((_QWORD *)v4 + 3))
    -[HKCodableHealthRecordsIndividualRecord setProviderURI:](self, "setProviderURI:");
  if (*((_QWORD *)v4 + 5))
    -[HKCodableHealthRecordsIndividualRecord setRecordUUID:](self, "setRecordUUID:");

}

- (NSMutableArray)codes
{
  return self->_codes;
}

- (void)setCodes:(id)a3
{
  objc_storeStrong((id *)&self->_codes, a3);
}

- (NSString)recordTitle
{
  return self->_recordTitle;
}

- (void)setRecordTitle:(id)a3
{
  objc_storeStrong((id *)&self->_recordTitle, a3);
}

- (double)dateData
{
  return self->_dateData;
}

- (NSMutableArray)valueWithRanges
{
  return self->_valueWithRanges;
}

- (void)setValueWithRanges:(id)a3
{
  objc_storeStrong((id *)&self->_valueWithRanges, a3);
}

- (NSString)textualValue
{
  return self->_textualValue;
}

- (void)setTextualValue:(id)a3
{
  objc_storeStrong((id *)&self->_textualValue, a3);
}

- (NSString)ucumUnitString
{
  return self->_ucumUnitString;
}

- (void)setUcumUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_ucumUnitString, a3);
}

- (NSString)providerURI
{
  return self->_providerURI;
}

- (void)setProviderURI:(id)a3
{
  objc_storeStrong((id *)&self->_providerURI, a3);
}

- (NSString)recordUUID
{
  return self->_recordUUID;
}

- (void)setRecordUUID:(id)a3
{
  objc_storeStrong((id *)&self->_recordUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueWithRanges, 0);
  objc_storeStrong((id *)&self->_ucumUnitString, 0);
  objc_storeStrong((id *)&self->_textualValue, 0);
  objc_storeStrong((id *)&self->_recordUUID, 0);
  objc_storeStrong((id *)&self->_recordTitle, 0);
  objc_storeStrong((id *)&self->_providerURI, 0);
  objc_storeStrong((id *)&self->_codes, 0);
}

@end
