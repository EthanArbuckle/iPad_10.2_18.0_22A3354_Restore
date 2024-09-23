@implementation BWMultiStreamCameraSourceNodeConfiguration

- (BOOL)faceTrackingEnabled
{
  return self->_faceTrackingEnabled;
}

- (int)stillImageMaxLossyCompressionLevel
{
  return self->_stillImageMaxLossyCompressionLevel;
}

- (BOOL)stillImageOutputSushiRawAttachmentOptionEnabled
{
  return self->_stillImageOutputSushiRawAttachmentOptionEnabled;
}

- (int)firmwareStillImageOutputRetainedBufferCountOverride
{
  return self->_firmwareStillImageOutputRetainedBufferCountOverride;
}

- (CGSize)visOverscan
{
  double width;
  double height;
  CGSize result;

  width = self->_visOverscan.width;
  height = self->_visOverscan.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)dolbyVisionMetadataOnVideoCaptureOutputEnabled
{
  return self->_dolbyVisionMetadataOnVideoCaptureOutputEnabled;
}

- (BOOL)dolbyVisionMetadataOnPreviewOutputEnabled
{
  return self->_dolbyVisionMetadataOnPreviewOutputEnabled;
}

- (BOOL)geometricDistortionCorrectionSupported
{
  return self->_geometricDistortionCorrectionSupported;
}

- (BOOL)maximumGeometricDistortionCorrectionEnabled
{
  return self->_maximumGeometricDistortionCorrectionEnabled;
}

- (BOOL)originalCameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled
{
  return self->_originalCameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled;
}

- (BOOL)originalCameraIntrinsicMatrixDeliveryOnStillImageOutputEnabled
{
  return self->_originalCameraIntrinsicMatrixDeliveryOnStillImageOutputEnabled;
}

- (BOOL)originalCameraIntrinsicMatrixDeliveryOnDepthOutputEnabled
{
  return self->_originalCameraIntrinsicMatrixDeliveryOnDepthOutputEnabled;
}

- (BOOL)cameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled
{
  return self->_cameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled;
}

- (BOOL)geometricDistortionCorrectionOnVideoCaptureOutputEnabled
{
  return self->_geometricDistortionCorrectionOnVideoCaptureOutputEnabled;
}

- (BOOL)geometricDistortionCorrectionOnPreviewOutputEnabled
{
  return self->_geometricDistortionCorrectionOnPreviewOutputEnabled;
}

- (float)additionalVISOverscanReservedInZoom
{
  return self->_additionalVISOverscanReservedInZoom;
}

- (BOOL)applyPreviewShiftToStillImage
{
  return self->_applyPreviewShiftToStillImage;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- ($2825F4736939C4A6D3AD43837233062D)preferredPreviewDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_preferredPreviewDimensions;
}

- (float)maxFrameRate
{
  return self->_maxFrameRate;
}

- (unsigned)clientVideoFormat
{
  return self->_clientVideoFormat;
}

- (BOOL)usesFirmwareStillImageOutput
{
  return self->_usesFirmwareStillImageOutput;
}

- (BOOL)stillImageOutputRequires10BitPixelFormat
{
  return self->_stillImageOutputRequires10BitPixelFormat;
}

- (BOOL)ltmThumbnailMetadataEnabledForStreaming
{
  return self->_ltmThumbnailMetadataEnabledForStreaming;
}

- (float)aeMaxGain
{
  return self->_aeMaxGain;
}

- (float)minFrameRate
{
  return self->_minFrameRate;
}

- (BOOL)lumaHistogramMetadataEnabled
{
  return self->_lumaHistogramMetadataEnabled;
}

- (BOOL)focusBlurMapEnabled
{
  return self->_focusBlurMapEnabled;
}

- (BOOL)highlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream
{
  return self->_highlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream;
}

- (float)maximumSupportedFrameRate
{
  return self->_maximumSupportedFrameRate;
}

- (BOOL)streamingRequiredWhenConfiguredAsSlave
{
  return self->_streamingRequiredWhenConfiguredAsSlave;
}

- (BOOL)ltmLookUpTableMetadataEnabledForStreaming
{
  return self->_ltmLookUpTableMetadataEnabledForStreaming;
}

- (BOOL)videoHDRFusionEnabled
{
  return self->_videoHDRFusionEnabled;
}

- (BOOL)studioLightingEnabled
{
  return self->_studioLightingEnabled;
}

- (BOOL)stillImageLocalHistogramClippingDataMetadataEnabled
{
  return self->_stillImageLocalHistogramClippingDataMetadataEnabled;
}

- (BOOL)stillImageKeypointDetectionEnabled
{
  return self->_stillImageKeypointDetectionEnabled;
}

- (BOOL)reactionEffectsEnabled
{
  return self->_reactionEffectsEnabled;
}

