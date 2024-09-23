@implementation SUTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityTableViewCellText
{
  void *v2;
  void *v3;

  -[SUTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configurationView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[SUTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configurationView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SUTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configurationView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUTableCellAccessibility;
  v3 = -[SUTableCellAccessibility accessibilityTraits](&v11, sel_accessibilityTraits);
  -[SUTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configurationView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");

  if (v5 == *MEMORY[0x24BDF73E0])
    v6 = *MEMORY[0x24BDF73E0];
  else
    v6 = v5 | v3;
  -[SUTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("showHighlight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = *MEMORY[0x24BDF7400];
  if (!v8)
    v9 = 0;
  return v9 | v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SUTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configurationView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTableCellAccessibility accessibilityTableViewCellText](self, "accessibilityTableViewCellText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> : %@ -- :%@:"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityLanguage
{
  return (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityContentLanguage");
}

@end
