@implementation _HKRemoteDataSources

- (_HKRemoteDataSources)init
{
  _HKRemoteDataSources *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dataSources;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKRemoteDataSources;
  v2 = -[_HKRemoteDataSources init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dataSources = v2->_dataSources;
    v2->_dataSources = v3;

    v2->_supportsChartQueryDataGeneration = 0;
  }
  return v2;
}

- (id)initSupportsChartQueryDataGeneration:(BOOL)a3
{
  _HKRemoteDataSources *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *dataSources;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKRemoteDataSources;
  v4 = -[_HKRemoteDataSources init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dataSources = v4->_dataSources;
    v4->_dataSources = v5;

    v4->_supportsChartQueryDataGeneration = a3;
  }
  return v4;
}

- (id)dataSourceForTimeScope:(int64_t)a3
{
  NSMutableDictionary *dataSources;
  void *v4;
  void *v5;

  dataSources = self->_dataSources;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dataSources, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDataSource:(id)a3 forTimeScope:(int64_t)a4
{
  NSMutableDictionary *dataSources;
  void *v6;
  id v7;
  id v8;

  dataSources = self->_dataSources;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](dataSources, "setObject:forKeyedSubscript:", v7, v8);

}

- (id)allDataSources
{
  return (id)-[NSMutableDictionary allValues](self->_dataSources, "allValues");
}

- (BOOL)supportsChartQueryDataGeneration
{
  return self->_supportsChartQueryDataGeneration;
}

- (void)setSupportsChartQueryDataGeneration:(BOOL)a3
{
  self->_supportsChartQueryDataGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);
}

@end
