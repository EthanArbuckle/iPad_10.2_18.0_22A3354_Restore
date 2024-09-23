@implementation FigHapticPlayerPauseNow

uint64_t __FigHapticPlayerPauseNow_block_invoke(uint64_t a1)
{
  uint64_t result;
  id v3;

  v3 = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "pauseAtTime:error:", &v3, 0.0);
  if ((result & 1) == 0)
  {
    result = objc_msgSend(v3, "code");
    if (result != -4805)
    {
      objc_msgSend(v3, "code");
      result = FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

@end
