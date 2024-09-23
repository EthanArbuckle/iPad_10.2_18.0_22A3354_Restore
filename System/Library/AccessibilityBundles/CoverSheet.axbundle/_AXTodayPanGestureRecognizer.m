@implementation _AXTodayPanGestureRecognizer

- (CGPoint)translationInView:(id)a3
{
  _BOOL4 v4;
  int v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v4 = -[_AXTodayPanGestureRecognizer show](self, "show", a3);
  v5 = -[_AXTodayPanGestureRecognizer _accessibilityIsRTL](self, "_accessibilityIsRTL");
  v6 = 5000.0;
  if (v5)
    v7 = -5000.0;
  else
    v7 = 5000.0;
  if (!v5)
    v6 = -5000.0;
  if (v4)
    v6 = v7;
  v8 = 0.0;
  result.y = v8;
  result.x = v6;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  _BOOL4 v4;
  int v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v4 = -[_AXTodayPanGestureRecognizer show](self, "show", a3);
  v5 = -[_AXTodayPanGestureRecognizer _accessibilityIsRTL](self, "_accessibilityIsRTL");
  v6 = 5000.0;
  if (v5)
    v7 = -5000.0;
  else
    v7 = 5000.0;
  if (!v5)
    v6 = -5000.0;
  if (v4)
    v6 = v7;
  v8 = 0.0;
  result.y = v8;
  result.x = v6;
  return result;
}

- (int64_t)overriddenState
{
  return self->_overriddenState;
}

- (void)setOverriddenState:(int64_t)a3
{
  self->_overriddenState = a3;
}

- (BOOL)show
{
  return self->_show;
}

- (void)setShow:(BOOL)a3
{
  self->_show = a3;
}

@end
