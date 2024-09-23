@implementation SKUIStackItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIStackItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIStackItemView"), CFSTR("textView"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SKUIStackItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
