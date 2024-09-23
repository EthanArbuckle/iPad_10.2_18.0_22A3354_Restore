@implementation SecItemBackupCreateManifest

void __SecItemBackupCreateManifest_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  CFTypeID v5;
  const __CFData *Value;
  const __CFData *v7;
  CFTypeID v8;
  __CFData *v9;
  const UInt8 *BytePtr;
  CFIndex Length;
  const __CFAllocator *v12;
  CFIndex v13;
  __CFString *Mutable;
  const UInt8 *v15;
  CFIndex v16;
  CFIndex v17;
  unsigned int v18;
  NSObject *v19;
  uint8_t buf[4];
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (cf)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFDictionaryGetTypeID())
    {
      Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("hash"));
      v7 = Value;
      if (Value && (v8 = CFGetTypeID(Value), v8 == CFDataGetTypeID()) && CFDataGetLength(v7) == 20)
      {
        v9 = *(__CFData **)(a1 + 32);
        BytePtr = CFDataGetBytePtr(v7);
        Length = CFDataGetLength(v7);
        CFDataAppendBytes(v9, BytePtr, Length);
      }
      else
      {
        v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v13 = CFDataGetLength(v7);
        Mutable = CFStringCreateMutable(v12, 2 * v13);
        v15 = CFDataGetBytePtr(v7);
        v16 = CFDataGetLength(v7);
        if (v16 >= 1)
        {
          v17 = v16;
          do
          {
            v18 = *v15++;
            CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v18);
            --v17;
          }
          while (v17);
        }
        v19 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = Mutable;
          _os_log_impl(&dword_18A900000, v19, OS_LOG_TYPE_DEFAULT, "bad hash %@ in backup", buf, 0xCu);
        }
        if (Mutable)
          CFRelease(Mutable);
      }
    }
  }
}

@end
