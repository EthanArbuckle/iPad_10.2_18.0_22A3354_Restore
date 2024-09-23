@implementation HKBloodPressureChartPoint

- (void)setChartPoint:(id)a3 forType:(id)a4
{
  id v7;
  id v8;
  HKHealthChartPoint **p_systolicChartPoint;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "code") == 16)
  {
    p_systolicChartPoint = &self->_systolicChartPoint;
LABEL_5:
    objc_storeStrong((id *)p_systolicChartPoint, a3);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "code") == 17)
  {
    p_systolicChartPoint = &self->_diastolicChartPoint;
    goto LABEL_5;
  }
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB5358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5358], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = 138412546;
    v13 = v7;
    v14 = 2048;
    v15 = objc_msgSend(v8, "code");
    _os_log_impl(&dword_1D7813000, v11, OS_LOG_TYPE_DEFAULT, "Attempt to insert chart point %@ for type %ld, this is probably a mistake", (uint8_t *)&v12, 0x16u);

  }
LABEL_6:

}

- (id)xValueAsGenericType
{
  return self->_date;
}

- (id)yValue
{
  HKHealthChartPoint *systolicChartPoint;

  systolicChartPoint = self->_systolicChartPoint;
  if (!systolicChartPoint)
    systolicChartPoint = self->_diastolicChartPoint;
  return -[HKHealthChartPoint yValue](systolicChartPoint, "yValue");
}

- (id)allYValues
{
  id v3;
  HKHealthChartPoint *systolicChartPoint;
  void *v5;
  HKHealthChartPoint *diastolicChartPoint;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  systolicChartPoint = self->_systolicChartPoint;
  if (systolicChartPoint)
  {
    -[HKHealthChartPoint yValue](systolicChartPoint, "yValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  diastolicChartPoint = self->_diastolicChartPoint;
  if (diastolicChartPoint)
  {
    -[HKHealthChartPoint yValue](diastolicChartPoint, "yValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (id)minYValue
{
  HKHealthChartPoint *diastolicChartPoint;

  diastolicChartPoint = self->_diastolicChartPoint;
  if (!diastolicChartPoint)
    diastolicChartPoint = self->_systolicChartPoint;
  return -[HKHealthChartPoint minYValue](diastolicChartPoint, "minYValue");
}

- (id)maxYValue
{
  HKHealthChartPoint *systolicChartPoint;

  systolicChartPoint = self->_systolicChartPoint;
  if (!systolicChartPoint)
    systolicChartPoint = self->_diastolicChartPoint;
  return -[HKHealthChartPoint maxYValue](systolicChartPoint, "maxYValue");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> date: %@, systole: %@, diastole: %@"), objc_opt_class(), self, self->_date, self->_systolicChartPoint, self->_diastolicChartPoint);
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (HKHealthChartPoint)systolicChartPoint
{
  return self->_systolicChartPoint;
}

- (void)setSystolicChartPoint:(id)a3
{
  objc_storeStrong((id *)&self->_systolicChartPoint, a3);
}

- (HKHealthChartPoint)diastolicChartPoint
{
  return self->_diastolicChartPoint;
}

- (void)setDiastolicChartPoint:(id)a3
{
  objc_storeStrong((id *)&self->_diastolicChartPoint, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_diastolicChartPoint, 0);
  objc_storeStrong((id *)&self->_systolicChartPoint, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
