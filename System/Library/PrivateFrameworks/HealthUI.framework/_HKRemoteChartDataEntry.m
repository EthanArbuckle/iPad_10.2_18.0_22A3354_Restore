@implementation _HKRemoteChartDataEntry

- (_HKRemoteChartDataEntry)initWithSeriesData:(id)a3 dataSourceForMapping:(id)a4 seriesDataSourceContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HKRemoteChartDataEntry *v12;
  _HKRemoteChartDataEntry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HKRemoteChartDataEntry;
  v12 = -[_HKRemoteChartDataEntry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_seriesData, a3);
    objc_storeStrong((id *)&v13->_dataSourceForMapping, a4);
    objc_storeStrong(&v13->_seriesDataSourceContext, a5);
  }

  return v13;
}

- (id)seriesDataWithMappingApplied
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;

  -[_HKRemoteChartDataEntry dataSourceForMapping](self, "dataSourceForMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_HKRemoteChartDataEntry dataSourceForMapping](self, "dataSourceForMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKRemoteChartDataEntry seriesDataSourceContext](self, "seriesDataSourceContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mappingFunctionForContext:", v5);
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    -[_HKRemoteChartDataEntry seriesData](self, "seriesData");
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[_HKRemoteChartDataEntry seriesData](self, "seriesData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (HKGraphSeriesDataBlock)seriesData
{
  return self->_seriesData;
}

- (HKHealthQueryChartCacheDataSource)dataSourceForMapping
{
  return self->_dataSourceForMapping;
}

- (id)seriesDataSourceContext
{
  return self->_seriesDataSourceContext;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_seriesDataSourceContext, 0);
  objc_storeStrong((id *)&self->_dataSourceForMapping, 0);
  objc_storeStrong((id *)&self->_seriesData, 0);
}

@end
