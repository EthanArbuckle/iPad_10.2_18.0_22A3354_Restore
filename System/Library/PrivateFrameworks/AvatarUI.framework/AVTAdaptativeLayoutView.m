@implementation AVTAdaptativeLayoutView

- (AVTAdaptativeLayoutView)initWithFrame:(CGRect)a3 contentView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  AVTAdaptativeLayoutView *v11;
  AVTAdaptativeLayoutView *v12;
  _AVTAdaptiveFullSizeLayout *v13;
  AVTAdaptativeLayout *layout;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AVTAdaptativeLayoutView;
  v11 = -[AVTAdaptativeLayoutView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentView, a4);
    -[AVTAdaptativeLayoutView addSubview:](v12, "addSubview:", v12->_contentView);
    v13 = objc_alloc_init(_AVTAdaptiveFullSizeLayout);
    layout = v12->_layout;
    v12->_layout = (AVTAdaptativeLayout *)v13;

  }
  return v12;
}

- (void)setLayout:(id)a3
{
  AVTAdaptativeLayout *v5;
  AVTAdaptativeLayout *v6;

  v5 = (AVTAdaptativeLayout *)a3;
  if (self->_layout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layout, a3);
    -[AVTAdaptativeLayoutView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  id v21;
  CGRect v22;
  CGRect v23;

  -[AVTAdaptativeLayoutView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAdaptativeLayoutView bounds](self, "bounds");
  objc_msgSend(v3, "contentViewSizeForSize:", v4, v5);

  -[AVTAdaptativeLayoutView bounds](self, "bounds");
  UIRectGetCenter();
  -[AVTAdaptativeLayoutView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "scale");
  UIRectCenteredAboutPointScale();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[AVTAdaptativeLayoutView contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v23.origin.x = v17;
  v23.origin.y = v18;
  v23.size.width = v19;
  v23.size.height = v20;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  LOBYTE(v7) = CGRectEqualToRect(v22, v23);

  if ((v7 & 1) == 0)
  {
    -[AVTAdaptativeLayoutView contentView](self, "contentView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v9, v11, v13, v15);

  }
}

- (AVTAdaptativeLayout)layout
{
  return self->_layout;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
