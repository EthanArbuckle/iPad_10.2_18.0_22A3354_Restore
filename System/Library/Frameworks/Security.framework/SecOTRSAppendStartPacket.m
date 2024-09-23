@implementation SecOTRSAppendStartPacket

void __SecOTRSAppendStartPacket_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  __CFData *Mutable;
  CFIndex Length;
  __CFString *v6;
  const UInt8 *BytePtr;
  CFIndex v8;
  CFIndex v9;
  unsigned int v10;
  uint64_t v11;
  __CFData *v12;
  const UInt8 *v13;
  CFIndex v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  uint64_t v19;

  v2 = a1[5];
  *(_DWORD *)(v2 + 16) = 1;
  SecOTRInitMyDHKeys(v2);
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = CCRandomCopyBytes();
  if (!*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    SecOTRAppendDHMessage(a1[5], Mutable);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 0x40000000;
  v17 = __SecOTRSAppendStartPacket_block_invoke_2;
  v18 = &__block_descriptor_tmp_10290;
  v19 = a1[5];
  if (Mutable)
  {
    Length = CFDataGetLength(Mutable);
    v6 = CFStringCreateMutable(v3, 2 * Length);
    BytePtr = CFDataGetBytePtr(Mutable);
    v8 = CFDataGetLength(Mutable);
    if (v8 >= 1)
    {
      v9 = v8;
      do
      {
        v10 = *BytePtr++;
        CFStringAppendFormat(v6, 0, CFSTR("%02X"), v10, v15, v16, v17, v18, v19);
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    v6 = CFSTR("(null)");
  }
  __SecOTRSAppendStartPacket_block_invoke_2((uint64_t)&v15, (uint64_t)v6);
  CFRelease(v6);
  v11 = a1[5];
  v12 = (__CFData *)a1[6];
  if (*(_BYTE *)(v11 + 648))
  {
    SecOTRPrepareOutgoingBytes(Mutable, v12);
    if (!Mutable)
      return;
    goto LABEL_11;
  }
  v13 = CFDataGetBytePtr(Mutable);
  v14 = CFDataGetLength(Mutable);
  CFDataAppendBytes(v12, v13, v14);
  if (Mutable)
LABEL_11:
    CFRelease(Mutable);
}

void __SecOTRSAppendStartPacket_block_invoke_2(uint64_t a1, uint64_t a2)
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
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "%@ Start packet: %@", (uint8_t *)&v6, 0x16u);
  }
}

@end
