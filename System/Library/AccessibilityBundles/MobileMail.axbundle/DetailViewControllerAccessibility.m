@implementation DetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DetailViewController"), CFSTR("contentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("_accessibilitySpeakThisViewController"), "@", 0);

}

- (id)_accessibilitySpeakThisViewController
{
  void *v2;
  void *v3;

  -[DetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_accessibilitySpeakThisViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
