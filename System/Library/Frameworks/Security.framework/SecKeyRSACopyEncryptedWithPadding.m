@implementation SecKeyRSACopyEncryptedWithPadding

void __SecKeyRSACopyEncryptedWithPadding_block_invoke(uint64_t a1, uint64_t a2, const __CFData *a3)
{
  uint64_t v5;
  uint64_t v6;
  __CFData *v7;
  uint64_t v8;
  const __CFData *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  CFIndex v12;
  __CFData *v13;
  const void *v14;

  v5 = *(_QWORD *)(a1 + 40);
  ccrng();
  CFDataGetLength(*(CFDataRef *)(a1 + 56));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 56));
  if (v5)
  {
    v6 = ccrsa_oaep_encode();
    if (!(_DWORD)v6)
      goto LABEL_3;
LABEL_7:
    SecError(-50, *(__CFString ***)(a1 + 64), CFSTR("RSAencrypt wrong input size (err %d)"), v6);
    return;
  }
  v6 = ccrsa_eme_pkcs1v15_encode();
  if ((_DWORD)v6)
    goto LABEL_7;
LABEL_3:
  cc_clear();
  v7 = SecKeyRunAlgorithmAndCopyResult(*(uint64_t **)(a1 + 72), a3, 0, *(__CFString ***)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  if (v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(const __CFData **)(v8 + 24);
    v10 = **(_QWORD **)(a1 + 72);
    _SecKeyCheck(v10, (uint64_t)"SecKeyGetBlockSize");
    v11 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v10 + 16) + 80);
    if (v11)
      v12 = v11(v10);
    else
      v12 = 0;
    v13 = SecKeyRSACopyCCUnitToBigEndian(v9, v12);
    v14 = *(const void **)(v8 + 24);
    if (v14)
      CFRelease(v14);
    *(_QWORD *)(v8 + 24) = v13;
  }
}

@end
