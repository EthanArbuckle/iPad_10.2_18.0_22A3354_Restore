@implementation TapbackPickerEmojiTailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.TapbackPickerEmojiTailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char isKindOfClass;

  -[TapbackPickerEmojiTailViewAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("ChatKit.TapbackPickerBalloonAccessoryView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("add.custom.emoji.reaction"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TapbackPickerEmojiTailViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TapbackPickerEmojiTailViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
