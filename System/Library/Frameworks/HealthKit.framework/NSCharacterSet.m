@implementation NSCharacterSet

void __75__NSCharacterSet__HKXMLExtractorCharacterSets__hk_forwardSlashCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hk_forwardSlashCharacterSet_sharedForwardSlashSet;
  hk_forwardSlashCharacterSet_sharedForwardSlashSet = v0;

}

void __70__NSCharacterSet__HKXMLExtractorCharacterSets__hk_percentCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("%"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hk_percentCharacterSet_sharedPercentSet;
  hk_percentCharacterSet_sharedPercentSet = v0;

}

void __68__NSCharacterSet__HKXMLExtractorCharacterSets__hk_equalCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("="));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hk_equalCharacterSet_sharedEqualSet;
  hk_equalCharacterSet_sharedEqualSet = v0;

}

@end
