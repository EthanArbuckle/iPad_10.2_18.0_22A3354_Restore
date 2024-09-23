@implementation PREditingIncomingCallFontPickerCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingIncomingCallFontPickerCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PREditingIncomingCallFontPickerCellView"), CFSTR("PREditingFontPickerCellView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingFontPickerCellView"), CFSTR("contentFont"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  objc_opt_class();
  -[PREditingIncomingCallFontPickerCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingIncomingCallFontPickerCellViewAccessibility axFontWeight:](self, "axFontWeight:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
