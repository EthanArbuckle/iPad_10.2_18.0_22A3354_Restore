@implementation _HKInteractiveChartOverlayDeliverCachedData

- (_HKInteractiveChartOverlayDeliverCachedData)initWithOverlayController:(id)a3 dataSource:(id)a4 graphSeriesContext:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 startDate:(id)a8 endDate:(id)a9 completion:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _HKInteractiveChartOverlayDeliverCachedData *v19;
  _HKInteractiveChartOverlayDeliverCachedData *v20;
  void *v21;
  id completion;
  id v26;
  objc_super v27;

  v14 = a3;
  v26 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)_HKInteractiveChartOverlayDeliverCachedData;
  v19 = -[_HKInteractiveChartOverlayDeliverCachedData init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    -[_HKInteractiveChartOverlayDeliverCachedData setOverlayController:](v19, "setOverlayController:", v14);
    objc_storeStrong((id *)&v20->_dataSource, a4);
    objc_storeStrong(&v20->_graphSeriesContext, a5);
    v20->_timeScope = a6;
    v20->_resolution = a7;
    objc_storeStrong((id *)&v20->_startDate, a8);
    objc_storeStrong((id *)&v20->_endDate, a9);
    v21 = _Block_copy(v18);
    completion = v20->_completion;
    v20->_completion = v21;

  }
  return v20;
}

- (BOOL)deliverDataToCompletion
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[_HKInteractiveChartOverlayDeliverCachedData overlayController](self, "overlayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKInteractiveChartOverlayDeliverCachedData dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKInteractiveChartOverlayDeliverCachedData graphSeriesContext](self, "graphSeriesContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_HKInteractiveChartOverlayDeliverCachedData timeScope](self, "timeScope");
  v7 = -[_HKInteractiveChartOverlayDeliverCachedData resolution](self, "resolution");
  -[_HKInteractiveChartOverlayDeliverCachedData startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKInteractiveChartOverlayDeliverCachedData endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKInteractiveChartOverlayDeliverCachedData completion](self, "completion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v3, "_deliverCachedDataFromSource:graphSeriesContext:timeScope:resolution:startDate:endDate:completion:", v4, v5, v6, v7, v8, v9, v10);

  return v6;
}

- (HKInteractiveChartOverlayViewController)overlayController
{
  return (HKInteractiveChartOverlayViewController *)objc_loadWeakRetained((id *)&self->_overlayController);
}

- (void)setOverlayController:(id)a3
{
  objc_storeWeak((id *)&self->_overlayController, a3);
}

- (HKGraphSeriesDataSource)dataSource
{
  return self->_dataSource;
}

- (id)graphSeriesContext
{
  return self->_graphSeriesContext;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_graphSeriesContext, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_overlayController);
}

@end
