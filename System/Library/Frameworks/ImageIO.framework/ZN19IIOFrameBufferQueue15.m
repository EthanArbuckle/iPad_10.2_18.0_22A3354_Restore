@implementation ZN19IIOFrameBufferQueue15

const char *___ZN19IIOFrameBufferQueue15_enqueueBuffersEPK9__CFArray_block_invoke(const char *result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  unsigned __int8 v5;

  v4 = *((_QWORD *)result + 4);
  v5 = atomic_load((unsigned __int8 *)(v4 + 40));
  if ((v5 & 1) == 0)
  {
    result = (const char *)gFunc_CMBufferQueueEnqueue(*(_QWORD *)(v4 + 16));
    if ((_DWORD)result)
    {
      if ((gIIODebugFlags & 0x1000000000000) != 0)
        result = ImageIOLog("*** CMBufferQueueEnqueue() failed (status == %d)\n", (_DWORD)result);
      *a4 = 1;
    }
  }
  return result;
}

@end
