@implementation CAMVideoStabilizationBadge

- (CAMVideoStabilizationBadge)initWithFrame:(CGRect)a3
{
  CAMVideoStabilizationBadge *v3;
  CAMVideoStabilizationBadge *v4;
  CAMVideoStabilizationBadge *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMVideoStabilizationBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMVideoStabilizationBadge _updateTextAndColors](v3, "_updateTextAndColors");
    v5 = v4;
  }

  return v4;
}

- (void)setVideoStabilizationMode:(int64_t)a3
{
  if (self->_videoStabilizationMode != a3)
  {
    self->_videoStabilizationMode = a3;
    -[CAMVideoStabilizationBadge _updateTextAndColors](self, "_updateTextAndColors");
  }
}

- (void)_updateTextAndColors
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = -[CAMVideoStabilizationBadge videoStabilizationMode](self, "videoStabilizationMode");
  if (v3 == 1)
  {
    CAMLocalizedFrameworkString(CFSTR("VIDEO_STABILIZATION_BADGE_ULTRA"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
    {
      v6 = 0;
      v5 = 0;
      goto LABEL_7;
    }
    CAMLocalizedFrameworkString(CFSTR("VIDEO_STABILIZATION_BADGE_OFF"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:
  -[CEKBadgeTextView _setText:](self, "_setText:", v6);
  -[CEKBadgeView _setFillColor:](self, "_setFillColor:", v5);
  -[CAMVideoStabilizationBadge setNeedsLayout](self, "setNeedsLayout");

}

- (int64_t)videoStabilizationMode
{
  return self->_videoStabilizationMode;
}

@end
