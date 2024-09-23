@implementation NTKAllUtilityLargeComplicationTypes

void __NTKAllUtilityLargeComplicationTypes_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  NTKAllRegularComplicationTypes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v4, "addIndex:", 32);
  objc_msgSend(v4, "removeIndex:", 19);
  objc_msgSend(v4, "removeIndex:", 22);
  NTKLauncherIconComplicationTypes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeIndexes:", v1);

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v4);
  v3 = (void *)NTKAllUtilityLargeComplicationTypes_allUtilityLarge;
  NTKAllUtilityLargeComplicationTypes_allUtilityLarge = v2;

}

@end
