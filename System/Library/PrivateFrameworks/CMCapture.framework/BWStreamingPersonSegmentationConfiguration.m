@implementation BWStreamingPersonSegmentationConfiguration

- (BOOL)cropColorInputToPrimaryCaptureRect
{
  return self->_cropColorInputToPrimaryCaptureRect;
}

- (void)setUseLowFrameRateOptimizedNetwork:(BOOL)a3
{
  self->_useLowFrameRateOptimizedNetwork = a3;
}

- (void)setPropagateColorInput:(BOOL)a3
{
  self->_propagateColorInput = a3;
}

- (void)setInputRotationAngle:(int)a3
{
  self->_inputRotationAngle = a3;
}

- (void)setCropColorInputToPrimaryCaptureRect:(BOOL)a3
{
  self->_cropColorInputToPrimaryCaptureRect = a3;
}

- (BOOL)useLowFrameRateOptimizedNetwork
{
  return self->_useLowFrameRateOptimizedNetwork;
}

- (BOOL)propagateColorInput
{
  return self->_propagateColorInput;
}

- (int)inputRotationAngle
{
  return self->_inputRotationAngle;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStreamingPersonSegmentationConfiguration;
  -[BWInferenceConfiguration dealloc](&v3, sel_dealloc);
}

- (NSString)alternativeStreamingPersonSegmentationMaskKey
{
  return self->_alternativeStreamingPersonSegmentationMaskKey;
}

- (void)setAlternativeStreamingPersonSegmentationMaskKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)alternativeStreamingSkinSegmentationMaskKey
{
  return self->_alternativeStreamingSkinSegmentationMaskKey;
}

- (void)setAlternativeStreamingSkinSegmentationMaskKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
