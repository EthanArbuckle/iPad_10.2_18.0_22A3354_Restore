@implementation CAMSmartStyleNameBadge

- (CAMSmartStyleNameBadge)initWithFrame:(CGRect)a3
{
  CAMSmartStyleNameBadge *v3;
  void *v4;
  void *v5;
  CAMSmartStyleNameBadge *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMSmartStyleNameBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeView _setFillColor:](v3, "_setFillColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeView _setContentColor:](v3, "_setContentColor:", v5);

    -[CAMSmartStyleNameBadge _updateText](v3, "_updateText");
    v6 = v3;
  }

  return v3;
}

- (void)setSmartStyle:(id)a3
{
  CEKSmartStyle *v5;
  CEKSmartStyle *smartStyle;
  char v7;
  CEKSmartStyle *v8;

  v5 = (CEKSmartStyle *)a3;
  smartStyle = self->_smartStyle;
  if (smartStyle != v5)
  {
    v8 = v5;
    v7 = -[CEKSmartStyle isEqualToSmartStyle:](smartStyle, "isEqualToSmartStyle:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_smartStyle, a3);
      -[CAMSmartStyleNameBadge _updateText](self, "_updateText");
      v5 = v8;
    }
  }

}

- (void)_updateText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CAMSmartStyleNameBadge smartStyle](self, "smartStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presetDisplayName");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  CAMPreferredLocale();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseStringWithLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CEKBadgeTextView _setText:](self, "_setText:", v5);
}

- (CEKSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartStyle, 0);
}

@end
