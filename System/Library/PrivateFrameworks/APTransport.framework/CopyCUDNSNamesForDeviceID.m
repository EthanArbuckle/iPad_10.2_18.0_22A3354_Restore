@implementation CopyCUDNSNamesForDeviceID

void __browser_CopyCUDNSNamesForDeviceID_block_invoke(_QWORD *a1)
{
  const void *v2;
  CFMutableArrayRef *v3;
  uint64_t DerivedStorage;
  uint64_t v5;
  uint64_t v6;
  const __CFAllocator *v7;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v9;
  const __CFAllocator *v10;
  CFNumberRef v11;
  const __CFDictionary *Value;
  const __CFDictionary *v13;
  uint64_t v14;
  const __CFAllocator *v15;
  const char *v16;
  CFStringRef v17;
  CFStringRef v18;
  int v19;
  uint64_t valuePtr;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v2 = (const void *)a1[5];
  v3 = (CFMutableArrayRef *)a1[7];
  valuePtr = a1[6];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = *(_QWORD *)(DerivedStorage + 56);
  v21[0] = CFSTR("RAOPBonjourInfo");
  v21[1] = v5;
  v21[2] = CFSTR("AirPlayP2PBonjourInfo");
  if (!v3)
  {
    APSLogErrorAt();
    v19 = -6705;
    goto LABEL_14;
  }
  v6 = DerivedStorage;
  if (*(_BYTE *)(DerivedStorage + 229))
  {
    v19 = -6723;
    goto LABEL_14;
  }
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    APSLogErrorAt();
    v19 = -6728;
    goto LABEL_14;
  }
  v9 = Mutable;
  v10 = CFGetAllocator(v2);
  v11 = CFNumberCreate(v10, kCFNumberSInt64Type, &valuePtr);
  if (!v11)
  {
    APSLogErrorAt();
    v19 = -6728;
    goto LABEL_20;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v6 + 200), v11);
  if (!Value)
  {
    v19 = -6727;
LABEL_20:
    CFRelease(v9);
    if (!v11)
      goto LABEL_14;
    goto LABEL_13;
  }
  v13 = Value;
  v14 = 0;
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE10];
  do
  {
    if (CFDictionaryGetValue(v13, (const void *)v21[v14]))
    {
      v16 = (const char *)BonjourDevice_CopyDNSNames();
      if (v16)
      {
        v17 = CFStringCreateWithCStringNoCopy(v7, v16, 0x8000100u, v15);
        if (v17)
        {
          v18 = v17;
          CFArrayAppendValue(v9, v17);
          CFRelease(v18);
        }
      }
    }
    ++v14;
  }
  while (v14 != 3);
  v19 = 0;
  *v3 = v9;
LABEL_13:
  CFRelease(v11);
LABEL_14:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v19;
}

@end
