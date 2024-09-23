@implementation MRUControlCenterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUControlCenterCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUControlCenterCollectionViewCell"), CFSTR("cellContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingCellContentView"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingHeaderView"), CFSTR("transportButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingHeaderView"), CFSTR("routingButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[MRUControlCenterCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cellContentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)MRUControlCenterCollectionViewCellAccessibility;
  -[MRUControlCenterCollectionViewCellAccessibility _accessibilitySupplementaryFooterViews](&v12, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[MRUControlCenterCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cellContentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("transportButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUControlCenterCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cellContentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("headerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("routingButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObject:", v7);
  objc_msgSend(v3, "axSafelyAddObject:", v10);

  return v3;
}

@end
