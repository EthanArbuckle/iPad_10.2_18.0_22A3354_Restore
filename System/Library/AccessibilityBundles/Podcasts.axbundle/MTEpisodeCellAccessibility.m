@implementation MTEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTEpisodeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeCell"), CFSTR("setExpanded:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_accessibilityClearChildren"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTEpisodeCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeCell"), CFSTR("episodeLockup"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("isSelected"), "B", 0);

}

- (void)setExpanded:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeCellAccessibility;
  -[MTEpisodeCellAccessibility setExpanded:](&v4, sel_setExpanded_, a3);
  -[MTEpisodeCellAccessibility _accessibilityClearChildren](self, "_accessibilityClearChildren");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_axLockup
{
  void *v2;
  void *v3;
  id v4;

  -[MTEpisodeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("episodeLockup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
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

  -[MTEpisodeCellAccessibility _axLockup](self, "_axLockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MTEpisodeCellAccessibility _axLockup](self, "_axLockup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;

  -[MTEpisodeCellAccessibility _axLockup](self, "_axLockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MTEpisodeCellAccessibility _axLockup](self, "_axLockup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilitySupplementaryFooterViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_privateAccessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;

  -[MTEpisodeCellAccessibility _axLockup](self, "_axLockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MTEpisodeCellAccessibility _axLockup](self, "_axLockup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_privateAccessibilityCustomActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTEpisodeCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[MTEpisodeCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits) | *MEMORY[0x24BDF7408];
  -[MTEpisodeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isSelected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = *MEMORY[0x24BDF7400];
  if (!v5)
    v6 = 0;
  return v3 | v6;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;

  -[MTEpisodeCellAccessibility _axLockup](self, "_axLockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MTEpisodeCellAccessibility _axLockup](self, "_axLockup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "automationElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
