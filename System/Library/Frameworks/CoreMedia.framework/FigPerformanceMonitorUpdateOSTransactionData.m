@implementation FigPerformanceMonitorUpdateOSTransactionData

void __FigPerformanceMonitorUpdateOSTransactionData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  uint64_t v6;
  const __CFAllocator *v7;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v9;
  CFStringRef Copy;
  CFStringRef v11;
  CFStringRef v12;
  CFStringRef v13;
  unint64_t UpTimeNanoseconds;
  int v15;
  const void *v16;
  const void *v17;
  const void *v18;
  unsigned int v19;
  __int128 v20;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = *(const void **)(a1 + 56);
  v4 = *(const void **)(a1 + 64);
  v6 = *(unsigned int *)(a1 + 72);
  v20 = 0uLL;
  v19 = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    v15 = FigSignalErrorAt(4294948226, 0, 0, 0, 0, 0, 0);
    v11 = 0;
    v13 = 0;
    goto LABEL_20;
  }
  v9 = Mutable;
  if ((int)v6 >= 1)
  {
    FigApplicationStateMonitorGetHostPIDIfAvailable(v6, (int *)&v19);
    if ((int)v19 >= 1)
      FigServer_CopyProcessName(v19, (CFStringRef *)&v20);
  }
  FigServer_CopyProcessName(v6, (CFStringRef *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1) && (_QWORD)v20)
  {
    Copy = CFStringCreateWithFormat(v7, 0, CFSTR("%@->%@ "), v20);
  }
  else
  {
    if (v20 == 0)
    {
      v11 = 0;
LABEL_16:
      FigCFDictionarySetValue(v9, CFSTR("name"), v5);
      v13 = 0;
      goto LABEL_17;
    }
    if (*((_QWORD *)&v20 + 1))
      Copy = CFStringCreateCopy(v7, *((CFStringRef *)&v20 + 1));
    else
      Copy = CFStringCreateWithFormat(v7, 0, CFSTR("%@-><UNKNOWN>"), (_QWORD)v20);
  }
  v11 = Copy;
  if (!Copy)
    goto LABEL_16;
  v12 = CFStringCreateWithFormat(v7, 0, CFSTR("%@_%@"), v5, Copy);
  if (!v12)
    goto LABEL_16;
  v13 = v12;
  FigCFDictionarySetValue(v9, CFSTR("name"), v12);
LABEL_17:
  FigCFDictionarySetValue(v9, CFSTR("weakRef"), v3);
  FigCFDictionarySetValue(v9, CFSTR("reason"), v4);
  FigCFDictionarySetInt32(v9, CFSTR("pid"), v6);
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  FigCFDictionarySetInt64(v9, CFSTR("creationTime"), UpTimeNanoseconds);
  CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 64), v9);
  CFRelease(v9);
  if (*((_QWORD *)&v20 + 1))
    CFRelease(*((CFTypeRef *)&v20 + 1));
  v15 = 0;
LABEL_20:
  if ((_QWORD)v20)
    CFRelease((CFTypeRef)v20);
  if (v13)
    CFRelease(v13);
  if (v11)
    CFRelease(v11);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v15;
  v16 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v16)
    CFRelease(v16);
  v17 = *(const void **)(a1 + 56);
  if (v17)
    CFRelease(v17);
  v18 = *(const void **)(a1 + 64);
  if (v18)
    CFRelease(v18);
}

@end
