@implementation SeymourUI_TabletStandardBrickRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.TabletStandardBrickRowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  const char *v3;
  void *v4;

  -[SeymourUI_TabletStandardBrickRowCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _accessibilityReplaceStylsticBulletsForSpeaking(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_TabletStandardBrickRowCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SeymourUI_TabletStandardBrickRowCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
