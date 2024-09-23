@implementation CAMVideoStabilizationStatusIndicator

- (void)setVideoStabilizationMode:(int64_t)a3
{
  -[CAMVideoStabilizationStatusIndicator setVideoStabilizationMode:animated:](self, "setVideoStabilizationMode:animated:", a3, 0);
}

- (void)setVideoStabilizationMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_videoStabilizationMode != a3)
  {
    self->_videoStabilizationMode = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldFillOutlineForCurrentState
{
  return -[CAMVideoStabilizationStatusIndicator videoStabilizationMode](self, "videoStabilizationMode") != 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMVideoStabilizationStatusIndicator videoStabilizationMode](self, "videoStabilizationMode") == 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return -[CAMVideoStabilizationStatusIndicator videoStabilizationMode](self, "videoStabilizationMode") != 0;
}

- (id)imageNameForCurrentState
{
  return CFSTR("figure.run.motion");
}

- (int64_t)videoStabilizationMode
{
  return self->_videoStabilizationMode;
}

@end
