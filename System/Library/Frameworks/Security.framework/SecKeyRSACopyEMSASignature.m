@implementation SecKeyRSACopyEMSASignature

void __SecKeyRSACopyEMSASignature_block_invoke(uint64_t a1, uint64_t a2, const __CFData *a3)
{
  void *v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  __CFData *v12;
  uint64_t v13;
  __CFData *v14;
  const void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", *(_QWORD *)(a1 + 40));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    SecError(-108, *(__CFString ***)(a1 + 48), CFSTR("out of memory"));
    goto LABEL_12;
  }
  if (!*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(objc_retainAutorelease(v16), "mutableBytes");
    CFDataGetLength(*(CFDataRef *)(a1 + 64));
    CFDataGetBytePtr(*(CFDataRef *)(a1 + 64));
    if (ccrsa_emsa_pkcs1v15_encode())
    {
      SecError(-50, *(__CFString ***)(a1 + 48), CFSTR("RSAsign wrong input data length"));
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", **(_QWORD **)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SecError(-108, *(__CFString ***)(a1 + 48), CFSTR("out of memory"));
LABEL_18:

    goto LABEL_12;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))ccrng();
  v7 = ccrng();
  v8 = **(_QWORD **)(a1 + 56);
  v9 = objc_retainAutorelease(v5);
  v10 = v6(v7, v8, objc_msgSend(v9, "mutableBytes"));
  if ((_DWORD)v10)
  {
    SecError(-26276, *(__CFString ***)(a1 + 48), CFSTR("PSS salt gen fail (%zu bytes), err %d"), **(_QWORD **)(a1 + 56), v10);
    goto LABEL_18;
  }
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "bytes");
  CFDataGetLength(*(CFDataRef *)(a1 + 64));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 64));
  objc_msgSend(objc_retainAutorelease(v16), "mutableBytes");
  if (ccrsa_emsa_pss_encode())
  {
    SecError(-50, *(__CFString ***)(a1 + 48), CFSTR("RSASSA-PSS incompatible algorithm for key size"));
    goto LABEL_18;
  }

LABEL_8:
  objc_msgSend(objc_retainAutorelease(v16), "bytes");
  ccn_read_uint();
  v12 = SecKeyRunAlgorithmAndCopyResult(*(uint64_t **)(a1 + 80), a3, 0, *(__CFString ***)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
  if (v12)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = SecKeyRSACopyCCUnitToBigEndian(*(const __CFData **)(v13 + 24), *(_QWORD *)(a1 + 40));
    v15 = *(const void **)(v13 + 24);
    if (v15)
      CFRelease(v15);
    *(_QWORD *)(v13 + 24) = v14;
  }
LABEL_12:

}

@end
