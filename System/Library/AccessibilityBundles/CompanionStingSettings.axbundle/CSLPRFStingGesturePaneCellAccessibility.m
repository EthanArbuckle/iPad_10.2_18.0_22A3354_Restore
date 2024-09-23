@implementation CSLPRFStingGesturePaneCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSLPRFStingGesturePaneCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("CSLPRFStingGesturePaneCell"), CFSTR("specifier"), "@");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[CSLPRFStingGesturePaneCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("specifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("CSLPRFStingGesturePaneCellHasChordArrow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = CFSTR("sting.gesture.image.two.arrows");
  else
    v4 = CFSTR("sting.gesture.image.one.arrow");
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
