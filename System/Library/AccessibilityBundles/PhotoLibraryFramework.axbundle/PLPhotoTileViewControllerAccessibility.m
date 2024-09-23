@implementation PLPhotoTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLPhotoTileViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setPhoto:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLPhotoTileViewControllerAccessibility;
  v4 = a3;
  -[PLPhotoTileViewControllerAccessibility _setPhoto:](&v7, sel__setPhoto_, v4);
  -[PLPhotoTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("mainFileURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AXAssetURL"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPhotoTileViewControllerAccessibility;
  -[PLPhotoTileViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PLPhotoTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PLExpandableImageView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    AXPerformSafeBlock();

  }
}

void __84__PLPhotoTileViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("_modelPhoto"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPhoto:", v2);

}

- (void)_configureViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTileViewControllerAccessibility;
  -[PLPhotoTileViewControllerAccessibility _configureViews](&v3, sel__configureViews);
  -[PLPhotoTileViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
