@implementation FigCPEExternalProtectionMonitorSetProperty

void __FigCPEExternalProtectionMonitorSetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  int v6;
  const void *v7;
  NSObject *global_queue;
  _QWORD v9[5];
  BOOL v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  v3 = *(const void **)(v2 + 40);
  if (v3)
  {
    CFRetain(*(CFTypeRef *)(v2 + 40));
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
    v4 = *(const void **)(v2 + 40);
  }
  else
  {
    v4 = 0;
  }
  v5 = *(const void **)(a1 + 40);
  *(_QWORD *)(v2 + 40) = v5;
  if (v5)
    CFRetain(v5);
  if (v4)
    CFRelease(v4);
  UpdateNonExclusiveDisplayList(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  v6 = FigCFEqual();
  if (v3)
    CFRelease(v3);
  v7 = *(const void **)(a1 + 40);
  if (v7)
    CFRelease(v7);
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __FigCPEExternalProtectionMonitorSetProperty_block_invoke_2;
  v9[3] = &__block_descriptor_41_e5_v8__0l;
  v10 = v6 == 0;
  v9[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, v9);
}

void __FigCPEExternalProtectionMonitorSetProperty_block_invoke_2(uint64_t a1)
{
  CFMutableDictionaryRef Mutable;

  if (*(_BYTE *)(a1 + 40))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigCFDictionarySetInt32();
    CMNotificationCenterPostNotification();
    if (Mutable)
      CFRelease(Mutable);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
