@implementation HMAccessoryProfile(HFAdditions)

- (id)hf_iconDescriptor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconFactory iconDescriptorForAccessory:](HFServiceIconFactory, "iconDescriptorForAccessory:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_hasNonStandardTileUI
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)objc_opt_class(), "_profilesWithNonStandardTileUI");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "containsObject:", objc_opt_class());

  return v1;
}

+ (id)_profilesWithNonStandardTileUI
{
  if (_MergedGlobals_218 != -1)
    dispatch_once(&_MergedGlobals_218, &__block_literal_global_2_1);
  return (id)qword_1ED378D20;
}

- (uint64_t)hf_offersAutomation
{
  return 0;
}

@end
