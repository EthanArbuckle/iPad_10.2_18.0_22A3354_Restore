@implementation HKCodableSummaryTrendValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPresencePoints, 0);
  objc_storeStrong((id *)&self->_coveredDateRangeRawValue, 0);
  objc_storeStrong((id *)&self->_analysisData, 0);
}

- (BOOL)hasAnalysisData
{
  return self->_analysisData != 0;
}

- (BOOL)hasCoveredDateRangeRawValue
{
  return self->_coveredDateRangeRawValue != 0;
}

- (void)clearDataPresencePoints
{
  -[NSMutableArray removeAllObjects](self->_dataPresencePoints, "removeAllObjects");
}

- (void)addDataPresencePoints:(id)a3
{
  id v4;
  NSMutableArray *dataPresencePoints;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dataPresencePoints = self->_dataPresencePoints;
  v8 = v4;
  if (!dataPresencePoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dataPresencePoints;
    self->_dataPresencePoints = v6;

    v4 = v8;
    dataPresencePoints = self->_dataPresencePoints;
  }
  -[NSMutableArray addObject:](dataPresencePoints, "addObject:", v4);

}

- (unint64_t)dataPresencePointsCount
{
  return -[NSMutableArray count](self->_dataPresencePoints, "count");
}

- (id)dataPresencePointsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dataPresencePoints, "objectAtIndex:", a3);
}

+ (Class)dataPresencePointsType
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
  v8.super_class = (Class)HKCodableSummaryTrendValue;
  -[HKCodableSummaryTrendValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryTrendValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *analysisData;
  NSString *coveredDateRangeRawValue;
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
  v4 = v3;
  analysisData = self->_analysisData;
  if (analysisData)
    objc_msgSend(v3, "setObject:forKey:", analysisData, CFSTR("analysisData"));
  coveredDateRangeRawValue = self->_coveredDateRangeRawValue;
  if (coveredDateRangeRawValue)
    objc_msgSend(v4, "setObject:forKey:", coveredDateRangeRawValue, CFSTR("coveredDateRangeRawValue"));
  if (-[NSMutableArray count](self->_dataPresencePoints, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_dataPresencePoints, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_dataPresencePoints;
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

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("dataPresencePoints"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendValueReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_analysisData)
    PBDataWriterWriteDataField();
  if (self->_coveredDateRangeRawValue)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_dataPresencePoints;
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
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_analysisData)
    objc_msgSend(v8, "setAnalysisData:");
  if (self->_coveredDateRangeRawValue)
    objc_msgSend(v8, "setCoveredDateRangeRawValue:");
  if (-[HKCodableSummaryTrendValue dataPresencePointsCount](self, "dataPresencePointsCount"))
  {
    objc_msgSend(v8, "clearDataPresencePoints");
    v4 = -[HKCodableSummaryTrendValue dataPresencePointsCount](self, "dataPresencePointsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HKCodableSummaryTrendValue dataPresencePointsAtIndex:](self, "dataPresencePointsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addDataPresencePoints:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_analysisData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_coveredDateRangeRawValue, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_dataPresencePoints;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addDataPresencePoints:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *analysisData;
  NSString *coveredDateRangeRawValue;
  NSMutableArray *dataPresencePoints;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((analysisData = self->_analysisData, !((unint64_t)analysisData | v4[1]))
     || -[NSData isEqual:](analysisData, "isEqual:"))
    && ((coveredDateRangeRawValue = self->_coveredDateRangeRawValue,
         !((unint64_t)coveredDateRangeRawValue | v4[2]))
     || -[NSString isEqual:](coveredDateRangeRawValue, "isEqual:")))
  {
    dataPresencePoints = self->_dataPresencePoints;
    if ((unint64_t)dataPresencePoints | v4[3])
      v8 = -[NSMutableArray isEqual:](dataPresencePoints, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSData hash](self->_analysisData, "hash");
  v4 = -[NSString hash](self->_coveredDateRangeRawValue, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_dataPresencePoints, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[HKCodableSummaryTrendValue setAnalysisData:](self, "setAnalysisData:");
  if (*((_QWORD *)v4 + 2))
    -[HKCodableSummaryTrendValue setCoveredDateRangeRawValue:](self, "setCoveredDateRangeRawValue:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HKCodableSummaryTrendValue addDataPresencePoints:](self, "addDataPresencePoints:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSData)analysisData
{
  return self->_analysisData;
}

- (void)setAnalysisData:(id)a3
{
  objc_storeStrong((id *)&self->_analysisData, a3);
}

- (NSString)coveredDateRangeRawValue
{
  return self->_coveredDateRangeRawValue;
}

- (void)setCoveredDateRangeRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_coveredDateRangeRawValue, a3);
}

- (NSMutableArray)dataPresencePoints
{
  return self->_dataPresencePoints;
}

- (void)setDataPresencePoints:(id)a3
{
  objc_storeStrong((id *)&self->_dataPresencePoints, a3);
}

@end
