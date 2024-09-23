@implementation AXPISystemPointerPreciseAppearance

- (double)strokeWidth
{
  float v2;

  _AXSPointerStrokeColorWidth();
  return v2;
}

- (id)deselectedStrokeColor
{
  _AXSPointerStrokeColor();
  if (_AXSPointerStrokeColorValues())
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)circularProgressFillColor
{
  void *v2;
  void *v3;

  -[AXPISystemPointerPreciseAppearance deselectedStrokeColor](self, "deselectedStrokeColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXSlightlyDarkerColorForColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)strokeOutlineWidth
{
  return 0.0;
}

- (BOOL)showFingerOutlines
{
  _AXSPointerStrokeColor();
  return _AXSPointerStrokeColorValues() != 0;
}

- (BOOL)showInnerCircle
{
  return _AXSPointerShouldShowCenterPoint() != 0;
}

- (BOOL)useSystemFilters
{
  return 1;
}

- (double)pressedAlpha
{
  return 0.9;
}

- (double)pressedScale
{
  return 0.9;
}

- (double)unpressedAlpha
{
  return 0.5;
}

- (double)unpressedScale
{
  return 1.0;
}

- (double)fingerInnerCircleInnerRadius
{
  _BOOL4 v2;
  double result;

  v2 = -[AXPISystemPointerPreciseAppearance showInnerCircle](self, "showInnerCircle");
  result = 0.0;
  if (v2)
    return 4.75;
  return result;
}

- (double)innerCircleStrokeWidth
{
  return 0.0;
}

- (double)fingerInnerRadius
{
  float v2;

  _AXSPointerSizeMultiplier();
  return v2 * 19.0 * 0.5;
}

@end
