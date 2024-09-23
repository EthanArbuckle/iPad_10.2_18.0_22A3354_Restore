@implementation CPUIPlayModeButton

- (BOOL)showBezelInTouch
{
  return 1;
}

- (BOOL)shouldUpdateButtonOpacityForKnobUnfocused
{
  return 0;
}

- (id)colorForTouchContentSelected
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusedCarSystemColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)colorForKnobFocusLayerSelected
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

- (id)colorForKnobContentSelected
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusedCarSystemColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)colorForTouchFocusLayerSelected
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

- (id)colorForTouchFocusLayer
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (id)tintColorForUnhighlightedTextLabel
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

@end
