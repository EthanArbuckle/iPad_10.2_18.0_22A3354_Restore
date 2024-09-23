@implementation FIUIChartPointNumeric

+ (id)chartPointWithXValue:(id)a3 yValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithXValue:yValue:", v7, v6);

  return v8;
}

- (FIUIChartPointNumeric)initWithXValue:(id)a3 yValue:(id)a4
{
  id v7;
  id v8;
  FIUIChartPointNumeric *v9;
  FIUIChartPointNumeric *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[FIUIChartPointNumeric init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xValue, a3);
    objc_storeStrong((id *)&v10->_yValue, a4);
  }

  return v10;
}

- (NSNumber)minYValue
{
  return self->_yValue;
}

- (NSNumber)maxYValue
{
  return self->_yValue;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p, (%@, %@)>"), objc_opt_class(), self, self->_xValue, self->_yValue);
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
