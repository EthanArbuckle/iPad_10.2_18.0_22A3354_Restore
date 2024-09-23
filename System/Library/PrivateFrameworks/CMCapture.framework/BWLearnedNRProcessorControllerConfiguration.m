@implementation BWLearnedNRProcessorControllerConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWLearnedNRProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (NSDictionary)inputFormatsByQSubResolutionFlavor
{
  return self->_inputFormatsByQSubResolutionFlavor;
}

- (void)setInputFormatsByQSubResolutionFlavor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BWVideoFormat)zoomBasedOutputFormat
{
  return self->_zoomBasedOutputFormat;
}

- (void)setZoomBasedOutputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BWVideoFormat)ultraHighResolutionOutputFormat
{
  return self->_ultraHighResolutionOutputFormat;
}

- (void)setUltraHighResolutionOutputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSDictionary)finalCropRectOverscanMultiplierByPortType
{
  return self->_finalCropRectOverscanMultiplierByPortType;
}

- (void)setFinalCropRectOverscanMultiplierByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
