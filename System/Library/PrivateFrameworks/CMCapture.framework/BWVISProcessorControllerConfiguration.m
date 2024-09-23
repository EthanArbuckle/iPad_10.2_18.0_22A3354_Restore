@implementation BWVISProcessorControllerConfiguration

- (void)setTransformPlatform:(int)a3
{
  self->_transformPlatform = a3;
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  self->_sphereVideoEnabled = a3;
}

- (void)setOutputPixelBufferPool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setOutputPixelBufferAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setInputPixelBufferAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setGpuPriority:(int)a3
{
  self->_gpuPriority = a3;
}

- (void)setFrameRateConversionEnabled:(BOOL)a3
{
  self->_frameRateConversionEnabled = a3;
}

- (void)setEmitSampleBufferSemaphore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (void)setCameraExtrinsicMatrix:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (void)setUseCameraGeometry:(BOOL)a3
{
  self->_useCameraGeometry = a3;
}

- (void)setZoomSmoothingEnabled:(BOOL)a3
{
  self->_zoomSmoothingEnabled = a3;
}

- (void)setVideoStabilizationStrength:(int)a3
{
  self->_videoStabilizationStrength = a3;
}

- (void)setUseISPMotionData:(BOOL)a3
{
  self->_useISPMotionData = a3;
}

- (void)setSphereCorrectionEnabled:(BOOL)a3
{
  self->_sphereCorrectionEnabled = a3;
}

- (void)setSmoothingMethod:(int)a3
{
  self->_smoothingMethod = a3;
}

- (void)setSensorIDDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setMotionBlurShimmerMitigationMethod:(int)a3
{
  self->_motionBlurShimmerMitigationMethod = a3;
}

- (void)setMinDistanceForBravoParallaxShift:(float)a3
{
  self->_minDistanceForBravoParallaxShift = a3;
}

- (void)setMetalSubmissionAndCompletionQueuePriority:(unsigned int)a3
{
  self->_metalSubmissionAndCompletionQueuePriority = a3;
}

- (void)setLivePhotoCleanOutputRect:(CGRect)a3
{
  self->_livePhotoCleanOutputRect = a3;
}

- (void)setIspProcessingSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setEnableRollingShutterCorrectionOnly:(BOOL)a3
{
  self->_enableRollingShutterCorrectionOnly = a3;
}

- (void)setDisableTransformLimitsForPredeterminedTrajectory:(BOOL)a3
{
  self->_disableTransformLimitsForPredeterminedTrajectory = a3;
}

- (void)setCinematicLookAheadTime:(float)a3
{
  self->_cinematicLookAheadTime = a3;
}

- (void)setCinematicLookAheadFrameCount:(unsigned int)a3
{
  self->_cinematicLookAheadFrameCount = a3;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)setBlurBorderPixels:(BOOL)a3
{
  self->_blurBorderPixels = a3;
}

- (void)setAttachStabilizedOutputCameraTrajectory:(BOOL)a3
{
  self->_attachStabilizedOutputCameraTrajectory = a3;
}

- (void)setApplyFrameCropOffset:(BOOL)a3
{
  self->_applyFrameCropOffset = a3;
}

- (BWPixelBufferPool)outputPixelBufferPool
{
  return self->_outputPixelBufferPool;
}

- (BWPixelBufferPool)outputDepthPixelBufferPool
{
  return self->_outputDepthPixelBufferPool;
}

- (BOOL)useCameraGeometry
{
  return self->_useCameraGeometry;
}

- (BOOL)zoomSmoothingEnabled
{
  return self->_zoomSmoothingEnabled;
}

- (int)videoStabilizationStrength
{
  return self->_videoStabilizationStrength;
}

- (BOOL)videoStabilizationDisabled
{
  return self->_videoStabilizationDisabled;
}

- (NSDictionary)videoSTFParameters
{
  return self->_videoSTFParameters;
}

- (NSDictionary)videoGreenGhostMitigationParameters
{
  return self->_videoGreenGhostMitigationParameters;
}

- (BOOL)useISPMotionData
{
  return self->_useISPMotionData;
}

- (int)transformPlatform
{
  return self->_transformPlatform;
}

- (BOOL)sphereVideoEnabled
{
  return self->_sphereVideoEnabled;
}

- (BOOL)sphereCorrectionEnabled
{
  return self->_sphereCorrectionEnabled;
}

- (int)smoothingMethod
{
  return self->_smoothingMethod;
}

- (NSDictionary)sensorIDDict
{
  return self->_sensorIDDict;
}

- (BOOL)p3ToBT2020ConversionEnabled
{
  return self->_p3ToBT2020ConversionEnabled;
}

- (NSDictionary)outputPixelBufferAttributes
{
  return self->_outputPixelBufferAttributes;
}

