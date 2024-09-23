@implementation SecKeyRSACopyDecryptedWithPadding

void __SecKeyRSACopyDecryptedWithPadding_block_invoke(uint64_t a1, const __CFData *a2)
{
  __CFData *v3;
  const __CFData *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  CFIndex v7;
  __CFData *Mutable;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CFIndex length;

  v3 = SecKeyRunAlgorithmAndCopyResult(*(uint64_t **)(a1 + 40), a2, 0, *(__CFString ***)(a1 + 48));
  if (v3)
  {
    v4 = v3;
    v5 = **(_QWORD **)(a1 + 40);
    _SecKeyCheck(v5, (uint64_t)"SecKeyGetBlockSize");
    v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v5 + 16) + 80);
    if (v6)
      v7 = v6(v5);
    else
      v7 = 0;
    length = v7;
    Mutable = CFDataCreateMutable(0, 0);
    CFDataSetLength(Mutable, v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Mutable;
    if (*(_QWORD *)(a1 + 56))
    {
      CFDataGetMutableBytePtr(*(CFMutableDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      CFDataGetBytePtr(v4);
      v9 = ccrsa_oaep_decode();
    }
    else if (*(_UNKNOWN **)(**(_QWORD **)(a1 + 40) + 16) == &kSecRSAPrivateKeyDescriptor)
    {
      CFDataGetMutableBytePtr(*(CFMutableDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      CFDataGetBytePtr(v4);
      v9 = ccrsa_eme_pkcs1v15_decode_safe();
    }
    else
    {
      CFDataGetMutableBytePtr(*(CFMutableDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      CFDataGetBytePtr(v4);
      v9 = ccrsa_eme_pkcs1v15_decode();
    }
    v10 = v9;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 24);
    if ((_DWORD)v10)
    {
      if (v12)
      {
        *(_QWORD *)(v11 + 24) = 0;
        CFRelease(v12);
      }
      SecError(-50, *(__CFString ***)(a1 + 48), CFSTR("RSAdecrypt wrong input (err %d)"), v10, length);
    }
    else
    {
      CFDataSetLength((CFMutableDataRef)v12, length);
    }
    CFRelease(v4);
  }
}

@end
