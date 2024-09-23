@implementation ADJasperColorInFieldCalibrationControllerParameters

- (ADJasperColorInFieldCalibrationControllerParameters)init
{
  return -[ADJasperColorInFieldCalibrationControllerParameters initWithFlowType:](self, "initWithFlowType:", 0);
}

- (ADJasperColorInFieldCalibrationControllerParameters)initWithFlowType:(int)a3
{
  char *v4;
  char *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  int v11;
  ADJasperColorInFieldCalibrationControllerParameters *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ADJasperColorInFieldCalibrationControllerParameters;
  v4 = -[ADJasperColorInFieldCalibrationControllerParameters init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 20) = 0x3F00000043FA0000;
    *((_DWORD *)v4 + 10) = 0;
    +[ADDeviceConfiguration floatForKey:](ADDeviceConfiguration, "floatForKey:", kADDeviceConfigurationKeyJasperColorInFieldMinRotationBetweenFrames);
    *((_DWORD *)v5 + 7) = v6;
    *((_DWORD *)v5 + 9) = 985963430;
    if (a3)
    {
      if (a3 != 1)
      {
        v12 = 0;
        goto LABEL_9;
      }
      *((_DWORD *)v5 + 7) = 0;
      +[ADDeviceConfiguration floatForKey:](ADDeviceConfiguration, "floatForKey:", kADDeviceConfigurationKeyJasperColorInFieldAngularVelocityThreshold);
      *((_DWORD *)v5 + 10) = v7;
      v8 = 0x3200000032;
      v9 = 30;
      v10 = 1140457472;
    }
    else
    {
      +[ADDeviceConfiguration floatForKey:](ADDeviceConfiguration, "floatForKey:", kADDeviceConfigurationKeyJasperColorInFieldMinRotationBetweenFrames);
      v9 = 0;
      *((_DWORD *)v5 + 7) = v11;
      v8 = 0x1C00000090;
      v10 = 0;
    }
    *(_QWORD *)(v5 + 12) = v8;
    *((_DWORD *)v5 + 8) = v10;
    *((_WORD *)v5 + 4) = v9;
  }
  v12 = v5;
LABEL_9:

  return v12;
}

- (unsigned)numberOfValidSpotsForValidFrame
{
  return self->_numberOfValidSpotsForValidFrame;
}

- (void)setNumberOfValidSpotsForValidFrame:(unsigned int)a3
{
  self->_numberOfValidSpotsForValidFrame = a3;
}

- (unsigned)numberOfMinimalRangeSpots
{
  return self->_numberOfMinimalRangeSpots;
}

- (void)setNumberOfMinimalRangeSpots:(unsigned int)a3
{
  self->_numberOfMinimalRangeSpots = a3;
}

- (float)thresholdDepthValue
{
  return self->_thresholdDepthValue;
}

- (void)setThresholdDepthValue:(float)a3
{
  self->_thresholdDepthValue = a3;
}

- (float)thresholdPrecOfValidDepth
{
  return self->_thresholdPrecOfValidDepth;
}

- (void)setThresholdPrecOfValidDepth:(float)a3
{
  self->_thresholdPrecOfValidDepth = a3;
}

- (float)minRotationBetweenFrames
{
  return self->_minRotationBetweenFrames;
}

- (void)setMinRotationBetweenFrames:(float)a3
{
  self->_minRotationBetweenFrames = a3;
}

- (float)sceneDiversityMinDepthDiff
{
  return self->_sceneDiversityMinDepthDiff;
}

- (void)setSceneDiversityMinDepthDiff:(float)a3
{
  self->_sceneDiversityMinDepthDiff = a3;
}

- (unsigned)sceneDiversityMinChangedSpots
{
  return self->_sceneDiversityMinChangedSpots;
}

- (void)setSceneDiversityMinChangedSpots:(unsigned __int16)a3
{
  self->_sceneDiversityMinChangedSpots = a3;
}

- (float)allowedDriftFromSymmetricCrop
{
  return self->_allowedDriftFromSymmetricCrop;
}

- (void)setAllowedDriftFromSymmetricCrop:(float)a3
{
  self->_allowedDriftFromSymmetricCrop = a3;
}

- (float)thresholdAngularVelocity
{
  return self->_thresholdAngularVelocity;
}

- (void)setThresholdAngularVelocity:(float)a3
{
  self->_thresholdAngularVelocity = a3;
}

@end
