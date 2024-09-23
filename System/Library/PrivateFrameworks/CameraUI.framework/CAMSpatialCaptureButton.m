@implementation CAMSpatialCaptureButton

- (CAMSpatialCaptureButton)initWithFrame:(CGRect)a3
{
  CAMSpatialCaptureButton *v3;
  CAMSpatialCaptureButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMSpatialCaptureButton;
  v3 = -[CAMCircleButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_active = 0;
    -[CAMCircleButton updateTintColors](v3, "updateTintColors");
    -[CAMCircleButton updateSlashAnimated:](v4, "updateSlashAnimated:", 0);
    -[CAMSpatialCaptureButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("SpatialCaptureButton"));
  }
  return v4;
}

- (id)imageNameForCurrentState
{
  return CFSTR("visionpro");
}

- (void)setActive:(BOOL)a3
{
  -[CAMSpatialCaptureButton setActive:animated:](self, "setActive:animated:", a3, 0);
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_active != a3)
  {
    v4 = a4;
    self->_active = a3;
    -[CAMCircleButton updateTintColors](self, "updateTintColors");
    -[CAMCircleButton updateSlashAnimated:](self, "updateSlashAnimated:", v4);
  }
}

- (BOOL)shouldShowSlashForCurrentState
{
  return !-[CAMSpatialCaptureButton active](self, "active");
}

- (BOOL)active
{
  return self->_active;
}

@end