- (float)minimumSupportedFrameRate
{
  return self->_minimumSupportedFrameRate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationFrameworkOverride
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationClientOverride
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (int)mainToSIFRFrameRateRatio
{
  return self->_mainToSIFRFrameRateRatio;
}

- (BOOL)ltmLookUpTableMetadataEnabledForStills
{
  return self->_ltmLookUpTableMetadataEnabledForStills;
}

- (BOOL)lowLightVideoEnabled
{
  return self->_lowLightVideoEnabled;
}

- (BOOL)keypointDetectionEnabled
{
  return self->_keypointDetectionEnabled;
}

- (int)ispMultiBandNoiseReductionMode
{
  return self->_ispMultiBandNoiseReductionMode;
}

- (BOOL)highlightRecoveryEnabledWhenConfiguredAsSlave
{
  return self->_highlightRecoveryEnabledWhenConfiguredAsSlave;
}

- (BOOL)contentAwareEnhancementEnabled
{
  return self->_contentAwareEnhancementEnabled;
}

- (BOOL)contentAwareAWBEnabled
{
  return self->_contentAwareAWBEnabled;
}

- (BOOL)chromaNoiseReductionEnabled
{
  return self->_chromaNoiseReductionEnabled;
}

- (BOOL)backgroundBlurEnabled
{
  return self->_backgroundBlurEnabled;
}

- (int)motionAttachmentsSource
{
  return self->_motionAttachmentsSource;
}

- (BOOL)ispAPSDataEnabled
{
  return self->_ispAPSDataEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)depthDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_depthDimensions;
}

- (BOOL)RGBIRStereoFusionEnabled
{
  return self->_RGBIRStereoFusionEnabled;
}

- (BOOL)strictDepthModePreferred
{
  return self->_strictDepthModePreferred;
}

- (BOOL)hardwareDepthFilteringPreferred
{
  return self->_hardwareDepthFilteringPreferred;
}

- (BOOL)isAutoFocusAssistSourceNode
{
  return self->_isAutoFocusAssistSourceNode;
}

- (BOOL)secondaryScalerIsNotAvailable
{
  return self->_secondaryScalerIsNotAvailable;
}

- (BOOL)primaryScalerDeprioritized
{
  return self->_primaryScalerDeprioritized;
}

- (NSArray)activeUltraHighResStillImageNondisruptiveSwitchingFormatIndices
{
  return self->_activeUltraHighResStillImageNondisruptiveSwitchingFormatIndices;
}

- (BOOL)geometricDistortionCorrectionOnStillImageOutputEnabled
{
  return self->_geometricDistortionCorrectionOnStillImageOutputEnabled;
}

- (BOOL)sensorRawStillImageOutputEnabled
{
  return self->_sensorRawStillImageOutputEnabled;
}

- (int)maximumNumberOfBracketedSIFRFrames
{
  return self->_maximumNumberOfBracketedSIFRFrames;
}

- (BOOL)includeOverscanOnStillImageOutput
{
  return self->_includeOverscanOnStillImageOutput;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_cinematicFramingEnabled;
}

- (BOOL)manualCinematicFramingEnabled
{
  return self->_manualCinematicFramingEnabled;
}

- (int)stillImageOutputSensorInterfaceRawAttachmentOptionRetainedBufferCount
{
  return self->_stillImageOutputSensorInterfaceRawAttachmentOptionRetainedBufferCount;
}

- (int)stillImageOutputSashimiRawAttachmentOptionRetainedBufferCount
{
  return self->_stillImageOutputSashimiRawAttachmentOptionRetainedBufferCount;
}

- (int)stillImageOutputFocusPixelDataAttachmentOptionRetainedBufferCount
{
  return self->_stillImageOutputFocusPixelDataAttachmentOptionRetainedBufferCount;
}

- (BOOL)includeOverscanInStillImageFinalCropRect
{
  return self->_includeOverscanInStillImageFinalCropRect;
}

- (BOOL)usesFIFOFirmwareTimeMachine
{
  return self->_usesFIFOFirmwareTimeMachine;
}

- (BOOL)firmwareTimeMachineSIFREnabled
{
  return self->_firmwareTimeMachineSIFREnabled;
}

- (int)firmwareTimeMachineBufferCapacity
{
  return self->_firmwareTimeMachineBufferCapacity;
}

- (BOOL)configureForSoftISPSupport
{
  return self->_configureForSoftISPSupport;
}

- ($2825F4736939C4A6D3AD43837233062D)postGDCCropDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_postGDCCropDimensions;
}

- (BOOL)semanticMasksOutputEnabled
{
  return self->_semanticMasksOutputEnabled;
}

- (BOOL)lightSourceMaskOutputEnabled
{
  return self->_lightSourceMaskOutputEnabled;
}

- (BOOL)keypointDescriptorDataOutputEnabled
{
  return self->_keypointDescriptorDataOutputEnabled;
}

- (BOOL)stillImageOutputSushiRawAttachmentOptionSupportEnabled
{
  return self->_stillImageOutputSushiRawAttachmentOptionSupportEnabled;
}

- (BOOL)discardsDepthDataForStillImages
{
  return self->_discardsDepthDataForStillImages;
}

- (CGSize)sensorOverscan
{
  double width;
  double height;
  CGSize result;

  width = self->_sensorOverscan.width;
  height = self->_sensorOverscan.height;
  result.height = height;
  result.width = width;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorCropDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_sensorCropDimensions;
}

- (BOOL)primaryScalerDecoupled
{
  return self->_primaryScalerDecoupled;
}

