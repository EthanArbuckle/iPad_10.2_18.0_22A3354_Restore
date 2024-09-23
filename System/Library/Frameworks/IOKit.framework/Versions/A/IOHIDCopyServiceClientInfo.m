@implementation IOHIDCopyServiceClientInfo

void ___IOHIDCopyServiceClientInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v4;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v6;
  CFMutableDictionaryRef v7;
  __CFDictionary *v8;
  const void *RegistryID;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v6 = Mutable;
    v7 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v7)
    {
      v8 = v7;
      RegistryID = (const void *)IOHIDServiceGetRegistryID(a2);
      if (RegistryID)
        CFDictionaryAddValue(v6, CFSTR("ServiceID"), RegistryID);
      v10 = (const void *)IOHIDServiceCopyProperty(a2, CFSTR("DeviceUsagePairs"));
      if (v10)
      {
        v11 = v10;
        CFDictionaryAddValue(v8, CFSTR("DeviceUsagePairs"), v10);
        CFRelease(v11);
      }
      v12 = (const void *)IOHIDServiceCopyProperty(a2, CFSTR("PrimaryUsagePage"));
      if (v12)
      {
        v13 = v12;
        CFDictionaryAddValue(v8, CFSTR("PrimaryUsagePage"), v12);
        CFRelease(v13);
      }
      v14 = (const void *)IOHIDServiceCopyProperty(a2, CFSTR("PrimaryUsage"));
      if (v14)
      {
        v15 = v14;
        CFDictionaryAddValue(v8, CFSTR("PrimaryUsage"), v14);
        CFRelease(v15);
      }
      CFDictionaryAddValue(v6, CFSTR("Properties"), v8);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v6);
      CFRelease(v8);
    }
    CFRelease(v6);
  }
}

@end
