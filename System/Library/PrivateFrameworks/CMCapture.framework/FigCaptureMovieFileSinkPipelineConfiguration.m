@implementation FigCaptureMovieFileSinkPipelineConfiguration

- (void)setVideoConnectionConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 16);
}

- (uint64_t)setCaptureDeviceHasOverCaptureEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 137) = a2;
  return result;
}

- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 140) = a2;
  return result;
}

- (uint64_t)setFrameReconstructionEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 139) = a2;
  return result;
}

- (uint64_t)setVitalityScoringEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 136) = a2;
  return result;
}

- (uint64_t)setOverCaptureEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 138) = a2;
  return result;
}

- (uint64_t)setP3ToBT2020ConversionEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 141) = a2;
  return result;
}

- (uint64_t)setCinematicAudioEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 152) = a2;
  return result;
}

- (void)setDetectedObjectMetadataConnectionConfigurations:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 40);
}

- (uint64_t)setVideoStabilizationType:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 104) = a2;
  return result;
}

- (void)setAudioConnectionConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 24);
}

- (void)setCameraConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 8);
}

- (BOOL)captureDeviceHasOverCaptureEnabled
{
  if (result)
    return *(_BYTE *)(result + 137) != 0;
  return result;
}

- (void)setStillImageConnectionConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 64);
}

- (uint64_t)cameraConfiguration
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)setVisOutputDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 96) = a2;
  return result;
}

- (uint64_t)setVideoStabilizationStrength:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 160) = a2;
  return result;
}

- (uint64_t)setVideoStabilizationOverscanOverride:(uint64_t)result
{
  if (result)
    *(float *)(result + 156) = a2;
  return result;
}

- (uint64_t)setVideoSourceCaptureTransform:(uint64_t)a3
{
  if (result)
  {
    *(_QWORD *)(result + 80) = a2;
    *(_QWORD *)(result + 88) = a3;
  }
  return result;
}

- (uint64_t)setSmartCameraPipelineVersion:(uint64_t)result
{
  if (result)
  {
    *(_DWORD *)(result + 116) = a2;
    *(_WORD *)(result + 120) = WORD2(a2);
  }
  return result;
}

- (void)setSceneClassifierConnectionConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 72);
}

- (void)setPortTypesWithGeometricDistortionCorrectionInVISEnabled:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 128);
}

- (uint64_t)setOfflineVISEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 122) = a2;
  return result;
}

- (uint64_t)setMotionAttachmentsSource:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 112) = a2;
  return result;
}

- (uint64_t)setMaximumAllowedInFlightCompressedBytes:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 176) = a2;
  return result;
}

- (uint64_t)setMaxLossyCompressionLevel:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 144) = a2;
  return result;
}

- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 185) = a2;
  return result;
}

- (void)setDepthDataConnectionConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 48);
}

- (void)setClientApplicationID:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 168);
}

- (void)setCameraDebugInfoMetadataConnectionConfiguration:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 32);
}

- (uint64_t)setBoxedMetadataPostVISEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 108) = a2;
  return result;
}

- (uint64_t)setVideoSTFEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 148) = a2;
  return result;
}

- (uint64_t)videoSourceCaptureTransform
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)setVideoGreenGhostMitigationEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 149) = a2;
  return result;
}

- (uint64_t)setLightSourceMaskAndKeypointDescriptorDataEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 184) = a2;
  return result;
}

- (BOOL)boxedMetadataPostVISEnabled
{
  if (result)
    return *(_BYTE *)(result + 108) != 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkPipelineConfiguration;
  -[FigCaptureMovieFileSinkPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (uint64_t)audioConnectionConfiguration
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)setDepthOutputDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 56) = a2;
  return result;
}

- (uint64_t)setIspFastSwitchEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 150) = a2;
  return result;
}

- (uint64_t)setTrueVideoCaptureEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 151) = a2;
  return result;
}

- (uint64_t)setLowResImageUsedByVideoEncoderEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 186) = a2;
  return result;
}

- (BOOL)smartStyleRenderingEnabled
{
  if (result)
    return *(_BYTE *)(result + 187) != 0;
  return result;
}

- (uint64_t)setSmartStyleRenderingEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 187) = a2;
  return result;
}

- (uint64_t)setSmartStyleReversibilityEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 188) = a2;
  return result;
}

- (uint64_t)setSmartStyleRenderingMethod:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 192) = a2;
  return result;
}

@end
