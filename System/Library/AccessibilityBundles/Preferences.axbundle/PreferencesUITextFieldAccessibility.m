@implementation PreferencesUITextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PreferencesUITextFieldAccessibility;
  -[PreferencesUITextFieldAccessibility accessibilityValue](&v11, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PreferencesUITextFieldAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UIAccessibilityPronunciationEditorDictationCell"));

  if (v5
    && (-[PreferencesUITextFieldAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class()), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("showsPhonemes")), v6, v7))
  {
    v8 = v3;
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "setAttribute:forKey:", v8, *MEMORY[0x24BDFE990]);
  }
  else
  {
    v9 = v3;
  }

  return v9;
}

@end