- (BOOL)roundingOfStillImageDimensionsToMultipleOfFourEnabled
{
  return self->_roundingOfStillImageDimensionsToMultipleOfFourEnabled;
}

- (int)fesBinningFactorHorizontal
{
  return self->_fesBinningFactorHorizontal;
}

- ($2825F4736939C4A6D3AD43837233062D)cropAspectRatio
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_cropAspectRatio;
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

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (NSArray)videoStabilizationMethods
{
  return self->_videoStabilizationMethods;
}

- (BOOL)deskCamEnabled
{
  return self->_deskCamEnabled;
}

- (NSDictionary)visionDataConfiguration
{
  return self->_visionDataConfiguration;
}

- (int)depthType
{
  return self->_depthType;
}

- (NSSet)enabledDetectedObjectTypes
{
  return self->_enabledDetectedObjectTypes;
}

- (BOOL)reflectsStillsOnStreamingOutputs
{
  return self->_reflectsStillsOnStreamingOutputs;
}

- (BOOL)detectedObjectsOutputEnabled
{
  return self->_detectedObjectsOutputEnabled;
}

- (BOOL)detectedFacesOnVideoCaptureOutputEnabled
{
  return self->_detectedFacesOnVideoCaptureOutputEnabled;
}

- (BOOL)originalCameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled
{
  return self->_originalCameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled;
}

- (BOOL)cameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled
{
  return self->_cameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled;
}

- (float)uiBaseZoomFactor
{
  return self->_uiBaseZoomFactor;
}

- (BOOL)discardsUnstableSphereVideoFrames
{
  return self->_discardsUnstableSphereVideoFrames;
}

- (BOOL)videoEncoderMetadataOnVideoCaptureOutputEnabled
{
  return self->_videoEncoderMetadataEnabledOnVideoCaptureOutput;
}

- (BOOL)depthOutputEnabled
{
  return self->_depthOutputEnabled;
}

- (BOOL)pointCloudOutputEnabled
{
  return self->_pointCloudOutputEnabled;
}

- (BOOL)previewOutputEnabled
{
  return self->_previewOutputEnabled;
}

- (BOOL)videoCaptureOutputEnabled
{
  return self->_videoCaptureOutputEnabled;
}

- (BOOL)stillImageOutputEnabled
{
  return self->_stillImageOutputEnabled;
}

- (BOOL)videoStabilizationEnabled
{
  return self->_videoStabilizationEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)videoCaptureDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_videoCaptureDimensions;
}

- (float)overscanForShiftMitigation
{
  return self->_overscanForShiftMitigation;
}

- (BOOL)videoCaptureDimensionsIncludeVISOverscan
{
  return self->_videoCaptureDimensionsIncludeVISOverscan;
}

- (float)additionalVISOverscanWhenRecording
{
  return self->_additionalVISOverscanWhenRecording;
}

- (BOOL)forceFirmwareStillImageOutputEnabled
{
  return self->_forceFirmwareStillImageOutputEnabled;
}

- (NSArray)activeStreamingNondisruptiveSwitchingFormatIndices
{
  return self->_activeStreamingNondisruptiveSwitchingFormatIndices;
}

- (int)sifrBinningFactorOverrideForNondisruptiveSwitching
{
  return self->_sifrBinningFactorOverrideForNondisruptiveSwitching;
}

- (void)setFocusBlurMapEnabled:(BOOL)a3
{
  self->_focusBlurMapEnabled = a3;
}

- (void)setLtmThumbnailMetadataEnabledForStreaming:(BOOL)a3
{
  self->_ltmThumbnailMetadataEnabledForStreaming = a3;
}

- (void)setVisOverscan:(CGSize)a3
{
  self->_visOverscan = a3;
}

- (void)setVideoStabilizationTypeISPMeshEnabled:(BOOL)a3
{
  self->_videoStabilizationTypeISPMeshEnabled = a3;
}

- (void)setVideoStabilizationMethods:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (void)setVideoStabilizationEnabled:(BOOL)a3
{
  self->_videoStabilizationEnabled = a3;
}

- (void)setVideoHDRImageStatisticsEnabled:(BOOL)a3
{
  self->_videoHDRImageStatisticsEnabled = a3;
}

- (void)setVideoHDRFusionEnabled:(BOOL)a3
{
  self->_videoHDRFusionEnabled = a3;
}

- (void)setVideoEncoderMetadataOnVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_videoEncoderMetadataEnabledOnVideoCaptureOutput = a3;
}

- (void)setVideoEncoderMetadataOnPreviewOutputEnabled:(BOOL)a3
{
  self->_videoEncoderMetadataOnPreviewOutputEnabled = a3;
}

- (void)setVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_videoCaptureOutputEnabled = a3;
}

- (void)setVideoCaptureDimensionsIncludeVISOverscan:(BOOL)a3
{
  self->_videoCaptureDimensionsIncludeVISOverscan = a3;
}

