@implementation HRInteractiveChartBloodPressureChartViewController

- (id)makeStandardCurrentValueViewDataSource
{
  _TtC15HealthRecordsUI39BloodPressureCurrentValueViewDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  _TtC15HealthRecordsUI39BloodPressureCurrentValueViewDataSource *v7;

  v3 = [_TtC15HealthRecordsUI39BloodPressureCurrentValueViewDataSource alloc];
  -[HKInteractiveChartViewController dateCache](self, "dateCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController selectedRangeFormatter](self, "selectedRangeFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BloodPressureCurrentValueViewDataSource initWithDateCache:healthStore:selectedRangeFormatter:](v3, "initWithDateCache:healthStore:selectedRangeFormatter:", v4, v5, v6);

  -[HKCurrentValueViewDataSource setDelegate:](v7, "setDelegate:", self);
  return v7;
}

@end
