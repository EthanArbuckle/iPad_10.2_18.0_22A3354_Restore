@implementation MTCCRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTCCRoundButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCRoundButton"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCCRoundButton"), CFSTR("image"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;

  -[MTCCRoundButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[MTCCRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("image"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("plus"));

    if (v7)
      accessibilityLocalizedString(CFSTR("timer.add.button"));
    else
      objc_msgSend(v5, "accessibilityLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
