@implementation HKRemoteChartDataSource

- (HKRemoteChartDataSource)init
{
  HKRemoteChartDataSource *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dataBlocksForTimescopes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKRemoteChartDataSource;
  v2 = -[HKGraphSeriesDataSource init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dataBlocksForTimescopes = v2->_dataBlocksForTimescopes;
    v2->_dataBlocksForTimescopes = v3;

  }
  return v2;
}

- (void)setDataForTimeScope:(int64_t)a3 seriesData:(id)a4 dataSourceForMapping:(id)a5 seriesDataSourceContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _HKRemoteChartDataEntry *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v15 = -[_HKRemoteChartDataEntry initWithSeriesData:dataSourceForMapping:seriesDataSourceContext:]([_HKRemoteChartDataEntry alloc], "initWithSeriesData:dataSourceForMapping:seriesDataSourceContext:", v12, v11, v10);

  -[HKRemoteChartDataSource dataBlocksForTimescopes](self, "dataBlocksForTimescopes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v14);

}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  retstr->index = 0;
  retstr->zoom = a5;
  retstr->resolution = 0;
  return self;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  HKGraphSeriesDataBlock *v8;

  -[HKRemoteChartDataSource dataBlocksForTimescopes](self, "dataBlocksForTimescopes", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->zoom);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !a3->index)
  {
    objc_msgSend(v7, "seriesDataWithMappingApplied");
    v8 = (HKGraphSeriesDataBlock *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(HKGraphSeriesDataBlock);
    -[HKGraphSeriesDataBlock setChartPoints:](v8, "setChartPoints:", MEMORY[0x1E0C9AA60]);
  }

  return v8;
}

- (void)invalidateCache
{
  id v3;

  -[HKGraphSeriesDataSource delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceDidUpdateCache:", self);

}

- (NSMutableDictionary)dataBlocksForTimescopes
{
  return self->_dataBlocksForTimescopes;
}

- (void)setDataBlocksForTimescopes:(id)a3
{
  objc_storeStrong((id *)&self->_dataBlocksForTimescopes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBlocksForTimescopes, 0);
}

@end
