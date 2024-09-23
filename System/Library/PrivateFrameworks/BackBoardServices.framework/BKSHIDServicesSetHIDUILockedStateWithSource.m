@implementation BKSHIDServicesSetHIDUILockedStateWithSource

void __BKSHIDServicesSetHIDUILockedStateWithSource_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setChangeSource:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setDigitizerEnabled:", *(_BYTE *)(a1 + 40) == 0);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v4, "setTapToWakeEnabled:", *(_BYTE *)(a1 + 41) == 0);
  else
    objc_msgSend(v4, "setPocketTouchesExpected:", *(unsigned __int8 *)(a1 + 42));
  v3 = v4;
  if (*(_BYTE *)(a1 + 43))
  {
    objc_msgSend(v4, "setProximityDetectionMode:", 5);
    v3 = v4;
  }

}

@end
