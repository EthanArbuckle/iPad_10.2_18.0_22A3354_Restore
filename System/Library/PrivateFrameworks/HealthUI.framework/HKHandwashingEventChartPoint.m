@implementation HKHandwashingEventChartPoint

- (HKHandwashingEventChartPoint)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  HKHandwashingEventChartPoint *v9;
  HKHandwashingEventChartPoint *v10;
  uint64_t v11;
  NSDate *midDate;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKHandwashingEventChartPoint;
  v9 = -[HKHandwashingEventChartPoint init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
    HKUIMidDate(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    midDate = v10->_midDate;
    v10->_midDate = (NSDate *)v11;

  }
  return v10;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HKHandwashingEventChartPoint yValue](self, "yValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)averageDuration
{
  return self->_averageDuration;
}

- (void)setAverageDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)meetsGoal
{
  return self->_meetsGoal;
}

- (void)setMeetsGoal:(BOOL)a3
{
  self->_meetsGoal = a3;
}

- (NSDate)midDate
{
  return self->_midDate;
}

- (void)setMidDate:(id)a3
{
  objc_storeStrong((id *)&self->_midDate, a3);
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_midDate, 0);
  objc_storeStrong((id *)&self->_averageDuration, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
