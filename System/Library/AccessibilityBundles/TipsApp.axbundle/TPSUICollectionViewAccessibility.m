@implementation TPSUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("visibleCells"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_accessibilityScrollStatus"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSBaseTipCollectionViewCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityFirstVisibleItem"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TPSPageControl"), CFSTR("UIPageControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSTipsViewController"), CFSTR("pageControl"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("TPSTipsViewController"));

}

- (BOOL)_axIsTipsCollectionView
{
  void *v2;
  char isKindOfClass;

  -[TPSUICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234922B1C](CFSTR("TPSTipsViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityFirstVisibleItem
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[TPSUICollectionViewAccessibility _axIsTipsCollectionView](self, "_axIsTipsCollectionView"))
  {
    -[TPSUICollectionViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("visibleCells"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("titleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TPSUICollectionViewAccessibility;
    -[TPSUICollectionViewAccessibility _accessibilityFirstVisibleItem](&v7, sel__accessibilityFirstVisibleItem);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  char v12;

  if (!-[TPSUICollectionViewAccessibility _axIsTipsCollectionView](self, "_axIsTipsCollectionView"))
    goto LABEL_6;
  v12 = 0;
  -[TPSUICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visibleCells"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count"))
    goto LABEL_5;
  v12 = 0;
  objc_opt_class();
  -[TPSUICollectionViewAccessibility delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("pageControl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_5:

LABEL_6:
    v11.receiver = self;
    v11.super_class = (Class)TPSUICollectionViewAccessibility;
    -[TPSUICollectionViewAccessibility _accessibilityScrollStatus](&v11, sel__accessibilityScrollStatus);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  objc_msgSend(v7, "accessibilityValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEF18]);

  return v9;
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  objc_super v4;

  if (-[TPSUICollectionViewAccessibility _axIsTipsCollectionView](self, "_axIsTipsCollectionView"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TPSUICollectionViewAccessibility;
  return -[TPSUICollectionViewAccessibility accessibilityCollectionViewBehavesLikeUIViewAccessibility](&v4, sel_accessibilityCollectionViewBehavesLikeUIViewAccessibility);
}

@end
