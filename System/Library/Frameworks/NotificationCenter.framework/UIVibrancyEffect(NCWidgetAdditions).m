@implementation UIVibrancyEffect(NCWidgetAdditions)

+ (id)_widgetEffectForPrivateVibrancyStyle:()NCWidgetAdditions
{
  void *v4;
  void *v5;
  void *v6;

  _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F88], "_vibrantEffectForLightMaterial:darkMaterial:vibrancyStyle:", v4, v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)widgetEffectForVibrancyStyle:()NCWidgetAdditions
{
  return objc_msgSend(a1, "_widgetEffectForPrivateVibrancyStyle:", _MTInternalVibrancyEffectStyleForPublicStyle());
}

@end
