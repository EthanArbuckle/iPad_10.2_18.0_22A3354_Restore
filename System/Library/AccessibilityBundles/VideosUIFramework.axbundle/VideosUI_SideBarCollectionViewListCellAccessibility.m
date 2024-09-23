@implementation VideosUI_SideBarCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.SideBarCollectionViewListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.SideBarCollectionViewListCell"), CFSTR("isSelected"), "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[VideosUI_SideBarCollectionViewListCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideosUI_SideBarCollectionViewListCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[VideosUI_SideBarCollectionViewListCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[VideosUI_SideBarCollectionViewListCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

@end
