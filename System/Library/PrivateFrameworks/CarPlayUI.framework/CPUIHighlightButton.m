@implementation CPUIHighlightButton

- (id)colorForKnobFocusLayer
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (BOOL)canShowHighlight
{
  return 1;
}

@end