- (void)setVideoCaptureDimensions:(id)a3
{
  self->_videoCaptureDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (void)setUsesFirmwareStillImageOutput:(BOOL)a3
{
  self->_usesFirmwareStillImageOutput = a3;
}

- (void)setUsesFIFOFirmwareTimeMachine:(BOOL)a3
{
  self->_usesFIFOFirmwareTimeMachine = a3;
}

- (void)setUiBaseZoomFactor:(float)a3
{
  self->_uiBaseZoomFactor = a3;
}

- (void)setStudioLightingEnabled:(BOOL)a3
{
  self->_studioLightingEnabled = a3;
}

- (void)setStrictDepthModePreferred:(BOOL)a3
{
  self->_strictDepthModePreferred = a3;
}

- (void)setStreamingRequiredWhenConfiguredAsSlave:(BOOL)a3
{
  self->_streamingRequiredWhenConfiguredAsSlave = a3;
}

- (void)setStreamingForegroundSegmentationEnabled:(BOOL)a3
{
  self->_streamingForegroundSegmentationEnabled = a3;
}

- (void)setStillImageOutputSushiRawAttachmentOptionSupportEnabled:(BOOL)a3
{
  self->_stillImageOutputSushiRawAttachmentOptionSupportEnabled = a3;
}

- (void)setStillImageOutputSushiRawAttachmentOptionEnabled:(BOOL)a3
{
  self->_stillImageOutputSushiRawAttachmentOptionEnabled = a3;
}

- (void)setStillImageOutputSensorInterfaceRawAttachmentOptionRetainedBufferCount:(int)a3
{
  self->_stillImageOutputSensorInterfaceRawAttachmentOptionRetainedBufferCount = a3;
}

- (void)setStillImageOutputSashimiRawAttachmentOptionRetainedBufferCount:(int)a3
{
  self->_stillImageOutputSashimiRawAttachmentOptionRetainedBufferCount = a3;
}

- (void)setStillImageOutputRequires10BitPixelFormat:(BOOL)a3
{
  self->_stillImageOutputRequires10BitPixelFormat = a3;
}

- (void)setStillImageOutputFocusPixelDataAttachmentOptionRetainedBufferCount:(int)a3
{
  self->_stillImageOutputFocusPixelDataAttachmentOptionRetainedBufferCount = a3;
}

- (void)setStillImageOutputEnabled:(BOOL)a3
{
  self->_stillImageOutputEnabled = a3;
}

- (void)setStillImageMaxLossyCompressionLevel:(int)a3
{
  self->_stillImageMaxLossyCompressionLevel = a3;
}

- (void)setStillImageLocalHistogramClippingDataMetadataEnabled:(BOOL)a3
{
  self->_stillImageLocalHistogramClippingDataMetadataEnabled = a3;
}

- (void)setStillImageKeypointDetectionEnabled:(BOOL)a3
{
  self->_stillImageKeypointDetectionEnabled = a3;
}

- (void)setStillImageGeometricDistortionCorrectionExpansionCoversOverscan:(BOOL)a3
{
  self->_stillImageGeometricDistortionCorrectionExpansionCoversOverscan = a3;
}

- (void)setSifrBinningFactorOverrideForNondisruptiveSwitching:(int)a3
{
  self->_sifrBinningFactorOverrideForNondisruptiveSwitching = a3;
}

- (void)setSensorRawStillImageOutputEnabled:(BOOL)a3
{
  self->_sensorRawStillImageOutputEnabled = a3;
}

- (void)setSensorOverscan:(CGSize)a3
{
  self->_sensorOverscan = a3;
}

- (void)setSensorCropDimensions:(id)a3
{
  self->_sensorCropDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setSensorCenterOffset:(CGPoint)a3
{
  self->_sensorCenterOffset = a3;
}

- (void)setSemanticMasksOutputEnabled:(BOOL)a3
{
  self->_semanticMasksOutputEnabled = a3;
}

- (void)setSecondaryScalerIsNotAvailable:(BOOL)a3
{
  self->_secondaryScalerIsNotAvailable = a3;
}

- (void)setRoundingOfStillImageDimensionsToMultipleOfFourEnabled:(BOOL)a3
{
  self->_roundingOfStillImageDimensionsToMultipleOfFourEnabled = a3;
}

- (void)setReflectsStillsOnStreamingOutputs:(BOOL)a3
{
  self->_reflectsStillsOnStreamingOutputs = a3;
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  self->_reactionEffectsEnabled = a3;
}

- (void)setRGBIRStereoFusionMinDepthThresholdMM:(unsigned int)a3
{
  self->_RGBIRStereoFusionMinDepthThresholdMM = a3;
}

- (void)setRGBIRStereoFusionMaxDepthThresholdMM:(unsigned int)a3
{
  self->_RGBIRStereoFusionMaxDepthThresholdMM = a3;
}

- (void)setRGBIRStereoFusionFixedDepthValueMM:(unsigned int)a3
{
  self->_RGBIRStereoFusionFixedDepthValueMM = a3;
}

- (void)setRGBIRStereoFusionFixedDepthThresholdMM:(unsigned int)a3
{
  self->_RGBIRStereoFusionFixedDepthThresholdMM = a3;
}

- (void)setRGBIRStereoFusionEnabled:(BOOL)a3
{
  self->_RGBIRStereoFusionEnabled = a3;
}

- (void)setPrimaryScalerDeprioritized:(BOOL)a3
{
  self->_primaryScalerDeprioritized = a3;
}

- (void)setPrimaryScalerDecoupled:(BOOL)a3
{
  self->_primaryScalerDecoupled = a3;
}

- (void)setPreviewOutputEnabled:(BOOL)a3
{
  self->_previewOutputEnabled = a3;
}

- (void)setPreferredPreviewMaxFrameRate:(int)a3
{
  self->_preferredPreviewMaxFrameRate = a3;
}

- (void)setPreferredPreviewDimensions:(id)a3
{
  self->_preferredPreviewDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setPostGDCCropDimensions:(id)a3
{
  self->_postGDCCropDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setPointCloudOutputIsSupplementalPointCloudData:(BOOL)a3
{
  self->_pointCloudOutputIsSupplementalPointCloudData = a3;
}

- (void)setPointCloudOutputEnabled:(BOOL)a3
{
  self->_pointCloudOutputEnabled = a3;
}

- (void)setOriginalCameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_originalCameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled = a3;
}

- (void)setOriginalCameraIntrinsicMatrixDeliveryOnStillImageOutputEnabled:(BOOL)a3
{
  self->_originalCameraIntrinsicMatrixDeliveryOnStillImageOutputEnabled = a3;
}

- (void)setOriginalCameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled:(BOOL)a3
{
  self->_originalCameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled = a3;
}

- (void)setOriginalCameraIntrinsicMatrixDeliveryOnDepthOutputEnabled:(BOOL)a3
{
  self->_originalCameraIntrinsicMatrixDeliveryOnDepthOutputEnabled = a3;
}

- (void)setOptimizeBandwidthForPreviewOutput:(BOOL)a3
{
  self->_optimizeBandwidthForPreviewOutput = a3;
}

- (void)setObjectDetectionStartupDeferred:(BOOL)a3
{
  self->_objectDetectionStartupDeferred = a3;
}

- (void)setMotionAttachmentsSource:(int)a3
{
  self->_motionAttachmentsSource = a3;
}

- (void)setMinimumSupportedFrameRate:(float)a3
{
  self->_minimumSupportedFrameRate = a3;
}

- (void)setMinFrameRate:(float)a3
{
  self->_minFrameRate = a3;
}

- (void)setMaximumSupportedFrameRate:(float)a3
{
  self->_maximumSupportedFrameRate = a3;
}

- (void)setMaximumNumberOfBracketedSIFRFrames:(int)a3
{
  self->_maximumNumberOfBracketedSIFRFrames = a3;
}

- (void)setMaximumGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_maximumGeometricDistortionCorrectionEnabled = a3;
}

- (void)setMaxFrameRate:(float)a3
{
  self->_maxFrameRate = a3;
}

- (void)setMaxExposureDurationFrameworkOverride:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxExposureDurationFrameworkOverride.epoch = a3->var3;
  *(_OWORD *)&self->_maxExposureDurationFrameworkOverride.value = v3;
}

- (void)setMaxExposureDurationClientOverride:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxExposureDurationClientOverride.epoch = a3->var3;
  *(_OWORD *)&self->_maxExposureDurationClientOverride.value = v3;
}

