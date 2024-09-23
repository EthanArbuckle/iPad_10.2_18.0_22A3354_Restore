@implementation BWJasperDisparityProcessorControllerConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWJasperDisparityProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (BWVideoFormat)inputColorFormat
{
  return self->_inputColorFormat;
}

- (void)setInputColorFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BWVideoFormat)outputDepthFormat
{
  return self->_outputDepthFormat;
}

- (void)setOutputDepthFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (int)pointCloudTimeMachineCapacity
{
  return self->_pointCloudTimeMachineCapacity;
}

- (void)setPointCloudTimeMachineCapacity:(int)a3
{
  self->_pointCloudTimeMachineCapacity = a3;
}

@end
