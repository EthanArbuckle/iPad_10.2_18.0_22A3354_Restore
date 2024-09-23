@implementation MTUITonePickerStyleProvider

- (BOOL)tonePickerUsesOpaqueBackground
{
  return 1;
}

- (int64_t)tonePickerTableViewSeparatorStyle
{
  return 1;
}

- (UIFont)tonePickerCellTextFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
}

- (UIColor)tonePickerCellTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
}

- (UIColor)tonePickerCellHighlightedTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
}

- (UIColor)tonePickerCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_foregroundColor");
}

- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3
{
  void *v3;
  void *v4;

  if (!a3)
    return 0;
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6950], "mtui_cellHighlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return v3;
}

- (id)newAccessoryDisclosureIndicatorViewForTonePickerCell
{
  return 0;
}

- (BOOL)wantsCustomTonePickerHeaderView
{
  return 0;
}

- (UIFont)tonePickerHeaderTextFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0);
}

- (UIColor)tonePickerHeaderTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_secondaryTextColor");
}

- (UIColor)tonePickerHeaderTextShadowColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (UIOffset)tonePickerHeaderTextShadowOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = *MEMORY[0x24BDF7BF0];
  v3 = *(double *)(MEMORY[0x24BDF7BF0] + 8);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)vibrationPickerUsesOpaqueBackground
{
  return 1;
}

- (UIColor)vibrationPickerCustomBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_backgroundColor");
}

- (int64_t)vibrationPickerTableViewSeparatorStyle
{
  return 1;
}

- (UIFont)vibrationPickerCellTextFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0);
}

- (UIColor)vibrationPickerCellTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
}

- (UIColor)vibrationPickerCellHighlightedTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
}

- (UIColor)vibrationPickerCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_foregroundColor");
}

- (id)newBackgroundViewForSelectedVibrationPickerCell:(BOOL)a3
{
  void *v3;
  void *v4;

  if (!a3)
    return 0;
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6950], "mtui_cellHighlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return v3;
}

- (id)newAccessoryDisclosureIndicatorViewForVibrationPickerCell
{
  return 0;
}

- (BOOL)wantsCustomVibrationPickerHeaderView
{
  return 0;
}

- (UIFont)vibrationPickerHeaderTextFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0);
}

- (UIColor)vibrationPickerHeaderTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "mtui_secondaryTextColor");
}

- (UIColor)vibrationPickerHeaderTextShadowColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (UIOffset)vibrationPickerHeaderTextShadowOffset
{
  double v2;
  double v3;
  UIOffset result;

  v2 = *MEMORY[0x24BDF7BF0];
  v3 = *(double *)(MEMORY[0x24BDF7BF0] + 8);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)vibrationPickerHeaderTextPaddingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
