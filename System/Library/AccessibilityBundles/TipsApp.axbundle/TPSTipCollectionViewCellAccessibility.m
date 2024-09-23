@implementation TPSTipCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPSTipCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TPSTipCollectionViewCell"), CFSTR("TPSBaseTipCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSBaseTipCollectionViewCell"), CFSTR("tip"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSTip"), CFSTR("fullContentAssets"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSAssets"), CFSTR("alt"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSBaseTipCollectionViewCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSBaseTipCollectionViewCell"), CFSTR("heroAssetView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSImageAssetView"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSVideoAssetView"), CFSTR("videoPath"), "@", 0);

}

- (BOOL)_accessibilityProvidesScannerGroupElements
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[TPSTipCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("heroAssetView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10 = v4;
    v11[0] = CFSTR("GroupElements");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("GroupTraits");
    v12[0] = v5;
    v12[1] = &unk_2503B9270;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TPSTipCollectionViewCellAccessibility;
    -[TPSTipCollectionViewCellAccessibility _accessibilityScannerGroupElements](&v9, sel__accessibilityScannerGroupElements);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TPSTipCollectionViewCellAccessibility;
  -[TPSTipCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  -[TPSTipCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityScrollAncestor:", 0);

  objc_opt_class();
  -[TPSTipCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "accessibilityTraits");
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v6);
  -[TPSTipCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSTipCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("heroAssetView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeUIViewForKey:", CFSTR("imageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSTipCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("heroAssetView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("videoPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIsAccessibilityElement:", 1);
  objc_msgSend(v8, "safeValueForKey:", CFSTR("fullContentAssets"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeStringForKey:", CFSTR("alt"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
    accessibilityLocalizedString(CFSTR("video.role"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityLabel:", v16, v14, CFSTR("__AXStringForVariablesSentinel"));

  }
  else
  {
    objc_msgSend(v10, "_accessibilitySetRoleDescription:", 0);
    objc_msgSend(v10, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8]);
    objc_msgSend(v10, "setAccessibilityLabel:", v14);
    objc_msgSend(v10, "setAccessibilityHint:", 0);
  }

}

- (TPSTipCollectionViewCellAccessibility)initWithFrame:(CGRect)a3
{
  TPSTipCollectionViewCellAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSTipCollectionViewCellAccessibility;
  v3 = -[TPSTipCollectionViewCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TPSTipCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)setTip:(id)a3 withCellAppearance:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSTipCollectionViewCellAccessibility;
  -[TPSTipCollectionViewCellAccessibility setTip:withCellAppearance:](&v5, sel_setTip_withCellAppearance_, a3, a4);
  -[TPSTipCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
