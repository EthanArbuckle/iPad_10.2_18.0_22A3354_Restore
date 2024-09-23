@implementation _HKSleepTrendContext

- (_HKSleepTrendContext)initWithBaseDisplayType:(id)a3 trendModel:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 overlayMode:(int64_t)a7 contextChangeDelegate:(id)a8
{
  id v15;
  id v16;
  _HKSleepTrendContext *v17;
  _HKSleepTrendContext *v18;
  objc_super v20;

  v15 = a3;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)_HKSleepTrendContext;
  v17 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](&v20, sel_initWithBaseDisplayType_trendModel_overlayChartController_applicationItems_overlayMode_, v15, a4, a5, a6, a7);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_baseDisplayType, a3);
    objc_storeWeak((id *)&v18->_contextChangeDelegate, v16);
  }

  return v18;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return -[HKOverlayRoomTrendContext overlayMode](self, "overlayMode") != 3;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[_HKSleepTrendContext contextChangeDelegate](self, "contextChangeDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDurationContextSelected:", v5);

}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  return (HKOverlaySleepRoomContextChangeDelegate *)objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
}

- (void)setContextChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contextChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
}

@end
