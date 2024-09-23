@implementation HUHomePodDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUHomePodDetailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUHomePodDetailView"), CFSTR("mediaSystemRole"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUHomePodDetailView"), CFSTR("_unitNameLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v8;

  v3 = -[HUHomePodDetailViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("mediaSystemRole"));
  if (v3 == 1)
  {
    v4 = CFSTR("left.homepod");
  }
  else
  {
    if (v3 != 2)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = CFSTR("right.homepod");
  }
  accessibilityHomeLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[HUHomePodDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_unitNameLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityHint
{
  return accessibilityHomeLocalizedString(CFSTR("identify.homepod.hint"));
}

@end
