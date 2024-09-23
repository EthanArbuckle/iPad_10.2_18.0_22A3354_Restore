@implementation SBUIAlertViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAlertView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAlertView"), CFSTR("show"), "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBUIController"), CFSTR("sharedInstance"), "@", 0);

}

- (unint64_t)_accessibilityAutomationType
{
  return 6;
}

@end
