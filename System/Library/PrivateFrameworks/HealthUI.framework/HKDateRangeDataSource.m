@implementation HKDateRangeDataSource

- (HKDateRangeDataSource)initWithSourceDelegate:(id)a3
{
  id v5;
  HKDateRangeDataSource *v6;
  HKDateRangeDataSource *v7;
  id *p_sourceDelegate;
  NSMutableDictionary *v9;
  NSMutableDictionary *pathToDataBlock;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKDateRangeDataSource;
  v6 = -[HKGraphSeriesDataSource init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    p_sourceDelegate = (id *)&v6->_sourceDelegate;
    objc_storeStrong((id *)&v6->_sourceDelegate, a3);
    if (*p_sourceDelegate)
      objc_msgSend(*p_sourceDelegate, "setUpdateDelegate:", v7);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pathToDataBlock = v7->_pathToDataBlock;
    v7->_pathToDataBlock = v9;

  }
  return v7;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  void *v6;
  void *v7;
  HKGraphSeriesDataBlockPath v9;

  v9 = *a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", &v9, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pathToDataBlock, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v9 = *a3;
    -[HKDateRangeDataSource _fetchAndCacheDataForPath:](self, "_fetchAndCacheDataForPath:", &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pathToDataBlock, "setObject:forKeyedSubscript:", v7, v6);
  }

  return v7;
}

- (void)blocksRequestedFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4 priorityDelegate:(id)a5
{
  int64_t index;
  id v9;
  int64_t v11;
  __int128 v12;

  index = a3->index;
  if (a3->index <= a4->index)
  {
    do
    {
      v11 = index;
      v12 = *(_OWORD *)&a3->zoom;
      v9 = -[HKDateRangeDataSource cachedBlockForPath:context:](self, "cachedBlockForPath:context:", &v11, 0, a5);
    }
    while (index++ < a4->index);
  }
}

- (id)_fetchAndCacheDataForPath:(HKGraphSeriesDataBlockPath *)a3
{
  void *v5;
  void *v6;
  int64_t zoom;
  void *v8;
  void *v9;
  HKGraphSeriesDataBlock *v10;
  HKGraphSeriesDataBlockPath v12;

  v12 = *a3;
  HKGraphSeriesDataBlockPathMinimumX(&v12.index);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *a3;
  HKGraphSeriesDataBlockPathMaximumX((uint64_t)&v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zoom = a3->zoom;
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDateRangeDataSourceDelegate dataForDateRange:timeScope:](self->_sourceDelegate, "dataForDateRange:timeScope:", v8, zoom);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v10, "setChartPoints:", v9);

  return v10;
}

- (void)dateRangeDataUpdated
{
  id v3;

  -[NSMutableDictionary removeAllObjects](self->_pathToDataBlock, "removeAllObjects");
  -[HKGraphSeriesDataSource delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceDidUpdateCache:", self);

}

- (HKDateRangeDataSourceDelegate)sourceDelegate
{
  return self->_sourceDelegate;
}

- (NSMutableDictionary)pathToDataBlock
{
  return self->_pathToDataBlock;
}

- (void)setPathToDataBlock:(id)a3
{
  objc_storeStrong((id *)&self->_pathToDataBlock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathToDataBlock, 0);
  objc_storeStrong((id *)&self->_sourceDelegate, 0);
}

@end
