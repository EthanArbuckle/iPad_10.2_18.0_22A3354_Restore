@implementation AXEmojiPlaceholderView

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (BOOL)_accessibilityViewIsVisible
{
  return 1;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

@end
