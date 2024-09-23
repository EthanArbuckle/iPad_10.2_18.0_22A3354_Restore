@implementation VUIDownloadEntityTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIDownloadEntityTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("VUIDownloadEntityTableViewCell"), CFSTR("dotSeparatorLabel"), "@");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadEntityTableViewCellAccessibility;
  -[VUIDownloadEntityTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[VUIDownloadEntityTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dotSeparatorLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

@end
