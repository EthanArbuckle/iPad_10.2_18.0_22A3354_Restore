@implementation DPBitValueMap

void __28___DPBitValueMap_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v1 = (void *)_allBitValueMaps;
  _allBitValueMaps = v0;

}

void __59___DPBitValueMap_bitValueMapForKey_fromConfigurationsFile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Value"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);
}

@end
