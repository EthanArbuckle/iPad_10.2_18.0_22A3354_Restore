@implementation CAMAutoMacroButton

- (CAMAutoMacroButton)initWithFrame:(CGRect)a3
{
  CAMAutoMacroButton *v3;
  CAMAutoMacroButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMAutoMacroButton;
  v3 = -[CAMCircleButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_active = 1;
    -[CAMCircleButton updateTintColors](v3, "updateTintColors");
  }
  return v4;
}

- (id)imageNameForCurrentState
{
  return CFSTR("camera.macro");
}

- (void)setActive:(BOOL)a3
{
  -[CAMAutoMacroButton setActive:animated:](self, "setActive:animated:", a3, 0);
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
  return !-[CAMAutoMacroButton active](self, "active");
}

- (BOOL)active
{
  return self->_active;
}

@end
