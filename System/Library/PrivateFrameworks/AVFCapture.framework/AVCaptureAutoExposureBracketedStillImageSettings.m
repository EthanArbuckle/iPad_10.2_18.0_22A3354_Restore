@implementation AVCaptureAutoExposureBracketedStillImageSettings

+ (void)initialize
{
  objc_opt_class();
}

+ (AVCaptureAutoExposureBracketedStillImageSettings)autoExposureSettingsWithExposureTargetBias:(float)exposureTargetBias
{
  id v4;
  double v5;

  v4 = objc_alloc((Class)objc_opt_class());
  *(float *)&v5 = exposureTargetBias;
  return (AVCaptureAutoExposureBracketedStillImageSettings *)(id)objc_msgSend(v4, "_initAutoExposureSettingsWithExposureTargetBias:", v5);
}

- (id)_initAutoExposureSettingsWithExposureTargetBias:(float)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureAutoExposureBracketedStillImageSettings;
  result = -[AVCaptureBracketedStillImageSettings initSubclass](&v5, sel_initSubclass);
  if (result)
    *((float *)result + 2) = a3;
  return result;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[bias:%.2f]"), self->_exposureTargetBias);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureAutoExposureBracketedStillImageSettings debugDescription](self, "debugDescription"));
}

- (float)exposureTargetBias
{
  return self->_exposureTargetBias;
}

@end
