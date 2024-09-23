@implementation CAFFloatCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFFloatCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (float)floatValue
{
  id v3;
  id v4;
  float v5;
  float v6;

  objc_opt_class();
  -[CAFCharacteristic value](self, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (void)setFloatValue:(float)a3
{
  void *v5;
  double v6;
  char v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;

  -[CAFFloatCharacteristic range](self, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  v7 = objc_msgSend(v5, "valueIsInRange:", v6);

  if ((v7 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[CAFFloatCharacteristic range](self, "range");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v10 = a3;
    objc_msgSend(v17, "valueRoundedToNearestStepValue:", v10);
    objc_msgSend(v9, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic setValue:](self, "setValue:", v11);

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    *(float *)&v8 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFFloatCharacteristic range](self, "range");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CAF_outOfRangeErrorForValue:range:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic setError:](self, "setError:", v15);

    CAFGeneralLogging();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CAFFloatCharacteristic setFloatValue:].cold.1((uint64_t)self, v16, a3);

  }
}

- (CAFFloatRange)range
{
  CAFFloatRange *range;
  CAFFloatRange *v4;
  void *v5;
  CAFFloatRange *v6;
  CAFFloatRange *v7;

  range = self->_range;
  if (!range)
  {
    v4 = [CAFFloatRange alloc];
    -[CAFCharacteristic metaData](self, "metaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CAFRange initWithMetaData:](v4, "initWithMetaData:", v5);
    v7 = self->_range;
    self->_range = v6;

    range = self->_range;
  }
  return range;
}

- (id)formattedValue
{
  void *v3;
  void *v4;
  float v5;
  __CFString *v6;
  __CFString *v7;

  -[CAFCharacteristic value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[CAFFloatCharacteristic floatValue](self, "floatValue");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%g"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("(null)");
  }
  v7 = v6;

  return v7;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("float");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)descriptionExtras
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[CAFFloatCharacteristic range](self, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("range=%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
}

- (void)setFloatValue:(float)a3 .cold.1(uint64_t a1, NSObject *a2, float a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2050;
  v6 = a3;
  _os_log_error_impl(&dword_237717000, a2, OS_LOG_TYPE_ERROR, "%{public}@ floatValue out of range %{public}g", (uint8_t *)&v3, 0x16u);
}

@end
