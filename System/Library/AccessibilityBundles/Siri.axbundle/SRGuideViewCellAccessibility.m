@implementation SRGuideViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRGuideViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SRGuideViewCell"), CFSTR("_nameLabel"), "SiriSharedUIContentLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SRGuideViewCell"), CFSTR("_tagPhraseLabel"), "SiriSharedUIContentLabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SRGuideViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SRGuideViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tagPhraseLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
