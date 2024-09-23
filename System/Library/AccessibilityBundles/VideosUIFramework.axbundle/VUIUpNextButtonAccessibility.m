@implementation VUIUpNextButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIUpNextButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIUpNextButton"), CFSTR("properties"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIUpNextButtonProperties"), CFSTR("isWatchListed"), "B");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIUpNextButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VUIUpNextButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;

  -[VUIUpNextButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("properties"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isWatchListed"));

  if (v3)
    v4 = CFSTR("upnext.button.remove");
  else
    v4 = CFSTR("upnext.button.add");
  accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
