@implementation CAMHDRBadge

- (CAMHDRBadge)initWithFrame:(CGRect)a3
{
  CAMHDRBadge *v3;
  void *v4;
  CAMHDRBadge *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMHDRBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CAMLocalizedFrameworkString(CFSTR("HDR_BADGE"), &stru_1EA3325A0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView _setText:](v3, "_setText:", v4);
    v5 = v3;

  }
  return v3;
}

@end
