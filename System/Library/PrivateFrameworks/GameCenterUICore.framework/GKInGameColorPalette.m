@implementation GKInGameColorPalette

- (id)windowBackgroundColor
{
  return 0;
}

- (id)textOnDarkBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

- (id)viewBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.0);
}

- (id)floatingHeaderViewBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.0);
}

- (id)monogramBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.3);
}

@end
