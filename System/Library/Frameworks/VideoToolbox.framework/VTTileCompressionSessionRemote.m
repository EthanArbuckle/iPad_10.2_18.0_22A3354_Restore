@implementation VTTileCompressionSessionRemote

uint64_t __VTTileCompressionSessionRemote_Create_block_invoke(uint64_t a1, mach_port_t a2, int a3, _DWORD *a4, _QWORD *a5, _QWORD *a6)
{
  pid_t v11;
  const __CFData *v12;
  uint64_t v13;
  unsigned int v14;
  const UInt8 *BytePtr;
  const __CFData *v16;
  unsigned int Length;
  const __CFData *v18;
  const UInt8 *v19;
  uint64_t result;
  unsigned int v22;
  _OWORD buffer[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  memset(buffer, 0, sizeof(buffer));
  v11 = getpid();
  proc_name(v11, buffer, 0x20u);
  v12 = *(const __CFData **)(a1 + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  v14 = *(_DWORD *)(a1 + 64);
  if (v12)
  {
    BytePtr = CFDataGetBytePtr(v12);
    v16 = *(const __CFData **)(a1 + 40);
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
  v18 = *(const __CFData **)(a1 + 48);
  if (v18)
  {
    v19 = CFDataGetBytePtr(v18);
    v18 = *(const __CFData **)(a1 + 48);
    if (v18)
      LODWORD(v18) = CFDataGetLength(v18);
  }
  else
  {
    v19 = 0;
  }
  LODWORD(result) = VTCompressionSessionRemoteClient_TileCreate(a2, a3, v13, *(_QWORD *)(a1 + 56), v14, (uint64_t)BytePtr, Length, (uint64_t)v19, (int)v18, (char *)buffer, a4, a5, a6, (int *)&v22);
  if ((_DWORD)result)
    return result;
  else
    return v22;
}

uint64_t __VTTileCompressionSessionRemote_EncodeTile_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigAtomicIncrement32();
  if ((_DWORD)result == 1)
    result = FigSemaphoreWaitRelative();
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 40);
  return result;
}

uint64_t __VTTileCompressionSessionRemote_EncodeTile_block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

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
          v4 = *(_QWORD *)(v2 + 32);
          v7 = *(_QWORD *)(v4 + 40);
          v5 = (_QWORD *)(v4 + 40);
          v6 = v7;
          if (v7 != v3)
          {
            do
            {
              v8 = v6;
              v6 = *(_QWORD *)(v6 + 48);
            }
            while (v6 != v3);
            v5 = (_QWORD *)(v8 + 48);
          }
          *v5 = v1;
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