- (void)setManualCinematicFramingEnabled:(BOOL)a3
{
  self->_manualCinematicFramingEnabled = a3;
}

- (void)setLumaHistogramMetadataEnabled:(BOOL)a3
{
  self->_lumaHistogramMetadataEnabled = a3;
}

- (void)setLtmLookUpTableMetadataEnabledForStills:(BOOL)a3
{
  self->_ltmLookUpTableMetadataEnabledForStills = a3;
}

- (void)setLivePhotoCaptureEnabled:(BOOL)a3
{
  self->_livePhotoCaptureEnabled = a3;
}

- (void)setLightSourceMaskOutputEnabled:(BOOL)a3
{
  self->_lightSourceMaskOutputEnabled = a3;
}

- (void)setKeypointDetectionEnabled:(BOOL)a3
{
  self->_keypointDetectionEnabled = a3;
}

- (void)setKeypointDescriptorDataOutputEnabled:(BOOL)a3
{
  self->_keypointDescriptorDataOutputEnabled = a3;
}

- (void)setIsAutoFocusAssistSourceNode:(BOOL)a3
{
  self->_isAutoFocusAssistSourceNode = a3;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (void)setHighlightRecoveryEnabledWhenConfiguredAsSlave:(BOOL)a3
{
  self->_highlightRecoveryEnabledWhenConfiguredAsSlave = a3;
}

- (void)setHighlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream:(BOOL)a3
{
  self->_highlightRecoveryEnabledWhenConfiguredAsMasterOrSingleStream = a3;
}

- (void)setHardwareDepthFilteringPreferred:(BOOL)a3
{
  self->_hardwareDepthFilteringPreferred = a3;
}

- (void)setGraphContainsMultipleVideoSources:(BOOL)a3
{
  self->_graphContainsMultipleVideoSources = a3;
}

- (void)setGeometricDistortionCorrectionSupported:(BOOL)a3
{
  self->_geometricDistortionCorrectionSupported = a3;
}

- (void)setGeometricDistortionCorrectionOnVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionOnVideoCaptureOutputEnabled = a3;
}

