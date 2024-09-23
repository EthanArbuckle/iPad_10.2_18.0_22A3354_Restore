@implementation MXMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXMetric)init
{
  MXMetric *v2;
  NSMeasurementFormatter *v3;
  NSMeasurementFormatter *measurementFormatter;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MXMetric;
  v2 = -[MXMetric init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    measurementFormatter = v2->_measurementFormatter;
    v2->_measurementFormatter = v3;

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v2->_measurementFormatter, "setLocale:", v5);

    -[NSMeasurementFormatter setUnitOptions:](v2->_measurementFormatter, "setUnitOptions:", 1);
    -[NSMeasurementFormatter setUnitStyle:](v2->_measurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v2->_measurementFormatter, "numberFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumFractionDigits:", 0);

  }
  return v2;
}

- (MXMetric)initWithCoder:(id)a3
{
  MXMetric *v3;
  NSMeasurementFormatter *v4;
  NSMeasurementFormatter *measurementFormatter;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MXMetric;
  v3 = -[MXMetric init](&v9, sel_init, a3);
  if (v3)
  {
    v4 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x24BDD1668]);
    measurementFormatter = v3->_measurementFormatter;
    v3->_measurementFormatter = v4;

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    -[NSMeasurementFormatter setLocale:](v3->_measurementFormatter, "setLocale:", v6);

    -[NSMeasurementFormatter setUnitOptions:](v3->_measurementFormatter, "setUnitOptions:", 1);
    -[NSMeasurementFormatter setUnitStyle:](v3->_measurementFormatter, "setUnitStyle:", 2);
    -[NSMeasurementFormatter numberFormatter](v3->_measurementFormatter, "numberFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaximumFractionDigits:", 0);

  }
  return v3;
}

- (id)toDictionary
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (NSData)JSONRepresentation
{
  void *v2;
  void *v3;
  id v5;

  -[MXMetric toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSMeasurementFormatter)measurementFormatter
{
  return (NSMeasurementFormatter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMeasurementFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
}

@end
