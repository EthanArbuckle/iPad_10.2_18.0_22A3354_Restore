@implementation UIVibrancyEffect(CCUIAdditions)

+ (id)controlCenterPrimaryVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_visualStylingForStyle:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)controlCenterKeyLineOnLightVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_controlCenterKeyLineOnLightVisualStyling");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)controlCenterSecondaryVibrancyEffect
{
  void *v0;
  void *v1;

  +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe");
  _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F08], "_vibrantEffectForLightMaterial:darkMaterial:vibrancyStyle:", v0, 0, 102);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)controlCenterPrimaryOnLightVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_controlCenterPrimaryOnLightVisualStyling");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)controlCenterSecondaryOnLightVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_controlCenterSecondaryOnLightVisualStyling");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)controlCenterScrollViewDarkeningVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_controlCenterScrollViewDarkeningVisualStyling");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)controlCenterKeyLineOnDarkVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_visualStylingForStyle:", 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
