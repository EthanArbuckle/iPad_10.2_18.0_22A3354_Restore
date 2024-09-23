@implementation CAMRAWStatusIndicator

- (void)setRAWMode:(int64_t)a3
{
  -[CAMRAWStatusIndicator setRAWMode:animated:](self, "setRAWMode:animated:", a3, 0);
}

- (void)setRAWMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_rawMode != a3)
  {
    self->_rawMode = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMRAWStatusIndicator rawMode](self, "rawMode") == 0;
}

- (id)imageNameForCurrentState
{
  return CFSTR("CAMRAWIndicatorOn");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)CAMRAWStatusIndicator;
  -[CAMControlStatusIndicator intrinsicContentSize](&v13, sel_intrinsicContentSize);
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0DC3870];
  -[CAMRAWStatusIndicator imageNameForCurrentState](self, "imageNameForCurrentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CAMCameraUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "size");
  v10 = v9 + 20.0;

  v11 = v10;
  v12 = v4;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMRAWStatusIndicator;
  -[CAMControlStatusIndicator setOrientation:animated:](&v4, sel_setOrientation_animated_, 1, 0);
}

- (id)imageNameForAXHUD
{
  if (-[CAMRAWStatusIndicator rawMode](self, "rawMode") == 1)
    return CFSTR("CAMRAWIndicatorOn");
  else
    return CFSTR("CAMRAWButtonOff-AXHUD");
}

- (int64_t)rawMode
{
  return self->_rawMode;
}

@end
