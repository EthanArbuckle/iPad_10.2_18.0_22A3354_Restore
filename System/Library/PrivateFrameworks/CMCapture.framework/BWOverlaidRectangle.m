@implementation BWOverlaidRectangle

- (BWOverlaidRectangle)initWithDisplayStyle:(int)a3
{
  BWOverlaidRectangle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWOverlaidRectangle;
  result = -[BWOverlaidRectangle init](&v5, sel_init);
  if (result)
    result->_displayStyle = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWOverlaidRectangle;
  -[BWOverlaidRectangle dealloc](&v3, sel_dealloc);
}

- (int)displayStyle
{
  return self->_displayStyle;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (BOOL)disappeared
{
  return self->_disappeared;
}

- (void)setDisappeared:(BOOL)a3
{
  self->_disappeared = a3;
}

- (int)animationState
{
  return self->_animationState;
}

- (void)setAnimationState:(int)a3
{
  self->_animationState = a3;
}

- (BWRamp)rampAnimation
{
  return self->_rampAnimation;
}

- (void)setRampAnimation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int)numFramesFullyVisible
{
  return self->_numFramesFullyVisible;
}

- (void)setNumFramesFullyVisible:(int)a3
{
  self->_numFramesFullyVisible = a3;
}

@end
