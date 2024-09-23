@implementation DownloadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.DownloadButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.DownloadButton"), CFSTR("accessibilityState"), "q", 0);
}

- (id)accessibilityLabel
{
  unint64_t v2;
  void *v3;

  v2 = -[DownloadButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityState"));
  if (v2 > 6)
  {
    v3 = 0;
  }
  else
  {
    accessibilityLocalizedString(*(&off_2503486F8 + v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return -[DownloadButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityState")) != 7;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;
  objc_super v7;

  if (-[DownloadButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityState")) == 5)
  {
    v7.receiver = self;
    v7.super_class = (Class)DownloadButtonAccessibility;
    v3 = *MEMORY[0x24BDF73B0] | -[DownloadButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
    v4 = *MEMORY[0x24BDF73E8];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DownloadButtonAccessibility;
    v4 = -[DownloadButtonAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
    v3 = *MEMORY[0x24BDF73B0];
  }
  return v3 | v4;
}

@end
