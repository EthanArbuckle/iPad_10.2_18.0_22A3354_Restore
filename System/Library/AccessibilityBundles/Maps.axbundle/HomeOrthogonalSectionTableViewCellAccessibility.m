@implementation HomeOrthogonalSectionTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HomeOrthogonalSectionTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("HomeOrthogonalSectionTableViewCell"), CFSTR("_wrapperView"), "UIView");
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[HomeOrthogonalSectionTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_wrapperView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
