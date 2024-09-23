@implementation APConnectivityHelperRemoveAllRegistrations

void __APConnectivityHelperRemoveAllRegistrations_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  CFMutableSetRef Mutable;
  const __CFSet *v4;
  CFMutableSetRef v5;
  const __CFSet *v6;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  if (Mutable)
  {
    v4 = Mutable;
    v5 = CFSetCreateMutable(v2, 0, 0);
    if (v5)
    {
      v6 = v5;
      CFDictionaryApplyBlock();
      CFDictionaryApplyBlock();
      if (gLogCategory_APConnectivityHelper <= 30
        && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
      {
        CFSetGetCount(v4);
        LogPrintF();
      }
      CFSetApplyBlock();
      if (gLogCategory_APConnectivityHelper <= 30
        && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
      {
        CFSetGetCount(v6);
        LogPrintF();
      }
      CFSetApplyBlock();
      CFRelease(v6);
    }
    else
    {
      APSLogErrorAt();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6728;
    }
    CFRelease(v4);
  }
  else
  {
    APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6728;
  }
}

void __APConnectivityHelperRemoveAllRegistrations_block_invoke_2(uint64_t a1, const void *a2, CFSetRef theSet)
{
  if (CFSetContainsValue(theSet, *(const void **)(a1 + 32)))
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), a2);
}

void __APConnectivityHelperRemoveAllRegistrations_block_invoke_3(uint64_t a1, const void *a2, CFSetRef theSet)
{
  if (CFSetContainsValue(theSet, *(const void **)(a1 + 32)))
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), a2);
}

uint64_t __APConnectivityHelperRemoveAllRegistrations_block_invoke_4(uint64_t a1, void *key)
{
  uint64_t result;

  result = _APConnectivityHelperDeregisterActivity(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), key);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __APConnectivityHelperRemoveAllRegistrations_block_invoke_5(uint64_t a1, void *key)
{
  uint64_t result;

  result = _APConnectivityHelperDeregisterForEvent(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), key);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

@end
