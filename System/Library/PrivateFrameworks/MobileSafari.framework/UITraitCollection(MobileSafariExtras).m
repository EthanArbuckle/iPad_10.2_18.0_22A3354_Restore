@implementation UITraitCollection(MobileSafariExtras)

- (id)sf_traitCollectionWithAlternateUserInterfaceColorAsPrimary
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(a1, "sf_alternateUserInterfaceStyle");
  if (v2)
  {
    objc_msgSend(a1, "traitCollectionByReplacingNSIntegerValue:forTrait:", v2, objc_opt_class());
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

- (uint64_t)sf_alternateUserInterfaceStyle
{
  return objc_msgSend(a1, "valueForNSIntegerTrait:", objc_opt_class());
}

- (uint64_t)sf_alternateTintColor
{
  return objc_msgSend(a1, "objectForTrait:", objc_opt_class());
}

- (BOOL)sf_usesVibrantAppearance
{
  return objc_msgSend(a1, "valueForNSIntegerTrait:", objc_opt_class()) != 0;
}

- (uint64_t)sf_backgroundBlurEffect
{
  return objc_msgSend(a1, "objectForTrait:", objc_opt_class());
}

+ (id)safari_traitsAffectingTextAppearance
{
  if (safari_traitsAffectingTextAppearance_onceToken != -1)
    dispatch_once(&safari_traitsAffectingTextAppearance_onceToken, &__block_literal_global_33);
  return (id)safari_traitsAffectingTextAppearance_traits;
}

+ (void)safari_removeAllCustomTraits:()MobileSafariExtras
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeTrait:", objc_opt_class());
  objc_msgSend(v3, "removeTrait:", objc_opt_class());
  objc_msgSend(v3, "removeTrait:", objc_opt_class());
  objc_msgSend(v3, "removeTrait:", objc_opt_class());

}

+ (id)safari_traitsAffectingVisualEffects
{
  if (safari_traitsAffectingVisualEffects_onceToken != -1)
    dispatch_once(&safari_traitsAffectingVisualEffects_onceToken, &__block_literal_global_40_0);
  return (id)safari_traitsAffectingVisualEffects_traits;
}

- (uint64_t)safari_barTintStyle
{
  return objc_msgSend(a1, "valueForNSIntegerTrait:", objc_opt_class());
}

- (BOOL)sf_usesSidebarPresentation
{
  return objc_msgSend(a1, "valueForNSIntegerTrait:", objc_opt_class()) != 0;
}

@end
