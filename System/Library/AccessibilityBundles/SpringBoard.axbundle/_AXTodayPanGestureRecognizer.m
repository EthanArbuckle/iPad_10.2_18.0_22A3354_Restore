@implementation _AXTodayPanGestureRecognizer

- (id)initGestureToShow:(BOOL)a3 leading:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _AXTodayPanGestureRecognizer *v6;
  _AXTodayPanGestureRecognizer *v7;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AXTodayPanGestureRecognizer;
  v6 = -[_AXTodayPanGestureRecognizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[_AXTodayPanGestureRecognizer setShow:](v6, "setShow:", v5);
    -[_AXTodayPanGestureRecognizer setLeading:](v7, "setLeading:", v4);
  }
  return v7;
}

- (CGPoint)translationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[_AXTodayPanGestureRecognizer _xDimensionForTransition](self, "_xDimensionForTransition", a3);
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[_AXTodayPanGestureRecognizer _xDimensionForTransition](self, "_xDimensionForTransition", a3);
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)_xDimensionForTransition
{
  int v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double result;

  v3 = -[_AXTodayPanGestureRecognizer _accessibilityIsRTL](self, "_accessibilityIsRTL");
  v4 = -[_AXTodayPanGestureRecognizer leading](self, "leading");
  v5 = 5000.0;
  if (v4)
    v6 = -5000.0;
  else
    v6 = 5000.0;
  if (!v4)
    v5 = -5000.0;
  if (v3)
    v7 = v6;
  else
    v7 = v5;
  v8 = -[_AXTodayPanGestureRecognizer show](self, "show");
  result = -v7;
  if (v8)
    return v7;
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

- (BOOL)leading
{
  return self->_leading;
}

- (void)setLeading:(BOOL)a3
{
  self->_leading = a3;
}

@end
