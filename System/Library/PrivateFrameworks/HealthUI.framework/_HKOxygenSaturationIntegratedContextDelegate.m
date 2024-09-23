@implementation _HKOxygenSaturationIntegratedContextDelegate

- (_HKOxygenSaturationIntegratedContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4 context:(unint64_t)a5
{
  id v9;
  id v10;
  _HKOxygenSaturationIntegratedContextDelegate *v11;
  _HKOxygenSaturationIntegratedContextDelegate *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKOxygenSaturationIntegratedContextDelegate;
  v11 = -[_HKOxygenSaturationIntegratedContextDelegate init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cacheDataSource, a3);
    objc_storeStrong((id *)&v12->_primaryDisplayType, a4);
    v12->_context = a5;
  }

  return v12;
}

- (HKLineSeries)alternateLineSeries
{
  return 0;
}

- (id)formatterForTimescope:(int64_t)a3
{
  HKInteractiveChartOxygenSaturationFormatter *v3;
  unint64_t v6;
  void *v7;
  HKInteractiveChartOxygenSaturationFormatter *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = -[_HKOxygenSaturationIntegratedContextDelegate context](self, "context");
  if (v6 == 1)
  {
    v3 = -[HKInteractiveChartOxygenSaturationFormatter initWithStatisticsType:]([HKInteractiveChartOxygenSaturationFormatter alloc], "initWithStatisticsType:", 21);
  }
  else if (!v6)
  {
    -[_HKOxygenSaturationIntegratedContextDelegate primaryDisplayType](self, "primaryDisplayType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_interactiveChartsFormatterForTimeScope:", a3);
    v3 = (HKInteractiveChartOxygenSaturationFormatter *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v3;
      -[_HKOxygenSaturationIntegratedContextDelegate _statItemForTimeScope:](self, "_statItemForTimeScope:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartGenericStatFormatter setOverrideStatFormatterItemOptions:](v8, "setOverrideStatFormatterItemOptions:", v10);

      return v8;
    }
  }
  return v3;
}

- (id)_statItemForTimeScope:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 5)
    return &unk_1E9CEB108;
  else
    return (id)qword_1E9C41410[a3 - 3];
}

- (HKInteractiveChartOverlayNamedDataSource)cacheDataSource
{
  return self->_cacheDataSource;
}

- (void)setCacheDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDataSource, a3);
}

- (HKDisplayType)primaryDisplayType
{
  return self->_primaryDisplayType;
}

- (void)setPrimaryDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDisplayType, a3);
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
  objc_storeStrong((id *)&self->_cacheDataSource, 0);
}

@end
