@implementation SearchUIRowCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIRowCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SearchUIRowCardSectionView"), CFSTR("SearchUICardSectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardSectionView"), CFSTR("section"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SearchUIRowCardSectionView"), CFSTR("SearchUICardSectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardSectionView"), CFSTR("rowModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardSectionView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKSimpleRowView"), CFSTR("trailingImageView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SearchUIRowCardSectionViewAccessibility _accessibleSubviews](self, "_accessibleSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491CD7C]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIRowCardSectionViewAccessibility;
  -[SearchUIRowCardSectionViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SearchUIRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rowModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIRowCardSectionViewAccessibility _axApplyTrailingImageView:](self, "_axApplyTrailingImageView:", v3);

}

- (void)_axApplyTrailingImageView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSClassFromString(CFSTR("SearchUICardSectionRowModel"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v5, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("SFAppIconImage"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v9, "iconType") == 1)
          v8 = CFSTR("web-browser");
        else
          v8 = 0;
      }
      else
      {
        v8 = 0;
      }

    }
    -[SearchUIRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeUIViewForKey:", CFSTR("trailingImageView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SearchUIRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIRowCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeUIViewForKey:", CFSTR("trailingImageView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_23298C000, v12, OS_LOG_TYPE_DEFAULT, "TRAILER: %@ %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(v11, "setIsAccessibilityElement:", v11 != 0);
    objc_msgSend(v11, "setAccessibilityIdentifier:", v8);

  }
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIRowCardSectionViewAccessibility;
  v4 = a3;
  -[SearchUIRowCardSectionViewAccessibility updateWithRowModel:](&v5, sel_updateWithRowModel_, v4);
  -[SearchUIRowCardSectionViewAccessibility _axApplyTrailingImageView:](self, "_axApplyTrailingImageView:", v4, v5.receiver, v5.super_class);

}

@end
