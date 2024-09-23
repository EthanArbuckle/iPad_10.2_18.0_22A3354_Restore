@implementation _HKWalkingQuantityContextDelegate

- (_HKWalkingQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4
{
  id v7;
  id v8;
  _HKWalkingQuantityContextDelegate *v9;
  _HKWalkingQuantityContextDelegate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKWalkingQuantityContextDelegate;
  v9 = -[_HKWalkingQuantityContextDelegate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheDataSource, a3);
    objc_storeStrong((id *)&v10->_primaryDisplayType, a4);
  }

  return v10;
}

- (HKLineSeries)alternateLineSeries
{
  return 0;
}

- (id)formatterForTimescope:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[HKDisplayType hk_interactiveChartsFormatterForTimeScope:](self->_primaryDisplayType, "hk_interactiveChartsFormatterForTimeScope:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[_HKWalkingQuantityContextDelegate _statItemForTimeScope:](self, "_statItemForTimeScope:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverrideStatFormatterItemOptions:", v8);

  }
  return v5;
}

- (id)_statItemForTimeScope:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 5)
    return &unk_1E9CEB4F8;
  else
    return (id)qword_1E9C42728[a3 - 3];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
  objc_storeStrong((id *)&self->_cacheDataSource, 0);
}

@end
