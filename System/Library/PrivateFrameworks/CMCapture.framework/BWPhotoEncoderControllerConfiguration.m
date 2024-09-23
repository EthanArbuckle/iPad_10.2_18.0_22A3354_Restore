@implementation BWPhotoEncoderControllerConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoEncoderControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)alwaysAwaitInference
{
  return self->_alwaysAwaitInference;
}

- (void)setAlwaysAwaitInference:(BOOL)a3
{
  self->_alwaysAwaitInference = a3;
}

- (BOOL)usesHighEncodingPriority
{
  return self->_usesHighEncodingPriority;
}

- (void)setUsesHighEncodingPriority:(BOOL)a3
{
  self->_usesHighEncodingPriority = a3;
}

- (BOOL)zeroShutterLagEnabled
{
  return self->_zeroShutterLagEnabled;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  self->_zeroShutterLagEnabled = a3;
}

- (NSDictionary)attachedMediaConfigurationByAttachedMediaKey
{
  return self->_attachedMediaConfigurationByAttachedMediaKey;
}

- (void)setAttachedMediaConfigurationByAttachedMediaKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)deferredPhotoProcessorEnabled
{
  return self->_deferredPhotoProcessorEnabled;
}

- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3
{
  self->_deferredPhotoProcessorEnabled = a3;
}

- (int)portraitRenderQuality
{
  return self->_portraitRenderQuality;
}

- (void)setPortraitRenderQuality:(int)a3
{
  self->_portraitRenderQuality = a3;
}

- (int)semanticDevelopmentVersion
{
  return self->_semanticDevelopmentVersion;
}

- (void)setSemanticDevelopmentVersion:(int)a3
{
  self->_semanticDevelopmentVersion = a3;
}

- (NSDictionary)inputColorInfo
{
  return self->_inputColorInfo;
}

- (void)setInputColorInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)cameraSupportsFlash
{
  return self->_cameraSupportsFlash;
}

- (void)setCameraSupportsFlash:(BOOL)a3
{
  self->_cameraSupportsFlash = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)constantColorConfidenceMapDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_constantColorConfidenceMapDimensions;
}

- (void)setConstantColorConfidenceMapDimensions:(id)a3
{
  self->_constantColorConfidenceMapDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
  self->_smartStyleRenderingVersion = a3;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end