- (BOOL)onlyGenerateTransformsParameters
{
  return self->_onlyGenerateTransformsParameters;
}

- (int)motionBlurShimmerMitigationMethod
{
  return self->_motionBlurShimmerMitigationMethod;
}

- (float)minDistanceForBravoParallaxShift
{
  return self->_minDistanceForBravoParallaxShift;
}

- (unsigned)metalSubmissionAndCompletionQueuePriority
{
  return self->_metalSubmissionAndCompletionQueuePriority;
}

- (CGRect)livePhotoCleanOutputRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_livePhotoCleanOutputRect.origin.x;
  y = self->_livePhotoCleanOutputRect.origin.y;
  width = self->_livePhotoCleanOutputRect.size.width;
  height = self->_livePhotoCleanOutputRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BWFigCaptureISPProcessingSession)ispProcessingSession
{
  return self->_ispProcessingSession;
}

- (NSDictionary)inputPixelBufferAttributes
{
  return self->_inputPixelBufferAttributes;
}

- (int)gpuPriority
{
  return self->_gpuPriority;
}

- (BOOL)frameRateConversionEnabled
{
  return self->_frameRateConversionEnabled;
}

- (unsigned)extendedOutputRowsToFill
{
  return self->_extendedOutputRowsToFill;
}

- (BOOL)enableRollingShutterCorrectionOnly
{
  return self->_enableRollingShutterCorrectionOnly;
}

- (OS_dispatch_semaphore)emitSampleBufferSemaphore
{
  return self->_emitSampleBufferSemaphore;
}

- (NSArray)distortionCorrectionEnabledPortTypes
{
  return self->_distortionCorrectionEnabledPortTypes;
}

- (NSArray)distortionCompensationEnabledPortTypes
{
  return self->_distortionCompensationEnabledPortTypes;
}

- (BOOL)disableTransformLimitsForPredeterminedTrajectory
{
  return self->_disableTransformLimitsForPredeterminedTrajectory;
}

- (float)cinematicLookAheadTime
{
  return self->_cinematicLookAheadTime;
}

- (unsigned)cinematicLookAheadFrameCount
{
  return self->_cinematicLookAheadFrameCount;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (NSData)cameraExtrinsicMatrix
{
  return self->_cameraExtrinsicMatrix;
}

- (BOOL)blurBorderPixels
{
  return self->_blurBorderPixels;
}

- (BOOL)attachStabilizedTrajectoryHomography
{
  return self->_attachStabilizedTrajectoryHomography;
}

- (BOOL)attachStabilizedOutputCameraTrajectory
{
  return self->_attachStabilizedOutputCameraTrajectory;
}

- (BOOL)attachEstimatedMotionVector
{
  return self->_attachEstimatedMotionVector;
}

- (BOOL)applyFrameCropOffset
{
  return self->_applyFrameCropOffset;
}

- (void)setOnlyGenerateTransformsParameters:(BOOL)a3
{
  self->_onlyGenerateTransformsParameters = a3;
}

- (void)setAttachStabilizedTrajectoryHomography:(BOOL)a3
{
  self->_attachStabilizedTrajectoryHomography = a3;
}

- (void)setAttachEstimatedMotionVector:(BOOL)a3
{
  self->_attachEstimatedMotionVector = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVISProcessorControllerConfiguration;
  -[BWVISProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (void)setOutputDepthPixelBufferPool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSDictionary)outputAttachmentsPixelBufferPools
{
  return self->_outputAttachmentsPixelBufferPools;
}

- (void)setOutputAttachmentsPixelBufferPools:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  self->_smartStyleRenderingEnabled = a3;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- (unint64_t)smartStyleMemoryPoolId
{
  return self->_smartStyleMemoryPoolId;
}

- (void)setSmartStyleMemoryPoolId:(unint64_t)a3
{
  self->_smartStyleMemoryPoolId = a3;
}

- (BOOL)lowResImageUsedByVideoEncoderEnabled
{
  return self->_lowResImageUsedByVideoEncoderEnabled;
}

- (void)setLowResImageUsedByVideoEncoderEnabled:(BOOL)a3
{
  self->_lowResImageUsedByVideoEncoderEnabled = a3;
}

- (void)setVideoStabilizationDisabled:(BOOL)a3
{
  self->_videoStabilizationDisabled = a3;
}

- (void)setP3ToBT2020ConversionEnabled:(BOOL)a3
{
  self->_p3ToBT2020ConversionEnabled = a3;
}

- (void)setExtendedOutputRowsToFill:(unsigned int)a3
{
  self->_extendedOutputRowsToFill = a3;
}

- (void)setDistortionCorrectionEnabledPortTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setDistortionCompensationEnabledPortTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)setVideoSTFParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (void)setVideoGreenGhostMitigationParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

@end
