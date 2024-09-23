@implementation CAFNumberCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFNumberCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSNumber)numberValue
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFCharacteristic value](self, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (void)setNumberValue:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CAFNumberCharacteristic range](self, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInRange:", v4);

  if ((v6 & 1) != 0)
  {
    -[CAFNumberCharacteristic range](self, "range");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject valueRoundedToNearestStepValue:](v7, "valueRoundedToNearestStepValue:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic setValue:](self, "setValue:", v8);

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    -[CAFNumberCharacteristic range](self, "range");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CAF_outOfRangeErrorForValue:range:", v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic setError:](self, "setError:", v11);

    CAFGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAFNumberCharacteristic setNumberValue:].cold.1((uint64_t)self, (uint64_t)v4, v7);
  }

}

- (CAFRange)range
{
  CAFRange *range;
  CAFRange *v4;
  void *v5;
  CAFRange *v6;
  CAFRange *v7;

  range = self->_range;
  if (!range)
  {
    v4 = [CAFRange alloc];
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
  void *v5;
  __CFString *v6;

  -[CAFCharacteristic value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[CAFNumberCharacteristic numberValue](self, "numberValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("(null)");
  }

  return v6;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("int8");
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
  -[CAFNumberCharacteristic range](self, "range");
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

- (void)setNumberValue:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_237717000, log, OS_LOG_TYPE_ERROR, "%{public}@ numberValue out of range %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
