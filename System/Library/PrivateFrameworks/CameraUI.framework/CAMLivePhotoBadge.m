@implementation CAMLivePhotoBadge

- (CAMLivePhotoBadge)initWithFrame:(CGRect)a3
{
  CAMLivePhotoBadge *v3;
  CAMLivePhotoBadge *v4;
  CAMLivePhotoBadge *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMLivePhotoBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMLivePhotoBadge _updateTextAndColors](v3, "_updateTextAndColors");
    v5 = v4;
  }

  return v4;
}

- (void)setIrisMode:(int64_t)a3
{
  if (self->_irisMode != a3)
  {
    self->_irisMode = a3;
    -[CAMLivePhotoBadge _updateTextAndColors](self, "_updateTextAndColors");
  }
}

- (void)_updateTextAndColors
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = -[CAMLivePhotoBadge irisMode](self, "irisMode");
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3)
    {
      v6 = 0;
      v5 = 0;
      goto LABEL_7;
    }
    CAMLocalizedFrameworkString(CFSTR("LIVE_OFF"), CFSTR("Text shown to the user when Live Photo recording has been disabled"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CAMLocalizedFrameworkString(CFSTR("LIVE"), CFSTR("Text shown to the user when a Live Photo is being captured or has been enabled"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:
  -[CEKBadgeTextView _setText:](self, "_setText:", v6);
  -[CEKBadgeView _setFillColor:](self, "_setFillColor:", v5);

}

- (int64_t)irisMode
{
  return self->_irisMode;
}

@end
