@implementation HKChartSummaryTrendModelObserverWrapper

- (HKChartSummaryTrendModelObserver)weakObserver
{
  return (HKChartSummaryTrendModelObserver *)objc_loadWeakRetained((id *)&self->_weakObserver);
}

- (void)setWeakObserver:(id)a3
{
  objc_storeWeak((id *)&self->_weakObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakObserver);
}

@end
