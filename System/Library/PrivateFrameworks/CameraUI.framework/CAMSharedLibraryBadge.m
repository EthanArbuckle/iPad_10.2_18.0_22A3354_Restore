@implementation CAMSharedLibraryBadge

- (CAMSharedLibraryBadge)initWithFrame:(CGRect)a3
{
  CAMSharedLibraryBadge *v3;
  CAMSharedLibraryBadge *v4;
  CAMSharedLibraryBadge *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMSharedLibraryBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMSharedLibraryBadge _updateTextAndColors](v3, "_updateTextAndColors");
    v5 = v4;
  }

  return v4;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    -[CAMSharedLibraryBadge _updateTextAndColors](self, "_updateTextAndColors");
  }
}

- (void)_updateTextAndColors
{
  __CFString *v3;
  void *v4;
  id v5;

  if (CAMSharedLibraryModeIsOn(-[CAMSharedLibraryBadge sharedLibraryMode](self, "sharedLibraryMode")))
    v3 = CFSTR("SHARED_LIBRARY_CAPS");
  else
    v3 = CFSTR("PERSONAL_LIBRARY_CAPS");
  CAMLocalizedFrameworkString(v3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((CAMSharedLibraryModeIsOn(-[CAMSharedLibraryBadge sharedLibraryMode](self, "sharedLibraryMode")) & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setText:](self, "_setText:", v5);
  -[CEKBadgeView _setFillColor:](self, "_setFillColor:", v4);
  -[CAMSharedLibraryBadge setNeedsLayout](self, "setNeedsLayout");

}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

@end
