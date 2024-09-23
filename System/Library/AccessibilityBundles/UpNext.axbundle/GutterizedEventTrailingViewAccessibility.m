@implementation GutterizedEventTrailingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UpNext.GutterizedEventTrailingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("UpNext.VibrantLabel"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UpNext.GutterizedEventTrailingView"), CFSTR("UIView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLabelFromSortedLabelsInsideView(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
