@implementation CLMinimumAltitudeCondition

- (CLMinimumAltitudeCondition)initWithAltitude:(double)a3
{
  CLMinimumAltitudeCondition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMinimumAltitudeCondition;
  result = -[CLCondition initCondition](&v5, sel_initCondition);
  if (result)
    result->_altitude = a3;
  return result;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_altitude(self, a2, v2, v3);
  return (id)objc_msgSend_stringWithFormat_(v4, v5, (uint64_t)CFSTR("CLMinimumAltitudeCondition(altitude: %+.2fm)"), v6, v7);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v21;
  uint64_t v22;

  if (self == a3)
    return 1;
  v21 = v4;
  v22 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  objc_msgSend_altitude(self, v11, v12, v13, v8, v7, v6, v5, v21, v22);
  v15 = round(v14 * 1000.0);
  objc_msgSend_altitude(a3, v16, v17, v18);
  return vabdd_f64(v15, round(v19 * 1000.0)) <= 2.22044605e-16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  double v4;

  objc_msgSend_altitude(self, a2, v2, v3);
  return vcvtad_u64_f64(v4 * 1000.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  objc_msgSend_altitude(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("kCLMinimumAltitudeConditionAltitude"), v6);
}

- (CLMinimumAltitudeCondition)initWithCoder:(id)a3
{
  CLMinimumAltitudeCondition *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLMinimumAltitudeCondition;
  v4 = -[CLCondition initWithCoder:](&v9, sel_initWithCoder_);
  objc_msgSend_decodeDoubleForKey_(a3, v5, (uint64_t)CFSTR("kCLMinimumAltitudeConditionAltitude"), v6);
  v4->_altitude = v7;
  return v4;
}

- (double)altitude
{
  return self->_altitude;
}

@end
