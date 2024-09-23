@implementation HKInsulinChartPoint

- (HKInsulinChartPoint)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  HKInsulinChartPoint *v9;
  HKInsulinChartPoint *v10;
  uint64_t v11;
  NSDate *midDate;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKInsulinChartPoint;
  v9 = -[HKInsulinChartPoint init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
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
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[HKInsulinChartPoint basalSum](self, "basalSum");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = &unk_1E9CECD88;
  v11[0] = v5;
  -[HKInsulinChartPoint totalSum](self, "totalSum");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_1E9CECD88;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSNumber)basalSum
{
  return self->_basalSum;
}

- (void)setBasalSum:(id)a3
{
  objc_storeStrong((id *)&self->_basalSum, a3);
}

- (NSNumber)totalSum
{
  return self->_totalSum;
}

- (void)setTotalSum:(id)a3
{
  objc_storeStrong((id *)&self->_totalSum, a3);
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
  objc_storeStrong((id *)&self->_totalSum, 0);
  objc_storeStrong((id *)&self->_basalSum, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
