@implementation SBUIActionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIActionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIActionView"), CFSTR("_titleLabel"), "SBUIActionViewLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIActionView"), CFSTR("_subtitleLabel"), "SBUIActionViewLabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIActionViewLabel"), CFSTR("text"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBUIActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUIActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("AXDismissShortcutMenu"), 0);

  return 1;
}

@end
