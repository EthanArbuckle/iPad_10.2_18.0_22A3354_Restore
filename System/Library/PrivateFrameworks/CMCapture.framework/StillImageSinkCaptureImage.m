@implementation StillImageSinkCaptureImage

uint64_t __captureSession_StillImageSinkCaptureImage_block_invoke(uint64_t a1)
{
  cs_updateSmartStyleSupport(*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), 0);
  return captureSession_captureStillImageNow(*(const void **)(a1 + 48), *(void **)(a1 + 40), *(void **)(a1 + 32));
}

@end
