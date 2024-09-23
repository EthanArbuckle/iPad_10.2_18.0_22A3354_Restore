@implementation AVTAttributeSectionSeparator

+ (id)reuseIdentifier
{
  return CFSTR("AVTAttributeSectionSeparator");
}

- (AVTAttributeSectionSeparator)initWithFrame:(CGRect)a3
{
  AVTAttributeSectionSeparator *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTAttributeSectionSeparator;
  v3 = -[AVTAttributeSectionSeparator initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[AVTAttributeSectionSeparator bounds](v3, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    -[AVTAttributeSectionSeparator setSeparatorView:](v3, "setSeparatorView:", v5);

    +[AVTUIColorRepository separatorColor](AVTUIColorRepository, "separatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAttributeSectionSeparator separatorView](v3, "separatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[AVTAttributeSectionSeparator separatorView](v3, "separatorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAttributeSectionSeparator addSubview:](v3, "addSubview:", v8);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAttributeSectionSeparator setBackgroundColor:](v3, "setBackgroundColor:", v9);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVTAttributeSectionSeparator;
  -[AVTAttributeSectionSeparator layoutSubviews](&v14, sel_layoutSubviews);
  -[AVTAttributeSectionSeparator edgeInsets](self, "edgeInsets");
  v4 = v3;
  -[AVTAttributeSectionSeparator bounds](self, "bounds");
  v6 = v5;
  -[AVTAttributeSectionSeparator edgeInsets](self, "edgeInsets");
  v8 = v7;
  -[AVTAttributeSectionSeparator edgeInsets](self, "edgeInsets");
  v10 = v6 - (v8 + v9);
  -[AVTAttributeSectionSeparator bounds](self, "bounds");
  v12 = v11;
  -[AVTAttributeSectionSeparator separatorView](self, "separatorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, 0.0, v10, v12);

}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    -[AVTAttributeSectionSeparator setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForReuse
{
  __int128 v3;
  objc_super v4;

  v3 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  *(_OWORD *)&self->_edgeInsets.top = *MEMORY[0x1E0CEB4B0];
  *(_OWORD *)&self->_edgeInsets.bottom = v3;
  -[AVTAttributeSectionSeparator setNeedsLayout](self, "setNeedsLayout");
  v4.receiver = self;
  v4.super_class = (Class)AVTAttributeSectionSeparator;
  -[AVTAttributeSectionSeparator prepareForReuse](&v4, sel_prepareForReuse);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
