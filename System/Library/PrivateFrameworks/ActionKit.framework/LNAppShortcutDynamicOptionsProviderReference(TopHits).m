@implementation LNAppShortcutDynamicOptionsProviderReference(TopHits)

- (id)topHitSystemEntityCollectionIdentifier
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "appShortcutsProviderMangledTypeName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("25ShortcutsTopHitsExtension0abc3AppA8ProviderV"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE5FFB8], "appShortcutMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "appShortcutIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "optionsProviderIndex"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)appShortcutMapping
{
  if (appShortcutMapping_onceToken != -1)
    dispatch_once(&appShortcutMapping_onceToken, &__block_literal_global_12805);
  return (id)appShortcutMapping_mapping;
}

@end
