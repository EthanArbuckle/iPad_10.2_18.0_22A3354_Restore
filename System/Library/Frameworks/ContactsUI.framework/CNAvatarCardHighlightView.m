@implementation CNAvatarCardHighlightView

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardHighlightView setHighlightLayer:](self, "setHighlightLayer:", v3);

  -[CNAvatarCardHighlightView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardHighlightView highlightLayer](self, "highlightLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSublayer:atIndex:", v5, 0);

  +[CNUIColorRepository navigationListCellBackgroundHighlightedColorRegular](CNUIColorRepository, "navigationListCellBackgroundHighlightedColorRegular");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardHighlightView setHighlightColor:](self, "setHighlightColor:", v6);

}

- (CNAvatarCardHighlightView)initWithFrame:(CGRect)a3
{
  CNAvatarCardHighlightView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCardHighlightView;
  v3 = -[CNAvatarCardHighlightView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CNAvatarCardHighlightView _commonInit](v3, "_commonInit");
  return v3;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNAvatarCardHighlightView;
  -[CNAvatarCardHighlightView awakeFromNib](&v3, sel_awakeFromNib);
  -[CNAvatarCardHighlightView _commonInit](self, "_commonInit");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNAvatarCardHighlightView;
  -[CNAvatarCardHighlightView layoutSubviews](&v13, sel_layoutSubviews);
  -[CNAvatarCardHighlightView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CNAvatarCardHighlightView highlightLayer](self, "highlightLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (UIColor)highlightColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  -[CNAvatarCardHighlightView highlightLayer](self, "highlightLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "backgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setHighlightColor:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  -[CNAvatarCardHighlightView highlightLayer](self, "highlightLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  float v4;
  double v5;
  id v6;

  if (a3)
    v4 = 1.0;
  else
    v4 = 0.0;
  -[CNAvatarCardHighlightView highlightLayer](self, "highlightLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = v4;
  objc_msgSend(v6, "setOpacity:", v5);

}

- (BOOL)highlighted
{
  void *v2;
  float v3;
  BOOL v4;

  -[CNAvatarCardHighlightView highlightLayer](self, "highlightLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3 > 0.0;

  return v4;
}

- (CALayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLayer, 0);
}

@end
