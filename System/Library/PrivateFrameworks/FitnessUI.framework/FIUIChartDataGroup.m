@implementation FIUIChartDataGroup

- (id)minYValue
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_dataSets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "minYValue", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  FUArraySmallestValue(v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)maxYValue
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_dataSets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "maxYValue", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  FUArrayLargestValue(v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)minXValue
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_dataSets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "minXValue", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "minXValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  FUArraySmallestValue(v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)maxXValue
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_dataSets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "maxXValue", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  FUArrayLargestValue(v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)numberOfDataSets
{
  return -[NSArray count](self->_dataSets, "count");
}

- (id)dataSetAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_dataSets, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_dataSets, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)reloadData
{
  unint64_t v3;
  uint64_t i;
  void *v5;
  NSArray *v6;
  NSArray *dataSets;
  id v8;

  v3 = -[FIUIChartDataGroup _numberOfDataSets](self, "_numberOfDataSets");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      -[FIUIChartDataGroup _dataSetAtIndexCreateIfNecessary:](self, "_dataSetAtIndexCreateIfNecessary:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadData");
      objc_msgSend(v8, "addObject:", v5);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dataSets = self->_dataSets;
  self->_dataSets = v6;

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Data Sets: %@"), self->_dataSets);
}

- (id)_dataSetAtIndexCreateIfNecessary:(unint64_t)a3
{
  FIUIChartDataSet *v5;

  -[FIUIChartDataGroup dataSetAtIndex:](self, "dataSetAtIndex:");
  v5 = (FIUIChartDataSet *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(FIUIChartDataSet);
    -[FIUIChartDataSet setDataSource:](v5, "setDataSource:", self);
    -[FIUIChartDataSet setTag:](v5, "setTag:", a3);
  }
  return v5;
}

- (unint64_t)numberOfDataPointsForDataSet:(id)a3
{
  return -[FIUIChartDataGroup _numberOfDataPointsInSetAtIndex:](self, "_numberOfDataPointsInSetAtIndex:", objc_msgSend(a3, "tag"));
}

- (id)dataSet:(id)a3 chartPointForIndex:(unint64_t)a4
{
  return -[FIUIChartDataGroup _pointForSetAtIndex:pointIndex:](self, "_pointForSetAtIndex:pointIndex:", objc_msgSend(a3, "tag"), a4);
}

- (id)labelsForSet:(id)a3
{
  return -[FIUIChartDataGroup _labelsForSetAtIndex:](self, "_labelsForSetAtIndex:", objc_msgSend(a3, "tag"));
}

- (unint64_t)_numberOfDataSets
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "numberOfDataSetsInGroup:", self);

  return v4;
}

- (unint64_t)_numberOfDataPointsInSetAtIndex:(unint64_t)a3
{
  id WeakRetained;
  unint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = objc_msgSend(WeakRetained, "dataGroup:numberOfPointsInSetAtIndex:", self, a3);

  return v6;
}

- (id)_pointForSetAtIndex:(unint64_t)a3 pointIndex:(unint64_t)a4
{
  id WeakRetained;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "dataGroup:pointForSetAtIndex:pointIndex:", self, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_labelsForSetAtIndex:(unint64_t)a3
{
  FIUIChartDataGroupDataSource **p_dataSource;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v8, "dataGroup:labelsForSetAtIndex:", self, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (FIUIChartDataGroupDataSource)dataSource
{
  return (FIUIChartDataGroupDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSArray)dataSets
{
  return self->_dataSets;
}

- (void)setDataSets:(id)a3
{
  objc_storeStrong((id *)&self->_dataSets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSets, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
