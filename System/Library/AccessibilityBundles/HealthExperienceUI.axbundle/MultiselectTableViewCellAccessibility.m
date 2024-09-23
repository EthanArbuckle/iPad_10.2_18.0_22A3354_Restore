@implementation MultiselectTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.MultiselectTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthExperienceUI.MultiselectTableViewCell"), CFSTR("accessoryIsSelected"), "Bool");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HealthExperienceUI.MultiselectTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("detailTextLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[MultiselectTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MultiselectTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("detailTextLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MultiselectTableViewCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[MultiselectTableViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[MultiselectTableViewCellAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("accessoryIsSelected"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

@end
