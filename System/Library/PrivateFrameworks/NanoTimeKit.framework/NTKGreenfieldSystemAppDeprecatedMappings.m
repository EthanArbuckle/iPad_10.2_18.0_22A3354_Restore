@implementation NTKGreenfieldSystemAppDeprecatedMappings

+ (BOOL)isSystemAppDeprecatedBundleId:(id)a3 itemId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  if (isSystemAppDeprecatedBundleId_itemId__onceToken != -1)
    dispatch_once(&isSystemAppDeprecatedBundleId_itemId__onceToken, &__block_literal_global_41);
  objc_msgSend((id)isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "longValue");
    v10 = v9 == objc_msgSend(v6, "longValue");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __81__NTKGreenfieldSystemAppDeprecatedMappings_isSystemAppDeprecatedBundleId_itemId___block_invoke()
{
  void *v0;

  v0 = (void *)isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping;
  isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping = (uint64_t)&unk_1E6CA87D0;

}

@end
