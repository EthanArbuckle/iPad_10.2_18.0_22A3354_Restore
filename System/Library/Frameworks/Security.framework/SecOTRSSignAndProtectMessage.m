@implementation SecOTRSSignAndProtectMessage

void __SecOTRSSignAndProtectMessage_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const __CFData *Mutable;
  uint64_t v7;
  const __CFData *v8;
  uint64_t *v9;
  uint64_t *v10;
  unint64_t v11;
  CFIndex Length;
  CFIndex v13;
  UInt8 *v14;
  uint64_t v15;
  const UInt8 *BytePtr;
  const __CFData *v17;
  const UInt8 *v18;
  CFIndex v19;
  uint64_t v20;
  uint64_t *v21[3];
  UInt8 bytes[8];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 80))
  {
    v3 = *(_QWORD *)(v2 + 112);
    if (v3)
    {
      memset(v21, 170, sizeof(v21));
      v4 = *(_DWORD *)(v2 + 96);
      SecOTRSRollIfTime(v2);
      v5 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v5 + 664) && *(_QWORD *)(v5 + 104))
      {
        v4 = *(_DWORD *)(v5 + 96) - 1;
        v3 = *(_QWORD *)(v5 + 104);
      }
      SecOTRSFindKeysForMessage(v5, *(_QWORD *)(v5 + 80), v3, 1, &v21[2], &v21[1], v21);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 648) || (Mutable = *(const __CFData **)(a1 + 48)) == 0)
        Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      else
        CFRetain(*(CFTypeRef *)(a1 + 48));
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(const __CFData **)(a1 + 56);
      v9 = v21[2];
      v10 = v21[0];
      if (*(_BYTE *)(v7 + 649))
      {
        SecOTRSSignAndProtectCompact_locked(*(_QWORD *)(a1 + 40), *(const __CFData **)(a1 + 56), Mutable, (uint64_t)v21[2], (uint64_t)v21[1], v21[0], v4, v3);
      }
      else
      {
        CFDataGetLength(Mutable);
        *(_WORD *)bytes = 512;
        CFDataAppendBytes(Mutable, bytes, 2);
        bytes[0] = 3;
        CFDataAppendBytes(Mutable, bytes, 1);
        bytes[0] = 0;
        CFDataAppendBytes(Mutable, bytes, 1);
        *(_DWORD *)bytes = bswap32(*(_DWORD *)(v7 + 72));
        CFDataAppendBytes(Mutable, bytes, 4);
        *(_DWORD *)bytes = bswap32(v4);
        CFDataAppendBytes(Mutable, bytes, 4);
        SecFDHKAppendPublicSerialization(*(_QWORD *)(v7 + 88), Mutable);
        v11 = *v10 + 1;
        *v10 = v11;
        *(_QWORD *)bytes = bswap64(v11);
        CFDataAppendBytes(Mutable, bytes, 8);
        Length = CFDataGetLength(v8);
        *(_DWORD *)bytes = bswap32(Length);
        CFDataAppendBytes(Mutable, bytes, 4);
        v13 = CFDataGetLength(Mutable);
        CFDataIncreaseLength(Mutable, Length);
        v14 = &CFDataGetMutableBytePtr(Mutable)[v13];
        v15 = *v10;
        BytePtr = CFDataGetBytePtr(v8);
        AES_CTR_HighHalf_Transform(16, (uint64_t)v9, v15, Length, (uint64_t)BytePtr, (uint64_t)v14);
        CFDataGetLength(Mutable);
        CFDataGetLength(Mutable);
        CFDataIncreaseLength(Mutable, 20);
        CFDataGetMutableBytePtr(Mutable);
        ccsha1_di();
        CFDataGetBytePtr(Mutable);
        cchmac();
        v17 = *(const __CFData **)(v7 + 120);
        v18 = CFDataGetBytePtr(v17);
        v19 = CFDataGetLength(v17);
        CFDataAppendBytes(Mutable, v18, v19);
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        v20 = *(_QWORD *)(a1 + 40);
        if (*(_BYTE *)(v20 + 648))
        {
          SecOTRPrepareOutgoingBytes(Mutable, *(__CFData **)(a1 + 48));
          v20 = *(_QWORD *)(a1 + 40);
        }
        CFDataSetLength(*(CFMutableDataRef *)(v20 + 120), 0);
      }
      if (Mutable)
        CFRelease(Mutable);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

@end
