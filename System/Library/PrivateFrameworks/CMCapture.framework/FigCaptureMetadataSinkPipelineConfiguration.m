@implementation FigCaptureMetadataSinkPipelineConfiguration

- (uint64_t)setPreviewEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 33) = a2;
  return result;
}

- (uint64_t)setDeferredPrepareEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 32) = a2;
  return result;
}

- (uint64_t)setUseSceneClassifierToGateMetadataDetection:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 25) = a2;
  return result;
}

- (uint64_t)setSmartCameraPipelineVersion:(uint64_t)result
{
  if (result)
  {
    *(_DWORD *)(result + 26) = a2;
    *(_WORD *)(result + 30) = WORD2(a2);
  }
  return result;
}

- (uint64_t)setPearlModuleType:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 44) = a2;
  return result;
}

- (uint64_t)setMotionAttachmentsSource:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 36) = a2;
  return result;
}

- (uint64_t)setBoxedMetadataEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 40) = a2;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMetadataSinkPipelineConfiguration;
  -[FigCaptureMetadataSinkPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)compressed8BitInputEnabled
{
  if (result)
    return *(_BYTE *)(result + 41) != 0;
  return result;
}

- (uint64_t)setCompressed8BitInputEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 41) = a2;
  return result;
}

@end
