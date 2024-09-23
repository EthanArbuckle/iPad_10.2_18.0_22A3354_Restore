@implementation UIView(CCUIAdditions_Internal)

- (void)_controlCenterApplyModuleBackgroundMaterial
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "viewWithTag:", 203948575);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setRecipe:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"));
  objc_msgSend(v5, "setGroupNameBase:", CFSTR("ControlCenterModuleBackground"));

}

- (void)_controlCenterApplyGalleryModuleBackgroundMaterial
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "viewWithTag:", 203948575);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v6 = v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipeName:fromBundle:", CFSTR("modulesGallery"), v5);

  objc_msgSend(v6, "setGroupNameBase:", CFSTR("ControlCenterGalleryModuleBackground"));
}

@end
