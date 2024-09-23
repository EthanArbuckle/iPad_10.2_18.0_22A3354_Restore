@implementation UpNextQueueButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.UpNextQueueButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.UpNextQueueButton"), CFSTR("queueCount"), "Int");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[UpNextQueueButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("queueCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("workout.button.stack"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
