@implementation FigHapticPlayerSetActiveChannelIndexNow

uint64_t __FigHapticPlayerSetActiveChannelIndexNow_block_invoke(_QWORD *a1)
{
  uint64_t result;
  id v3;

  v3 = 0;
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1[5] + 88), "activateChannelByIndex:atTime:error:", a1[6], &v3, 0.0);
    if ((result & 1) == 0)
    {
      objc_msgSend(v3, "code");
      result = FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
    }
  }
  return result;
}

@end
