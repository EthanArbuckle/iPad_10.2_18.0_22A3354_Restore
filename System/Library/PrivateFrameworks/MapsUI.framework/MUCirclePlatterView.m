@implementation MUCirclePlatterView

- (MUCirclePlatterView)initWithFrame:(CGRect)a3
{
  MUCirclePlatterView *v3;
  id v4;
  uint64_t v5;
  MKVibrantView *platterView;
  id v7;
  uint64_t v8;
  UIImageView *glyphImageView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MUCirclePlatterView;
  v3 = -[MUCirclePlatterView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CC19E8]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    platterView = v3->_platterView;
    v3->_platterView = (MKVibrantView *)v5;

    -[MKVibrantView setTranslatesAutoresizingMaskIntoConstraints:](v3->_platterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[MUCirclePlatterView bounds](v3, "bounds");
    v8 = objc_msgSend(v7, "initWithFrame:");
    glyphImageView = v3->_glyphImageView;
    v3->_glyphImageView = (UIImageView *)v8;

    -[UIImageView setContentMode:](v3->_glyphImageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 16.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->_glyphImageView, "setPreferredSymbolConfiguration:", v10);

    -[MUCirclePlatterView addSubview:](v3, "addSubview:", v3->_platterView);
    -[MUCirclePlatterView addSubview:](v3, "addSubview:", v3->_glyphImageView);
    -[MUCirclePlatterView infoCardThemeChanged](v3, "infoCardThemeChanged");
  }
  return v3;
}

+ (id)defaultPlatterView
{
  MUCirclePlatterView *v2;
  MUCirclePlatterView *v3;

  v2 = [MUCirclePlatterView alloc];
  v3 = -[MUCirclePlatterView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (MapKitIdiomIsMacCatalyst())
    -[MUCirclePlatterView setShowPlatterBackground:](v3, "setShowPlatterBackground:", 0);
  return v3;
}

- (void)setGlyphFont:(id)a3
{
  void *v5;
  UIFont *v6;

  v6 = (UIFont *)a3;
  if (self->_glyphFont != v6)
  {
    objc_storeStrong((id *)&self->_glyphFont, a3);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_glyphImageView, "setPreferredSymbolConfiguration:", v5);

  }
}

- (void)layoutSubviews
{
  CGFloat v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)MUCirclePlatterView;
  -[MUCirclePlatterView layoutSubviews](&v4, sel_layoutSubviews);
  -[MUCirclePlatterView bounds](self, "bounds");
  -[MKVibrantView setFrame:](self->_platterView, "setFrame:");
  -[MUCirclePlatterView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_glyphImageView, "setFrame:");
  -[MUCirclePlatterView bounds](self, "bounds");
  v3 = CGRectGetWidth(v5) * 0.5;
  -[MKVibrantView _setCornerRadius:](self->_platterView, "_setCornerRadius:", v3);
  -[MUCirclePlatterView _setCornerRadius:](self, "_setCornerRadius:", v3);
}

- (void)updateGlyph
{
  UIColor *v3;
  void *v4;
  UIColor *v5;
  UIColor *v6;

  v3 = self->_glyphColor;
  if (!v3)
  {
    -[MUCirclePlatterView mk_theme](self, "mk_theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();

    v3 = v5;
  }
  v6 = v3;
  -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v3);

}

- (void)setGlyph:(id)a3
{
  NSString *v4;
  NSString *glyph;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[NSString isEqual:](self->_glyph, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    glyph = self->_glyph;
    self->_glyph = v4;

    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", self->_glyph);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_glyphImageView, "setImage:", v6);

  }
}

- (void)setGlyphColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_glyphColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_glyphColor, a3);
    -[MUCirclePlatterView updateGlyph](self, "updateGlyph");
    v5 = v6;
  }

}

- (void)infoCardThemeChanged
{
  _BOOL4 highlighted;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUCirclePlatterView;
  -[MUCirclePlatterView infoCardThemeChanged](&v8, sel_infoCardThemeChanged);
  -[MUCirclePlatterView updateGlyph](self, "updateGlyph");
  highlighted = self->_highlighted;
  -[MUCirclePlatterView mk_theme](self, "mk_theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (highlighted)
    objc_msgSend(v4, "buttonHighlightedColor");
  else
    objc_msgSend(v4, "buttonNormalColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKVibrantView contentView](self->_platterView, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[MUCirclePlatterView infoCardThemeChanged](self, "infoCardThemeChanged");
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUCirclePlatterView;
  -[MUCirclePlatterView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[MUCirclePlatterView setHighlighted:](self, "setHighlighted:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUCirclePlatterView;
  -[MUCirclePlatterView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[MUCirclePlatterView setHighlighted:](self, "setHighlighted:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUCirclePlatterView;
  -[MUCirclePlatterView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[MUCirclePlatterView setHighlighted:](self, "setHighlighted:", 0);
}

- (void)setShowPlatterBackground:(BOOL)a3
{
  -[MKVibrantView setHidden:](self->_platterView, "setHidden:", !a3);
}

- (BOOL)showPlatterBackground
{
  return -[MKVibrantView isHidden](self->_platterView, "isHidden") ^ 1;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (NSString)glyph
{
  return self->_glyph;
}

- (UIFont)glyphFont
{
  return self->_glyphFont;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_glyphFont, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end
