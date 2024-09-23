@implementation SecKeyAlgorithmAdaptorCopyBigEndianToCCUnit

void __SecKeyAlgorithmAdaptorCopyBigEndianToCCUnit_block_invoke(uint64_t a1, const __CFData *a2)
{
  uint64_t v3;
  const __CFData *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  CFIndex v7;
  __CFData *v8;
  const void *v9;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SecKeyRunAlgorithmAndCopyResult(*(uint64_t **)(a1 + 40), a2, *(const __CFData **)(a1 + 48), *(__CFString ***)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(const __CFData **)(v3 + 24);
  if (v4)
  {
    v5 = **(_QWORD **)(a1 + 40);
    _SecKeyCheck(v5, (uint64_t)"SecKeyGetBlockSize");
    v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v5 + 16) + 80);
    if (v6)
      v7 = v6(v5);
    else
      v7 = 0;
    v8 = SecKeyRSACopyCCUnitToBigEndian(v4, v7);
    v9 = *(const void **)(v3 + 24);
    if (v9)
      CFRelease(v9);
    *(_QWORD *)(v3 + 24) = v8;
  }
}

@end
