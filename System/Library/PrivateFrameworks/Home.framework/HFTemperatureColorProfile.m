@implementation HFTemperatureColorProfile

- (HFTemperatureColorProfile)initWithMinimumTemperature:(float)a3 maximumTemperature:(float)a4
{
  HFTemperatureColorProfile *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFTemperatureColorProfile;
  result = -[HFTemperatureColorProfile init](&v7, sel_init);
  if (result)
  {
    result->_minimumTemperature = a3;
    result->_maximumTemperature = a4;
  }
  return result;
}

- (id)adjustedColorPrimitiveForPrimitive:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  HFTemperatureColor *v12;
  double v13;
  uint64_t v14;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "temperatureInMired");
    v9 = v8;
    -[HFTemperatureColorProfile adjustedTemperatureForTemperature:](self, "adjustedTemperatureForTemperature:");
    v11 = v10;
    if (vabds_f32(v10, v9) > 0.00000011921)
    {
      v12 = [HFTemperatureColor alloc];
      *(float *)&v13 = v11;
      v14 = -[HFTemperatureColor initWithTemperatureInMired:](v12, "initWithTemperatureInMired:", v13);

      v5 = (id)v14;
    }
  }

  return v5;
}

- (float)adjustedTemperatureForTemperature:(float)a3
{
  return fminf(fmaxf(self->_minimumTemperature, a3), self->_maximumTemperature);
}

- (float)minimumTemperature
{
  return self->_minimumTemperature;
}

- (float)maximumTemperature
{
  return self->_maximumTemperature;
}

@end
