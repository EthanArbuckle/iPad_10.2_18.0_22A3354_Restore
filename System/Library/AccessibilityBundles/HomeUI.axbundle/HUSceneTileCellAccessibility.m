@implementation HUSceneTileCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUSceneTileCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUSceneTileCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUSceneTileCell"), CFSTR("HUTileCell"));

}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUSceneTileCellAccessibility;
  v2 = -[HUSceneTileCellAccessibility accessibilityTraits](&v11, sel_accessibilityTraits);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "customStateForKey:", CFSTR("com.apple.Home.isActive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  v8 = *MEMORY[0x24BDF7400];
  if (!v7)
    v8 = 0;
  v9 = v8 | v2;

  return v9;
}

@end
