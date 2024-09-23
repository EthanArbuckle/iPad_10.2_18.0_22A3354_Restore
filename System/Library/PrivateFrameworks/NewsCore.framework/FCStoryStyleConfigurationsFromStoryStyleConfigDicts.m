@implementation FCStoryStyleConfigurationsFromStoryStyleConfigDicts

FCTopStoriesStyleConfiguration *__FCStoryStyleConfigurationsFromStoryStyleConfigDicts_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  FCTopStoriesStyleConfiguration *v3;

  v2 = a2;
  v3 = -[FCTopStoriesStyleConfiguration initWithConfigDictionary:]([FCTopStoriesStyleConfiguration alloc], "initWithConfigDictionary:", v2);

  return v3;
}

uint64_t __FCStoryStyleConfigurationsFromStoryStyleConfigDicts_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  FCAppConfigurationStringValue(a2, (uint64_t)CFSTR("type"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCArticleStoryTypeForStoryTypeString(v2);

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
}

@end
