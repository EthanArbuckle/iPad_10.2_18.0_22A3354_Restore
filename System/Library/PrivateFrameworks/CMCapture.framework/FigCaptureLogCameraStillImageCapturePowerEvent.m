@implementation FigCaptureLogCameraStillImageCapturePowerEvent

uint64_t __FigCaptureLogCameraStillImageCapturePowerEvent_block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t result;

  v2 = (id)sCameraStillImageCaptureCounts;
  if (!sCameraStillImageCaptureCounts)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    sCameraStillImageCaptureCounts = (uint64_t)v2;
  }
  v3 = objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)), "intValue");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v3 + 1));
  result = objc_msgSend((id)sCameraStillImageCaptureCounts, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
    ++sCameraStillImageDeferredProcessingCaptureCounts;
  return result;
}

@end
