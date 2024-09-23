@implementation MTPodcastCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTPodcastCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTGenericCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTGenericCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTPodcastCell"), CFSTR("countView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCountChevronView"), CFSTR("count"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_opt_class();
  -[MTPodcastCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[MTPodcastCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[MTPodcastCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("countView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  if (v10 < 0)
  {
    accessibilityLocalizedString(CFSTR("needs.attention"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("unplayed.episode.count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTPodcastCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[MTPodcastCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
