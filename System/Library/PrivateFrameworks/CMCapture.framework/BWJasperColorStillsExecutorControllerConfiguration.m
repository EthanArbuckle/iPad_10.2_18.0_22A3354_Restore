@implementation BWJasperColorStillsExecutorControllerConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWJasperColorStillsExecutorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)postponedProcessorSetupSupported
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: inputColorFormat:%@, _outputDepthFormat:%@, standardFormatDimensions:%dx%d, horizontalSensorBinningFactor:%d, verticalSensorBinningFactor:%d"), objc_opt_class(), self, self->_inputColorFormat, self->_outputDepthFormat, self->_standardFormatDimensions.width, self->_standardFormatDimensions.height, self->_horizontalSensorBinningFactor, self->_verticalSensorBinningFactor);
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

- ($2825F4736939C4A6D3AD43837233062D)standardFormatDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_standardFormatDimensions;
}

- (void)setStandardFormatDimensions:(id)a3
{
  self->_standardFormatDimensions = ($470D365275581EF16070F5A11344F73E)a3;
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

@end
