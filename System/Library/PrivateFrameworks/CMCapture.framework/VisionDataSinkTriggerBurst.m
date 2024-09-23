@implementation VisionDataSinkTriggerBurst

uint64_t __captureSession_VisionDataSinkTriggerBurst_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!_FigIsCurrentDispatchQueue())
  {
    v7 = v1;
    LODWORD(v6) = 0;
    FigDebugAssert3();
  }
  v4 = objc_msgSend(*(id *)(DerivedStorage + 624), "visionDataSinkPipelineWithSinkID:", v2, v6, v7);
  if (v4)
    return -[FigCaptureVisionDataSinkPipeline triggerVisionDataBurst](v4);
  FigDebugAssert3();
  return FigSignalErrorAt();
}

@end
