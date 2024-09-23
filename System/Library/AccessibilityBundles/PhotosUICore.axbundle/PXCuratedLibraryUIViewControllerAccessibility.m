@implementation PXCuratedLibraryUIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCuratedLibraryUIViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("gridView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGView"), CFSTR("scrollViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXUIScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXUIScrollViewController"), CFSTR("_scrollView"), "_PXUIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (id)ax_pxg_scrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[PXCuratedLibraryUIViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("gridView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("scrollViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2348C1678](CFSTR("PXUIScrollViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_scrollView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryUIViewControllerAccessibility;
  -[PXCuratedLibraryUIViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PXCuratedLibraryUIViewControllerAccessibility ax_pxg_scrollView](self, "ax_pxg_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("AXCuratedLibraryScrollView"));

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryUIViewControllerAccessibility;
  -[PXCuratedLibraryUIViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PXCuratedLibraryUIViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
