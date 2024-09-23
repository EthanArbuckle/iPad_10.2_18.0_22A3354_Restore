@implementation PBFAmbientEditingCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBFAmbientEditingCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PBFAmbientEditingCollectionViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PBFAmbientEditingCollectionViewController"), CFSTR("editingSceneViewController"), "Optional<PREditingSceneViewController>");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBFAmbientEditingCollectionViewControllerAccessibility;
  -[PBFAmbientEditingCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PBFAmbientEditingCollectionViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __100__PBFAmbientEditingCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_250308130;
  v4[4] = self;
  objc_msgSend(v3, "setAccessibilityElementsHiddenBlock:", v4);

}

BOOL __100__PBFAmbientEditingCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(*(id *)(a1 + 32), "safeSwiftValueForKey:", CFSTR("editingSceneViewController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
