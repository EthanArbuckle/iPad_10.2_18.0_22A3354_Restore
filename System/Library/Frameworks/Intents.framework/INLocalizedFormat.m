@implementation INLocalizedFormat

void __INLocalizedFormat_block_invoke(uint64_t a1)
{
  __CFBundle *v2;
  __CFBundle *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = (__CFBundle *)INCreateUniqueBundle(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = *(void **)(a1 + 48);
    v5 = *(void **)(a1 + 56);
    v6 = *(void **)(a1 + 64);
    v13 = 0;
    INLocalizedFormatForBundle(v2, v4, v5, v6, &v13);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v8;

    CFRelease(v3);
  }
}

@end
