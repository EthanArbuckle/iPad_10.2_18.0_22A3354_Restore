@implementation LACSharedModeDataSourceTaskDecoratorRuntime

- (LACSharedModeDataSourceTaskDecoratorRuntime)init
{
  return -[LACSharedModeDataSourceTaskDecoratorRuntime initWithMinValue:maxValue:](self, "initWithMinValue:maxValue:", 0.025, 0.2);
}

- (LACSharedModeDataSourceTaskDecoratorRuntime)initWithMinValue:(double)a3 maxValue:(double)a4
{
  LACSharedModeDataSourceTaskDecoratorRuntime *result;
  id v7;
  objc_super v8;

  if (a3 > a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Runtime minValue must be less than or equal to maxValue"));
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)LACSharedModeDataSourceTaskDecoratorRuntime;
  result = -[LACSharedModeDataSourceTaskDecoratorRuntime init](&v8, sel_init);
  if (result)
  {
    result->_minValue = a3;
    result->_maxValue = a4;
    result->_effectiveMaxValue = a4;
    result->_effectiveMinValue = a3;
  }
  return result;
}

- (double)maxValue
{
  return self->_effectiveMaxValue;
}

- (double)minValue
{
  return self->_effectiveMinValue;
}

- (void)halveMaxValue
{
  double minValue;

  minValue = self->_minValue;
  if (minValue < self->_effectiveMaxValue * 0.5)
    minValue = self->_effectiveMaxValue * 0.5;
  self->_effectiveMaxValue = minValue;
}

- (void)resetMaxValue
{
  self->_effectiveMaxValue = self->_maxValue;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[LACSharedModeDataSourceTaskDecoratorRuntime minValue](self, "minValue");
    v7 = v6;
    objc_msgSend(v5, "minValue");
    if (v7 == v8)
    {
      -[LACSharedModeDataSourceTaskDecoratorRuntime maxValue](self, "maxValue");
      v11 = v10;
      objc_msgSend(v5, "maxValue");
      v9 = v11 == v12;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v12[0] = CFSTR("minValue");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[LACSharedModeDataSourceTaskDecoratorRuntime minValue](self, "minValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("maxValue");
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[LACSharedModeDataSourceTaskDecoratorRuntime maxValue](self, "maxValue");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