- (void)setGeometricDistortionCorrectionOnStillImageOutputEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionOnStillImageOutputEnabled = a3;
}

- (void)setGeometricDistortionCorrectionOnPreviewOutputEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionOnPreviewOutputEnabled = a3;
}

- (void)setFormatIndex:(unsigned int)a3
{
  self->_formatIndex = a3;
}

- (void)setForceFirmwareStillImageOutputEnabled:(BOOL)a3
{
  self->_forceFirmwareStillImageOutputEnabled = a3;
}

- (void)setFirmwareTimeMachineSIFREnabled:(BOOL)a3
{
  self->_firmwareTimeMachineSIFREnabled = a3;
}

- (void)setFirmwareTimeMachineBufferCapacity:(int)a3
{
  self->_firmwareTimeMachineBufferCapacity = a3;
}

- (void)setFirmwareStillImageOutputRetainedBufferCountOverride:(int)a3
{
  self->_firmwareStillImageOutputRetainedBufferCountOverride = a3;
}

- (void)setFesBinningFactorHorizontal:(int)a3
{
  self->_fesBinningFactorHorizontal = a3;
}

- (void)setFaceTrackingUseRecognition:(BOOL)a3
{
  self->_faceTrackingUseRecognition = a3;
}

- (void)setFaceTrackingNumTrackedFaces:(int)a3
{
  self->_faceTrackingNumTrackedFaces = a3;
}

- (void)setFaceTrackingNetworkFailureThresholdMultiplier:(float)a3
{
  self->_faceTrackingNetworkFailureThresholdMultiplier = a3;
}

- (void)setFaceTrackingEnabled:(BOOL)a3
{
  self->_faceTrackingEnabled = a3;
}

- (void)setEyeDetectionRequired:(BOOL)a3
{
  self->_eyeDetectionRequired = a3;
}

- (void)setEnabledSemanticMaskTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void)setEnabledDetectedObjectTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void)setDolbyVisionMetadataOnVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_dolbyVisionMetadataOnVideoCaptureOutputEnabled = a3;
}

- (void)setDolbyVisionMetadataOnPreviewOutputEnabled:(BOOL)a3
{
  self->_dolbyVisionMetadataOnPreviewOutputEnabled = a3;
}

- (void)setDoingCMFaceTracking:(BOOL)a3
{
  self->_doingCMFaceTracking = a3;
}

- (void)setDiscardsDepthDataForStillImages:(BOOL)a3
{
  self->_discardsDepthDataForStillImages = a3;
}

- (void)setDetectedObjectsOutputEnabled:(BOOL)a3
{
  self->_detectedObjectsOutputEnabled = a3;
}

- (void)setDetectedFacesOutputConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void)setDetectedFacesOnVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_detectedFacesOnVideoCaptureOutputEnabled = a3;
}

- (void)setDetectedFacesOnPreviewOutputEnabled:(BOOL)a3
{
  self->_detectedFacesOnPreviewOutputEnabled = a3;
}

- (void)setDeskCamEnabled:(BOOL)a3
{
  self->_deskCamEnabled = a3;
}

- (void)setDepthType:(int)a3
{
  self->_depthType = a3;
}

- (void)setDepthOutputEnabled:(BOOL)a3
{
  self->_depthOutputEnabled = a3;
}

