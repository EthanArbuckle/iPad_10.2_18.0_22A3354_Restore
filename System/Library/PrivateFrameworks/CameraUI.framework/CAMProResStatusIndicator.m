@implementation CAMProResStatusIndicator

- (void)setProResVideoMode:(int64_t)a3 colorSpace:(int64_t)a4 animated:(BOOL)a5
{
  if (self->_proResVideoMode != a3 || self->_colorSpace != a4)
  {
    self->_proResVideoMode = a3;
    self->_colorSpace = a4;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", a5);
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMProResStatusIndicator proResVideoMode](self, "proResVideoMode") == 0;
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
  v13.super_class = (Class)CAMProResStatusIndicator;
  -[CAMControlStatusIndicator intrinsicContentSize](&v13, sel_intrinsicContentSize);
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0DC3870];
  -[CAMProResStatusIndicator imageNameForCurrentState](self, "imageNameForCurrentState");
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
  v4.super_class = (Class)CAMProResStatusIndicator;
  -[CAMControlStatusIndicator setOrientation:animated:](&v4, sel_setOrientation_animated_, 1, 0);
}

- (id)imageNameForAXHUD
{
  void *v3;

  v3 = -[CAMProResStatusIndicator proResVideoMode](self, "proResVideoMode");
  if (v3 == (void *)1)
  {
    -[CAMProResStatusIndicator _imageNameForProResVideoModeOn](self, "_imageNameForProResVideoModeOn");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v3)
  {
    -[CAMProResStatusIndicator _imageNameForProResVideoModeOff](self, "_imageNameForProResVideoModeOff");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_imageNameForProResVideoModeOn
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[CAMProResStatusIndicator colorSpace](self, "colorSpace");
  v3 = CFSTR("CAMProResSDRIndicator");
  if (v2 == 2)
    v3 = CFSTR("CAMProResHDRIndicator");
  if (v2 == 3)
    return CFSTR("CAMProResLOGIndicator");
  else
    return (id)v3;
}

- (id)_imageNameForProResVideoModeOff
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[CAMProResStatusIndicator colorSpace](self, "colorSpace");
  v3 = CFSTR("CAMProResSDROff-AXHUD");
  if (v2 == 2)
    v3 = CFSTR("CAMProResHDROff-AXHUD");
  if (v2 == 3)
    return CFSTR("CAMProResLOGOff-AXHUD");
  else
    return (id)v3;
}

- (int64_t)proResVideoMode
{
  return self->_proResVideoMode;
}

- (int64_t)colorSpace
{
  return self->_colorSpace;
}

@end
