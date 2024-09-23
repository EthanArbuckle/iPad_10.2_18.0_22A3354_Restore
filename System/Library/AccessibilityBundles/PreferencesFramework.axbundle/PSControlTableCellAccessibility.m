@implementation PSControlTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSControlTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSControlTableCellAccessibility;
  -[PSControlTableCellAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
    v5 = v4;
  }
  else
  {
    -[PSControlTableCellAccessibility specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
    {
      v7 = v4;
    }
    else
    {
      -[PSControlTableCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v7;

  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  objc_super v11;

  if (-[PSControlTableCellAccessibility type](self, "type") == 5)
  {
    -[PSControlTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("control"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "accessibilityTraits");

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PSControlTableCellAccessibility;
    v4 = -[PSControlTableCellAccessibility accessibilityTraits](&v11, sel_accessibilityTraits);
  }
  v5 = *MEMORY[0x24BDF73B0];
  if ((*MEMORY[0x24BDF73B0] & v4) == 0)
    v5 = 0;
  v6 = v5 ^ v4;
  -[PSControlTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isUserInteractionEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = *MEMORY[0x24BDF73E8];
  if (v8)
    v9 = 0;
  return v9 | v6;
}

- (id)_accessibilityAbsoluteValue
{
  void *v2;
  void *v3;

  -[PSControlTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_control"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAbsoluteValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessibilityIncrement
{
  void *v3;
  int v4;
  id v5;

  -[PSControlTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isUserInteractionEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[PSControlTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_control"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityIncrement");

  }
}

- (void)accessibilityDecrement
{
  void *v3;
  int v4;
  id v5;

  -[PSControlTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isUserInteractionEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[PSControlTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_control"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityDecrement");

  }
}

@end
