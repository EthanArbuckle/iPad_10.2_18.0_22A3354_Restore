@implementation SFSectionDisclosureButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFSectionDisclosureButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFSectionDisclosureButton"), CFSTR("_labelWhenCollapsed"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFSectionDisclosureButton"), CFSTR("_labelWhenExpanded"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFSectionDisclosureButton"), CFSTR("isExpanded"), "B", 0);

}

- (id)accessibilityLabel
{
  const __CFString *v3;
  void *v4;
  void *v5;

  if (-[SFSectionDisclosureButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))v3 = CFSTR("_labelWhenExpanded");
  else
    v3 = CFSTR("_labelWhenCollapsed");
  -[SFSectionDisclosureButtonAccessibility safeValueForKey:](self, "safeValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
