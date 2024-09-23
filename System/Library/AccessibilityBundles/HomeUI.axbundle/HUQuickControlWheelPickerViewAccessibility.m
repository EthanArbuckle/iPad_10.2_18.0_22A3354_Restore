@implementation HUQuickControlWheelPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlWheelPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)pickerView:(id)a3 accessibilityAttributedLabelForComponent:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD1458];
  accessibilityHomeUILocalizedString(CFSTR("picker.current.mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedStringWithFormatAndAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
