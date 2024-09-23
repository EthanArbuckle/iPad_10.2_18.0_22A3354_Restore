@implementation CAMSharedLibraryImageWellIndicatorView

- (CAMSharedLibraryImageWellIndicatorView)initWithFrame:(CGRect)a3
{
  CAMSharedLibraryImageWellIndicatorView *v3;
  CAMSharedLibraryImageWellIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMSharedLibraryImageWellIndicatorView;
  v3 = -[CAMInstructionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAMSharedLibraryImageWellIndicatorView _updateText](v3, "_updateText");
  return v4;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  id v4;

  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    -[CAMSharedLibraryImageWellIndicatorView _updateText](self, "_updateText");
    -[CAMInstructionLabel delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "instructionLabelDidChangeIntrinsicContentSize:", self);

  }
}

- (void)_updateText
{
  __CFString *v3;
  id v4;

  if (CAMSharedLibraryModeIsOn(-[CAMSharedLibraryImageWellIndicatorView sharedLibraryMode](self, "sharedLibraryMode")))
    v3 = CFSTR("SHARED_LIBRARY_SHARED");
  else
    v3 = CFSTR("SHARED_LIBRARY_PERSONAL");
  CAMLocalizedFrameworkString(v3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMInstructionLabel setText:](self, "setText:", v4);

}

- (double)_defaultCornerRadius
{
  return 10.0;
}

- (double)_backgroundColorWhiteValue
{
  return 0.3;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

@end
