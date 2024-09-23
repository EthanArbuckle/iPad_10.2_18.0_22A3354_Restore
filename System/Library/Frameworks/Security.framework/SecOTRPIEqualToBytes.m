@implementation SecOTRPIEqualToBytes

void __SecOTRPIEqualToBytes_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFData *v2;
  const __CFAllocator *v3;
  CFIndex Length;
  __CFString *Mutable;
  const UInt8 *BytePtr;
  CFIndex v7;
  CFIndex v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  uint64_t v14;

  v2 = *(const __CFData **)(a1 + 32);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 0x40000000;
  v12 = __SecOTRPIEqualToBytes_block_invoke_2;
  v13 = &__block_descriptor_tmp_5_10031;
  v14 = a2;
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Length = CFDataGetLength(v2);
    Mutable = CFStringCreateMutable(v3, 2 * Length);
    BytePtr = CFDataGetBytePtr(v2);
    v7 = CFDataGetLength(v2);
    if (v7 >= 1)
    {
      v8 = v7;
      do
      {
        v9 = *BytePtr++;
        CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v9, v10, v11, v12, v13, v14);
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    Mutable = CFSTR("(null)");
  }
  __SecOTRPIEqualToBytes_block_invoke_2((uint64_t)&v10, (uint64_t)Mutable);
  CFRelease(Mutable);
}

void __SecOTRPIEqualToBytes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = secLogObjForScope("otr");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = a2;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "ID Comparison failed: d: %@ id: %@", (uint8_t *)&v6, 0x16u);
  }
}

@end
