@implementation HUIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconView"), CFSTR("currentIconContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconContentView"), CFSTR("iconDescriptor"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[HUIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentIconContentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("iconDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLabelForIconIdentifier((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
