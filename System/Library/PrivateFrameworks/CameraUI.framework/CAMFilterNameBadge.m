@implementation CAMFilterNameBadge

- (CAMFilterNameBadge)initWithFrame:(CGRect)a3
{
  CAMFilterNameBadge *v3;
  void *v4;
  CAMFilterNameBadge *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMFilterNameBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeView _setFillColor:](v3, "_setFillColor:", v4);

    -[CAMFilterNameBadge _updateText](v3, "_updateText");
    v5 = v3;
  }

  return v3;
}

- (void)setFilterType:(int64_t)a3
{
  if (self->_filterType != a3)
  {
    self->_filterType = a3;
    -[CAMFilterNameBadge _updateText](self, "_updateText");
  }
}

- (void)_updateText
{
  void *v3;
  id v4;

  +[CAMEffectFilterManager displayNameForType:](CAMEffectFilterManager, "displayNameForType:", self->_filterType);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cam_uppercaseStringWithPreferredLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKBadgeTextView _setText:](self, "_setText:", v3);

}

- (int64_t)filterType
{
  return self->_filterType;
}

@end
