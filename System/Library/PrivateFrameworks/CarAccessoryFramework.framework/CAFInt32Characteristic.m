@implementation CAFInt32Characteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFInt32Characteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (int)int32Value
{
  id v3;
  id v4;
  int v5;

  objc_opt_class();
  -[CAFCharacteristic value](self, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "intValue");
  return v5;
}

- (void)setInt32Value:(int)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;

  v3 = *(_QWORD *)&a3;
  -[CAFInt32Characteristic range](self, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "valueIsInRange:", v3);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[CAFInt32Characteristic range](self, "range");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInt:", objc_msgSend(v14, "valueRoundedToNearestStepValue:", v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic setValue:](self, "setValue:", v8);

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFInt32Characteristic range](self, "range");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CAF_outOfRangeErrorForValue:range:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic setError:](self, "setError:", v12);

    CAFGeneralLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CAFInt32Characteristic setInt32Value:].cold.1((uint64_t)self, v3, v13);

  }
}

- (CAFInt32Range)range
{
  CAFInt32Range *range;
  CAFInt32Range *v4;
  void *v5;
  CAFInt32Range *v6;
  CAFInt32Range *v7;

  range = self->_range;
  if (!range)
  {
    v4 = [CAFInt32Range alloc];
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
  __CFString *v4;
  __CFString *v5;

  -[CAFCharacteristic value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[CAFInt32Characteristic int32Value](self, "int32Value"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("(null)");
  }
  v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("int32");
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
  -[CAFInt32Characteristic range](self, "range");
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

- (void)setInt32Value:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 1026;
  v6 = a2;
  _os_log_error_impl(&dword_237717000, log, OS_LOG_TYPE_ERROR, "%{public}@ int32Value out of range %{public}d", (uint8_t *)&v3, 0x12u);
}

@end
