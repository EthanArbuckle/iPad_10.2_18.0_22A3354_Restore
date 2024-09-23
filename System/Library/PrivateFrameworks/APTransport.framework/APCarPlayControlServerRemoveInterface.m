@implementation APCarPlayControlServerRemoveInterface

void __APCarPlayControlServerRemoveInterface_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16) && CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 72), *(const void **)(a1 + 40)))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
    {
      BonjourAdvertiserStop();
      if (gLogCategory_CarPlayControlServer <= 40
        && (gLogCategory_CarPlayControlServer != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 64) - 1;
    *(_QWORD *)(v3 + 64) = v4;
    if (!v4)
    {
      CFObjectSetProperty();
      if (gLogCategory_CarPlayControlServer <= 50
        && (gLogCategory_CarPlayControlServer != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 72), *(const void **)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
