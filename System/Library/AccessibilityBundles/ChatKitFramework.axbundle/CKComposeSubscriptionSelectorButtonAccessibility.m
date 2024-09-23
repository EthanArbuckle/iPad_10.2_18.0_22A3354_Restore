@implementation CKComposeSubscriptionSelectorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKComposeSubscriptionSelectorButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKComposeSubscriptionSelectorButton"), CFSTR("buttonTitleLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKComposeSubscriptionSelectorButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonTitleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
