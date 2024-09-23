@implementation FIUIDividerView

- (FIUIDividerView)initWithFrame:(CGRect)a3
{
  char *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FIUIDividerView;
  v3 = -[FIUIDividerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD668]);
    if (FIUIDividerViewRoundedCornerImage_onceToken != -1)
      dispatch_once(&FIUIDividerViewRoundedCornerImage_onceToken, &__block_literal_global);
    v5 = (id)FIUIDividerViewRoundedCornerImage_image;
    v6 = objc_msgSend(v4, "initWithImage:", v5);
    v7 = (void *)*((_QWORD *)v3 + 52);
    *((_QWORD *)v3 + 52) = v6;

    v8 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
    *(_OWORD *)(v3 + 424) = *MEMORY[0x24BEBE158];
    *(_OWORD *)(v3 + 440) = v8;
    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 52));
  }
  return (FIUIDividerView *)v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 1.5;
  result.height = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[FIUIDividerView edgeInsets](self, "edgeInsets");
  v4 = v3;
  -[FIUIDividerView edgeInsets](self, "edgeInsets");
  v6 = v4 + v5;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[FIUIDividerView sizeThatFits:](self, "sizeThatFits:", v8 - v6, 1.79769313e308);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FIUIDividerView;
  -[FIUIDividerView layoutSubviews](&v12, sel_layoutSubviews);
  -[FIUIDividerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[FIUIDividerView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

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

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
