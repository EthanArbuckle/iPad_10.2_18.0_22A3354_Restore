@implementation SUTableCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTableCellContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[SUTableCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[SUTableCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SUTableCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SUTableCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUTableCellContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SUTableCellContentView %p> : %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityLanguage
{
  return (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_accessibilityContentLanguage"));
}

@end
