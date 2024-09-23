@implementation NUTextAndGlyphView

- (NUTextAndGlyphView)initWithFrame:(CGRect)a3
{
  NUTextAndGlyphView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *label;
  uint64_t v11;
  UIImageView *imageView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NUTextAndGlyphView;
  v3 = -[NUTextAndGlyphView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    label = v3->_label;
    v3->_label = (UILabel *)v9;

    -[NUTextAndGlyphView addSubview:](v3, "addSubview:", v3->_label);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v5, v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v11;

    -[NUTextAndGlyphView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Width;
  double v22;
  double v23;
  double MidY;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  CGFloat rect;
  CGFloat v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v33.receiver = self;
  v33.super_class = (Class)NUTextAndGlyphView;
  -[NUTextAndGlyphView layoutSubviews](&v33, sel_layoutSubviews);
  -[NUTextAndGlyphView label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[NUTextAndGlyphView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v34.origin.x = v5;
  rect = v7;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  Width = CGRectGetWidth(v34);
  v35.origin.x = v14;
  v32 = v16;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  v22 = CGRectGetWidth(v35);
  v23 = 0.0;
  if (-[NUTextAndGlyphView alignment](self, "alignment") != 1)
  {
    -[NUTextAndGlyphView bounds](self, "bounds");
    v23 = CGRectGetMidX(v36) + (Width + v22 + 4.0) * -0.5;
  }
  -[NUTextAndGlyphView bounds](self, "bounds");
  MidY = CGRectGetMidY(v37);
  v38.origin.x = v23;
  v38.origin.y = rect;
  v38.size.width = v9;
  v38.size.height = v11;
  v25 = MidY - CGRectGetHeight(v38) * 0.5;
  v39.origin.x = v23;
  v39.origin.y = v25;
  v39.size.width = v9;
  v39.size.height = v11;
  v26 = CGRectGetMaxX(v39) + 4.0;
  -[NUTextAndGlyphView bounds](self, "bounds");
  v27 = CGRectGetMidY(v40);
  v41.origin.x = v26;
  v41.origin.y = v32;
  v41.size.width = v18;
  v41.size.height = v20;
  v28 = v27 - CGRectGetHeight(v41) * 0.5;
  -[NUTextAndGlyphView label](self, "label");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v23, v25, v9, v11);

  -[NUTextAndGlyphView imageView](self, "imageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v26, v28, v18, v20);

}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)nu_crossFadeViewClearVisibleState
{
  -[NUTextAndGlyphView setTextAndGlyph:](self, "setTextAndGlyph:", 0);
}

- (void)nu_crossFadeViewSetValue:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v5;
  else
    v4 = 0;
  -[NUTextAndGlyphView setTextAndGlyph:](self, "setTextAndGlyph:", v4);

}

- (void)setTextAndGlyph:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v15, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUTextAndGlyphView label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributedText:", v5);
  }
  else
  {
    objc_msgSend(v15, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUTextAndGlyphView label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);
  }

  objc_msgSend(v15, "glyph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTextAndGlyphView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  objc_msgSend(v15, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6600], 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NUTextAndGlyphView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v11);

  if (!v10)
  -[NUTextAndGlyphView setAlignment:](self, "setAlignment:", objc_msgSend(v15, "alignment"));
  -[NUTextAndGlyphView label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeToFit");

  -[NUTextAndGlyphView imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");

  -[NUTextAndGlyphView setNeedsLayout](self, "setNeedsLayout");
}

- (NUTextAndGlyph)textAndGlyph
{
  return self->_textAndGlyph;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_textAndGlyph, 0);
}

@end
