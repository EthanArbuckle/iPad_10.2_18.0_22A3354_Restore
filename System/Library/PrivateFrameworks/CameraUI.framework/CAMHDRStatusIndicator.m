@implementation CAMHDRStatusIndicator

- (void)setHDRMode:(int64_t)a3
{
  -[CAMHDRStatusIndicator setHDRMode:animated:](self, "setHDRMode:animated:", a3, 0);
}

- (void)setHDRMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_hdrMode != a3)
  {
    self->_hdrMode = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (void)setAllowAutoHDR:(BOOL)a3
{
  if (self->_autoHDRAllowed != a3)
  {
    self->_autoHDRAllowed = a3;
    -[CAMControlStatusIndicator updateImage](self, "updateImage");
  }
}

- (id)imageNameForCurrentState
{
  return CFSTR("CAMHDRIndicatorOn");
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
  v13.super_class = (Class)CAMHDRStatusIndicator;
  -[CAMControlStatusIndicator intrinsicContentSize](&v13, sel_intrinsicContentSize);
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0DC3870];
  -[CAMHDRStatusIndicator imageNameForCurrentState](self, "imageNameForCurrentState");
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

- (BOOL)shouldUseActiveTintForCurrentState
{
  return -[CAMHDRStatusIndicator hdrMode](self, "hdrMode") == 1
      && -[CAMHDRStatusIndicator isAutoHDRAllowed](self, "isAutoHDRAllowed");
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMHDRStatusIndicator;
  -[CAMControlStatusIndicator setOrientation:animated:](&v4, sel_setOrientation_animated_, 1, 0);
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMHDRStatusIndicator hdrMode](self, "hdrMode") == 0;
}

- (id)imageNameForAXHUD
{
  if ((unint64_t)(-[CAMHDRStatusIndicator hdrMode](self, "hdrMode") - 1) >= 2)
    return CFSTR("CAMHDRButtonOff-AXHUD");
  else
    return CFSTR("CAMHDRButton-AXHUD");
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

- (BOOL)isAutoHDRAllowed
{
  return self->_autoHDRAllowed;
}

- (void)setAutoHDRAllowed:(BOOL)a3
{
  self->_autoHDRAllowed = a3;
}

@end
