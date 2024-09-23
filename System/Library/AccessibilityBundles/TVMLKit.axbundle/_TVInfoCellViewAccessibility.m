@implementation _TVInfoCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVInfoCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVInfoCellView"), CFSTR("dataViews"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[_TVInfoCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x234921D50](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
