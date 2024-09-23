@implementation CAFMeasurementCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMeasurementCharacteristic;
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
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x24BDD1660];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "doubleValue");
  v8 = v7;

  -[CAFMeasurementCharacteristic unit](self, "unit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v6, "initWithDoubleValue:unit:", v9, v8);

  -[CAFMeasurementCharacteristic unit](self, "unit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "measurementByConvertingToUnit:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMeasurementCharacteristic _setNumberValue:](self, "_setNumberValue:", v11);

}

- (NSMeasurement)measurementValue
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD1660]);
  -[CAFMeasurementCharacteristic numberValue](self, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  -[CAFMeasurementCharacteristic unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithDoubleValue:unit:", v7, v6);

  return (NSMeasurement *)v8;
}

- (void)setMeasurementValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAFMeasurementCharacteristic unit](self, "unit");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAFMeasurementCharacteristic _setNumberValue:](self, "_setNumberValue:", v5);
}

- (void)_setNumberValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMeasurementCharacteristic range](self, "range");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "valueIsInRange:", v5);

  if ((v8 & 1) != 0)
  {
    -[CAFMeasurementCharacteristic range](self, "range");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject valueRoundedToNearestStepValue:](v9, "valueRoundedToNearestStepValue:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic setValue:](self, "setValue:", v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    -[CAFMeasurementCharacteristic range](self, "range");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CAF_outOfRangeErrorForValue:range:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic setError:](self, "setError:", v13);

    CAFGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAFMeasurementCharacteristic _setNumberValue:].cold.1((uint64_t)self, (uint64_t)v6, v9);
  }

}

- (NSUnit)unit
{
  void *v3;
  void *v4;
  unsigned __int16 v5;
  int v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;

  -[CAFCharacteristic metaData](self, "metaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "units");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "unsignedIntValue");
  else
    v5 = 0;
  v6 = v5;
  NSUnitFromCAFUnitType(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    CAFGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9)
        -[CAFMeasurementCharacteristic unit].cold.2(self, v6, v8);
    }
    else if (v9)
    {
      -[CAFMeasurementCharacteristic unit].cold.1(self, v8);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18A0]), "initWithSymbol:", &stru_2508FF798);
  }

  return (NSUnit *)v7;
}

- (CAFMeasurementRange)range
{
  CAFMeasurementRange *range;
  CAFMeasurementRange *v4;
  void *v5;
  void *v6;
  CAFMeasurementRange *v7;
  CAFMeasurementRange *v8;

  range = self->_range;
  if (!range)
  {
    v4 = [CAFMeasurementRange alloc];
    -[CAFCharacteristic metaData](self, "metaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFMeasurementCharacteristic unit](self, "unit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAFMeasurementRange initWithMetaData:unit:](v4, "initWithMetaData:unit:", v5, v6);
    v8 = self->_range;
    self->_range = v7;

    range = self->_range;
  }
  return range;
}

+ (id)_sharedStringFromMeasurement:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _sharedStringFromMeasurement__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_sharedStringFromMeasurement__onceToken, &__block_literal_global_13);
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedStringFromMeasurement__sharedFormatterLock);
  objc_msgSend((id)_sharedStringFromMeasurement__sharedFormatter, "stringFromMeasurement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedStringFromMeasurement__sharedFormatterLock);
  return v5;
}

uint64_t __61__CAFMeasurementCharacteristic__sharedStringFromMeasurement___block_invoke()
{
  id v0;
  void *v1;

  _sharedStringFromMeasurement__sharedFormatterLock = 0;
  v0 = objc_alloc_init(MEMORY[0x24BDD1668]);
  v1 = (void *)_sharedStringFromMeasurement__sharedFormatter;
  _sharedStringFromMeasurement__sharedFormatter = (uint64_t)v0;

  return objc_msgSend((id)_sharedStringFromMeasurement__sharedFormatter, "setUnitOptions:", 1);
}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFMeasurementCharacteristic measurementValue](self, "measurementValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFMeasurementCharacteristic _sharedStringFromMeasurement:](CAFMeasurementCharacteristic, "_sharedStringFromMeasurement:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("Measurement");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[42];

  v3[41] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x0000000031000010");
  v3[1] = CFSTR("0x0000000030000045");
  v3[2] = CFSTR("0x0000000030000031");
  v3[3] = CFSTR("0x000000003000004D");
  v3[4] = CFSTR("0x000000003000004C");
  v3[5] = CFSTR("0x0000000040000001");
  v3[6] = CFSTR("0x000000004000000A");
  v3[7] = CFSTR("0x0000000031000019");
  v3[8] = CFSTR("0x0000000030000022");
  v3[9] = CFSTR("0x000000003000004A");
  v3[10] = CFSTR("0x000000003000004B");
  v3[11] = CFSTR("0x0000000030000023");
  v3[12] = CFSTR("0x0000000030000025");
  v3[13] = CFSTR("0x0000000035000012");
  v3[14] = CFSTR("0x0000000035000013");
  v3[15] = CFSTR("0x0000000041000002");
  v3[16] = CFSTR("0x000000004100001A");
  v3[17] = CFSTR("0x0000000032000032");
  v3[18] = CFSTR("0x0000000032000033");
  v3[19] = CFSTR("0x0000000030000028");
  v3[20] = CFSTR("0x0000000030000053");
  v3[21] = CFSTR("0x0000000030000052");
  v3[22] = CFSTR("0x0000000030000051");
  v3[23] = CFSTR("0x0000000030000050");
  v3[24] = CFSTR("0x000000003000001B");
  v3[25] = CFSTR("0x0000000030000030");
  v3[26] = CFSTR("0x0000000030000024");
  v3[27] = CFSTR("0x000000003000004F");
  v3[28] = CFSTR("0x000000003000004E");
  v3[29] = CFSTR("0x0000000030000021");
  v3[30] = CFSTR("0x0000000030000046");
  v3[31] = CFSTR("0x0000000030000047");
  v3[32] = CFSTR("0x0000000030000048");
  v3[33] = CFSTR("0x0000000030000049");
  v3[34] = CFSTR("0x0000000031000017");
  v3[35] = CFSTR("0x000000003000001D");
  v3[36] = CFSTR("0x0000000030000056");
  v3[37] = CFSTR("0x0000000030000057");
  v3[38] = CFSTR("0x0000000030000055");
  v3[39] = CFSTR("0x0000000030000054");
  v3[40] = CFSTR("0x0000000049000003");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 41);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
}

- (void)_setNumberValue:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_1_3(&dword_237717000, a3, (uint64_t)a3, "%{public}@ numberValue out of range %{public}@", (uint8_t *)&v3);
}

- (void)unit
{
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "typeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109634;
  v8[1] = a2;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  _os_log_error_impl(&dword_237717000, a3, OS_LOG_TYPE_ERROR, "UnitType %d is unknown for %@(%@)", (uint8_t *)v8, 0x1Cu);

}

@end
