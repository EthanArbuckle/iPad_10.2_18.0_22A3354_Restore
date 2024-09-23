@implementation SiriMoviesIndividualShowtimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriMoviesIndividualShowtimeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIsShowtimeSelected
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)setAccessibilityShowtimeSelected:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)accessibilityIsShowtimeHighlighted
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)setAccessibilityShowtimeHighlighted:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesIndividualShowtimeView"), CFSTR("setSelected:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesIndividualShowtimeView"), CFSTR("setHighlighted:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesIndividualShowtimeView"), CFSTR("_timeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesIndividualShowtimeView"), CFSTR("_showtimeTypeLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[SiriMoviesIndividualShowtimeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriMoviesIndividualShowtimeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_showtimeTypeLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[SiriMoviesIndividualShowtimeViewAccessibility accessibilityIsShowtimeSelected](self, "accessibilityIsShowtimeSelected")|| -[SiriMoviesIndividualShowtimeViewAccessibility accessibilityIsShowtimeHighlighted](self, "accessibilityIsShowtimeHighlighted"))
  {
    return *MEMORY[0x24BDF7400];
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriMoviesIndividualShowtimeViewAccessibility;
  return -[SiriMoviesIndividualShowtimeViewAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SiriMoviesIndividualShowtimeViewAccessibility;
  -[SiriMoviesIndividualShowtimeViewAccessibility setSelected:](&v5, sel_setSelected_);
  -[SiriMoviesIndividualShowtimeViewAccessibility setAccessibilityShowtimeSelected:](self, "setAccessibilityShowtimeSelected:", v3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SiriMoviesIndividualShowtimeViewAccessibility;
  -[SiriMoviesIndividualShowtimeViewAccessibility setHighlighted:](&v5, sel_setHighlighted_);
  -[SiriMoviesIndividualShowtimeViewAccessibility setAccessibilityShowtimeHighlighted:](self, "setAccessibilityShowtimeHighlighted:", v3);
}

@end
