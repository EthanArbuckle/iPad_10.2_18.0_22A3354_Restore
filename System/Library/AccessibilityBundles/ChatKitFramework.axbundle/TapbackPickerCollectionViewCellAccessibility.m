@implementation TapbackPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.TapbackPickerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.TapbackPickerCollectionViewCell"), CFSTR("tapbackView"), "Optional<UIView & CKTapbackViewProtocol>");
  objc_msgSend(v3, "validateClass:", CFSTR("ChatKit.TapbackEmojiKeyboardGlyphView"));

}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[TapbackPickerCollectionViewCellAccessibility _axIsEmojiKeyboardButton](self, "_axIsEmojiKeyboardButton"))
  {
    accessibilityLocalizedString(CFSTR("add.custom.emoji.reaction"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TapbackPickerCollectionViewCellAccessibility;
    -[TapbackPickerCollectionViewCellAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityHint
{
  if (-[TapbackPickerCollectionViewCellAccessibility _axIsEmojiKeyboardButton](self, "_axIsEmojiKeyboardButton"))
    return 0;
  accessibilityLocalizedString(CFSTR("acknowledgment.hint"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_axIsEmojiKeyboardButton
{
  void *v2;
  char isKindOfClass;

  -[TapbackPickerCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("tapbackView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("ChatKit.TapbackEmojiKeyboardGlyphView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
