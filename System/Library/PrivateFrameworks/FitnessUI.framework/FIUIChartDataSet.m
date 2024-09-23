@implementation FIUIChartDataSet

- (id)description
{
  return -[NSArray description](self->_points, "description");
}

- (id)maxYValue
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_points;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "maxYValue", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5 || objc_msgSend(v8, "compare:", v5) == 1)
        {
          v10 = v9;

          v5 = v10;
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)minYValue
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_points;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "minYValue", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5 || objc_msgSend(v8, "compare:", v5) == -1)
        {
          v10 = v9;

          v5 = v10;
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)maxXValue
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_points;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "xValue", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5 || objc_msgSend(v8, "hk_isAfterDate:", v5))
        {
          v10 = v9;

          v5 = v10;
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)minXValue
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_points;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "xValue", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5 || objc_msgSend(v8, "hk_isBeforeDate:", v5))
        {
          v10 = v9;

          v5 = v10;
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)points
{
  return self->_points;
}

- (id)labelsForSet
{
  return self->_labels;
}

- (void)reloadData
{
  id WeakRetained;
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  id v10;
  char v11;
  id v12;
  NSArray *v13;
  NSArray *labels;
  id obj;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  obj = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "numberOfDataPointsForDataSet:", self);

  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v6, "dataSet:chartPointForIndex:", self, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "addObject:", v7);

      ++v5;
      v8 = objc_loadWeakRetained((id *)&self->_dataSource);
      v9 = objc_msgSend(v8, "numberOfDataPointsForDataSet:", self);

    }
    while (v5 < v9);
  }
  objc_storeStrong((id *)&self->_points, obj);
  v10 = objc_loadWeakRetained((id *)&self->_dataSource);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v12, "labelsForSet:", self);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    labels = self->_labels;
    self->_labels = v13;

  }
}

- (FIUIChartDataSetDataSource)dataSource
{
  return (FIUIChartDataSetDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_points, 0);
}

@end
