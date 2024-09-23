@implementation APBrowserRapportManagerCopyShowInfo

uint64_t __APBrowserRapportManagerCopyShowInfo_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  CFMutableStringRef *v4;
  int v5;
  CFMutableStringRef Mutable;
  CFMutableStringRef v7;
  int v8;
  CFIndex Count;

  v1 = result;
  v2 = -72284;
  v3 = *(_QWORD *)(result + 40);
  if (!*(_BYTE *)(v3 + 51))
  {
    v4 = *(CFMutableStringRef **)(result + 48);
    v5 = APBrowserRapportManager_ensurePreferencesUpdated(*(_BYTE **)(result + 40), 0);
    if (v5)
    {
      v8 = v5;
      result = APSLogErrorAt();
      v2 = v8;
    }
    else
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      if (Mutable)
      {
        v7 = Mutable;
        CFStringAppendF();
        CFStringAppendF();
        CFStringAppendF();
        if (*(_WORD *)(v3 + 48)
          && *(_WORD *)(v3 + 48) != 1
          && gLogCategory_APBrowserRapportManager <= 60
          && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        CFStringAppendF();
        CFStringAppendF();
        Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v3 + 80));
        CFStringAppendF();
        result = CFStringAppendF();
        if (Count)
        {
          CFStringAppendF();
          result = CFDictionaryApplyBlock();
        }
        v2 = 0;
        *v4 = v7;
      }
      else
      {
        result = APSLogErrorAt();
        v2 = -72280;
      }
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = v2;
  return result;
}

@end
