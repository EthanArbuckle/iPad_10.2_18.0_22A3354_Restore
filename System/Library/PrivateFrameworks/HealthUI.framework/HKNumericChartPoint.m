@implementation HKNumericChartPoint

- (HKNumericChartPoint)initWithXValue:(id)a3 yValue:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKNumericChartPoint *v12;
  HKNumericChartPoint *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKNumericChartPoint;
  v12 = -[HKNumericChartPoint init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_xValue, a3);
    objc_storeStrong(&v13->_yValue, a4);
    objc_storeStrong((id *)&v13->_userInfo, a5);
  }

  return v13;
}

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)yValue
{
  return self->_yValue;
}

- (id)allYValues
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_yValue)
  {
    v4[0] = self->_yValue;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong(&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
