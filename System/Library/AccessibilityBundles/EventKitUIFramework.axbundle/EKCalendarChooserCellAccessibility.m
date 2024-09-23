@implementation EKCalendarChooserCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKCalendarChooserCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  objc_super v13;

  if (-[EKCalendarChooserCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("checked"))
    && (-[EKCalendarChooserCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showCheckmarksOnLeft")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = -[EKCalendarChooserCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  }
  v13.receiver = self;
  v13.super_class = (Class)EKCalendarChooserCellAccessibility;
  v4 = -[EKCalendarChooserCellAccessibility accessibilityTraits](&v13, sel_accessibilityTraits);
  v5 = *MEMORY[0x24BDF7400];
  if (!v3)
    v5 = 0;
  v6 = v5 | v4;
  -[EKCalendarChooserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("alpha"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = *MEMORY[0x24BDF73E8];
  if (v10 >= 1.0)
    v11 = 0;
  return v6 | v11;
}

@end
