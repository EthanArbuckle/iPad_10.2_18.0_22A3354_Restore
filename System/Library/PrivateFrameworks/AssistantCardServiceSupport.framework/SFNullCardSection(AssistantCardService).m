@implementation SFNullCardSection(AssistantCardService)

+ (id)acs_wildCardSection
{
  void *v0;

  objc_msgSend(MEMORY[0x24BE84F10], "acs_uniquelyIdentifiedCardSection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "acs_setParameters:", MEMORY[0x24BDBD1A8]);
  return v0;
}

@end
