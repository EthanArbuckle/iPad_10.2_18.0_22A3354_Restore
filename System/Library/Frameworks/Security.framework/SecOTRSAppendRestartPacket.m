@implementation SecOTRSAppendRestartPacket

void __SecOTRSAppendRestartPacket_block_invoke(_QWORD *a1)
{
  const __CFAllocator *v2;
  __CFData *Mutable;
  uint64_t v4;
  const void *v5;
  const void *v6;
  CFIndex Length;
  __CFString *v8;
  const UInt8 *BytePtr;
  CFIndex v10;
  CFIndex v11;
  unsigned int v12;
  NSObject *v13;
  uint64_t v14;
  __CFData *v15;
  const UInt8 *v16;
  CFIndex v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  uint64_t v22;
  uint8_t buf[16];

  if (*(_QWORD *)(a1[5] + 80))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    v4 = a1[5];
    *(_DWORD *)(v4 + 16) = 1;
    v5 = *(const void **)(v4 + 56);
    if (v5)
    {
      *(_QWORD *)(v4 + 56) = 0;
      CFRelease(v5);
      v4 = a1[5];
    }
    v6 = *(const void **)(v4 + 64);
    if (v6)
    {
      *(_QWORD *)(v4 + 64) = 0;
      CFRelease(v6);
      v4 = a1[5];
    }
    SecOTRAppendDHMessage(v4, Mutable);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 0x40000000;
    v20 = __SecOTRSAppendRestartPacket_block_invoke_6;
    v21 = &__block_descriptor_tmp_7_10302;
    v22 = a1[5];
    if (Mutable)
    {
      Length = CFDataGetLength(Mutable);
      v8 = CFStringCreateMutable(v2, 2 * Length);
      BytePtr = CFDataGetBytePtr(Mutable);
      v10 = CFDataGetLength(Mutable);
      if (v10 >= 1)
      {
        v11 = v10;
        do
        {
          v12 = *BytePtr++;
          CFStringAppendFormat(v8, 0, CFSTR("%02X"), v12, v18, v19, v20, v21, v22);
          --v11;
        }
        while (v11);
      }
    }
    else
    {
      v8 = CFSTR("(null)");
    }
    __SecOTRSAppendRestartPacket_block_invoke_6((uint64_t)&v18, (uint64_t)v8);
    CFRelease(v8);
    v14 = a1[5];
    v15 = (__CFData *)a1[6];
    if (*(_BYTE *)(v14 + 648))
    {
      SecOTRPrepareOutgoingBytes(Mutable, v15);
      if (!Mutable)
        return;
      goto LABEL_17;
    }
    v16 = CFDataGetBytePtr(Mutable);
    v17 = CFDataGetLength(Mutable);
    CFDataAppendBytes(v15, v16, v17);
    if (Mutable)
LABEL_17:
      CFRelease(Mutable);
  }
  else
  {
    v13 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "_myKey is NULL, avoiding crash", buf, 2u);
    }
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -26275;
  }
}

void __SecOTRSAppendRestartPacket_block_invoke_6(uint64_t a1, uint64_t a2)
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
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "%@ Restart packet: %@", (uint8_t *)&v6, 0x16u);
  }
}

@end
