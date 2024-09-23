@implementation MUPlaceCallToActionRibbonViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlaceCallToActionRibbonViewModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlaceCallToActionRibbonViewModel"), CFSTR("initWithSubmissionStatus:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlaceCallToActionRibbonViewModel"), CFSTR("setSubmissionStatus:"), "v", "@", 0);

}

- (MUPlaceCallToActionRibbonViewModelAccessibility)initWithSubmissionStatus:(id)a3
{
  id v3;
  MUPlaceCallToActionRibbonViewModelAccessibility *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MUPlaceCallToActionRibbonViewModelAccessibility;
  v3 = a3;
  v4 = -[MUPlaceCallToActionRibbonViewModelAccessibility initWithSubmissionStatus:](&v9, sel_initWithSubmissionStatus_, v3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7, v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCallToActionRibbonViewModelAccessibility _accessibilitySetRetainedValue:forKey:](v4, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("RibbonItemViewTypeKey"));

  v6 = objc_msgSend(v3, "ratingState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCallToActionRibbonViewModelAccessibility _accessibilitySetRetainedValue:forKey:](v4, "_accessibilitySetRetainedValue:forKey:", v7, CFSTR("RibbonItemViewRatingStateKey"));

  return v4;
}

- (void)setSubmissionStatus:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUPlaceCallToActionRibbonViewModelAccessibility;
  v4 = a3;
  -[MUPlaceCallToActionRibbonViewModelAccessibility setSubmissionStatus:](&v7, sel_setSubmissionStatus_, v4);
  v5 = objc_msgSend(v4, "ratingState", v7.receiver, v7.super_class);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCallToActionRibbonViewModelAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("RibbonItemViewRatingStateKey"));

}

@end
