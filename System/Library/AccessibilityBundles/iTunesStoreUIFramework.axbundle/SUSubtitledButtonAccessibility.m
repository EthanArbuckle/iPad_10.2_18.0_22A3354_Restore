@implementation SUSubtitledButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUSubtitledButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUSubtitledButtonAccessibility;
  -[SUSubtitledButtonAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUSubtitledButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentSubtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
