@implementation CAMDrawerExposureButton

- (int64_t)controlType
{
  return 8;
}

- (id)imageNameForCurrentState
{
  return CFSTR("plusminus.circle");
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
