@implementation ChicletCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterDashboardExtension.ChicletCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterDashboardExtension.ChicletCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterDashboardExtension.ChicletCell"), CFSTR("accessibilityMetadataContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterDashboardExtension.ChicletCell"), CFSTR("accessibilityPresentMetadata"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("GameCenterDashboardExtension.ChicletMetadata"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[ChicletCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChicletCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityMetadataContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __46__ChicletCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490F5BC](CFSTR("GameCenterDashboardExtension.ChicletMetadata"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)accessibilityPresentMetadata
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ChicletCellAccessibility;
  -[ChicletCellAccessibility accessibilityPresentMetadata](&v2, sel_accessibilityPresentMetadata);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ChicletCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ChicletCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
