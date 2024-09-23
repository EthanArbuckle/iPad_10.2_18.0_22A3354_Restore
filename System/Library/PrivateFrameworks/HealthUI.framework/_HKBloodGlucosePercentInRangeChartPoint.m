@implementation _HKBloodGlucosePercentInRangeChartPoint

- (_HKBloodGlucosePercentInRangeChartPoint)initWithStartDate:(id)a3 endDate:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  _HKBloodGlucosePercentInRangeChartPoint *v11;
  uint64_t v12;
  NSDate *midDate;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSNumber *fractionBelowUpperLevel2HypoglycemiaBound;
  double v22;
  uint64_t v23;
  NSNumber *fractionBelowUpperLevel1HypoglycemiaBound;
  uint64_t v25;
  NSNumber *fractionBelowUpperEuglycemiaBound;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_HKBloodGlucosePercentInRangeChartPoint;
  v11 = -[_HKBloodGlucosePercentInRangeChartPoint init](&v28, sel_init);
  if (v11)
  {
    HKUIMidDate(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    midDate = v11->_midDate;
    v11->_midDate = (NSDate *)v12;

    objc_msgSend(v10, "fractionForClassification:", 0);
    v15 = v14;
    objc_msgSend(v10, "fractionForClassification:", 1);
    v17 = v16;
    objc_msgSend(v10, "fractionForClassification:", 2);
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v20 = objc_claimAutoreleasedReturnValue();
    fractionBelowUpperLevel2HypoglycemiaBound = v11->_fractionBelowUpperLevel2HypoglycemiaBound;
    v11->_fractionBelowUpperLevel2HypoglycemiaBound = (NSNumber *)v20;

    v22 = v15 + v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    fractionBelowUpperLevel1HypoglycemiaBound = v11->_fractionBelowUpperLevel1HypoglycemiaBound;
    v11->_fractionBelowUpperLevel1HypoglycemiaBound = (NSNumber *)v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22 + v19);
    v25 = objc_claimAutoreleasedReturnValue();
    fractionBelowUpperEuglycemiaBound = v11->_fractionBelowUpperEuglycemiaBound;
    v11->_fractionBelowUpperEuglycemiaBound = (NSNumber *)v25;

    objc_storeStrong((id *)&v11->_userInfo, a5);
  }

  return v11;
}

- (id)xValueAsGenericType
{
  return self->_midDate;
}

- (id)yValue
{
  return &unk_1E9CED688;
}

- (id)yValueForKey:(id)a3
{
  return 0;
}

- (id)allYValues
{
  __int128 v3;
  NSNumber *fractionBelowUpperEuglycemiaBound;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_fractionBelowUpperLevel2HypoglycemiaBound;
  fractionBelowUpperEuglycemiaBound = self->_fractionBelowUpperEuglycemiaBound;
  v5 = &unk_1E9CED688;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)minYValue
{
  return &unk_1E9CED100;
}

- (NSDate)midDate
{
  return self->_midDate;
}

- (void)setMidDate:(id)a3
{
  objc_storeStrong((id *)&self->_midDate, a3);
}

- (NSNumber)fractionBelowUpperLevel2HypoglycemiaBound
{
  return self->_fractionBelowUpperLevel2HypoglycemiaBound;
}

- (void)setFractionBelowUpperLevel2HypoglycemiaBound:(id)a3
{
  objc_storeStrong((id *)&self->_fractionBelowUpperLevel2HypoglycemiaBound, a3);
}

- (NSNumber)fractionBelowUpperLevel1HypoglycemiaBound
{
  return self->_fractionBelowUpperLevel1HypoglycemiaBound;
}

- (void)setFractionBelowUpperLevel1HypoglycemiaBound:(id)a3
{
  objc_storeStrong((id *)&self->_fractionBelowUpperLevel1HypoglycemiaBound, a3);
}

- (NSNumber)fractionBelowUpperEuglycemiaBound
{
  return self->_fractionBelowUpperEuglycemiaBound;
}

- (void)setFractionBelowUpperEuglycemiaBound:(id)a3
{
  objc_storeStrong((id *)&self->_fractionBelowUpperEuglycemiaBound, a3);
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_fractionBelowUpperEuglycemiaBound, 0);
  objc_storeStrong((id *)&self->_fractionBelowUpperLevel1HypoglycemiaBound, 0);
  objc_storeStrong((id *)&self->_fractionBelowUpperLevel2HypoglycemiaBound, 0);
  objc_storeStrong((id *)&self->_midDate, 0);
}

@end
