@implementation BWInferenceEngineControllerConfiguration

- (void)setSmartCameraClassificationsEnabled:(BOOL)a3
{
  self->_smartCameraClassificationsEnabled = a3;
}

- (void)setPersonSemanticsVersion:(int)a3
{
  self->_personSemanticsVersion = a3;
}

- (void)setMattingOutputValidContentDetectionEnabled:(BOOL)a3
{
  self->_mattingOutputValidContentDetectionEnabled = a3;
}

- (void)setFastMattingEnabled:(BOOL)a3
{
  self->_fastMattingEnabled = a3;
}

- (void)setEnabledVisionInferences:(unint64_t)a3
{
  self->_enabledVisionInferences = a3;
}

- (void)setEnabledInferenceMasks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BWInferenceEngineControllerConfiguration)init
{
  BWInferenceEngineControllerConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceEngineControllerConfiguration;
  result = -[BWInferenceEngineControllerConfiguration init](&v3, sel_init);
  if (result)
    result->_fastMattingEnabled = 1;
  return result;
}

- (NSArray)swfrInferenceMasks
{
  return self->_swfrInferenceMasks;
}

- (void)setSwfrInferenceMasks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)enabledInferenceMasks
{
  return self->_enabledInferenceMasks;
}

- (unint64_t)enabledVisionInferences
{
  return self->_enabledVisionInferences;
}

- (BWVideoFormat)inputFormat
{
  return self->_inputFormat;
}

- (BOOL)smartCameraClassificationsEnabled
{
  return self->_smartCameraClassificationsEnabled;
}

- (int)personSemanticsVersion
{
  return self->_personSemanticsVersion;
}

- (BOOL)mattingOutputValidContentDetectionEnabled
{
  return self->_mattingOutputValidContentDetectionEnabled;
}

- (BOOL)fastMattingEnabled
{
  return self->_fastMattingEnabled;
}

- (void)setInputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceEngineControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom
{
  return self->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom;
}

- (void)setProducesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom:(BOOL)a3
{
  self->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom = a3;
}

- (BOOL)suppressVisionTimeOutFailure
{
  return self->_suppressVisionTimeOutFailure;
}

- (void)setSuppressVisionTimeOutFailure:(BOOL)a3
{
  self->_suppressVisionTimeOutFailure = a3;
}

@end
