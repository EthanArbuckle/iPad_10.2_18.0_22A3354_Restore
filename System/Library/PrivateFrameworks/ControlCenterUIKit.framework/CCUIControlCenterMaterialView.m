@implementation CCUIControlCenterMaterialView

+ (id)_lightFillView
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", 4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newAutomaticallyUpdatingViewWithStyle:", 4);

  return v3;
}

+ (id)_moduleBackgroundMaterialView
{
  void *v2;

  objc_msgSend(a1, "_darkMaterialView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupNameBase:", CFSTR("ControlCenterModuleBackground"));
  objc_msgSend(v2, "setTag:", 203948575);
  return v2;
}

+ (id)_darkMaterialView
{
  return (id)objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", objc_msgSend(a1, "_controlCenterModulesRecipe"));
}

+ (int64_t)_controlCenterModulesRecipe
{
  return 8;
}

+ (id)_lightFillMaterialView
{
  return (id)objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithVisualStyleFromRecipe:category:style:options:initialWeighting:compatibleWithTraitCollection:", 4, 2, 4, 0, 0, 1.0);
}

+ (id)_tertiaryView
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", 4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newAutomaticallyUpdatingViewWithStyle:", 1);

  return v3;
}

+ (id)_tertiaryMaterialView
{
  return (id)objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithVisualStyleFromRecipe:category:style:options:initialWeighting:compatibleWithTraitCollection:", 4, 2, 1, 0, 0, 1.0);
}

+ (id)_auxiliaryMaterialView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D47498];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("auxiliary"), v3, 0, 0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)_controlCenterBackgroundRecipe
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 21;
  else
    return 20;
}

@end
