@implementation CLKUILegibilityLabel

- (CLKUILegibilityLabel)initWithFrame:(CGRect)a3
{
  CLKUILegibilityLabel *v3;
  CLKUILegibilityLabel *v4;
  uint64_t v5;
  UIColor *sColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKUILegibilityLabel;
  v3 = -[CLKUILegibilityLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_sBlur = 5.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v5 = objc_claimAutoreleasedReturnValue();
    sColor = v4->_sColor;
    v4->_sColor = (UIColor *)v5;

  }
  return v4;
}

- (void)setShadowBlur:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_sBlur = a3;
    if (self->_legibilityEnabled)
      -[CLKUILegibilityLabel _updateShadow](self, "_updateShadow");
  }
}

- (double)shadowBlur
{
  return self->_sBlur;
}

- (void)setShadowColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((CLKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sColor, a3);
    if (self->_legibilityEnabled)
      -[CLKUILegibilityLabel _updateShadow](self, "_updateShadow");
  }

}

- (UIColor)shadowColor
{
  return self->_sColor;
}

- (void)setLegibilityEnabled:(BOOL)a3
{
  if (self->_legibilityEnabled != a3)
  {
    self->_legibilityEnabled = a3;
    -[CLKUILegibilityLabel _updateShadow](self, "_updateShadow");
  }
}

- (void)_updateShadow
{
  UIColor *sColor;
  double sBlur;
  objc_super v5;
  objc_super v6;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  if (self->_legibilityEnabled)
  {
    sColor = self->_sColor;
    v9.receiver = self;
    v9.super_class = (Class)CLKUILegibilityLabel;
    -[CLKUILegibilityLabel setShadowColor:](&v9, sel_setShadowColor_, sColor);
    sBlur = self->_sBlur;
    v8.receiver = self;
    v8.super_class = (Class)CLKUILegibilityLabel;
    -[CLKUILegibilityLabel setShadowBlur:](&v8, sel_setShadowBlur_, sBlur);
    v7.receiver = self;
    v7.super_class = (Class)CLKUILegibilityLabel;
    -[CLKUILegibilityLabel setShadowOffset:](&v7, sel_setShadowOffset_, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CLKUILegibilityLabel;
    -[CLKUILegibilityLabel setShadowColor:](&v6, sel_setShadowColor_, 0);
    v5.receiver = self;
    v5.super_class = (Class)CLKUILegibilityLabel;
    -[CLKUILegibilityLabel setShadowBlur:](&v5, sel_setShadowBlur_, 0.0);
  }
  -[CLKUILegibilityLabel _invalidateLabelSize](self, "_invalidateLabelSize");
}

- (UIEdgeInsets)_contentInsetsFromFonts
{
  double v3;
  double v4;
  double v5;
  double v6;
  double sBlur;
  objc_super v8;
  UIEdgeInsets result;

  v8.receiver = self;
  v8.super_class = (Class)CLKUILegibilityLabel;
  -[CLKUILegibilityLabel _contentInsetsFromFonts](&v8, sel__contentInsetsFromFonts);
  if (self->_legibilityEnabled)
  {
    sBlur = self->_sBlur;
    v5 = v5 - sBlur;
    v3 = v3 - sBlur;
    v4 = v4 - sBlur;
    v6 = v6 - sBlur;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)legibilityEnabled
{
  return self->_legibilityEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sColor, 0);
}

@end
