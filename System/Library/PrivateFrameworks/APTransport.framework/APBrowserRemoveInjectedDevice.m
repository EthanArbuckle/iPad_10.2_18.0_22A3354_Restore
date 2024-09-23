@implementation APBrowserRemoveInjectedDevice

uint64_t __APBrowserRemoveInjectedDevice_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CFDictionaryContainsKey(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 200), *(const void **)(a1 + 40));
  if ((_DWORD)result)
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 200), *(const void **)(a1 + 40));
    result = **(_QWORD **)(a1 + 32);
    if (*(int *)result <= 50)
    {
      if (*(_DWORD *)result != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

@end
