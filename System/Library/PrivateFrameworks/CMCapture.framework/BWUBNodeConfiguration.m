@implementation BWUBNodeConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWUBNodeConfiguration;
  -[BWStillImageNodeConfiguration dealloc](&v3, sel_dealloc);
}

- (uint64_t)stillImageFusionScheme
{
  if (result)
    return *(unsigned int *)(result + 96);
  return result;
}

- (uint64_t)setStillImageFusionScheme:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 96) = a2;
  return result;
}

- (uint64_t)sensorConfigurationsByPortType
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (void)setSensorConfigurationsByPortType:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 104);
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

- (BOOL)alwaysAllowModifyingInputBuffers
{
  if (result)
    return *(_BYTE *)(result + 128) != 0;
  return result;
}

- (uint64_t)setAlwaysAllowModifyingInputBuffers:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 128) = a2;
  return result;
}

- (BOOL)inputIs10Bit
{
  if (result)
    return *(_BYTE *)(result + 129) != 0;
  return result;
}

- (uint64_t)setInputIs10Bit:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 129) = a2;
  return result;
}

- (uint64_t)retainedBufferCount
{
  if (result)
    return *(unsigned int *)(result + 132);
  return result;
}

- (uint64_t)setRetainedBufferCount:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 132) = a2;
  return result;
}

- (uint64_t)outputBufferCount
{
  if (result)
    return *(unsigned int *)(result + 136);
  return result;
}

- (uint64_t)setOutputBufferCount:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 136) = a2;
  return result;
}

- (uint64_t)minimumOutputBufferCount
{
  if (result)
    return *(unsigned int *)(result + 140);
  return result;
}

- (uint64_t)setMinimumOutputBufferCount:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 140) = a2;
  return result;
}

- (uint64_t)maxNumberOfBurstCapturesAllowedInFlight
{
  if (result)
    return *(unsigned int *)(result + 144);
  return result;
}

- (uint64_t)setMaxNumberOfBurstCapturesAllowedInFlight:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 144) = a2;
  return result;
}

- (BOOL)outputPoolBackPressureEnabled
{
  if (result)
    return *(_BYTE *)(result + 148) != 0;
  return result;
}

- (uint64_t)setOutputPoolBackPressureEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 148) = a2;
  return result;
}

- (uint64_t)referenceFrameSelectionDelegate
{
  if (result)
    return *(_QWORD *)(result + 152);
  return result;
}

- (uint64_t)setReferenceFrameSelectionDelegate:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 152) = a2;
  return result;
}

- (BOOL)fusionSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 160) != 0;
  return result;
}

- (uint64_t)setFusionSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 160) = a2;
  return result;
}

- (BOOL)digitalFlashSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 161) != 0;
  return result;
}

- (uint64_t)setDigitalFlashSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 161) = a2;
  return result;
}

- (BOOL)deepFusionSyntheticsInNRSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 162) != 0;
  return result;
}

- (uint64_t)setDeepFusionSyntheticsInNRSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 162) = a2;
  return result;
}

- (BOOL)deepFusionWaitForPreprocessingToFinish
{
  if (result)
    return *(_BYTE *)(result + 163) != 0;
  return result;
}

- (uint64_t)setDeepFusionWaitForPreprocessingToFinish:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 163) = a2;
  return result;
}

- (BOOL)deepFusionSupportEnabled
{
  if (result)
    return *(_BYTE *)(result + 164) != 0;
  return result;
}

- (uint64_t)setDeepFusionSupportEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 164) = a2;
  return result;
}

- (uint64_t)maxDeepFusionOutputCount
{
  if (result)
    return *(unsigned int *)(result + 168);
  return result;
}

- (uint64_t)setMaxDeepFusionOutputCount:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 168) = a2;
  return result;
}

- (uint64_t)learnedNRMode
{
  if (result)
    return *(unsigned int *)(result + 172);
  return result;
}

- (uint64_t)setLearnedNRMode:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 172) = a2;
  return result;
}

- (uint64_t)deepZoomVersion
{
  if (result)
    return *(unsigned int *)(result + 176);
  return result;
}

- (uint64_t)setDeepZoomVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 176) = a2;
  return result;
}

- (float)gainMapMainImageDownscalingFactor
{
  if (a1)
    return *(float *)(a1 + 180);
  else
    return 0.0;
}

- (uint64_t)setGainMapMainImageDownscalingFactor:(uint64_t)result
{
  if (result)
    *(float *)(result + 180) = a2;
  return result;
}

- (float)inferenceMainImageDownscalingFactor
{
  if (a1)
    return *(float *)(a1 + 184);
  else
    return 0.0;
}

- (uint64_t)setInferenceMainImageDownscalingFactor:(uint64_t)result
{
  if (result)
    *(float *)(result + 184) = a2;
  return result;
}

- (uint64_t)providedInferenceAttachedMediaByMode
{
  if (result)
    return *(_QWORD *)(result + 192);
  return result;
}

- (void)setProvidedInferenceAttachedMediaByMode:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 192);
}

