@implementation FigHapticPlayerSetVolumeNow

uint64_t __FigHapticPlayerSetVolumeNow_block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  id v4;

  v4 = 0;
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 48);
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setVolume:atTime:error:", &v4, v3, 0.0);
    if ((result & 1) == 0)
    {
      objc_msgSend(v4, "code");
      result = FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

@end
