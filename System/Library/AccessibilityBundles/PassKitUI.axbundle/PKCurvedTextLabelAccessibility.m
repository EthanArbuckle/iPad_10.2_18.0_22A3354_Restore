@implementation PKCurvedTextLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKCurvedTextLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCurvedTextLabel"), CFSTR("text"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[PKCurvedTextLabelAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
}

@end
