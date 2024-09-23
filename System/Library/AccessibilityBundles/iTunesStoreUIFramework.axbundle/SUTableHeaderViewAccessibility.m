@implementation SUTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTableHeaderView");
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
  void *v3;
  void *v4;
  void *v5;

  -[SUTableHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTableHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR("%@, "), v3);
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR("%@, "), v4);

  return v5;
}

@end
