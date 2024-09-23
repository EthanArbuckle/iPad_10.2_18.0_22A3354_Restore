@implementation MetadataRibbonIconWithLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.MetadataRibbonIconWithLabelView");
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
  void *v3;
  void *v4;
  void *v6;

  -[MetadataRibbonIconWithLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtworkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetadataRibbonIconWithLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityUILabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
