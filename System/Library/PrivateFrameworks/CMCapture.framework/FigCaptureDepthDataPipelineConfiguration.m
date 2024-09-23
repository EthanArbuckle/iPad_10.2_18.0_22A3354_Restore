@implementation FigCaptureDepthDataPipelineConfiguration

- (uint64_t)setVideoAndConvertedDepthDataOutputEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 34) = a2;
  return result;
}

- (void)setRequiredFormat:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 96);
}

- (uint64_t)setDepthDataBaseRotationDegrees:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 80) = a2;
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
    *(_OWORD *)(a1 + 48) = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 64) = v3;
  }
  return result;
}

- (void)setCameraInfoByPortType:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 88);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDepthDataPipelineConfiguration;
  -[FigCaptureDepthDataPipelineConfiguration dealloc](&v3, sel_dealloc);
}

@end
