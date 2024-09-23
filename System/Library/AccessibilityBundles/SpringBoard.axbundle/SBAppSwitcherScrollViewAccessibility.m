@implementation SBAppSwitcherScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppSwitcherScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBFluidSwitcherItemContainer"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherItemContainer"), CFSTR("appLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBAppSwitcherScrollView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("_adjustFocusContentOffset:toShowFocusItemWithInfo:"), "{CGPoint=dd}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFocusItemInfo"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBAppSwitcherScrollView"), CFSTR("BSUIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BSUIScrollView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("appLayouts"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("rootModifier"), "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBSwitcherModifier"), CFSTR("SBSwitcherMultitaskingQueryProviding"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBSwitcherMultitaskingQueryProviding"), CFSTR("contentOffsetForIndex:alignment:"));

}

- (CGPoint)_ax_adjustedContentOffsetForDifferentialScrollingToShowFocusItemWithInfo:(id)a3 proposedContentOffset:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[SBAppSwitcherScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBFluidSwitcherItemContainer")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeArrayForKey:", CFSTR("appLayouts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("appLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "indexOfObject:", v12);

  LOBYTE(v19) = 0;
  objc_msgSend(v8, "safeValueForKey:", CFSTR("rootModifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x3010000000;
    v24 = 0;
    v22 = &unk_232A4B969;
    v23 = 0;
    v18 = v15;
    AXPerformSafeBlock();
    x = v20[4];
    y = v20[5];

    _Block_object_dispose(&v19, 8);
  }

  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

uint64_t __135__SBAppSwitcherScrollViewAccessibility__ax_adjustedContentOffsetForDifferentialScrollingToShowFocusItemWithInfo_proposedContentOffset___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "contentOffsetForIndex:alignment:", *(_QWORD *)(a1 + 48), 2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

@end
