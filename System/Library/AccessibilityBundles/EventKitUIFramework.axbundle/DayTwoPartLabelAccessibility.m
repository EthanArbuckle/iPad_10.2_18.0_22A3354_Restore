@implementation DayTwoPartLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DayTwoPartLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayTwoPartLabel"), CFSTR("_firstLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayTwoPartLabel"), CFSTR("_secondLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayTwoPartLabel"), CFSTR("_entireString"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayTwoPartLabel"), CFSTR("_overlayLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DayTwoPartLabel"), CFSTR("_useSeparateFormat"), "B");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v9;

  if (-[DayTwoPartLabelAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_useSeparateFormat")))
  {
    -[DayTwoPartLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_firstLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("_secondLabel");
  }
  else
  {
    -[DayTwoPartLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_entireString"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("_overlayLabel");
  }
  -[DayTwoPartLabelAccessibility safeValueForKey:](self, "safeValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0] | *MEMORY[0x24BDF7410];
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  return (id)*MEMORY[0x24BDF76A0] == a3 || *MEMORY[0x24BDF7678] == (_QWORD)a3 || *MEMORY[0x24BDF7640] == (_QWORD)a3;
}

@end
