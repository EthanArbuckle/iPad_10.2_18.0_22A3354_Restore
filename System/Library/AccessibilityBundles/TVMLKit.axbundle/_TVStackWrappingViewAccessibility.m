@implementation _TVStackWrappingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVStackWrappingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStackWrappingView"), CFSTR("configureSupplementaryCellLayoutAttributesWithAutomaticInsets:sectionIndex:"), "v", "{UIEdgeInsets=dddd}", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStackWrappingView"), CFSTR("stackView"), "@", 0);

}

- (void)configureSupplementaryCellLayoutAttributesWithAutomaticInsets:(UIEdgeInsets)a3 sectionIndex:(int64_t)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v9;
  objc_super v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v10.receiver = self;
  v10.super_class = (Class)_TVStackWrappingViewAccessibility;
  -[_TVStackWrappingViewAccessibility configureSupplementaryCellLayoutAttributesWithAutomaticInsets:sectionIndex:](&v10, sel_configureSupplementaryCellLayoutAttributesWithAutomaticInsets_sectionIndex_, a4);
  -[_TVStackWrappingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stackView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_accessibilitySetVisibleContentInset:", top, left, bottom, right);

}

@end
