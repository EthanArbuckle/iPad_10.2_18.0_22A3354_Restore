@implementation CLKSimpleGaugeProvider

+ (CLKSimpleGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColors:(NSArray *)gaugeColors gaugeColorLocations:(NSArray *)gaugeColorLocations fillFraction:(float)fillFraction
{
  NSArray *v9;
  NSArray *v10;
  id v11;
  double v12;

  v9 = gaugeColorLocations;
  v10 = gaugeColors;
  v11 = -[CLKGaugeProvider _init]([CLKSimpleGaugeProvider alloc], "_init");
  objc_msgSend(v11, "setStyle:", style);
  objc_msgSend(v11, "setGaugeColors:", v10);

  objc_msgSend(v11, "setGaugeColorLocations:", v9);
  *(float *)&v12 = fillFraction;
  objc_msgSend(v11, "setFillFraction:", v12);
  return (CLKSimpleGaugeProvider *)v11;
}

+ (CLKSimpleGaugeProvider)gaugeProviderWithStyle:(CLKGaugeProviderStyle)style gaugeColor:(UIColor *)color fillFraction:(float)fillFraction
{
  void *v8;
  UIColor *v9;
  void *v10;
  double v11;
  void *v12;
  UIColor *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v14 = color;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = color;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v11 = fillFraction;
  objc_msgSend(a1, "gaugeProviderWithStyle:gaugeColors:gaugeColorLocations:fillFraction:", style, v10, 0, v11, v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLKSimpleGaugeProvider *)v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKSimpleGaugeProvider;
  v4 = a3;
  -[CLKGaugeProvider encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->_fillFraction;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_FillFractionKey"), v5, v6.receiver, v6.super_class);

}

- (CLKSimpleGaugeProvider)initWithCoder:(id)a3
{
  id v4;
  CLKSimpleGaugeProvider *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKSimpleGaugeProvider;
  v5 = -[CLKGaugeProvider initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_FillFractionKey"));
    v5->_fillFraction = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)needsTimerUpdates
{
  return 0;
}

- (double)progressFractionForNow:(id)a3
{
  return self->_fillFraction;
}

- (id)startUpdatesWithHandler:(id)a3
{
  return &unk_24CC17698;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float fillFraction;
  float v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKSimpleGaugeProvider;
  if (-[CLKGaugeProvider isEqual:](&v9, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    fillFraction = self->_fillFraction;
    objc_msgSend(v4, "fillFraction");
    v7 = fillFraction == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKSimpleGaugeProvider;
  v3 = (double)-[CLKGaugeProvider hash](&v8, sel_hash);
  *(float *)&v4 = self->_fillFraction;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)(v3 + (double)(unint64_t)objc_msgSend(v5, "hash") * 10000.0);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKSimpleGaugeProvider;
  result = -[CLKGaugeProvider copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result != self)
    *((_DWORD *)result + 12) = LODWORD(self->_fillFraction);
  return result;
}

- (CLKSimpleGaugeProvider)initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  CLKSimpleGaugeProvider *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKSimpleGaugeProvider;
  v5 = -[CLKGaugeProvider initWithJSONObjectRepresentation:](&v9, sel_initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gaugeFillFraction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      v5->_fillFraction = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("gaugeColorLocations"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("gaugeFillFraction"), v6);
    }

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKSimpleGaugeProvider;
  -[CLKGaugeProvider JSONObjectRepresentation](&v8, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  *(float *)&v5 = self->_fillFraction;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("gaugeFillFraction"));

  return v4;
}

- (BOOL)validate
{
  _BOOL4 v3;
  float fillFraction;
  BOOL v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKSimpleGaugeProvider;
  v3 = -[CLKGaugeProvider validate](&v8, sel_validate);
  if (v3)
  {
    fillFraction = self->_fillFraction;
    if (fillFraction == -1.0 || (fillFraction >= 0.0 ? (v5 = fillFraction <= 1.0) : (v5 = 0), v5))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      CLKLoggingObjectForDomain(10);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[CLKSimpleGaugeProvider validate].cold.1((uint64_t)self, v6);

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (float)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(float)a3
{
  self->_fillFraction = a3;
}

- (void)validate
{
  void *v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v4 = v3;
  v6 = 138412546;
  v7 = v3;
  v8 = 2112;
  v9 = (id)objc_opt_class();
  v5 = v9;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "Property 'fillFraction' on %@ must have a value between 0 and 1 when passing %@ to the complication data handler", (uint8_t *)&v6, 0x16u);

}

@end
