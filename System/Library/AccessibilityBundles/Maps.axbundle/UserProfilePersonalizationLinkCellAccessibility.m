@implementation UserProfilePersonalizationLinkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UserProfilePersonalizationLinkCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UserProfilePersonalizationLinkCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UserProfilePersonalizationLinkCell"), CFSTR("updateTitle:subtitle:icon:"), "v", "@", "@", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[UserProfilePersonalizationLinkCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UserProfilePersonalizationLinkCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[UserProfilePersonalizationLinkCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)updateTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UserProfilePersonalizationLinkCellAccessibility;
  v8 = a3;
  -[UserProfilePersonalizationLinkCellAccessibility updateTitle:subtitle:icon:](&v9, sel_updateTitle_subtitle_icon_, v8, a4, a5);
  -[UserProfilePersonalizationLinkCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v8, v9.receiver, v9.super_class);

}

@end
