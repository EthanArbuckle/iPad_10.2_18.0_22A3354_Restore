@implementation SiriUIReusableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUIReusableHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SiriUIReusableHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleText"));
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BDF73C0];
  -[SiriUIReusableHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("snippetViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("headerPunchOut"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v2;
}

@end
