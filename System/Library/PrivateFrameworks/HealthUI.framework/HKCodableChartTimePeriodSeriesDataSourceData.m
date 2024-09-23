@implementation HKCodableChartTimePeriodSeriesDataSourceData

- (BOOL)hasStatisticsInterval
{
  return self->_statisticsInterval != 0;
}

- (void)clearDateIntervalsToTotals
{
  -[NSMutableArray removeAllObjects](self->_dateIntervalsToTotals, "removeAllObjects");
}

- (void)addDateIntervalsToTotals:(id)a3
{
  id v4;
  NSMutableArray *dateIntervalsToTotals;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dateIntervalsToTotals = self->_dateIntervalsToTotals;
  v8 = v4;
  if (!dateIntervalsToTotals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dateIntervalsToTotals;
    self->_dateIntervalsToTotals = v6;

    v4 = v8;
    dateIntervalsToTotals = self->_dateIntervalsToTotals;
  }
  -[NSMutableArray addObject:](dateIntervalsToTotals, "addObject:", v4);

}

- (unint64_t)dateIntervalsToTotalsCount
{
  return -[NSMutableArray count](self->_dateIntervalsToTotals, "count");
}

- (id)dateIntervalsToTotalsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dateIntervalsToTotals, "objectAtIndex:", a3);
}

+ (Class)dateIntervalsToTotalsType
{
  return (Class)objc_opt_class();
}

- (void)clearIntervalCounts
{
  -[NSMutableArray removeAllObjects](self->_intervalCounts, "removeAllObjects");
}

- (void)addIntervalCounts:(id)a3
{
  id v4;
  NSMutableArray *intervalCounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  intervalCounts = self->_intervalCounts;
  v8 = v4;
  if (!intervalCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_intervalCounts;
    self->_intervalCounts = v6;

    v4 = v8;
    intervalCounts = self->_intervalCounts;
  }
  -[NSMutableArray addObject:](intervalCounts, "addObject:", v4);

}

- (unint64_t)intervalCountsCount
{
  return -[NSMutableArray count](self->_intervalCounts, "count");
}

- (id)intervalCountsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_intervalCounts, "objectAtIndex:", a3);
}

+ (Class)intervalCountsType
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
  v8.super_class = (Class)HKCodableChartTimePeriodSeriesDataSourceData;
  -[HKCodableChartTimePeriodSeriesDataSourceData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartTimePeriodSeriesDataSourceData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableDateComponents *statisticsInterval;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  statisticsInterval = self->_statisticsInterval;
  if (statisticsInterval)
  {
    -[HKCodableDateComponents dictionaryRepresentation](statisticsInterval, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("statisticsInterval"));

  }
  if (-[NSMutableArray count](self->_dateIntervalsToTotals, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_dateIntervalsToTotals, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_dateIntervalsToTotals;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dateIntervalsToTotals"));
  }
  if (-[NSMutableArray count](self->_intervalCounts, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_intervalCounts, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_intervalCounts;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("intervalCounts"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartTimePeriodSeriesDataSourceDataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_statisticsInterval)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_dateIntervalsToTotals;
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

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_intervalCounts;
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
  id v12;

  v12 = a3;
  if (self->_statisticsInterval)
    objc_msgSend(v12, "setStatisticsInterval:");
  if (-[HKCodableChartTimePeriodSeriesDataSourceData dateIntervalsToTotalsCount](self, "dateIntervalsToTotalsCount"))
  {
    objc_msgSend(v12, "clearDateIntervalsToTotals");
    v4 = -[HKCodableChartTimePeriodSeriesDataSourceData dateIntervalsToTotalsCount](self, "dateIntervalsToTotalsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HKCodableChartTimePeriodSeriesDataSourceData dateIntervalsToTotalsAtIndex:](self, "dateIntervalsToTotalsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDateIntervalsToTotals:", v7);

      }
    }
  }
  if (-[HKCodableChartTimePeriodSeriesDataSourceData intervalCountsCount](self, "intervalCountsCount"))
  {
    objc_msgSend(v12, "clearIntervalCounts");
    v8 = -[HKCodableChartTimePeriodSeriesDataSourceData intervalCountsCount](self, "intervalCountsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HKCodableChartTimePeriodSeriesDataSourceData intervalCountsAtIndex:](self, "intervalCountsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addIntervalCounts:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableDateComponents copyWithZone:](self->_statisticsInterval, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_dateIntervalsToTotals;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addDateIntervalsToTotals:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_intervalCounts;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addIntervalCounts:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKCodableDateComponents *statisticsInterval;
  NSMutableArray *dateIntervalsToTotals;
  NSMutableArray *intervalCounts;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((statisticsInterval = self->_statisticsInterval, !((unint64_t)statisticsInterval | v4[3]))
     || -[HKCodableDateComponents isEqual:](statisticsInterval, "isEqual:"))
    && ((dateIntervalsToTotals = self->_dateIntervalsToTotals, !((unint64_t)dateIntervalsToTotals | v4[1]))
     || -[NSMutableArray isEqual:](dateIntervalsToTotals, "isEqual:")))
  {
    intervalCounts = self->_intervalCounts;
    if ((unint64_t)intervalCounts | v4[2])
      v8 = -[NSMutableArray isEqual:](intervalCounts, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;

  v3 = -[HKCodableDateComponents hash](self->_statisticsInterval, "hash");
  v4 = -[NSMutableArray hash](self->_dateIntervalsToTotals, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_intervalCounts, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableDateComponents *statisticsInterval;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  statisticsInterval = self->_statisticsInterval;
  v6 = *((_QWORD *)v4 + 3);
  if (statisticsInterval)
  {
    if (v6)
      -[HKCodableDateComponents mergeFrom:](statisticsInterval, "mergeFrom:");
  }
  else if (v6)
  {
    -[HKCodableChartTimePeriodSeriesDataSourceData setStatisticsInterval:](self, "setStatisticsInterval:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[HKCodableChartTimePeriodSeriesDataSourceData addDateIntervalsToTotals:](self, "addDateIntervalsToTotals:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 2);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[HKCodableChartTimePeriodSeriesDataSourceData addIntervalCounts:](self, "addIntervalCounts:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (HKCodableDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsInterval, a3);
}

- (NSMutableArray)dateIntervalsToTotals
{
  return self->_dateIntervalsToTotals;
}

- (void)setDateIntervalsToTotals:(id)a3
{
  objc_storeStrong((id *)&self->_dateIntervalsToTotals, a3);
}

- (NSMutableArray)intervalCounts
{
  return self->_intervalCounts;
}

- (void)setIntervalCounts:(id)a3
{
  objc_storeStrong((id *)&self->_intervalCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_intervalCounts, 0);
  objc_storeStrong((id *)&self->_dateIntervalsToTotals, 0);
}

@end
