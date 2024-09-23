@implementation MKVibrantView

- (MKVibrantView)initWithFrame:(CGRect)a3
{
  return -[MKVibrantView initWithEffect:](self, "initWithEffect:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MKVibrantView)init
{
  return -[MKVibrantView initWithEffect:](self, "initWithEffect:", 0);
}

- (MKVibrantView)initWithCoder:(id)a3
{
  MKVibrantView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKVibrantView;
  v3 = -[MKVibrantView initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[MKVibrantView setStyle:](v3, "setStyle:", 6);
  }
  return v3;
}

- (MKVibrantView)initWithEffect:(id)a3
{
  MKVibrantView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKVibrantView;
  v3 = -[MKVibrantView initWithEffect:](&v7, sel_initWithEffect_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[MKVibrantView setStyle:](v3, "setStyle:", 6);
  }
  return v3;
}

- (void)setStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_style != a3)
  {
    self->_style = a3;
    v4 = (void *)MEMORY[0x1E0CEA398];
    -[MKVibrantView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectWithStyle:", 1100);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v7, self->_style);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantView setEffect:](self, "setEffect:", v6);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[MKVibrantView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKVibrantView superview](self, "superview");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      while (1)
      {
        v7 = (id)v4;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          break;
        objc_msgSend(v7, "superview");
        v5 = objc_claimAutoreleasedReturnValue();

        v4 = v5;
        if (!v5)
          return;
      }
      objc_msgSend(v7, "vibrancyGroupName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVibrantView _setGroupName:](self, "_setGroupName:", v6);

    }
  }
}

- (void)setContinuousCornerRadius:(double)a3
{
  -[MKVibrantView _setCornerRadius:continuous:maskedCorners:](self, "_setCornerRadius:continuous:maskedCorners:", 1, 15, a3);
}

- (int64_t)style
{
  return self->_style;
}

@end
