@implementation CAMVideoPausedBadge

- (CAMVideoPausedBadge)initWithFrame:(CGRect)a3
{
  CAMVideoPausedBadge *v3;
  void *v4;
  void *v5;
  void *v6;
  CAMVideoPausedBadge *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMVideoPausedBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeView _setFillColor:](v3, "_setFillColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeView _setContentColor:](v3, "_setContentColor:", v5);

    CAMLocalizedFrameworkString(CFSTR("CAM_VIDEO_PAUSED_BADGE"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView _setText:](v3, "_setText:", v6);

    v7 = v3;
  }

  return v3;
}

@end
