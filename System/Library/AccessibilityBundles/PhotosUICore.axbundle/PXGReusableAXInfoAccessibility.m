@implementation PXGReusableAXInfoAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXGReusableAXInfo");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("PXGReusableAXInfo"), CFSTR("UIFocusItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("frame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axContainingGroup"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axNextResponder"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXGAXResponder"), CFSTR("axContainingScrollViewForAXGroup:"), 1, 1);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_PXUIScrollView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("applyToInfo:"), "v", "@", 0);

}

- (id)_axPXGScrollView
{
  void *v3;
  void *v4;
  void *v5;

  -[PXGReusableAXInfoAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axContainingGroup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("axNextResponder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axContainingScrollViewForAXGroup:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  CGRect result;

  -[PXGReusableAXInfoAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("frame"));
  -[PXGReusableAXInfoAccessibility _axPXGScrollView](self, "_axPXGScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x4010000000;
  v17 = "";
  v4 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  v18 = *MEMORY[0x24BDBF070];
  v19 = v4;
  v13 = v3;
  AXPerformSafeBlock();
  v5 = v15[4];
  v6 = v15[5];
  v7 = v15[6];
  v8 = v15[7];

  _Block_object_dispose(&v14, 8);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

void __52__PXGReusableAXInfoAccessibility_accessibilityFrame__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("window"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;

}

- (void)applyToInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGReusableAXInfoAccessibility;
  -[PXGReusableAXInfoAccessibility applyToInfo:](&v4, sel_applyToInfo_, a3);
  if (-[PXGReusableAXInfoAccessibility conformsToProtocol:](self, "conformsToProtocol:", &unk_255EA96E8))
    objc_msgSend(MEMORY[0x24BDF6A60], "updateRingForFocusItem:", self);
}

- (id)accessibilityContainer
{
  void *v2;
  void *v3;

  -[PXGReusableAXInfoAccessibility parentFocusEnvironment](self, "parentFocusEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusItemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
