@implementation TitleHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.TitleHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilitySortPriority
{
  void *v3;
  char v4;
  objc_super v6;

  -[TitleHeaderViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("scrollablePill"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)TitleHeaderViewAccessibility;
  return -[TitleHeaderViewAccessibility _accessibilitySortPriority](&v6, sel__accessibilitySortPriority);
}

@end
