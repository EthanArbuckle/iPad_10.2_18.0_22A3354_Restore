@implementation MSVCryptoDigestForContentsOfInputStream

intptr_t __MSVCryptoDigestForContentsOfInputStream_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_2(uint64_t a1, id a2)
{
  CC_MD5_CTX *v2;
  id v3;
  const void *v4;
  CC_LONG v5;

  v2 = *(CC_MD5_CTX **)(a1 + 32);
  v3 = objc_retainAutorelease(a2);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  return CC_MD5_Update(v2, v4, v5);
}

intptr_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 md[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CC_MD5_Final(md, *(CC_MD5_CTX **)(a1 + 48));
  MSVCryptoUtilitiesHexStringFromDigest(md, *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_4(uint64_t a1, id a2)
{
  CC_SHA1_CTX *v2;
  id v3;
  const void *v4;
  CC_LONG v5;

  v2 = *(CC_SHA1_CTX **)(a1 + 32);
  v3 = objc_retainAutorelease(a2);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  return CC_SHA1_Update(v2, v4, v5);
}

intptr_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 md[20];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CC_SHA1_Final(md, *(CC_SHA1_CTX **)(a1 + 48));
  MSVCryptoUtilitiesHexStringFromDigest(md, *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_6(uint64_t a1, id a2)
{
  CC_SHA256_CTX *v2;
  id v3;
  const void *v4;
  CC_LONG v5;

  v2 = *(CC_SHA256_CTX **)(a1 + 32);
  v3 = objc_retainAutorelease(a2);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  return CC_SHA256_Update(v2, v4, v5);
}

intptr_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 md[32];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CC_SHA256_Final(md, *(CC_SHA256_CTX **)(a1 + 48));
  MSVCryptoUtilitiesHexStringFromDigest(md, *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
