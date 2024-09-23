@implementation SBAppSwitcherPeopleContactViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppSwitcherPeopleContactView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("people.picker.hint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherPeopleContactViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
