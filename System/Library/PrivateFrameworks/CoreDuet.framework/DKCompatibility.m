@implementation DKCompatibility

void __40___DKCompatibility_currentCompatibility__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "compatibilityWithMinVersion:maxVersion:", 0, 4096);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)currentCompatibility_compatibility;
  currentCompatibility_compatibility = v1;

}

@end
