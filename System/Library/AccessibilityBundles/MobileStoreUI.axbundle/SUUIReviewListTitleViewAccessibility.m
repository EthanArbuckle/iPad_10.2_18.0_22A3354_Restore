@implementation SUUIReviewListTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIReviewListTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIReviewListTitleView"), CFSTR("titleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIReviewListTitleView"), CFSTR("dateView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SUUIReviewListTitleViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleView, dateView"));
}

@end
