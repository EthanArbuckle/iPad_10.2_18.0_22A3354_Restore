@implementation MTAddPodcastCellAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAddPodcastCellAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *MEMORY[0x24BDF73B0];
  -[MTAddPodcastCellAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  v5 = *MEMORY[0x24BDF73E8];

  if ((v5 & v4) != 0)
    v6 = v5;
  else
    v6 = 0;
  return v6 | v2;
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;

  -[MTAddPodcastCellAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isAdded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
    v4 = CFSTR("selected");
  else
    v4 = CFSTR("not.selected");
  accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
