@implementation SUUIPreviewProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIPreviewProgressIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIPlayButtonControl"), CFSTR("isIndeterminate"), "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  __CFString *v2;

  if (-[SUUIPreviewProgressIndicatorAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isIndeterminate")))v2 = CFSTR("preview.loading.button");
  else
    v2 = CFSTR("preview.stop.button");
  accessibilityLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
