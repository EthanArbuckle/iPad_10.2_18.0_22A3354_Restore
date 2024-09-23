@implementation CAMFlashStatusIndicator

- (void)setFlashMode:(int64_t)a3
{
  -[CAMFlashStatusIndicator setFlashMode:animated:](self, "setFlashMode:animated:", a3, 0);
}

- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_flashMode != a3)
  {
    self->_flashMode = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (void)setFlashActive:(BOOL)a3
{
  if (self->_flashActive != a3)
  {
    self->_flashActive = a3;
    -[CAMControlStatusIndicator updateImage](self, "updateImage");
  }
}

- (void)setFlashUnavailable:(BOOL)a3
{
  if (self->_flashUnavailable != a3)
  {
    self->_flashUnavailable = a3;
    -[CAMControlStatusIndicator updateImage](self, "updateImage");
  }
}

- (id)imageNameForCurrentState
{
  if (-[CAMFlashStatusIndicator isFlashUnavailable](self, "isFlashUnavailable"))
    return CFSTR("bolt.trianglebadge.exclamationmark.fill");
  else
    return CFSTR("bolt.fill");
}

- (CGVector)imageOffset
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGVector result;

  v3 = -[CAMFlashStatusIndicator isFlashUnavailable](self, "isFlashUnavailable");
  v4 = 0.0;
  if (v3)
    v4 = -CAMPixelWidthForView(self);
  v5 = v4;
  result.dy = v5;
  result.dx = v4;
  return result;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  int64_t v4;

  if (-[CAMFlashStatusIndicator isFlashUnavailable](self, "isFlashUnavailable"))
    return 0;
  v4 = -[CAMFlashStatusIndicator flashMode](self, "flashMode");
  if (v4 == 2)
    return -[CAMFlashStatusIndicator isFlashActive](self, "isFlashActive");
  else
    return v4 == 1;
}

- (id)imageSymbolColorConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (!-[CAMFlashStatusIndicator isFlashUnavailable](self, "isFlashUnavailable"))
    return 0;
  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithPaletteColors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldFillOutlineForCurrentState
{
  int64_t v3;

  v3 = -[CAMFlashStatusIndicator flashMode](self, "flashMode");
  if (v3)
    LOBYTE(v3) = v3 != 2 || -[CAMFlashStatusIndicator isFlashActive](self, "isFlashActive");
  return v3;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  if (-[CAMFlashStatusIndicator flashMode](self, "flashMode"))
    return 0;
  else
    return !-[CAMFlashStatusIndicator isFlashUnavailable](self, "isFlashUnavailable");
}

- (id)accessibilityIdentifier
{
  return CFSTR("StatusBarFlashButton");
}

- (id)imageNameForAXHUD
{
  __CFString *v3;

  if (-[CAMFlashStatusIndicator shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"))
  {
    v3 = CFSTR("bolt.slash.fill");
  }
  else
  {
    -[CAMFlashStatusIndicator imageNameForCurrentState](self, "imageNameForCurrentState");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (BOOL)isFlashActive
{
  return self->_flashActive;
}

- (BOOL)isFlashUnavailable
{
  return self->_flashUnavailable;
}

@end
