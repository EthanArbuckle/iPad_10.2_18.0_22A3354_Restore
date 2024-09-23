@implementation PREditingTimeFontPickerCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingTimeFontPickerCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingTimeFontPickerCellView"), CFSTR("contentLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PREditingTimeFontPickerCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  objc_opt_class();
  -[PREditingTimeFontPickerCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingTimeFontPickerCellViewAccessibility axFontWeight:](self, "axFontWeight:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)axFontWeight:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Medium")) & 1) != 0)
  {
    v4 = CFSTR("time.font.medium");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Semibold")) & 1) != 0)
  {
    v4 = CFSTR("time.font.bold");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Light")) & 1) != 0)
  {
    v4 = CFSTR("time.font.light");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Heavy")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v4 = CFSTR("time.font.heavy");
  }
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

@end
