@implementation _HKCardioFitnessClassificationContext

- (_HKCardioFitnessClassificationContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 delegate:(id)a6
{
  id v10;
  _HKCardioFitnessClassificationContext *v11;
  _HKCardioFitnessClassificationContext *v12;
  objc_super v14;

  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)_HKCardioFitnessClassificationContext;
  v11 = -[_HKCardioFitnessOverlayContext initWithMode:applicationItems:overlayChartController:](&v14, sel_initWithMode_applicationItems_overlayChartController_, a3, a4, a5);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_delegate, v10);

  return v12;
}

- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6
{
  return 0;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  return 0;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v10 = a3;
  v11 = a7;
  -[_HKCardioFitnessOverlayContext overlayChartController](self, "overlayChartController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryDisplayType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    -[_HKCardioFitnessOverlayContext overlayChartController](self, "overlayChartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "graphSeriesForTimeScope:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E9C40570;
    v19[4] = self;
    v20 = v11;
    objc_msgSend(v15, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v16, a5, 0, v17, v18, v19);

  }
}

- (_HKCardioFitnessClassificationContextDelegate)delegate
{
  return (_HKCardioFitnessClassificationContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