- (BOOL)redEyeReductionEnabled
{
  if (result)
    return *(_BYTE *)(result + 200) != 0;
  return result;
}

- (uint64_t)setRedEyeReductionEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 200) = a2;
  return result;
}

- (uint64_t)semanticRenderingVersion
{
  if (result)
    return *(unsigned int *)(result + 204);
  return result;
}

- (uint64_t)setSemanticRenderingVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 204) = a2;
  return result;
}

- (uint64_t)semanticDevelopmentVersion
{
  if (result)
    return *(unsigned int *)(result + 208);
  return result;
}

- (uint64_t)setSemanticDevelopmentVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 208) = a2;
  return result;
}

- (uint64_t)personSemanticsVersion
{
  if (result)
    return *(unsigned int *)(result + 212);
  return result;
}

- (uint64_t)setPersonSemanticsVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 212) = a2;
  return result;
}

- (BOOL)semanticStyleRenderingEnabled
{
  if (result)
    return *(_BYTE *)(result + 216) != 0;
  return result;
}

- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 216) = a2;
  return result;
}

- (uint64_t)outputDimensions
{
  if (result)
    return *(_QWORD *)(result + 220);
  return result;
}

- (uint64_t)setOutputDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 220) = a2;
  return result;
}

- (uint64_t)portTypesWithGeometricDistortionCorrectionEnabled
{
  if (result)
    return *(_QWORD *)(result + 232);
  return result;
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 232);
}

- (uint64_t)geometricDistortionCorrectionExpandedImageDimensions
{
  if (result)
    return *(_QWORD *)(result + 240);
  return result;
}

- (uint64_t)setGeometricDistortionCorrectionExpandedImageDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 240) = a2;
  return result;
}

- (uint64_t)portTypesWithIntelligentDistortionCorrectionEnabled
{
  if (result)
    return *(_QWORD *)(result + 248);
  return result;
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 248);
}

- (uint64_t)intelligentDistortionCorrectionVersion
{
  if (result)
    return *(unsigned int *)(result + 256);
  return result;
}

- (uint64_t)setIntelligentDistortionCorrectionVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 256) = a2;
  return result;
}

- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions
{
  if (result)
    return *(_BYTE *)(result + 260) != 0;
  return result;
}

- (uint64_t)setIntelligentDistortionCorrectionAppliesFinalDimensions:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 260) = a2;
  return result;
}

- (uint64_t)horizontalSensorBinningFactor
{
  if (result)
    return *(unsigned int *)(result + 264);
  return result;
}

- (uint64_t)setHorizontalSensorBinningFactor:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 264) = a2;
  return result;
}

- (uint64_t)verticalSensorBinningFactor
{
  if (result)
    return *(unsigned int *)(result + 268);
  return result;
}

- (uint64_t)setVerticalSensorBinningFactor:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 268) = a2;
  return result;
}

- (uint64_t)greenGhostMitigationVersion
{
  if (result)
    return *(unsigned int *)(result + 272);
  return result;
}

- (uint64_t)setGreenGhostMitigationVersion:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 272) = a2;
  return result;
}

- (BOOL)depthDataDeliveryEnabled
{
  if (result)
    return *(_BYTE *)(result + 276) != 0;
  return result;
}

- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 276) = a2;
  return result;
}

- (uint64_t)portTypesWithDepthSegmentationPortraitParameters
{
  if (result)
    return *(_QWORD *)(result + 280);
  return result;
}

- (void)setPortTypesWithDepthSegmentationPortraitParameters:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 280);
}

- (uint64_t)disparityOutputDimensions
{
  if (result)
    return *(_QWORD *)(result + 288);
  return result;
}

- (uint64_t)setDisparityOutputDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 288) = a2;
  return result;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  if (result)
    return *(_BYTE *)(result + 296) != 0;
  return result;
}

- (uint64_t)setShouldComputeDisparityWhenCalibrationFails:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 296) = a2;
  return result;
}

- (BOOL)demosaicedRawEnabled
{
  if (result)
    return *(_BYTE *)(result + 297) != 0;
  return result;
}

- (uint64_t)setDemosaicedRawEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 297) = a2;
  return result;
}

- (uint64_t)demosaicedRawPixelFormat
{
  if (result)
    return *(unsigned int *)(result + 300);
  return result;
}

- (uint64_t)setDemosaicedRawPixelFormat:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 300) = a2;
  return result;
}

- (uint64_t)rawColorCalibrationsByPortType
{
  if (result)
    return *(_QWORD *)(result + 304);
  return result;
}

- (void)setRawColorCalibrationsByPortType:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 304);
}

- (uint64_t)rawLensShadingCorrectionCoefficientsByPortType
{
  if (result)
    return *(_QWORD *)(result + 312);
  return result;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 312);
}

- (BOOL)generateLiDARDepth
{
  if (result)
    return *(_BYTE *)(result + 320) != 0;
  return result;
}

- (uint64_t)setGenerateLiDARDepth:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 320) = a2;
  return result;
}

@end
