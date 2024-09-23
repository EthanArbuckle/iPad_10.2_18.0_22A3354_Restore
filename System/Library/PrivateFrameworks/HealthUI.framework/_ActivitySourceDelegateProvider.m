@implementation _ActivitySourceDelegateProvider

- (_ActivitySourceDelegateProvider)initWithDataProvider:(id)a3 activityValue:(int64_t)a4 displayTypeController:(id)a5 unitPreferenceController:(id)a6
{
  id v11;
  _ActivitySourceDelegateProvider *v12;
  _ActivitySourceDelegateProvider *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_ActivitySourceDelegateProvider;
  v12 = -[_ActivitySourceDelegate initWithActivityValue:displayTypeController:unitPreferenceController:](&v15, sel_initWithActivityValue_displayTypeController_unitPreferenceController_, a4, a5, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataProvider, a3);
    objc_storeWeak((id *)&v13->_dateRangeDataUpdateDelegate, 0);
    -[HKActivitySummaryDataProvider addObserver:](v13->_dataProvider, "addObserver:", v13);
  }

  return v13;
}

- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[_ActivitySourceDelegateProvider dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activitySummariesForDateRange:timeScope:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)activitySummaryDataProviderDidUpdateActivitySummaries:(id)a3
{
  id v3;

  -[_ActivitySourceDelegateProvider dateRangeDataUpdateDelegate](self, "dateRangeDataUpdateDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateRangeDataUpdated");

}

- (HKActivitySummaryDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (HKDateRangeDataUpdateDelegate)dateRangeDataUpdateDelegate
{
  return (HKDateRangeDataUpdateDelegate *)objc_loadWeakRetained((id *)&self->_dateRangeDataUpdateDelegate);
}

- (void)setDateRangeDataUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dateRangeDataUpdateDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dateRangeDataUpdateDelegate);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
