@implementation SUUIIPhoneProductPageView

- (SUUIIPhoneProductPageView)initWithFrame:(CGRect)a3
{
  SUUIIPhoneProductPageView *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIIPhoneProductPageView;
  v3 = -[SUUIIPhoneProductPageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPhoneProductPageView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[SUUIIPhoneProductPageView addSubview:](v3, "addSubview:", v5);

  }
  return v3;
}

- (void)setView:(id)a3
{
  UIView *v5;
  UIView *view;
  UIView *v7;

  v5 = (UIView *)a3;
  view = self->_view;
  if (view != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](view, "removeFromSuperview");
    objc_storeStrong((id *)&self->_view, a3);
    -[SUUIIPhoneProductPageView addSubview:](self, "addSubview:", self->_view);
    -[SUUIIPhoneProductPageView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setBannerView:(id)a3
{
  UIView *v5;
  UIView *bannerView;
  UIView *v7;

  v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](bannerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bannerView, a3);
    -[SUUIIPhoneProductPageView addSubview:](self, "addSubview:", self->_bannerView);
    -[SUUIIPhoneProductPageView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)animateYPosition:(double)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (a3 != 0.0 && self->_view != 0)
  {
    -[SUUIIPhoneProductPageView bounds](self, "bounds");
    v7 = v6;
    v9 = v8 - a3;
    -[SUUIIPhoneProductPageView bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v19 = objc_alloc_init(MEMORY[0x24BDE5648]);
    objc_msgSend(v19, "setKeyPath:", CFSTR("position"));
    objc_msgSend(v19, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimingFunction:", v14);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v7, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFromValue:", v15);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setToValue:", v16);

    objc_msgSend(v19, "setDuration:", 0.200000003);
    -[UIView layer](self->_view, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

    -[UIView layer](self->_view, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:forKey:", v19, CFSTR("ANIMATION_KEY"));

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *view;
  UIView *bannerView;
  double bannerOffset;
  double v12;
  double v13;

  -[SUUIIPhoneProductPageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  view = self->_view;
  if (view)
    -[UIView setFrame:](view, "setFrame:", v3);
  bannerView = self->_bannerView;
  if (bannerView)
  {
    -[UIView frame](bannerView, "frame");
    bannerOffset = self->_bannerOffset;
    -[UIView sizeThatFits:](self->_bannerView, "sizeThatFits:", v6, v8);
    -[UIView setFrame:](self->_bannerView, "setFrame:", v4, bannerOffset, v12, v13);
    -[SUUIIPhoneProductPageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_bannerView);
  }
}

- (UIView)view
{
  return self->_view;
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (double)bannerOffset
{
  return self->_bannerOffset;
}

- (void)setBannerOffset:(double)a3
{
  self->_bannerOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
