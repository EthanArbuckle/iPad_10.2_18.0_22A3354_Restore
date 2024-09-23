@implementation TransportTypeSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TransportTypeSegment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("TransportTypeSegment"), CFSTR("UIControl"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF73B0];
  v4 = objc_msgSend(v2, "isSelected");

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
