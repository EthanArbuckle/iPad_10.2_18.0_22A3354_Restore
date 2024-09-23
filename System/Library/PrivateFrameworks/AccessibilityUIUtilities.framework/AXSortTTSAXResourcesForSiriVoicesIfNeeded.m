@implementation AXSortTTSAXResourcesForSiriVoicesIfNeeded

uint64_t __AXSortTTSAXResourcesForSiriVoicesIfNeeded_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  AXLocalizedVoiceVariantNameForResource(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocalizedVoiceVariantNameForResource(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompare:", v6);
  return v7;
}

@end
