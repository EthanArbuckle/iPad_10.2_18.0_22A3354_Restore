@implementation IMConversationListTypingIndicatorLayer

- (id)defaultBubbleColor
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_colorWithDynamicProvider_, &unk_24C751470);
}

- (id)defaultThinkingDotColor
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_colorWithDynamicProvider_, &unk_24C751490);
}

@end
