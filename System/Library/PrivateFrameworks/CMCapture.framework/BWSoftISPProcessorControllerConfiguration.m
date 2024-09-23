@implementation BWSoftISPProcessorControllerConfiguration

- (void)setStandardYUVProcessingEnabled:(BOOL)a3
{
  self->_standardYUVProcessingEnabled = a3;
}

- (void)setSfhrSupportEnabled:(BOOL)a3
{
  self->_sfhrSupportEnabled = a3;
}

- (void)setSensorRawPixelFormat:(unsigned int)a3
{
  self->_sensorRawPixelFormat = a3;
}

- (void)setSensorCenterOffset:(CGPoint)a3
{
  self->_sensorCenterOffset = a3;
}

- (void)setRawNightModeEnabled:(BOOL)a3
{
  self->_rawNightModeEnabled = a3;
}

- (void)setQuadraProcessingEnabled:(BOOL)a3
{
  self->_quadraProcessingEnabled = a3;
}

- (void)setOutputDimensions:(id)a3
{
  self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setLtmHDRCurvesEnabled:(BOOL)a3
{
  self->_ltmHDRCurvesEnabled = a3;
}

- (void)setLossyCompressionLevel:(int)a3
{
  self->_lossyCompressionLevel = a3;
}

- (void)setLinearRGBForDisparityEnabled:(BOOL)a3
{
  self->_linearRGBForDisparityEnabled = a3;
}

- (void)setLearnedNREnabled:(BOOL)a3
{
  self->_learnedNREnabled = a3;
}

- (void)setInputDimensions:(id)a3
{
  self->_inputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setGdcEnabled:(BOOL)a3
{
  self->_gdcEnabled = a3;
}

- (void)setDeepFusionEnabled:(BOOL)a3
{
  self->_deepFusionEnabled = a3;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)inputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_inputDimensions;
}

- (unsigned)sensorRawPixelFormat
{
  return self->_sensorRawPixelFormat;
}

- (BOOL)standardYUVProcessingEnabled
{
  return self->_standardYUVProcessingEnabled;
}

- (BOOL)rawNightModeEnabled
{
  return self->_rawNightModeEnabled;
}

- (BOOL)quadraProcessingEnabled
{
  return self->_quadraProcessingEnabled;
}

- (int)qBinProcessingMode
{
  return self->_qBinProcessingMode;
}

- (BOOL)linearRGBForDisparityEnabled
{
  return self->_linearRGBForDisparityEnabled;
}

- (BOOL)deepFusionEnabled
{
  return self->_deepFusionEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (void)setQBinProcessingMode:(int)a3
{
  self->_qBinProcessingMode = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSoftISPProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (CGPoint)sensorCenterOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_sensorCenterOffset.x;
  y = self->_sensorCenterOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSDictionary)inputDimensionsByQSubResolutionFlavorByPortType
{
  return self->_inputDimensionsByQSubResolutionFlavorByPortType;
}

- (void)setInputDimensionsByQSubResolutionFlavorByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSDictionary)outputDimensionsByQSubResolutionFlavor
{
  return self->_outputDimensionsByQSubResolutionFlavor;
}

- (void)setOutputDimensionsByQSubResolutionFlavor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (BOOL)learnedNREnabled
{
  return self->_learnedNREnabled;
}

- (BOOL)gdcEnabled
{
  return self->_gdcEnabled;
}

- (int)lossyCompressionLevel
{
  return self->_lossyCompressionLevel;
}

- (BOOL)ltmHDRCurvesEnabled
{
  return self->_ltmHDRCurvesEnabled;
}

- (BOOL)sfhrSupportEnabled
{
  return self->_sfhrSupportEnabled;
}

- (BOOL)lowlightSFHRSupportEnabled
{
  return self->_lowlightSFHRSupportEnabled;
}

- (void)setLowlightSFHRSupportEnabled:(BOOL)a3
{
  self->_lowlightSFHRSupportEnabled = a3;
}

- (BOOL)documentScanningEnabled
{
  return self->_documentScanningEnabled;
}

- (void)setDocumentScanningEnabled:(BOOL)a3
{
  self->_documentScanningEnabled = a3;
}

@end
