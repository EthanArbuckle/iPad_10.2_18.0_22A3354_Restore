@implementation SecKeyAlgorithmAdaptorCopyCCUnitToBigEndian

void __SecKeyAlgorithmAdaptorCopyCCUnitToBigEndian_block_invoke(uint64_t a1, const __CFData *a2)
{
  uint64_t v3;
  const __CFData *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  unint64_t v7;
  unint64_t Length;
  CFIndex v9;
  __CFData *Mutable;
  const void *v11;

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
    Length = CFDataGetLength(v4);
    if (Length > v7)
      v7 = Length;
    if (SecCFAllocatorZeroize_sOnce != -1)
      dispatch_once(&SecCFAllocatorZeroize_sOnce, &__block_literal_global_7146);
    v9 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    Mutable = CFDataCreateMutable((CFAllocatorRef)SecCFAllocatorZeroize_sAllocator, 0);
    CFDataSetLength(Mutable, v9);
    CFDataGetMutableBytePtr(Mutable);
    CFDataGetBytePtr(v4);
    ccn_read_uint();
    v11 = *(const void **)(v3 + 24);
    if (v11)
      CFRelease(v11);
    *(_QWORD *)(v3 + 24) = Mutable;
  }
}

@end
