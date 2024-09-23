@implementation HRTFEnrollmentCaptureAngle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFEnrollmentCaptureAngle)initWithAngle:(double)a3 captured:(BOOL)a4
{
  HRTFEnrollmentCaptureAngle *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HRTFEnrollmentCaptureAngle;
  result = -[HRTFEnrollmentCaptureAngle init](&v7, sel_init);
  if (result)
  {
    result->_angle = a3;
    result->_captured = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double angle;
  id v5;

  angle = self->_angle;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("CaptureAngle"), angle);
  objc_msgSend(v5, "encodeBool:forKey:", self->_captured, CFSTR("Captured"));

}

- (HRTFEnrollmentCaptureAngle)initWithCoder:(id)a3
{
  id v4;
  HRTFEnrollmentCaptureAngle *v5;
  void *v6;
  double v7;
  void *v8;
  HRTFEnrollmentCaptureAngle *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CaptureAngle"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("Captured")))
  {
    v11.receiver = self;
    v11.super_class = (Class)HRTFEnrollmentCaptureAngle;
    v5 = -[HRTFEnrollmentCaptureAngle init](&v11, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CaptureAngle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v5->_angle = v7;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Captured"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_captured = objc_msgSend(v8, "BOOLValue");
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)angle
{
  return self->_angle;
}

- (BOOL)captured
{
  return self->_captured;
}

@end
