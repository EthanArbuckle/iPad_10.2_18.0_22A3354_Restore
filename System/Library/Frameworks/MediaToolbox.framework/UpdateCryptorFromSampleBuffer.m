@implementation UpdateCryptorFromSampleBuffer

void __vq_UpdateCryptorFromSampleBuffer_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t DefaultLocalCenter;
  CFTypeRef v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, const __CFString *, uint64_t);
  const void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[6];
  CFTypeRef cf;

  v1 = a1[6];
  if (!*(_DWORD *)v1 && *(_QWORD *)(v1 + 376) != a1[7])
  {
    DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
    v4 = *(CFTypeRef *)(a1[6] + 376);
    if (v4)
      v4 = CFRetain(v4);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v4;
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    {
      FigNotificationCenterRemoveWeakListener();
      FigNotificationCenterRemoveWeakListener();
    }
    v6 = a1[6];
    v5 = (const void *)a1[7];
    v7 = *(const void **)(v6 + 376);
    *(_QWORD *)(v6 + 376) = v5;
    if (v5)
      CFRetain(v5);
    if (v7)
      CFRelease(v7);
    v8 = a1[7];
    if (v8)
    {
      cf = 0;
      v9 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                               + 48);
      if (v9)
      {
        if (!v9(v8, *MEMORY[0x1E0CA3218], *MEMORY[0x1E0C9AE00], &cf))
        {
          v10 = cf;
          *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = cf == (CFTypeRef)*MEMORY[0x1E0C9AE50];
          if (v10)
            CFRelease(v10);
        }
      }
      v11 = *(_QWORD *)(a1[6] + 632);
      if (v11)
      {
        v12 = a1[7];
        v13 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 56);
        if (v13)
          v13(v12, CFSTR("DisplayList"), v11);
      }
      FigNotificationCenterAddWeakListener();
      FigNotificationCenterAddWeakListener();
    }
    v14 = (const void *)a1[8];
    if (v14)
    {
      CFRetain(v14);
      v15 = a1[8];
    }
    else
    {
      v15 = 0;
    }
    v16 = *(NSObject **)(a1[6] + 520);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __vq_UpdateCryptorFromSampleBuffer_block_invoke_2;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = DefaultLocalCenter;
    block[5] = v15;
    dispatch_async(v16, block);
  }
}

void __vq_UpdateCryptorFromSampleBuffer_block_invoke_2(uint64_t a1)
{
  const void *v2;

  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

@end
