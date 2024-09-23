@implementation _HKAudioStandardQuantityContextDelegate

- (_HKAudioStandardQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4
{
  id v7;
  id v8;
  _HKAudioStandardQuantityContextDelegate *v9;
  _HKAudioStandardQuantityContextDelegate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKAudioStandardQuantityContextDelegate;
  v9 = -[_HKAudioStandardQuantityContextDelegate init](&v12, sel_init);
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
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[_HKAudioStandardQuantityContextDelegate primaryDisplayType](self, "primaryDisplayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_interactiveChartsFormatterForTimeScope:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[_HKAudioStandardQuantityContextDelegate _statItemForTimeScope:](self, "_statItemForTimeScope:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOverrideStatFormatterItemOptions:", v9);

  }
  return v6;
}

- (id)_statItemForTimeScope:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 5)
    return &unk_1E9CEB198;
  else
    return (id)qword_1E9C41AA0[a3 - 3];
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
