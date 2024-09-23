@implementation CollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionView"), CFSTR("editing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionView"), CFSTR("_subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionView"), CFSTR("_newCollectionLabel"), "MapsThemeLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionView"), CFSTR("_imageView"), "CollectionImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionImageView"), CFSTR("_editButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionView"), CFSTR("_titleTextField"), "UITextField");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CollectionViewAccessibility;
  -[CollectionViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_editButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("EDIT_IMAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (BOOL)isAccessibilityElement
{
  return -[CollectionViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("editing")) ^ 1;
}

- (id)_axNonHiddenViewForKey:(id)a3
{
  void *v3;
  id v4;

  -[CollectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
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

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[CollectionViewAccessibility _axNonHiddenViewForKey:](self, "_axNonHiddenViewForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CollectionViewAccessibility _axNonHiddenViewForKey:](self, "_axNonHiddenViewForKey:", CFSTR("_subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CollectionViewAccessibility _axNonHiddenViewForKey:](self, "_axNonHiddenViewForKey:", CFSTR("_newCollectionLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349135DC]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[CollectionViewAccessibility _axNonHiddenViewForKey:](self, "_axNonHiddenViewForKey:", CFSTR("_imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_editButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CollectionViewAccessibility _axNonHiddenViewForKey:](self, "_axNonHiddenViewForKey:", CFSTR("_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CollectionViewAccessibility _axNonHiddenViewForKey:](self, "_axNonHiddenViewForKey:", CFSTR("_titleTextField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CollectionViewAccessibility _axNonHiddenViewForKey:](self, "_axNonHiddenViewForKey:", CFSTR("_subtitleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CollectionViewAccessibility _axNonHiddenViewForKey:](self, "_axNonHiddenViewForKey:", CFSTR("_newCollectionLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
