@implementation HKCodableSummaryTrendResults

- (void)addTrendValues:(id)a3
{
  id v4;
  NSMutableArray *trendValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  trendValues = self->_trendValues;
  v8 = v4;
  if (!trendValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_trendValues;
    self->_trendValues = v6;

    v4 = v8;
    trendValues = self->_trendValues;
  }
  -[NSMutableArray addObject:](trendValues, "addObject:", v4);

}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendResultsReadFrom(self, (uint64_t)a3);
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendValues, 0);
}

- (void)clearTrendValues
{
  -[NSMutableArray removeAllObjects](self->_trendValues, "removeAllObjects");
}

- (unint64_t)trendValuesCount
{
  return -[NSMutableArray count](self->_trendValues, "count");
}

- (id)trendValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_trendValues, "objectAtIndex:", a3);
}

+ (Class)trendValuesType
{
  return (Class)objc_opt_class();
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
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
  v8.super_class = (Class)HKCodableSummaryTrendResults;
  -[HKCodableSummaryTrendResults description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryTrendResults dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_trendValues, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_trendValues, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = self->_trendValues;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("trendValues"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("latestSupportedVersion"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("minimumSupportedVersion"));

  }
  return v3;
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
  v5 = self->_trendValues;
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
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();

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
  if (-[HKCodableSummaryTrendResults trendValuesCount](self, "trendValuesCount"))
  {
    objc_msgSend(v9, "clearTrendValues");
    v4 = -[HKCodableSummaryTrendResults trendValuesCount](self, "trendValuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HKCodableSummaryTrendResults trendValuesAtIndex:](self, "trendValuesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTrendValues:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v9 + 1) = self->_latestSupportedVersion;
    *((_BYTE *)v9 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v9 + 2) = self->_minimumSupportedVersion;
    *((_BYTE *)v9 + 32) |= 2u;
  }

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
  v6 = self->_trendValues;
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
        objc_msgSend((id)v5, "addTrendValues:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_latestSupportedVersion;
    *(_BYTE *)(v5 + 32) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_minimumSupportedVersion;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *trendValues;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  trendValues = self->_trendValues;
  if ((unint64_t)trendValues | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](trendValues, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 2))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSMutableArray hash](self->_trendValues, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_latestSupportedVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5;
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
  v5 = *((id *)v4 + 3);
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
        -[HKCodableSummaryTrendResults addTrendValues:](self, "addTrendValues:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 32);
  if ((v10 & 1) != 0)
  {
    self->_latestSupportedVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v10 = *((_BYTE *)v4 + 32);
  }
  if ((v10 & 2) != 0)
  {
    self->_minimumSupportedVersion = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSMutableArray)trendValues
{
  return self->_trendValues;
}

- (void)setTrendValues:(id)a3
{
  objc_storeStrong((id *)&self->_trendValues, a3);
}

@end
