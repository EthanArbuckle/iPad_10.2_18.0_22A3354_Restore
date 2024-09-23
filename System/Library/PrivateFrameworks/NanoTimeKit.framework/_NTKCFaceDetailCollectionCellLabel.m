@implementation _NTKCFaceDetailCollectionCellLabel

- (_NTKCFaceDetailCollectionCellLabel)init
{
  _NTKCFaceDetailCollectionCellLabel *v2;
  uint64_t v3;
  CAShapeLayer *background;
  id v5;
  void *v6;
  uint64_t v7;
  UILabel *label;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_NTKCFaceDetailCollectionCellLabel;
  v2 = -[_NTKCFaceDetailCollectionCellLabel init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v3 = objc_claimAutoreleasedReturnValue();
    background = v2->_background;
    v2->_background = (CAShapeLayer *)v3;

    NTKCActiveColor();
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v2->_background, "setFillColor:", objc_msgSend(v5, "CGColor"));

    -[CAShapeLayer setHidden:](v2->_background, "setHidden:", 1);
    -[_NTKCFaceDetailCollectionCellLabel layer](v2, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v2->_background);

    v7 = objc_opt_new();
    label = v2->_label;
    v2->_label = (UILabel *)v7;

    -[UILabel setAllowsDefaultTighteningForTruncation:](v2->_label, "setAllowsDefaultTighteningForTruncation:", 1);
    -[_NTKCFaceDetailCollectionCellLabel _inactiveFont](v2, "_inactiveFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_label, "setFont:", v9);

    -[_NTKCFaceDetailCollectionCellLabel _inactiveTextColor](v2, "_inactiveTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](v2->_label, "setNumberOfLines:", 3);
    -[_NTKCFaceDetailCollectionCellLabel addSubview:](v2, "addSubview:", v2->_label);
  }
  return v2;
}

- (void)setUsesShortTextWidth:(BOOL)a3
{
  if (self->_usesShortTextWidth != a3)
  {
    self->_usesShortTextWidth = a3;
    -[_NTKCFaceDetailCollectionCellLabel sizeToFit](self, "sizeToFit");
    -[_NTKCFaceDetailCollectionCellLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UILabel text](self->_label, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC1288], "NTKHyphenationParagraphStyle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlignment:", 1);
      v8 = objc_alloc(MEMORY[0x1E0CB3498]);
      v11 = *MEMORY[0x1E0DC1178];
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v4, v9);

      -[UILabel setAttributedText:](self->_label, "setAttributedText:", v10);
    }
    else
    {
      -[UILabel setText:](self->_label, "setText:", 0);
    }
    -[_NTKCFaceDetailCollectionCellLabel sizeToFit](self, "sizeToFit");
    -[_NTKCFaceDetailCollectionCellLabel setNeedsLayout](self, "setNeedsLayout");
  }

}

- (double)firstLineBaseline
{
  double result;

  -[UILabel _firstLineBaseline](self->_label, "_firstLineBaseline");
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel text](self->_label, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[UILabel font](self->_label, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_NTKCFaceDetailCollectionCellLabel _numberOfLines](self, "_numberOfLines");
    -[_NTKCFaceDetailCollectionCellLabel _textBounds](self, "_textBounds");
    if (v9 <= 2)
    {
      v14 = dbl_1B755D938[v9];
      height = dbl_1B755D950[v9];
      CGRectGetWidth(*(CGRect *)&v10);
      UICeilToViewScale();
      width = v15 + v14;
    }
    if (width < height)
      width = height;
    -[UILabel setFont:](self->_label, "setFont:", v8);
    -[UILabel setFrame:](self->_label, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);

  }
  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  id v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v18.receiver = self;
  v18.super_class = (Class)_NTKCFaceDetailCollectionCellLabel;
  -[_NTKCFaceDetailCollectionCellLabel layoutSubviews](&v18, sel_layoutSubviews);
  -[_NTKCFaceDetailCollectionCellLabel bounds](self, "bounds");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v7 = CGRectGetHeight(v19) <= 19.0;
  v8 = x;
  v9 = y;
  v10 = width;
  v11 = height;
  if (!v7)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    *(CGRect *)&v8 = CGRectInset(v20, 6.0, 0.0);
  }
  -[UILabel setFrame:](self->_label, "setFrame:", v8, v9, v10, v11);
  -[CAShapeLayer setFrame:](self->_background, "setFrame:", x, y, width, height);
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "deviceCategory");

  v14 = 3.0;
  if (v13 != 1)
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v15 = CGRectGetHeight(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v16 = CGRectGetWidth(v22);
    if (v15 < v16)
      v16 = v15;
    v14 = v16 * 0.5;
  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v14);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_background, "setPath:", objc_msgSend(v17, "CGPath"));

}

- (void)setActive:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[_NTKCFaceDetailCollectionCellLabel _activeFont](self, "_activeFont");
    else
      -[_NTKCFaceDetailCollectionCellLabel _inactiveFont](self, "_inactiveFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_label, "setFont:", v4);

    if (self->_active)
      -[_NTKCFaceDetailCollectionCellLabel _activeTextColor](self, "_activeTextColor");
    else
      -[_NTKCFaceDetailCollectionCellLabel _inactiveTextColor](self, "_inactiveTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_label, "setTextColor:", v5);

    -[CAShapeLayer setHidden:](self->_background, "setHidden:", !self->_active);
  }
}

- (id)_activeFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1428]);
}

- (id)_inactiveFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1420]);
}

- (int64_t)_numberOfLines
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v7;
  CGRect v8;

  -[_NTKCFaceDetailCollectionCellLabel _textBounds](self, "_textBounds");
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  if (CGRectGetHeight(v7) > 38.0)
    return 2;
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectGetHeight(v8) > 19.0;
}

- (CGRect)_textBounds
{
  _BOOL4 usesShortTextWidth;
  uint64_t v4;
  double *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect result;

  usesShortTextWidth = self->_usesShortTextWidth;
  v4 = NTKCScreenStyle();
  v5 = (double *)((char *)&unk_1B755D8A0 + 8 * !usesShortTextWidth);
  if (v4 == 1)
    v5 = (double *)((char *)&unk_1B755D890 + 8 * !usesShortTextWidth);
  v6 = *v5;
  -[_NTKCFaceDetailCollectionCellLabel _activeFont](self, "_activeFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v7);

  -[UILabel attributedText](self->_label, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingRectWithSize:options:context:", 8, 0, v6, 1.79769313e308);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  if (CGRectGetWidth(v26) > v6)
  {
    -[UILabel attributedText](self->_label, "attributedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "boundingRectWithSize:options:context:", 9, 0, v6, 1.79769313e308);
    v10 = v18;
    v12 = v19;
    v14 = v20;
    v16 = v21;

  }
  v22 = v10;
  v23 = v12;
  v24 = v14;
  v25 = v16;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)is3Lines
{
  return -[_NTKCFaceDetailCollectionCellLabel _numberOfLines](self, "_numberOfLines") == 2;
}

- (BOOL)usesShortTextWidth
{
  return self->_usesShortTextWidth;
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
