@implementation CAMIntensityStatusIndicator

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[CAMControlStatusIndicator updateImage](self, "updateImage");
  }
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return CFSTR("camera.lightcontrol");
}

- (BOOL)isOn
{
  return self->_on;
}

@end
