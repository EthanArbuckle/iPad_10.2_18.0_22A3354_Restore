@implementation AXPIFingerSmallAppearance

- (id)selectedFillColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.4);
}

- (id)deselectedFillColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
}

- (id)selectedStrokeColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
}

- (id)deselectedStrokeColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.6, 1.0);
}

- (id)strokeOutlineColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
}

- (BOOL)useSystemFilters
{
  return 0;
}

- (double)pressedAlpha
{
  return 1.0;
}

- (double)pressedScale
{
  return 1.0;
}

- (double)unpressedAlpha
{
  return 1.0;
}

- (double)unpressedScale
{
  return 1.0;
}

- (double)strokeWidth
{
  return 2.0;
}

- (double)strokeOutlineWidth
{
  return 2.0;
}

- (double)fingerInnerRadius
{
  return 17.0;
}

- (BOOL)showFingerOutlines
{
  return 1;
}

- (BOOL)showInnerCircle
{
  return 1;
}

- (double)fingerWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[AXPIFingerSmallAppearance fingerInnerRadius](self, "fingerInnerRadius");
  v4 = v3;
  -[AXPIFingerSmallAppearance strokeWidth](self, "strokeWidth");
  v6 = v4 + v5;
  -[AXPIFingerSmallAppearance strokeOutlineWidth](self, "strokeOutlineWidth");
  return v6 + v7 + v6 + v7;
}

@end
