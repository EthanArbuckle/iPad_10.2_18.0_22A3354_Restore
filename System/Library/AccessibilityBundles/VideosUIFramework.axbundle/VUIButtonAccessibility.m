@implementation VUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIButton"), CFSTR("textContentView"), "@");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VUILabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:", CFSTR("VUIMediaTagsView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIButton"), CFSTR("_buttonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIImage"), CFSTR("_imageAsset"), "UIImageAsset");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIButton"), CFSTR("buttonType"), "Q");

}

- (BOOL)_axContainedInMediaShowcasingMetadataView
{
  void *v2;
  BOOL v3;

  -[VUIButtonAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __67__VUIButtonAccessibility__axContainedInMediaShowcasingMetadataView__block_invoke()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "axContainsString:", CFSTR("MediaShowcasingButtonsView"));

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIButtonAccessibility;
  -[VUIButtonAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[VUIButtonAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_213);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  objc_msgSend(v4, "setAccessibilityRespondsToUserInteraction:", 0);

}

uint64_t __68__VUIButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL result;

  MEMORY[0x2349244BC](CFSTR("VideosUI.SeeAllButton"), a2);
  result = 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349244BC](CFSTR("VideosUI.CollectionHeaderView")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return 0;
  }
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VUIButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)accessibilityActivate
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __47__VUIButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buttonTapped:", *(_QWORD *)(a1 + 32));
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  objc_super v18;
  char v19;

  -[VUIButtonAccessibility _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = (__CFString *)v5;
    goto LABEL_19;
  }
  if (-[VUIButtonAccessibility _axIsFavoriteBarButton](self, "_axIsFavoriteBarButton"))
  {
    v6 = &stru_2503D3D30;
    goto LABEL_19;
  }
  if (-[VUIButtonAccessibility _axIsOpenInAppleSportsBarButton](self, "_axIsOpenInAppleSportsBarButton"))
  {
    accessibilityLocalizedString(CFSTR("sports.openIn"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  -[VUIButtonAccessibility _atvaccessibilityITMLAccessibilityContent](self, "_atvaccessibilityITMLAccessibilityContent");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v6, "length"))
  {
    v19 = 0;
    objc_opt_class();
    -[VUIButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textContentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      -[VUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("BrandLinkButton"));

      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("brand.link.button"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v13, v9);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        AXAttributedStringForBetterPronuciation();
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v9;
    }
    else
    {
      -[VUIButtonAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_232);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accessibilityLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "length"))
      {
        v16 = v15;
      }
      else
      {
        v18.receiver = self;
        v18.super_class = (Class)VUIButtonAccessibility;
        -[VUIButtonAccessibility accessibilityLabel](&v18, sel_accessibilityLabel);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v6 = v16;

    }
  }
LABEL_19:

  return v6;
}

uint64_t __44__VUIButtonAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityValue
{
  void *v3;
  __CFString *v4;
  void *v5;

  if (-[VUIButtonAccessibility _axIsFavoriteBarButton](self, "_axIsFavoriteBarButton"))
  {
    -[VUIButtonAccessibility _axAssetName](self, "_axAssetName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "containsString:", CFSTR("fill")))
      v4 = CFSTR("sports.favorites.unfavorited");
    else
      v4 = CFSTR("sports.favorites.isFavorited");
    accessibilityLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  v18.receiver = self;
  v18.super_class = (Class)VUIButtonAccessibility;
  -[VUIButtonAccessibility accessibilityFrame](&v18, sel_accessibilityFrame);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[VUIButtonAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_244, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v12 = CGRectGetWidth(v19) * -0.75;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v13 = CGRectGetHeight(v20) * -0.75;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectInset(v21, v12, v13);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

uint64_t __44__VUIButtonAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("_UINavigationBarContentView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "axContainsString:", CFSTR("MediaShowcasingToolbar"));

  }
  return v3;
}

- (unint64_t)_axButtonType
{
  return -[VUIButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("buttonType"));
}

- (id)_axAssetName
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIButtonAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_249);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("image._imageAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __38__VUIButtonAccessibility__axAssetName__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsFavoriteBarButton
{
  void *v3;
  char v4;

  if (-[VUIButtonAccessibility _axButtonType](self, "_axButtonType") != 6)
    return 0;
  -[VUIButtonAccessibility _axAssetName](self, "_axAssetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("star.circle"));

  return v4;
}

- (BOOL)_axIsOpenInAppleSportsBarButton
{
  void *v3;
  char v4;

  if (-[VUIButtonAccessibility _axButtonType](self, "_axButtonType") != 6)
    return 0;
  -[VUIButtonAccessibility _axAssetName](self, "_axAssetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("sportscourt"));

  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIButtonAccessibility;
  -[VUIButtonAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VUIButtonAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
