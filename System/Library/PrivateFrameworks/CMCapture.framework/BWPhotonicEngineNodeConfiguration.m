@implementation BWPhotonicEngineNodeConfiguration

- (BOOL)inputIs10Bit
{
  if (result)
    return *(_BYTE *)(result + 129) != 0;
  return result;
}

- (BOOL)generateLiDARDepth
{
  if (result)
    return *(_BYTE *)(result + 425) != 0;
  return result;
}

- (uint64_t)outputBufferCount
{
  if (result)
    return *(unsigned int *)(result + 136);
  return result;
}

- (uint64_t)retainedBufferCount
{
  if (result)
    return *(unsigned int *)(result + 132);
  return result;
}

- (BOOL)outputPoolBackPressureEnabled
{
  if (result)
    return *(_BYTE *)(result + 148) != 0;
  return result;
}

- (uint64_t)sensorConfigurationsByPortType
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (uint64_t)portTypesWithRawNightModeEnabled
{
  if (result)
    return *(_QWORD *)(result + 216);
  return result;
}

- (BOOL)deepFusionSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 226) != 0;
  return result;
}

- (BOOL)softISPSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 160) != 0;
  return result;
}

- (BOOL)quadraProcessingSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 161) != 0;
  return result;
}

- (uint64_t)learnedNRMode
{
  if (result)
    return *(unsigned int *)(result + 232);
  return result;
}

- (BOOL)cmiResourceEnabled
{
  if (result)
    return *(_BYTE *)(result + 424) != 0;
  return result;
}

- (uint64_t)verticalSensorBinningFactor
{
  if (result)
    return *(unsigned int *)(result + 372);
  return result;
}

- (double)sensorCenterOffset
{
  if (a1)
    return *(double *)(a1 + 176);
  else
    return 0.0;
}

- (uint64_t)horizontalSensorBinningFactor
{
  if (result)
    return *(unsigned int *)(result + 368);
  return result;
}

- (uint64_t)portTypesWithGeometricDistortionCorrectionEnabled
{
  if (result)
    return *(_QWORD *)(result + 336);
  return result;
}

- (uint64_t)portTypesWithIntelligentDistortionCorrectionEnabled
{
  if (result)
    return *(_QWORD *)(result + 352);
  return result;
}

- (uint64_t)semanticRenderingVersion
{
  if (result)
    return *(unsigned int *)(result + 272);
  return result;
}

- (uint64_t)providedInferenceAttachedMediaByMode
{
  if (result)
    return *(_QWORD *)(result + 256);
  return result;
}

- (uint64_t)swfrVersion
{
  if (result)
    return *(unsigned int *)(result + 264);
  return result;
}

- (BOOL)redEyeReductionEnabled
{
  if (result)
    return *(_BYTE *)(result + 268) != 0;
  return result;
}

- (BOOL)semanticStyleRenderingEnabled
{
  if (result)
    return *(_BYTE *)(result + 284) != 0;
  return result;
}

- (BOOL)fusionSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 212) != 0;
  return result;
}

- (uint64_t)deepZoomVersion
{
  if (result)
    return *(unsigned int *)(result + 236);
  return result;
}

- (uint64_t)constantColorVersion
{
  if (result)
    return *(unsigned int *)(result + 312);
  return result;
}

- (float)gainMapMainImageDownscalingFactor
{
  if (a1)
    return *(float *)(a1 + 244);
  else
    return 0.0;
}

- (uint64_t)depthDataOutputDimensions
{
  if (result)
    return *(_QWORD *)(result + 392);
  return result;
}

- (uint64_t)stillImageFusionScheme
{
  if (result)
    return *(unsigned int *)(result + 96);
  return result;
}

- (uint64_t)sensorRawPixelFormat
{
  if (result)
    return *(unsigned int *)(result + 164);
  return result;
}

- (uint64_t)semanticDevelopmentVersion
{
  if (result)
    return *(unsigned int *)(result + 276);
  return result;
}

