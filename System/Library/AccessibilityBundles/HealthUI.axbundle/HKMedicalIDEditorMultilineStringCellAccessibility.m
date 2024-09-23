@implementation HKMedicalIDEditorMultilineStringCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMedicalIDEditorMultilineStringCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMedicalIDEditorMultilineStringCell"), CFSTR("_labelLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMedicalIDEditorMultilineStringCell"), CFSTR("_placeholderLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMedicalIDEditorMultilineStringCell"), CFSTR("_textView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorMultilineStringCell"), CFSTR("setLabel:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorMultilineStringCell"), CFSTR("setPlaceholder:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorMultilineStringCell"), CFSTR("setStringValue:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorMultilineStringCell"), CFSTR("stringValue"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return 0;
}

- (HKMedicalIDEditorMultilineStringCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEditorMultilineStringCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  v4 = -[HKMedicalIDEditorMultilineStringCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[HKMedicalIDEditorMultilineStringCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  -[HKMedicalIDEditorMultilineStringCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HKMedicalIDEditorMultilineStringCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_labelLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[HKMedicalIDEditorMultilineStringCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_placeholderLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (void)setLabel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  -[HKMedicalIDEditorMultilineStringCellAccessibility setLabel:](&v4, sel_setLabel_, a3);
  -[HKMedicalIDEditorMultilineStringCellAccessibility _accessibilityUpdateTextViewLabel](self, "_accessibilityUpdateTextViewLabel");
}

- (void)setPlaceholder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  -[HKMedicalIDEditorMultilineStringCellAccessibility setPlaceholder:](&v4, sel_setPlaceholder_, a3);
  -[HKMedicalIDEditorMultilineStringCellAccessibility _accessibilityUpdateTextViewLabel](self, "_accessibilityUpdateTextViewLabel");
}

- (void)setStringValue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorMultilineStringCellAccessibility;
  -[HKMedicalIDEditorMultilineStringCellAccessibility setStringValue:](&v4, sel_setStringValue_, a3);
  -[HKMedicalIDEditorMultilineStringCellAccessibility _accessibilityUpdateTextViewLabel](self, "_accessibilityUpdateTextViewLabel");
}

- (void)_accessibilityUpdateTextViewLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HKMedicalIDEditorMultilineStringCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_placeholderLabel.isHidden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[HKMedicalIDEditorMultilineStringCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_placeholderLabel.text"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[HKMedicalIDEditorMultilineStringCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_labelLabel.text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorMultilineStringCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6, v7, CFSTR("__AXStringForVariablesSentinel"));

}

@end
