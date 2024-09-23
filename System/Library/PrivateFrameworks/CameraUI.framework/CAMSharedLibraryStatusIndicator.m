@implementation CAMSharedLibraryStatusIndicator

- (void)setSharedLibraryMode:(int64_t)a3
{
  -[CAMSharedLibraryStatusIndicator setSharedLibraryMode:animated:](self, "setSharedLibraryMode:animated:", a3, 0);
}

- (void)setSharedLibraryMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (BOOL)shouldShowSlashForCurrentState
{
  return CAMSharedLibraryModeIsOn(-[CAMSharedLibraryStatusIndicator sharedLibraryMode](self, "sharedLibraryMode")) ^ 1;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return CAMSharedLibraryModeIsOn(-[CAMSharedLibraryStatusIndicator sharedLibraryMode](self, "sharedLibraryMode"));
}

- (BOOL)shouldFillOutlineForCurrentState
{
  return CAMSharedLibraryModeIsOn(-[CAMSharedLibraryStatusIndicator sharedLibraryMode](self, "sharedLibraryMode"));
}

- (id)imageNameForCurrentState
{
  return CFSTR("person.2.fill");
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (unint64_t)customPointSizeForImageSymbol
{
  return 13;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

@end
