@implementation FigCaptureVideoDataSinkPipelineConfiguration

- (uint64_t)sourceDeviceType
{
  if (result)
    return *(unsigned int *)(result + 72);
  return result;
}

- (uint64_t)setVisOutputDimensions:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 76) = a2;
  return result;
}

- (uint64_t)setVideoSTFEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 61) = a2;
  return result;
}

- (uint64_t)setSourceVideoTransform:(uint64_t)a3
{
  if (result)
  {
    *(_QWORD *)(result + 8) = a2;
    *(_QWORD *)(result + 16) = a3;
  }
  return result;
}

- (uint64_t)setP3ToBT2020ConversionEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 48) = a2;
  return result;
}

- (uint64_t)setOfflineVISMotionDataEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 37) = a2;
  return result;
}

- (uint64_t)setMotionAttachmentsSource:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 32) = a2;
  return result;
}

- (uint64_t)setForcePixelTransfer:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 60) = a2;
  return result;
}

- (uint64_t)setFaceTrackingEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 36) = a2;
  return result;
}

- (__n128)setClientAuditToken:(uint64_t)a1
{
  __n128 result;
  __int128 v3;

  if (a1)
  {
    result = *(__n128 *)a2;
    v3 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 112) = v3;
  }
  return result;
}

- (BOOL)deskCamEnabled
{
  if (result)
    return *(_BYTE *)(result + 136) != 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkPipelineConfiguration;
  -[FigCaptureVideoDataSinkPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (uint64_t)setPocketDetectionEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 129) = a2;
  return result;
}

- (uint64_t)setOverheadCameraMode:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 140) = a2;
  return result;
}

- (void)setClientApplicationID:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 152);
}

- (uint64_t)setSmartStyleRenderingEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 160) = a2;
  return result;
}

@end
