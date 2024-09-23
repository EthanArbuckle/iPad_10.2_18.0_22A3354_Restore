@implementation FBSIngestSubclassProperties

void __FBSIngestSubclassProperties_block_invoke(uint64_t a1)
{
  objc_class *i;
  void *v2;

  for (i = *(objc_class **)(a1 + 32); i != (objc_class *)objc_opt_class(); i = class_getSuperclass(i))
  {
    objc_getAssociatedObject(i, (const void *)_FBSIngestedKey);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      break;
    _ingestPropertiesFromSettingsSubclass(i);
    objc_setAssociatedObject(i, (const void *)_FBSIngestedKey, &unk_1E390C3F0, 0);
  }
}

@end