- (void)setDepthDimensions:(id)a3
{
  self->_depthDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setDeferStreamingOutputsEnable:(BOOL)a3
{
  self->_deferStreamingOutputsEnable = a3;
}

- (void)setCropDimensionsWhenFESIsEnabled:(id)a3
{
  self->_cropDimensionsWhenFESIsEnabled = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setCropAspectRatio:(id)a3
{
  self->_cropAspectRatio = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setContentAwareEnhancementEnabled:(BOOL)a3
{
  self->_contentAwareEnhancementEnabled = a3;
}

- (void)setContentAwareAWBEnabled:(BOOL)a3
{
  self->_contentAwareAWBEnabled = a3;
}

- (void)setConfigureForSoftISPSupport:(BOOL)a3
{
  self->_configureForSoftISPSupport = a3;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (void)setClientVideoFormat:(unsigned int)a3
{
  self->_clientVideoFormat = a3;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  self->_cinematicFramingEnabled = a3;
}

- (void)setChromaNoiseReductionEnabled:(BOOL)a3
{
  self->_chromaNoiseReductionEnabled = a3;
}

- (void)setCameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_cameraIntrinsicMatrixDeliveryOnVideoCaptureOutputEnabled = a3;
}

- (void)setCameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled:(BOOL)a3
{
  self->_cameraIntrinsicMatrixDeliveryOnPreviewOutputEnabled = a3;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  self->_backgroundBlurEnabled = a3;
}

- (void)setApplyPreviewShiftToStillImage:(BOOL)a3
{
  self->_applyPreviewShiftToStillImage = a3;
}

- (void)setAeMaxGain:(float)a3
{
  self->_aeMaxGain = a3;
}

- (void)setAdditionalVISOverscanWhenRecording:(float)a3
{
  self->_additionalVISOverscanWhenRecording = a3;
}

- (void)setActiveStreamingNondisruptiveSwitchingFormatIndices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BWMultiStreamCameraSourceNodeConfiguration)init
{
  BWMultiStreamCameraSourceNodeConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMultiStreamCameraSourceNodeConfiguration;
  result = -[BWMultiStreamCameraSourceNodeConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_formatIndex = -1;
    result->_fastSwitchingMainFormatIndex = -1;
    result->_faceTrackingFailureFieldOfViewModifier = -1.0;
  }
  return result;
}

- (void)setMainToSIFRFrameRateRatio:(int)a3
{
  self->_mainToSIFRFrameRateRatio = a3;
}

- (void)setIspMultiBandNoiseReductionMode:(int)a3
{
  self->_ispMultiBandNoiseReductionMode = a3;
}

- (void)setOverscanForShiftMitigation:(float)a3
{
  self->_overscanForShiftMitigation = a3;
}

- (void)setLtmLookUpTableMetadataEnabledForStreaming:(BOOL)a3
{
  self->_ltmLookUpTableMetadataEnabledForStreaming = a3;
}

- (void)setIspAPSDataEnabled:(BOOL)a3
{
  self->_ispAPSDataEnabled = a3;
}

- (void)setIncludeOverscanOnStillImageOutput:(BOOL)a3
{
  self->_includeOverscanOnStillImageOutput = a3;
}

- (void)setIncludeOverscanInStillImageFinalCropRect:(BOOL)a3
{
  self->_includeOverscanInStillImageFinalCropRect = a3;
}

- (void)setActiveUltraHighResStillImageNondisruptiveSwitchingFormatIndices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setDiscardsUnstableSphereVideoFrames:(BOOL)a3
{
  self->_discardsUnstableSphereVideoFrames = a3;
}

- (void)setBravoShiftMitigationMaxZoomFactor:(float)a3
{
  self->_bravoShiftMitigationMaxZoomFactor = a3;
}

- (unsigned)formatIndex
{
  return self->_formatIndex;
}

- (BOOL)graphContainsMultipleVideoSources
{
  return self->_graphContainsMultipleVideoSources;
}

- (BOOL)objectDetectionStartupDeferred
{
  return self->_objectDetectionStartupDeferred;
}

- (BOOL)eyeDetectionRequired
{
  return self->_eyeDetectionRequired;
}

- (NSDictionary)detectedFacesOutputConfiguration
{
  return self->_detectedFacesOutputConfiguration;
}

- (BOOL)detectedFacesOnPreviewOutputEnabled
{
  return self->_detectedFacesOnPreviewOutputEnabled;
}

- (BOOL)videoHDRImageStatisticsEnabled
{
  return self->_videoHDRImageStatisticsEnabled;
}

- (BOOL)videoStabilizationTypeISPMeshEnabled
{
  return self->_videoStabilizationTypeISPMeshEnabled;
}

- (BOOL)deferStreamingOutputsEnable
{
  return self->_deferStreamingOutputsEnable;
}

- (BOOL)livePhotoCaptureEnabled
{
  return self->_livePhotoCaptureEnabled;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMultiStreamCameraSourceNodeConfiguration;
  -[BWMultiStreamCameraSourceNodeConfiguration dealloc](&v3, sel_dealloc);
}

- (unsigned)fastSwitchingMainFormatIndex
{
  return self->_fastSwitchingMainFormatIndex;
}

- (void)setFastSwitchingMainFormatIndex:(unsigned int)a3
{
  self->_fastSwitchingMainFormatIndex = a3;
}

- (float)fastSwitchingMainFormatMaxFrameRate
{
  return self->_fastSwitchingMainFormatMaxFrameRate;
}

- (void)setFastSwitchingMainFormatMaxFrameRate:(float)a3
{
  self->_fastSwitchingMainFormatMaxFrameRate = a3;
}

- (NSArray)fastSwitchingNondisruptiveFormatIndices
{
  return self->_fastSwitchingNondisruptiveFormatIndices;
}

- (void)setFastSwitchingNondisruptiveFormatIndices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSDictionary)quadraSubPixelSwitchingParameters
{
  return self->_quadraSubPixelSwitchingParameters;
}

- (void)setQuadraSubPixelSwitchingParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- ($2825F4736939C4A6D3AD43837233062D)cropDimensionsWhenFESIsEnabled
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_cropDimensionsWhenFESIsEnabled;
}

- (void)setLowLightVideoEnabled:(BOOL)a3
{
  self->_lowLightVideoEnabled = a3;
}

- (BOOL)stillImageGeometricDistortionCorrectionExpansionCoversOverscan
{
  return self->_stillImageGeometricDistortionCorrectionExpansionCoversOverscan;
}

- (void)setAdditionalVISOverscanReservedInZoom:(float)a3
{
  self->_additionalVISOverscanReservedInZoom = a3;
}

- (int)preferredPreviewMaxFrameRate
{
  return self->_preferredPreviewMaxFrameRate;
}

- (BOOL)includeOverscanOnPreviewOutput
{
  return self->_includeOverscanOnPreviewOutput;
}

