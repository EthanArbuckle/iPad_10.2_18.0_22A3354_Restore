@implementation PDFTextInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PDFTextInputView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
