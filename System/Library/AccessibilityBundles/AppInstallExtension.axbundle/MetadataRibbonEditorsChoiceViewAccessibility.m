@implementation MetadataRibbonEditorsChoiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.MetadataRibbonEditorsChoiceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(CFSTR("editors.choice"));
}

@end
