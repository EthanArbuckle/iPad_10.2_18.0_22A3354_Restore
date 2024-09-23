@implementation PXCuratedLibraryFooterControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCuratedLibraryFooterController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryFooterController"), CFSTR("_shouldRevealPhotosFooterView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryFooterController"), CFSTR("gridView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGView"), CFSTR("scrollViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXUIScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIScrollViewController"), CFSTR("isScrolledAtEdge:tolerance:"), "B", "I", "d", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXScrollViewControllerObserver"), CFSTR("scrollViewControllerDidScroll:"), 1, 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("PXCuratedLibraryFooterController"), CFSTR("PXScrollViewControllerObserver"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryFooterController"), CFSTR("_conditionallyRevealPhotosFooterView"), "v", 0);

}

- (BOOL)_shouldRevealPhotosFooterView
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryFooterControllerAccessibility;
  v3 = -[PXCuratedLibraryFooterControllerAccessibility _shouldRevealPhotosFooterView](&v12, sel__shouldRevealPhotosFooterView);
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    -[PXCuratedLibraryFooterControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("gridView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("scrollViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x2348C1678](CFSTR("PXUIScrollViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x2020000000;
      v11 = 0;
      v7 = v5;
      AXPerformSafeBlock();
      v3 = *((_BYTE *)v9 + 24) != 0;

      _Block_object_dispose(&v8, 8);
    }

  }
  return v3;
}

uint64_t __78__PXCuratedLibraryFooterControllerAccessibility__shouldRevealPhotosFooterView__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isScrolledAtEdge:tolerance:", 3, 1.0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryFooterControllerAccessibility;
  -[PXCuratedLibraryFooterControllerAccessibility scrollViewControllerDidScroll:](&v3, sel_scrollViewControllerDidScroll_, a3);
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    AXPerformSafeBlock();
}

uint64_t __79__PXCuratedLibraryFooterControllerAccessibility_scrollViewControllerDidScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_conditionallyRevealPhotosFooterView");
}

@end
