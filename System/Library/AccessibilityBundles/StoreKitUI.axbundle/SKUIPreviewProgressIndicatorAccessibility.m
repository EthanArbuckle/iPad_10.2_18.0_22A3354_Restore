@implementation SKUIPreviewProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIPreviewProgressIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIPlayButtonControl"), CFSTR("isIndeterminate"), "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  __CFString *v2;

  if (-[SKUIPreviewProgressIndicatorAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isIndeterminate")))v2 = CFSTR("preview.loading.button");
  else
    v2 = CFSTR("preview.stop.button");
  accessibilitySKUILocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