- (uint64_t)rawSensorDimensions
{
  if (result)
    return *(_QWORD *)(result + 168);
  return result;
}

- (uint64_t)rawLensShadingCorrectionCoefficientsByPortType
{
  if (result)
    return *(_QWORD *)(result + 416);
  return result;
}

- (uint64_t)rawColorCalibrationsByPortType
{
  if (result)
    return *(_QWORD *)(result + 408);
  return result;
}

- (uint64_t)personSemanticsVersion
{
  if (result)
    return *(unsigned int *)(result + 280);
  return result;
}

- (uint64_t)greenGhostMitigationVersion
{
  if (result)
    return *(unsigned int *)(result + 376);
  return result;
}

- (BOOL)generateInferencesForSemanticProcessingIfNeeded
{
  if (result)
    return *(_BYTE *)(result + 318) != 0;
  return result;
}

- (BOOL)digitalFlashSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 213) != 0;
  return result;
}

- (BOOL)depthDataDeliveryEnabled
{
  if (result)
    return *(_BYTE *)(result + 380) != 0;
  return result;
}

- (uint64_t)demosaicedRawPixelFormat
{
  if (result)
    return *(unsigned int *)(result + 404);
  return result;
}

- (BOOL)demosaicedRawEnabled
{
  if (result)
    return *(_BYTE *)(result + 403) != 0;
  return result;
}

- (BOOL)deepFusionWaitForPreprocessingToFinish
{
  if (result)
    return *(_BYTE *)(result + 225) != 0;
  return result;
}

- (BOOL)alwaysAllowModifyingInputBuffers
{
  if (result)
    return *(_BYTE *)(result + 128) != 0;
  return result;
}

- (BOOL)zoomingDisparityAllowed
{
  if (result)
    return *(_BYTE *)(result + 401) != 0;
  return result;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  if (result)
    return *(_BYTE *)(result + 402) != 0;
  return result;
}

- (uint64_t)portTypesWithDepthSegmentationPortraitParameters
{
  if (result)
    return *(_QWORD *)(result + 384);
  return result;
}

- (uint64_t)intelligentDistortionCorrectionVersion
{
  if (result)
    return *(unsigned int *)(result + 360);
  return result;
}

- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions
{
  if (result)
    return *(_BYTE *)(result + 364) != 0;
  return result;
}

- (uint64_t)geometricDistortionCorrectionExpandedImageDimensions
{
  if (result)
    return *(_QWORD *)(result + 344);
  return result;
}

- (uint64_t)outputDimensions
{
  if (result)
    return *(_QWORD *)(result + 328);
  return result;
}

- (uint64_t)setVerticalSensorBinningFactor:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 372) = a2;
  return result;
}

- (uint64_t)setUltraHighResolutionProcessingEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 200) = a2;
  return result;
}

- (uint64_t)setSwfrVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 264) = a2;
  return result;
}

- (uint64_t)setStillImageGDCSourceMode:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 204) = a2;
  return result;
}

- (uint64_t)setStillImageFusionScheme:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 96) = a2;
  return result;
}

- (uint64_t)setStandardFormatDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 320) = a2;
  return result;
}

- (uint64_t)setSoftISPSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 160) = a2;
  return result;
}

- (uint64_t)setSensorRawPixelFormat:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 164) = a2;
  return result;
}

- (void)setSensorConfigurationsByPortType:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 104);
}

- (uint64_t)setSensorCenterOffset:(double)a3
{
  if (result)
  {
    *(double *)(result + 176) = a2;
    *(double *)(result + 184) = a3;
  }
  return result;
}

- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 284) = a2;
  return result;
}

- (uint64_t)setSemanticRenderingVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 272) = a2;
  return result;
}

- (uint64_t)setSemanticDevelopmentVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 276) = a2;
  return result;
}

- (uint64_t)setRetainedBufferCount:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 132) = a2;
  return result;
}

- (uint64_t)setReferenceFrameSelectionDelegate:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 152) = a2;
  return result;
}

