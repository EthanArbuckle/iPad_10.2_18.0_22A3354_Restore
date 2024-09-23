@implementation AFAssetsAvailabilityMatchesRequiredAssets

void __AFAssetsAvailabilityMatchesRequiredAssets_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end
