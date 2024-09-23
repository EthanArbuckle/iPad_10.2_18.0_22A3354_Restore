@implementation BWStillImageNodeConfiguration

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (BOOL)deferredCaptureSupportEnabled
{
  return self->_deferredCaptureSupportEnabled;
}

- (unsigned)figThreadPriority
{
  return self->_figThreadPriority;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (BWInferenceScheduler)inferenceScheduler
{
  return self->_inferenceScheduler;
}

- (int)depthDataType
{
  return self->_depthDataType;
}

- (BOOL)deferredPhotoProcessorEnabled
{
  return self->_deferredPhotoProcessorEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)deepFusionEnhancedResolutionDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_deepFusionEnhancedResolutionDimensions;
}

- (void)setFigThreadPriority:(unsigned int)a3
{
  self->_figThreadPriority = a3;
}

- (void)setDepthDataType:(int)a3
{
  self->_depthDataType = a3;
}

- (void)setPearlModuleType:(int)a3
{
  self->_pearlModuleType = a3;
}

- (void)setOptimizedEnhancedResolutionDepthPipelineEnabled:(BOOL)a3
{
  self->_optimizedEnhancedResolutionDepthPipelineEnabled = a3;
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  self->_maxLossyCompressionLevel = a3;
}

- (void)setInferenceScheduler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3
{
  self->_deferredPhotoProcessorEnabled = a3;
}

- (void)setDeferredCaptureSupportEnabled:(BOOL)a3
{
  self->_deferredCaptureSupportEnabled = a3;
}

- (void)setDeepFusionEnhancedResolutionDimensions:(id)a3
{
  self->_deepFusionEnhancedResolutionDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setConstantColorConfidenceMapDimensions:(id)a3
{
  self->_constantColorConfidenceMapDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setDowngradedDeepFusionEnhancedResolutionDimensions:(id)a3
{
  self->_downgradedDeepFusionEnhancedResolutionDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (int)pearlModuleType
{
  return self->_pearlModuleType;
}

- (BOOL)optimizedEnhancedResolutionDepthPipelineEnabled
{
  return self->_optimizedEnhancedResolutionDepthPipelineEnabled;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageNodeConfiguration;
  -[BWStillImageNodeConfiguration dealloc](&v3, sel_dealloc);
}

- (int)stillImageProcessingMode
{
  return self->_stillImageProcessingMode;
}

- (void)setStillImageProcessingMode:(int)a3
{
  self->_stillImageProcessingMode = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)downgradedDeepFusionEnhancedResolutionDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_downgradedDeepFusionEnhancedResolutionDimensions;
}

- (BOOL)filterRenderingEnabled
{
  return self->_filterRenderingEnabled;
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  self->_filterRenderingEnabled = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)constantColorConfidenceMapDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_constantColorConfidenceMapDimensions;
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
