@implementation PLHighlightableSegmentableSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLHighlightableSegmentableSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLHighlightableSegmentableSlider"), CFSTR("rtlConsideredValue"), "f", 0);
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PLHighlightableSegmentableSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("rtlConsideredValue"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