- (uint64_t)setRedEyeReductionEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 268) = a2;
  return result;
}

- (uint64_t)setRawSensorDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 168) = a2;
  return result;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 416);
}

- (void)setRawColorCalibrationsByPortType:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 408);
}

- (uint64_t)setQuadraProcessingSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 161) = a2;
  return result;
}

- (void)setProvidedInferenceAttachedMediaByMode:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 256);
}

- (void)setPortTypesWithRawNightModeEnabled:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 216);
}

- (uint64_t)setPersonSemanticsVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 280) = a2;
  return result;
}

- (uint64_t)setOutputPoolBackPressureEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 148) = a2;
  return result;
}

- (uint64_t)setOutputBufferCount:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 136) = a2;
  return result;
}

- (uint64_t)setMinimumOutputBufferCount:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 140) = a2;
  return result;
}

- (uint64_t)setMaxNumberOfBurstCapturesAllowedInFlight:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 144) = a2;
  return result;
}

- (uint64_t)setMaxDeepFusionOutputCount:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 228) = a2;
  return result;
}

- (uint64_t)setLearnedNRMode:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 232) = a2;
  return result;
}

- (uint64_t)setInputIs10Bit:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 129) = a2;
  return result;
}

- (uint64_t)setInferenceMainImageDownscalingFactor:(uint64_t)result
{
  if (result)
    *(float *)(result + 248) = a2;
  return result;
}

- (uint64_t)setHorizontalSensorBinningFactor:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 368) = a2;
  return result;
}

- (uint64_t)setGreenGhostMitigationVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 376) = a2;
  return result;
}

- (uint64_t)setGenerateLiDARDepth:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 425) = a2;
  return result;
}

- (uint64_t)setGenerateInferencesForSemanticProcessingIfNeeded:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 318) = a2;
  return result;
}

- (uint64_t)setGainMapMainImageDownscalingFactor:(uint64_t)result
{
  if (result)
    *(float *)(result + 244) = a2;
  return result;
}

- (uint64_t)setFusionSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 212) = a2;
  return result;
}

- (uint64_t)setDigitalFlashSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 213) = a2;
  return result;
}

- (uint64_t)setDepthDataOutputDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 392) = a2;
  return result;
}

- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 380) = a2;
  return result;
}

- (uint64_t)setDemosaicedRawEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 403) = a2;
  return result;
}

- (uint64_t)setDeepZoomVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 236) = a2;
  return result;
}

- (uint64_t)setDeepZoomMode:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 240) = a2;
  return result;
}

- (uint64_t)setDeepFusionWaitForPreprocessingToFinish:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 225) = a2;
  return result;
}

- (uint64_t)setDeepFusionSyntheticsInNRSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 224) = a2;
  return result;
}

- (uint64_t)setDeepFusionSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 226) = a2;
  return result;
}

- (uint64_t)setContinuousZoomWithDepthSupported:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 400) = a2;
  return result;
}

- (uint64_t)setConstantColorVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 312) = a2;
  return result;
}

- (uint64_t)setConstantColorSaturationBoostEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 317) = a2;
  return result;
}

- (uint64_t)setConstantColorClippingRecoveryEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 316) = a2;
  return result;
}

- (uint64_t)setCmiResourceEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 424) = a2;
  return result;
}

- (uint64_t)setAlwaysAllowModifyingInputBuffers:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 128) = a2;
  return result;
}

- (uint64_t)setZoomingDisparityAllowed:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 401) = a2;
  return result;
}

- (uint64_t)setShouldComputeDisparityWhenCalibrationFails:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 402) = a2;
  return result;
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 352);
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 336);
}

- (void)setPortTypesWithDepthSegmentationPortraitParameters:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 384);
}

- (uint64_t)setIntelligentDistortionCorrectionVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 360) = a2;
  return result;
}

- (uint64_t)setIntelligentDistortionCorrectionAppliesFinalDimensions:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 364) = a2;
  return result;
}

- (uint64_t)setGeometricDistortionCorrectionExpandedImageDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 344) = a2;
  return result;
}

