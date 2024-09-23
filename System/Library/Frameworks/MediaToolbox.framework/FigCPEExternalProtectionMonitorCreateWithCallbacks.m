@implementation FigCPEExternalProtectionMonitorCreateWithCallbacks

void __FigCPEExternalProtectionMonitorCreateWithCallbacks_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void (*v3)(_QWORD, _QWORD, void (*)(int, int, CFStringRef), _QWORD);
  _QWORD *v4;
  void (*v5)(_QWORD);
  uint64_t v6;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void (*)(_QWORD, _QWORD, void (*)(int, int, CFStringRef), _QWORD))v2[6];
  if (v3)
    v3(v2[4], v2[18], FigCPEExternalProtectionMonitorNotificationCallback, 0);
  FigNotificationCenterAddWeakListener();
  CFSetAddValue(*(CFMutableSetRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) + 24), *(const void **)(a1 + 32));
  UpdateNonExclusiveDisplayList(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  v4 = *(_QWORD **)(a1 + 32);
  if (*(int *)(v4[18] + 32) >= 1
    && (v5 = (void (*)(_QWORD))v4[8]) != 0
    && (v5(v4[4]), (v4 = *(_QWORD **)(a1 + 32)) == 0))
  {
    v6 = 0;
  }
  else
  {
    CFRetain(v4);
    v6 = *(_QWORD *)(a1 + 32);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __FigCPEExternalProtectionMonitorCreateWithCallbacks_block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v6;
  dispatch_async(global_queue, block);
}

void __FigCPEExternalProtectionMonitorCreateWithCallbacks_block_invoke_2(uint64_t a1)
{
  const void *v2;

  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
