@implementation ADPearlColorInFieldCalibrationPipelineParameters

- (ADPearlColorInFieldCalibrationPipelineParameters)initWithDeviceName:(id)a3
{
  id v4;
  ADPearlColorInFieldCalibrationPipelineParameters *v5;
  id v6;
  float v7;
  int v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADPearlColorInFieldCalibrationPipelineParameters;
  v5 = -[ADPipelineParameters initForDevice:](&v11, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = v4;
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("N301")) & 1) != 0)
    {

      v5->_coeffX = 1.0;
      v5->_coeffY = 1.0;
      v5->_coeffZ = 0.0;
      v5->_featuresVectorAggregationSize = 1;
      v5->_colorCameraNominalEfl = 344.8;
      v7 = 1.25;
    }
    else
    {
      v8 = objc_msgSend(v6, "hasPrefix:", CFSTR("J7"));

      v5->_coeffX = 1.0;
      v5->_coeffY = 1.0;
      v9 = 0.0;
      if (v8)
        v9 = 1.0;
      v5->_coeffZ = v9;
      v5->_featuresVectorAggregationSize = 1;
      v5->_colorCameraNominalEfl = 563.05;
      +[ADDeviceConfiguration floatForKey:](ADDeviceConfiguration, "floatForKey:", kADDeviceConfigurationKeyPearlColorStdThreshold_iOS);
    }
    v5->_maxStdForValidResult = v7;
  }

  return v5;
}

- (ADPearlColorInFieldCalibrationPipelineParameters)init
{
  void *v3;
  ADPearlColorInFieldCalibrationPipelineParameters *v4;

  +[ADDeviceConfiguration getDeviceName](ADDeviceConfiguration, "getDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ADPearlColorInFieldCalibrationPipelineParameters initWithDeviceName:](self, "initWithDeviceName:", v3);

  return v4;
}

- (unsigned)featuresVectorAggregationSize
{
  return self->_featuresVectorAggregationSize;
}

- (void)setFeaturesVectorAggregationSize:(unsigned int)a3
{
  self->_featuresVectorAggregationSize = a3;
}

- (float)colorCameraNominalEfl
{
  return self->_colorCameraNominalEfl;
}

- (float)maxStdForValidResult
{
  return self->_maxStdForValidResult;
}

- (float)coeffX
{
  return self->_coeffX;
}

- (float)coeffY
{
  return self->_coeffY;
}

- (float)coeffZ
{
  return self->_coeffZ;
}

@end
