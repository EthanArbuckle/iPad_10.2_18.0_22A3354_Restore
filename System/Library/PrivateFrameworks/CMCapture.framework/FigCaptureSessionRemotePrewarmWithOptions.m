@implementation FigCaptureSessionRemotePrewarmWithOptions

void __FigCaptureSessionRemotePrewarmWithOptions_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  captureSessionRemote_prewarm(*(_QWORD *)(a1 + 32), *(const __CFDictionary **)(a1 + 40));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

@end
