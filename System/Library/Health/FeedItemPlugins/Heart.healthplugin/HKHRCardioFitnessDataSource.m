@implementation HKHRCardioFitnessDataSource

- (HKHRCardioFitnessDataSource)initWithHealthStore:(id)a3 classificationsAvailable:(BOOL)a4
{
  id v6;
  HKHRCardioFitnessDataSource *v7;
  HKHRCardioFitnessDataSource *v8;
  id v9;
  void *v10;
  uint64_t v11;
  HKHRCardioFitnessAnalyticsManager *analyticsManager;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHRCardioFitnessDataSource;
  v7 = -[HKHRCardioFitnessDataSource init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_classificationsAvailable = a4;
    v9 = objc_alloc(MEMORY[0x24BE4C010]);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4C008]), "initWithHealthStore:", v6);
    v11 = objc_msgSend(v9, "initWithSignalSource:", v10);
    analyticsManager = v8->_analyticsManager;
    v8->_analyticsManager = (HKHRCardioFitnessAnalyticsManager *)v11;

  }
  return v8;
}

- (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  if (self->_classificationsAvailable)
    objc_msgSend(MEMORY[0x24BE4A2F0], "cardioFitnessInteractiveChartViewControllerWithDisplayDate:applicationItems:preferredOverlay:analyticsDelegate:restorationUserActivity:trendModel:factorDisplayTypes:additionalChartOptions:", a6, a5, a7, self, a8, a9, a10, a11);
  else
    objc_msgSend(MEMORY[0x24BE4A2F0], "vo2MaxInteractiveChartViewControllerWithDisplayDate:applicationItems:restorationUserActivity:trendModel:factorDisplayTypes:additionalChartOptions:", a6, a5, a8, a9, a10, a11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didChangeFromOverlayWithIdentifier:(id)a3 toOverlayWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[HKHRCardioFitnessDataSource analyticsManager](self, "analyticsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "submitClassificationChartOverlaySelectedEventCurrentOverlay:previousOverlay:", v6, v9);

}

- (BOOL)classificationsAvailable
{
  return self->_classificationsAvailable;
}

- (void)setClassificationsAvailable:(BOOL)a3
{
  self->_classificationsAvailable = a3;
}

- (HKHRCardioFitnessAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end
