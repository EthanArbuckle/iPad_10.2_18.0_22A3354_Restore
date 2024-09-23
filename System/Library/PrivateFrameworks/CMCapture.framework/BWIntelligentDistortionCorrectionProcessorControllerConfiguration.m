@implementation BWIntelligentDistortionCorrectionProcessorControllerConfiguration

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (void)setProvidedInferenceAttachedMediaByMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setIntelligentDistortionCorrectionVersion:(int)a3
{
  self->_intelligentDistortionCorrectionVersion = a3;
}

- (void)setIntelligentDistortionCorrectionAppliesFinalDimensions:(BOOL)a3
{
  self->_intelligentDistortionCorrectionAppliesFinalDimensions = a3;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (void)setGeometricDistortionCorrectionInputCropOffset:(CGPoint)a3
{
  self->_geometricDistortionCorrectionInputCropOffset = a3;
}

- (void)setGeometricDistortionCorrectionExpandedImageDimensions:(id)a3
{
  self->_geometricDistortionCorrectionExpandedImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWIntelligentDistortionCorrectionProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (void)setDepthDataCorrectionEnabled:(BOOL)a3 primaryFormat:(id)a4 depthFormat:(id)a5 baseDepthRotationDegrees:(int)a6
{
  _BOOL4 v9;

  v9 = a3;

  if (v9)
  {
    self->_primaryFormat = (BWVideoFormat *)a4;
    self->_depthFormat = (BWVideoFormat *)a5;
  }
  self->_depthDataCorrectionEnabled = v9;
  self->_baseDepthRotationDegrees = a6;
}

- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled
{
  return self->_portTypesWithGeometricDistortionCorrectionEnabled;
}

- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled
{
  return self->_portTypesWithIntelligentDistortionCorrectionEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectionExpandedImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_geometricDistortionCorrectionExpandedImageDimensions;
}

- (CGPoint)geometricDistortionCorrectionInputCropOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_geometricDistortionCorrectionInputCropOffset.x;
  y = self->_geometricDistortionCorrectionInputCropOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int)intelligentDistortionCorrectionVersion
{
  return self->_intelligentDistortionCorrectionVersion;
}

- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions
{
  return self->_intelligentDistortionCorrectionAppliesFinalDimensions;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($5E5F304956FB491AF6F034FDF0808287)processorConfig
{
  $1F00A21A4A7E7DA834853B7FB335A589 *p_processorConfig;
  uint64_t v3;
  uint64_t v4;
  $5E5F304956FB491AF6F034FDF0808287 result;

  p_processorConfig = &self->_processorConfig;
  v3 = *(_QWORD *)&self->_processorConfig.maximumImageWidth;
  v4 = *(_QWORD *)&p_processorConfig->maximumPersonMaskWidth;
  result.var2 = v4;
  result.var3 = HIDWORD(v4);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (void)setProcessorConfig:(id)a3
{
  self->_processorConfig = ($1F00A21A4A7E7DA834853B7FB335A589)a3;
}

- (NSDictionary)providedInferenceAttachedMediaByMode
{
  return self->_providedInferenceAttachedMediaByMode;
}

- (BOOL)depthDataCorrectionEnabled
{
  return self->_depthDataCorrectionEnabled;
}

- (BWVideoFormat)primaryFormat
{
  return self->_primaryFormat;
}

- (BWVideoFormat)depthFormat
{
  return self->_depthFormat;
}

- (int)baseDepthRotationDegrees
{
  return self->_baseDepthRotationDegrees;
}

@end
