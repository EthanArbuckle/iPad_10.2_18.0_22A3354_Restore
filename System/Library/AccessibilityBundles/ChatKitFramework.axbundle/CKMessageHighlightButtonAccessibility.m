@implementation CKMessageHighlightButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageHighlightButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageHighlightButton"), CFSTR("isHighlighted"), "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  __CFString *v2;

  if (-[CKMessageHighlightButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isHighlighted")))v2 = CFSTR("highlight.remove.button");
  else
    v2 = CFSTR("highlight.button");
  accessibilityLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
