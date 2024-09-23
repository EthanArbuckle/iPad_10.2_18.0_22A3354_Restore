@implementation VTCompressionSessionRemote

uint64_t __VTCompressionSessionRemote_Create_block_invoke(uint64_t a1, mach_port_t a2, int a3, _DWORD *a4, _QWORD *a5, uint64_t *a6)
{
  pid_t v7;
  const __CFData *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  const UInt8 *BytePtr;
  const __CFData *v14;
  unsigned int Length;
  const __CFData *v16;
  const UInt8 *v17;
  const __CFData *v18;
  unsigned int v19;
  const __CFData *v20;
  const UInt8 *v21;
  uint64_t result;
  unsigned int v28;
  _OWORD buffer[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  memset(buffer, 0, sizeof(buffer));
  v7 = getpid();
  proc_name(v7, buffer, 0x20u);
  v8 = *(const __CFData **)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  v11 = *(_DWORD *)(a1 + 64);
  v10 = *(_DWORD *)(a1 + 68);
  v12 = *(_DWORD *)(a1 + 72);
  if (v8)
  {
    BytePtr = CFDataGetBytePtr(v8);
    v14 = *(const __CFData **)(a1 + 40);
    if (v14)
    {
      Length = CFDataGetLength(v14);
      goto LABEL_6;
    }
  }
  else
  {
    BytePtr = 0;
  }
  Length = 0;
LABEL_6:
  v16 = *(const __CFData **)(a1 + 48);
  if (v16)
  {
    v17 = CFDataGetBytePtr(v16);
    v18 = *(const __CFData **)(a1 + 48);
    if (v18)
    {
      v19 = CFDataGetLength(v18);
      goto LABEL_11;
    }
  }
  else
  {
    v17 = 0;
  }
  v19 = 0;
LABEL_11:
  v20 = *(const __CFData **)(a1 + 56);
  if (v20)
  {
    v21 = CFDataGetBytePtr(v20);
    v20 = *(const __CFData **)(a1 + 56);
    if (v20)
      LODWORD(v20) = CFDataGetLength(v20);
  }
  else
  {
    v21 = 0;
  }
  LODWORD(result) = VTCompressionSessionRemoteClient_Create(a2, a3, v9, v11, v10, v12, (uint64_t)BytePtr, Length, (uint64_t)v17, v19, (uint64_t)v21, v20, (char *)buffer, a4, a5, a6, (int *)&v28);
  if ((_DWORD)result)
    return result;
  else
    return v28;
}

uint64_t __VTCompressionSessionRemote_EstimateMotionVectors_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigAtomicIncrement32();
  if ((_DWORD)result == 1)
    result = FigSemaphoreWaitRelative();
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 40);
  return result;
}

uint64_t __VTCompressionSessionRemote_EstimateMotionVectors_block_invoke_2(uint64_t result)
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
