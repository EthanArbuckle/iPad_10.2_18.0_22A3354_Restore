@implementation DecompressionOutputCallback

uint64_t __DecompressionOutputCallback_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  uint64_t result;
  char *v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  const __CFAllocator *v8;
  __CFDictionary *Mutable;
  CFStringRef v10;
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
      *(_QWORD *)dataPointerOut = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *((_DWORD *)v5 + 2) = 1701672038;
      *((_DWORD *)v5 + 4) = *(_DWORD *)(a1 + 64);
      *((_DWORD *)v5 + 5) = *(_DWORD *)(a1 + 68);
      *((_QWORD *)v5 + 3) = *(_QWORD *)(a1 + 40);
      v6 = *(_OWORD *)(a1 + 72);
      *((_QWORD *)v5 + 6) = *(_QWORD *)(a1 + 88);
      *((_OWORD *)v5 + 2) = v6;
      v7 = *(_OWORD *)(a1 + 96);
      *((_QWORD *)v5 + 9) = *(_QWORD *)(a1 + 112);
      *(_OWORD *)(v5 + 56) = v7;
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320))
      {
        v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v10 = CFStringCreateWithFormat(v8, 0, CFSTR("DecompressionSessionServer-%p"), *(_QWORD *)(a1 + 32));
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA4BA0], v10);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) = CMMemoryPoolCreate(Mutable);
        if (v10)
          CFRelease(v10);
        if (Mutable)
          CFRelease(Mutable);
      }
      if (*(_QWORD *)(a1 + 48) && !*(_DWORD *)(a1 + 64))
        return FigPixelBufferOriginAppendPixelBufferToIPCMessageData();
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

uint64_t __DecompressionOutputCallback_block_invoke_2()
{
  return 0;
}

@end
