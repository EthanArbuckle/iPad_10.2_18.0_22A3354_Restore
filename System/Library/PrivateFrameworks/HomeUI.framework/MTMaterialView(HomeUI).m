@implementation MTMaterialView(HomeUI)

+ (id)tileCellToggleSizeButtonMaterialViewForTraitCollection:()HomeUI
{
  void *v2;
  void *v3;

  HUHomeUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("TileCellToggleSizeButton"), v2, 0, 0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setGroupNameBase:", CFSTR("TileCellToggleSizeButton"));
  return v3;
}

@end
