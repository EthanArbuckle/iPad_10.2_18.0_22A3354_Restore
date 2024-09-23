@implementation HKInteractiveChartOxygenSaturationFormatter

- (HKInteractiveChartOxygenSaturationFormatter)initWithStatisticsType:(int64_t)a3
{
  HKInteractiveChartOxygenSaturationFormatter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartOxygenSaturationFormatter;
  result = -[HKInteractiveChartOxygenSaturationFormatter init](&v5, sel_init);
  if (result)
    result->_airPressureStatisticsType = a3;
  return result;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v12.receiver = self;
    v12.super_class = (Class)HKInteractiveChartOxygenSaturationFormatter;
    -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v12, sel_formattedSelectedRangeLabelDataWithChartData_context_, v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKInteractiveChartOxygenSaturationFormatter airPressureStatisticsType](self, "airPressureStatisticsType") == 21)
    {
      v9 = -[HKInteractiveChartOxygenSaturationFormatter airPressureStatisticsType](self, "airPressureStatisticsType");
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStatisticsType:", v9);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (int64_t)airPressureStatisticsType
{
  return self->_airPressureStatisticsType;
}

- (void)setAirPressureStatisticsType:(int64_t)a3
{
  self->_airPressureStatisticsType = a3;
}

@end
