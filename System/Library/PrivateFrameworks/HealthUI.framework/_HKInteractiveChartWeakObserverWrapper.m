@implementation _HKInteractiveChartWeakObserverWrapper

- (_HKInteractiveChartWeakObserverWrapper)initWithObserver:(id)a3
{
  id v4;
  _HKInteractiveChartWeakObserverWrapper *v5;
  _HKInteractiveChartWeakObserverWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HKInteractiveChartWeakObserverWrapper;
  v5 = -[_HKInteractiveChartWeakObserverWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_observer, v4);

  return v6;
}

- (HKInteractiveChartViewObserver)observer
{
  return (HKInteractiveChartViewObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