- (void)setIncludeOverscanOnPreviewOutput:(BOOL)a3
{
  self->_includeOverscanOnPreviewOutput = a3;
}

- (BOOL)optimizeBandwidthForPreviewOutput
{
  return self->_optimizeBandwidthForPreviewOutput;
}

- (BOOL)streamingForegroundSegmentationEnabled
{
  return self->_streamingForegroundSegmentationEnabled;
}

- (int)faceTrackingNumTrackedFaces
{
  return self->_faceTrackingNumTrackedFaces;
}

- (float)faceTrackingNetworkFailureThresholdMultiplier
{
  return self->_faceTrackingNetworkFailureThresholdMultiplier;
}

- (BOOL)faceTrackingUseRecognition
{
  return self->_faceTrackingUseRecognition;
}

- (float)faceTrackingFailureFieldOfViewModifier
{
  return self->_faceTrackingFailureFieldOfViewModifier;
}

- (void)setFaceTrackingFailureFieldOfViewModifier:(float)a3
{
  self->_faceTrackingFailureFieldOfViewModifier = a3;
}

- (BOOL)videoEncoderMetadataOnPreviewOutputEnabled
{
  return self->_videoEncoderMetadataOnPreviewOutputEnabled;
}

- (BOOL)preLTMThumbnailOnPreviewOutputEnabled
{
  return self->_preLTMThumbnailOnPreviewOutputEnabled;
}

- (void)setPreLTMThumbnailOnPreviewOutputEnabled:(BOOL)a3
{
  self->_preLTMThumbnailOnPreviewOutputEnabled = a3;
}

- (BOOL)postColorProcessingThumbnailOnPreviewOutputEnabled
{
  return self->_postColorProcessingThumbnailOnPreviewOutputEnabled;
}

- (void)setPostColorProcessingThumbnailOnPreviewOutputEnabled:(BOOL)a3
{
  self->_postColorProcessingThumbnailOnPreviewOutputEnabled = a3;
}

- (void)setVisionDataConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (BOOL)preLTMThumbnailOnVideoCaptureOutputEnabled
{
  return self->_preLTMThumbnailOnVideoCaptureOutputEnabled;
}

- (void)setPreLTMThumbnailOnVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_preLTMThumbnailOnVideoCaptureOutputEnabled = a3;
}

- (BOOL)postColorProcessingThumbnailOnVideoCaptureOutputEnabled
{
  return self->_postColorProcessingThumbnailOnVideoCaptureOutputEnabled;
}

- (void)setPostColorProcessingThumbnailOnVideoCaptureOutputEnabled:(BOOL)a3
{
  self->_postColorProcessingThumbnailOnVideoCaptureOutputEnabled = a3;
}

- (NSSet)enabledSemanticMaskTypes
{
  return self->_enabledSemanticMaskTypes;
}

- (BOOL)preLTMThumbnailOutputEnabled
{
  return self->_preLTMThumbnailOutputEnabled;
}

- (void)setPreLTMThumbnailOutputEnabled:(BOOL)a3
{
  self->_preLTMThumbnailOutputEnabled = a3;
}

- (BWSecureMetadataOutputConfiguration)secureMetadataOutputConfiguration
{
  return self->_secureMetadataOutputConfiguration;
}

- (void)setSecureMetadataOutputConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (unsigned)RGBIRStereoFusionMinDepthThresholdMM
{
  return self->_RGBIRStereoFusionMinDepthThresholdMM;
}

- (unsigned)RGBIRStereoFusionMaxDepthThresholdMM
{
  return self->_RGBIRStereoFusionMaxDepthThresholdMM;
}

- (unsigned)RGBIRStereoFusionFixedDepthThresholdMM
{
  return self->_RGBIRStereoFusionFixedDepthThresholdMM;
}

- (unsigned)RGBIRStereoFusionFixedDepthValueMM
{
  return self->_RGBIRStereoFusionFixedDepthValueMM;
}

- (BOOL)pointCloudOutputIsSupplementalPointCloudData
{
  return self->_pointCloudOutputIsSupplementalPointCloudData;
}

- (float)bravoShiftMitigationMaxZoomFactor
{
  return self->_bravoShiftMitigationMaxZoomFactor;
}

- (BOOL)multiIlluminantWhiteBalanceEnabled
{
  return self->_multiIlluminantWhiteBalanceEnabled;
}

- (void)setMultiIlluminantWhiteBalanceEnabled:(BOOL)a3
{
  self->_multiIlluminantWhiteBalanceEnabled = a3;
}

- (BOOL)gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (void)setGesturesEnabled:(BOOL)a3
{
  self->_gesturesEnabled = a3;
}

- (BOOL)backgroundReplacementEnabled
{
  return self->_backgroundReplacementEnabled;
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  self->_backgroundReplacementEnabled = a3;
}

- (BOOL)doingCMFaceTracking
{
  return self->_doingCMFaceTracking;
}

- (BOOL)continuityCameraIsWired
{
  return self->_continuityCameraIsWired;
}

- (void)setContinuityCameraIsWired:(BOOL)a3
{
  self->_continuityCameraIsWired = a3;
}

@end
