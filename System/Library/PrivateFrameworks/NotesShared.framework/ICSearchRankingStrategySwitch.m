@implementation ICSearchRankingStrategySwitch

+ (id)ICSearchRankingStrategyDisplayNames
{
  if (ICSearchRankingStrategyDisplayNames_onceToken != -1)
    dispatch_once(&ICSearchRankingStrategyDisplayNames_onceToken, &__block_literal_global_29);
  return (id)ICSearchRankingStrategyDisplayNames_displayNames;
}

void __68__ICSearchRankingStrategySwitch_ICSearchRankingStrategyDisplayNames__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "setObject:atIndexedSubscript:", CFSTR("0. Prefix/Substring ⮑ Modified Date"), 0);
  objc_msgSend(v2, "setObject:atIndexedSubscript:", CFSTR("1. (PeaceGM) Prefix/Substring ⮑ Title/Body"), 1);
  objc_msgSend(v2, "setObject:atIndexedSubscript:", CFSTR("2. Prefix/Substring ⮑ Bucketed Modified Date ⮑ Title/Body"), 2);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)ICSearchRankingStrategyDisplayNames_displayNames;
  ICSearchRankingStrategyDisplayNames_displayNames = v0;

}

+ (unint64_t)defaultStrategy
{
  return 0;
}

+ (unint64_t)currentStrategy
{
  unint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(a1, "defaultStrategy");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("searchRankingCurrentStrategyKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v2 = objc_msgSend(v4, "unsignedIntegerValue");

  return v2;
}

@end
