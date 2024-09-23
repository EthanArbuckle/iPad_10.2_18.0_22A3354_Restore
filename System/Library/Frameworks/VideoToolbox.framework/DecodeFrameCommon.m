@implementation DecodeFrameCommon

uint64_t __dsrxpc_DecodeFrameCommon_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  uint64_t result;
  char *v4;
  char *v5;
  size_t lengthAtOffsetOut;
  char *dataPointerOut;

  lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  result = CMBlockBufferGetDataPointer(theBuffer, 0, &lengthAtOffsetOut, 0, &dataPointerOut);
  if (!(_DWORD)result)
  {
    v4 = dataPointerOut;
    if ((dataPointerOut & 7) != 0)
    {
      return 4294949291;
    }
    else if (lengthAtOffsetOut > 0x57)
    {
      *((_QWORD *)dataPointerOut + 10) = 0;
      *((_OWORD *)v4 + 3) = 0u;
      *((_OWORD *)v4 + 4) = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_OWORD *)v4 + 2) = 0u;
      *(_OWORD *)v4 = 0u;
      v5 = dataPointerOut;
      *(_QWORD *)dataPointerOut = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
      *((_DWORD *)v5 + 2) = 1684366182;
      *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 80);
      *((_QWORD *)v5 + 2) = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16);
      v5[48] = *(_QWORD *)(a1 + 32) != 0;
      FigXPCRemoteClientGetServerPID();
      result = FigInMemorySerializerAppendCFDictionary();
      if (!(_DWORD)result)
      {
        if (dsrxpc_sampleBufferAttachmentsKeysToDrop_onceToken != -1)
          dispatch_once(&dsrxpc_sampleBufferAttachmentsKeysToDrop_onceToken, &__block_literal_global_15);
        return FigInMemorySerializerAppendCMSampleBuffer();
      }
    }
    else
    {
      return 4294949290;
    }
  }
  return result;
}

uint64_t __dsrxpc_DecodeFrameCommon_block_invoke_2(uint64_t a1, CMBlockBufferRef theBuffer)
{
  uint64_t result;
  char *v4;
  size_t v5;
  char *dataPointerOut;

  v5 = 0;
  dataPointerOut = 0;
  result = CMBlockBufferGetDataPointer(theBuffer, 0, &v5, 0, &dataPointerOut);
  if (!(_DWORD)result)
  {
    v4 = dataPointerOut;
    if ((dataPointerOut & 7) != 0)
    {
      return 4294949291;
    }
    else if (v5 > 0x57)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *((_DWORD *)dataPointerOut + 4);
      if (*((_QWORD *)v4 + 3))
        return FigMemoryOriginUpdateRecipientStateFromIPCMessageData();
      else
        return 0;
    }
    else
    {
      return 4294949290;
    }
  }
  return result;
}

uint64_t __vtDecompressionSessionRemote_DecodeFrameCommon_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigAtomicIncrement32();
  if ((_DWORD)result == 1)
    result = FigSemaphoreWaitRelative();
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 40);
  return result;
}

uint64_t __vtDecompressionSessionRemote_DecodeFrameCommon_block_invoke_2(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  const void *v4;
  const void *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  v1 = *(_QWORD **)(*(_QWORD *)(result + 32) + 32);
  if (v1)
  {
    v2 = result;
    do
    {
      while (1)
      {
        v3 = v1;
        v1 = (_QWORD *)v1[9];
        if (v3 == *(_QWORD **)(v2 + 40))
        {
          v4 = (const void *)v3[3];
          if (v4)
          {
            _Block_release(v4);
            v3 = *(_QWORD **)(v2 + 40);
          }
          v5 = (const void *)v3[4];
          if (v5)
          {
            _Block_release(v5);
            v3 = *(_QWORD **)(v2 + 40);
          }
          v6 = *(_QWORD *)(v2 + 32);
          v9 = *(_QWORD **)(v6 + 32);
          v7 = (_QWORD *)(v6 + 32);
          v8 = v9;
          if (v9 != v3)
          {
            do
            {
              v10 = v8;
              v8 = (_QWORD *)v8[9];
            }
            while (v8 != v3);
            v7 = v10 + 9;
          }
          *v7 = v3[9];
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
