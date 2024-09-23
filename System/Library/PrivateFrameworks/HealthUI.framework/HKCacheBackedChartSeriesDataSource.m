@implementation HKCacheBackedChartSeriesDataSource

- (HKCacheBackedChartSeriesDataSource)init
{
  HKCacheBackedChartSeriesDataSource *v2;
  HKCacheBackedChartSeriesDataSource *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKCacheBackedChartSeriesDataSource;
  v2 = -[HKGraphSeriesDataSource init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HKCacheBackedChartSeriesDataSource _resetCachedPaths](v2, "_resetCachedPaths");
  return v3;
}

- (void)setChartCache:(id)a3
{
  HKChartCache *v4;
  HKChartCache *chartCache;
  HKChartCache *v6;

  v4 = (HKChartCache *)a3;
  -[HKChartCache removeObserver:](self->_chartCache, "removeObserver:", self);
  chartCache = self->_chartCache;
  self->_chartCache = v4;
  v6 = v4;

  -[HKChartCache addObserver:](self->_chartCache, "addObserver:", self);
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  HKChartCache *chartCache;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  HKGraphSeriesDataBlockPath v14;

  chartCache = self->_chartCache;
  v6 = (void *)MEMORY[0x1E0CB3B18];
  v14 = *a3;
  v7 = a4;
  objc_msgSend(v6, "valueWithHKGraphSeriesDataBlockPath:", &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKChartCache cachedResultsForIdentifier:](chartCache, "cachedResultsForIdentifier:", v8, *(_OWORD *)&v14.index, v14.resolution);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKChartCache dataSourceRespectingType](self->_chartCache, "dataSourceRespectingType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mappingFunctionForContext:", v7);
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    ((void (**)(_QWORD, void *))v11)[2](v11, v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }

  return v9;
}

- (void)blocksRequestedFromPath:(HKGraphSeriesDataBlockPath *)a3 toPath:(HKGraphSeriesDataBlockPath *)a4 priorityDelegate:(id)a5
{
  id v8;
  _BOOL4 v9;
  BOOL v10;
  __int128 v11;
  __int128 v12;
  id v13;
  int64_t index;
  void *v15;
  HKGraphSeriesDataBlockPath lastStartPath;
  HKGraphSeriesDataBlockPath v18;

  v8 = a5;
  v18 = *a3;
  lastStartPath = self->_lastStartPath;
  v9 = HKGraphSeriesDataBlockPathEqualToPath(&v18, &lastStartPath);
  v18 = *a4;
  lastStartPath = self->_lastEndPath;
  v10 = HKGraphSeriesDataBlockPathEqualToPath(&v18, &lastStartPath);
  if (!v9 || !v10)
  {
    v11 = *(_OWORD *)&a3->index;
    self->_lastStartPath.resolution = a3->resolution;
    *(_OWORD *)&self->_lastStartPath.index = v11;
    v12 = *(_OWORD *)&a4->index;
    self->_lastEndPath.resolution = a4->resolution;
    *(_OWORD *)&self->_lastEndPath.index = v12;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    index = a3->index;
    if (a3->index <= a4->index)
    {
      do
      {
        v18.index = index;
        *(_OWORD *)&v18.zoom = *(_OWORD *)&a3->zoom;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", &v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v15);

      }
      while (index++ < a4->index);
    }
    -[HKChartCache fetchResultsForIdentifiers:priorityDelegate:](self->_chartCache, "fetchResultsForIdentifiers:priorityDelegate:", v13, v8);

  }
}

- (BOOL)hasPendingQueriesBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  int64_t index;
  BOOL result;
  void *v9;
  unint64_t v10;
  int64_t v12;
  __int128 v13;

  index = a3->index;
  if (a3->index > a4->index)
    return 0;
  do
  {
    v12 = index;
    v13 = *(_OWORD *)&a3->zoom;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKChartCache stateForIdentifier:](self->_chartCache, "stateForIdentifier:", v9);

    result = v10 == 1;
    if (v10 == 1)
      break;
  }
  while (index++ < a4->index);
  return result;
}

- (BOOL)hasAvailableBlocksBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  int64_t index;
  BOOL result;
  void *v9;
  unint64_t v10;
  int64_t v12;
  __int128 v13;

  index = a3->index;
  if (a3->index > a4->index)
    return 0;
  do
  {
    v12 = index;
    v13 = *(_OWORD *)&a3->zoom;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKChartCache stateForIdentifier:](self->_chartCache, "stateForIdentifier:", v9);

    result = v10 == 2;
    if (v10 == 2)
      break;
  }
  while (index++ < a4->index);
  return result;
}

- (BOOL)hasAllBlocksAvailableBetweenStartPath:(HKGraphSeriesDataBlockPath *)a3 endPath:(HKGraphSeriesDataBlockPath *)a4
{
  void *v7;
  int64_t index;
  BOOL result;
  void *v10;
  unint64_t v11;
  int64_t v13;
  __int128 v14;

  -[HKChartCache dataSource](self->_chartCache, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 1;
  index = a3->index;
  if (a3->index > a4->index)
    return 1;
  do
  {
    v13 = index;
    v14 = *(_OWORD *)&a3->zoom;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKGraphSeriesDataBlockPath:", &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HKChartCache stateForIdentifier:](self->_chartCache, "stateForIdentifier:", v10);

    result = v11 == 2;
    if (v11 != 2)
      break;
  }
  while (index++ < a4->index);
  return result;
}

- (void)invalidateCache
{
  -[HKChartCache invalidateCache](self->_chartCache, "invalidateCache");
}

- (void)chartCacheDidUpdate:(id)a3
{
  id v4;

  -[HKCacheBackedChartSeriesDataSource _resetCachedPaths](self, "_resetCachedPaths", a3);
  -[HKGraphSeriesDataSource delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceDidUpdateCache:", self);

}

- (void)_resetCachedPaths
{
  *(_OWORD *)&self->_lastStartPath.index = HKGraphSeriesDataBlockPathNone;
  self->_lastStartPath.resolution = 0;
  *(_OWORD *)&self->_lastEndPath.index = HKGraphSeriesDataBlockPathNone;
  self->_lastEndPath.resolution = 0;
}

- (HKChartCache)chartCache
{
  return self->_chartCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartCache, 0);
}

@end
