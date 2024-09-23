@implementation AVInfoMenuCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVInfoMenuCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVInfoMenuCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVInfoMenuCell"), CFSTR("floatingView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  objc_super v6;

  _UIAccessibilityFocusedElements();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self);

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)AVInfoMenuCellAccessibility;
  return -[AVInfoMenuCellAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVInfoMenuCellAccessibility;
  return *MEMORY[0x24BEBB188] | -[AVInfoMenuCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilityFrameDelegate
{
  return (id)-[AVInfoMenuCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("floatingView"));
}

@end
