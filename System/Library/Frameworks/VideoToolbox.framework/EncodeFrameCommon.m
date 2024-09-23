@implementation EncodeFrameCommon

uint64_t __vtCompressionSessionRemote_EncodeFrameCommon_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigAtomicIncrement32();
  if ((_DWORD)result == 1)
    result = FigSemaphoreWaitRelative();
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 40);
  return result;
}

uint64_t __vtCompressionSessionRemote_EncodeFrameCommon_block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  if (v1)
  {
    v2 = result;
    do
    {
      while (1)
      {
        v3 = v1;
        v1 = *(_QWORD *)(v1 + 48);
        if (v3 == *(_QWORD *)(v2 + 40))
        {
          v4 = *(const void **)(v3 + 32);
          if (v4)
          {
            _Block_release(v4);
            v3 = *(_QWORD *)(v2 + 40);
          }
          v5 = *(_QWORD *)(v2 + 32);
          v8 = *(_QWORD *)(v5 + 40);
          v6 = (_QWORD *)(v5 + 40);
          v7 = v8;
          if (v8 != v3)
          {
            do
            {
              v9 = v7;
              v7 = *(_QWORD *)(v7 + 48);
            }
            while (v7 != v3);
            v6 = (_QWORD *)(v9 + 48);
          }
          *v6 = *(_QWORD *)(v3 + 48);
          free(*(void **)(v2 + 40));
          result = FigAtomicDecrement32();
          if (!(_DWORD)result)
            break;
        }
        if (!v1)
          return result;
      }
      result = FigSemaphoreSignal();
    }
    while (v1);
  }
  return result;
}

@end
