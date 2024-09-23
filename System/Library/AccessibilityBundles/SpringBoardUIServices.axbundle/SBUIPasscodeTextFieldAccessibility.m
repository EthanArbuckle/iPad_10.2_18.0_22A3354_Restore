@implementation SBUIPasscodeTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodeTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBUIPasscodeTextField"), CFSTR("UITextField"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextField"), CFSTR("insertText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextField"), CFSTR("deleteBackward"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilitySBLocalizedString(CFSTR("passcode.entry"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeTextFieldAccessibility;
  return *MEMORY[0x24BEBB168] | -[SBUIPasscodeTextFieldAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)insertText:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SBUIPasscodeTextFieldAccessibility _accessibilityPostValueChangedNotificationWithInsertedText:](self, "_accessibilityPostValueChangedNotificationWithInsertedText:", v4);
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeTextFieldAccessibility;
  -[SBUIPasscodeTextFieldAccessibility insertText:](&v5, sel_insertText_, v4);

}

- (void)deleteBackward
{
  objc_super v3;

  -[SBUIPasscodeTextFieldAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](self, "_accessibilityPostValueChangedNotificationWithChangeType:", *MEMORY[0x24BDFF0D8]);
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeTextFieldAccessibility;
  -[SBUIPasscodeTextFieldAccessibility deleteBackward](&v3, sel_deleteBackward);
}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 0;
}

@end
