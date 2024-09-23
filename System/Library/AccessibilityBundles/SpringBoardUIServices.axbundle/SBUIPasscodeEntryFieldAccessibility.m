@implementation SBUIPasscodeEntryFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodeEntryField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeEntryField"), CFSTR("_textField"), "SBUIPasscodeTextField");
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  return (id)-[SBUIPasscodeEntryFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textField"));
}

@end
