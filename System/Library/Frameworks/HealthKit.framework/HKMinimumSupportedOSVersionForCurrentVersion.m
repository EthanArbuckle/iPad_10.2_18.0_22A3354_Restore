@implementation HKMinimumSupportedOSVersionForCurrentVersion

void __HKMinimumSupportedOSVersionForCurrentVersion_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
