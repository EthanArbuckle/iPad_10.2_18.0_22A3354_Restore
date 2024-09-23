@implementation GKFocusableDarkColorPalette

- (int64_t)windowBackgroundBlurStyle
{
  return 2;
}

- (id)standardTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.57254902, 0.57254902, 0.57254902, 1.0);
}

- (id)emphasizedTextColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

@end
