@implementation HKCodableSummaryBalanceMetricsValue

- (void)setMorningIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_morningIndex = a3;
}

- (void)setHasMorningIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMorningIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBaselineRange
{
  return self->_baselineRange != 0;
}

- (void)clearBaselineComparisons
{
  -[NSMutableArray removeAllObjects](self->_baselineComparisons, "removeAllObjects");
}

- (void)addBaselineComparison:(id)a3
{
  id v4;
  NSMutableArray *baselineComparisons;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  baselineComparisons = self->_baselineComparisons;
  v8 = v4;
  if (!baselineComparisons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_baselineComparisons;
    self->_baselineComparisons = v6;

    v4 = v8;
    baselineComparisons = self->_baselineComparisons;
  }
  -[NSMutableArray addObject:](baselineComparisons, "addObject:", v4);

}

- (unint64_t)baselineComparisonsCount
{
  return -[NSMutableArray count](self->_baselineComparisons, "count");
}

- (id)baselineComparisonAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_baselineComparisons, "objectAtIndex:", a3);
}

+ (Class)baselineComparisonType
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
  v8.super_class = (Class)HKCodableSummaryBalanceMetricsValue;
  -[HKCodableSummaryBalanceMetricsValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryBalanceMetricsValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  HKCodableDayIndexRange *baselineRange;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_morningIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("morningIndex"));

  }
  baselineRange = self->_baselineRange;
  if (baselineRange)
  {
    -[HKCodableDayIndexRange dictionaryRepresentation](baselineRange, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("baselineRange"));

  }
  if (-[NSMutableArray count](self->_baselineComparisons, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_baselineComparisons, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_baselineComparisons;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("baselineComparison"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryBalanceMetricsValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_baselineRange)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_baselineComparisons;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_morningIndex;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v9 = v4;
  if (self->_baselineRange)
    objc_msgSend(v4, "setBaselineRange:");
  if (-[HKCodableSummaryBalanceMetricsValue baselineComparisonsCount](self, "baselineComparisonsCount"))
  {
    objc_msgSend(v9, "clearBaselineComparisons");
    v5 = -[HKCodableSummaryBalanceMetricsValue baselineComparisonsCount](self, "baselineComparisonsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HKCodableSummaryBalanceMetricsValue baselineComparisonAtIndex:](self, "baselineComparisonAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addBaselineComparison:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_morningIndex;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[HKCodableDayIndexRange copyWithZone:](self->_baselineRange, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_baselineComparisons;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v6, "addBaselineComparison:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableDayIndexRange *baselineRange;
  NSMutableArray *baselineComparisons;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_morningIndex != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  baselineRange = self->_baselineRange;
  if ((unint64_t)baselineRange | *((_QWORD *)v4 + 3)
    && !-[HKCodableDayIndexRange isEqual:](baselineRange, "isEqual:"))
  {
    goto LABEL_11;
  }
  baselineComparisons = self->_baselineComparisons;
  if ((unint64_t)baselineComparisons | *((_QWORD *)v4 + 2))
    v7 = -[NSMutableArray isEqual:](baselineComparisons, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_morningIndex;
  else
    v3 = 0;
  v4 = -[HKCodableDayIndexRange hash](self->_baselineRange, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_baselineComparisons, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  HKCodableDayIndexRange *baselineRange;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[4] & 1) != 0)
  {
    self->_morningIndex = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  baselineRange = self->_baselineRange;
  v7 = *((_QWORD *)v5 + 3);
  if (baselineRange)
  {
    if (v7)
      -[HKCodableDayIndexRange mergeFrom:](baselineRange, "mergeFrom:");
  }
  else if (v7)
  {
    -[HKCodableSummaryBalanceMetricsValue setBaselineRange:](self, "setBaselineRange:");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v5 + 2);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[HKCodableSummaryBalanceMetricsValue addBaselineComparison:](self, "addBaselineComparison:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (int64_t)morningIndex
{
  return self->_morningIndex;
}

- (HKCodableDayIndexRange)baselineRange
{
  return self->_baselineRange;
}

- (void)setBaselineRange:(id)a3
{
  objc_storeStrong((id *)&self->_baselineRange, a3);
}

- (NSMutableArray)baselineComparisons
{
  return self->_baselineComparisons;
}

- (void)setBaselineComparisons:(id)a3
{
  objc_storeStrong((id *)&self->_baselineComparisons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baselineRange, 0);
  objc_storeStrong((id *)&self->_baselineComparisons, 0);
}

@end
