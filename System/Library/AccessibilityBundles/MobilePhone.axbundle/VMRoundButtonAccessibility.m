@implementation VMRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VMRoundButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("VMRoundButton"), CFSTR("_type"), "Q");
}

- (id)accessibilityLabel
{
  unint64_t v2;
  void *v3;

  v2 = -[VMRoundButtonAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_type")) - 1;
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    accessibilityLocalizedString(*(&off_2502908A0 + v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
