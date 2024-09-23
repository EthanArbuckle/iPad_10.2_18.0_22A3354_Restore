@implementation CAFMeasurementRange

- (CAFMeasurementRange)initWithMetaData:(id)a3 unit:(id)a4
{
  id v7;
  CAFMeasurementRange *v8;
  CAFMeasurementRange *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CAFMeasurementRange;
  v8 = -[CAFRange initWithMetaData:](&v11, sel_initWithMetaData_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_unit, a4);

  return v9;
}

- (NSMeasurement)minimumValue
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD1660]);
  -[CAFRange minimum](self, "minimum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  -[CAFMeasurementRange unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithDoubleValue:unit:", v7, v6);

  return (NSMeasurement *)v8;
}

- (NSMeasurement)maximumValue
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD1660]);
  -[CAFRange maximum](self, "maximum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  -[CAFMeasurementRange unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithDoubleValue:unit:", v7, v6);

  return (NSMeasurement *)v8;
}

- (NSMeasurement)stepValue
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD1660]);
  -[CAFRange step](self, "step");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  -[CAFMeasurementRange unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithDoubleValue:unit:", v7, v6);

  return (NSMeasurement *)v8;
}

- (id)rangeDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CAFMeasurementRange minimumValue](self, "minimumValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFMeasurementCharacteristic _sharedStringFromMeasurement:](CAFMeasurementCharacteristic, "_sharedStringFromMeasurement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAFMeasurementRange maximumValue](self, "maximumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFMeasurementCharacteristic _sharedStringFromMeasurement:](CAFMeasurementCharacteristic, "_sharedStringFromMeasurement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAFMeasurementRange stepValue](self, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFMeasurementCharacteristic _sharedStringFromMeasurement:](CAFMeasurementCharacteristic, "_sharedStringFromMeasurement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@..%@]x%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)valueIsInRange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  -[CAFMeasurementRange unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "measurementByConvertingToUnit:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v8);

  return (char)self;
}

+ (id)minimum
{
  return &unk_25095C8C0;
}

+ (id)maximum
{
  return &unk_25095C8D0;
}

+ (id)step
{
  return &unk_25095C8E0;
}

- (NSUnit)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
}

@end
