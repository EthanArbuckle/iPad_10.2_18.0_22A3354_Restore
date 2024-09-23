@implementation PUITrackerOnboardingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUITrackerOnboardingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (PUITrackerOnboardingCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUITrackerOnboardingCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUITrackerOnboardingCellAccessibility;
  v4 = -[PUITrackerOnboardingCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[PUITrackerOnboardingCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUITrackerOnboardingCellAccessibility;
  -[PUITrackerOnboardingCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PUITrackerOnboardingCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "_accessibilityFindDescendant:", &__block_literal_global);

}

uint64_t __83__PUITrackerOnboardingCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  return 0;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[PUITrackerOnboardingCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
