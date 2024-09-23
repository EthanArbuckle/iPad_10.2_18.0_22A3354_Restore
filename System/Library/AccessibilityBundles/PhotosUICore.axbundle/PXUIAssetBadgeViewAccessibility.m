@implementation PXUIAssetBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXUIAssetBadgeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIAssetBadgeView"), CFSTR("badgeInfo"), "{PXAssetBadgeInfo=Qdqq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIAssetBadgeView"), CFSTR("style"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXUIAssetBadgeView"), CFSTR("_topLeftPrimaryGroup"), "_PXUIAssetBadgeTopGroup");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_PXUIAssetBadgeTopGroup"), CFSTR("label"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __57__PXUIAssetBadgeViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "badgeInfo");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setAccessibilityElementsHidden:", 1, (unsigned __int128)0, (unsigned __int128)0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  -[PXUIAssetBadgeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_topLeftPrimaryGroup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = 0;
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("label"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXUIAssetBadgeViewAccessibility;
    -[PXUIAssetBadgeViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)accessibilityValue
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__4;
  v8 = __Block_byref_object_dispose__4;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __53__PXUIAssetBadgeViewAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v1, "badgeInfo");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXUIAssetBadgeViewAccessibility;
  v3 = -[PXUIAssetBadgeViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[PXUIAssetBadgeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = *MEMORY[0x24BDF73B0];
  if (v5 != 4)
    v6 = 0;
  return v6 | v3;
}

@end
