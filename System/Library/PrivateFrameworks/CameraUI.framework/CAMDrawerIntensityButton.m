@implementation CAMDrawerIntensityButton

- (int64_t)controlType
{
  return 7;
}

- (id)imageNameForCurrentState
{
  return CFSTR("camera.lightcontrol");
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[CAMControlDrawerButton updateImage](self, "updateImage");
  }
}

- (BOOL)isOn
{
  return self->_on;
}

@end
