@implementation ACHLegacyKeyValueRepresentationFromProperties

void __ACHLegacyKeyValueRepresentationFromProperties_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);

}

@end
