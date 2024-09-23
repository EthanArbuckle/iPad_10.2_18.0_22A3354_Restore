@implementation HFTemperatureColor

- (HFTemperatureColor)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTemperatureInMired_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFColorPrimitive.m"), 110, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTemperatureColor init]",
    v5);

  return 0;
}

- (HFTemperatureColor)initWithTemperatureInKelvin:(float)a3
{
  double v3;

  *(float *)&v3 = 1000000.0 / a3;
  return -[HFTemperatureColor initWithTemperatureInMired:](self, "initWithTemperatureInMired:", v3);
}

- (HFTemperatureColor)initWithTemperatureInMired:(float)a3
{
  HFTemperatureColor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFTemperatureColor;
  result = -[HFTemperatureColor init](&v5, sel_init);
  if (result)
    result->_temperatureInMired = a3;
  return result;
}

- (float)temperatureInKelvin
{
  return 1000000.0 / self->_temperatureInMired;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFTemperatureColor temperatureInMired](self, "temperatureInMired");
  return (id)objc_msgSend(v4, "initWithTemperatureInMired:");
}

- (id)hf_RGBColorRepresentation
{
  float v2;
  HFRGBColor *v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;

  v10 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  -[HFTemperatureColor temperatureInKelvin](self, "temperatureInKelvin");
  HFGetColorForLightTemperature((uint64_t)&v10, (uint64_t)&v9, (uint64_t)&v8, v2);
  v3 = [HFRGBColor alloc];
  HIDWORD(v4) = HIDWORD(v10);
  *(float *)&v4 = v10;
  HIDWORD(v6) = HIDWORD(v8);
  HIDWORD(v5) = HIDWORD(v9);
  *(float *)&v5 = v9;
  *(float *)&v6 = v8;
  return -[HFRGBColor initWithRed:green:blue:](v3, "initWithRed:green:blue:", v4, v5, v6);
}

- (BOOL)isEqual:(id)a3
{
  HFTemperatureColor *v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;

  v4 = (HFTemperatureColor *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HFTemperatureColor temperatureInMired](self, "temperatureInMired");
      v6 = v5;
      -[HFTemperatureColor temperatureInMired](v4, "temperatureInMired");
      v8 = vabds_f32(v6, v7) < 0.001;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HFTemperatureColor temperatureInMired](self, "temperatureInMired");
  objc_msgSend(v2, "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)valueDescription
{
  void *v2;
  float v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HFTemperatureColor temperatureInMired](self, "temperatureInMired");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%fm"), v3);
}

- (id)valueDescriptionInKelvin
{
  void *v2;
  float v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HFTemperatureColor temperatureInKelvin](self, "temperatureInKelvin");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%.0fK"), v3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HFTemperatureColor;
  -[HFTemperatureColor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTemperatureColor valueDescription](self, "valueDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (float)temperatureInMired
{
  return self->_temperatureInMired;
}

@end
