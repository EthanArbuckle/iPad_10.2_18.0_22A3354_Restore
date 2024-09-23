@implementation _HKFixedValueDateSpanDelegate

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[_HKFixedValueDateSpanDelegate fixedValueDateSpanDataSource](self, "fixedValueDateSpanDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataForDateRange:timeScope:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HKFixedValueDateSpanDataSource)fixedValueDateSpanDataSource
{
  return (HKFixedValueDateSpanDataSource *)objc_loadWeakRetained((id *)&self->_fixedValueDateSpanDataSource);
}

- (void)setFixedValueDateSpanDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_fixedValueDateSpanDataSource, a3);
}

- (HKDateRangeDataUpdateDelegate)updateCallbackDelegate
{
  return (HKDateRangeDataUpdateDelegate *)objc_loadWeakRetained((id *)&self->_updateCallbackDelegate);
}

- (void)setUpdateCallbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updateCallbackDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCallbackDelegate);
  objc_destroyWeak((id *)&self->_fixedValueDateSpanDataSource);
}

@end
