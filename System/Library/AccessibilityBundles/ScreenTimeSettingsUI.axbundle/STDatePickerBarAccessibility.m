@implementation STDatePickerBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STDatePickerBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STDatePickerBar"), CFSTR("_dateLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STDatePickerBar"), CFSTR("rightArrowButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STDatePickerBar"), CFSTR("leftArrowButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[STDatePickerBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dateLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[STDatePickerBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("rightArrowButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEnabled"))
    objc_msgSend(v4, "sendActionsForControlEvents:", 0x2000);

}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[STDatePickerBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("leftArrowButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEnabled"))
    objc_msgSend(v4, "sendActionsForControlEvents:", 0x2000);

}

@end
