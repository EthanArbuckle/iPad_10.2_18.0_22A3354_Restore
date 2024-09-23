@implementation SecCopyEncryptedToServerKey

void __SecCopyEncryptedToServerKey_block_invoke(uint64_t a1)
{
  __int128 v2;
  CFIndex Length;
  const __CFAllocator *v4;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  uint64_t v7;
  size_t v8;
  __CFString **v9;
  CFIndex v10;
  __CFData *v11;
  _OWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  __CFData *v17;
  uint64_t v18;
  __CFData *cf;
  CFIndex v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;

  v23 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21 = v2;
  v22 = v2;
  ccaes_gcm_encrypt_mode();
  InitServerECIES();
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  v20 = ccecies_encrypt_gcm_ciphertext_size();
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFDataSetLength(Mutable, v20);
  if (!Mutable)
  {
    SecError(-108, *(__CFString ***)(a1 + 48), CFSTR("failed to create data"));
    return;
  }
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  v7 = ccecies_encrypt_gcm();
  v8 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  v9 = *(__CFString ***)(a1 + 48);
  if (Length + v8 + 16 == v20)
  {
    ccder_sizeof();
    ccder_sizeof();
    ccder_sizeof();
    v10 = ccder_sizeof();
    v11 = CFDataCreateMutable(v4, 0);
    CFDataSetLength(v11, v10);
    if (v11)
    {
      v18 = v7;
      cf = Mutable;
      CFDataGetMutableBytePtr(v11);
      CFDataGetLength(v11);
      v12 = (_OWORD *)ccder_encode_body_nocopy();
      ccder_encode_tl();
      v13 = (void *)ccder_encode_body_nocopy();
      ccder_encode_tl();
      v14 = (void *)ccder_encode_body_nocopy();
      ccder_encode_tl();
      if (ccder_encode_constructed_tl())
      {
        CFRetain(v11);
        CFRelease(v11);
        memcpy(v14, MutableBytePtr, v8);
        memcpy(v13, &MutableBytePtr[v8], Length);
        *v12 = *(_OWORD *)&MutableBytePtr[v8 + Length];
        if ((_DWORD)v18)
        {
          SecError(-909, *(__CFString ***)(a1 + 48), CFSTR("ccecies_encrypt_gcm failed %d"), v18);
        }
        else
        {
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          if (*(__CFData **)(v15 + 24) != v11)
          {
            CFRetain(v11);
            v16 = *(const void **)(v15 + 24);
            if (v16)
              CFRelease(v16);
            *(_QWORD *)(v15 + 24) = v11;
          }
        }
        CFRelease(cf);
        v17 = v11;
        goto LABEL_11;
      }
      SecError(-50, v9, CFSTR("Encoding failed"));
      CFRelease(v11);
    }
    else
    {
      SecError(-108, v9, CFSTR("failed to create data"), &v20, MutableBytePtr);
    }
  }
  else
  {
    SecError(-26276, v9, CFSTR("Allocation mismatch"), &v20, MutableBytePtr);
  }
  v17 = Mutable;
LABEL_11:
  CFRelease(v17);
}

@end
