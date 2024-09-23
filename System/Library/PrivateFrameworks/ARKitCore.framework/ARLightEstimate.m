@implementation ARLightEstimate

- (ARLightEstimate)initWithAmbientIntensity:(double)a3 temperature:(double)a4
{
  ARLightEstimate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARLightEstimate;
  result = -[ARLightEstimate init](&v7, sel_init);
  if (result)
  {
    result->_ambientIntensity = a3;
    result->_ambientColorTemperature = a4;
  }
  return result;
}

- (NSData)sphericalHarmonicsCoefficients
{
  float32x4_t v2;
  float32x4_t v3;
  double ambientColorTemperature;
  float v5;

  v2.i64[0] = *(_QWORD *)&self->_ambientIntensity;
  ambientColorTemperature = self->_ambientColorTemperature;
  v5 = *(double *)v2.i64 / 1000.0;
  v2.f32[0] = ambientColorTemperature;
  return (NSData *)ARSphericalHarmonicsDataWithAmbientLight(v5, v2, ambientColorTemperature, v3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARLightEstimate ambientIntensity](self, "ambientIntensity");
  objc_msgSend(v6, "appendFormat:", CFSTR(" ambientIntensity=%.2f"), v7);
  -[ARLightEstimate ambientColorTemperature](self, "ambientColorTemperature");
  objc_msgSend(v6, "appendFormat:", CFSTR(" ambientColorTemperature=%.2f"), v8);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARLightEstimate)initWithCoder:(id)a3
{
  id v4;
  ARLightEstimate *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARLightEstimate;
  v5 = -[ARLightEstimate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ambientIntensity"));
    v5->_ambientIntensity = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ambientColorTemperature"));
    v5->_ambientColorTemperature = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double ambientIntensity;
  id v5;

  ambientIntensity = self->_ambientIntensity;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ambientIntensity"), ambientIntensity);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ambientColorTemperature"), self->_ambientColorTemperature);

}

- (CGFloat)ambientIntensity
{
  return self->_ambientIntensity;
}

- (CGFloat)ambientColorTemperature
{
  return self->_ambientColorTemperature;
}

@end
