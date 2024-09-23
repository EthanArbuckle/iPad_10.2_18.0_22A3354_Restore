@implementation APReceiverStatsCollectorUpdateAndCopyFrameStats

void __APReceiverStatsCollectorUpdateAndCopyFrameStats_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  __CFDictionary **v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  unsigned int v12;
  uint64_t v13;
  CFMutableStringRef v14;
  const void *v15;
  unint64_t v16;
  const __CFAllocator *alloc;
  __CFDictionary *Mutable;
  __CFDictionary **v19;

  v1 = a1[4];
  v2 = a1[5];
  v3 = (__CFDictionary **)a1[6];
  v4 = mach_absolute_time();
  ++*(_DWORD *)(v1 + 72);
  if (*(_QWORD *)v2 >= v4)
    v5 = UpTicksToMilliseconds();
  else
    v5 = -(int)UpTicksToMilliseconds();
  if (*(_BYTE *)(v1 + 112))
  {
    *(double *)(v1 + 104) = *(double *)(v1 + 104) + *(double *)(v1 + 96) * ((double)v5 - *(double *)(v1 + 104));
  }
  else
  {
    *(double *)(v1 + 104) = (double)v5;
    *(_BYTE *)(v1 + 112) = 1;
  }
  if (v5 < -*(_DWORD *)(v1 + 88)
    && gLogCategory_APReceiverStatsCollector <= 50
    && (gLogCategory_APReceiverStatsCollector != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v3)
  {
    v19 = v3;
    alloc = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v6 = *(_QWORD *)(v2 + 16);
    if (!v6)
      v6 = *(_QWORD *)(v2 + 8);
    snprintf_add();
    *(_QWORD *)(v1 + 240) = v6;
    v7 = *(_QWORD *)(v2 + 8);
    v8 = *(_DWORD *)(v1 + 248);
    if (v8 <= 0)
      v9 = 0;
    else
      v9 = v8 - 1;
    if (v9 >= *(_DWORD *)(v2 + 40))
      v9 = *(_DWORD *)(v2 + 40);
    if (v9 >= 1)
    {
      v10 = *(unsigned __int16 **)(v2 + 24);
      v11 = &v10[v9];
      do
      {
        snprintf_add();
        v12 = *v10++;
        v7 += (((unint64_t)v12 << 32) * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64;
      }
      while (v10 < v11);
    }
    if (*(int *)(v2 + 44) >= 1)
    {
      v13 = 0;
      do
      {
        snprintf_add();
        ++v13;
      }
      while (v13 < *(int *)(v2 + 44));
    }
    CFDictionarySetCString();
    FigCFDictionarySetInt32();
    v14 = CFStringCreateMutable(alloc, 0);
    UpTicksToMilliseconds();
    CFStringAppendF();
    CFDictionarySetValue(Mutable, CFSTR("preLine"), v14);
    CFRelease(v14);
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt64();
    v15 = *(const void **)(v1 + 120);
    if (v15)
    {
      HIDWORD(v16) = -1030792151 * *(_DWORD *)(v1 + 72);
      LODWORD(v16) = HIDWORD(v16);
      if ((v16 >> 2) <= 0x28F5C28)
        CFDictionarySetValue(Mutable, CFSTR("header"), v15);
    }
    *v19 = Mutable;
  }
}

@end
