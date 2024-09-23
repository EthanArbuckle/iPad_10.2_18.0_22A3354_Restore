@implementation HUQuickControlPanningContext

- (HUQuickControlPanningContext)init
{
  HUQuickControlPanningContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlPanningContext;
  result = -[HUQuickControlPanningContext init](&v3, sel_init);
  if (result)
    result->_verticalDragCoefficient = 1.0;
  return result;
}

- (void)assertConfigurationIsValid
{
  CGRect v2;

  -[HUQuickControlPanningContext controlFrame](self, "controlFrame");
  if (CGRectIsEmpty(v2))
    NSLog(CFSTR("Empty initial frame"));
}

- (CGRect)controlFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_controlFrame.origin.x;
  y = self->_controlFrame.origin.y;
  width = self->_controlFrame.size.width;
  height = self->_controlFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setControlFrame:(CGRect)a3
{
  self->_controlFrame = a3;
}

- (double)initialSliderValue
{
  return self->_initialSliderValue;
}

- (void)setInitialSliderValue:(double)a3
{
  self->_initialSliderValue = a3;
}

- (double)verticalDragCoefficient
{
  return self->_verticalDragCoefficient;
}

- (void)setVerticalDragCoefficient:(double)a3
{
  self->_verticalDragCoefficient = a3;
}

- (BOOL)requiresSomeMovementBeforeActivation
{
  return self->_requiresSomeMovementBeforeActivation;
}

- (void)setRequiresSomeMovementBeforeActivation:(BOOL)a3
{
  self->_requiresSomeMovementBeforeActivation = a3;
}

@end
