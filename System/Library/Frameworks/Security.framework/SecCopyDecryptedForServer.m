@implementation SecCopyDecryptedForServer

void __SecCopyDecryptedForServer_block_invoke(uint64_t a1)
{
  __int128 v2;
  __CFString **v3;
  const __CFData *v4;
  const UInt8 *BytePtr;
  const UInt8 *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  size_t v10;
  const void *v11;
  const __CFAllocator *v13;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  __CFData *v16;
  uint64_t v17;
  uint64_t v18;
  __CFData *v19;
  UInt8 *v20;
  size_t v21[3];
  __int128 v22;
  __int128 v23;
  unint64_t v24;
  CFIndex v25;
  unint64_t v26;

  v25 = 0xAAAAAAAAAAAAAAAALL;
  v24 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22 = v2;
  v23 = v2;
  ccaes_gcm_decrypt_mode();
  InitServerECIES();
  memset(v21, 170, sizeof(v21));
  v4 = *(const __CFData **)(a1 + 40);
  v3 = *(__CFString ***)(a1 + 48);
  BytePtr = CFDataGetBytePtr(v4);
  v6 = &BytePtr[CFDataGetLength(v4)];
  v26 = 0xAAAAAAAAAAAAAAAALL;
  ccder_decode_sequence_tl();
  v7 = (const void *)ccder_decode_tl();
  v8 = (const void *)ccder_decode_tl();
  v9 = ccder_decode_tl();
  v10 = v9 + v21[0];
  if (!v9)
    v10 = 0;
  if ((const UInt8 *)v10 != v6)
  {
    SecError(-50, v3, CFSTR("Blob failed to decode"));
    return;
  }
  if (v7)
  {
    v11 = (const void *)v9;
    if (v8 && v9 != 0)
    {
      v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      CFDataSetLength(Mutable, v21[1] + v21[2] + v21[0]);
      if (!Mutable)
      {
        SecError(-108, *(__CFString ***)(a1 + 48), CFSTR("failed to create data"));
        return;
      }
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      memcpy(MutableBytePtr, v7, v21[2]);
      memcpy(&MutableBytePtr[v21[2]], v8, v21[1]);
      memcpy(&MutableBytePtr[v21[2] + v21[1]], v11, v21[0]);
      v25 = ccecies_decrypt_gcm_plaintext_size();
      v16 = CFDataCreateMutable(v13, 0);
      CFDataSetLength(v16, v25);
      v20 = CFDataGetMutableBytePtr(v16);
      v17 = ccecies_decrypt_gcm();
      if ((_DWORD)v17)
      {
        SecError(-909, *(__CFString ***)(a1 + 48), CFSTR("ccecies_decrypt_gcm failed %d"), v17, v20);
        if (!v16)
          goto LABEL_18;
      }
      else
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v19 = *(__CFData **)(v18 + 24);
        if (v19 != v16)
        {
          if (!v16 || (CFRetain(v16), (v19 = *(__CFData **)(v18 + 24)) != 0))
            CFRelease(v19);
          *(_QWORD *)(v18 + 24) = v16;
        }
        if (!v16)
          goto LABEL_18;
      }
      CFRelease(v16);
LABEL_18:
      CFRelease(Mutable);
    }
  }
}

@end
