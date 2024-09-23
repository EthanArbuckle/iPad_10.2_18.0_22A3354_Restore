@implementation CAMExposureResult

- (float)exposureTargetBias
{
  return self->_exposureTargetBias;
}

- (BOOL)deviceSupportsFocus
{
  return self->_deviceSupportsFocus;
}

- (int64_t)exposureMode
{
  return self->_exposureMode;
}

- (CGPoint)pointOfInterest
{
  double x;
  double y;
  CGPoint result;

  x = self->_pointOfInterest.x;
  y = self->_pointOfInterest.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CAMExposureResult)initWithMode:(int64_t)a3 pointOfInterest:(CGPoint)a4 exposureTargetBias:(float)a5 adjusting:(BOOL)a6 exposureDidStart:(BOOL)a7 exposureDidEnd:(BOOL)a8 deviceSupportsFocus:(BOOL)a9
{
  CGFloat y;
  CGFloat x;
  CAMExposureResult *v17;
  CAMExposureResult *v18;
  CAMExposureResult *v19;
  objc_super v21;

  y = a4.y;
  x = a4.x;
  v21.receiver = self;
  v21.super_class = (Class)CAMExposureResult;
  v17 = -[CAMExposureResult init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_exposureMode = a3;
    v17->_pointOfInterest.x = x;
    v17->_pointOfInterest.y = y;
    v17->_exposureTargetBias = a5;
    v17->_adjustingExposure = a6;
    v17->_exposureDidStart = a7;
    v17->_exposureDidEnd = a8;
    v17->_deviceSupportsFocus = a9;
    v19 = v17;
  }

  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  _BOOL4 v8;
  float v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CGPoint v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMExposureResult exposureMode](self, "exposureMode");
  -[CAMExposureResult pointOfInterest](self, "pointOfInterest");
  NSStringFromCGPoint(v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMExposureResult isAdjustingExposure](self, "isAdjustingExposure");
  -[CAMExposureResult exposureTargetBias](self, "exposureTargetBias");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p mode: %ld pointOfInterest: %@ adjusting: %d targetBias: %.3f>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CAMExposureResult exposureDidStart](self, "exposureDidStart"))
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(" didStart"));
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (-[CAMExposureResult exposureDidEnd](self, "exposureDidEnd"))
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(" didEnd"));
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  return v10;
}

- (BOOL)isAdjustingExposure
{
  return self->_adjustingExposure;
}

- (BOOL)exposureDidStart
{
  return self->_exposureDidStart;
}

- (BOOL)exposureDidEnd
{
  return self->_exposureDidEnd;
}

@end
