@implementation MSAlbumPropertiesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MSAlbumPropertiesView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MSAlbumPropertiesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_artistLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSAlbumPropertiesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_albumLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSAlbumPropertiesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_itemCountsLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSAlbumPropertiesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_releaseDateLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
