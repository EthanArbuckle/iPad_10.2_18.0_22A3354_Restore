@implementation MapsDebugCollectionHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MapsDebugCollectionHeaderFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapsDebugCollectionHeaderFooterView"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapsDebugCollectionHeaderFooterView"), CFSTR("isFooter"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MapsDebugCollectionHeaderFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MapsDebugCollectionHeaderFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73E0];
  v3 = -[MapsDebugCollectionHeaderFooterViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFooter"));
  v4 = *MEMORY[0x24BDF73C0];
  if (v3)
    v4 = 0;
  return v4 | v2;
}

@end
