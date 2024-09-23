@implementation VTDecompressionSessionRemote

uint64_t __VTDecompressionSessionRemote_Create_block_invoke(_QWORD *a1, mach_port_t a2, int a3, _DWORD *a4, _QWORD *a5, _QWORD *a6)
{
  pid_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFData *v13;
  uint64_t v14;
  const UInt8 *BytePtr;
  const __CFData *v16;
  unsigned int Length;
  const __CFData *v18;
  const UInt8 *v19;
  uint64_t result;
  unsigned int v23;
  _OWORD buffer[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  memset(buffer, 0, sizeof(buffer));
  v10 = getpid();
  proc_name(v10, buffer, 0x20u);
  v11 = a1[5];
  v12 = *(_QWORD *)(a1[4] + 240);
  v14 = a1[6];
  v13 = (const __CFData *)a1[7];
  if (v13)
  {
    BytePtr = CFDataGetBytePtr(v13);
    v16 = (const __CFData *)a1[7];
    if (v16)
    {
      Length = CFDataGetLength(v16);
      goto LABEL_6;
    }
  }
  else
  {
    BytePtr = 0;
  }
  Length = 0;
LABEL_6:
  v18 = (const __CFData *)a1[8];
  if (v18)
  {
    v19 = CFDataGetBytePtr(v18);
    v18 = (const __CFData *)a1[8];
    if (v18)
      LODWORD(v18) = CFDataGetLength(v18);
  }
  else
  {
    v19 = 0;
  }
  LODWORD(result) = VTDecompressionSessionRemoteClient_Create(a2, a3, v12, v11, v14, (uint64_t)BytePtr, Length, (uint64_t)v19, (int)v18, (char *)buffer, a4, a5, a6, (int *)&v23);
  if ((_DWORD)result)
    return result;
  else
    return v23;
}

uint64_t __VTDecompressionSessionRemote_GetMinOutputPresentationTimeStampOfFramesBeingDecoded_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = VTDecompressionSessionRemoteClient_GetMinOutputPresentationTimeStampOfFramesBeingDecoded(*(_DWORD *)(a1[6] + 24), *(_QWORD *)(a1[5] + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __VTDecompressionSessionRemote_GetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = VTDecompressionSessionRemoteClient_GetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded(*(_DWORD *)(a1[8] + 24), *(_QWORD *)(a1[5] + 8) + 24, *(_QWORD *)(a1[6] + 8) + 24, (_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __VTDecompressionSessionRemote_DecodeTile_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigAtomicIncrement32();
  if ((_DWORD)result == 1)
    result = FigSemaphoreWaitRelative();
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 40);
  return result;
}

uint64_t __VTDecompressionSessionRemote_DecodeTile_block_invoke_2(uint64_t result)
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

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  if (v1)
  {
    v2 = result;
    do
    {
      while (1)
      {
        v3 = v1;
        v1 = *(_QWORD *)(v1 + 72);
        if (v3 == *(_QWORD *)(v2 + 40))
        {
          v4 = *(const void **)(v3 + 40);
          if (v4)
          {
            CFRelease(v4);
            v3 = *(_QWORD *)(v2 + 40);
          }
          v5 = *(_QWORD *)(v2 + 32);
          v8 = *(_QWORD *)(v5 + 32);
          v6 = (_QWORD *)(v5 + 32);
          v7 = v8;
          if (v8 != v3)
          {
            do
            {
              v9 = v7;
              v7 = *(_QWORD *)(v7 + 72);
            }
            while (v7 != v3);
            v6 = (_QWORD *)(v9 + 72);
          }
          *v6 = *(_QWORD *)(v3 + 72);
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