- (uint64_t)setDcProcessingWithDepthSupported:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 365) = a2;
  return result;
}

- (float)inferenceMainImageDownscalingFactor
{
  if (a1)
    return *(float *)(a1 + 248);
  else
    return 0.0;
}

- (BOOL)ultraHighResolutionProcessingEnabled
{
  if (result)
    return *(_BYTE *)(result + 200) != 0;
  return result;
}

- (BOOL)deepFusionSyntheticsInNRSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 224) != 0;
  return result;
}

- (uint64_t)maxDeepFusionOutputCount
{
  if (result)
    return *(unsigned int *)(result + 228);
  return result;
}

- (uint64_t)deepZoomMode
{
  if (result)
    return *(unsigned int *)(result + 240);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPhotonicEngineNodeConfiguration;
  -[BWStillImageNodeConfiguration dealloc](&v3, sel_dealloc);
}

- (uint64_t)jasperSensorConfiguration
{
  if (result)
    return *(_QWORD *)(result + 120);
  return result;
}

- (void)setJasperSensorConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 120);
}

- (uint64_t)minimumOutputBufferCount
{
  if (result)
    return *(unsigned int *)(result + 140);
  return result;
}

- (uint64_t)maxNumberOfBurstCapturesAllowedInFlight
{
  if (result)
    return *(unsigned int *)(result + 144);
  return result;
}

- (uint64_t)referenceFrameSelectionDelegate
{
  if (result)
    return *(_QWORD *)(result + 152);
  return result;
}

- (uint64_t)dimensionsByQSubResolutionFlavorByPortType
{
  if (result)
    return *(_QWORD *)(result + 192);
  return result;
}

- (void)setDimensionsByQSubResolutionFlavorByPortType:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 192);
}

- (uint64_t)stillImageGDCSourceMode
{
  if (result)
    return *(unsigned int *)(result + 204);
  return result;
}

- (uint64_t)sfhrMode
{
  if (result)
    return *(unsigned int *)(result + 208);
  return result;
}

- (uint64_t)setSfhrMode:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 208) = a2;
  return result;
}

- (uint64_t)smartStyleRenderingVersion
{
  if (result)
    return *(unsigned int *)(result + 288);
  return result;
}

- (uint64_t)setSmartStyleRenderingVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 288) = a2;
  return result;
}

- (BOOL)smartStyleReversibilityEnabled
{
  if (result)
    return *(_BYTE *)(result + 292) != 0;
  return result;
}

- (uint64_t)setSmartStyleReversibilityEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 292) = a2;
  return result;
}

- (uint64_t)smartStyleLinearThumbnailDimensions
{
  if (result)
    return *(_QWORD *)(result + 296);
  return result;
}

- (uint64_t)setSmartStyleLinearThumbnailDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 296) = a2;
  return result;
}

- (uint64_t)smartStyleStyledThumbnailDimensions
{
  if (result)
    return *(_QWORD *)(result + 304);
  return result;
}

- (uint64_t)setSmartStyleStyledThumbnailDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 304) = a2;
  return result;
}

- (BOOL)constantColorClippingRecoveryEnabled
{
  if (result)
    return *(_BYTE *)(result + 316) != 0;
  return result;
}

- (BOOL)constantColorSaturationBoostEnabled
{
  if (result)
    return *(_BYTE *)(result + 317) != 0;
  return result;
}

- (uint64_t)standardFormatDimensions
{
  if (result)
    return *(_QWORD *)(result + 320);
  return result;
}

- (uint64_t)setOutputDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 328) = a2;
  return result;
}

- (BOOL)dcProcessingWithDepthSupported
{
  if (result)
    return *(_BYTE *)(result + 365) != 0;
  return result;
}

- (BOOL)continuousZoomWithDepthSupported
{
  if (result)
    return *(_BYTE *)(result + 400) != 0;
  return result;
}

- (uint64_t)setDemosaicedRawPixelFormat:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 404) = a2;
  return result;
}

@end
