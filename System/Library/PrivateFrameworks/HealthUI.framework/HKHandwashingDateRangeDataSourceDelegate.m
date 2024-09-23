@implementation HKHandwashingDateRangeDataSourceDelegate

- (HKHandwashingDateRangeDataSourceDelegate)initWithGoal:(double)a3
{
  HKHandwashingDateRangeDataSourceDelegate *v4;
  HKHandwashingDateRangeDataSourceDelegate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHandwashingDateRangeDataSourceDelegate;
  v4 = -[HKHandwashingDateRangeDataSourceDelegate init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[HKHandwashingDateRangeDataSourceDelegate setGoal:](v4, "setGoal:", a3);
  return v5;
}

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "seriesPointIntervalComponentsAtResolution:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKGraphZoomLevelConfiguration defaultCalendar](HKGraphZoomLevelConfiguration, "defaultCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v6, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__HKHandwashingDateRangeDataSourceDelegate_dataForDateRange_timeScope___block_invoke;
  v19[3] = &unk_1E9C450C8;
  v19[4] = self;
  v15 = v10;
  v20 = v15;
  objc_msgSend(v9, "hk_enumerateDateInterval:byDateComponents:block:", v14, v8, v19);

  v16 = v20;
  v17 = v15;

  return v17;
}

void __71__HKHandwashingDateRangeDataSourceDelegate_dataForDateRange_timeScope___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKHandwashingEventChartPoint *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKHandwashingEventChartPoint *v9;

  v3 = a2;
  v4 = [HKHandwashingEventChartPoint alloc];
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKHandwashingEventChartPoint initWithStartDate:endDate:](v4, "initWithStartDate:endDate:", v5, v6);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "goal");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHandwashingEventChartPoint setAverageDuration:](v9, "setAverageDuration:", v8);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
}

- (double)goal
{
  return self->_goal;
}

- (void)setGoal:(double)a3
{
  self->_goal = a3;
}

@end
