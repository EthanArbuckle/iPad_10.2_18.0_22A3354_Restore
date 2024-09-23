@implementation CAMDrawerLowLightButton

- (int64_t)controlType
{
  return 9;
}

- (id)imageNameForCurrentState
{
  return CFSTR("camera.nightmode");
}

- (void)setDisabled:(BOOL)a3
{
  -[CAMDrawerLowLightButton setDisabled:animated:](self, "setDisabled:animated:", a3, 0);
}

- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[CAMControlDrawerButton updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[CAMControlDrawerButton updateImage](self, "updateImage");
  }
}

- (BOOL)adjustsImageWhenDisabled
{
  return 0;
}

- (id)imageNameForAXHUD
{
  __CFString *v3;

  if (-[CAMDrawerLowLightButton shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"))
  {
    v3 = CFSTR("CAMLowLightButtonOff-AXHUD");
  }
  else
  {
    -[CAMDrawerLowLightButton imageNameForCurrentState](self, "imageNameForCurrentState");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

@end
