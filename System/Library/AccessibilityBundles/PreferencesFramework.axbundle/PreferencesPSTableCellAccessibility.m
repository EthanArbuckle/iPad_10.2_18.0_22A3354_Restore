@implementation PreferencesPSTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  objc_super v17;

  -[PreferencesPSTableCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("ListRestrictionsController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    NSClassFromString(CFSTR("AXLanguageCell"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PreferencesPSTableCellAccessibility textLabel](self, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessibilityLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[PreferencesPSTableCellAccessibility accessibilityLanguage](self, "accessibilityLanguage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PreferencesPSTableCellAccessibility accessibilityLanguage](self, "accessibilityLanguage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAttribute:forKey:", v14, *MEMORY[0x24BDFEBE0]);

        goto LABEL_12;
      }

    }
    v16.receiver = self;
    v16.super_class = (Class)PreferencesPSTableCellAccessibility;
    -[PreferencesPSTableCellAccessibility accessibilityLabel](&v16, sel_accessibilityLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v4, "safeValueForKey:", CFSTR("specifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PreferencesPSTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("specifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", v6)
    || (objc_msgSend(v6, "safeValueForKey:", CFSTR("values")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
LABEL_8:

    goto LABEL_9;
  }
  v17.receiver = self;
  v17.super_class = (Class)PreferencesPSTableCellAccessibility;
  -[PreferencesPSTableCellAccessibility accessibilityLabel](&v17, sel_accessibilityLabel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length") || (unint64_t)objc_msgSend(v9, "length") >= 8)
  {

    goto LABEL_8;
  }
  accessibilityLocalizedString(CFSTR("rating.format"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
LABEL_15:

  return v11;
}

@end
