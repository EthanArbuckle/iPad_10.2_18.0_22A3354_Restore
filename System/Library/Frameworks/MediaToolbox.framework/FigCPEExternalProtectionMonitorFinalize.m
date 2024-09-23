@implementation FigCPEExternalProtectionMonitorFinalize

void __FigCPEExternalProtectionMonitorFinalize_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  const __CFSet *v4;
  _QWORD *v5;
  void (*v6)(_QWORD, _QWORD, void (*)(int, int, CFStringRef), _QWORD);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144)
                                                                         + 32) > 0;
  v1 = *(_QWORD **)(a1 + 40);
  v2 = v1[18];
  if (v2)
  {
    v4 = *(const __CFSet **)(v2 + 24);
    if (v4)
    {
      if (CFSetContainsValue(v4, v1))
      {
        CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144) + 24), *(const void **)(a1 + 40));
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144) + 56), *(const void **)(a1 + 40));
        v5 = *(_QWORD **)(a1 + 40);
        if (*(_QWORD *)(v5[18] + 16))
        {
          FigNotificationCenterRemoveWeakListener();
          v5 = *(_QWORD **)(a1 + 40);
        }
        v6 = (void (*)(_QWORD, _QWORD, void (*)(int, int, CFStringRef), _QWORD))v5[7];
        if (v6)
        {
          v6(v5[4], v5[18], FigCPEExternalProtectionMonitorNotificationCallback, 0);
          v5 = *(_QWORD **)(a1 + 40);
        }
        UpdateNonExclusiveDisplayList(v5[18]);
      }
    }
  }
}

@end
