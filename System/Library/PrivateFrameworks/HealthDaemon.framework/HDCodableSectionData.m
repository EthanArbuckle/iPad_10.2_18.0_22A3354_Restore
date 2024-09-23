@implementation HDCodableSectionData

- (void)clearStringValues
{
  -[NSMutableArray removeAllObjects](self->_stringValues, "removeAllObjects");
}

- (void)addStringValues:(id)a3
{
  id v4;
  NSMutableArray *stringValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stringValues = self->_stringValues;
  v8 = v4;
  if (!stringValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_stringValues;
    self->_stringValues = v6;

    v4 = v8;
    stringValues = self->_stringValues;
  }
  -[NSMutableArray addObject:](stringValues, "addObject:", v4);

}

- (unint64_t)stringValuesCount
{
  return -[NSMutableArray count](self->_stringValues, "count");
}

- (id)stringValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_stringValues, "objectAtIndex:", a3);
}

+ (Class)stringValuesType
{
  return (Class)objc_opt_class();
}

- (void)setSectionDataType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sectionDataType = a3;
}

- (void)setHasSectionDataType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSectionDataType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)HDCodableSectionData;
  -[HDCodableSectionData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSectionData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *stringValues;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  stringValues = self->_stringValues;
  if (stringValues)
    objc_msgSend(v3, "setObject:forKey:", stringValues, CFSTR("stringValues"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sectionDataType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("sectionDataType"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timestamp"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("version"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("deleted"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSectionDataReadFrom((uint64_t)self, (uint64_t)a3);
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_stringValues;
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
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 2) == 0)
        goto LABEL_11;
LABEL_16:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_16;
LABEL_11:
  if ((has & 8) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField();
LABEL_13:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  id v9;

  v9 = a3;
  if (-[HDCodableSectionData stringValuesCount](self, "stringValuesCount"))
  {
    objc_msgSend(v9, "clearStringValues");
    v4 = -[HDCodableSectionData stringValuesCount](self, "stringValuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableSectionData stringValuesAtIndex:](self, "stringValuesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addStringValues:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v9 + 1) = self->_sectionDataType;
    *((_BYTE *)v9 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      *((_QWORD *)v9 + 2) = *(_QWORD *)&self->_timestamp;
      *((_BYTE *)v9 + 44) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v9 + 3) = self->_version;
  *((_BYTE *)v9 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    *((_BYTE *)v9 + 40) = self->_deleted;
    *((_BYTE *)v9 + 44) |= 8u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_stringValues;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v5, "addStringValues:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_sectionDataType;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 2) == 0)
        goto LABEL_11;
LABEL_16:
      *(double *)(v5 + 16) = self->_timestamp;
      *(_BYTE *)(v5 + 44) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  *(_QWORD *)(v5 + 24) = self->_version;
  *(_BYTE *)(v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_16;
LABEL_11:
  if ((has & 8) != 0)
  {
LABEL_12:
    *(_BYTE *)(v5 + 40) = self->_deleted;
    *(_BYTE *)(v5 + 44) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *stringValues;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  stringValues = self->_stringValues;
  if ((unint64_t)stringValues | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](stringValues, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_sectionDataType != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_version != *((_QWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  v6 = (*((_BYTE *)v4 + 44) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0)
    {
LABEL_21:
      v6 = 0;
      goto LABEL_22;
    }
    if (self->_deleted)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_21;
    }
    v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  uint64_t v5;
  uint64_t v6;
  double timestamp;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;

  v3 = -[NSMutableArray hash](self->_stringValues, "hash");
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  v5 = 2654435761 * self->_sectionDataType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v6 = 2654435761 * self->_version;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_4:
  timestamp = self->_timestamp;
  v8 = -timestamp;
  if (timestamp >= 0.0)
    v8 = self->_timestamp;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_13:
  if ((has & 8) != 0)
    v12 = 2654435761 * self->_deleted;
  else
    v12 = 0;
  return v5 ^ v3 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[HDCodableSectionData addStringValues:](self, "addStringValues:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 44);
  if ((v10 & 1) != 0)
  {
    self->_sectionDataType = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v10 = *((_BYTE *)v4 + 44);
    if ((v10 & 4) == 0)
    {
LABEL_10:
      if ((v10 & 2) == 0)
        goto LABEL_11;
LABEL_16:
      self->_timestamp = *((double *)v4 + 2);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 44) & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 4) == 0)
  {
    goto LABEL_10;
  }
  self->_version = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v10 = *((_BYTE *)v4 + 44);
  if ((v10 & 2) != 0)
    goto LABEL_16;
LABEL_11:
  if ((v10 & 8) != 0)
  {
LABEL_12:
    self->_deleted = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_13:

}

- (NSMutableArray)stringValues
{
  return self->_stringValues;
}

- (void)setStringValues:(id)a3
{
  objc_storeStrong((id *)&self->_stringValues, a3);
}

- (int64_t)sectionDataType
{
  return self->_sectionDataType;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValues, 0);
}

@end
