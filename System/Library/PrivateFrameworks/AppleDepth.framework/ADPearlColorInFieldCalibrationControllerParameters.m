@implementation ADPearlColorInFieldCalibrationControllerParameters

- (ADPearlColorInFieldCalibrationControllerParameters)init
{
  ADPearlColorInFieldCalibrationControllerParameters *v2;
  float v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ADPearlColorInFieldCalibrationControllerParameters;
  v2 = -[ADPearlColorInFieldCalibrationControllerParameters init](&v5, sel_init);
  if (v2)
  {
    +[ADDeviceConfiguration floatForKey:](ADDeviceConfiguration, "floatForKey:", kADDeviceConfigurationKeyPearlColorInFieldMinRotationBetweenFrames);
    v2->_minRotationBetweenFrames = v3;
    v2->_thresholdPrecOfValidDepth = 0.5;
  }
  return v2;
}

- (float)minRotationBetweenFrames
{
  return self->_minRotationBetweenFrames;
}

- (void)setMinRotationBetweenFrames:(float)a3
{
  self->_minRotationBetweenFrames = a3;
}

- (float)thresholdPrecOfValidDepth
{
  return self->_thresholdPrecOfValidDepth;
}

- (void)setThresholdPrecOfValidDepth:(float)a3
{
  self->_thresholdPrecOfValidDepth = a3;
}

@end
